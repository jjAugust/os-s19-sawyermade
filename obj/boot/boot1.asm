
obj/boot/boot1.elf:     file format elf32-i386


Disassembly of section .text:

00007e00 <start>:
     *  - Clear the interrupts flag, disabling the interrupts.
     *  - Clear the direction flag, to configure auto-increment mode.
     *
     *     Hint: see the cli/sti and cld/std instructions.
     */
    cli 
    7e00:	fa                   	cli    
    cld 
    7e01:	fc                   	cld    

00007e02 <seta20.1>:
    /* enable A20
     * This is done because of a quirk in the x86 architecture.
     * See http://wiki.osdev.org/A20 for more information.
     */
seta20.1:
    inb    $0x64, %al
    7e02:	e4 64                	in     $0x64,%al
    testb    $0x2, %al
    7e04:	a8 02                	test   $0x2,%al
    jnz    seta20.1
    7e06:	75 fa                	jne    7e02 <seta20.1>
    movb    $0xd1, %al
    7e08:	b0 d1                	mov    $0xd1,%al
    outb    %al, $0x64
    7e0a:	e6 64                	out    %al,$0x64

00007e0c <seta20.2>:
seta20.2:
    inb    $0x64, %al
    7e0c:	e4 64                	in     $0x64,%al
    testb    $0x2, %al
    7e0e:	a8 02                	test   $0x2,%al
    jnz    seta20.2
    7e10:	75 fa                	jne    7e0c <seta20.2>
    movb    $0xdf, %al
    7e12:	b0 df                	mov    $0xdf,%al
    outb    %al, $0x60
    7e14:	e6 60                	out    %al,$0x60
     *
     *     Hint 1: Use the call instruction to use the putstr subroutine below.
     *  Hint 2: We will define a startup message below.
     *  Hint 3: putstr needs a reference to the string loaded into the %si register.
     */
    movw    $STARTUP_MSG, %si
    7e16:	be a9 7e e8 7f       	mov    $0x7fe87ea9,%esi
    call    putstr
    7e1b:	00               	add    %ah,0x31(%esi)

00007e1c <e820>:
     * memory is usable, reserved, or possibly bad.
     *
     * For more information: http://wiki.osdev.org/Detecting_Memory_(x86)
     */
e820:
    xorl    %ebx, %ebx        # ebx must be 0 when first calling e820
    7e1c:	66 31 db             	xor    %bx,%bx
    movl    $SMAP_SIG, %edx   # edx must be 'SMAP' when calling e820
    7e1f:	66 ba 50 41          	mov    $0x4150,%dx
    7e23:	4d                   	dec    %ebp
    7e24:	53                   	push   %ebx
    movw    $(smap+4), %di    # set the address of the output buffer
    7e25:	bf 3c 7f         	mov    $0xb9667f3c,%edi

00007e28 <e820.1>:
e820.1:
    movl    $20, %ecx         # set the size of the output buffer
    7e28:	66 b9 14 00          	mov    $0x14,%cx
    7e2c:	00 00                	add    %al,(%eax)
    movl    $0xe820, %eax     # set the BIOS service code
    7e2e:	66 b8 20 e8          	mov    $0xe820,%ax
    7e32:	00 00                	add    %al,(%eax)
    int    $0x15              # call BIOS service e820h
    7e34:	cd 15                	int    $0x15

00007e36 <e820.2>:
e820.2:
    jc    e820.fail           # error during e820h
    7e36:	72 24                	jb     7e5c <e820.fail>
    cmpl    $SMAP_SIG, %eax   # check eax, which should be 'SMAP'
    7e38:	66 3d 50 41          	cmp    $0x4150,%ax
    7e3c:	4d                   	dec    %ebp
    7e3d:	53                   	push   %ebx
    jne    e820.fail
    7e3e:	75 1c                	jne    7e5c <e820.fail>

00007e40 <e820.3>:
e820.3:
    movl    $20, -4(%di)
    7e40:	66 c7 45 fc 14 00    	movw   $0x14,-0x4(%ebp)
    7e46:	00 00                	add    %al,(%eax)
    addw    $24, %di
    7e48:	83 c7 18             	add    $0x18,%edi
    cmpl    $0x0, %ebx        # whether it's the last descriptor
    7e4b:	66 83 fb 00          	cmp    $0x0,%bx
    je    e820.4
    7e4f:	74 02                	je     7e53 <e820.4>
    jmp    e820.1
    7e51:	eb d5                	jmp    7e28 <e820.1>

00007e53 <e820.4>:
e820.4:                       # zero the descriptor after the last one
    xorb    %al, %al
    7e53:	30 c0                	xor    %al,%al
    movw    $20, %cx
    7e55:	b9 14 00 f3 aa       	mov    $0xaaf30014,%ecx
    rep    stosb
    jmp    switch_prot
    7e5a:	eb 09                	jmp    7e65 <switch_prot>

00007e5c <e820.fail>:
e820.fail:
    movw    $E820_FAIL_MSG, %si
    7e5c:	be bb 7e e8 39       	mov    $0x39e87ebb,%esi
    call    putstr
    7e61:	00 eb                	add    %ch,%bl
    jmp    spin16
    7e63:	00                 	add    %dh,%ah

00007e64 <spin16>:

spin16:
    hlt
    7e64:	f4                   	hlt    

00007e65 <switch_prot>:
     *
     *  Hint 1: there is a special instruction to load the GDT (GDT is defined at the end of this file).
     *  Hint 2: Use the GDT descriptor (a wrapper for the GDT, also defined at the end of this file).
     *  Hint 3: If you need to learn about a specific instruction in x86 see chapter 17 in the 80386 Programmer's Manual.
     */
    lgdt gdtdesc
    7e65:	0f 01 16             	lgdtl  (%esi)
    7e68:	32 7f 0f             	xor    0xf(%edi),%bh
     *      - The GDT defines what segments are used and their sizes.
     *      - Below we have effectively disabled segmentation by forcing all segments to span the full memory space 0-4GB, this is called Flat memory layout.
     *      - The definition of the GDT is below.
     *      - Even though we aren't jumping anywhere significant, the ljmp excutes the CPU state switch.
     */
    mov %cr0, %eax
    7e6b:	20 c0                	and    %al,%al
    orb $0x01, %al
    7e6d:	0c 01                	or     $0x1,%al
    mov %eax, %cr0
    7e6f:	0f 22 c0             	mov    %eax,%cr0
    ljmp $PROT_MODE_CSEG, $protcseg
    7e72:	ea 77 7e 08 00   	ljmp   $0xb866,$0x87e77

00007e77 <protcseg>:
     *  - Set the %ds, %es, %fs, %gs, and %ss segmentation registers to the PROT_MODE_DSEG selector.
     *
     * Hint 1: PROT_MODE_DSEG should be an immediate value.
     * Hint 2: These segmentation regsiters are not general purpose registers. You must move from a temporary register.
     */
    mov $PROT_MODE_DSEG, %ax
    7e77:	66 b8 10 00          	mov    $0x10,%ax
    movw %ax, %ds
    7e7b:	8e d8                	mov    %eax,%ds
    movw %ax, %es
    7e7d:	8e c0                	mov    %eax,%es
    movw %ax, %fs
    7e7f:	8e e0                	mov    %eax,%fs
    movw %ax, %gs
    7e81:	8e e8                	mov    %eax,%gs
    movw %ax, %ss
    7e83:	8e d0                	mov    %eax,%ss
     * Hint 1: the function signature is boot1main(uint32_t dev, mbr_t * mbr, bios_smap_t *smap)
     * Hint 2: the arguments should be pushed to the stack, IN REVERSE ORDER.
     * Hint 3: Remember that the device id (dev) is stored at BOOT0-4. Also remember that we want to pass the device ID itself NOT its address.
     * Hint 4: After pushing all the arguments, call boot1main
     */
    mov BOOTIDADDR, %eax
    7e85:	a1 fc 7b 00 00       	mov    0x7bfc,%eax
    push $smap
    7e8a:	68 38 7f 00 00       	push   $0x7f38
    push $BOOT0ADDR
    7e8f:	68 00 7c 00 00       	push   $0x7c00
    push %eax
    7e94:	50                   	push   %eax
    call boot1main
    7e95:	e8 46 10 00 00       	call   8ee0 <boot1main>

00007e9a <spin>:

    /* boot1main should never return! */
spin:
    hlt
    7e9a:	f4                   	hlt    

00007e9b <putstr>:
/*
 * print a string (@ %si) to the screen
 */
    .globl putstr
putstr:
    pusha
    7e9b:	60                   	pusha  
    movb    $0xe, %ah
    7e9c:	b4 0e                	mov    $0xe,%ah

00007e9e <putstr.1>:
putstr.1:
    lodsb
    7e9e:	ac                   	lods   %ds:(%esi),%al
    cmp    $0, %al
    7e9f:	3c 00                	cmp    $0x0,%al
    je    putstr.2
    7ea1:	74 04                	je     7ea7 <putstr.2>
    int    $0x10
    7ea3:	cd 10                	int    $0x10
    jmp    putstr.1
    7ea5:	eb f7                	jmp    7e9e <putstr.1>

00007ea7 <putstr.2>:
putstr.2:
    popa
    7ea7:	61                   	popa   
    ret
    7ea8:	c3                   	ret    

00007ea9 <STARTUP_MSG>:
    7ea9:	53                   	push   %ebx
    7eaa:	74 61                	je     7f0d <gdt+0x3>
    7eac:	72 74                	jb     7f22 <gdt+0x18>
    7eae:	20 62 6f             	and    %ah,0x6f(%edx)
    7eb1:	6f                   	outsl  %ds:(%esi),(%dx)
    7eb2:	74 31                	je     7ee5 <NO_BOOTABLE_MSG+0x8>
    7eb4:	20 2e                	and    %ch,(%esi)
    7eb6:	2e 2e 0d 0a 00   	cs cs or $0x7265000a,%eax

00007ebb <E820_FAIL_MSG>:
    7ebb:	65 72 72             	gs jb  7f30 <gdt+0x26>
    7ebe:	6f                   	outsl  %ds:(%esi),(%dx)
    7ebf:	72 20                	jb     7ee1 <NO_BOOTABLE_MSG+0x4>
    7ec1:	77 68                	ja     7f2b <gdt+0x21>
    7ec3:	65 6e                	outsb  %gs:(%esi),(%dx)
    7ec5:	20 64 65 74          	and    %ah,0x74(%ebp,%eiz,2)
    7ec9:	65 63 74 69 6e       	arpl   %si,%gs:0x6e(%ecx,%ebp,2)
    7ece:	67 20 6d 65          	and    %ch,0x65(%di)
    7ed2:	6d                   	insl   (%dx),%es:(%edi)
    7ed3:	6f                   	outsl  %ds:(%esi),(%dx)
    7ed4:	72 79                	jb     7f4f <smap+0x17>
    7ed6:	20 6d 61             	and    %ch,0x61(%ebp)
    7ed9:	70 0d                	jo     7ee8 <NO_BOOTABLE_MSG+0xb>
    7edb:	0a 00                	or     (%eax),%al

00007edd <NO_BOOTABLE_MSG>:
    7edd:	4e                   	dec    %esi
    7ede:	6f                   	outsl  %ds:(%esi),(%dx)
    7edf:	20 62 6f             	and    %ah,0x6f(%edx)
    7ee2:	6f                   	outsl  %ds:(%esi),(%dx)
    7ee3:	74 61                	je     7f46 <smap+0xe>
    7ee5:	62 6c 65 20          	bound  %ebp,0x20(%ebp,%eiz,2)
    7ee9:	70 61                	jo     7f4c <smap+0x14>
    7eeb:	72 74                	jb     7f61 <smap+0x29>
    7eed:	69 74 69 6f 6e 2e 0d 	imul   $0xa0d2e6e,0x6f(%ecx,%ebp,2),%esi
    7ef4:	0a 
    7ef5:	00 66 90             	add    %ah,-0x70(%esi)

00007ef8 <DEBUB_SMAP>:
    7ef8:	53                   	push   %ebx
    7ef9:	74 61                	je     7f5c <smap+0x24>
    7efb:	72 74                	jb     7f71 <smap+0x39>
    7efd:	20 62 6f             	and    %ah,0x6f(%edx)
    7f00:	6f                   	outsl  %ds:(%esi),(%dx)
    7f01:	74 31                	je     7f34 <gdtdesc+0x2>
    7f03:	20 2e                	and    %ch,(%esi)
    7f05:	2e 2e 0d 0a 00   	cs cs or $0xa,%eax

00007f0a <gdt>:
    7f0a:	00 00                	add    %al,(%eax)
    7f0c:	00 00                	add    %al,(%eax)
    7f0e:	00 00                	add    %al,(%eax)
    7f10:	00 00                	add    %al,(%eax)
    7f12:	ff                   	(bad)  
    7f13:	ff 00                	incl   (%eax)
    7f15:	00 00                	add    %al,(%eax)
    7f17:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
    7f1e:	00 92 cf 00 ff ff    	add    %dl,-0xff31(%edx)
    7f24:	00 00                	add    %al,(%eax)
    7f26:	00 9e 00 00 ff ff    	add    %bl,-0x10000(%esi)
    7f2c:	00 00                	add    %al,(%eax)
    7f2e:	00 92 00 00      	add    %dl,0x270000(%edx)

00007f32 <gdtdesc>:
    7f32:	27                   	daa    
    7f33:	00 0a                	add    %cl,(%edx)
    7f35:	7f 00                	jg     7f37 <gdtdesc+0x5>
    7f37:	00                 	add    %al,(%eax)

00007f38 <smap>:
    7f38:	00 00                	add    %al,(%eax)
    7f3a:	00 00                	add    %al,(%eax)
    7f3c:	00 00                	add    %al,(%eax)
    7f3e:	00 00                	add    %al,(%eax)
    7f40:	00 00                	add    %al,(%eax)
    7f42:	00 00                	add    %al,(%eax)
    7f44:	00 00                	add    %al,(%eax)
    7f46:	00 00                	add    %al,(%eax)
    7f48:	00 00                	add    %al,(%eax)
    7f4a:	00 00                	add    %al,(%eax)
    7f4c:	00 00                	add    %al,(%eax)
    7f4e:	00 00                	add    %al,(%eax)
    7f50:	00 00                	add    %al,(%eax)
    7f52:	00 00                	add    %al,(%eax)
    7f54:	00 00                	add    %al,(%eax)
    7f56:	00 00                	add    %al,(%eax)
    7f58:	00 00                	add    %al,(%eax)
    7f5a:	00 00                	add    %al,(%eax)
    7f5c:	00 00                	add    %al,(%eax)
    7f5e:	00 00                	add    %al,(%eax)
    7f60:	00 00                	add    %al,(%eax)
    7f62:	00 00                	add    %al,(%eax)
    7f64:	00 00                	add    %al,(%eax)
    7f66:	00 00                	add    %al,(%eax)
    7f68:	00 00                	add    %al,(%eax)
    7f6a:	00 00                	add    %al,(%eax)
    7f6c:	00 00                	add    %al,(%eax)
    7f6e:	00 00                	add    %al,(%eax)
    7f70:	00 00                	add    %al,(%eax)
    7f72:	00 00                	add    %al,(%eax)
    7f74:	00 00                	add    %al,(%eax)
    7f76:	00 00                	add    %al,(%eax)
    7f78:	00 00                	add    %al,(%eax)
    7f7a:	00 00                	add    %al,(%eax)
    7f7c:	00 00                	add    %al,(%eax)
    7f7e:	00 00                	add    %al,(%eax)
    7f80:	00 00                	add    %al,(%eax)
    7f82:	00 00                	add    %al,(%eax)
    7f84:	00 00                	add    %al,(%eax)
    7f86:	00 00                	add    %al,(%eax)
    7f88:	00 00                	add    %al,(%eax)
    7f8a:	00 00                	add    %al,(%eax)
    7f8c:	00 00                	add    %al,(%eax)
    7f8e:	00 00                	add    %al,(%eax)
    7f90:	00 00                	add    %al,(%eax)
    7f92:	00 00                	add    %al,(%eax)
    7f94:	00 00                	add    %al,(%eax)
    7f96:	00 00                	add    %al,(%eax)
    7f98:	00 00                	add    %al,(%eax)
    7f9a:	00 00                	add    %al,(%eax)
    7f9c:	00 00                	add    %al,(%eax)
    7f9e:	00 00                	add    %al,(%eax)
    7fa0:	00 00                	add    %al,(%eax)
    7fa2:	00 00                	add    %al,(%eax)
    7fa4:	00 00                	add    %al,(%eax)
    7fa6:	00 00                	add    %al,(%eax)
    7fa8:	00 00                	add    %al,(%eax)
    7faa:	00 00                	add    %al,(%eax)
    7fac:	00 00                	add    %al,(%eax)
    7fae:	00 00                	add    %al,(%eax)
    7fb0:	00 00                	add    %al,(%eax)
    7fb2:	00 00                	add    %al,(%eax)
    7fb4:	00 00                	add    %al,(%eax)
    7fb6:	00 00                	add    %al,(%eax)
    7fb8:	00 00                	add    %al,(%eax)
    7fba:	00 00                	add    %al,(%eax)
    7fbc:	00 00                	add    %al,(%eax)
    7fbe:	00 00                	add    %al,(%eax)
    7fc0:	00 00                	add    %al,(%eax)
    7fc2:	00 00                	add    %al,(%eax)
    7fc4:	00 00                	add    %al,(%eax)
    7fc6:	00 00                	add    %al,(%eax)
    7fc8:	00 00                	add    %al,(%eax)
    7fca:	00 00                	add    %al,(%eax)
    7fcc:	00 00                	add    %al,(%eax)
    7fce:	00 00                	add    %al,(%eax)
    7fd0:	00 00                	add    %al,(%eax)
    7fd2:	00 00                	add    %al,(%eax)
    7fd4:	00 00                	add    %al,(%eax)
    7fd6:	00 00                	add    %al,(%eax)
    7fd8:	00 00                	add    %al,(%eax)
    7fda:	00 00                	add    %al,(%eax)
    7fdc:	00 00                	add    %al,(%eax)
    7fde:	00 00                	add    %al,(%eax)
    7fe0:	00 00                	add    %al,(%eax)
    7fe2:	00 00                	add    %al,(%eax)
    7fe4:	00 00                	add    %al,(%eax)
    7fe6:	00 00                	add    %al,(%eax)
    7fe8:	00 00                	add    %al,(%eax)
    7fea:	00 00                	add    %al,(%eax)
    7fec:	00 00                	add    %al,(%eax)
    7fee:	00 00                	add    %al,(%eax)
    7ff0:	00 00                	add    %al,(%eax)
    7ff2:	00 00                	add    %al,(%eax)
    7ff4:	00 00                	add    %al,(%eax)
    7ff6:	00 00                	add    %al,(%eax)
    7ff8:	00 00                	add    %al,(%eax)
    7ffa:	00 00                	add    %al,(%eax)
    7ffc:	00 00                	add    %al,(%eax)
    7ffe:	00 00                	add    %al,(%eax)
    8000:	00 00                	add    %al,(%eax)
    8002:	00 00                	add    %al,(%eax)
    8004:	00 00                	add    %al,(%eax)
    8006:	00 00                	add    %al,(%eax)
    8008:	00 00                	add    %al,(%eax)
    800a:	00 00                	add    %al,(%eax)
    800c:	00 00                	add    %al,(%eax)
    800e:	00 00                	add    %al,(%eax)
    8010:	00 00                	add    %al,(%eax)
    8012:	00 00                	add    %al,(%eax)
    8014:	00 00                	add    %al,(%eax)
    8016:	00 00                	add    %al,(%eax)
    8018:	00 00                	add    %al,(%eax)
    801a:	00 00                	add    %al,(%eax)
    801c:	00 00                	add    %al,(%eax)
    801e:	00 00                	add    %al,(%eax)
    8020:	00 00                	add    %al,(%eax)
    8022:	00 00                	add    %al,(%eax)
    8024:	00 00                	add    %al,(%eax)
    8026:	00 00                	add    %al,(%eax)
    8028:	00 00                	add    %al,(%eax)
    802a:	00 00                	add    %al,(%eax)
    802c:	00 00                	add    %al,(%eax)
    802e:	00 00                	add    %al,(%eax)
    8030:	00 00                	add    %al,(%eax)
    8032:	00 00                	add    %al,(%eax)
    8034:	00 00                	add    %al,(%eax)
    8036:	00 00                	add    %al,(%eax)
    8038:	00 00                	add    %al,(%eax)
    803a:	00 00                	add    %al,(%eax)
    803c:	00 00                	add    %al,(%eax)
    803e:	00 00                	add    %al,(%eax)
    8040:	00 00                	add    %al,(%eax)
    8042:	00 00                	add    %al,(%eax)
    8044:	00 00                	add    %al,(%eax)
    8046:	00 00                	add    %al,(%eax)
    8048:	00 00                	add    %al,(%eax)
    804a:	00 00                	add    %al,(%eax)
    804c:	00 00                	add    %al,(%eax)
    804e:	00 00                	add    %al,(%eax)
    8050:	00 00                	add    %al,(%eax)
    8052:	00 00                	add    %al,(%eax)
    8054:	00 00                	add    %al,(%eax)
    8056:	00 00                	add    %al,(%eax)
    8058:	00 00                	add    %al,(%eax)
    805a:	00 00                	add    %al,(%eax)
    805c:	00 00                	add    %al,(%eax)
    805e:	00 00                	add    %al,(%eax)
    8060:	00 00                	add    %al,(%eax)
    8062:	00 00                	add    %al,(%eax)
    8064:	00 00                	add    %al,(%eax)
    8066:	00 00                	add    %al,(%eax)
    8068:	00 00                	add    %al,(%eax)
    806a:	00 00                	add    %al,(%eax)
    806c:	00 00                	add    %al,(%eax)
    806e:	00 00                	add    %al,(%eax)
    8070:	00 00                	add    %al,(%eax)
    8072:	00 00                	add    %al,(%eax)
    8074:	00 00                	add    %al,(%eax)
    8076:	00 00                	add    %al,(%eax)
    8078:	00 00                	add    %al,(%eax)
    807a:	00 00                	add    %al,(%eax)
    807c:	00 00                	add    %al,(%eax)
    807e:	00 00                	add    %al,(%eax)
    8080:	00 00                	add    %al,(%eax)
    8082:	00 00                	add    %al,(%eax)
    8084:	00 00                	add    %al,(%eax)
    8086:	00 00                	add    %al,(%eax)
    8088:	00 00                	add    %al,(%eax)
    808a:	00 00                	add    %al,(%eax)
    808c:	00 00                	add    %al,(%eax)
    808e:	00 00                	add    %al,(%eax)
    8090:	00 00                	add    %al,(%eax)
    8092:	00 00                	add    %al,(%eax)
    8094:	00 00                	add    %al,(%eax)
    8096:	00 00                	add    %al,(%eax)
    8098:	00 00                	add    %al,(%eax)
    809a:	00 00                	add    %al,(%eax)
    809c:	00 00                	add    %al,(%eax)
    809e:	00 00                	add    %al,(%eax)
    80a0:	00 00                	add    %al,(%eax)
    80a2:	00 00                	add    %al,(%eax)
    80a4:	00 00                	add    %al,(%eax)
    80a6:	00 00                	add    %al,(%eax)
    80a8:	00 00                	add    %al,(%eax)
    80aa:	00 00                	add    %al,(%eax)
    80ac:	00 00                	add    %al,(%eax)
    80ae:	00 00                	add    %al,(%eax)
    80b0:	00 00                	add    %al,(%eax)
    80b2:	00 00                	add    %al,(%eax)
    80b4:	00 00                	add    %al,(%eax)
    80b6:	00 00                	add    %al,(%eax)
    80b8:	00 00                	add    %al,(%eax)
    80ba:	00 00                	add    %al,(%eax)
    80bc:	00 00                	add    %al,(%eax)
    80be:	00 00                	add    %al,(%eax)
    80c0:	00 00                	add    %al,(%eax)
    80c2:	00 00                	add    %al,(%eax)
    80c4:	00 00                	add    %al,(%eax)
    80c6:	00 00                	add    %al,(%eax)
    80c8:	00 00                	add    %al,(%eax)
    80ca:	00 00                	add    %al,(%eax)
    80cc:	00 00                	add    %al,(%eax)
    80ce:	00 00                	add    %al,(%eax)
    80d0:	00 00                	add    %al,(%eax)
    80d2:	00 00                	add    %al,(%eax)
    80d4:	00 00                	add    %al,(%eax)
    80d6:	00 00                	add    %al,(%eax)
    80d8:	00 00                	add    %al,(%eax)
    80da:	00 00                	add    %al,(%eax)
    80dc:	00 00                	add    %al,(%eax)
    80de:	00 00                	add    %al,(%eax)
    80e0:	00 00                	add    %al,(%eax)
    80e2:	00 00                	add    %al,(%eax)
    80e4:	00 00                	add    %al,(%eax)
    80e6:	00 00                	add    %al,(%eax)
    80e8:	00 00                	add    %al,(%eax)
    80ea:	00 00                	add    %al,(%eax)
    80ec:	00 00                	add    %al,(%eax)
    80ee:	00 00                	add    %al,(%eax)
    80f0:	00 00                	add    %al,(%eax)
    80f2:	00 00                	add    %al,(%eax)
    80f4:	00 00                	add    %al,(%eax)
    80f6:	00 00                	add    %al,(%eax)
    80f8:	00 00                	add    %al,(%eax)
    80fa:	00 00                	add    %al,(%eax)
    80fc:	00 00                	add    %al,(%eax)
    80fe:	00 00                	add    %al,(%eax)
    8100:	00 00                	add    %al,(%eax)
    8102:	00 00                	add    %al,(%eax)
    8104:	00 00                	add    %al,(%eax)
    8106:	00 00                	add    %al,(%eax)
    8108:	00 00                	add    %al,(%eax)
    810a:	00 00                	add    %al,(%eax)
    810c:	00 00                	add    %al,(%eax)
    810e:	00 00                	add    %al,(%eax)
    8110:	00 00                	add    %al,(%eax)
    8112:	00 00                	add    %al,(%eax)
    8114:	00 00                	add    %al,(%eax)
    8116:	00 00                	add    %al,(%eax)
    8118:	00 00                	add    %al,(%eax)
    811a:	00 00                	add    %al,(%eax)
    811c:	00 00                	add    %al,(%eax)
    811e:	00 00                	add    %al,(%eax)
    8120:	00 00                	add    %al,(%eax)
    8122:	00 00                	add    %al,(%eax)
    8124:	00 00                	add    %al,(%eax)
    8126:	00 00                	add    %al,(%eax)
    8128:	00 00                	add    %al,(%eax)
    812a:	00 00                	add    %al,(%eax)
    812c:	00 00                	add    %al,(%eax)
    812e:	00 00                	add    %al,(%eax)
    8130:	00 00                	add    %al,(%eax)
    8132:	00 00                	add    %al,(%eax)
    8134:	00 00                	add    %al,(%eax)
    8136:	00 00                	add    %al,(%eax)
    8138:	00 00                	add    %al,(%eax)
    813a:	00 00                	add    %al,(%eax)
    813c:	00 00                	add    %al,(%eax)
    813e:	00 00                	add    %al,(%eax)
    8140:	00 00                	add    %al,(%eax)
    8142:	00 00                	add    %al,(%eax)
    8144:	00 00                	add    %al,(%eax)
    8146:	00 00                	add    %al,(%eax)
    8148:	00 00                	add    %al,(%eax)
    814a:	00 00                	add    %al,(%eax)
    814c:	00 00                	add    %al,(%eax)
    814e:	00 00                	add    %al,(%eax)
    8150:	00 00                	add    %al,(%eax)
    8152:	00 00                	add    %al,(%eax)
    8154:	00 00                	add    %al,(%eax)
    8156:	00 00                	add    %al,(%eax)
    8158:	00 00                	add    %al,(%eax)
    815a:	00 00                	add    %al,(%eax)
    815c:	00 00                	add    %al,(%eax)
    815e:	00 00                	add    %al,(%eax)
    8160:	00 00                	add    %al,(%eax)
    8162:	00 00                	add    %al,(%eax)
    8164:	00 00                	add    %al,(%eax)
    8166:	00 00                	add    %al,(%eax)
    8168:	00 00                	add    %al,(%eax)
    816a:	00 00                	add    %al,(%eax)
    816c:	00 00                	add    %al,(%eax)
    816e:	00 00                	add    %al,(%eax)
    8170:	00 00                	add    %al,(%eax)
    8172:	00 00                	add    %al,(%eax)
    8174:	00 00                	add    %al,(%eax)
    8176:	00 00                	add    %al,(%eax)
    8178:	00 00                	add    %al,(%eax)
    817a:	00 00                	add    %al,(%eax)
    817c:	00 00                	add    %al,(%eax)
    817e:	00 00                	add    %al,(%eax)
    8180:	00 00                	add    %al,(%eax)
    8182:	00 00                	add    %al,(%eax)
    8184:	00 00                	add    %al,(%eax)
    8186:	00 00                	add    %al,(%eax)
    8188:	00 00                	add    %al,(%eax)
    818a:	00 00                	add    %al,(%eax)
    818c:	00 00                	add    %al,(%eax)
    818e:	00 00                	add    %al,(%eax)
    8190:	00 00                	add    %al,(%eax)
    8192:	00 00                	add    %al,(%eax)
    8194:	00 00                	add    %al,(%eax)
    8196:	00 00                	add    %al,(%eax)
    8198:	00 00                	add    %al,(%eax)
    819a:	00 00                	add    %al,(%eax)
    819c:	00 00                	add    %al,(%eax)
    819e:	00 00                	add    %al,(%eax)
    81a0:	00 00                	add    %al,(%eax)
    81a2:	00 00                	add    %al,(%eax)
    81a4:	00 00                	add    %al,(%eax)
    81a6:	00 00                	add    %al,(%eax)
    81a8:	00 00                	add    %al,(%eax)
    81aa:	00 00                	add    %al,(%eax)
    81ac:	00 00                	add    %al,(%eax)
    81ae:	00 00                	add    %al,(%eax)
    81b0:	00 00                	add    %al,(%eax)
    81b2:	00 00                	add    %al,(%eax)
    81b4:	00 00                	add    %al,(%eax)
    81b6:	00 00                	add    %al,(%eax)
    81b8:	00 00                	add    %al,(%eax)
    81ba:	00 00                	add    %al,(%eax)
    81bc:	00 00                	add    %al,(%eax)
    81be:	00 00                	add    %al,(%eax)
    81c0:	00 00                	add    %al,(%eax)
    81c2:	00 00                	add    %al,(%eax)
    81c4:	00 00                	add    %al,(%eax)
    81c6:	00 00                	add    %al,(%eax)
    81c8:	00 00                	add    %al,(%eax)
    81ca:	00 00                	add    %al,(%eax)
    81cc:	00 00                	add    %al,(%eax)
    81ce:	00 00                	add    %al,(%eax)
    81d0:	00 00                	add    %al,(%eax)
    81d2:	00 00                	add    %al,(%eax)
    81d4:	00 00                	add    %al,(%eax)
    81d6:	00 00                	add    %al,(%eax)
    81d8:	00 00                	add    %al,(%eax)
    81da:	00 00                	add    %al,(%eax)
    81dc:	00 00                	add    %al,(%eax)
    81de:	00 00                	add    %al,(%eax)
    81e0:	00 00                	add    %al,(%eax)
    81e2:	00 00                	add    %al,(%eax)
    81e4:	00 00                	add    %al,(%eax)
    81e6:	00 00                	add    %al,(%eax)
    81e8:	00 00                	add    %al,(%eax)
    81ea:	00 00                	add    %al,(%eax)
    81ec:	00 00                	add    %al,(%eax)
    81ee:	00 00                	add    %al,(%eax)
    81f0:	00 00                	add    %al,(%eax)
    81f2:	00 00                	add    %al,(%eax)
    81f4:	00 00                	add    %al,(%eax)
    81f6:	00 00                	add    %al,(%eax)
    81f8:	00 00                	add    %al,(%eax)
    81fa:	00 00                	add    %al,(%eax)
    81fc:	00 00                	add    %al,(%eax)
    81fe:	00 00                	add    %al,(%eax)
    8200:	00 00                	add    %al,(%eax)
    8202:	00 00                	add    %al,(%eax)
    8204:	00 00                	add    %al,(%eax)
    8206:	00 00                	add    %al,(%eax)
    8208:	00 00                	add    %al,(%eax)
    820a:	00 00                	add    %al,(%eax)
    820c:	00 00                	add    %al,(%eax)
    820e:	00 00                	add    %al,(%eax)
    8210:	00 00                	add    %al,(%eax)
    8212:	00 00                	add    %al,(%eax)
    8214:	00 00                	add    %al,(%eax)
    8216:	00 00                	add    %al,(%eax)
    8218:	00 00                	add    %al,(%eax)
    821a:	00 00                	add    %al,(%eax)
    821c:	00 00                	add    %al,(%eax)
    821e:	00 00                	add    %al,(%eax)
    8220:	00 00                	add    %al,(%eax)
    8222:	00 00                	add    %al,(%eax)
    8224:	00 00                	add    %al,(%eax)
    8226:	00 00                	add    %al,(%eax)
    8228:	00 00                	add    %al,(%eax)
    822a:	00 00                	add    %al,(%eax)
    822c:	00 00                	add    %al,(%eax)
    822e:	00 00                	add    %al,(%eax)
    8230:	00 00                	add    %al,(%eax)
    8232:	00 00                	add    %al,(%eax)
    8234:	00 00                	add    %al,(%eax)
    8236:	00 00                	add    %al,(%eax)
    8238:	00 00                	add    %al,(%eax)
    823a:	00 00                	add    %al,(%eax)
    823c:	00 00                	add    %al,(%eax)
    823e:	00 00                	add    %al,(%eax)
    8240:	00 00                	add    %al,(%eax)
    8242:	00 00                	add    %al,(%eax)
    8244:	00 00                	add    %al,(%eax)
    8246:	00 00                	add    %al,(%eax)
    8248:	00 00                	add    %al,(%eax)
    824a:	00 00                	add    %al,(%eax)
    824c:	00 00                	add    %al,(%eax)
    824e:	00 00                	add    %al,(%eax)
    8250:	00 00                	add    %al,(%eax)
    8252:	00 00                	add    %al,(%eax)
    8254:	00 00                	add    %al,(%eax)
    8256:	00 00                	add    %al,(%eax)
    8258:	00 00                	add    %al,(%eax)
    825a:	00 00                	add    %al,(%eax)
    825c:	00 00                	add    %al,(%eax)
    825e:	00 00                	add    %al,(%eax)
    8260:	00 00                	add    %al,(%eax)
    8262:	00 00                	add    %al,(%eax)
    8264:	00 00                	add    %al,(%eax)
    8266:	00 00                	add    %al,(%eax)
    8268:	00 00                	add    %al,(%eax)
    826a:	00 00                	add    %al,(%eax)
    826c:	00 00                	add    %al,(%eax)
    826e:	00 00                	add    %al,(%eax)
    8270:	00 00                	add    %al,(%eax)
    8272:	00 00                	add    %al,(%eax)
    8274:	00 00                	add    %al,(%eax)
    8276:	00 00                	add    %al,(%eax)
    8278:	00 00                	add    %al,(%eax)
    827a:	00 00                	add    %al,(%eax)
    827c:	00 00                	add    %al,(%eax)
    827e:	00 00                	add    %al,(%eax)
    8280:	00 00                	add    %al,(%eax)
    8282:	00 00                	add    %al,(%eax)
    8284:	00 00                	add    %al,(%eax)
    8286:	00 00                	add    %al,(%eax)
    8288:	00 00                	add    %al,(%eax)
    828a:	00 00                	add    %al,(%eax)
    828c:	00 00                	add    %al,(%eax)
    828e:	00 00                	add    %al,(%eax)
    8290:	00 00                	add    %al,(%eax)
    8292:	00 00                	add    %al,(%eax)
    8294:	00 00                	add    %al,(%eax)
    8296:	00 00                	add    %al,(%eax)
    8298:	00 00                	add    %al,(%eax)
    829a:	00 00                	add    %al,(%eax)
    829c:	00 00                	add    %al,(%eax)
    829e:	00 00                	add    %al,(%eax)
    82a0:	00 00                	add    %al,(%eax)
    82a2:	00 00                	add    %al,(%eax)
    82a4:	00 00                	add    %al,(%eax)
    82a6:	00 00                	add    %al,(%eax)
    82a8:	00 00                	add    %al,(%eax)
    82aa:	00 00                	add    %al,(%eax)
    82ac:	00 00                	add    %al,(%eax)
    82ae:	00 00                	add    %al,(%eax)
    82b0:	00 00                	add    %al,(%eax)
    82b2:	00 00                	add    %al,(%eax)
    82b4:	00 00                	add    %al,(%eax)
    82b6:	00 00                	add    %al,(%eax)
    82b8:	00 00                	add    %al,(%eax)
    82ba:	00 00                	add    %al,(%eax)
    82bc:	00 00                	add    %al,(%eax)
    82be:	00 00                	add    %al,(%eax)
    82c0:	00 00                	add    %al,(%eax)
    82c2:	00 00                	add    %al,(%eax)
    82c4:	00 00                	add    %al,(%eax)
    82c6:	00 00                	add    %al,(%eax)
    82c8:	00 00                	add    %al,(%eax)
    82ca:	00 00                	add    %al,(%eax)
    82cc:	00 00                	add    %al,(%eax)
    82ce:	00 00                	add    %al,(%eax)
    82d0:	00 00                	add    %al,(%eax)
    82d2:	00 00                	add    %al,(%eax)
    82d4:	00 00                	add    %al,(%eax)
    82d6:	00 00                	add    %al,(%eax)
    82d8:	00 00                	add    %al,(%eax)
    82da:	00 00                	add    %al,(%eax)
    82dc:	00 00                	add    %al,(%eax)
    82de:	00 00                	add    %al,(%eax)
    82e0:	00 00                	add    %al,(%eax)
    82e2:	00 00                	add    %al,(%eax)
    82e4:	00 00                	add    %al,(%eax)
    82e6:	00 00                	add    %al,(%eax)
    82e8:	00 00                	add    %al,(%eax)
    82ea:	00 00                	add    %al,(%eax)
    82ec:	00 00                	add    %al,(%eax)
    82ee:	00 00                	add    %al,(%eax)
    82f0:	00 00                	add    %al,(%eax)
    82f2:	00 00                	add    %al,(%eax)
    82f4:	00 00                	add    %al,(%eax)
    82f6:	00 00                	add    %al,(%eax)
    82f8:	00 00                	add    %al,(%eax)
    82fa:	00 00                	add    %al,(%eax)
    82fc:	00 00                	add    %al,(%eax)
    82fe:	00 00                	add    %al,(%eax)
    8300:	00 00                	add    %al,(%eax)
    8302:	00 00                	add    %al,(%eax)
    8304:	00 00                	add    %al,(%eax)
    8306:	00 00                	add    %al,(%eax)
    8308:	00 00                	add    %al,(%eax)
    830a:	00 00                	add    %al,(%eax)
    830c:	00 00                	add    %al,(%eax)
    830e:	00 00                	add    %al,(%eax)
    8310:	00 00                	add    %al,(%eax)
    8312:	00 00                	add    %al,(%eax)
    8314:	00 00                	add    %al,(%eax)
    8316:	00 00                	add    %al,(%eax)
    8318:	00 00                	add    %al,(%eax)
    831a:	00 00                	add    %al,(%eax)
    831c:	00 00                	add    %al,(%eax)
    831e:	00 00                	add    %al,(%eax)
    8320:	00 00                	add    %al,(%eax)
    8322:	00 00                	add    %al,(%eax)
    8324:	00 00                	add    %al,(%eax)
    8326:	00 00                	add    %al,(%eax)
    8328:	00 00                	add    %al,(%eax)
    832a:	00 00                	add    %al,(%eax)
    832c:	00 00                	add    %al,(%eax)
    832e:	00 00                	add    %al,(%eax)
    8330:	00 00                	add    %al,(%eax)
    8332:	00 00                	add    %al,(%eax)
    8334:	00 00                	add    %al,(%eax)
    8336:	00 00                	add    %al,(%eax)
    8338:	00 00                	add    %al,(%eax)
    833a:	00 00                	add    %al,(%eax)
    833c:	00 00                	add    %al,(%eax)
    833e:	00 00                	add    %al,(%eax)
    8340:	00 00                	add    %al,(%eax)
    8342:	00 00                	add    %al,(%eax)
    8344:	00 00                	add    %al,(%eax)
    8346:	00 00                	add    %al,(%eax)
    8348:	00 00                	add    %al,(%eax)
    834a:	00 00                	add    %al,(%eax)
    834c:	00 00                	add    %al,(%eax)
    834e:	00 00                	add    %al,(%eax)
    8350:	00 00                	add    %al,(%eax)
    8352:	00 00                	add    %al,(%eax)
    8354:	00 00                	add    %al,(%eax)
    8356:	00 00                	add    %al,(%eax)
    8358:	00 00                	add    %al,(%eax)
    835a:	00 00                	add    %al,(%eax)
    835c:	00 00                	add    %al,(%eax)
    835e:	00 00                	add    %al,(%eax)
    8360:	00 00                	add    %al,(%eax)
    8362:	00 00                	add    %al,(%eax)
    8364:	00 00                	add    %al,(%eax)
    8366:	00 00                	add    %al,(%eax)
    8368:	00 00                	add    %al,(%eax)
    836a:	00 00                	add    %al,(%eax)
    836c:	00 00                	add    %al,(%eax)
    836e:	00 00                	add    %al,(%eax)
    8370:	00 00                	add    %al,(%eax)
    8372:	00 00                	add    %al,(%eax)
    8374:	00 00                	add    %al,(%eax)
    8376:	00 00                	add    %al,(%eax)
    8378:	00 00                	add    %al,(%eax)
    837a:	00 00                	add    %al,(%eax)
    837c:	00 00                	add    %al,(%eax)
    837e:	00 00                	add    %al,(%eax)
    8380:	00 00                	add    %al,(%eax)
    8382:	00 00                	add    %al,(%eax)
    8384:	00 00                	add    %al,(%eax)
    8386:	00 00                	add    %al,(%eax)
    8388:	00 00                	add    %al,(%eax)
    838a:	00 00                	add    %al,(%eax)
    838c:	00 00                	add    %al,(%eax)
    838e:	00 00                	add    %al,(%eax)
    8390:	00 00                	add    %al,(%eax)
    8392:	00 00                	add    %al,(%eax)
    8394:	00 00                	add    %al,(%eax)
    8396:	00 00                	add    %al,(%eax)
    8398:	00 00                	add    %al,(%eax)
    839a:	00 00                	add    %al,(%eax)
    839c:	00 00                	add    %al,(%eax)
    839e:	00 00                	add    %al,(%eax)
    83a0:	00 00                	add    %al,(%eax)
    83a2:	00 00                	add    %al,(%eax)
    83a4:	00 00                	add    %al,(%eax)
    83a6:	00 00                	add    %al,(%eax)
    83a8:	00 00                	add    %al,(%eax)
    83aa:	00 00                	add    %al,(%eax)
    83ac:	00 00                	add    %al,(%eax)
    83ae:	00 00                	add    %al,(%eax)
    83b0:	00 00                	add    %al,(%eax)
    83b2:	00 00                	add    %al,(%eax)
    83b4:	00 00                	add    %al,(%eax)
    83b6:	00 00                	add    %al,(%eax)
    83b8:	00 00                	add    %al,(%eax)
    83ba:	00 00                	add    %al,(%eax)
    83bc:	00 00                	add    %al,(%eax)
    83be:	00 00                	add    %al,(%eax)
    83c0:	00 00                	add    %al,(%eax)
    83c2:	00 00                	add    %al,(%eax)
    83c4:	00 00                	add    %al,(%eax)
    83c6:	00 00                	add    %al,(%eax)
    83c8:	00 00                	add    %al,(%eax)
    83ca:	00 00                	add    %al,(%eax)
    83cc:	00 00                	add    %al,(%eax)
    83ce:	00 00                	add    %al,(%eax)
    83d0:	00 00                	add    %al,(%eax)
    83d2:	00 00                	add    %al,(%eax)
    83d4:	00 00                	add    %al,(%eax)
    83d6:	00 00                	add    %al,(%eax)
    83d8:	00 00                	add    %al,(%eax)
    83da:	00 00                	add    %al,(%eax)
    83dc:	00 00                	add    %al,(%eax)
    83de:	00 00                	add    %al,(%eax)
    83e0:	00 00                	add    %al,(%eax)
    83e2:	00 00                	add    %al,(%eax)
    83e4:	00 00                	add    %al,(%eax)
    83e6:	00 00                	add    %al,(%eax)
    83e8:	00 00                	add    %al,(%eax)
    83ea:	00 00                	add    %al,(%eax)
    83ec:	00 00                	add    %al,(%eax)
    83ee:	00 00                	add    %al,(%eax)
    83f0:	00 00                	add    %al,(%eax)
    83f2:	00 00                	add    %al,(%eax)
    83f4:	00 00                	add    %al,(%eax)
    83f6:	00 00                	add    %al,(%eax)
    83f8:	00 00                	add    %al,(%eax)
    83fa:	00 00                	add    %al,(%eax)
    83fc:	00 00                	add    %al,(%eax)
    83fe:	00 00                	add    %al,(%eax)
    8400:	00 00                	add    %al,(%eax)
    8402:	00 00                	add    %al,(%eax)
    8404:	00 00                	add    %al,(%eax)
    8406:	00 00                	add    %al,(%eax)
    8408:	00 00                	add    %al,(%eax)
    840a:	00 00                	add    %al,(%eax)
    840c:	00 00                	add    %al,(%eax)
    840e:	00 00                	add    %al,(%eax)
    8410:	00 00                	add    %al,(%eax)
    8412:	00 00                	add    %al,(%eax)
    8414:	00 00                	add    %al,(%eax)
    8416:	00 00                	add    %al,(%eax)
    8418:	00 00                	add    %al,(%eax)
    841a:	00 00                	add    %al,(%eax)
    841c:	00 00                	add    %al,(%eax)
    841e:	00 00                	add    %al,(%eax)
    8420:	00 00                	add    %al,(%eax)
    8422:	00 00                	add    %al,(%eax)
    8424:	00 00                	add    %al,(%eax)
    8426:	00 00                	add    %al,(%eax)
    8428:	00 00                	add    %al,(%eax)
    842a:	00 00                	add    %al,(%eax)
    842c:	00 00                	add    %al,(%eax)
    842e:	00 00                	add    %al,(%eax)
    8430:	00 00                	add    %al,(%eax)
    8432:	00 00                	add    %al,(%eax)
    8434:	00 00                	add    %al,(%eax)
    8436:	00 00                	add    %al,(%eax)
    8438:	00 00                	add    %al,(%eax)
    843a:	00 00                	add    %al,(%eax)
    843c:	00 00                	add    %al,(%eax)
    843e:	00 00                	add    %al,(%eax)
    8440:	00 00                	add    %al,(%eax)
    8442:	00 00                	add    %al,(%eax)
    8444:	00 00                	add    %al,(%eax)
    8446:	00 00                	add    %al,(%eax)
    8448:	00 00                	add    %al,(%eax)
    844a:	00 00                	add    %al,(%eax)
    844c:	00 00                	add    %al,(%eax)
    844e:	00 00                	add    %al,(%eax)
    8450:	00 00                	add    %al,(%eax)
    8452:	00 00                	add    %al,(%eax)
    8454:	00 00                	add    %al,(%eax)
    8456:	00 00                	add    %al,(%eax)
    8458:	00 00                	add    %al,(%eax)
    845a:	00 00                	add    %al,(%eax)
    845c:	00 00                	add    %al,(%eax)
    845e:	00 00                	add    %al,(%eax)
    8460:	00 00                	add    %al,(%eax)
    8462:	00 00                	add    %al,(%eax)
    8464:	00 00                	add    %al,(%eax)
    8466:	00 00                	add    %al,(%eax)
    8468:	00 00                	add    %al,(%eax)
    846a:	00 00                	add    %al,(%eax)
    846c:	00 00                	add    %al,(%eax)
    846e:	00 00                	add    %al,(%eax)
    8470:	00 00                	add    %al,(%eax)
    8472:	00 00                	add    %al,(%eax)
    8474:	00 00                	add    %al,(%eax)
    8476:	00 00                	add    %al,(%eax)
    8478:	00 00                	add    %al,(%eax)
    847a:	00 00                	add    %al,(%eax)
    847c:	00 00                	add    %al,(%eax)
    847e:	00 00                	add    %al,(%eax)
    8480:	00 00                	add    %al,(%eax)
    8482:	00 00                	add    %al,(%eax)
    8484:	00 00                	add    %al,(%eax)
    8486:	00 00                	add    %al,(%eax)
    8488:	00 00                	add    %al,(%eax)
    848a:	00 00                	add    %al,(%eax)
    848c:	00 00                	add    %al,(%eax)
    848e:	00 00                	add    %al,(%eax)
    8490:	00 00                	add    %al,(%eax)
    8492:	00 00                	add    %al,(%eax)
    8494:	00 00                	add    %al,(%eax)
    8496:	00 00                	add    %al,(%eax)
    8498:	00 00                	add    %al,(%eax)
    849a:	00 00                	add    %al,(%eax)
    849c:	00 00                	add    %al,(%eax)
    849e:	00 00                	add    %al,(%eax)
    84a0:	00 00                	add    %al,(%eax)
    84a2:	00 00                	add    %al,(%eax)
    84a4:	00 00                	add    %al,(%eax)
    84a6:	00 00                	add    %al,(%eax)
    84a8:	00 00                	add    %al,(%eax)
    84aa:	00 00                	add    %al,(%eax)
    84ac:	00 00                	add    %al,(%eax)
    84ae:	00 00                	add    %al,(%eax)
    84b0:	00 00                	add    %al,(%eax)
    84b2:	00 00                	add    %al,(%eax)
    84b4:	00 00                	add    %al,(%eax)
    84b6:	00 00                	add    %al,(%eax)
    84b8:	00 00                	add    %al,(%eax)
    84ba:	00 00                	add    %al,(%eax)
    84bc:	00 00                	add    %al,(%eax)
    84be:	00 00                	add    %al,(%eax)
    84c0:	00 00                	add    %al,(%eax)
    84c2:	00 00                	add    %al,(%eax)
    84c4:	00 00                	add    %al,(%eax)
    84c6:	00 00                	add    %al,(%eax)
    84c8:	00 00                	add    %al,(%eax)
    84ca:	00 00                	add    %al,(%eax)
    84cc:	00 00                	add    %al,(%eax)
    84ce:	00 00                	add    %al,(%eax)
    84d0:	00 00                	add    %al,(%eax)
    84d2:	00 00                	add    %al,(%eax)
    84d4:	00 00                	add    %al,(%eax)
    84d6:	00 00                	add    %al,(%eax)
    84d8:	00 00                	add    %al,(%eax)
    84da:	00 00                	add    %al,(%eax)
    84dc:	00 00                	add    %al,(%eax)
    84de:	00 00                	add    %al,(%eax)
    84e0:	00 00                	add    %al,(%eax)
    84e2:	00 00                	add    %al,(%eax)
    84e4:	00 00                	add    %al,(%eax)
    84e6:	00 00                	add    %al,(%eax)
    84e8:	00 00                	add    %al,(%eax)
    84ea:	00 00                	add    %al,(%eax)
    84ec:	00 00                	add    %al,(%eax)
    84ee:	00 00                	add    %al,(%eax)
    84f0:	00 00                	add    %al,(%eax)
    84f2:	00 00                	add    %al,(%eax)
    84f4:	00 00                	add    %al,(%eax)
    84f6:	00 00                	add    %al,(%eax)
    84f8:	00 00                	add    %al,(%eax)
    84fa:	00 00                	add    %al,(%eax)
    84fc:	00 00                	add    %al,(%eax)
    84fe:	00 00                	add    %al,(%eax)
    8500:	00 00                	add    %al,(%eax)
    8502:	00 00                	add    %al,(%eax)
    8504:	00 00                	add    %al,(%eax)
    8506:	00 00                	add    %al,(%eax)
    8508:	00 00                	add    %al,(%eax)
    850a:	00 00                	add    %al,(%eax)
    850c:	00 00                	add    %al,(%eax)
    850e:	00 00                	add    %al,(%eax)
    8510:	00 00                	add    %al,(%eax)
    8512:	00 00                	add    %al,(%eax)
    8514:	00 00                	add    %al,(%eax)
    8516:	00 00                	add    %al,(%eax)
    8518:	00 00                	add    %al,(%eax)
    851a:	00 00                	add    %al,(%eax)
    851c:	00 00                	add    %al,(%eax)
    851e:	00 00                	add    %al,(%eax)
    8520:	00 00                	add    %al,(%eax)
    8522:	00 00                	add    %al,(%eax)
    8524:	00 00                	add    %al,(%eax)
    8526:	00 00                	add    %al,(%eax)
    8528:	00 00                	add    %al,(%eax)
    852a:	00 00                	add    %al,(%eax)
    852c:	00 00                	add    %al,(%eax)
    852e:	00 00                	add    %al,(%eax)
    8530:	00 00                	add    %al,(%eax)
    8532:	00 00                	add    %al,(%eax)
    8534:	00 00                	add    %al,(%eax)
    8536:	00 00                	add    %al,(%eax)
    8538:	00 00                	add    %al,(%eax)
    853a:	00 00                	add    %al,(%eax)
    853c:	00 00                	add    %al,(%eax)
    853e:	00 00                	add    %al,(%eax)
    8540:	00 00                	add    %al,(%eax)
    8542:	00 00                	add    %al,(%eax)
    8544:	00 00                	add    %al,(%eax)
    8546:	00 00                	add    %al,(%eax)
    8548:	00 00                	add    %al,(%eax)
    854a:	00 00                	add    %al,(%eax)
    854c:	00 00                	add    %al,(%eax)
    854e:	00 00                	add    %al,(%eax)
    8550:	00 00                	add    %al,(%eax)
    8552:	00 00                	add    %al,(%eax)
    8554:	00 00                	add    %al,(%eax)
    8556:	00 00                	add    %al,(%eax)
    8558:	00 00                	add    %al,(%eax)
    855a:	00 00                	add    %al,(%eax)
    855c:	00 00                	add    %al,(%eax)
    855e:	00 00                	add    %al,(%eax)
    8560:	00 00                	add    %al,(%eax)
    8562:	00 00                	add    %al,(%eax)
    8564:	00 00                	add    %al,(%eax)
    8566:	00 00                	add    %al,(%eax)
    8568:	00 00                	add    %al,(%eax)
    856a:	00 00                	add    %al,(%eax)
    856c:	00 00                	add    %al,(%eax)
    856e:	00 00                	add    %al,(%eax)
    8570:	00 00                	add    %al,(%eax)
    8572:	00 00                	add    %al,(%eax)
    8574:	00 00                	add    %al,(%eax)
    8576:	00 00                	add    %al,(%eax)
    8578:	00 00                	add    %al,(%eax)
    857a:	00 00                	add    %al,(%eax)
    857c:	00 00                	add    %al,(%eax)
    857e:	00 00                	add    %al,(%eax)
    8580:	00 00                	add    %al,(%eax)
    8582:	00 00                	add    %al,(%eax)
    8584:	00 00                	add    %al,(%eax)
    8586:	00 00                	add    %al,(%eax)
    8588:	00 00                	add    %al,(%eax)
    858a:	00 00                	add    %al,(%eax)
    858c:	00 00                	add    %al,(%eax)
    858e:	00 00                	add    %al,(%eax)
    8590:	00 00                	add    %al,(%eax)
    8592:	00 00                	add    %al,(%eax)
    8594:	00 00                	add    %al,(%eax)
    8596:	00 00                	add    %al,(%eax)
    8598:	00 00                	add    %al,(%eax)
    859a:	00 00                	add    %al,(%eax)
    859c:	00 00                	add    %al,(%eax)
    859e:	00 00                	add    %al,(%eax)
    85a0:	00 00                	add    %al,(%eax)
    85a2:	00 00                	add    %al,(%eax)
    85a4:	00 00                	add    %al,(%eax)
    85a6:	00 00                	add    %al,(%eax)
    85a8:	00 00                	add    %al,(%eax)
    85aa:	00 00                	add    %al,(%eax)
    85ac:	00 00                	add    %al,(%eax)
    85ae:	00 00                	add    %al,(%eax)
    85b0:	00 00                	add    %al,(%eax)
    85b2:	00 00                	add    %al,(%eax)
    85b4:	00 00                	add    %al,(%eax)
    85b6:	00 00                	add    %al,(%eax)
    85b8:	00 00                	add    %al,(%eax)
    85ba:	00 00                	add    %al,(%eax)
    85bc:	00 00                	add    %al,(%eax)
    85be:	00 00                	add    %al,(%eax)
    85c0:	00 00                	add    %al,(%eax)
    85c2:	00 00                	add    %al,(%eax)
    85c4:	00 00                	add    %al,(%eax)
    85c6:	00 00                	add    %al,(%eax)
    85c8:	00 00                	add    %al,(%eax)
    85ca:	00 00                	add    %al,(%eax)
    85cc:	00 00                	add    %al,(%eax)
    85ce:	00 00                	add    %al,(%eax)
    85d0:	00 00                	add    %al,(%eax)
    85d2:	00 00                	add    %al,(%eax)
    85d4:	00 00                	add    %al,(%eax)
    85d6:	00 00                	add    %al,(%eax)
    85d8:	00 00                	add    %al,(%eax)
    85da:	00 00                	add    %al,(%eax)
    85dc:	00 00                	add    %al,(%eax)
    85de:	00 00                	add    %al,(%eax)
    85e0:	00 00                	add    %al,(%eax)
    85e2:	00 00                	add    %al,(%eax)
    85e4:	00 00                	add    %al,(%eax)
    85e6:	00 00                	add    %al,(%eax)
    85e8:	00 00                	add    %al,(%eax)
    85ea:	00 00                	add    %al,(%eax)
    85ec:	00 00                	add    %al,(%eax)
    85ee:	00 00                	add    %al,(%eax)
    85f0:	00 00                	add    %al,(%eax)
    85f2:	00 00                	add    %al,(%eax)
    85f4:	00 00                	add    %al,(%eax)
    85f6:	00 00                	add    %al,(%eax)
    85f8:	00 00                	add    %al,(%eax)
    85fa:	00 00                	add    %al,(%eax)
    85fc:	00 00                	add    %al,(%eax)
    85fe:	00 00                	add    %al,(%eax)
    8600:	00 00                	add    %al,(%eax)
    8602:	00 00                	add    %al,(%eax)
    8604:	00 00                	add    %al,(%eax)
    8606:	00 00                	add    %al,(%eax)
    8608:	00 00                	add    %al,(%eax)
    860a:	00 00                	add    %al,(%eax)
    860c:	00 00                	add    %al,(%eax)
    860e:	00 00                	add    %al,(%eax)
    8610:	00 00                	add    %al,(%eax)
    8612:	00 00                	add    %al,(%eax)
    8614:	00 00                	add    %al,(%eax)
    8616:	00 00                	add    %al,(%eax)
    8618:	00 00                	add    %al,(%eax)
    861a:	00 00                	add    %al,(%eax)
    861c:	00 00                	add    %al,(%eax)
    861e:	00 00                	add    %al,(%eax)
    8620:	00 00                	add    %al,(%eax)
    8622:	00 00                	add    %al,(%eax)
    8624:	00 00                	add    %al,(%eax)
    8626:	00 00                	add    %al,(%eax)
    8628:	00 00                	add    %al,(%eax)
    862a:	00 00                	add    %al,(%eax)
    862c:	00 00                	add    %al,(%eax)
    862e:	00 00                	add    %al,(%eax)
    8630:	00 00                	add    %al,(%eax)
    8632:	00 00                	add    %al,(%eax)
    8634:	00 00                	add    %al,(%eax)
    8636:	00 00                	add    %al,(%eax)
    8638:	00 00                	add    %al,(%eax)
    863a:	00 00                	add    %al,(%eax)
    863c:	00 00                	add    %al,(%eax)
    863e:	00 00                	add    %al,(%eax)
    8640:	00 00                	add    %al,(%eax)
    8642:	00 00                	add    %al,(%eax)
    8644:	00 00                	add    %al,(%eax)
    8646:	00 00                	add    %al,(%eax)
    8648:	00 00                	add    %al,(%eax)
    864a:	00 00                	add    %al,(%eax)
    864c:	00 00                	add    %al,(%eax)
    864e:	00 00                	add    %al,(%eax)
    8650:	00 00                	add    %al,(%eax)
    8652:	00 00                	add    %al,(%eax)
    8654:	00 00                	add    %al,(%eax)
    8656:	00 00                	add    %al,(%eax)
    8658:	00 00                	add    %al,(%eax)
    865a:	00 00                	add    %al,(%eax)
    865c:	00 00                	add    %al,(%eax)
    865e:	00 00                	add    %al,(%eax)
    8660:	00 00                	add    %al,(%eax)
    8662:	00 00                	add    %al,(%eax)
    8664:	00 00                	add    %al,(%eax)
    8666:	00 00                	add    %al,(%eax)
    8668:	00 00                	add    %al,(%eax)
    866a:	00 00                	add    %al,(%eax)
    866c:	00 00                	add    %al,(%eax)
    866e:	00 00                	add    %al,(%eax)
    8670:	00 00                	add    %al,(%eax)
    8672:	00 00                	add    %al,(%eax)
    8674:	00 00                	add    %al,(%eax)
    8676:	00 00                	add    %al,(%eax)
    8678:	00 00                	add    %al,(%eax)
    867a:	00 00                	add    %al,(%eax)
    867c:	00 00                	add    %al,(%eax)
    867e:	00 00                	add    %al,(%eax)
    8680:	00 00                	add    %al,(%eax)
    8682:	00 00                	add    %al,(%eax)
    8684:	00 00                	add    %al,(%eax)
    8686:	00 00                	add    %al,(%eax)
    8688:	00 00                	add    %al,(%eax)
    868a:	00 00                	add    %al,(%eax)
    868c:	00 00                	add    %al,(%eax)
    868e:	00 00                	add    %al,(%eax)
    8690:	00 00                	add    %al,(%eax)
    8692:	00 00                	add    %al,(%eax)
    8694:	00 00                	add    %al,(%eax)
    8696:	00 00                	add    %al,(%eax)
    8698:	00 00                	add    %al,(%eax)
    869a:	00 00                	add    %al,(%eax)
    869c:	00 00                	add    %al,(%eax)
    869e:	00 00                	add    %al,(%eax)
    86a0:	00 00                	add    %al,(%eax)
    86a2:	00 00                	add    %al,(%eax)
    86a4:	00 00                	add    %al,(%eax)
    86a6:	00 00                	add    %al,(%eax)
    86a8:	00 00                	add    %al,(%eax)
    86aa:	00 00                	add    %al,(%eax)
    86ac:	00 00                	add    %al,(%eax)
    86ae:	00 00                	add    %al,(%eax)
    86b0:	00 00                	add    %al,(%eax)
    86b2:	00 00                	add    %al,(%eax)
    86b4:	00 00                	add    %al,(%eax)
    86b6:	00 00                	add    %al,(%eax)
    86b8:	00 00                	add    %al,(%eax)
    86ba:	00 00                	add    %al,(%eax)
    86bc:	00 00                	add    %al,(%eax)
    86be:	00 00                	add    %al,(%eax)
    86c0:	00 00                	add    %al,(%eax)
    86c2:	00 00                	add    %al,(%eax)
    86c4:	00 00                	add    %al,(%eax)
    86c6:	00 00                	add    %al,(%eax)
    86c8:	00 00                	add    %al,(%eax)
    86ca:	00 00                	add    %al,(%eax)
    86cc:	00 00                	add    %al,(%eax)
    86ce:	00 00                	add    %al,(%eax)
    86d0:	00 00                	add    %al,(%eax)
    86d2:	00 00                	add    %al,(%eax)
    86d4:	00 00                	add    %al,(%eax)
    86d6:	00 00                	add    %al,(%eax)
    86d8:	00 00                	add    %al,(%eax)
    86da:	00 00                	add    %al,(%eax)
    86dc:	00 00                	add    %al,(%eax)
    86de:	00 00                	add    %al,(%eax)
    86e0:	00 00                	add    %al,(%eax)
    86e2:	00 00                	add    %al,(%eax)
    86e4:	00 00                	add    %al,(%eax)
    86e6:	00 00                	add    %al,(%eax)
    86e8:	00 00                	add    %al,(%eax)
    86ea:	00 00                	add    %al,(%eax)
    86ec:	00 00                	add    %al,(%eax)
    86ee:	00 00                	add    %al,(%eax)
    86f0:	00 00                	add    %al,(%eax)
    86f2:	00 00                	add    %al,(%eax)
    86f4:	00 00                	add    %al,(%eax)
    86f6:	00 00                	add    %al,(%eax)
    86f8:	00 00                	add    %al,(%eax)
    86fa:	00 00                	add    %al,(%eax)
    86fc:	00 00                	add    %al,(%eax)
    86fe:	00 00                	add    %al,(%eax)
    8700:	00 00                	add    %al,(%eax)
    8702:	00 00                	add    %al,(%eax)
    8704:	00 00                	add    %al,(%eax)
    8706:	00 00                	add    %al,(%eax)
    8708:	00 00                	add    %al,(%eax)
    870a:	00 00                	add    %al,(%eax)
    870c:	00 00                	add    %al,(%eax)
    870e:	00 00                	add    %al,(%eax)
    8710:	00 00                	add    %al,(%eax)
    8712:	00 00                	add    %al,(%eax)
    8714:	00 00                	add    %al,(%eax)
    8716:	00 00                	add    %al,(%eax)
    8718:	00 00                	add    %al,(%eax)
    871a:	00 00                	add    %al,(%eax)
    871c:	00 00                	add    %al,(%eax)
    871e:	00 00                	add    %al,(%eax)
    8720:	00 00                	add    %al,(%eax)
    8722:	00 00                	add    %al,(%eax)
    8724:	00 00                	add    %al,(%eax)
    8726:	00 00                	add    %al,(%eax)
    8728:	00 00                	add    %al,(%eax)
    872a:	00 00                	add    %al,(%eax)
    872c:	00 00                	add    %al,(%eax)
    872e:	00 00                	add    %al,(%eax)
    8730:	00 00                	add    %al,(%eax)
    8732:	00 00                	add    %al,(%eax)
    8734:	00 00                	add    %al,(%eax)
    8736:	00 00                	add    %al,(%eax)
    8738:	00 00                	add    %al,(%eax)
    873a:	00 00                	add    %al,(%eax)
    873c:	00 00                	add    %al,(%eax)
    873e:	00 00                	add    %al,(%eax)
    8740:	00 00                	add    %al,(%eax)
    8742:	00 00                	add    %al,(%eax)
    8744:	00 00                	add    %al,(%eax)
    8746:	00 00                	add    %al,(%eax)
    8748:	00 00                	add    %al,(%eax)
    874a:	00 00                	add    %al,(%eax)
    874c:	00 00                	add    %al,(%eax)
    874e:	00 00                	add    %al,(%eax)
    8750:	00 00                	add    %al,(%eax)
    8752:	00 00                	add    %al,(%eax)
    8754:	00 00                	add    %al,(%eax)
    8756:	00 00                	add    %al,(%eax)
    8758:	00 00                	add    %al,(%eax)
    875a:	00 00                	add    %al,(%eax)
    875c:	00 00                	add    %al,(%eax)
    875e:	00 00                	add    %al,(%eax)
    8760:	00 00                	add    %al,(%eax)
    8762:	00 00                	add    %al,(%eax)
    8764:	00 00                	add    %al,(%eax)
    8766:	00 00                	add    %al,(%eax)
    8768:	00 00                	add    %al,(%eax)
    876a:	00 00                	add    %al,(%eax)
    876c:	00 00                	add    %al,(%eax)
    876e:	00 00                	add    %al,(%eax)
    8770:	00 00                	add    %al,(%eax)
    8772:	00 00                	add    %al,(%eax)
    8774:	00 00                	add    %al,(%eax)
    8776:	00 00                	add    %al,(%eax)
    8778:	00 00                	add    %al,(%eax)
    877a:	00 00                	add    %al,(%eax)
    877c:	00 00                	add    %al,(%eax)
    877e:	00 00                	add    %al,(%eax)
    8780:	00 00                	add    %al,(%eax)
    8782:	00 00                	add    %al,(%eax)
    8784:	00 00                	add    %al,(%eax)
    8786:	00 00                	add    %al,(%eax)
    8788:	00 00                	add    %al,(%eax)
    878a:	00 00                	add    %al,(%eax)
    878c:	00 00                	add    %al,(%eax)
    878e:	00 00                	add    %al,(%eax)
    8790:	00 00                	add    %al,(%eax)
    8792:	00 00                	add    %al,(%eax)
    8794:	00 00                	add    %al,(%eax)
    8796:	00 00                	add    %al,(%eax)
    8798:	00 00                	add    %al,(%eax)
    879a:	00 00                	add    %al,(%eax)
    879c:	00 00                	add    %al,(%eax)
    879e:	00 00                	add    %al,(%eax)
    87a0:	00 00                	add    %al,(%eax)
    87a2:	00 00                	add    %al,(%eax)
    87a4:	00 00                	add    %al,(%eax)
    87a6:	00 00                	add    %al,(%eax)
    87a8:	00 00                	add    %al,(%eax)
    87aa:	00 00                	add    %al,(%eax)
    87ac:	00 00                	add    %al,(%eax)
    87ae:	00 00                	add    %al,(%eax)
    87b0:	00 00                	add    %al,(%eax)
    87b2:	00 00                	add    %al,(%eax)
    87b4:	00 00                	add    %al,(%eax)
    87b6:	00 00                	add    %al,(%eax)
    87b8:	00 00                	add    %al,(%eax)
    87ba:	00 00                	add    %al,(%eax)
    87bc:	00 00                	add    %al,(%eax)
    87be:	00 00                	add    %al,(%eax)
    87c0:	00 00                	add    %al,(%eax)
    87c2:	00 00                	add    %al,(%eax)
    87c4:	00 00                	add    %al,(%eax)
    87c6:	00 00                	add    %al,(%eax)
    87c8:	00 00                	add    %al,(%eax)
    87ca:	00 00                	add    %al,(%eax)
    87cc:	00 00                	add    %al,(%eax)
    87ce:	00 00                	add    %al,(%eax)
    87d0:	00 00                	add    %al,(%eax)
    87d2:	00 00                	add    %al,(%eax)
    87d4:	00 00                	add    %al,(%eax)
    87d6:	00 00                	add    %al,(%eax)
    87d8:	00 00                	add    %al,(%eax)
    87da:	00 00                	add    %al,(%eax)
    87dc:	00 00                	add    %al,(%eax)
    87de:	00 00                	add    %al,(%eax)
    87e0:	00 00                	add    %al,(%eax)
    87e2:	00 00                	add    %al,(%eax)
    87e4:	00 00                	add    %al,(%eax)
    87e6:	00 00                	add    %al,(%eax)
    87e8:	00 00                	add    %al,(%eax)
    87ea:	00 00                	add    %al,(%eax)
    87ec:	00 00                	add    %al,(%eax)
    87ee:	00 00                	add    %al,(%eax)
    87f0:	00 00                	add    %al,(%eax)
    87f2:	00 00                	add    %al,(%eax)
    87f4:	00 00                	add    %al,(%eax)
    87f6:	00 00                	add    %al,(%eax)
    87f8:	00 00                	add    %al,(%eax)
    87fa:	00 00                	add    %al,(%eax)
    87fc:	00 00                	add    %al,(%eax)
    87fe:	00 00                	add    %al,(%eax)
    8800:	00 00                	add    %al,(%eax)
    8802:	00 00                	add    %al,(%eax)
    8804:	00 00                	add    %al,(%eax)
    8806:	00 00                	add    %al,(%eax)
    8808:	00 00                	add    %al,(%eax)
    880a:	00 00                	add    %al,(%eax)
    880c:	00 00                	add    %al,(%eax)
    880e:	00 00                	add    %al,(%eax)
    8810:	00 00                	add    %al,(%eax)
    8812:	00 00                	add    %al,(%eax)
    8814:	00 00                	add    %al,(%eax)
    8816:	00 00                	add    %al,(%eax)
    8818:	00 00                	add    %al,(%eax)
    881a:	00 00                	add    %al,(%eax)
    881c:	00 00                	add    %al,(%eax)
    881e:	00 00                	add    %al,(%eax)
    8820:	00 00                	add    %al,(%eax)
    8822:	00 00                	add    %al,(%eax)
    8824:	00 00                	add    %al,(%eax)
    8826:	00 00                	add    %al,(%eax)
    8828:	00 00                	add    %al,(%eax)
    882a:	00 00                	add    %al,(%eax)
    882c:	00 00                	add    %al,(%eax)
    882e:	00 00                	add    %al,(%eax)
    8830:	00 00                	add    %al,(%eax)
    8832:	00 00                	add    %al,(%eax)
    8834:	00 00                	add    %al,(%eax)
    8836:	00 00                	add    %al,(%eax)
    8838:	00 00                	add    %al,(%eax)
    883a:	00 00                	add    %al,(%eax)
    883c:	00 00                	add    %al,(%eax)
    883e:	00 00                	add    %al,(%eax)
    8840:	00 00                	add    %al,(%eax)
    8842:	00 00                	add    %al,(%eax)
    8844:	00 00                	add    %al,(%eax)
    8846:	00 00                	add    %al,(%eax)
    8848:	00 00                	add    %al,(%eax)
    884a:	00 00                	add    %al,(%eax)
    884c:	00 00                	add    %al,(%eax)
    884e:	00 00                	add    %al,(%eax)
    8850:	00 00                	add    %al,(%eax)
    8852:	00 00                	add    %al,(%eax)
    8854:	00 00                	add    %al,(%eax)
    8856:	00 00                	add    %al,(%eax)
    8858:	00 00                	add    %al,(%eax)
    885a:	00 00                	add    %al,(%eax)
    885c:	00 00                	add    %al,(%eax)
    885e:	00 00                	add    %al,(%eax)
    8860:	00 00                	add    %al,(%eax)
    8862:	00 00                	add    %al,(%eax)
    8864:	00 00                	add    %al,(%eax)
    8866:	00 00                	add    %al,(%eax)
    8868:	00 00                	add    %al,(%eax)
    886a:	00 00                	add    %al,(%eax)
    886c:	00 00                	add    %al,(%eax)
    886e:	00 00                	add    %al,(%eax)
    8870:	00 00                	add    %al,(%eax)
    8872:	00 00                	add    %al,(%eax)
    8874:	00 00                	add    %al,(%eax)
    8876:	00 00                	add    %al,(%eax)
    8878:	00 00                	add    %al,(%eax)
    887a:	00 00                	add    %al,(%eax)
    887c:	00 00                	add    %al,(%eax)
    887e:	00 00                	add    %al,(%eax)
    8880:	00 00                	add    %al,(%eax)
    8882:	00 00                	add    %al,(%eax)
    8884:	00 00                	add    %al,(%eax)
    8886:	00 00                	add    %al,(%eax)
    8888:	00 00                	add    %al,(%eax)
    888a:	00 00                	add    %al,(%eax)
    888c:	00 00                	add    %al,(%eax)
    888e:	00 00                	add    %al,(%eax)
    8890:	00 00                	add    %al,(%eax)
    8892:	00 00                	add    %al,(%eax)
    8894:	00 00                	add    %al,(%eax)
    8896:	00 00                	add    %al,(%eax)
    8898:	00 00                	add    %al,(%eax)
    889a:	00 00                	add    %al,(%eax)
    889c:	00 00                	add    %al,(%eax)
    889e:	00 00                	add    %al,(%eax)
    88a0:	00 00                	add    %al,(%eax)
    88a2:	00 00                	add    %al,(%eax)
    88a4:	00 00                	add    %al,(%eax)
    88a6:	00 00                	add    %al,(%eax)
    88a8:	00 00                	add    %al,(%eax)
    88aa:	00 00                	add    %al,(%eax)
    88ac:	00 00                	add    %al,(%eax)
    88ae:	00 00                	add    %al,(%eax)
    88b0:	00 00                	add    %al,(%eax)
    88b2:	00 00                	add    %al,(%eax)
    88b4:	00 00                	add    %al,(%eax)
    88b6:	00 00                	add    %al,(%eax)
    88b8:	00 00                	add    %al,(%eax)
    88ba:	00 00                	add    %al,(%eax)
    88bc:	00 00                	add    %al,(%eax)
    88be:	00 00                	add    %al,(%eax)
    88c0:	00 00                	add    %al,(%eax)
    88c2:	00 00                	add    %al,(%eax)
    88c4:	00 00                	add    %al,(%eax)
    88c6:	00 00                	add    %al,(%eax)
    88c8:	00 00                	add    %al,(%eax)
    88ca:	00 00                	add    %al,(%eax)
    88cc:	00 00                	add    %al,(%eax)
    88ce:	00 00                	add    %al,(%eax)
    88d0:	00 00                	add    %al,(%eax)
    88d2:	00 00                	add    %al,(%eax)
    88d4:	00 00                	add    %al,(%eax)
    88d6:	00 00                	add    %al,(%eax)
    88d8:	00 00                	add    %al,(%eax)
    88da:	00 00                	add    %al,(%eax)
    88dc:	00 00                	add    %al,(%eax)
    88de:	00 00                	add    %al,(%eax)
    88e0:	00 00                	add    %al,(%eax)
    88e2:	00 00                	add    %al,(%eax)
    88e4:	00 00                	add    %al,(%eax)
    88e6:	00 00                	add    %al,(%eax)
    88e8:	00 00                	add    %al,(%eax)
    88ea:	00 00                	add    %al,(%eax)
    88ec:	00 00                	add    %al,(%eax)
    88ee:	00 00                	add    %al,(%eax)
    88f0:	00 00                	add    %al,(%eax)
    88f2:	00 00                	add    %al,(%eax)
    88f4:	00 00                	add    %al,(%eax)
    88f6:	00 00                	add    %al,(%eax)
    88f8:	00 00                	add    %al,(%eax)
    88fa:	00 00                	add    %al,(%eax)
    88fc:	00 00                	add    %al,(%eax)
    88fe:	00 00                	add    %al,(%eax)
    8900:	00 00                	add    %al,(%eax)
    8902:	00 00                	add    %al,(%eax)
    8904:	00 00                	add    %al,(%eax)
    8906:	00 00                	add    %al,(%eax)
    8908:	00 00                	add    %al,(%eax)
    890a:	00 00                	add    %al,(%eax)
    890c:	00 00                	add    %al,(%eax)
    890e:	00 00                	add    %al,(%eax)
    8910:	00 00                	add    %al,(%eax)
    8912:	00 00                	add    %al,(%eax)
    8914:	00 00                	add    %al,(%eax)
    8916:	00 00                	add    %al,(%eax)
    8918:	00 00                	add    %al,(%eax)
    891a:	00 00                	add    %al,(%eax)
    891c:	00 00                	add    %al,(%eax)
    891e:	00 00                	add    %al,(%eax)
    8920:	00 00                	add    %al,(%eax)
    8922:	00 00                	add    %al,(%eax)
    8924:	00 00                	add    %al,(%eax)
    8926:	00 00                	add    %al,(%eax)
    8928:	00 00                	add    %al,(%eax)
    892a:	00 00                	add    %al,(%eax)
    892c:	00 00                	add    %al,(%eax)
    892e:	00 00                	add    %al,(%eax)
    8930:	00 00                	add    %al,(%eax)
    8932:	00 00                	add    %al,(%eax)
    8934:	00 00                	add    %al,(%eax)
    8936:	00 00                	add    %al,(%eax)
    8938:	00 00                	add    %al,(%eax)
    893a:	00 00                	add    %al,(%eax)
    893c:	00 00                	add    %al,(%eax)
    893e:	00 00                	add    %al,(%eax)
    8940:	00 00                	add    %al,(%eax)
    8942:	00 00                	add    %al,(%eax)
    8944:	00 00                	add    %al,(%eax)
    8946:	00 00                	add    %al,(%eax)
    8948:	00 00                	add    %al,(%eax)
    894a:	00 00                	add    %al,(%eax)
    894c:	00 00                	add    %al,(%eax)
    894e:	00 00                	add    %al,(%eax)
    8950:	00 00                	add    %al,(%eax)
    8952:	00 00                	add    %al,(%eax)
    8954:	00 00                	add    %al,(%eax)
    8956:	00 00                	add    %al,(%eax)
    8958:	00 00                	add    %al,(%eax)
    895a:	00 00                	add    %al,(%eax)
    895c:	00 00                	add    %al,(%eax)
    895e:	00 00                	add    %al,(%eax)
    8960:	00 00                	add    %al,(%eax)
    8962:	00 00                	add    %al,(%eax)
    8964:	00 00                	add    %al,(%eax)
    8966:	00 00                	add    %al,(%eax)
    8968:	00 00                	add    %al,(%eax)
    896a:	00 00                	add    %al,(%eax)
    896c:	00 00                	add    %al,(%eax)
    896e:	00 00                	add    %al,(%eax)
    8970:	00 00                	add    %al,(%eax)
    8972:	00 00                	add    %al,(%eax)
    8974:	00 00                	add    %al,(%eax)
    8976:	00 00                	add    %al,(%eax)
    8978:	00 00                	add    %al,(%eax)
    897a:	00 00                	add    %al,(%eax)
    897c:	00 00                	add    %al,(%eax)
    897e:	00 00                	add    %al,(%eax)
    8980:	00 00                	add    %al,(%eax)
    8982:	00 00                	add    %al,(%eax)
    8984:	00 00                	add    %al,(%eax)
    8986:	00 00                	add    %al,(%eax)
    8988:	00 00                	add    %al,(%eax)
    898a:	00 00                	add    %al,(%eax)
    898c:	00 00                	add    %al,(%eax)
    898e:	00 00                	add    %al,(%eax)
    8990:	00 00                	add    %al,(%eax)
    8992:	00 00                	add    %al,(%eax)
    8994:	00 00                	add    %al,(%eax)
    8996:	00 00                	add    %al,(%eax)
    8998:	00 00                	add    %al,(%eax)
    899a:	00 00                	add    %al,(%eax)
    899c:	00 00                	add    %al,(%eax)
    899e:	00 00                	add    %al,(%eax)
    89a0:	00 00                	add    %al,(%eax)
    89a2:	00 00                	add    %al,(%eax)
    89a4:	00 00                	add    %al,(%eax)
    89a6:	00 00                	add    %al,(%eax)
    89a8:	00 00                	add    %al,(%eax)
    89aa:	00 00                	add    %al,(%eax)
    89ac:	00 00                	add    %al,(%eax)
    89ae:	00 00                	add    %al,(%eax)
    89b0:	00 00                	add    %al,(%eax)
    89b2:	00 00                	add    %al,(%eax)
    89b4:	00 00                	add    %al,(%eax)
    89b6:	00 00                	add    %al,(%eax)
    89b8:	00 00                	add    %al,(%eax)
    89ba:	00 00                	add    %al,(%eax)
    89bc:	00 00                	add    %al,(%eax)
    89be:	00 00                	add    %al,(%eax)
    89c0:	00 00                	add    %al,(%eax)
    89c2:	00 00                	add    %al,(%eax)
    89c4:	00 00                	add    %al,(%eax)
    89c6:	00 00                	add    %al,(%eax)
    89c8:	00 00                	add    %al,(%eax)
    89ca:	00 00                	add    %al,(%eax)
    89cc:	00 00                	add    %al,(%eax)
    89ce:	00 00                	add    %al,(%eax)
    89d0:	00 00                	add    %al,(%eax)
    89d2:	00 00                	add    %al,(%eax)
    89d4:	00 00                	add    %al,(%eax)
    89d6:	00 00                	add    %al,(%eax)
    89d8:	00 00                	add    %al,(%eax)
    89da:	00 00                	add    %al,(%eax)
    89dc:	00 00                	add    %al,(%eax)
    89de:	00 00                	add    %al,(%eax)
    89e0:	00 00                	add    %al,(%eax)
    89e2:	00 00                	add    %al,(%eax)
    89e4:	00 00                	add    %al,(%eax)
    89e6:	00 00                	add    %al,(%eax)
    89e8:	00 00                	add    %al,(%eax)
    89ea:	00 00                	add    %al,(%eax)
    89ec:	00 00                	add    %al,(%eax)
    89ee:	00 00                	add    %al,(%eax)
    89f0:	00 00                	add    %al,(%eax)
    89f2:	00 00                	add    %al,(%eax)
    89f4:	00 00                	add    %al,(%eax)
    89f6:	00 00                	add    %al,(%eax)
    89f8:	00 00                	add    %al,(%eax)
    89fa:	00 00                	add    %al,(%eax)
    89fc:	00 00                	add    %al,(%eax)
    89fe:	00 00                	add    %al,(%eax)
    8a00:	00 00                	add    %al,(%eax)
    8a02:	00 00                	add    %al,(%eax)
    8a04:	00 00                	add    %al,(%eax)
    8a06:	00 00                	add    %al,(%eax)
    8a08:	00 00                	add    %al,(%eax)
    8a0a:	00 00                	add    %al,(%eax)
    8a0c:	00 00                	add    %al,(%eax)
    8a0e:	00 00                	add    %al,(%eax)
    8a10:	00 00                	add    %al,(%eax)
    8a12:	00 00                	add    %al,(%eax)
    8a14:	00 00                	add    %al,(%eax)
    8a16:	00 00                	add    %al,(%eax)
    8a18:	00 00                	add    %al,(%eax)
    8a1a:	00 00                	add    %al,(%eax)
    8a1c:	00 00                	add    %al,(%eax)
    8a1e:	00 00                	add    %al,(%eax)
    8a20:	00 00                	add    %al,(%eax)
    8a22:	00 00                	add    %al,(%eax)
    8a24:	00 00                	add    %al,(%eax)
    8a26:	00 00                	add    %al,(%eax)
    8a28:	00 00                	add    %al,(%eax)
    8a2a:	00 00                	add    %al,(%eax)
    8a2c:	00 00                	add    %al,(%eax)
    8a2e:	00 00                	add    %al,(%eax)
    8a30:	00 00                	add    %al,(%eax)
    8a32:	00 00                	add    %al,(%eax)
    8a34:	00 00                	add    %al,(%eax)
    8a36:	00 00                	add    %al,(%eax)
    8a38:	00 00                	add    %al,(%eax)
    8a3a:	00 00                	add    %al,(%eax)
    8a3c:	00 00                	add    %al,(%eax)
    8a3e:	00 00                	add    %al,(%eax)
    8a40:	00 00                	add    %al,(%eax)
    8a42:	00 00                	add    %al,(%eax)
    8a44:	00 00                	add    %al,(%eax)
    8a46:	00 00                	add    %al,(%eax)
    8a48:	00 00                	add    %al,(%eax)
    8a4a:	00 00                	add    %al,(%eax)
    8a4c:	00 00                	add    %al,(%eax)
    8a4e:	00 00                	add    %al,(%eax)
    8a50:	00 00                	add    %al,(%eax)
    8a52:	00 00                	add    %al,(%eax)
    8a54:	00 00                	add    %al,(%eax)
    8a56:	00 00                	add    %al,(%eax)
    8a58:	00 00                	add    %al,(%eax)
    8a5a:	00 00                	add    %al,(%eax)
    8a5c:	00 00                	add    %al,(%eax)
    8a5e:	00 00                	add    %al,(%eax)
    8a60:	00 00                	add    %al,(%eax)
    8a62:	00 00                	add    %al,(%eax)
    8a64:	00 00                	add    %al,(%eax)
    8a66:	00 00                	add    %al,(%eax)
    8a68:	00 00                	add    %al,(%eax)
    8a6a:	00 00                	add    %al,(%eax)
    8a6c:	00 00                	add    %al,(%eax)
    8a6e:	00 00                	add    %al,(%eax)
    8a70:	00 00                	add    %al,(%eax)
    8a72:	00 00                	add    %al,(%eax)
    8a74:	00 00                	add    %al,(%eax)
    8a76:	00 00                	add    %al,(%eax)
    8a78:	00 00                	add    %al,(%eax)
    8a7a:	00 00                	add    %al,(%eax)
    8a7c:	00 00                	add    %al,(%eax)
    8a7e:	00 00                	add    %al,(%eax)
    8a80:	00 00                	add    %al,(%eax)
    8a82:	00 00                	add    %al,(%eax)
    8a84:	00 00                	add    %al,(%eax)
    8a86:	00 00                	add    %al,(%eax)
    8a88:	00 00                	add    %al,(%eax)
    8a8a:	00 00                	add    %al,(%eax)
    8a8c:	00 00                	add    %al,(%eax)
    8a8e:	00 00                	add    %al,(%eax)
    8a90:	00 00                	add    %al,(%eax)
    8a92:	00 00                	add    %al,(%eax)
    8a94:	00 00                	add    %al,(%eax)
    8a96:	00 00                	add    %al,(%eax)
    8a98:	00 00                	add    %al,(%eax)
    8a9a:	00 00                	add    %al,(%eax)
    8a9c:	00 00                	add    %al,(%eax)
    8a9e:	00 00                	add    %al,(%eax)
    8aa0:	00 00                	add    %al,(%eax)
    8aa2:	00 00                	add    %al,(%eax)
    8aa4:	00 00                	add    %al,(%eax)
    8aa6:	00 00                	add    %al,(%eax)
    8aa8:	00 00                	add    %al,(%eax)
    8aaa:	00 00                	add    %al,(%eax)
    8aac:	00 00                	add    %al,(%eax)
    8aae:	00 00                	add    %al,(%eax)
    8ab0:	00 00                	add    %al,(%eax)
    8ab2:	00 00                	add    %al,(%eax)
    8ab4:	00 00                	add    %al,(%eax)
    8ab6:	00 00                	add    %al,(%eax)
    8ab8:	00 00                	add    %al,(%eax)
    8aba:	00 00                	add    %al,(%eax)
    8abc:	00 00                	add    %al,(%eax)
    8abe:	00 00                	add    %al,(%eax)
    8ac0:	00 00                	add    %al,(%eax)
    8ac2:	00 00                	add    %al,(%eax)
    8ac4:	00 00                	add    %al,(%eax)
    8ac6:	00 00                	add    %al,(%eax)
    8ac8:	00 00                	add    %al,(%eax)
    8aca:	00 00                	add    %al,(%eax)
    8acc:	00 00                	add    %al,(%eax)
    8ace:	00 00                	add    %al,(%eax)
    8ad0:	00 00                	add    %al,(%eax)
    8ad2:	00 00                	add    %al,(%eax)
    8ad4:	00 00                	add    %al,(%eax)
    8ad6:	00 00                	add    %al,(%eax)
    8ad8:	00 00                	add    %al,(%eax)
    8ada:	00 00                	add    %al,(%eax)
    8adc:	00 00                	add    %al,(%eax)
    8ade:	00 00                	add    %al,(%eax)
    8ae0:	00 00                	add    %al,(%eax)
    8ae2:	00 00                	add    %al,(%eax)
    8ae4:	00 00                	add    %al,(%eax)
    8ae6:	00 00                	add    %al,(%eax)
    8ae8:	00 00                	add    %al,(%eax)
    8aea:	00 00                	add    %al,(%eax)
    8aec:	00 00                	add    %al,(%eax)
    8aee:	00 00                	add    %al,(%eax)
    8af0:	00 00                	add    %al,(%eax)
    8af2:	00 00                	add    %al,(%eax)
    8af4:	00 00                	add    %al,(%eax)
    8af6:	00 00                	add    %al,(%eax)
    8af8:	00 00                	add    %al,(%eax)
    8afa:	00 00                	add    %al,(%eax)
    8afc:	00 00                	add    %al,(%eax)
    8afe:	00 00                	add    %al,(%eax)
    8b00:	00 00                	add    %al,(%eax)
    8b02:	00 00                	add    %al,(%eax)
    8b04:	00 00                	add    %al,(%eax)
    8b06:	00 00                	add    %al,(%eax)
    8b08:	00 00                	add    %al,(%eax)
    8b0a:	00 00                	add    %al,(%eax)
    8b0c:	00 00                	add    %al,(%eax)
    8b0e:	00 00                	add    %al,(%eax)
    8b10:	00 00                	add    %al,(%eax)
    8b12:	00 00                	add    %al,(%eax)
    8b14:	00 00                	add    %al,(%eax)
    8b16:	00 00                	add    %al,(%eax)
    8b18:	00 00                	add    %al,(%eax)
    8b1a:	00 00                	add    %al,(%eax)
    8b1c:	00 00                	add    %al,(%eax)
    8b1e:	00 00                	add    %al,(%eax)
    8b20:	00 00                	add    %al,(%eax)
    8b22:	00 00                	add    %al,(%eax)
    8b24:	00 00                	add    %al,(%eax)
    8b26:	00 00                	add    %al,(%eax)
    8b28:	00 00                	add    %al,(%eax)
    8b2a:	00 00                	add    %al,(%eax)
    8b2c:	00 00                	add    %al,(%eax)
    8b2e:	00 00                	add    %al,(%eax)
    8b30:	00 00                	add    %al,(%eax)
    8b32:	00 00                	add    %al,(%eax)
    8b34:	00 00                	add    %al,(%eax)
    8b36:	00 00                	add    %al,(%eax)

00008b38 <putc>:
 */
volatile char *video = (volatile char*) 0xB8000;

void
putc (int l, int color, char ch)
{
    8b38:	55                   	push   %ebp
    8b39:	e8 9f 02 00 00       	call   8ddd <__x86.get_pc_thunk.dx>
    8b3e:	81 c2 ae 07 00 00    	add    $0x7ae,%edx
    8b44:	89 e5                	mov    %esp,%ebp
    8b46:	8b 45 08             	mov    0x8(%ebp),%eax
	volatile char * p = video + l * 2;
    8b49:	01 c0                	add    %eax,%eax
    8b4b:	03 82 34 00 00 00    	add    0x34(%edx),%eax
	* p = ch;
    8b51:	8b 55 10             	mov    0x10(%ebp),%edx
    8b54:	88 10                	mov    %dl,(%eax)
	* (p + 1) = color;
    8b56:	8b 55 0c             	mov    0xc(%ebp),%edx
    8b59:	88 50 01             	mov    %dl,0x1(%eax)
}
    8b5c:	5d                   	pop    %ebp
    8b5d:	c3                   	ret    

00008b5e <puts>:


int
puts (int r, int c, int color, const char *string)
{
    8b5e:	55                   	push   %ebp
    8b5f:	89 e5                	mov    %esp,%ebp
    8b61:	56                   	push   %esi
    8b62:	53                   	push   %ebx
	int l = r * 80 + c;
    8b63:	6b 75 08 50          	imul   $0x50,0x8(%ebp),%esi
{
    8b67:	8b 4d 10             	mov    0x10(%ebp),%ecx
	int l = r * 80 + c;
    8b6a:	03 75 0c             	add    0xc(%ebp),%esi
    8b6d:	89 f0                	mov    %esi,%eax
	while (*string != 0)
    8b6f:	8b 55 14             	mov    0x14(%ebp),%edx
    8b72:	29 f2                	sub    %esi,%edx
    8b74:	0f be 14 02          	movsbl (%edx,%eax,1),%edx
    8b78:	84 d2                	test   %dl,%dl
    8b7a:	74 12                	je     8b8e <puts+0x30>
	{
		putc (l++, color, *string++);
    8b7c:	52                   	push   %edx
    8b7d:	8d 58 01             	lea    0x1(%eax),%ebx
    8b80:	51                   	push   %ecx
    8b81:	50                   	push   %eax
    8b82:	e8 b1 ff ff ff       	call   8b38 <putc>
    8b87:	83 c4 0c             	add    $0xc,%esp
    8b8a:	89 d8                	mov    %ebx,%eax
    8b8c:	eb e1                	jmp    8b6f <puts+0x11>
	}
	return l;
}
    8b8e:	8d 65 f8             	lea    -0x8(%ebp),%esp
    8b91:	5b                   	pop    %ebx
    8b92:	5e                   	pop    %esi
    8b93:	5d                   	pop    %ebp
    8b94:	c3                   	ret    

00008b95 <putline>:
char * blank =
"                                                                                ";

void
putline (char * s)
{
    8b95:	e8 3f 02 00 00       	call   8dd9 <__x86.get_pc_thunk.ax>
    8b9a:	05 52 07 00 00       	add    $0x752,%eax
    8b9f:	55                   	push   %ebp
	puts (row = (row >= CRT_ROWS) ? 0 : row + 1, 0, VGA_CLR_BLACK, blank);
    8ba0:	8b 90 dc 00 00 00    	mov    0xdc(%eax),%edx
    8ba6:	8b 88 38 00 00 00    	mov    0x38(%eax),%ecx
{
    8bac:	89 e5                	mov    %esp,%ebp
    8bae:	53                   	push   %ebx
	puts (row = (row >= CRT_ROWS) ? 0 : row + 1, 0, VGA_CLR_BLACK, blank);
    8baf:	83 fa 18             	cmp    $0x18,%edx
    8bb2:	8d 5a 01             	lea    0x1(%edx),%ebx
    8bb5:	7e 02                	jle    8bb9 <putline+0x24>
    8bb7:	31 db                	xor    %ebx,%ebx
    8bb9:	51                   	push   %ecx
    8bba:	6a 00                	push   $0x0
    8bbc:	6a 00                	push   $0x0
    8bbe:	53                   	push   %ebx
    8bbf:	89 98 dc 00 00 00    	mov    %ebx,0xdc(%eax)
    8bc5:	e8 94 ff ff ff       	call   8b5e <puts>
	puts (row, 0, VGA_CLR_WHITE, s);
    8bca:	ff 75 08             	pushl  0x8(%ebp)
    8bcd:	6a 0f                	push   $0xf
    8bcf:	6a 00                	push   $0x0
    8bd1:	53                   	push   %ebx
    8bd2:	e8 87 ff ff ff       	call   8b5e <puts>
}
    8bd7:	83 c4 20             	add    $0x20,%esp
    8bda:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    8bdd:	c9                   	leave  
    8bde:	c3                   	ret    

00008bdf <roll>:

void
roll (int r)
{
    8bdf:	55                   	push   %ebp
    8be0:	e8 f4 01 00 00       	call   8dd9 <__x86.get_pc_thunk.ax>
    8be5:	05 07 07 00 00       	add    $0x707,%eax
    8bea:	89 e5                	mov    %esp,%ebp
	row = r;
    8bec:	8b 55 08             	mov    0x8(%ebp),%edx
}
    8bef:	5d                   	pop    %ebp
	row = r;
    8bf0:	89 90 dc 00 00 00    	mov    %edx,0xdc(%eax)
}
    8bf6:	c3                   	ret    

00008bf7 <panic>:

void
panic (char * m)
{
    8bf7:	55                   	push   %ebp
    8bf8:	89 e5                	mov    %esp,%ebp
	puts (0, 0, VGA_CLR_RED, m);
    8bfa:	ff 75 08             	pushl  0x8(%ebp)
    8bfd:	6a 04                	push   $0x4
    8bff:	6a 00                	push   $0x0
    8c01:	6a 00                	push   $0x0
    8c03:	e8 56 ff ff ff       	call   8b5e <puts>
    8c08:	83 c4 10             	add    $0x10,%esp
	while (1)
	{
		asm volatile("hlt");
    8c0b:	f4                   	hlt    
    8c0c:	eb fd                	jmp    8c0b <panic+0x14>

00008c0e <strlen>:
 * string
 */

int
strlen (const char *s)
{
    8c0e:	55                   	push   %ebp
	int n;

	for (n = 0; *s != '\0'; s++)
    8c0f:	31 c0                	xor    %eax,%eax
{
    8c11:	89 e5                	mov    %esp,%ebp
    8c13:	8b 55 08             	mov    0x8(%ebp),%edx
	for (n = 0; *s != '\0'; s++)
    8c16:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
    8c1a:	74 03                	je     8c1f <strlen+0x11>
		n++;
    8c1c:	40                   	inc    %eax
    8c1d:	eb f7                	jmp    8c16 <strlen+0x8>
	return n;
}
    8c1f:	5d                   	pop    %ebp
    8c20:	c3                   	ret    

00008c21 <reverse>:

/* reverse:  reverse string s in place */
void
reverse (char s[])
{
    8c21:	55                   	push   %ebp
    8c22:	89 e5                	mov    %esp,%ebp
    8c24:	56                   	push   %esi
    8c25:	53                   	push   %ebx
    8c26:	8b 4d 08             	mov    0x8(%ebp),%ecx
	int i, j;
	char c;

	for (i = 0, j = strlen (s) - 1; i < j; i++, j--)
    8c29:	51                   	push   %ecx
    8c2a:	e8 df ff ff ff       	call   8c0e <strlen>
    8c2f:	5a                   	pop    %edx
    8c30:	48                   	dec    %eax
    8c31:	31 d2                	xor    %edx,%edx
    8c33:	39 c2                	cmp    %eax,%edx
    8c35:	7d 13                	jge    8c4a <reverse+0x29>
	{
		c = s[i];
    8c37:	0f b6 34 11          	movzbl (%ecx,%edx,1),%esi
		s[i] = s[j];
    8c3b:	8a 1c 01             	mov    (%ecx,%eax,1),%bl
    8c3e:	88 1c 11             	mov    %bl,(%ecx,%edx,1)
	for (i = 0, j = strlen (s) - 1; i < j; i++, j--)
    8c41:	42                   	inc    %edx
		s[j] = c;
    8c42:	89 f3                	mov    %esi,%ebx
    8c44:	88 1c 01             	mov    %bl,(%ecx,%eax,1)
	for (i = 0, j = strlen (s) - 1; i < j; i++, j--)
    8c47:	48                   	dec    %eax
    8c48:	eb e9                	jmp    8c33 <reverse+0x12>
	}
}
    8c4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    8c4d:	5b                   	pop    %ebx
    8c4e:	5e                   	pop    %esi
    8c4f:	5d                   	pop    %ebp
    8c50:	c3                   	ret    

00008c51 <itox>:

/* itoa:  convert n to characters in s */
void
itox (int n, char s[], int root, char * table)
{
    8c51:	55                   	push   %ebp
    8c52:	89 e5                	mov    %esp,%ebp
    8c54:	57                   	push   %edi
    8c55:	56                   	push   %esi
    8c56:	53                   	push   %ebx
    8c57:	31 db                	xor    %ebx,%ebx
    8c59:	83 ec 08             	sub    $0x8,%esp
    8c5c:	8b 45 08             	mov    0x8(%ebp),%eax
    8c5f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    8c62:	8b 75 14             	mov    0x14(%ebp),%esi
    8c65:	89 45 f0             	mov    %eax,-0x10(%ebp)
    8c68:	8b 45 10             	mov    0x10(%ebp),%eax
    8c6b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    8c6e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    8c71:	8b 45 f0             	mov    -0x10(%ebp),%eax
    8c74:	c1 fa 1f             	sar    $0x1f,%edx
    8c77:	31 d0                	xor    %edx,%eax
    8c79:	29 d0                	sub    %edx,%eax
    8c7b:	99                   	cltd   
	if ((sign = n) < 0) /* record sign */
		n = -n; /* make n positive */
	i = 0;
	do
	{ /* generate digits in reverse order */
		s[i++] = table[n % root]; /* get next digit */
    8c7c:	8d 7b 01             	lea    0x1(%ebx),%edi
    8c7f:	f7 7d ec             	idivl  -0x14(%ebp)
    8c82:	8a 14 16             	mov    (%esi,%edx,1),%dl
	} while ((n /= root) > 0); /* delete it */
    8c85:	85 c0                	test   %eax,%eax
		s[i++] = table[n % root]; /* get next digit */
    8c87:	88 54 39 ff          	mov    %dl,-0x1(%ecx,%edi,1)
    8c8b:	89 fa                	mov    %edi,%edx
	} while ((n /= root) > 0); /* delete it */
    8c8d:	7e 04                	jle    8c93 <itox+0x42>
		s[i++] = table[n % root]; /* get next digit */
    8c8f:	89 fb                	mov    %edi,%ebx
    8c91:	eb e8                	jmp    8c7b <itox+0x2a>
	if (sign < 0)
    8c93:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    8c97:	79 07                	jns    8ca0 <itox+0x4f>
		s[i++] = '-';
    8c99:	8d 7b 02             	lea    0x2(%ebx),%edi
    8c9c:	c6 04 11 2d          	movb   $0x2d,(%ecx,%edx,1)
	s[i] = '\0';
    8ca0:	c6 04 39 00          	movb   $0x0,(%ecx,%edi,1)
	reverse (s);
    8ca4:	89 4d 08             	mov    %ecx,0x8(%ebp)
}
    8ca7:	58                   	pop    %eax
    8ca8:	5a                   	pop    %edx
    8ca9:	5b                   	pop    %ebx
    8caa:	5e                   	pop    %esi
    8cab:	5f                   	pop    %edi
    8cac:	5d                   	pop    %ebp
	reverse (s);
    8cad:	e9 6f ff ff ff       	jmp    8c21 <reverse>

00008cb2 <itoa>:

void
itoa (int n, char s[])
{
    8cb2:	e8 22 01 00 00       	call   8dd9 <__x86.get_pc_thunk.ax>
    8cb7:	05 35 06 00 00       	add    $0x635,%eax
    8cbc:	55                   	push   %ebp
	static char dec[] = "0123456789";
	itox(n, s, 10, dec);
    8cbd:	8d 80 28 00 00 00    	lea    0x28(%eax),%eax
{
    8cc3:	89 e5                	mov    %esp,%ebp
	itox(n, s, 10, dec);
    8cc5:	50                   	push   %eax
    8cc6:	6a 0a                	push   $0xa
    8cc8:	ff 75 0c             	pushl  0xc(%ebp)
    8ccb:	ff 75 08             	pushl  0x8(%ebp)
    8cce:	e8 7e ff ff ff       	call   8c51 <itox>
}
    8cd3:	83 c4 10             	add    $0x10,%esp
    8cd6:	c9                   	leave  
    8cd7:	c3                   	ret    

00008cd8 <itoh>:


void
itoh (int n, char* s)
{
    8cd8:	e8 fc 00 00 00       	call   8dd9 <__x86.get_pc_thunk.ax>
    8cdd:	05 0f 06 00 00       	add    $0x60f,%eax
    8ce2:	55                   	push   %ebp
	static char hex[] = "0123456789abcdef";
	itox(n, s, 16, hex);
    8ce3:	8d 80 14 00 00 00    	lea    0x14(%eax),%eax
{
    8ce9:	89 e5                	mov    %esp,%ebp
	itox(n, s, 16, hex);
    8ceb:	50                   	push   %eax
    8cec:	6a 10                	push   $0x10
    8cee:	ff 75 0c             	pushl  0xc(%ebp)
    8cf1:	ff 75 08             	pushl  0x8(%ebp)
    8cf4:	e8 58 ff ff ff       	call   8c51 <itox>
}
    8cf9:	83 c4 10             	add    $0x10,%esp
    8cfc:	c9                   	leave  
    8cfd:	c3                   	ret    

00008cfe <puti>:
{
    8cfe:	55                   	push   %ebp
    8cff:	e8 d5 00 00 00       	call   8dd9 <__x86.get_pc_thunk.ax>
    8d04:	05 e8 05 00 00       	add    $0x5e8,%eax
    8d09:	89 e5                	mov    %esp,%ebp
    8d0b:	53                   	push   %ebx
	itoh (i, puti_str);
    8d0c:	8d 98 b4 00 00 00    	lea    0xb4(%eax),%ebx
    8d12:	53                   	push   %ebx
    8d13:	ff 75 08             	pushl  0x8(%ebp)
    8d16:	e8 bd ff ff ff       	call   8cd8 <itoh>
	putline (puti_str);
    8d1b:	58                   	pop    %eax
    8d1c:	5a                   	pop    %edx
    8d1d:	89 5d 08             	mov    %ebx,0x8(%ebp)
}
    8d20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    8d23:	c9                   	leave  
	putline (puti_str);
    8d24:	e9 6c fe ff ff       	jmp    8b95 <putline>

00008d29 <readsector>:
		/* do nothing */;
}

void
readsector (void *dst, uint32_t offset)
{
    8d29:	55                   	push   %ebp
    8d2a:	89 e5                	mov    %esp,%ebp
    8d2c:	57                   	push   %edi

static inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
    8d2d:	bf f7 01 00 00       	mov    $0x1f7,%edi
    8d32:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    8d35:	89 fa                	mov    %edi,%edx
    8d37:	ec                   	in     (%dx),%al
	while ((inb (0x1F7) & 0xC0) != 0x40)
    8d38:	83 e0 c0             	and    $0xffffffc0,%eax
    8d3b:	3c 40                	cmp    $0x40,%al
    8d3d:	75 f6                	jne    8d35 <readsector+0xc>
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
    8d3f:	b0 01                	mov    $0x1,%al
    8d41:	ba f2 01 00 00       	mov    $0x1f2,%edx
    8d46:	ee                   	out    %al,(%dx)
    8d47:	ba f3 01 00 00       	mov    $0x1f3,%edx
    8d4c:	88 c8                	mov    %cl,%al
    8d4e:	ee                   	out    %al,(%dx)
	// wait for disk to be ready
	waitdisk ();

	outb (0x1F2, 1);		// count = 1
	outb (0x1F3, offset);
	outb (0x1F4, offset >> 8);
    8d4f:	89 c8                	mov    %ecx,%eax
    8d51:	ba f4 01 00 00       	mov    $0x1f4,%edx
    8d56:	c1 e8 08             	shr    $0x8,%eax
    8d59:	ee                   	out    %al,(%dx)
	outb (0x1F5, offset >> 16);
    8d5a:	89 c8                	mov    %ecx,%eax
    8d5c:	ba f5 01 00 00       	mov    $0x1f5,%edx
    8d61:	c1 e8 10             	shr    $0x10,%eax
    8d64:	ee                   	out    %al,(%dx)
	outb (0x1F6, (offset >> 24) | 0xE0);
    8d65:	89 c8                	mov    %ecx,%eax
    8d67:	ba f6 01 00 00       	mov    $0x1f6,%edx
    8d6c:	c1 e8 18             	shr    $0x18,%eax
    8d6f:	83 c8 e0             	or     $0xffffffe0,%eax
    8d72:	ee                   	out    %al,(%dx)
    8d73:	b0 20                	mov    $0x20,%al
    8d75:	89 fa                	mov    %edi,%edx
    8d77:	ee                   	out    %al,(%dx)
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
    8d78:	ba f7 01 00 00       	mov    $0x1f7,%edx
    8d7d:	ec                   	in     (%dx),%al
	while ((inb (0x1F7) & 0xC0) != 0x40)
    8d7e:	83 e0 c0             	and    $0xffffffc0,%eax
    8d81:	3c 40                	cmp    $0x40,%al
    8d83:	75 f8                	jne    8d7d <readsector+0x54>
}

static inline void
insl(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsl"			:
    8d85:	8b 7d 08             	mov    0x8(%ebp),%edi
    8d88:	b9 80 00 00 00       	mov    $0x80,%ecx
    8d8d:	ba f0 01 00 00       	mov    $0x1f0,%edx
    8d92:	fc                   	cld    
    8d93:	f2 6d                	repnz insl (%dx),%es:(%edi)
	// wait for disk to be ready
	waitdisk ();

	// read a sector
	insl (0x1F0, dst, SECTOR_SIZE / 4);
}
    8d95:	5f                   	pop    %edi
    8d96:	5d                   	pop    %ebp
    8d97:	c3                   	ret    

00008d98 <readsection>:

// Read 'count' bytes at 'offset' from kernel into virtual address 'va'.
// Might copy more than asked
void
readsection (uint32_t va, uint32_t count, uint32_t offset, uint32_t lba)
{
    8d98:	55                   	push   %ebp
    8d99:	89 e5                	mov    %esp,%ebp
    8d9b:	57                   	push   %edi
    8d9c:	56                   	push   %esi
    8d9d:	53                   	push   %ebx
    8d9e:	8b 5d 08             	mov    0x8(%ebp),%ebx
	end_va = va + count;
	// round down to sector boundary
	va &= ~(SECTOR_SIZE - 1);

	// translate from bytes to sectors, and kernel starts at sector 1
	offset = (offset / SECTOR_SIZE) + lba;
    8da1:	8b 7d 10             	mov    0x10(%ebp),%edi
	va &= 0xFFFFFF;
    8da4:	89 de                	mov    %ebx,%esi
	va &= ~(SECTOR_SIZE - 1);
    8da6:	81 e3 00 fe ff 00    	and    $0xfffe00,%ebx
	va &= 0xFFFFFF;
    8dac:	81 e6 ff ff ff 00    	and    $0xffffff,%esi
	offset = (offset / SECTOR_SIZE) + lba;
    8db2:	c1 ef 09             	shr    $0x9,%edi
	end_va = va + count;
    8db5:	03 75 0c             	add    0xc(%ebp),%esi
	offset = (offset / SECTOR_SIZE) + lba;
    8db8:	03 7d 14             	add    0x14(%ebp),%edi

	// If this is too slow, we could read lots of sectors at a time.
	// We'd write more to memory than asked, but it doesn't matter --
	// we load in increasing order.
	while (va < end_va)
    8dbb:	39 f3                	cmp    %esi,%ebx
    8dbd:	73 12                	jae    8dd1 <readsection+0x39>
	{
		readsector ((uint8_t*) va, offset);
    8dbf:	57                   	push   %edi
    8dc0:	53                   	push   %ebx
		va += SECTOR_SIZE;
		offset++;
    8dc1:	47                   	inc    %edi
		va += SECTOR_SIZE;
    8dc2:	81 c3 00 02 00 00    	add    $0x200,%ebx
		readsector ((uint8_t*) va, offset);
    8dc8:	e8 5c ff ff ff       	call   8d29 <readsector>
		offset++;
    8dcd:	58                   	pop    %eax
    8dce:	5a                   	pop    %edx
    8dcf:	eb ea                	jmp    8dbb <readsection+0x23>
	}
}
    8dd1:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8dd4:	5b                   	pop    %ebx
    8dd5:	5e                   	pop    %esi
    8dd6:	5f                   	pop    %edi
    8dd7:	5d                   	pop    %ebp
    8dd8:	c3                   	ret    

00008dd9 <__x86.get_pc_thunk.ax>:
    8dd9:	8b 04 24             	mov    (%esp),%eax
    8ddc:	c3                   	ret    

00008ddd <__x86.get_pc_thunk.dx>:
    8ddd:	8b 14 24             	mov    (%esp),%edx
    8de0:	c3                   	ret    

00008de1 <load_kernel>:

#define ELFHDR		((elfhdr *) 0x20000)

uint32_t
load_kernel(uint32_t dkernel)
{
    8de1:	55                   	push   %ebp
    8de2:	89 e5                	mov    %esp,%ebp
    8de4:	57                   	push   %edi
    8de5:	56                   	push   %esi
    8de6:	53                   	push   %ebx
    8de7:	e8 8c 01 00 00       	call   8f78 <__x86.get_pc_thunk.bx>
    8dec:	81 c3 00 05 00 00    	add    $0x500,%ebx
    8df2:	83 ec 0c             	sub    $0xc,%esp
	// load kernel from the beginning of the first bootable partition
	proghdr *ph, *eph;

	readsection((uint32_t) ELFHDR, SECTOR_SIZE * 8, 0, dkernel);
    8df5:	ff 75 08             	pushl  0x8(%ebp)
    8df8:	6a 00                	push   $0x0
    8dfa:	68 00 10 00 00       	push   $0x1000
    8dff:	68 00 00 02 00       	push   $0x20000
    8e04:	e8 8f ff ff ff       	call   8d98 <readsection>

	// is this a valid ELF?
	if (ELFHDR->e_magic != ELF_MAGIC)
    8e09:	83 c4 10             	add    $0x10,%esp
    8e0c:	81 3d 00 00 02 00 7f 	cmpl   $0x464c457f,0x20000
    8e13:	45 4c 46 
    8e16:	74 12                	je     8e2a <load_kernel+0x49>
		panic ("Kernel is not a valid elf.");
    8e18:	8d 83 f1 fc ff ff    	lea    -0x30f(%ebx),%eax
    8e1e:	83 ec 0c             	sub    $0xc,%esp
    8e21:	50                   	push   %eax
    8e22:	e8 d0 fd ff ff       	call   8bf7 <panic>
    8e27:	83 c4 10             	add    $0x10,%esp

	// load each program segment (ignores ph flags)
	ph = (proghdr *) ((uint8_t *) ELFHDR + ELFHDR->e_phoff);
    8e2a:	a1 1c 00 02 00       	mov    0x2001c,%eax
	eph = ph + ELFHDR->e_phnum;
    8e2f:	0f b7 35 2c 00 02 00 	movzwl 0x2002c,%esi
	ph = (proghdr *) ((uint8_t *) ELFHDR + ELFHDR->e_phoff);
    8e36:	8d b8 00 00 02 00    	lea    0x20000(%eax),%edi
	eph = ph + ELFHDR->e_phnum;
    8e3c:	c1 e6 05             	shl    $0x5,%esi
    8e3f:	01 fe                	add    %edi,%esi

	for (; ph < eph; ph++)
    8e41:	39 f7                	cmp    %esi,%edi
    8e43:	73 19                	jae    8e5e <load_kernel+0x7d>
	{
		readsection(ph->p_va, ph->p_memsz, ph->p_offset, dkernel);
    8e45:	ff 75 08             	pushl  0x8(%ebp)
    8e48:	ff 77 04             	pushl  0x4(%edi)
	for (; ph < eph; ph++)
    8e4b:	83 c7 20             	add    $0x20,%edi
		readsection(ph->p_va, ph->p_memsz, ph->p_offset, dkernel);
    8e4e:	ff 77 f4             	pushl  -0xc(%edi)
    8e51:	ff 77 e8             	pushl  -0x18(%edi)
    8e54:	e8 3f ff ff ff       	call   8d98 <readsection>
	for (; ph < eph; ph++)
    8e59:	83 c4 10             	add    $0x10,%esp
    8e5c:	eb e3                	jmp    8e41 <load_kernel+0x60>
	}

	return (ELFHDR->e_entry & 0xFFFFFF);
    8e5e:	a1 18 00 02 00       	mov    0x20018,%eax
}
    8e63:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8e66:	5b                   	pop    %ebx
	return (ELFHDR->e_entry & 0xFFFFFF);
    8e67:	25 ff ff ff 00       	and    $0xffffff,%eax
}
    8e6c:	5e                   	pop    %esi
    8e6d:	5f                   	pop    %edi
    8e6e:	5d                   	pop    %ebp
    8e6f:	c3                   	ret    

00008e70 <parse_e820>:

mboot_info_t *
parse_e820 (bios_smap_t *smap)
{
    8e70:	55                   	push   %ebp
    8e71:	89 e5                	mov    %esp,%ebp
    8e73:	57                   	push   %edi
    8e74:	56                   	push   %esi
    8e75:	53                   	push   %ebx
	bios_smap_t *p;
	uint32_t mmap_len;
	p = smap;
	mmap_len = 0;
    8e76:	31 f6                	xor    %esi,%esi
    8e78:	e8 fb 00 00 00       	call   8f78 <__x86.get_pc_thunk.bx>
    8e7d:	81 c3 6f 04 00 00    	add    $0x46f,%ebx
{
    8e83:	83 ec 18             	sub    $0x18,%esp
    8e86:	8b 7d 08             	mov    0x8(%ebp),%edi
	putline ("* E820 Memory Map *");
    8e89:	8d 83 0c fd ff ff    	lea    -0x2f4(%ebx),%eax
    8e8f:	50                   	push   %eax
    8e90:	e8 00 fd ff ff       	call   8b95 <putline>
	while (p->base_addr != 0 || p->length != 0 || p->type != 0)
    8e95:	83 c4 10             	add    $0x10,%esp
    8e98:	8b 44 37 04          	mov    0x4(%edi,%esi,1),%eax
    8e9c:	89 c1                	mov    %eax,%ecx
    8e9e:	0b 4c 37 08          	or     0x8(%edi,%esi,1),%ecx
    8ea2:	74 11                	je     8eb5 <parse_e820+0x45>
	{
		puti (p->base_addr);
    8ea4:	83 ec 0c             	sub    $0xc,%esp
		p ++;
		mmap_len += sizeof(bios_smap_t);
    8ea7:	83 c6 18             	add    $0x18,%esi
		puti (p->base_addr);
    8eaa:	50                   	push   %eax
    8eab:	e8 4e fe ff ff       	call   8cfe <puti>
		mmap_len += sizeof(bios_smap_t);
    8eb0:	83 c4 10             	add    $0x10,%esp
    8eb3:	eb e3                	jmp    8e98 <parse_e820+0x28>
	while (p->base_addr != 0 || p->length != 0 || p->type != 0)
    8eb5:	8b 54 37 10          	mov    0x10(%edi,%esi,1),%edx
    8eb9:	0b 54 37 0c          	or     0xc(%edi,%esi,1),%edx
    8ebd:	75 e5                	jne    8ea4 <parse_e820+0x34>
    8ebf:	83 7c 37 14 00       	cmpl   $0x0,0x14(%edi,%esi,1)
    8ec4:	75 de                	jne    8ea4 <parse_e820+0x34>
	}
	mboot_info.mmap_length = mmap_len;
    8ec6:	89 b3 80 00 00 00    	mov    %esi,0x80(%ebx)
	mboot_info.mmap_addr = (uint32_t) smap;
    8ecc:	89 bb 84 00 00 00    	mov    %edi,0x84(%ebx)
	return &mboot_info;
}
    8ed2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8ed5:	8d 83 54 00 00 00    	lea    0x54(%ebx),%eax
    8edb:	5b                   	pop    %ebx
    8edc:	5e                   	pop    %esi
    8edd:	5f                   	pop    %edi
    8ede:	5d                   	pop    %ebp
    8edf:	c3                   	ret    

00008ee0 <boot1main>:
{
    8ee0:	55                   	push   %ebp
    8ee1:	89 e5                	mov    %esp,%ebp
    8ee3:	57                   	push   %edi
    8ee4:	56                   	push   %esi
    8ee5:	53                   	push   %ebx
	int i = 0;
    8ee6:	31 f6                	xor    %esi,%esi
    8ee8:	e8 8b 00 00 00       	call   8f78 <__x86.get_pc_thunk.bx>
    8eed:	81 c3 ff 03 00 00    	add    $0x3ff,%ebx
{
    8ef3:	83 ec 18             	sub    $0x18,%esp
    8ef6:	8b 7d 0c             	mov    0xc(%ebp),%edi
	roll(3);
    8ef9:	6a 03                	push   $0x3
    8efb:	e8 df fc ff ff       	call   8bdf <roll>
	putline("Start boot1 main ...");
    8f00:	8d 83 20 fd ff ff    	lea    -0x2e0(%ebx),%eax
    8f06:	89 04 24             	mov    %eax,(%esp)
    8f09:	e8 87 fc ff ff       	call   8b95 <putline>
    8f0e:	83 c4 10             	add    $0x10,%esp
		if(mbr->partition[i].bootable == BOOTABLE_PARTITION)
    8f11:	89 f0                	mov    %esi,%eax
    8f13:	c1 e0 04             	shl    $0x4,%eax
    8f16:	80 bc 07 be 01 00 00 	cmpb   $0x80,0x1be(%edi,%eax,1)
    8f1d:	80 
    8f1e:	74 18                	je     8f38 <boot1main+0x58>
		i++;
    8f20:	46                   	inc    %esi
	while(i < 4){
    8f21:	83 fe 04             	cmp    $0x4,%esi
    8f24:	75 eb                	jne    8f11 <boot1main+0x31>
		panic("Kernel Panic");
    8f26:	8d 83 4a fd ff ff    	lea    -0x2b6(%ebx),%eax
    8f2c:	83 ec 0c             	sub    $0xc,%esp
    8f2f:	50                   	push   %eax
    8f30:	e8 c2 fc ff ff       	call   8bf7 <panic>
    8f35:	83 c4 10             	add    $0x10,%esp
	parse_e820(smap);
    8f38:	83 ec 0c             	sub    $0xc,%esp
    8f3b:	ff 75 10             	pushl  0x10(%ebp)
	exec_kernel(load_kernel(mbr->partition[i].first_lba), &mboot_info);
    8f3e:	83 c6 1b             	add    $0x1b,%esi
    8f41:	c1 e6 04             	shl    $0x4,%esi
	parse_e820(smap);
    8f44:	e8 27 ff ff ff       	call   8e70 <parse_e820>
	exec_kernel(load_kernel(mbr->partition[i].first_lba), &mboot_info);
    8f49:	58                   	pop    %eax
    8f4a:	ff 74 37 16          	pushl  0x16(%edi,%esi,1)
    8f4e:	e8 8e fe ff ff       	call   8de1 <load_kernel>
    8f53:	5a                   	pop    %edx
    8f54:	8d 93 54 00 00 00    	lea    0x54(%ebx),%edx
    8f5a:	59                   	pop    %ecx
    8f5b:	52                   	push   %edx
    8f5c:	50                   	push   %eax
    8f5d:	e8 1a 00 00 00       	call   8f7c <exec_kernel>
	panic ("Fail to load kernel.");
    8f62:	8d 83 35 fd ff ff    	lea    -0x2cb(%ebx),%eax
    8f68:	89 04 24             	mov    %eax,(%esp)
    8f6b:	e8 87 fc ff ff       	call   8bf7 <panic>
}
    8f70:	8d 65 f4             	lea    -0xc(%ebp),%esp
    8f73:	5b                   	pop    %ebx
    8f74:	5e                   	pop    %esi
    8f75:	5f                   	pop    %edi
    8f76:	5d                   	pop    %ebp
    8f77:	c3                   	ret    

00008f78 <__x86.get_pc_thunk.bx>:
    8f78:	8b 1c 24             	mov    (%esp),%ebx
    8f7b:	c3                   	ret    

00008f7c <exec_kernel>:
	.set  MBOOT_INFO_MAGIC, 0x2badb002

	.globl	exec_kernel
	.code32
exec_kernel:
	cli
    8f7c:	fa                   	cli    
	movl	$MBOOT_INFO_MAGIC, %eax
    8f7d:	b8 02 b0 ad 2b       	mov    $0x2badb002,%eax
	movl	8(%esp), %ebx
    8f82:	8b 5c 24 08          	mov    0x8(%esp),%ebx
	movl	4(%esp), %edx
    8f86:	8b 54 24 04          	mov    0x4(%esp),%edx
	jmp	*%edx
    8f8a:	ff e2                	jmp    *%edx

Disassembly of section .rodata:

00008f8c <.rodata>:
    8f8c:	20 20                	and    %ah,(%eax)
    8f8e:	20 20                	and    %ah,(%eax)
    8f90:	20 20                	and    %ah,(%eax)
    8f92:	20 20                	and    %ah,(%eax)
    8f94:	20 20                	and    %ah,(%eax)
    8f96:	20 20                	and    %ah,(%eax)
    8f98:	20 20                	and    %ah,(%eax)
    8f9a:	20 20                	and    %ah,(%eax)
    8f9c:	20 20                	and    %ah,(%eax)
    8f9e:	20 20                	and    %ah,(%eax)
    8fa0:	20 20                	and    %ah,(%eax)
    8fa2:	20 20                	and    %ah,(%eax)
    8fa4:	20 20                	and    %ah,(%eax)
    8fa6:	20 20                	and    %ah,(%eax)
    8fa8:	20 20                	and    %ah,(%eax)
    8faa:	20 20                	and    %ah,(%eax)
    8fac:	20 20                	and    %ah,(%eax)
    8fae:	20 20                	and    %ah,(%eax)
    8fb0:	20 20                	and    %ah,(%eax)
    8fb2:	20 20                	and    %ah,(%eax)
    8fb4:	20 20                	and    %ah,(%eax)
    8fb6:	20 20                	and    %ah,(%eax)
    8fb8:	20 20                	and    %ah,(%eax)
    8fba:	20 20                	and    %ah,(%eax)
    8fbc:	20 20                	and    %ah,(%eax)
    8fbe:	20 20                	and    %ah,(%eax)
    8fc0:	20 20                	and    %ah,(%eax)
    8fc2:	20 20                	and    %ah,(%eax)
    8fc4:	20 20                	and    %ah,(%eax)
    8fc6:	20 20                	and    %ah,(%eax)
    8fc8:	20 20                	and    %ah,(%eax)
    8fca:	20 20                	and    %ah,(%eax)
    8fcc:	20 20                	and    %ah,(%eax)
    8fce:	20 20                	and    %ah,(%eax)
    8fd0:	20 20                	and    %ah,(%eax)
    8fd2:	20 20                	and    %ah,(%eax)
    8fd4:	20 20                	and    %ah,(%eax)
    8fd6:	20 20                	and    %ah,(%eax)
    8fd8:	20 20                	and    %ah,(%eax)
    8fda:	20 20                	and    %ah,(%eax)
    8fdc:	00 4b 65             	add    %cl,0x65(%ebx)
    8fdf:	72 6e                	jb     904f <exec_kernel+0xd3>
    8fe1:	65 6c                	gs insb (%dx),%es:(%edi)
    8fe3:	20 69 73             	and    %ch,0x73(%ecx)
    8fe6:	20 6e 6f             	and    %ch,0x6f(%esi)
    8fe9:	74 20                	je     900b <exec_kernel+0x8f>
    8feb:	61                   	popa   
    8fec:	20 76 61             	and    %dh,0x61(%esi)
    8fef:	6c                   	insb   (%dx),%es:(%edi)
    8ff0:	69 64 20 65 6c 66 2e 	imul   $0x2e666c,0x65(%eax,%eiz,1),%esp
    8ff7:	00 
    8ff8:	2a 20                	sub    (%eax),%ah
    8ffa:	45                   	inc    %ebp
    8ffb:	38 32                	cmp    %dh,(%edx)
    8ffd:	30 20                	xor    %ah,(%eax)
    8fff:	4d                   	dec    %ebp
    9000:	65 6d                	gs insl (%dx),%es:(%edi)
    9002:	6f                   	outsl  %ds:(%esi),(%dx)
    9003:	72 79                	jb     907e <exec_kernel+0x102>
    9005:	20 4d 61             	and    %cl,0x61(%ebp)
    9008:	70 20                	jo     902a <exec_kernel+0xae>
    900a:	2a 00                	sub    (%eax),%al
    900c:	53                   	push   %ebx
    900d:	74 61                	je     9070 <exec_kernel+0xf4>
    900f:	72 74                	jb     9085 <exec_kernel+0x109>
    9011:	20 62 6f             	and    %ah,0x6f(%edx)
    9014:	6f                   	outsl  %ds:(%esi),(%dx)
    9015:	74 31                	je     9048 <exec_kernel+0xcc>
    9017:	20 6d 61             	and    %ch,0x61(%ebp)
    901a:	69 6e 20 2e 2e 2e 00 	imul   $0x2e2e2e,0x20(%esi),%ebp
    9021:	46                   	inc    %esi
    9022:	61                   	popa   
    9023:	69 6c 20 74 6f 20 6c 	imul   $0x6f6c206f,0x74(%eax,%eiz,1),%ebp
    902a:	6f 
    902b:	61                   	popa   
    902c:	64 20 6b 65          	and    %ch,%fs:0x65(%ebx)
    9030:	72 6e                	jb     90a0 <exec_kernel+0x124>
    9032:	65 6c                	gs insb (%dx),%es:(%edi)
    9034:	2e 00 4b 65          	add    %cl,%cs:0x65(%ebx)
    9038:	72 6e                	jb     90a8 <exec_kernel+0x12c>
    903a:	65 6c                	gs insb (%dx),%es:(%edi)
    903c:	20 50 61             	and    %dl,0x61(%eax)
    903f:	6e                   	outsb  %ds:(%esi),(%dx)
    9040:	69                   	.byte 0x69
    9041:	63 00                	arpl   %ax,(%eax)

Disassembly of section .eh_frame:

00009044 <.eh_frame>:
    9044:	14 00                	adc    $0x0,%al
    9046:	00 00                	add    %al,(%eax)
    9048:	00 00                	add    %al,(%eax)
    904a:	00 00                	add    %al,(%eax)
    904c:	01 7a 52             	add    %edi,0x52(%edx)
    904f:	00 01                	add    %al,(%ecx)
    9051:	7c 08                	jl     905b <exec_kernel+0xdf>
    9053:	01 1b                	add    %ebx,(%ebx)
    9055:	0c 04                	or     $0x4,%al
    9057:	04 88                	add    $0x88,%al
    9059:	01 00                	add    %eax,(%eax)
    905b:	00 1c 00             	add    %bl,(%eax,%eax,1)
    905e:	00 00                	add    %al,(%eax)
    9060:	1c 00                	sbb    $0x0,%al
    9062:	00 00                	add    %al,(%eax)
    9064:	d4 fa                	aam    $0xfa
    9066:	ff                   	(bad)  
    9067:	ff 26                	jmp    *(%esi)
    9069:	00 00                	add    %al,(%eax)
    906b:	00 00                	add    %al,(%eax)
    906d:	41                   	inc    %ecx
    906e:	0e                   	push   %cs
    906f:	08 85 02 4d 0d 05    	or     %al,0x50d4d02(%ebp)
    9075:	57                   	push   %edi
    9076:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9079:	04 00                	add    $0x0,%al
    907b:	00 24 00             	add    %ah,(%eax,%eax,1)
    907e:	00 00                	add    %al,(%eax)
    9080:	3c 00                	cmp    $0x0,%al
    9082:	00 00                	add    %al,(%eax)
    9084:	da fa                	(bad)  
    9086:	ff                   	(bad)  
    9087:	ff 37                	pushl  (%edi)
    9089:	00 00                	add    %al,(%eax)
    908b:	00 00                	add    %al,(%eax)
    908d:	41                   	inc    %ecx
    908e:	0e                   	push   %cs
    908f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9095:	42                   	inc    %edx
    9096:	86 03                	xchg   %al,(%ebx)
    9098:	83 04 6f c3          	addl   $0xffffffc3,(%edi,%ebp,2)
    909c:	41                   	inc    %ecx
    909d:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
    90a1:	04 04                	add    $0x4,%al
    90a3:	00 20                	add    %ah,(%eax)
    90a5:	00 00                	add    %al,(%eax)
    90a7:	00 64 00 00          	add    %ah,0x0(%eax,%eax,1)
    90ab:	00 e9                	add    %ch,%cl
    90ad:	fa                   	cli    
    90ae:	ff                   	(bad)  
    90af:	ff 4a 00             	decl   0x0(%edx)
    90b2:	00 00                	add    %al,(%eax)
    90b4:	00 4b 0e             	add    %cl,0xe(%ebx)
    90b7:	08 85 02 4e 0d 05    	or     %al,0x50d4e02(%ebp)
    90bd:	41                   	inc    %ecx
    90be:	83 03 6f             	addl   $0x6f,(%ebx)
    90c1:	c5 c3 0c             	(bad)  
    90c4:	04 04                	add    $0x4,%al
    90c6:	00 00                	add    %al,(%eax)
    90c8:	1c 00                	sbb    $0x0,%al
    90ca:	00 00                	add    %al,(%eax)
    90cc:	88 00                	mov    %al,(%eax)
    90ce:	00 00                	add    %al,(%eax)
    90d0:	0f fb ff             	psubq  %mm7,%mm7
    90d3:	ff 18                	lcall  *(%eax)
    90d5:	00 00                	add    %al,(%eax)
    90d7:	00 00                	add    %al,(%eax)
    90d9:	41                   	inc    %ecx
    90da:	0e                   	push   %cs
    90db:	08 85 02 4c 0d 05    	or     %al,0x50d4c02(%ebp)
    90e1:	44                   	inc    %esp
    90e2:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    90e5:	04 00                	add    $0x0,%al
    90e7:	00 18                	add    %bl,(%eax)
    90e9:	00 00                	add    %al,(%eax)
    90eb:	00 a8 00 00 00 07    	add    %ch,0x7000000(%eax)
    90f1:	fb                   	sti    
    90f2:	ff                   	(bad)  
    90f3:	ff 17                	call   *(%edi)
    90f5:	00 00                	add    %al,(%eax)
    90f7:	00 00                	add    %al,(%eax)
    90f9:	41                   	inc    %ecx
    90fa:	0e                   	push   %cs
    90fb:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9101:	00 00                	add    %al,(%eax)
    9103:	00 1c 00             	add    %bl,(%eax,%eax,1)
    9106:	00 00                	add    %al,(%eax)
    9108:	c4 00                	les    (%eax),%eax
    910a:	00 00                	add    %al,(%eax)
    910c:	02 fb                	add    %bl,%bh
    910e:	ff                   	(bad)  
    910f:	ff 13                	call   *(%ebx)
    9111:	00 00                	add    %al,(%eax)
    9113:	00 00                	add    %al,(%eax)
    9115:	41                   	inc    %ecx
    9116:	0e                   	push   %cs
    9117:	08 85 02 44 0d 05    	or     %al,0x50d4402(%ebp)
    911d:	4d                   	dec    %ebp
    911e:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9121:	04 00                	add    $0x0,%al
    9123:	00 24 00             	add    %ah,(%eax,%eax,1)
    9126:	00 00                	add    %al,(%eax)
    9128:	e4 00                	in     $0x0,%al
    912a:	00 00                	add    %al,(%eax)
    912c:	f5                   	cmc    
    912d:	fa                   	cli    
    912e:	ff                   	(bad)  
    912f:	ff 30                	pushl  (%eax)
    9131:	00 00                	add    %al,(%eax)
    9133:	00 00                	add    %al,(%eax)
    9135:	41                   	inc    %ecx
    9136:	0e                   	push   %cs
    9137:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    913d:	42                   	inc    %edx
    913e:	86 03                	xchg   %al,(%ebx)
    9140:	83 04 68 c3          	addl   $0xffffffc3,(%eax,%ebp,2)
    9144:	41                   	inc    %ecx
    9145:	c6 41 c5 0c          	movb   $0xc,-0x3b(%ecx)
    9149:	04 04                	add    $0x4,%al
    914b:	00 28                	add    %ch,(%eax)
    914d:	00 00                	add    %al,(%eax)
    914f:	00 0c 01             	add    %cl,(%ecx,%eax,1)
    9152:	00 00                	add    %al,(%eax)
    9154:	fd                   	std    
    9155:	fa                   	cli    
    9156:	ff                   	(bad)  
    9157:	ff 61 00             	jmp    *0x0(%ecx)
    915a:	00 00                	add    %al,(%eax)
    915c:	00 41 0e             	add    %al,0xe(%ecx)
    915f:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9165:	43                   	inc    %ebx
    9166:	87 03                	xchg   %eax,(%ebx)
    9168:	86 04 83             	xchg   %al,(%ebx,%eax,4)
    916b:	05 02 53 c3 41       	add    $0x41c35302,%eax
    9170:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
    9174:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9177:	04 1c                	add    $0x1c,%al
    9179:	00 00                	add    %al,(%eax)
    917b:	00 38                	add    %bh,(%eax)
    917d:	01 00                	add    %eax,(%eax)
    917f:	00 32                	add    %dh,(%edx)
    9181:	fb                   	sti    
    9182:	ff                   	(bad)  
    9183:	ff 26                	jmp    *(%esi)
    9185:	00 00                	add    %al,(%eax)
    9187:	00 00                	add    %al,(%eax)
    9189:	4b                   	dec    %ebx
    918a:	0e                   	push   %cs
    918b:	08 85 02 48 0d 05    	or     %al,0x50d4802(%ebp)
    9191:	52                   	push   %edx
    9192:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    9195:	04 00                	add    $0x0,%al
    9197:	00 1c 00             	add    %bl,(%eax,%eax,1)
    919a:	00 00                	add    %al,(%eax)
    919c:	58                   	pop    %eax
    919d:	01 00                	add    %eax,(%eax)
    919f:	00 38                	add    %bh,(%eax)
    91a1:	fb                   	sti    
    91a2:	ff                   	(bad)  
    91a3:	ff 26                	jmp    *(%esi)
    91a5:	00 00                	add    %al,(%eax)
    91a7:	00 00                	add    %al,(%eax)
    91a9:	4b                   	dec    %ebx
    91aa:	0e                   	push   %cs
    91ab:	08 85 02 48 0d 05    	or     %al,0x50d4802(%ebp)
    91b1:	52                   	push   %edx
    91b2:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    91b5:	04 00                	add    $0x0,%al
    91b7:	00 20                	add    %ah,(%eax)
    91b9:	00 00                	add    %al,(%eax)
    91bb:	00 78 01             	add    %bh,0x1(%eax)
    91be:	00 00                	add    %al,(%eax)
    91c0:	3e fb                	ds sti 
    91c2:	ff                   	(bad)  
    91c3:	ff 2b                	ljmp   *(%ebx)
    91c5:	00 00                	add    %al,(%eax)
    91c7:	00 00                	add    %al,(%eax)
    91c9:	41                   	inc    %ecx
    91ca:	0e                   	push   %cs
    91cb:	08 85 02 4c 0d 05    	or     %al,0x50d4c02(%ebp)
    91d1:	41                   	inc    %ecx
    91d2:	83 03 58             	addl   $0x58,(%ebx)
    91d5:	c5 c3 0c             	(bad)  
    91d8:	04 04                	add    $0x4,%al
    91da:	00 00                	add    %al,(%eax)
    91dc:	20 00                	and    %al,(%eax)
    91de:	00 00                	add    %al,(%eax)
    91e0:	9c                   	pushf  
    91e1:	01 00                	add    %eax,(%eax)
    91e3:	00 45 fb             	add    %al,-0x5(%ebp)
    91e6:	ff                   	(bad)  
    91e7:	ff 6f 00             	ljmp   *0x0(%edi)
    91ea:	00 00                	add    %al,(%eax)
    91ec:	00 41 0e             	add    %al,0xe(%ecx)
    91ef:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    91f5:	41                   	inc    %ecx
    91f6:	87 03                	xchg   %eax,(%ebx)
    91f8:	02 69 c7             	add    -0x39(%ecx),%ch
    91fb:	41                   	inc    %ecx
    91fc:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    91ff:	04 28                	add    $0x28,%al
    9201:	00 00                	add    %al,(%eax)
    9203:	00 c0                	add    %al,%al
    9205:	01 00                	add    %eax,(%eax)
    9207:	00 90 fb ff ff 41    	add    %dl,0x41fffffb(%eax)
    920d:	00 00                	add    %al,(%eax)
    920f:	00 00                	add    %al,(%eax)
    9211:	41                   	inc    %ecx
    9212:	0e                   	push   %cs
    9213:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9219:	43                   	inc    %ebx
    921a:	87 03                	xchg   %eax,(%ebx)
    921c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
    921f:	05 77 c3 41 c6       	add    $0xc641c377,%eax
    9224:	41                   	inc    %ecx
    9225:	c7 41 c5 0c 04 04 00 	movl   $0x4040c,-0x3b(%ecx)
    922c:	10 00                	adc    %al,(%eax)
    922e:	00 00                	add    %al,(%eax)
    9230:	ec                   	in     (%dx),%al
    9231:	01 00                	add    %eax,(%eax)
    9233:	00 a5 fb ff ff 04    	add    %ah,0x4fffffb(%ebp)
    9239:	00 00                	add    %al,(%eax)
    923b:	00 00                	add    %al,(%eax)
    923d:	00 00                	add    %al,(%eax)
    923f:	00 10                	add    %dl,(%eax)
    9241:	00 00                	add    %al,(%eax)
    9243:	00 00                	add    %al,(%eax)
    9245:	02 00                	add    (%eax),%al
    9247:	00 95 fb ff ff 04    	add    %dl,0x4fffffb(%ebp)
    924d:	00 00                	add    %al,(%eax)
    924f:	00 00                	add    %al,(%eax)
    9251:	00 00                	add    %al,(%eax)
    9253:	00 28                	add    %ch,(%eax)
    9255:	00 00                	add    %al,(%eax)
    9257:	00 14 02             	add    %dl,(%edx,%eax,1)
    925a:	00 00                	add    %al,(%eax)
    925c:	85 fb                	test   %edi,%ebx
    925e:	ff                   	(bad)  
    925f:	ff 8f 00 00 00 00    	decl   0x0(%edi)
    9265:	41                   	inc    %ecx
    9266:	0e                   	push   %cs
    9267:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    926d:	43                   	inc    %ebx
    926e:	87 03                	xchg   %eax,(%ebx)
    9270:	86 04 83             	xchg   %al,(%ebx,%eax,4)
    9273:	05 02 80 c3 46       	add    $0x46c38002,%eax
    9278:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
    927c:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    927f:	04 28                	add    $0x28,%al
    9281:	00 00                	add    %al,(%eax)
    9283:	00 40 02             	add    %al,0x2(%eax)
    9286:	00 00                	add    %al,(%eax)
    9288:	e8 fb ff ff 70       	call   71009288 <SMAP_SIG+0x1db35138>
    928d:	00 00                	add    %al,(%eax)
    928f:	00 00                	add    %al,(%eax)
    9291:	41                   	inc    %ecx
    9292:	0e                   	push   %cs
    9293:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    9299:	43                   	inc    %ebx
    929a:	87 03                	xchg   %eax,(%ebx)
    929c:	86 04 83             	xchg   %al,(%ebx,%eax,4)
    929f:	05 02 66 c3 41       	add    $0x41c36602,%eax
    92a4:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
    92a8:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    92ab:	04 28                	add    $0x28,%al
    92ad:	00 00                	add    %al,(%eax)
    92af:	00 6c 02 00          	add    %ch,0x0(%edx,%eax,1)
    92b3:	00 2c fc             	add    %ch,(%esp,%edi,8)
    92b6:	ff                   	(bad)  
    92b7:	ff 98 00 00 00 00    	lcall  *0x0(%eax)
    92bd:	41                   	inc    %ecx
    92be:	0e                   	push   %cs
    92bf:	08 85 02 42 0d 05    	or     %al,0x50d4202(%ebp)
    92c5:	43                   	inc    %ebx
    92c6:	87 03                	xchg   %eax,(%ebx)
    92c8:	86 04 83             	xchg   %al,(%ebx,%eax,4)
    92cb:	05 02 8e c3 41       	add    $0x41c38e02,%eax
    92d0:	c6 41 c7 41          	movb   $0x41,-0x39(%ecx)
    92d4:	c5 0c 04             	lds    (%esp,%eax,1),%ecx
    92d7:	04 10                	add    $0x10,%al
    92d9:	00 00                	add    %al,(%eax)
    92db:	00 98 02 00 00 98    	add    %bl,-0x67fffffe(%eax)
    92e1:	fc                   	cld    
    92e2:	ff                   	(bad)  
    92e3:	ff 04 00             	incl   (%eax,%eax,1)
    92e6:	00 00                	add    %al,(%eax)
    92e8:	00 00                	add    %al,(%eax)
    92ea:	00 00                	add    %al,(%eax)

Disassembly of section .got.plt:

000092ec <_GLOBAL_OFFSET_TABLE_>:
    92ec:	00 00                	add    %al,(%eax)
    92ee:	00 00                	add    %al,(%eax)
    92f0:	00 00                	add    %al,(%eax)
    92f2:	00 00                	add    %al,(%eax)
    92f4:	00 00                	add    %al,(%eax)
    92f6:	00 00                	add    %al,(%eax)

Disassembly of section .data:

00009300 <hex.1142>:
    9300:	30 31                	xor    %dh,(%ecx)
    9302:	32 33                	xor    (%ebx),%dh
    9304:	34 35                	xor    $0x35,%al
    9306:	36 37                	ss aaa 
    9308:	38 39                	cmp    %bh,(%ecx)
    930a:	61                   	popa   
    930b:	62 63 64             	bound  %esp,0x64(%ebx)
    930e:	65 66 00 00          	data16 add %al,%gs:(%eax)
    9312:	00 00                	add    %al,(%eax)

00009314 <dec.1137>:
    9314:	30 31                	xor    %dh,(%ecx)
    9316:	32 33                	xor    (%ebx),%dh
    9318:	34 35                	xor    $0x35,%al
    931a:	36 37                	ss aaa 
    931c:	38 39                	cmp    %bh,(%ecx)
    931e:	00 00                	add    %al,(%eax)

00009320 <video>:
volatile char *video = (volatile char*) 0xB8000;
    9320:	00 80 0b 00      	add    %al,-0x7073fff5(%eax)

00009324 <blank>:
char * blank =
    9324:	8c 8f 00 00 00 00    	mov    %cs,0x0(%edi)
    932a:	00 00                	add    %al,(%eax)
    932c:	00 00                	add    %al,(%eax)
    932e:	00 00                	add    %al,(%eax)
    9330:	00 00                	add    %al,(%eax)
    9332:	00 00                	add    %al,(%eax)
    9334:	00 00                	add    %al,(%eax)
    9336:	00 00                	add    %al,(%eax)
    9338:	00 00                	add    %al,(%eax)
    933a:	00 00                	add    %al,(%eax)
    933c:	00 00                	add    %al,(%eax)
    933e:	00 00                	add    %al,(%eax)

00009340 <mboot_info>:
mboot_info_t mboot_info =
    9340:	40                   	inc    %eax
    9341:	00 00                	add    %al,(%eax)
    9343:	00 00                	add    %al,(%eax)
    9345:	00 00                	add    %al,(%eax)
    9347:	00 00                	add    %al,(%eax)
    9349:	00 00                	add    %al,(%eax)
    934b:	00 00                	add    %al,(%eax)
    934d:	00 00                	add    %al,(%eax)
    934f:	00 00                	add    %al,(%eax)
    9351:	00 00                	add    %al,(%eax)
    9353:	00 00                	add    %al,(%eax)
    9355:	00 00                	add    %al,(%eax)
    9357:	00 00                	add    %al,(%eax)
    9359:	00 00                	add    %al,(%eax)
    935b:	00 00                	add    %al,(%eax)
    935d:	00 00                	add    %al,(%eax)
    935f:	00 00                	add    %al,(%eax)
    9361:	00 00                	add    %al,(%eax)
    9363:	00 00                	add    %al,(%eax)
    9365:	00 00                	add    %al,(%eax)
    9367:	00 00                	add    %al,(%eax)
    9369:	00 00                	add    %al,(%eax)
    936b:	00 00                	add    %al,(%eax)
    936d:	00 00                	add    %al,(%eax)
    936f:	00 00                	add    %al,(%eax)
    9371:	00 00                	add    %al,(%eax)
    9373:	00 00                	add    %al,(%eax)
    9375:	00 00                	add    %al,(%eax)
    9377:	00 00                	add    %al,(%eax)
    9379:	00 00                	add    %al,(%eax)
    937b:	00 00                	add    %al,(%eax)
    937d:	00 00                	add    %al,(%eax)
    937f:	00 00                	add    %al,(%eax)
    9381:	00 00                	add    %al,(%eax)
    9383:	00 00                	add    %al,(%eax)
    9385:	00 00                	add    %al,(%eax)
    9387:	00 00                	add    %al,(%eax)
    9389:	00 00                	add    %al,(%eax)
    938b:	00 00                	add    %al,(%eax)
    938d:	00 00                	add    %al,(%eax)
    938f:	00 00                	add    %al,(%eax)
    9391:	00 00                	add    %al,(%eax)
    9393:	00 00                	add    %al,(%eax)
    9395:	00 00                	add    %al,(%eax)
    9397:	00 00                	add    %al,(%eax)
    9399:	00 00                	add    %al,(%eax)
    939b:	00 00                	add    %al,(%eax)
    939d:	00 00                	add    %al,(%eax)
    939f:	00                   	.byte 0x0

Disassembly of section .bss:

000093a0 <__bss_start>:
    93a0:	00 00                	add    %al,(%eax)
    93a2:	00 00                	add    %al,(%eax)
    93a4:	00 00                	add    %al,(%eax)
    93a6:	00 00                	add    %al,(%eax)
    93a8:	00 00                	add    %al,(%eax)
    93aa:	00 00                	add    %al,(%eax)
    93ac:	00 00                	add    %al,(%eax)
    93ae:	00 00                	add    %al,(%eax)
    93b0:	00 00                	add    %al,(%eax)
    93b2:	00 00                	add    %al,(%eax)
    93b4:	00 00                	add    %al,(%eax)
    93b6:	00 00                	add    %al,(%eax)
    93b8:	00 00                	add    %al,(%eax)
    93ba:	00 00                	add    %al,(%eax)
    93bc:	00 00                	add    %al,(%eax)
    93be:	00 00                	add    %al,(%eax)
    93c0:	00 00                	add    %al,(%eax)
    93c2:	00 00                	add    %al,(%eax)
    93c4:	00 00                	add    %al,(%eax)
    93c6:	00 00                	add    %al,(%eax)

000093c8 <row>:
static int row = 0;
    93c8:	00 00                	add    %al,(%eax)
    93ca:	00 00                	add    %al,(%eax)

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    %edi
   1:	43                   	inc    %ebx
   2:	43                   	inc    %ebx
   3:	3a 20                	cmp    (%eax),%ah
   5:	28 55 62             	sub    %dl,0x62(%ebp)
   8:	75 6e                	jne    78 <PROT_MODE_DSEG+0x68>
   a:	74 75                	je     81 <PROT_MODE_DSEG+0x71>
   c:	20 37                	and    %dh,(%edi)
   e:	2e 33 2e             	xor    %cs:(%esi),%ebp
  11:	30 2d 32 37 75 62    	xor    %ch,0x62753732
  17:	75 6e                	jne    87 <PROT_MODE_DSEG+0x77>
  19:	74 75                	je     90 <PROT_MODE_DSEG+0x80>
  1b:	31 7e 31             	xor    %edi,0x31(%esi)
  1e:	38 2e                	cmp    %ch,(%esi)
  20:	30 34 29             	xor    %dh,(%ecx,%ebp,1)
  23:	20 37                	and    %dh,(%edi)
  25:	2e 33 2e             	xor    %cs:(%esi),%ebp
  28:	30 00                	xor    %al,(%eax)

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	1c 00                	sbb    $0x0,%al
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 00                	add    $0x0,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	00 7e 00             	add    %bh,0x0(%esi)
  13:	00 38                	add    %bh,(%eax)
  15:	0d 00 00 00 00       	or     $0x0,%eax
  1a:	00 00                	add    %al,(%eax)
  1c:	00 00                	add    %al,(%eax)
  1e:	00 00                	add    %al,(%eax)
  20:	1c 00                	sbb    $0x0,%al
  22:	00 00                	add    %al,(%eax)
  24:	02 00                	add    (%eax),%al
  26:	26 00 00             	add    %al,%es:(%eax)
  29:	00 04 00             	add    %al,(%eax,%eax,1)
  2c:	00 00                	add    %al,(%eax)
  2e:	00 00                	add    %al,(%eax)
  30:	38 8b 00 00 a1 02    	cmp    %cl,0x2a10000(%ebx)
  36:	00 00                	add    %al,(%eax)
  38:	00 00                	add    %al,(%eax)
  3a:	00 00                	add    %al,(%eax)
  3c:	00 00                	add    %al,(%eax)
  3e:	00 00                	add    %al,(%eax)
  40:	1c 00                	sbb    $0x0,%al
  42:	00 00                	add    %al,(%eax)
  44:	02 00                	add    (%eax),%al
  46:	bd 06 00 00 04       	mov    $0x4000006,%ebp
  4b:	00 00                	add    %al,(%eax)
  4d:	00 00                	add    %al,(%eax)
  4f:	00 e1                	add    %ah,%cl
  51:	8d 00                	lea    (%eax),%eax
  53:	00 97 01 00 00 00    	add    %dl,0x1(%edi)
  59:	00 00                	add    %al,(%eax)
  5b:	00 00                	add    %al,(%eax)
  5d:	00 00                	add    %al,(%eax)
  5f:	00 1c 00             	add    %bl,(%eax,%eax,1)
  62:	00 00                	add    %al,(%eax)
  64:	02 00                	add    (%eax),%al
  66:	5b                   	pop    %ebx
  67:	0d 00 00 04 00       	or     $0x40000,%eax
  6c:	00 00                	add    %al,(%eax)
  6e:	00 00                	add    %al,(%eax)
  70:	7c 8f                	jl     1 <PROT_MODE_CSEG-0x7>
  72:	00 00                	add    %al,(%eax)
  74:	10 00                	adc    %al,(%eax)
  76:	00 00                	add    %al,(%eax)
  78:	00 00                	add    %al,(%eax)
  7a:	00 00                	add    %al,(%eax)
  7c:	00 00                	add    %al,(%eax)
  7e:	00 00                	add    %al,(%eax)

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	22 00                	and    (%eax),%al
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	00 00                	add    %al,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	04 01                	add    $0x1,%al
   c:	00 00                	add    %al,(%eax)
   e:	00 00                	add    %al,(%eax)
  10:	00 7e 00             	add    %bh,0x0(%esi)
  13:	00 38                	add    %bh,(%eax)
  15:	8b 00                	mov    (%eax),%eax
  17:	00 00                	add    %al,(%eax)
  19:	00 00                	add    %al,(%eax)
  1b:	00 13                	add    %dl,(%ebx)
  1d:	00 00                	add    %al,(%eax)
  1f:	00 33                	add    %dh,(%ebx)
  21:	00 00                	add    %al,(%eax)
  23:	00 01                	add    %al,(%ecx)
  25:	80 93 06 00 00 04 00 	adcb   $0x0,0x4000006(%ebx)
  2c:	14 00                	adc    $0x0,%al
  2e:	00 00                	add    %al,(%eax)
  30:	04 01                	add    $0x1,%al
  32:	bf 00 00 00 0c       	mov    $0xc000000,%edi
  37:	89 00                	mov    %eax,(%eax)
  39:	00 00                	add    %al,(%eax)
  3b:	13 00                	adc    (%eax),%eax
  3d:	00 00                	add    %al,(%eax)
  3f:	38 8b 00 00 a1 02    	cmp    %cl,0x2a10000(%ebx)
  45:	00 00                	add    %al,(%eax)
  47:	8f 00                	popl   (%eax)
  49:	00 00                	add    %al,(%eax)
  4b:	02 01                	add    (%ecx),%al
  4d:	06                   	push   %es
  4e:	2d 01 00 00 03       	sub    $0x3000001,%eax
  53:	9f                   	lahf   
  54:	00 00                	add    %al,(%eax)
  56:	00 02                	add    %al,(%edx)
  58:	0d 37 00 00 00       	or     $0x37,%eax
  5d:	02 01                	add    (%ecx),%al
  5f:	08 2b                	or     %ch,(%ebx)
  61:	01 00                	add    %eax,(%eax)
  63:	00 02                	add    %al,(%edx)
  65:	02 05 57 00 00 00    	add    0x57,%al
  6b:	02 02                	add    (%edx),%al
  6d:	07                   	pop    %es
  6e:	6d                   	insl   (%dx),%es:(%edi)
  6f:	01 00                	add    %eax,(%eax)
  71:	00 03                	add    %al,(%ebx)
  73:	5b                   	pop    %ebx
  74:	01 00                	add    %eax,(%eax)
  76:	00 02                	add    %al,(%edx)
  78:	10 57 00             	adc    %dl,0x0(%edi)
  7b:	00 00                	add    %al,(%eax)
  7d:	04 04                	add    $0x4,%al
  7f:	05 69 6e 74 00       	add    $0x746e69,%eax
  84:	03 5a 01             	add    0x1(%edx),%ebx
  87:	00 00                	add    %al,(%eax)
  89:	02 11                	add    (%ecx),%dl
  8b:	69 00 00 00 02 04    	imul   $0x4020000,(%eax),%eax
  91:	07                   	pop    %es
  92:	4d                   	dec    %ebp
  93:	01 00                	add    %eax,(%eax)
  95:	00 02                	add    %al,(%edx)
  97:	08 05 b1 00 00 00    	or     %al,0xb1
  9d:	02 08                	add    (%eax),%cl
  9f:	07                   	pop    %es
  a0:	43                   	inc    %ebx
  a1:	01 00                	add    %eax,(%eax)
  a3:	00 05 b2 01 00 00    	add    %al,0x1b2
  a9:	01 06                	add    %eax,(%esi)
  ab:	8f 00                	popl   (%eax)
  ad:	00 00                	add    %al,(%eax)
  af:	05 03 20 93 00       	add    $0x932003,%eax
  b4:	00 06                	add    %al,(%esi)
  b6:	04 9c                	add    $0x9c,%al
  b8:	00 00                	add    %al,(%eax)
  ba:	00 02                	add    %al,(%edx)
  bc:	01 06                	add    %eax,(%esi)
  be:	34 01                	xor    $0x1,%al
  c0:	00 00                	add    %al,(%eax)
  c2:	07                   	pop    %es
  c3:	95                   	xchg   %eax,%ebp
  c4:	00 00                	add    %al,(%eax)
  c6:	00 08                	add    %cl,(%eax)
  c8:	95                   	xchg   %eax,%ebp
  c9:	00 00                	add    %al,(%eax)
  cb:	00 09                	add    %cl,(%ecx)
  cd:	72 6f                	jb     13e <PROT_MODE_DSEG+0x12e>
  cf:	77 00                	ja     d1 <PROT_MODE_DSEG+0xc1>
  d1:	01 1c 57             	add    %ebx,(%edi,%edx,2)
  d4:	00 00                	add    %al,(%eax)
  d6:	00 05 03 c8 93 00    	add    %al,0x93c803
  dc:	00 05 a7 01 00 00    	add    %al,0x1a7
  e2:	01 1e                	add    %ebx,(%esi)
  e4:	c8 00 00 00          	enter  $0x0,$0x0
  e8:	05 03 24 93 00       	add    $0x932403,%eax
  ed:	00 06                	add    %al,(%esi)
  ef:	04 95                	add    $0x95,%al
  f1:	00 00                	add    %al,(%eax)
  f3:	00 0a                	add    %cl,(%edx)
  f5:	95                   	xchg   %eax,%ebp
  f6:	00 00                	add    %al,(%eax)
  f8:	00 de                	add    %bl,%dh
  fa:	00 00                	add    %al,(%eax)
  fc:	00 0b                	add    %cl,(%ebx)
  fe:	69 00 00 00 27 00    	imul   $0x270000,(%eax),%eax
 104:	0c 9e                	or     $0x9e,%al
 106:	01 00                	add    %eax,(%eax)
 108:	00 01                	add    %al,(%ecx)
 10a:	38 ce                	cmp    %cl,%dh
 10c:	00 00                	add    %al,(%eax)
 10e:	00 05 03 a0 93 00    	add    %al,0x93a003
 114:	00 0d 1a 01 00 00    	add    %cl,0x11a
 11a:	01 a4 98 8d 00 00 41 	add    %esp,0x4100008d(%eax,%ebx,4)
 121:	00 00                	add    %al,(%eax)
 123:	00 01                	add    %al,(%ecx)
 125:	9c                   	pushf  
 126:	56                   	push   %esi
 127:	01 00                	add    %eax,(%eax)
 129:	00 0e                	add    %cl,(%esi)
 12b:	76 61                	jbe    18e <PROT_MODE_DSEG+0x17e>
 12d:	00 01                	add    %al,(%ecx)
 12f:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 130:	5e                   	pop    %esi
 131:	00 00                	add    %al,(%eax)
 133:	00 00                	add    %al,(%eax)
 135:	00 00                	add    %al,(%eax)
 137:	00 0f                	add    %cl,(%edi)
 139:	64 04 00             	fs add $0x0,%al
 13c:	00 01                	add    %al,(%ecx)
 13e:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 13f:	5e                   	pop    %esi
 140:	00 00                	add    %al,(%eax)
 142:	00 02                	add    %al,(%edx)
 144:	91                   	xchg   %eax,%ecx
 145:	04 10                	add    $0x10,%al
 147:	1d 02 00 00 01       	sbb    $0x1000002,%eax
 14c:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 14d:	5e                   	pop    %esi
 14e:	00 00                	add    %al,(%eax)
 150:	00 63 00             	add    %ah,0x0(%ebx)
 153:	00 00                	add    %al,(%eax)
 155:	11 6c 62 61          	adc    %ebp,0x61(%edx,%eiz,2)
 159:	00 01                	add    %al,(%ecx)
 15b:	a4                   	movsb  %ds:(%esi),%es:(%edi)
 15c:	5e                   	pop    %esi
 15d:	00 00                	add    %al,(%eax)
 15f:	00 02                	add    %al,(%edx)
 161:	91                   	xchg   %eax,%ecx
 162:	0c 12                	or     $0x12,%al
 164:	3f                   	aas    
 165:	00 00                	add    %al,(%eax)
 167:	00 01                	add    %al,(%ecx)
 169:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 16a:	5e                   	pop    %esi
 16b:	00 00                	add    %al,(%eax)
 16d:	00 a6 00 00 00 13    	add    %ah,0x13000000(%esi)
 173:	cd 8d                	int    $0x8d
 175:	00 00                	add    %al,(%eax)
 177:	56                   	push   %esi
 178:	01 00                	add    %eax,(%eax)
 17a:	00 00                	add    %al,(%eax)
 17c:	0d 7e 00 00 00       	or     $0x7e,%eax
 181:	01 8e 29 8d 00 00    	add    %ecx,0x8d29(%esi)
 187:	6f                   	outsl  %ds:(%esi),(%dx)
 188:	00 00                	add    %al,(%eax)
 18a:	00 01                	add    %al,(%ecx)
 18c:	9c                   	pushf  
 18d:	0b 03                	or     (%ebx),%eax
 18f:	00 00                	add    %al,(%eax)
 191:	11 64 73 74          	adc    %esp,0x74(%ebx,%esi,2)
 195:	00 01                	add    %al,(%ecx)
 197:	8e 0b                	mov    (%ebx),%cs
 199:	03 00                	add    (%eax),%eax
 19b:	00 02                	add    %al,(%edx)
 19d:	91                   	xchg   %eax,%ecx
 19e:	00 0f                	add    %cl,(%edi)
 1a0:	1d 02 00 00 01       	sbb    $0x1000002,%eax
 1a5:	8e 5e 00             	mov    0x0(%esi),%ds
 1a8:	00 00                	add    %al,(%eax)
 1aa:	02 91 04 14 0d 03    	add    0x30d1404(%ecx),%dl
 1b0:	00 00                	add    %al,(%eax)
 1b2:	2d 8d 00 00 00       	sub    $0x8d,%eax
 1b7:	00 00                	add    %al,(%eax)
 1b9:	00 01                	add    %al,(%ecx)
 1bb:	91                   	xchg   %eax,%ecx
 1bc:	bf 01 00 00 15       	mov    $0x15000001,%edi
 1c1:	50                   	push   %eax
 1c2:	06                   	push   %es
 1c3:	00 00                	add    %al,(%eax)
 1c5:	2d 8d 00 00 18       	sub    $0x1800008d,%eax
 1ca:	00 00                	add    %al,(%eax)
 1cc:	00 01                	add    %al,(%ecx)
 1ce:	89 16                	mov    %edx,(%esi)
 1d0:	60                   	pusha  
 1d1:	06                   	push   %es
 1d2:	00 00                	add    %al,(%eax)
 1d4:	d1 00                	roll   (%eax)
 1d6:	00 00                	add    %al,(%eax)
 1d8:	17                   	pop    %ss
 1d9:	18 00                	sbb    %al,(%eax)
 1db:	00 00                	add    %al,(%eax)
 1dd:	18 6b 06             	sbb    %ch,0x6(%ebx)
 1e0:	00 00                	add    %al,(%eax)
 1e2:	00 00                	add    %al,(%eax)
 1e4:	00 19                	add    %bl,(%ecx)
 1e6:	77 06                	ja     1ee <PROT_MODE_DSEG+0x1de>
 1e8:	00 00                	add    %al,(%eax)
 1ea:	3f                   	aas    
 1eb:	8d 00                	lea    (%eax),%eax
 1ed:	00 08                	add    %cl,(%eax)
 1ef:	00 00                	add    %al,(%eax)
 1f1:	00 01                	add    %al,(%ecx)
 1f3:	93                   	xchg   %eax,%ebx
 1f4:	e5 01                	in     $0x1,%eax
 1f6:	00 00                	add    %al,(%eax)
 1f8:	16                   	push   %ss
 1f9:	8a 06                	mov    (%esi),%al
 1fb:	00 00                	add    %al,(%eax)
 1fd:	e7 00                	out    %eax,$0x0
 1ff:	00 00                	add    %al,(%eax)
 201:	16                   	push   %ss
 202:	7f 06                	jg     20a <PROT_MODE_DSEG+0x1fa>
 204:	00 00                	add    %al,(%eax)
 206:	fb                   	sti    
 207:	00 00                	add    %al,(%eax)
 209:	00 00                	add    %al,(%eax)
 20b:	19 77 06             	sbb    %esi,0x6(%edi)
 20e:	00 00                	add    %al,(%eax)
 210:	47                   	inc    %edi
 211:	8d 00                	lea    (%eax),%eax
 213:	00 08                	add    %cl,(%eax)
 215:	00 00                	add    %al,(%eax)
 217:	00 01                	add    %al,(%ecx)
 219:	94                   	xchg   %eax,%esp
 21a:	0b 02                	or     (%edx),%eax
 21c:	00 00                	add    %al,(%eax)
 21e:	16                   	push   %ss
 21f:	8a 06                	mov    (%esi),%al
 221:	00 00                	add    %al,(%eax)
 223:	11 01                	adc    %eax,(%ecx)
 225:	00 00                	add    %al,(%eax)
 227:	16                   	push   %ss
 228:	7f 06                	jg     230 <PROT_MODE_DSEG+0x220>
 22a:	00 00                	add    %al,(%eax)
 22c:	24 01                	and    $0x1,%al
 22e:	00 00                	add    %al,(%eax)
 230:	00 14 77             	add    %dl,(%edi,%esi,2)
 233:	06                   	push   %es
 234:	00 00                	add    %al,(%eax)
 236:	51                   	push   %ecx
 237:	8d 00                	lea    (%eax),%eax
 239:	00 30                	add    %dh,(%eax)
 23b:	00 00                	add    %al,(%eax)
 23d:	00 01                	add    %al,(%ecx)
 23f:	95                   	xchg   %eax,%ebp
 240:	31 02                	xor    %eax,(%edx)
 242:	00 00                	add    %al,(%eax)
 244:	16                   	push   %ss
 245:	8a 06                	mov    (%esi),%al
 247:	00 00                	add    %al,(%eax)
 249:	3a 01                	cmp    (%ecx),%al
 24b:	00 00                	add    %al,(%eax)
 24d:	16                   	push   %ss
 24e:	7f 06                	jg     256 <PROT_MODE_DSEG+0x246>
 250:	00 00                	add    %al,(%eax)
 252:	4e                   	dec    %esi
 253:	01 00                	add    %eax,(%eax)
 255:	00 00                	add    %al,(%eax)
 257:	14 77                	adc    $0x77,%al
 259:	06                   	push   %es
 25a:	00 00                	add    %al,(%eax)
 25c:	5c                   	pop    %esp
 25d:	8d 00                	lea    (%eax),%eax
 25f:	00 48 00             	add    %cl,0x0(%eax)
 262:	00 00                	add    %al,(%eax)
 264:	01 96 57 02 00 00    	add    %edx,0x257(%esi)
 26a:	16                   	push   %ss
 26b:	8a 06                	mov    (%esi),%al
 26d:	00 00                	add    %al,(%eax)
 26f:	64 01 00             	add    %eax,%fs:(%eax)
 272:	00 16                	add    %dl,(%esi)
 274:	7f 06                	jg     27c <PROT_MODE_DSEG+0x26c>
 276:	00 00                	add    %al,(%eax)
 278:	78 01                	js     27b <PROT_MODE_DSEG+0x26b>
 27a:	00 00                	add    %al,(%eax)
 27c:	00 14 77             	add    %dl,(%edi,%esi,2)
 27f:	06                   	push   %es
 280:	00 00                	add    %al,(%eax)
 282:	67 8d 00             	lea    (%bx,%si),%eax
 285:	00 60 00             	add    %ah,0x0(%eax)
 288:	00 00                	add    %al,(%eax)
 28a:	01 97 7d 02 00 00    	add    %edx,0x27d(%edi)
 290:	16                   	push   %ss
 291:	8a 06                	mov    (%esi),%al
 293:	00 00                	add    %al,(%eax)
 295:	8e 01                	mov    (%ecx),%es
 297:	00 00                	add    %al,(%eax)
 299:	16                   	push   %ss
 29a:	7f 06                	jg     2a2 <PROT_MODE_DSEG+0x292>
 29c:	00 00                	add    %al,(%eax)
 29e:	a8 01                	test   $0x1,%al
 2a0:	00 00                	add    %al,(%eax)
 2a2:	00 19                	add    %bl,(%ecx)
 2a4:	77 06                	ja     2ac <PROT_MODE_DSEG+0x29c>
 2a6:	00 00                	add    %al,(%eax)
 2a8:	73 8d                	jae    237 <PROT_MODE_DSEG+0x227>
 2aa:	00 00                	add    %al,(%eax)
 2ac:	05 00 00 00 01       	add    $0x1000000,%eax
 2b1:	98                   	cwtl   
 2b2:	a3 02 00 00 16       	mov    %eax,0x16000002
 2b7:	8a 06                	mov    (%esi),%al
 2b9:	00 00                	add    %al,(%eax)
 2bb:	be 01 00 00 16       	mov    $0x16000001,%esi
 2c0:	7f 06                	jg     2c8 <PROT_MODE_DSEG+0x2b8>
 2c2:	00 00                	add    %al,(%eax)
 2c4:	d3 01                	roll   %cl,(%ecx)
 2c6:	00 00                	add    %al,(%eax)
 2c8:	00 19                	add    %bl,(%ecx)
 2ca:	0d 03 00 00 78       	or     $0x78000003,%eax
 2cf:	8d 00                	lea    (%eax),%eax
 2d1:	00 0d 00 00 00 01    	add    %cl,0x1000000
 2d7:	9b df 02             	filds  (%edx)
 2da:	00 00                	add    %al,(%eax)
 2dc:	1a 50 06             	sbb    0x6(%eax),%dl
 2df:	00 00                	add    %al,(%eax)
 2e1:	78 8d                	js     270 <PROT_MODE_DSEG+0x260>
 2e3:	00 00                	add    %al,(%eax)
 2e5:	06                   	push   %es
 2e6:	00 00                	add    %al,(%eax)
 2e8:	00 01                	add    %al,(%ecx)
 2ea:	89 16                	mov    %edx,(%esi)
 2ec:	60                   	pusha  
 2ed:	06                   	push   %es
 2ee:	00 00                	add    %al,(%eax)
 2f0:	e9 01 00 00 1b       	jmp    1b0002f6 <_end+0x1aff6f2a>
 2f5:	78 8d                	js     284 <PROT_MODE_DSEG+0x274>
 2f7:	00 00                	add    %al,(%eax)
 2f9:	06                   	push   %es
 2fa:	00 00                	add    %al,(%eax)
 2fc:	00 18                	add    %bl,(%eax)
 2fe:	6b 06 00             	imul   $0x0,(%esi),%eax
 301:	00 00                	add    %al,(%eax)
 303:	00 00                	add    %al,(%eax)
 305:	1a 22                	sbb    (%edx),%ah
 307:	06                   	push   %es
 308:	00 00                	add    %al,(%eax)
 30a:	85 8d 00 00 10 00    	test   %ecx,0x100000(%ebp)
 310:	00 00                	add    %al,(%eax)
 312:	01 9e 16 44 06 00    	add    %ebx,0x64416(%esi)
 318:	00 ff                	add    %bh,%bh
 31a:	01 00                	add    %eax,(%eax)
 31c:	00 16                	add    %dl,(%esi)
 31e:	39 06                	cmp    %eax,(%esi)
 320:	00 00                	add    %al,(%eax)
 322:	14 02                	adc    $0x2,%al
 324:	00 00                	add    %al,(%eax)
 326:	16                   	push   %ss
 327:	2e 06                	cs push %es
 329:	00 00                	add    %al,(%eax)
 32b:	28 02                	sub    %al,(%edx)
 32d:	00 00                	add    %al,(%eax)
 32f:	00 00                	add    %al,(%eax)
 331:	1c 04                	sbb    $0x4,%al
 333:	1d 46 00 00 00       	sbb    $0x46,%eax
 338:	01 86 01 0d 39 01    	add    %eax,0x1390d01(%esi)
 33e:	00 00                	add    %al,(%eax)
 340:	01 7b d8             	add    %edi,-0x28(%ebx)
 343:	8c 00                	mov    %es,(%eax)
 345:	00 26                	add    %ah,(%esi)
 347:	00 00                	add    %al,(%eax)
 349:	00 01                	add    %al,(%ecx)
 34b:	9c                   	pushf  
 34c:	5d                   	pop    %ebp
 34d:	03 00                	add    (%eax),%eax
 34f:	00 11                	add    %dl,(%ecx)
 351:	6e                   	outsb  %ds:(%esi),(%dx)
 352:	00 01                	add    %al,(%ecx)
 354:	7b 57                	jnp    3ad <PROT_MODE_DSEG+0x39d>
 356:	00 00                	add    %al,(%eax)
 358:	00 02                	add    %al,(%edx)
 35a:	91                   	xchg   %eax,%ecx
 35b:	00 11                	add    %dl,(%ecx)
 35d:	73 00                	jae    35f <PROT_MODE_DSEG+0x34f>
 35f:	01 7b c8             	add    %edi,-0x38(%ebx)
 362:	00 00                	add    %al,(%eax)
 364:	00 02                	add    %al,(%edx)
 366:	91                   	xchg   %eax,%ecx
 367:	04 09                	add    $0x9,%al
 369:	68 65 78 00 01       	push   $0x1007865
 36e:	7d 5d                	jge    3cd <PROT_MODE_DSEG+0x3bd>
 370:	03 00                	add    (%eax),%eax
 372:	00 05 03 00 93 00    	add    %al,0x930003
 378:	00 13                	add    %dl,(%ebx)
 37a:	f9                   	stc    
 37b:	8c 00                	mov    %es,(%eax)
 37d:	00 c5                	add    %al,%ch
 37f:	03 00                	add    (%eax),%eax
 381:	00 00                	add    %al,(%eax)
 383:	0a 95 00 00 00 6d    	or     0x6d000000(%ebp),%dl
 389:	03 00                	add    (%eax),%eax
 38b:	00 0b                	add    %cl,(%ebx)
 38d:	69 00 00 00 10 00    	imul   $0x100000,(%eax),%eax
 393:	0d 26 01 00 00       	or     $0x126,%eax
 398:	01 73 b2             	add    %esi,-0x4e(%ebx)
 39b:	8c 00                	mov    %es,(%eax)
 39d:	00 26                	add    %ah,(%esi)
 39f:	00 00                	add    %al,(%eax)
 3a1:	00 01                	add    %al,(%ecx)
 3a3:	9c                   	pushf  
 3a4:	b5 03                	mov    $0x3,%ch
 3a6:	00 00                	add    %al,(%eax)
 3a8:	11 6e 00             	adc    %ebp,0x0(%esi)
 3ab:	01 73 57             	add    %esi,0x57(%ebx)
 3ae:	00 00                	add    %al,(%eax)
 3b0:	00 02                	add    %al,(%edx)
 3b2:	91                   	xchg   %eax,%ecx
 3b3:	00 11                	add    %dl,(%ecx)
 3b5:	73 00                	jae    3b7 <PROT_MODE_DSEG+0x3a7>
 3b7:	01 73 c8             	add    %esi,-0x38(%ebx)
 3ba:	00 00                	add    %al,(%eax)
 3bc:	00 02                	add    %al,(%edx)
 3be:	91                   	xchg   %eax,%ecx
 3bf:	04 09                	add    $0x9,%al
 3c1:	64 65 63 00          	fs arpl %ax,%gs:(%eax)
 3c5:	01 75 b5             	add    %esi,-0x4b(%ebp)
 3c8:	03 00                	add    (%eax),%eax
 3ca:	00 05 03 14 93 00    	add    %al,0x931403
 3d0:	00 13                	add    %dl,(%ebx)
 3d2:	d3 8c 00 00 c5 03 00 	rorl   %cl,0x3c500(%eax,%eax,1)
 3d9:	00 00                	add    %al,(%eax)
 3db:	0a 95 00 00 00 c5    	or     -0x3b000000(%ebp),%dl
 3e1:	03 00                	add    (%eax),%eax
 3e3:	00 0b                	add    %cl,(%ebx)
 3e5:	69 00 00 00 0a 00    	imul   $0xa0000,(%eax),%eax
 3eb:	0d 63 01 00 00       	or     $0x163,%eax
 3f0:	01 61 51             	add    %esp,0x51(%ecx)
 3f3:	8c 00                	mov    %es,(%eax)
 3f5:	00 61 00             	add    %ah,0x0(%ecx)
 3f8:	00 00                	add    %al,(%eax)
 3fa:	01 9c 35 04 00 00 0e 	add    %ebx,0xe000004(%ebp,%esi,1)
 401:	6e                   	outsb  %ds:(%esi),(%dx)
 402:	00 01                	add    %al,(%ecx)
 404:	61                   	popa   
 405:	57                   	push   %edi
 406:	00 00                	add    %al,(%eax)
 408:	00 3e                	add    %bh,(%esi)
 40a:	02 00                	add    (%eax),%al
 40c:	00 11                	add    %dl,(%ecx)
 40e:	73 00                	jae    410 <PROT_MODE_DSEG+0x400>
 410:	01 61 c8             	add    %esp,-0x38(%ecx)
 413:	00 00                	add    %al,(%eax)
 415:	00 02                	add    %al,(%edx)
 417:	91                   	xchg   %eax,%ecx
 418:	04 0f                	add    $0xf,%al
 41a:	ad                   	lods   %ds:(%esi),%eax
 41b:	01 00                	add    %eax,(%eax)
 41d:	00 01                	add    %al,(%ecx)
 41f:	61                   	popa   
 420:	57                   	push   %edi
 421:	00 00                	add    %al,(%eax)
 423:	00 02                	add    %al,(%edx)
 425:	91                   	xchg   %eax,%ecx
 426:	08 0f                	or     %cl,(%edi)
 428:	a9 03 00 00 01       	test   $0x1000003,%eax
 42d:	61                   	popa   
 42e:	c8 00 00 00          	enter  $0x0,$0x0
 432:	02 91 0c 1e 69 00    	add    0x691e0c(%ecx),%dl
 438:	01 63 57             	add    %esp,0x57(%ebx)
 43b:	00 00                	add    %al,(%eax)
 43d:	00 5d 02             	add    %bl,0x2(%ebp)
 440:	00 00                	add    %al,(%eax)
 442:	12 91 01 00 00 01    	adc    0x1000001(%ecx),%dl
 448:	63 57 00             	arpl   %dx,0x0(%edi)
 44b:	00 00                	add    %al,(%eax)
 44d:	91                   	xchg   %eax,%ecx
 44e:	02 00                	add    (%eax),%al
 450:	00 1f                	add    %bl,(%edi)
 452:	b2 8c                	mov    $0x8c,%dl
 454:	00 00                	add    %al,(%eax)
 456:	35 04 00 00 00       	xor    $0x4,%eax
 45b:	0d 96 01 00 00       	or     $0x196,%eax
 460:	01 52 21             	add    %edx,0x21(%edx)
 463:	8c 00                	mov    %es,(%eax)
 465:	00 30                	add    %dh,(%eax)
 467:	00 00                	add    %al,(%eax)
 469:	00 01                	add    %al,(%ecx)
 46b:	9c                   	pushf  
 46c:	85 04 00             	test   %eax,(%eax,%eax,1)
 46f:	00 11                	add    %dl,(%ecx)
 471:	73 00                	jae    473 <PROT_MODE_DSEG+0x463>
 473:	01 52 c8             	add    %edx,-0x38(%edx)
 476:	00 00                	add    %al,(%eax)
 478:	00 02                	add    %al,(%edx)
 47a:	91                   	xchg   %eax,%ecx
 47b:	00 1e                	add    %bl,(%esi)
 47d:	69 00 01 54 57 00    	imul   $0x575401,(%eax),%eax
 483:	00 00                	add    %al,(%eax)
 485:	a5                   	movsl  %ds:(%esi),%es:(%edi)
 486:	02 00                	add    (%eax),%al
 488:	00 09                	add    %cl,(%ecx)
 48a:	6a 00                	push   $0x0
 48c:	01 54 57 00          	add    %edx,0x0(%edi,%edx,2)
 490:	00 00                	add    %al,(%eax)
 492:	01 50 1e             	add    %edx,0x1e(%eax)
 495:	63 00                	arpl   %ax,(%eax)
 497:	01 55 95             	add    %edx,-0x6b(%ebp)
 49a:	00 00                	add    %al,(%eax)
 49c:	00 c4                	add    %al,%ah
 49e:	02 00                	add    (%eax),%al
 4a0:	00 13                	add    %dl,(%ebx)
 4a2:	2f                   	das    
 4a3:	8c 00                	mov    %es,(%eax)
 4a5:	00 85 04 00 00 00    	add    %al,0x4(%ebp)
 4ab:	20 80 01 00 00 01    	and    %al,0x1000001(%eax)
 4b1:	47                   	inc    %edi
 4b2:	57                   	push   %edi
 4b3:	00 00                	add    %al,(%eax)
 4b5:	00 0e                	add    %cl,(%esi)
 4b7:	8c 00                	mov    %es,(%eax)
 4b9:	00 13                	add    %dl,(%ebx)
 4bb:	00 00                	add    %al,(%eax)
 4bd:	00 01                	add    %al,(%ecx)
 4bf:	9c                   	pushf  
 4c0:	b9 04 00 00 0e       	mov    $0xe000004,%ecx
 4c5:	73 00                	jae    4c7 <PROT_MODE_DSEG+0x4b7>
 4c7:	01 47 b9             	add    %eax,-0x47(%edi)
 4ca:	04 00                	add    $0x0,%al
 4cc:	00 d7                	add    %dl,%bh
 4ce:	02 00                	add    (%eax),%al
 4d0:	00 1e                	add    %bl,(%esi)
 4d2:	6e                   	outsb  %ds:(%esi),(%dx)
 4d3:	00 01                	add    %al,(%ecx)
 4d5:	49                   	dec    %ecx
 4d6:	57                   	push   %edi
 4d7:	00 00                	add    %al,(%eax)
 4d9:	00 fc                	add    %bh,%ah
 4db:	02 00                	add    (%eax),%al
 4dd:	00 00                	add    %al,(%eax)
 4df:	06                   	push   %es
 4e0:	04 a1                	add    $0xa1,%al
 4e2:	00 00                	add    %al,(%eax)
 4e4:	00 0d 79 00 00 00    	add    %cl,0x79
 4ea:	01 3b                	add    %edi,(%ebx)
 4ec:	fe 8c 00 00 2b 00 00 	decb   0x2b00(%eax,%eax,1)
 4f3:	00 01                	add    %al,(%ecx)
 4f5:	9c                   	pushf  
 4f6:	f4                   	hlt    
 4f7:	04 00                	add    $0x0,%al
 4f9:	00 0e                	add    %cl,(%esi)
 4fb:	69 00 01 3b 4c 00    	imul   $0x4c3b01,(%eax),%eax
 501:	00 00                	add    %al,(%eax)
 503:	1b 03                	sbb    (%ebx),%eax
 505:	00 00                	add    %al,(%eax)
 507:	13 1b                	adc    (%ebx),%ebx
 509:	8d 00                	lea    (%eax),%eax
 50b:	00 15 03 00 00 1f    	add    %dl,0x1f000003
 511:	29 8d 00 00 41 05    	sub    %ecx,0x5410000(%ebp)
 517:	00 00                	add    %al,(%eax)
 519:	00 0d 73 00 00 00    	add    %cl,0x73
 51f:	01 2f                	add    %ebp,(%edi)
 521:	f7 8b 00 00 17 00 00 	testl  $0x9c010000,0x170000(%ebx)
 528:	00 01 9c 
 52b:	1f                   	pop    %ds
 52c:	05 00 00 11 6d       	add    $0x6d110000,%eax
 531:	00 01                	add    %al,(%ecx)
 533:	2f                   	das    
 534:	c8 00 00 00          	enter  $0x0,$0x0
 538:	02 91 00 13 08 8c    	add    -0x73f7ed00(%ecx),%dl
 53e:	00 00                	add    %al,(%eax)
 540:	75 05                	jne    547 <PROT_MODE_DSEG+0x537>
 542:	00 00                	add    %al,(%eax)
 544:	00 0d 67 00 00 00    	add    %cl,0x67
 54a:	01 29                	add    %ebp,(%ecx)
 54c:	df 8b 00 00 18 00    	fisttps 0x180000(%ebx)
 552:	00 00                	add    %al,(%eax)
 554:	01 9c 41 05 00 00 11 	add    %ebx,0x11000005(%ecx,%eax,2)
 55b:	72 00                	jb     55d <PROT_MODE_DSEG+0x54d>
 55d:	01 29                	add    %ebp,(%ecx)
 55f:	57                   	push   %edi
 560:	00 00                	add    %al,(%eax)
 562:	00 02                	add    %al,(%edx)
 564:	91                   	xchg   %eax,%ecx
 565:	00 00                	add    %al,(%eax)
 567:	0d 4f 00 00 00       	or     $0x4f,%eax
 56c:	01 22                	add    %esp,(%edx)
 56e:	95                   	xchg   %eax,%ebp
 56f:	8b 00                	mov    (%eax),%eax
 571:	00 4a 00             	add    %cl,0x0(%edx)
 574:	00 00                	add    %al,(%eax)
 576:	01 9c 75 05 00 00 11 	add    %ebx,0x11000005(%ebp,%esi,2)
 57d:	73 00                	jae    57f <PROT_MODE_DSEG+0x56f>
 57f:	01 22                	add    %esp,(%edx)
 581:	c8 00 00 00          	enter  $0x0,$0x0
 585:	02 91 00 13 ca 8b    	add    -0x7435ed00(%ecx),%dl
 58b:	00 00                	add    %al,(%eax)
 58d:	75 05                	jne    594 <PROT_MODE_DSEG+0x584>
 58f:	00 00                	add    %al,(%eax)
 591:	13 d7                	adc    %edi,%edx
 593:	8b 00                	mov    (%eax),%eax
 595:	00 75 05             	add    %dh,0x5(%ebp)
 598:	00 00                	add    %al,(%eax)
 59a:	00 20                	add    %ah,(%eax)
 59c:	68 01 00 00 01       	push   $0x1000001
 5a1:	12 57 00             	adc    0x0(%edi),%dl
 5a4:	00 00                	add    %al,(%eax)
 5a6:	5e                   	pop    %esi
 5a7:	8b 00                	mov    (%eax),%eax
 5a9:	00 37                	add    %dh,(%edi)
 5ab:	00 00                	add    %al,(%eax)
 5ad:	00 01                	add    %al,(%ecx)
 5af:	9c                   	pushf  
 5b0:	da 05 00 00 11 72    	fiaddl 0x72110000
 5b6:	00 01                	add    %al,(%ecx)
 5b8:	12 57 00             	adc    0x0(%edi),%dl
 5bb:	00 00                	add    %al,(%eax)
 5bd:	02 91 00 11 63 00    	add    0x631100(%ecx),%dl
 5c3:	01 12                	add    %edx,(%edx)
 5c5:	57                   	push   %edi
 5c6:	00 00                	add    %al,(%eax)
 5c8:	00 02                	add    %al,(%edx)
 5ca:	91                   	xchg   %eax,%ecx
 5cb:	04 0f                	add    $0xf,%al
 5cd:	61                   	popa   
 5ce:	00 00                	add    %al,(%eax)
 5d0:	00 01                	add    %al,(%ecx)
 5d2:	12 57 00             	adc    0x0(%edi),%dl
 5d5:	00 00                	add    %al,(%eax)
 5d7:	02 91 08 10 6c 00    	add    0x6c1008(%ecx),%dl
 5dd:	00 00                	add    %al,(%eax)
 5df:	01 12                	add    %edx,(%edx)
 5e1:	b9 04 00 00 2f       	mov    $0x2f000004,%ecx
 5e6:	03 00                	add    (%eax),%eax
 5e8:	00 1e                	add    %bl,(%esi)
 5ea:	6c                   	insb   (%dx),%es:(%edi)
 5eb:	00 01                	add    %al,(%ecx)
 5ed:	14 57                	adc    $0x57,%al
 5ef:	00 00                	add    %al,(%eax)
 5f1:	00 b1 03 00 00 13    	add    %dh,0x13000003(%ecx)
 5f7:	87 8b 00 00 da 05    	xchg   %ecx,0x5da0000(%ebx)
 5fd:	00 00                	add    %al,(%eax)
 5ff:	00 0d 3e 01 00 00    	add    %cl,0x13e
 605:	01 09                	add    %ecx,(%ecx)
 607:	38 8b 00 00 26 00    	cmp    %cl,0x260000(%ebx)
 60d:	00 00                	add    %al,(%eax)
 60f:	01 9c 22 06 00 00 11 	add    %ebx,0x11000006(%edx,%eiz,1)
 616:	6c                   	insb   (%dx),%es:(%edi)
 617:	00 01                	add    %al,(%ecx)
 619:	09 57 00             	or     %edx,0x0(%edi)
 61c:	00 00                	add    %al,(%eax)
 61e:	02 91 00 0f 61 00    	add    0x610f00(%ecx),%dl
 624:	00 00                	add    %al,(%eax)
 626:	01 09                	add    %ecx,(%ecx)
 628:	57                   	push   %edi
 629:	00 00                	add    %al,(%eax)
 62b:	00 02                	add    %al,(%edx)
 62d:	91                   	xchg   %eax,%ecx
 62e:	04 11                	add    $0x11,%al
 630:	63 68 00             	arpl   %bp,0x0(%eax)
 633:	01 09                	add    %ecx,(%ecx)
 635:	95                   	xchg   %eax,%ebp
 636:	00 00                	add    %al,(%eax)
 638:	00 02                	add    %al,(%edx)
 63a:	91                   	xchg   %eax,%ecx
 63b:	08 09                	or     %cl,(%ecx)
 63d:	70 00                	jo     63f <PROT_MODE_DSEG+0x62f>
 63f:	01 0b                	add    %ecx,(%ebx)
 641:	8f 00                	popl   (%eax)
 643:	00 00                	add    %al,(%eax)
 645:	01 50 00             	add    %edx,0x0(%eax)
 648:	21 ac 00 00 00 02 2d 	and    %ebp,0x2d020000(%eax,%eax,1)
 64f:	03 50 06             	add    0x6(%eax),%edx
 652:	00 00                	add    %al,(%eax)
 654:	22 8c 01 00 00 02 2d 	and    0x2d020000(%ecx,%eax,1),%cl
 65b:	57                   	push   %edi
 65c:	00 00                	add    %al,(%eax)
 65e:	00 22                	add    %ah,(%edx)
 660:	c5 03                	lds    (%ebx),%eax
 662:	00 00                	add    %al,(%eax)
 664:	02 2d 0b 03 00 00    	add    0x30b,%ch
 66a:	23 63 6e             	and    0x6e(%ebx),%esp
 66d:	74 00                	je     66f <PROT_MODE_DSEG+0x65f>
 66f:	02 2d 57 00 00 00    	add    0x57,%ch
 675:	00 24 69             	add    %ah,(%ecx,%ebp,2)
 678:	6e                   	outsb  %ds:(%esi),(%dx)
 679:	62 00                	bound  %eax,(%eax)
 67b:	02 25 2c 00 00 00    	add    0x2c,%ah
 681:	03 77 06             	add    0x6(%edi),%esi
 684:	00 00                	add    %al,(%eax)
 686:	22 8c 01 00 00 02 25 	and    0x25020000(%ecx,%eax,1),%cl
 68d:	57                   	push   %edi
 68e:	00 00                	add    %al,(%eax)
 690:	00 25 87 01 00 00    	add    %ah,0x187
 696:	02 27                	add    (%edi),%ah
 698:	2c 00                	sub    $0x0,%al
 69a:	00 00                	add    %al,(%eax)
 69c:	00 26                	add    %ah,(%esi)
 69e:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 69f:	00 00                	add    %al,(%eax)
 6a1:	00 02                	add    %al,(%edx)
 6a3:	19 03                	sbb    %eax,(%ebx)
 6a5:	22 8c 01 00 00 02 19 	and    0x19020000(%ecx,%eax,1),%cl
 6ac:	57                   	push   %edi
 6ad:	00 00                	add    %al,(%eax)
 6af:	00 22                	add    %ah,(%edx)
 6b1:	87 01                	xchg   %eax,(%ecx)
 6b3:	00 00                	add    %al,(%eax)
 6b5:	02 19                	add    (%ecx),%bl
 6b7:	2c 00                	sub    $0x0,%al
 6b9:	00 00                	add    %al,(%eax)
 6bb:	00 00                	add    %al,(%eax)
 6bd:	9a 06 00 00 04 00 1c 	lcall  $0x1c00,$0x4000006
 6c4:	02 00                	add    (%eax),%al
 6c6:	00 04 01             	add    %al,(%ecx,%eax,1)
 6c9:	bf 00 00 00 0c       	mov    $0xc000000,%edi
 6ce:	48                   	dec    %eax
 6cf:	04 00                	add    $0x0,%al
 6d1:	00 13                	add    %dl,(%ebx)
 6d3:	00 00                	add    %al,(%eax)
 6d5:	00 e1                	add    %ah,%cl
 6d7:	8d 00                	lea    (%eax),%eax
 6d9:	00 97 01 00 00 0c    	add    %dl,0xc000001(%edi)
 6df:	02 00                	add    (%eax),%al
 6e1:	00 02                	add    %al,(%edx)
 6e3:	01 06                	add    %eax,(%esi)
 6e5:	2d 01 00 00 03       	sub    $0x3000001,%eax
 6ea:	9f                   	lahf   
 6eb:	00 00                	add    %al,(%eax)
 6ed:	00 02                	add    %al,(%edx)
 6ef:	0d 37 00 00 00       	or     $0x37,%eax
 6f4:	02 01                	add    (%ecx),%al
 6f6:	08 2b                	or     %ch,(%ebx)
 6f8:	01 00                	add    %eax,(%eax)
 6fa:	00 02                	add    %al,(%edx)
 6fc:	02 05 57 00 00 00    	add    0x57,%al
 702:	03 32                	add    (%edx),%esi
 704:	03 00                	add    (%eax),%eax
 706:	00 02                	add    %al,(%edx)
 708:	0f 50                	(bad)  
 70a:	00 00                	add    %al,(%eax)
 70c:	00 02                	add    %al,(%edx)
 70e:	02 07                	add    (%edi),%al
 710:	6d                   	insl   (%dx),%es:(%edi)
 711:	01 00                	add    %eax,(%eax)
 713:	00 04 04             	add    %al,(%esp,%eax,1)
 716:	05 69 6e 74 00       	add    $0x746e69,%eax
 71b:	03 5a 01             	add    0x1(%edx),%ebx
 71e:	00 00                	add    %al,(%eax)
 720:	02 11                	add    (%ecx),%dl
 722:	69 00 00 00 02 04    	imul   $0x4020000,(%eax),%eax
 728:	07                   	pop    %es
 729:	4d                   	dec    %ebp
 72a:	01 00                	add    %eax,(%eax)
 72c:	00 02                	add    %al,(%edx)
 72e:	08 05 b1 00 00 00    	or     %al,0xb1
 734:	03 fe                	add    %esi,%edi
 736:	01 00                	add    %eax,(%eax)
 738:	00 02                	add    %al,(%edx)
 73a:	13 82 00 00 00 02    	adc    0x2000000(%edx),%eax
 740:	08 07                	or     %al,(%edi)
 742:	43                   	inc    %ebx
 743:	01 00                	add    %eax,(%eax)
 745:	00 05 10 02 65 d9    	add    %al,0xd9650210
 74b:	00 00                	add    %al,(%eax)
 74d:	00 06                	add    %al,(%esi)
 74f:	24 03                	and    $0x3,%al
 751:	00 00                	add    %al,(%eax)
 753:	02 67 2c             	add    0x2c(%edi),%ah
 756:	00 00                	add    %al,(%eax)
 758:	00 00                	add    %al,(%eax)
 75a:	06                   	push   %es
 75b:	06                   	push   %es
 75c:	03 00                	add    (%eax),%eax
 75e:	00 02                	add    %al,(%edx)
 760:	6a d9                	push   $0xffffffd9
 762:	00 00                	add    %al,(%eax)
 764:	00 01                	add    %al,(%ecx)
 766:	07                   	pop    %es
 767:	69 64 00 02 6b 2c 00 	imul   $0x2c6b,0x2(%eax,%eax,1),%esp
 76e:	00 
 76f:	00 04 06             	add    %al,(%esi,%eax,1)
 772:	b7 03                	mov    $0x3,%bh
 774:	00 00                	add    %al,(%eax)
 776:	02 6f d9             	add    -0x27(%edi),%ch
 779:	00 00                	add    %al,(%eax)
 77b:	00 05 06 fb 03 00    	add    %al,0x3fb06
 781:	00 02                	add    %al,(%edx)
 783:	70 5e                	jo     7e3 <PROT_MODE_DSEG+0x7d3>
 785:	00 00                	add    %al,(%eax)
 787:	00 08                	add    %cl,(%eax)
 789:	06                   	push   %es
 78a:	b7 04                	mov    $0x4,%bh
 78c:	00 00                	add    %al,(%eax)
 78e:	02 71 5e             	add    0x5e(%ecx),%dh
 791:	00 00                	add    %al,(%eax)
 793:	00 0c 00             	add    %cl,(%eax,%eax,1)
 796:	08 2c 00             	or     %ch,(%eax,%eax,1)
 799:	00 00                	add    %al,(%eax)
 79b:	e9 00 00 00 09       	jmp    90007a0 <_end+0x8ff73d4>
 7a0:	69 00 00 00 02 00    	imul   $0x20000,(%eax),%eax
 7a6:	0a 6d 62             	or     0x62(%ebp),%ch
 7a9:	72 00                	jb     7ab <PROT_MODE_DSEG+0x79b>
 7ab:	00 02                	add    %al,(%edx)
 7ad:	02 61 2a             	add    0x2a(%ecx),%ah
 7b0:	01 00                	add    %eax,(%eax)
 7b2:	00 06                	add    %al,(%esi)
 7b4:	24 02                	and    $0x2,%al
 7b6:	00 00                	add    %al,(%eax)
 7b8:	02 63 2a             	add    0x2a(%ebx),%ah
 7bb:	01 00                	add    %eax,(%eax)
 7bd:	00 00                	add    %al,(%eax)
 7bf:	0b b8 01 00 00 02    	or     0x2000001(%eax),%edi
 7c5:	64 3b 01             	cmp    %fs:(%ecx),%eax
 7c8:	00 00                	add    %al,(%eax)
 7ca:	b4 01                	mov    $0x1,%ah
 7cc:	0b bc 02 00 00 02 72 	or     0x72020000(%edx,%eax,1),%edi
 7d3:	4b                   	dec    %ebx
 7d4:	01 00                	add    %eax,(%eax)
 7d6:	00 be 01 0b 24 04    	add    %bh,0x4240b01(%esi)
 7dc:	00 00                	add    %al,(%eax)
 7de:	02 73 5b             	add    0x5b(%ebx),%dh
 7e1:	01 00                	add    %eax,(%eax)
 7e3:	00 fe                	add    %bh,%dh
 7e5:	01 00                	add    %eax,(%eax)
 7e7:	08 2c 00             	or     %ch,(%eax,%eax,1)
 7ea:	00 00                	add    %al,(%eax)
 7ec:	3b 01                	cmp    (%ecx),%eax
 7ee:	00 00                	add    %al,(%eax)
 7f0:	0c 69                	or     $0x69,%al
 7f2:	00 00                	add    %al,(%eax)
 7f4:	00 b3 01 00 08 2c    	add    %dh,0x2c080001(%ebx)
 7fa:	00 00                	add    %al,(%eax)
 7fc:	00 4b 01             	add    %cl,0x1(%ebx)
 7ff:	00 00                	add    %al,(%eax)
 801:	09 69 00             	or     %ebp,0x0(%ecx)
 804:	00 00                	add    %al,(%eax)
 806:	09 00                	or     %eax,(%eax)
 808:	08 89 00 00 00 5b    	or     %cl,0x5b000000(%ecx)
 80e:	01 00                	add    %eax,(%eax)
 810:	00 09                	add    %cl,(%ecx)
 812:	69 00 00 00 03 00    	imul   $0x30000,(%eax),%eax
 818:	08 2c 00             	or     %ch,(%eax,%eax,1)
 81b:	00 00                	add    %al,(%eax)
 81d:	6b 01 00             	imul   $0x0,(%ecx),%eax
 820:	00 09                	add    %cl,(%ecx)
 822:	69 00 00 00 01 00    	imul   $0x10000,(%eax),%eax
 828:	03 8e 02 00 00 02    	add    0x2000002(%esi),%ecx
 82e:	74 e9                	je     819 <PROT_MODE_DSEG+0x809>
 830:	00 00                	add    %al,(%eax)
 832:	00 0d 10 03 00 00    	add    %cl,0x310
 838:	18 02                	sbb    %al,(%edx)
 83a:	7e b3                	jle    7ef <PROT_MODE_DSEG+0x7df>
 83c:	01 00                	add    %eax,(%eax)
 83e:	00 06                	add    %al,(%esi)
 840:	f6 03 00             	testb  $0x0,(%ebx)
 843:	00 02                	add    %al,(%edx)
 845:	7f 5e                	jg     8a5 <PROT_MODE_DSEG+0x895>
 847:	00 00                	add    %al,(%eax)
 849:	00 00                	add    %al,(%eax)
 84b:	06                   	push   %es
 84c:	c0 03 00             	rolb   $0x0,(%ebx)
 84f:	00 02                	add    %al,(%edx)
 851:	80 77 00 00          	xorb   $0x0,0x0(%edi)
 855:	00 04 06             	add    %al,(%esi,%eax,1)
 858:	40                   	inc    %eax
 859:	03 00                	add    (%eax),%eax
 85b:	00 02                	add    %al,(%edx)
 85d:	81 77 00 00 00 0c 06 	xorl   $0x60c0000,0x0(%edi)
 864:	96                   	xchg   %eax,%esi
 865:	02 00                	add    (%eax),%al
 867:	00 02                	add    %al,(%edx)
 869:	82 5e 00 00          	sbbb   $0x0,0x0(%esi)
 86d:	00 14 00             	add    %dl,(%eax,%eax,1)
 870:	03 c6                	add    %esi,%eax
 872:	02 00                	add    (%eax),%al
 874:	00 02                	add    %al,(%edx)
 876:	83 76 01 00          	xorl   $0x0,0x1(%esi)
 87a:	00 0d c1 01 00 00    	add    %cl,0x1c1
 880:	34 02                	xor    $0x2,%al
 882:	8b 7f 02             	mov    0x2(%edi),%edi
 885:	00 00                	add    %al,(%eax)
 887:	06                   	push   %es
 888:	af                   	scas   %es:(%edi),%eax
 889:	03 00                	add    (%eax),%eax
 88b:	00 02                	add    %al,(%edx)
 88d:	8c 5e 00             	mov    %ds,0x0(%esi)
 890:	00 00                	add    %al,(%eax)
 892:	00 06                	add    %al,(%esi)
 894:	7b 03                	jnp    899 <PROT_MODE_DSEG+0x889>
 896:	00 00                	add    %al,(%eax)
 898:	02 8d 7f 02 00 00    	add    0x27f(%ebp),%cl
 89e:	04 06                	add    $0x6,%al
 8a0:	94                   	xchg   %eax,%esp
 8a1:	02 00                	add    (%eax),%al
 8a3:	00 02                	add    %al,(%edx)
 8a5:	8e 45 00             	mov    0x0(%ebp),%es
 8a8:	00 00                	add    %al,(%eax)
 8aa:	10 06                	adc    %al,(%esi)
 8ac:	3f                   	aas    
 8ad:	02 00                	add    (%eax),%al
 8af:	00 02                	add    %al,(%edx)
 8b1:	8f 45 00             	popl   0x0(%ebp)
 8b4:	00 00                	add    %al,(%eax)
 8b6:	12 06                	adc    (%esi),%al
 8b8:	e9 02 00 00 02       	jmp    20008bf <_end+0x1ff74f3>
 8bd:	90                   	nop
 8be:	5e                   	pop    %esi
 8bf:	00 00                	add    %al,(%eax)
 8c1:	00 14 06             	add    %dl,(%esi,%eax,1)
 8c4:	f6 01 00             	testb  $0x0,(%ecx)
 8c7:	00 02                	add    %al,(%edx)
 8c9:	91                   	xchg   %eax,%ecx
 8ca:	5e                   	pop    %esi
 8cb:	00 00                	add    %al,(%eax)
 8cd:	00 18                	add    %bl,(%eax)
 8cf:	06                   	push   %es
 8d0:	9a 03 00 00 02 92 5e 	lcall  $0x5e92,$0x2000003
 8d7:	00 00                	add    %al,(%eax)
 8d9:	00 1c 06             	add    %bl,(%esi,%eax,1)
 8dc:	d3 03                	roll   %cl,(%ebx)
 8de:	00 00                	add    %al,(%eax)
 8e0:	02 93 5e 00 00 00    	add    0x5e(%ebx),%dl
 8e6:	20 06                	and    %al,(%esi)
 8e8:	2f                   	das    
 8e9:	02 00                	add    (%eax),%al
 8eb:	00 02                	add    %al,(%edx)
 8ed:	94                   	xchg   %eax,%esp
 8ee:	5e                   	pop    %esi
 8ef:	00 00                	add    %al,(%eax)
 8f1:	00 24 06             	add    %ah,(%esi,%eax,1)
 8f4:	b3 02                	mov    $0x2,%bl
 8f6:	00 00                	add    %al,(%eax)
 8f8:	02 95 45 00 00 00    	add    0x45(%ebp),%dl
 8fe:	28 06                	sub    %al,(%esi)
 900:	49                   	dec    %ecx
 901:	02 00                	add    (%eax),%al
 903:	00 02                	add    %al,(%edx)
 905:	96                   	xchg   %eax,%esi
 906:	45                   	inc    %ebp
 907:	00 00                	add    %al,(%eax)
 909:	00 2a                	add    %ch,(%edx)
 90b:	06                   	push   %es
 90c:	1c 04                	sbb    $0x4,%al
 90e:	00 00                	add    %al,(%eax)
 910:	02 97 45 00 00 00    	add    0x45(%edi),%dl
 916:	2c 06                	sub    $0x6,%al
 918:	7c 02                	jl     91c <PROT_MODE_DSEG+0x90c>
 91a:	00 00                	add    %al,(%eax)
 91c:	02 98 45 00 00 00    	add    0x45(%eax),%bl
 922:	2e 06                	cs push %es
 924:	2e 04 00             	cs add $0x0,%al
 927:	00 02                	add    %al,(%edx)
 929:	99                   	cltd   
 92a:	45                   	inc    %ebp
 92b:	00 00                	add    %al,(%eax)
 92d:	00 30                	add    %dh,(%eax)
 92f:	06                   	push   %es
 930:	c8 01 00 00          	enter  $0x1,$0x0
 934:	02 9a 45 00 00 00    	add    0x45(%edx),%bl
 93a:	32 00                	xor    (%eax),%al
 93c:	08 2c 00             	or     %ch,(%eax,%eax,1)
 93f:	00 00                	add    %al,(%eax)
 941:	8f 02                	popl   (%edx)
 943:	00 00                	add    %al,(%eax)
 945:	09 69 00             	or     %ebp,0x0(%ecx)
 948:	00 00                	add    %al,(%eax)
 94a:	0b 00                	or     (%eax),%eax
 94c:	03 dd                	add    %ebp,%ebx
 94e:	01 00                	add    %eax,(%eax)
 950:	00 02                	add    %al,(%edx)
 952:	9b                   	fwait
 953:	be 01 00 00 0d       	mov    $0xd000001,%esi
 958:	74 02                	je     95c <PROT_MODE_DSEG+0x94c>
 95a:	00 00                	add    %al,(%eax)
 95c:	20 02                	and    %al,(%edx)
 95e:	9e                   	sahf   
 95f:	07                   	pop    %es
 960:	03 00                	add    (%eax),%eax
 962:	00 06                	add    %al,(%esi)
 964:	6d                   	insl   (%dx),%es:(%edi)
 965:	02 00                	add    (%eax),%al
 967:	00 02                	add    %al,(%edx)
 969:	9f                   	lahf   
 96a:	5e                   	pop    %esi
 96b:	00 00                	add    %al,(%eax)
 96d:	00 00                	add    %al,(%eax)
 96f:	06                   	push   %es
 970:	1b 02                	sbb    (%edx),%eax
 972:	00 00                	add    %al,(%eax)
 974:	02 a0 5e 00 00 00    	add    0x5e(%eax),%ah
 97a:	04 06                	add    $0x6,%al
 97c:	52                   	push   %edx
 97d:	03 00                	add    (%eax),%eax
 97f:	00 02                	add    %al,(%edx)
 981:	a1 5e 00 00 00       	mov    0x5e,%eax
 986:	08 06                	or     %al,(%esi)
 988:	b2 04                	mov    $0x4,%dl
 98a:	00 00                	add    %al,(%eax)
 98c:	02 a2 5e 00 00 00    	add    0x5e(%edx),%ah
 992:	0c 06                	or     $0x6,%al
 994:	13 04 00             	adc    (%eax,%eax,1),%eax
 997:	00 02                	add    %al,(%edx)
 999:	a3 5e 00 00 00       	mov    %eax,0x5e
 99e:	10 06                	adc    %al,(%esi)
 9a0:	13 02                	adc    (%edx),%eax
 9a2:	00 00                	add    %al,(%eax)
 9a4:	02 a4 5e 00 00 00 14 	add    0x14000000(%esi,%ebx,2),%ah
 9ab:	06                   	push   %es
 9ac:	68 03 00 00 02       	push   $0x2000003
 9b1:	a5                   	movsl  %ds:(%esi),%es:(%edi)
 9b2:	5e                   	pop    %esi
 9b3:	00 00                	add    %al,(%eax)
 9b5:	00 18                	add    %bl,(%eax)
 9b7:	06                   	push   %es
 9b8:	a0 04 00 00 02       	mov    0x2000004,%al
 9bd:	a6                   	cmpsb  %es:(%edi),%ds:(%esi)
 9be:	5e                   	pop    %esi
 9bf:	00 00                	add    %al,(%eax)
 9c1:	00 1c 00             	add    %bl,(%eax,%eax,1)
 9c4:	03 74 02 00          	add    0x0(%edx,%eax,1),%esi
 9c8:	00 02                	add    %al,(%edx)
 9ca:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 9cb:	9a 02 00 00 05 04 02 	lcall  $0x204,$0x5000002
 9d2:	b6 4b                	mov    $0x4b,%dh
 9d4:	03 00                	add    (%eax),%eax
 9d6:	00 06                	add    %al,(%esi)
 9d8:	ff 02                	incl   (%edx)
 9da:	00 00                	add    %al,(%eax)
 9dc:	02 b7 2c 00 00 00    	add    0x2c(%edi),%dh
 9e2:	00 06                	add    %al,(%esi)
 9e4:	f3 02 00             	repz add (%eax),%al
 9e7:	00 02                	add    %al,(%edx)
 9e9:	b8 2c 00 00 00       	mov    $0x2c,%eax
 9ee:	01 06                	add    %eax,(%esi)
 9f0:	f9                   	stc    
 9f1:	02 00                	add    (%eax),%al
 9f3:	00 02                	add    %al,(%edx)
 9f5:	b9 2c 00 00 00       	mov    $0x2c,%ecx
 9fa:	02 06                	add    (%esi),%al
 9fc:	67 02 00             	add    (%bx,%si),%al
 9ff:	00 02                	add    %al,(%edx)
 a01:	ba 2c 00 00 00       	mov    $0x2c,%edx
 a06:	03 00                	add    (%eax),%eax
 a08:	05 10 02 c7 84       	add    $0x84c70210,%eax
 a0d:	03 00                	add    (%eax),%eax
 a0f:	00 06                	add    %al,(%esi)
 a11:	f3 03 00             	repz add (%eax),%eax
 a14:	00 02                	add    %al,(%edx)
 a16:	c8 5e 00 00          	enter  $0x5e,$0x0
 a1a:	00 00                	add    %al,(%eax)
 a1c:	06                   	push   %es
 a1d:	5f                   	pop    %edi
 a1e:	02 00                	add    (%eax),%al
 a20:	00 02                	add    %al,(%edx)
 a22:	c9                   	leave  
 a23:	5e                   	pop    %esi
 a24:	00 00                	add    %al,(%eax)
 a26:	00 04 06             	add    %al,(%esi,%eax,1)
 a29:	c5 03                	lds    (%ebx),%eax
 a2b:	00 00                	add    %al,(%eax)
 a2d:	02 ca                	add    %dl,%cl
 a2f:	5e                   	pop    %esi
 a30:	00 00                	add    %al,(%eax)
 a32:	00 08                	add    %cl,(%eax)
 a34:	06                   	push   %es
 a35:	6a 04                	push   $0x4
 a37:	00 00                	add    %al,(%eax)
 a39:	02 cb                	add    %bl,%cl
 a3b:	5e                   	pop    %esi
 a3c:	00 00                	add    %al,(%eax)
 a3e:	00 0c 00             	add    %cl,(%eax,%eax,1)
 a41:	05 10 02 cd bd       	add    $0xbdcd0210,%eax
 a46:	03 00                	add    (%eax),%eax
 a48:	00 07                	add    %al,(%edi)
 a4a:	6e                   	outsb  %ds:(%esi),(%dx)
 a4b:	75 6d                	jne    aba <PROT_MODE_DSEG+0xaaa>
 a4d:	00 02                	add    %al,(%edx)
 a4f:	ce                   	into   
 a50:	5e                   	pop    %esi
 a51:	00 00                	add    %al,(%eax)
 a53:	00 00                	add    %al,(%eax)
 a55:	06                   	push   %es
 a56:	f6 03 00             	testb  $0x0,(%ebx)
 a59:	00 02                	add    %al,(%edx)
 a5b:	cf                   	iret   
 a5c:	5e                   	pop    %esi
 a5d:	00 00                	add    %al,(%eax)
 a5f:	00 04 06             	add    %al,(%esi,%eax,1)
 a62:	c5 03                	lds    (%ebx),%eax
 a64:	00 00                	add    %al,(%eax)
 a66:	02 d0                	add    %al,%dl
 a68:	5e                   	pop    %esi
 a69:	00 00                	add    %al,(%eax)
 a6b:	00 08                	add    %cl,(%eax)
 a6d:	06                   	push   %es
 a6e:	88 02                	mov    %al,(%edx)
 a70:	00 00                	add    %al,(%eax)
 a72:	02 d1                	add    %cl,%dl
 a74:	5e                   	pop    %esi
 a75:	00 00                	add    %al,(%eax)
 a77:	00 0c 00             	add    %cl,(%eax,%eax,1)
 a7a:	0e                   	push   %cs
 a7b:	10 02                	adc    %al,(%edx)
 a7d:	c6                   	(bad)  
 a7e:	dc 03                	faddl  (%ebx)
 a80:	00 00                	add    %al,(%eax)
 a82:	0f 8d 03 00 00 02    	jge    2000a8b <_end+0x1ff76bf>
 a88:	cc                   	int3   
 a89:	4b                   	dec    %ebx
 a8a:	03 00                	add    (%eax),%eax
 a8c:	00 10                	add    %dl,(%eax)
 a8e:	65 6c                	gs insb (%dx),%es:(%edi)
 a90:	66 00 02             	data16 add %al,(%edx)
 a93:	d2 84 03 00 00 00 0d 	rolb   %cl,0xd000000(%ebx,%eax,1)
 a9a:	47                   	inc    %edi
 a9b:	03 00                	add    (%eax),%eax
 a9d:	00 60 02             	add    %ah,0x2(%eax)
 aa0:	ae                   	scas   %es:(%edi),%al
 aa1:	e5 04                	in     $0x4,%eax
 aa3:	00 00                	add    %al,(%eax)
 aa5:	06                   	push   %es
 aa6:	31 02                	xor    %eax,(%edx)
 aa8:	00 00                	add    %al,(%eax)
 aaa:	02 af 5e 00 00 00    	add    0x5e(%edi),%ch
 ab0:	00 06                	add    %al,(%esi)
 ab2:	1a 03                	sbb    (%ebx),%al
 ab4:	00 00                	add    %al,(%eax)
 ab6:	02 b2 5e 00 00 00    	add    0x5e(%edx),%dh
 abc:	04 06                	add    $0x6,%al
 abe:	db 03                	fildl  (%ebx)
 ac0:	00 00                	add    %al,(%eax)
 ac2:	02 b3 5e 00 00 00    	add    0x5e(%ebx),%dh
 ac8:	08 06                	or     %al,(%esi)
 aca:	81 03 00 00 02 bb    	addl   $0xbb020000,(%ebx)
 ad0:	12 03                	adc    (%ebx),%al
 ad2:	00 00                	add    %al,(%eax)
 ad4:	0c 06                	or     $0x6,%al
 ad6:	37                   	aaa    
 ad7:	02 00                	add    (%eax),%al
 ad9:	00 02                	add    %al,(%edx)
 adb:	be 5e 00 00 00       	mov    $0x5e,%esi
 ae0:	10 06                	adc    %al,(%esi)
 ae2:	5f                   	pop    %edi
 ae3:	04 00                	add    $0x0,%al
 ae5:	00 02                	add    %al,(%edx)
 ae7:	c2 5e 00             	ret    $0x5e
 aea:	00 00                	add    %al,(%eax)
 aec:	14 06                	adc    $0x6,%al
 aee:	55                   	push   %ebp
 aef:	02 00                	add    (%eax),%al
 af1:	00 02                	add    %al,(%edx)
 af3:	c3                   	ret    
 af4:	5e                   	pop    %esi
 af5:	00 00                	add    %al,(%eax)
 af7:	00 18                	add    %bl,(%eax)
 af9:	06                   	push   %es
 afa:	2d 03 00 00 02       	sub    $0x2000003,%eax
 aff:	d3 bd 03 00 00 1c    	sarl   %cl,0x1c000003(%ebp)
 b05:	06                   	push   %es
 b06:	3b 03                	cmp    (%ebx),%eax
 b08:	00 00                	add    %al,(%eax)
 b0a:	02 d6                	add    %dh,%dl
 b0c:	5e                   	pop    %esi
 b0d:	00 00                	add    %al,(%eax)
 b0f:	00 2c 06             	add    %ch,(%esi,%eax,1)
 b12:	d3 01                	roll   %cl,(%ecx)
 b14:	00 00                	add    %al,(%eax)
 b16:	02 d8                	add    %al,%bl
 b18:	5e                   	pop    %esi
 b19:	00 00                	add    %al,(%eax)
 b1b:	00 30                	add    %dh,(%eax)
 b1d:	06                   	push   %es
 b1e:	05 04 00 00 02       	add    $0x2000004,%eax
 b23:	dc 5e 00             	fcompl 0x0(%esi)
 b26:	00 00                	add    %al,(%eax)
 b28:	34 06                	xor    $0x6,%al
 b2a:	9b                   	fwait
 b2b:	02 00                	add    (%eax),%al
 b2d:	00 02                	add    %al,(%edx)
 b2f:	dd 5e 00             	fstpl  0x0(%esi)
 b32:	00 00                	add    %al,(%eax)
 b34:	38 06                	cmp    %al,(%esi)
 b36:	a2 03 00 00 02       	mov    %al,0x2000003
 b3b:	e0 5e                	loopne b9b <PROT_MODE_DSEG+0xb8b>
 b3d:	00 00                	add    %al,(%eax)
 b3f:	00 3c 06             	add    %bh,(%esi,%eax,1)
 b42:	74 04                	je     b48 <PROT_MODE_DSEG+0xb38>
 b44:	00 00                	add    %al,(%eax)
 b46:	02 e3                	add    %bl,%ah
 b48:	5e                   	pop    %esi
 b49:	00 00                	add    %al,(%eax)
 b4b:	00 40 06             	add    %al,0x6(%eax)
 b4e:	a8 04                	test   $0x4,%al
 b50:	00 00                	add    %al,(%eax)
 b52:	02 e6                	add    %dh,%ah
 b54:	5e                   	pop    %esi
 b55:	00 00                	add    %al,(%eax)
 b57:	00 44 06 57          	add    %al,0x57(%esi,%eax,1)
 b5b:	03 00                	add    (%eax),%eax
 b5d:	00 02                	add    %al,(%edx)
 b5f:	e9 5e 00 00 00       	jmp    bc2 <PROT_MODE_DSEG+0xbb2>
 b64:	48                   	dec    %eax
 b65:	06                   	push   %es
 b66:	e5 03                	in     $0x3,%eax
 b68:	00 00                	add    %al,(%eax)
 b6a:	02 ea                	add    %dl,%ch
 b6c:	5e                   	pop    %esi
 b6d:	00 00                	add    %al,(%eax)
 b6f:	00 4c 06 ca          	add    %cl,-0x36(%esi,%eax,1)
 b73:	03 00                	add    (%eax),%eax
 b75:	00 02                	add    %al,(%edx)
 b77:	eb 5e                	jmp    bd7 <PROT_MODE_DSEG+0xbc7>
 b79:	00 00                	add    %al,(%eax)
 b7b:	00 50 06             	add    %dl,0x6(%eax)
 b7e:	85 04 00             	test   %eax,(%eax,%eax,1)
 b81:	00 02                	add    %al,(%edx)
 b83:	ec                   	in     (%dx),%al
 b84:	5e                   	pop    %esi
 b85:	00 00                	add    %al,(%eax)
 b87:	00 54 06 e4          	add    %dl,-0x1c(%esi,%eax,1)
 b8b:	01 00                	add    %eax,(%eax)
 b8d:	00 02                	add    %al,(%edx)
 b8f:	ed                   	in     (%dx),%eax
 b90:	5e                   	pop    %esi
 b91:	00 00                	add    %al,(%eax)
 b93:	00 58 06             	add    %bl,0x6(%eax)
 b96:	36 04 00             	ss add $0x0,%al
 b99:	00 02                	add    %al,(%edx)
 b9b:	ee                   	out    %al,(%dx)
 b9c:	5e                   	pop    %esi
 b9d:	00 00                	add    %al,(%eax)
 b9f:	00 5c 00 03          	add    %bl,0x3(%eax,%eax,1)
 ba3:	d2 02                	rolb   %cl,(%edx)
 ba5:	00 00                	add    %al,(%eax)
 ba7:	02 ef                	add    %bh,%ch
 ba9:	dc 03                	faddl  (%ebx)
 bab:	00 00                	add    %al,(%eax)
 bad:	11 47 03             	adc    %eax,0x3(%edi)
 bb0:	00 00                	add    %al,(%eax)
 bb2:	01 12                	add    %edx,(%edx)
 bb4:	e5 04                	in     $0x4,%eax
 bb6:	00 00                	add    %al,(%eax)
 bb8:	05 03 40 93 00       	add    $0x934003,%eax
 bbd:	00 12                	add    %dl,(%edx)
 bbf:	70 03                	jo     bc4 <PROT_MODE_DSEG+0xbb4>
 bc1:	00 00                	add    %al,(%eax)
 bc3:	01 62 57             	add    %esp,0x57(%edx)
 bc6:	05 00 00 70 8e       	add    $0x8e700000,%eax
 bcb:	00 00                	add    %al,(%eax)
 bcd:	70 00                	jo     bcf <PROT_MODE_DSEG+0xbbf>
 bcf:	00 00                	add    %al,(%eax)
 bd1:	01 9c 57 05 00 00 13 	add    %ebx,0x13000005(%edi,%edx,2)
 bd8:	15 03 00 00 01       	adc    $0x1000003,%eax
 bdd:	62 5d 05             	bound  %ebx,0x5(%ebp)
 be0:	00 00                	add    %al,(%eax)
 be2:	02 91 00 14 70 00    	add    0x701400(%ecx),%dl
 be8:	01 64 5d 05          	add    %esp,0x5(%ebp,%ebx,2)
 bec:	00 00                	add    %al,(%eax)
 bee:	e5 03                	in     $0x3,%eax
 bf0:	00 00                	add    %al,(%eax)
 bf2:	15 97 04 00 00       	adc    $0x497,%eax
 bf7:	01 65 5e             	add    %esp,0x5e(%ebp)
 bfa:	00 00                	add    %al,(%eax)
 bfc:	00 53 04             	add    %dl,0x4(%ebx)
 bff:	00 00                	add    %al,(%eax)
 c01:	16                   	push   %ss
 c02:	95                   	xchg   %eax,%ebp
 c03:	8e 00                	mov    (%eax),%es
 c05:	00 5b 06             	add    %bl,0x6(%ebx)
 c08:	00 00                	add    %al,(%eax)
 c0a:	16                   	push   %ss
 c0b:	b0 8e                	mov    $0x8e,%al
 c0d:	00 00                	add    %al,(%eax)
 c0f:	66 06                	pushw  %es
 c11:	00 00                	add    %al,(%eax)
 c13:	00 17                	add    %dl,(%edi)
 c15:	04 e5                	add    $0xe5,%al
 c17:	04 00                	add    $0x0,%al
 c19:	00 17                	add    %dl,(%edi)
 c1b:	04 b3                	add    $0xb3,%al
 c1d:	01 00                	add    %eax,(%eax)
 c1f:	00 12                	add    %dl,(%edx)
 c21:	07                   	pop    %es
 c22:	02 00                	add    (%eax),%al
 c24:	00 01                	add    %al,(%ecx)
 c26:	4a                   	dec    %edx
 c27:	5e                   	pop    %esi
 c28:	00 00                	add    %al,(%eax)
 c2a:	00 e1                	add    %ah,%cl
 c2c:	8d 00                	lea    (%eax),%eax
 c2e:	00 8f 00 00 00 01    	add    %cl,0x1000000(%edi)
 c34:	9c                   	pushf  
 c35:	c3                   	ret    
 c36:	05 00 00 13 92       	add    $0x92130000,%eax
 c3b:	03 00                	add    (%eax),%eax
 c3d:	00 01                	add    %al,(%ecx)
 c3f:	4a                   	dec    %edx
 c40:	5e                   	pop    %esi
 c41:	00 00                	add    %al,(%eax)
 c43:	00 02                	add    %al,(%edx)
 c45:	91                   	xchg   %eax,%ecx
 c46:	00 14 70             	add    %dl,(%eax,%esi,2)
 c49:	68 00 01 4d c3       	push   $0xc34d0100
 c4e:	05 00 00 99 04       	add    $0x4990000,%eax
 c53:	00 00                	add    %al,(%eax)
 c55:	14 65                	adc    $0x65,%al
 c57:	70 68                	jo     cc1 <PROT_MODE_DSEG+0xcb1>
 c59:	00 01                	add    %al,(%ecx)
 c5b:	4d                   	dec    %ebp
 c5c:	c3                   	ret    
 c5d:	05 00 00 c4 04       	add    $0x4c40000,%eax
 c62:	00 00                	add    %al,(%eax)
 c64:	16                   	push   %ss
 c65:	09 8e 00 00 71 06    	or     %ecx,0x6710000(%esi)
 c6b:	00 00                	add    %al,(%eax)
 c6d:	16                   	push   %ss
 c6e:	27                   	daa    
 c6f:	8e 00                	mov    (%eax),%es
 c71:	00 7c 06 00          	add    %bh,0x0(%esi,%eax,1)
 c75:	00 16                	add    %dl,(%esi)
 c77:	59                   	pop    %ecx
 c78:	8e 00                	mov    (%eax),%es
 c7a:	00 71 06             	add    %dh,0x6(%ecx)
 c7d:	00 00                	add    %al,(%eax)
 c7f:	00 17                	add    %dl,(%edi)
 c81:	04 07                	add    $0x7,%al
 c83:	03 00                	add    (%eax),%eax
 c85:	00 18                	add    %bl,(%eax)
 c87:	df 02                	filds  (%edx)
 c89:	00 00                	add    %al,(%eax)
 c8b:	01 1d e0 8e 00 00    	add    %ebx,0x8ee0
 c91:	98                   	cwtl   
 c92:	00 00                	add    %al,(%eax)
 c94:	00 01                	add    %al,(%ecx)
 c96:	9c                   	pushf  
 c97:	55                   	push   %ebp
 c98:	06                   	push   %es
 c99:	00 00                	add    %al,(%eax)
 c9b:	19 64 65 76          	sbb    %esp,0x76(%ebp,%eiz,2)
 c9f:	00 01                	add    %al,(%ecx)
 ca1:	1d 5e 00 00 00       	sbb    $0x5e,%eax
 ca6:	02 91 00 19 6d 62    	add    0x626d1900(%ecx),%dl
 cac:	72 00                	jb     cae <PROT_MODE_DSEG+0xc9e>
 cae:	01 1d 55 06 00 00    	add    %ebx,0x655
 cb4:	02 91 04 13 15 03    	add    0x3151304(%ecx),%dl
 cba:	00 00                	add    %al,(%eax)
 cbc:	01 1d 5d 05 00 00    	add    %ebx,0x55d
 cc2:	02 91 08 14 69 00    	add    0x691408(%ecx),%dl
 cc8:	01 2e                	add    %ebp,(%esi)
 cca:	57                   	push   %edi
 ccb:	00 00                	add    %al,(%eax)
 ccd:	00 d7                	add    %dl,%bh
 ccf:	04 00                	add    $0x0,%al
 cd1:	00 16                	add    %dl,(%esi)
 cd3:	00 8f 00 00 87 06    	add    %cl,0x6870000(%edi)
 cd9:	00 00                	add    %al,(%eax)
 cdb:	16                   	push   %ss
 cdc:	0e                   	push   %cs
 cdd:	8f 00                	popl   (%eax)
 cdf:	00 5b 06             	add    %bl,0x6(%ebx)
 ce2:	00 00                	add    %al,(%eax)
 ce4:	16                   	push   %ss
 ce5:	35 8f 00 00 7c       	xor    $0x7c00008f,%eax
 cea:	06                   	push   %es
 ceb:	00 00                	add    %al,(%eax)
 ced:	16                   	push   %ss
 cee:	49                   	dec    %ecx
 cef:	8f 00                	popl   (%eax)
 cf1:	00 01                	add    %al,(%ecx)
 cf3:	05 00 00 16 53       	add    $0x53160000,%eax
 cf8:	8f 00                	popl   (%eax)
 cfa:	00 63 05             	add    %ah,0x5(%ebx)
 cfd:	00 00                	add    %al,(%eax)
 cff:	16                   	push   %ss
 d00:	62 8f 00 00 92 06    	bound  %ecx,0x6920000(%edi)
 d06:	00 00                	add    %al,(%eax)
 d08:	16                   	push   %ss
 d09:	70 8f                	jo     c9a <PROT_MODE_DSEG+0xc8a>
 d0b:	00 00                	add    %al,(%eax)
 d0d:	7c 06                	jl     d15 <PROT_MODE_DSEG+0xd05>
 d0f:	00 00                	add    %al,(%eax)
 d11:	00 17                	add    %dl,(%edi)
 d13:	04 6b                	add    $0x6b,%al
 d15:	01 00                	add    %eax,(%eax)
 d17:	00 1a                	add    %bl,(%edx)
 d19:	4f                   	dec    %edi
 d1a:	00 00                	add    %al,(%eax)
 d1c:	00 4f 00             	add    %cl,0x0(%edi)
 d1f:	00 00                	add    %al,(%eax)
 d21:	02 4f 1a             	add    0x1a(%edi),%cl
 d24:	79 00                	jns    d26 <PROT_MODE_DSEG+0xd16>
 d26:	00 00                	add    %al,(%eax)
 d28:	79 00                	jns    d2a <PROT_MODE_DSEG+0xd1a>
 d2a:	00 00                	add    %al,(%eax)
 d2c:	02 50 1a             	add    0x1a(%eax),%dl
 d2f:	1a 01                	sbb    (%ecx),%al
 d31:	00 00                	add    %al,(%eax)
 d33:	1a 01                	sbb    (%ecx),%al
 d35:	00 00                	add    %al,(%eax)
 d37:	02 78 1a             	add    0x1a(%eax),%bh
 d3a:	73 00                	jae    d3c <PROT_MODE_DSEG+0xd2c>
 d3c:	00 00                	add    %al,(%eax)
 d3e:	73 00                	jae    d40 <PROT_MODE_DSEG+0xd30>
 d40:	00 00                	add    %al,(%eax)
 d42:	02 52 1a             	add    0x1a(%edx),%dl
 d45:	67 00 00             	add    %al,(%bx,%si)
 d48:	00 67 00             	add    %ah,0x0(%edi)
 d4b:	00 00                	add    %al,(%eax)
 d4d:	02 51 1a             	add    0x1a(%ecx),%dl
 d50:	a7                   	cmpsl  %es:(%edi),%ds:(%esi)
 d51:	02 00                	add    (%eax),%al
 d53:	00 a7 02 00 00 01    	add    %ah,0x1000002(%edi)
 d59:	10 00                	adc    %al,(%eax)
 d5b:	22 00                	and    (%eax),%al
 d5d:	00 00                	add    %al,(%eax)
 d5f:	02 00                	add    (%eax),%al
 d61:	95                   	xchg   %eax,%ebp
 d62:	03 00                	add    (%eax),%eax
 d64:	00 04 01             	add    %al,(%ecx,%eax,1)
 d67:	bf 02 00 00 7c       	mov    $0x7c000002,%edi
 d6c:	8f 00                	popl   (%eax)
 d6e:	00 8c 8f 00 00 c5 04 	add    %cl,0x4c50000(%edi,%ecx,4)
 d75:	00 00                	add    %al,(%eax)
 d77:	13 00                	adc    (%eax),%eax
 d79:	00 00                	add    %al,(%eax)
 d7b:	33 00                	xor    (%eax),%eax
 d7d:	00 00                	add    %al,(%eax)
 d7f:	01                   	.byte 0x1
 d80:	80                   	.byte 0x80

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	01 11                	add    %edx,(%ecx)
   2:	00 10                	add    %dl,(%eax)
   4:	06                   	push   %es
   5:	11 01                	adc    %eax,(%ecx)
   7:	12 01                	adc    (%ecx),%al
   9:	03 0e                	add    (%esi),%ecx
   b:	1b 0e                	sbb    (%esi),%ecx
   d:	25 0e 13 05 00       	and    $0x5130e,%eax
  12:	00 00                	add    %al,(%eax)
  14:	01 11                	add    %edx,(%ecx)
  16:	01 25 0e 13 0b 03    	add    %esp,0x30b130e
  1c:	0e                   	push   %cs
  1d:	1b 0e                	sbb    (%esi),%ecx
  1f:	11 01                	adc    %eax,(%ecx)
  21:	12 06                	adc    (%esi),%al
  23:	10 17                	adc    %dl,(%edi)
  25:	00 00                	add    %al,(%eax)
  27:	02 24 00             	add    (%eax,%eax,1),%ah
  2a:	0b 0b                	or     (%ebx),%ecx
  2c:	3e 0b 03             	or     %ds:(%ebx),%eax
  2f:	0e                   	push   %cs
  30:	00 00                	add    %al,(%eax)
  32:	03 16                	add    (%esi),%edx
  34:	00 03                	add    %al,(%ebx)
  36:	0e                   	push   %cs
  37:	3a 0b                	cmp    (%ebx),%cl
  39:	3b 0b                	cmp    (%ebx),%ecx
  3b:	49                   	dec    %ecx
  3c:	13 00                	adc    (%eax),%eax
  3e:	00 04 24             	add    %al,(%esp)
  41:	00 0b                	add    %cl,(%ebx)
  43:	0b 3e                	or     (%esi),%edi
  45:	0b 03                	or     (%ebx),%eax
  47:	08 00                	or     %al,(%eax)
  49:	00 05 34 00 03 0e    	add    %al,0xe030034
  4f:	3a 0b                	cmp    (%ebx),%cl
  51:	3b 0b                	cmp    (%ebx),%ecx
  53:	49                   	dec    %ecx
  54:	13 3f                	adc    (%edi),%edi
  56:	19 02                	sbb    %eax,(%edx)
  58:	18 00                	sbb    %al,(%eax)
  5a:	00 06                	add    %al,(%esi)
  5c:	0f 00 0b             	str    (%ebx)
  5f:	0b 49 13             	or     0x13(%ecx),%ecx
  62:	00 00                	add    %al,(%eax)
  64:	07                   	pop    %es
  65:	35 00 49 13 00       	xor    $0x134900,%eax
  6a:	00 08                	add    %cl,(%eax)
  6c:	26 00 49 13          	add    %cl,%es:0x13(%ecx)
  70:	00 00                	add    %al,(%eax)
  72:	09 34 00             	or     %esi,(%eax,%eax,1)
  75:	03 08                	add    (%eax),%ecx
  77:	3a 0b                	cmp    (%ebx),%cl
  79:	3b 0b                	cmp    (%ebx),%ecx
  7b:	49                   	dec    %ecx
  7c:	13 02                	adc    (%edx),%eax
  7e:	18 00                	sbb    %al,(%eax)
  80:	00 0a                	add    %cl,(%edx)
  82:	01 01                	add    %eax,(%ecx)
  84:	49                   	dec    %ecx
  85:	13 01                	adc    (%ecx),%eax
  87:	13 00                	adc    (%eax),%eax
  89:	00 0b                	add    %cl,(%ebx)
  8b:	21 00                	and    %eax,(%eax)
  8d:	49                   	dec    %ecx
  8e:	13 2f                	adc    (%edi),%ebp
  90:	0b 00                	or     (%eax),%eax
  92:	00 0c 34             	add    %cl,(%esp,%esi,1)
  95:	00 03                	add    %al,(%ebx)
  97:	0e                   	push   %cs
  98:	3a 0b                	cmp    (%ebx),%cl
  9a:	3b 0b                	cmp    (%ebx),%ecx
  9c:	49                   	dec    %ecx
  9d:	13 02                	adc    (%edx),%eax
  9f:	18 00                	sbb    %al,(%eax)
  a1:	00 0d 2e 01 3f 19    	add    %cl,0x193f012e
  a7:	03 0e                	add    (%esi),%ecx
  a9:	3a 0b                	cmp    (%ebx),%cl
  ab:	3b 0b                	cmp    (%ebx),%ecx
  ad:	27                   	daa    
  ae:	19 11                	sbb    %edx,(%ecx)
  b0:	01 12                	add    %edx,(%edx)
  b2:	06                   	push   %es
  b3:	40                   	inc    %eax
  b4:	18 97 42 19 01 13    	sbb    %dl,0x13011942(%edi)
  ba:	00 00                	add    %al,(%eax)
  bc:	0e                   	push   %cs
  bd:	05 00 03 08 3a       	add    $0x3a080300,%eax
  c2:	0b 3b                	or     (%ebx),%edi
  c4:	0b 49 13             	or     0x13(%ecx),%ecx
  c7:	02 17                	add    (%edi),%dl
  c9:	00 00                	add    %al,(%eax)
  cb:	0f 05                	syscall 
  cd:	00 03                	add    %al,(%ebx)
  cf:	0e                   	push   %cs
  d0:	3a 0b                	cmp    (%ebx),%cl
  d2:	3b 0b                	cmp    (%ebx),%ecx
  d4:	49                   	dec    %ecx
  d5:	13 02                	adc    (%edx),%eax
  d7:	18 00                	sbb    %al,(%eax)
  d9:	00 10                	add    %dl,(%eax)
  db:	05 00 03 0e 3a       	add    $0x3a0e0300,%eax
  e0:	0b 3b                	or     (%ebx),%edi
  e2:	0b 49 13             	or     0x13(%ecx),%ecx
  e5:	02 17                	add    (%edi),%dl
  e7:	00 00                	add    %al,(%eax)
  e9:	11 05 00 03 08 3a    	adc    %eax,0x3a080300
  ef:	0b 3b                	or     (%ebx),%edi
  f1:	0b 49 13             	or     0x13(%ecx),%ecx
  f4:	02 18                	add    (%eax),%bl
  f6:	00 00                	add    %al,(%eax)
  f8:	12 34 00             	adc    (%eax,%eax,1),%dh
  fb:	03 0e                	add    (%esi),%ecx
  fd:	3a 0b                	cmp    (%ebx),%cl
  ff:	3b 0b                	cmp    (%ebx),%ecx
 101:	49                   	dec    %ecx
 102:	13 02                	adc    (%edx),%eax
 104:	17                   	pop    %ss
 105:	00 00                	add    %al,(%eax)
 107:	13 89 82 01 00 11    	adc    0x11000182(%ecx),%ecx
 10d:	01 31                	add    %esi,(%ecx)
 10f:	13 00                	adc    (%eax),%eax
 111:	00 14 1d 01 31 13 52 	add    %dl,0x52133101(,%ebx,1)
 118:	01 55 17             	add    %edx,0x17(%ebp)
 11b:	58                   	pop    %eax
 11c:	0b 59 0b             	or     0xb(%ecx),%ebx
 11f:	01 13                	add    %edx,(%ebx)
 121:	00 00                	add    %al,(%eax)
 123:	15 1d 01 31 13       	adc    $0x1331011d,%eax
 128:	52                   	push   %edx
 129:	01 55 17             	add    %edx,0x17(%ebp)
 12c:	58                   	pop    %eax
 12d:	0b 59 0b             	or     0xb(%ecx),%ebx
 130:	00 00                	add    %al,(%eax)
 132:	16                   	push   %ss
 133:	05 00 31 13 02       	add    $0x2133100,%eax
 138:	17                   	pop    %ss
 139:	00 00                	add    %al,(%eax)
 13b:	17                   	pop    %ss
 13c:	0b 01                	or     (%ecx),%eax
 13e:	55                   	push   %ebp
 13f:	17                   	pop    %ss
 140:	00 00                	add    %al,(%eax)
 142:	18 34 00             	sbb    %dh,(%eax,%eax,1)
 145:	31 13                	xor    %edx,(%ebx)
 147:	00 00                	add    %al,(%eax)
 149:	19 1d 01 31 13 11    	sbb    %ebx,0x11133101
 14f:	01 12                	add    %edx,(%edx)
 151:	06                   	push   %es
 152:	58                   	pop    %eax
 153:	0b 59 0b             	or     0xb(%ecx),%ebx
 156:	01 13                	add    %edx,(%ebx)
 158:	00 00                	add    %al,(%eax)
 15a:	1a 1d 01 31 13 11    	sbb    0x11133101,%bl
 160:	01 12                	add    %edx,(%edx)
 162:	06                   	push   %es
 163:	58                   	pop    %eax
 164:	0b 59 0b             	or     0xb(%ecx),%ebx
 167:	00 00                	add    %al,(%eax)
 169:	1b 0b                	sbb    (%ebx),%ecx
 16b:	01 11                	add    %edx,(%ecx)
 16d:	01 12                	add    %edx,(%edx)
 16f:	06                   	push   %es
 170:	00 00                	add    %al,(%eax)
 172:	1c 0f                	sbb    $0xf,%al
 174:	00 0b                	add    %cl,(%ebx)
 176:	0b 00                	or     (%eax),%eax
 178:	00 1d 2e 00 03 0e    	add    %bl,0xe03002e
 17e:	3a 0b                	cmp    (%ebx),%cl
 180:	3b 0b                	cmp    (%ebx),%ecx
 182:	27                   	daa    
 183:	19 20                	sbb    %esp,(%eax)
 185:	0b 00                	or     (%eax),%eax
 187:	00 1e                	add    %bl,(%esi)
 189:	34 00                	xor    $0x0,%al
 18b:	03 08                	add    (%eax),%ecx
 18d:	3a 0b                	cmp    (%ebx),%cl
 18f:	3b 0b                	cmp    (%ebx),%ecx
 191:	49                   	dec    %ecx
 192:	13 02                	adc    (%edx),%eax
 194:	17                   	pop    %ss
 195:	00 00                	add    %al,(%eax)
 197:	1f                   	pop    %ds
 198:	89 82 01 00 11 01    	mov    %eax,0x1110001(%edx)
 19e:	95                   	xchg   %eax,%ebp
 19f:	42                   	inc    %edx
 1a0:	19 31                	sbb    %esi,(%ecx)
 1a2:	13 00                	adc    (%eax),%eax
 1a4:	00 20                	add    %ah,(%eax)
 1a6:	2e 01 3f             	add    %edi,%cs:(%edi)
 1a9:	19 03                	sbb    %eax,(%ebx)
 1ab:	0e                   	push   %cs
 1ac:	3a 0b                	cmp    (%ebx),%cl
 1ae:	3b 0b                	cmp    (%ebx),%ecx
 1b0:	27                   	daa    
 1b1:	19 49 13             	sbb    %ecx,0x13(%ecx)
 1b4:	11 01                	adc    %eax,(%ecx)
 1b6:	12 06                	adc    (%esi),%al
 1b8:	40                   	inc    %eax
 1b9:	18 97 42 19 01 13    	sbb    %dl,0x13011942(%edi)
 1bf:	00 00                	add    %al,(%eax)
 1c1:	21 2e                	and    %ebp,(%esi)
 1c3:	01 03                	add    %eax,(%ebx)
 1c5:	0e                   	push   %cs
 1c6:	3a 0b                	cmp    (%ebx),%cl
 1c8:	3b 0b                	cmp    (%ebx),%ecx
 1ca:	27                   	daa    
 1cb:	19 20                	sbb    %esp,(%eax)
 1cd:	0b 01                	or     (%ecx),%eax
 1cf:	13 00                	adc    (%eax),%eax
 1d1:	00 22                	add    %ah,(%edx)
 1d3:	05 00 03 0e 3a       	add    $0x3a0e0300,%eax
 1d8:	0b 3b                	or     (%ebx),%edi
 1da:	0b 49 13             	or     0x13(%ecx),%ecx
 1dd:	00 00                	add    %al,(%eax)
 1df:	23 05 00 03 08 3a    	and    0x3a080300,%eax
 1e5:	0b 3b                	or     (%ebx),%edi
 1e7:	0b 49 13             	or     0x13(%ecx),%ecx
 1ea:	00 00                	add    %al,(%eax)
 1ec:	24 2e                	and    $0x2e,%al
 1ee:	01 03                	add    %eax,(%ebx)
 1f0:	08 3a                	or     %bh,(%edx)
 1f2:	0b 3b                	or     (%ebx),%edi
 1f4:	0b 27                	or     (%edi),%esp
 1f6:	19 49 13             	sbb    %ecx,0x13(%ecx)
 1f9:	20 0b                	and    %cl,(%ebx)
 1fb:	01 13                	add    %edx,(%ebx)
 1fd:	00 00                	add    %al,(%eax)
 1ff:	25 34 00 03 0e       	and    $0xe030034,%eax
 204:	3a 0b                	cmp    (%ebx),%cl
 206:	3b 0b                	cmp    (%ebx),%ecx
 208:	49                   	dec    %ecx
 209:	13 00                	adc    (%eax),%eax
 20b:	00 26                	add    %ah,(%esi)
 20d:	2e 01 03             	add    %eax,%cs:(%ebx)
 210:	0e                   	push   %cs
 211:	3a 0b                	cmp    (%ebx),%cl
 213:	3b 0b                	cmp    (%ebx),%ecx
 215:	27                   	daa    
 216:	19 20                	sbb    %esp,(%eax)
 218:	0b 00                	or     (%eax),%eax
 21a:	00 00                	add    %al,(%eax)
 21c:	01 11                	add    %edx,(%ecx)
 21e:	01 25 0e 13 0b 03    	add    %esp,0x30b130e
 224:	0e                   	push   %cs
 225:	1b 0e                	sbb    (%esi),%ecx
 227:	11 01                	adc    %eax,(%ecx)
 229:	12 06                	adc    (%esi),%al
 22b:	10 17                	adc    %dl,(%edi)
 22d:	00 00                	add    %al,(%eax)
 22f:	02 24 00             	add    (%eax,%eax,1),%ah
 232:	0b 0b                	or     (%ebx),%ecx
 234:	3e 0b 03             	or     %ds:(%ebx),%eax
 237:	0e                   	push   %cs
 238:	00 00                	add    %al,(%eax)
 23a:	03 16                	add    (%esi),%edx
 23c:	00 03                	add    %al,(%ebx)
 23e:	0e                   	push   %cs
 23f:	3a 0b                	cmp    (%ebx),%cl
 241:	3b 0b                	cmp    (%ebx),%ecx
 243:	49                   	dec    %ecx
 244:	13 00                	adc    (%eax),%eax
 246:	00 04 24             	add    %al,(%esp)
 249:	00 0b                	add    %cl,(%ebx)
 24b:	0b 3e                	or     (%esi),%edi
 24d:	0b 03                	or     (%ebx),%eax
 24f:	08 00                	or     %al,(%eax)
 251:	00 05 13 01 0b 0b    	add    %al,0xb0b0113
 257:	3a 0b                	cmp    (%ebx),%cl
 259:	3b 0b                	cmp    (%ebx),%ecx
 25b:	01 13                	add    %edx,(%ebx)
 25d:	00 00                	add    %al,(%eax)
 25f:	06                   	push   %es
 260:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
 265:	0b 3b                	or     (%ebx),%edi
 267:	0b 49 13             	or     0x13(%ecx),%ecx
 26a:	38 0b                	cmp    %cl,(%ebx)
 26c:	00 00                	add    %al,(%eax)
 26e:	07                   	pop    %es
 26f:	0d 00 03 08 3a       	or     $0x3a080300,%eax
 274:	0b 3b                	or     (%ebx),%edi
 276:	0b 49 13             	or     0x13(%ecx),%ecx
 279:	38 0b                	cmp    %cl,(%ebx)
 27b:	00 00                	add    %al,(%eax)
 27d:	08 01                	or     %al,(%ecx)
 27f:	01 49 13             	add    %ecx,0x13(%ecx)
 282:	01 13                	add    %edx,(%ebx)
 284:	00 00                	add    %al,(%eax)
 286:	09 21                	or     %esp,(%ecx)
 288:	00 49 13             	add    %cl,0x13(%ecx)
 28b:	2f                   	das    
 28c:	0b 00                	or     (%eax),%eax
 28e:	00 0a                	add    %cl,(%edx)
 290:	13 01                	adc    (%ecx),%eax
 292:	03 08                	add    (%eax),%ecx
 294:	0b 05 3a 0b 3b 0b    	or     0xb3b0b3a,%eax
 29a:	01 13                	add    %edx,(%ebx)
 29c:	00 00                	add    %al,(%eax)
 29e:	0b 0d 00 03 0e 3a    	or     0x3a0e0300,%ecx
 2a4:	0b 3b                	or     (%ebx),%edi
 2a6:	0b 49 13             	or     0x13(%ecx),%ecx
 2a9:	38 05 00 00 0c 21    	cmp    %al,0x210c0000
 2af:	00 49 13             	add    %cl,0x13(%ecx)
 2b2:	2f                   	das    
 2b3:	05 00 00 0d 13       	add    $0x130d0000,%eax
 2b8:	01 03                	add    %eax,(%ebx)
 2ba:	0e                   	push   %cs
 2bb:	0b 0b                	or     (%ebx),%ecx
 2bd:	3a 0b                	cmp    (%ebx),%cl
 2bf:	3b 0b                	cmp    (%ebx),%ecx
 2c1:	01 13                	add    %edx,(%ebx)
 2c3:	00 00                	add    %al,(%eax)
 2c5:	0e                   	push   %cs
 2c6:	17                   	pop    %ss
 2c7:	01 0b                	add    %ecx,(%ebx)
 2c9:	0b 3a                	or     (%edx),%edi
 2cb:	0b 3b                	or     (%ebx),%edi
 2cd:	0b 01                	or     (%ecx),%eax
 2cf:	13 00                	adc    (%eax),%eax
 2d1:	00 0f                	add    %cl,(%edi)
 2d3:	0d 00 03 0e 3a       	or     $0x3a0e0300,%eax
 2d8:	0b 3b                	or     (%ebx),%edi
 2da:	0b 49 13             	or     0x13(%ecx),%ecx
 2dd:	00 00                	add    %al,(%eax)
 2df:	10 0d 00 03 08 3a    	adc    %cl,0x3a080300
 2e5:	0b 3b                	or     (%ebx),%edi
 2e7:	0b 49 13             	or     0x13(%ecx),%ecx
 2ea:	00 00                	add    %al,(%eax)
 2ec:	11 34 00             	adc    %esi,(%eax,%eax,1)
 2ef:	03 0e                	add    (%esi),%ecx
 2f1:	3a 0b                	cmp    (%ebx),%cl
 2f3:	3b 0b                	cmp    (%ebx),%ecx
 2f5:	49                   	dec    %ecx
 2f6:	13 3f                	adc    (%edi),%edi
 2f8:	19 02                	sbb    %eax,(%edx)
 2fa:	18 00                	sbb    %al,(%eax)
 2fc:	00 12                	add    %dl,(%edx)
 2fe:	2e 01 3f             	add    %edi,%cs:(%edi)
 301:	19 03                	sbb    %eax,(%ebx)
 303:	0e                   	push   %cs
 304:	3a 0b                	cmp    (%ebx),%cl
 306:	3b 0b                	cmp    (%ebx),%ecx
 308:	27                   	daa    
 309:	19 49 13             	sbb    %ecx,0x13(%ecx)
 30c:	11 01                	adc    %eax,(%ecx)
 30e:	12 06                	adc    (%esi),%al
 310:	40                   	inc    %eax
 311:	18 97 42 19 01 13    	sbb    %dl,0x13011942(%edi)
 317:	00 00                	add    %al,(%eax)
 319:	13 05 00 03 0e 3a    	adc    0x3a0e0300,%eax
 31f:	0b 3b                	or     (%ebx),%edi
 321:	0b 49 13             	or     0x13(%ecx),%ecx
 324:	02 18                	add    (%eax),%bl
 326:	00 00                	add    %al,(%eax)
 328:	14 34                	adc    $0x34,%al
 32a:	00 03                	add    %al,(%ebx)
 32c:	08 3a                	or     %bh,(%edx)
 32e:	0b 3b                	or     (%ebx),%edi
 330:	0b 49 13             	or     0x13(%ecx),%ecx
 333:	02 17                	add    (%edi),%dl
 335:	00 00                	add    %al,(%eax)
 337:	15 34 00 03 0e       	adc    $0xe030034,%eax
 33c:	3a 0b                	cmp    (%ebx),%cl
 33e:	3b 0b                	cmp    (%ebx),%ecx
 340:	49                   	dec    %ecx
 341:	13 02                	adc    (%edx),%eax
 343:	17                   	pop    %ss
 344:	00 00                	add    %al,(%eax)
 346:	16                   	push   %ss
 347:	89 82 01 00 11 01    	mov    %eax,0x1110001(%edx)
 34d:	31 13                	xor    %edx,(%ebx)
 34f:	00 00                	add    %al,(%eax)
 351:	17                   	pop    %ss
 352:	0f 00 0b             	str    (%ebx)
 355:	0b 49 13             	or     0x13(%ecx),%ecx
 358:	00 00                	add    %al,(%eax)
 35a:	18 2e                	sbb    %ch,(%esi)
 35c:	01 3f                	add    %edi,(%edi)
 35e:	19 03                	sbb    %eax,(%ebx)
 360:	0e                   	push   %cs
 361:	3a 0b                	cmp    (%ebx),%cl
 363:	3b 0b                	cmp    (%ebx),%ecx
 365:	27                   	daa    
 366:	19 11                	sbb    %edx,(%ecx)
 368:	01 12                	add    %edx,(%edx)
 36a:	06                   	push   %es
 36b:	40                   	inc    %eax
 36c:	18 97 42 19 01 13    	sbb    %dl,0x13011942(%edi)
 372:	00 00                	add    %al,(%eax)
 374:	19 05 00 03 08 3a    	sbb    %eax,0x3a080300
 37a:	0b 3b                	or     (%ebx),%edi
 37c:	0b 49 13             	or     0x13(%ecx),%ecx
 37f:	02 18                	add    (%eax),%bl
 381:	00 00                	add    %al,(%eax)
 383:	1a 2e                	sbb    (%esi),%ch
 385:	00 3f                	add    %bh,(%edi)
 387:	19 3c 19             	sbb    %edi,(%ecx,%ebx,1)
 38a:	6e                   	outsb  %ds:(%esi),(%dx)
 38b:	0e                   	push   %cs
 38c:	03 0e                	add    (%esi),%ecx
 38e:	3a 0b                	cmp    (%ebx),%cl
 390:	3b 0b                	cmp    (%ebx),%ecx
 392:	00 00                	add    %al,(%eax)
 394:	00 01                	add    %al,(%ecx)
 396:	11 00                	adc    %eax,(%eax)
 398:	10 06                	adc    %al,(%esi)
 39a:	11 01                	adc    %eax,(%ecx)
 39c:	12 01                	adc    (%ecx),%al
 39e:	03 0e                	add    (%esi),%ecx
 3a0:	1b 0e                	sbb    (%esi),%ecx
 3a2:	25 0e 13 05 00       	and    $0x5130e,%eax
 3a7:	00 00                	add    %al,(%eax)

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	8b 00                	mov    (%eax),%eax
   2:	00 00                	add    %al,(%eax)
   4:	02 00                	add    (%eax),%al
   6:	29 00                	sub    %eax,(%eax)
   8:	00 00                	add    %al,(%eax)
   a:	01 01                	add    %eax,(%ecx)
   c:	fb                   	sti    
   d:	0e                   	push   %cs
   e:	0d 00 01 01 01       	or     $0x1010100,%eax
  13:	01 00                	add    %eax,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	01 00                	add    %eax,(%eax)
  19:	00 01                	add    %al,(%ecx)
  1b:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  1e:	74 2f                	je     4f <PROT_MODE_DSEG+0x3f>
  20:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  23:	74 31                	je     56 <PROT_MODE_DSEG+0x46>
  25:	00 00                	add    %al,(%eax)
  27:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  2a:	74 31                	je     5d <PROT_MODE_DSEG+0x4d>
  2c:	2e 53                	cs push %ebx
  2e:	00 01                	add    %al,(%ecx)
  30:	00 00                	add    %al,(%eax)
  32:	00 00                	add    %al,(%eax)
  34:	05 02 00 7e 00       	add    $0x7e0002,%eax
  39:	00 03                	add    %al,(%ebx)
  3b:	c1 00 01             	roll   $0x1,(%eax)
  3e:	21 27                	and    %esp,(%edi)
  40:	2f                   	das    
  41:	2f                   	das    
  42:	2f                   	das    
  43:	2f                   	das    
  44:	30 2f                	xor    %ch,(%edi)
  46:	2f                   	das    
  47:	2f                   	das    
  48:	2f                   	das    
  49:	03 0a                	add    (%edx),%ecx
  4b:	2e 3d 03 0c 3c 3d    	cs cmp $0x3d3c0c03,%eax
  51:	67 3e 67 67 30 2f    	addr16 addr16 xor %ch,%ds:(%bx)
  57:	67 30 83 3d 4b       	xor    %al,0x4b3d(%bp,%di)
  5c:	2f                   	das    
  5d:	30 2f                	xor    %ch,(%edi)
  5f:	3d 2f 30 3d 3d       	cmp    $0x3d3d302f,%eax
  64:	31 03                	xor    %eax,(%ebx)
  66:	0a 20                	or     (%eax),%ah
  68:	03 14 58             	add    (%eax,%ebx,2),%edx
  6b:	3d 2f 3d 03 0d       	cmp    $0xd033d2f,%eax
  70:	58                   	pop    %eax
  71:	4b                   	dec    %ebx
  72:	2f                   	das    
  73:	2f                   	das    
  74:	2f                   	das    
  75:	2f                   	das    
  76:	03 0a                	add    (%edx),%ecx
  78:	2e 59                	cs pop %ecx
  7a:	59                   	pop    %ecx
  7b:	59                   	pop    %ecx
  7c:	21 5c 03 0a          	and    %ebx,0xa(%ebx,%eax,1)
  80:	20 21                	and    %ah,(%ecx)
  82:	30 21                	xor    %ah,(%ecx)
  84:	2f                   	das    
  85:	2f                   	das    
  86:	2f                   	das    
  87:	30 21                	xor    %ah,(%ecx)
  89:	02 90 19 00 01 01    	add    0x1010019(%eax),%dl
  8f:	79 01                	jns    92 <PROT_MODE_DSEG+0x82>
  91:	00 00                	add    %al,(%eax)
  93:	02 00                	add    (%eax),%al
  95:	3a 00                	cmp    (%eax),%al
  97:	00 00                	add    %al,(%eax)
  99:	01 01                	add    %eax,(%ecx)
  9b:	fb                   	sti    
  9c:	0e                   	push   %cs
  9d:	0d 00 01 01 01       	or     $0x1010100,%eax
  a2:	01 00                	add    %eax,(%eax)
  a4:	00 00                	add    %al,(%eax)
  a6:	01 00                	add    %eax,(%eax)
  a8:	00 01                	add    %al,(%ecx)
  aa:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  ad:	74 2f                	je     de <PROT_MODE_DSEG+0xce>
  af:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  b2:	74 31                	je     e5 <PROT_MODE_DSEG+0xd5>
  b4:	00 00                	add    %al,(%eax)
  b6:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  b9:	74 31                	je     ec <PROT_MODE_DSEG+0xdc>
  bb:	6c                   	insb   (%dx),%es:(%edi)
  bc:	69 62 2e 63 00 01 00 	imul   $0x10063,0x2e(%edx),%esp
  c3:	00 62 6f             	add    %ah,0x6f(%edx)
  c6:	6f                   	outsl  %ds:(%esi),(%dx)
  c7:	74 31                	je     fa <PROT_MODE_DSEG+0xea>
  c9:	6c                   	insb   (%dx),%es:(%edi)
  ca:	69 62 2e 68 00 01 00 	imul   $0x10068,0x2e(%edx),%esp
  d1:	00 00                	add    %al,(%eax)
  d3:	00 05 02 38 8b 00    	add    %al,0x8b3802
  d9:	00 03                	add    %al,(%ebx)
  db:	09 01                	or     %eax,(%ecx)
  dd:	d6                   	(bad)  
  de:	3d 83 59 67 33       	cmp    $0x33675983,%eax
  e3:	59                   	pop    %ecx
  e4:	49                   	dec    %ecx
  e5:	3d 59 ca 08 23       	cmp    $0x2308ca59,%eax
  ea:	03 09                	add    (%ecx),%ecx
  ec:	74 ad                	je     9b <PROT_MODE_DSEG+0x8b>
  ee:	b9 3d 00 02 04       	mov    $0x402003d,%ecx
  f3:	04 06                	add    $0x6,%al
  f5:	9e                   	sahf   
  f6:	00 02                	add    %al,(%edx)
  f8:	04 04                	add    $0x4,%al
  fa:	06                   	push   %es
  fb:	08 13                	or     %dl,(%ebx)
  fd:	00 02                	add    %al,(%edx)
  ff:	04 04                	add    $0x4,%al
 101:	c9                   	leave  
 102:	86 c9                	xchg   %cl,%cl
 104:	3d 1f 67 24 3d       	cmp    $0x3d24671f,%eax
 109:	00 02                	add    %al,(%edx)
 10b:	04 01                	add    $0x1,%al
 10d:	08 15 03 14 3c 23    	or     %dl,0x233c1403
 113:	2b 2e                	sub    (%esi),%ebp
 115:	00 02                	add    %al,(%edx)
 117:	04 01                	add    $0x1,%al
 119:	3f                   	aas    
 11a:	00 02                	add    %al,(%edx)
 11c:	04 03                	add    $0x3,%al
 11e:	67 3e 33 58 40       	xor    %ds:0x40(%bx,%si),%ebx
 123:	00 02                	add    %al,(%edx)
 125:	04 01                	add    $0x1,%al
 127:	06                   	push   %es
 128:	9e                   	sahf   
 129:	00 02                	add    %al,(%edx)
 12b:	04 03                	add    $0x3,%al
 12d:	06                   	push   %es
 12e:	4c                   	dec    %esp
 12f:	00 02                	add    %al,(%edx)
 131:	04 03                	add    $0x3,%al
 133:	4b                   	dec    %ebx
 134:	00 02                	add    %al,(%edx)
 136:	04 03                	add    $0x3,%al
 138:	63 00                	arpl   %ax,(%eax)
 13a:	02 04 03             	add    (%ebx,%eax,1),%al
 13d:	24 00                	and    $0x0,%al
 13f:	02 04 03             	add    (%ebx,%eax,1),%al
 142:	54                   	push   %esp
 143:	42                   	inc    %edx
 144:	79 ac                	jns    f2 <PROT_MODE_DSEG+0xe2>
 146:	00 02                	add    %al,(%edx)
 148:	04 01                	add    $0x1,%al
 14a:	08 ec                	or     %ch,%ah
 14c:	00 02                	add    %al,(%edx)
 14e:	04 01                	add    $0x1,%al
 150:	91                   	xchg   %eax,%ecx
 151:	00 02                	add    %al,(%edx)
 153:	04 01                	add    $0x1,%al
 155:	2d 00 02 04 01       	sub    $0x1040200,%eax
 15a:	67 2d 4c 67 75 4b    	addr16 sub $0x4b75674c,%eax
 160:	3d 65 5d ae 64       	cmp    $0x64ae5d65,%eax
 165:	30 d7                	xor    %dl,%bh
 167:	5d                   	pop    %ebp
 168:	ae                   	scas   %es:(%edi),%al
 169:	64 30 d7             	fs xor %dl,%bh
 16c:	03 bd 7f 58 d7 e5    	add    -0x1a28a781(%ebp),%edi
 172:	59                   	pop    %ecx
 173:	49                   	dec    %ecx
 174:	03 d1                	add    %ecx,%edx
 176:	00 58 04             	add    %bl,0x4(%eax)
 179:	02 03                	add    (%ebx),%al
 17b:	99                   	cltd   
 17c:	7f 4a                	jg     1c8 <PROT_MODE_DSEG+0x1b8>
 17e:	04 01                	add    $0x1,%al
 180:	03 e7                	add    %edi,%esp
 182:	00 58 04             	add    %bl,0x4(%eax)
 185:	02 03                	add    (%ebx),%al
 187:	99                   	cltd   
 188:	7f 3c                	jg     1c6 <PROT_MODE_DSEG+0x1b6>
 18a:	04 01                	add    $0x1,%al
 18c:	03 e1                	add    %ecx,%esp
 18e:	00 3c 04             	add    %bh,(%esp,%eax,1)
 191:	02 03                	add    (%ebx),%al
 193:	92                   	xchg   %eax,%edx
 194:	7f 74                	jg     20a <PROT_MODE_DSEG+0x1fa>
 196:	04 01                	add    $0x1,%al
 198:	03 fa                	add    %edx,%edi
 19a:	00 f2                	add    %dh,%dl
 19c:	04 02                	add    $0x2,%al
 19e:	03 86 7f 2e 04 01    	add    0x1042e7f(%esi),%eax
 1a4:	03 fa                	add    %edx,%edi
 1a6:	00 58 04             	add    %bl,0x4(%eax)
 1a9:	02 03                	add    (%ebx),%al
 1ab:	86 7f 3c             	xchg   %bh,0x3c(%edi)
 1ae:	04 01                	add    $0x1,%al
 1b0:	03 fb                	add    %ebx,%edi
 1b2:	00 20                	add    %ah,(%eax)
 1b4:	04 02                	add    $0x2,%al
 1b6:	03 85 7f 2e 04 01    	add    0x1042e7f(%ebp),%eax
 1bc:	03 fb                	add    %ebx,%edi
 1be:	00 58 04             	add    %bl,0x4(%eax)
 1c1:	02 03                	add    (%ebx),%al
 1c3:	85 7f 3c             	test   %edi,0x3c(%edi)
 1c6:	04 01                	add    $0x1,%al
 1c8:	03 fc                	add    %esp,%edi
 1ca:	00 20                	add    %ah,(%eax)
 1cc:	04 02                	add    $0x2,%al
 1ce:	03 84 7f 2e 04 01 03 	add    0x301042e(%edi,%edi,2),%eax
 1d5:	fc                   	cld    
 1d6:	00 58 04             	add    %bl,0x4(%eax)
 1d9:	02 03                	add    (%ebx),%al
 1db:	84 7f 66             	test   %bh,0x66(%edi)
 1de:	03 0d 66 04 01 03    	add    0x3010466,%ecx
 1e4:	e1 00                	loope  1e6 <PROT_MODE_DSEG+0x1d6>
 1e6:	66 04 02             	data16 add $0x2,%al
 1e9:	03 a6 7f 74 04 01    	add    0x104747f(%esi),%esp
 1ef:	03 f0                	add    %eax,%esi
 1f1:	00 f2                	add    %dh,%dl
 1f3:	42                   	inc    %edx
 1f4:	66 03 09             	add    (%ecx),%cx
 1f7:	3c 03                	cmp    $0x3,%al
 1f9:	7a 3c                	jp     237 <PROT_MODE_DSEG+0x227>
 1fb:	31 63 6c             	xor    %esp,0x6c(%ebx)
 1fe:	37                   	aaa    
 1ff:	41                   	inc    %ecx
 200:	41                   	inc    %ecx
 201:	4c                   	dec    %esp
 202:	30 1f                	xor    %bl,(%edi)
 204:	65 5a                	gs pop %edx
 206:	4c                   	dec    %esp
 207:	02 08                	add    (%eax),%cl
 209:	00 01                	add    %al,(%ecx)
 20b:	01 af 00 00 00 02    	add    %ebp,0x2000000(%edi)
 211:	00 3b                	add    %bh,(%ebx)
 213:	00 00                	add    %al,(%eax)
 215:	00 01                	add    %al,(%ecx)
 217:	01 fb                	add    %edi,%ebx
 219:	0e                   	push   %cs
 21a:	0d 00 01 01 01       	or     $0x1010100,%eax
 21f:	01 00                	add    %eax,(%eax)
 221:	00 00                	add    %al,(%eax)
 223:	01 00                	add    %eax,(%eax)
 225:	00 01                	add    %al,(%ecx)
 227:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 22a:	74 2f                	je     25b <PROT_MODE_DSEG+0x24b>
 22c:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 22f:	74 31                	je     262 <PROT_MODE_DSEG+0x252>
 231:	00 00                	add    %al,(%eax)
 233:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 236:	74 31                	je     269 <PROT_MODE_DSEG+0x259>
 238:	6d                   	insl   (%dx),%es:(%edi)
 239:	61                   	popa   
 23a:	69 6e 2e 63 00 01 00 	imul   $0x10063,0x2e(%esi),%ebp
 241:	00 62 6f             	add    %ah,0x6f(%edx)
 244:	6f                   	outsl  %ds:(%esi),(%dx)
 245:	74 31                	je     278 <PROT_MODE_DSEG+0x268>
 247:	6c                   	insb   (%dx),%es:(%edi)
 248:	69 62 2e 68 00 01 00 	imul   $0x10068,0x2e(%edx),%esp
 24f:	00 00                	add    %al,(%eax)
 251:	00 05 02 e1 8d 00    	add    %al,0x8de102
 257:	00 03                	add    %al,(%ebx)
 259:	ca 00 01             	lret   $0x100
 25c:	08 40 08             	or     %al,0x8(%eax)
 25f:	3f                   	aas    
 260:	e5 08                	in     $0x8,%eax
 262:	23 59 73             	and    0x73(%ecx),%ebx
 265:	67 00 02             	add    %al,(%bp,%si)
 268:	04 01                	add    $0x1,%al
 26a:	5a                   	pop    %edx
 26b:	00 02                	add    %al,(%edx)
 26d:	04 02                	add    $0x2,%al
 26f:	4c                   	dec    %esp
 270:	00 02                	add    %al,(%edx)
 272:	04 02                	add    $0x2,%al
 274:	64 00 02             	add    %al,%fs:(%edx)
 277:	04 02                	add    $0x2,%al
 279:	3e 00 02             	add    %al,%ds:(%edx)
 27c:	04 02                	add    $0x2,%al
 27e:	aa                   	stos   %al,%es:(%edi)
 27f:	5d                   	pop    %ebp
 280:	59                   	pop    %ecx
 281:	49                   	dec    %ecx
 282:	59                   	pop    %ecx
 283:	4e                   	dec    %esi
 284:	6a c4                	push   $0xffffffc4
 286:	3c 41                	cmp    $0x41,%al
 288:	bb e6 3e 3a 68       	mov    $0x683a3ee6,%ebx
 28d:	00 02                	add    %al,(%edx)
 28f:	04 01                	add    $0x1,%al
 291:	54                   	push   %esp
 292:	00 02                	add    %al,(%edx)
 294:	04 02                	add    $0x2,%al
 296:	06                   	push   %es
 297:	9e                   	sahf   
 298:	06                   	push   %es
 299:	7a 67                	jp     302 <PROT_MODE_DSEG+0x2f2>
 29b:	68 03 ac 7f d6       	push   $0xd67fac03
 2a0:	03 10                	add    (%eax),%edx
 2a2:	66 03 70 c8          	add    -0x38(%eax),%si
 2a6:	3c 3e                	cmp    $0x3e,%al
 2a8:	76 03                	jbe    2ad <PROT_MODE_DSEG+0x29d>
 2aa:	0e                   	push   %cs
 2ab:	08 12                	or     %dl,(%edx)
 2ad:	e6 1d                	out    %al,$0x1d
 2af:	5e                   	pop    %esi
 2b0:	08 23                	or     %ah,(%ebx)
 2b2:	6d                   	insl   (%dx),%es:(%edi)
 2b3:	03 79 66             	add    0x66(%ecx),%edi
 2b6:	5f                   	pop    %edi
 2b7:	08 86 d8 02 08 00    	or     %al,0x802d8(%esi)
 2bd:	01 01                	add    %eax,(%ecx)
 2bf:	46                   	inc    %esi
 2c0:	00 00                	add    %al,(%eax)
 2c2:	00 02                	add    %al,(%edx)
 2c4:	00 2f                	add    %ch,(%edi)
 2c6:	00 00                	add    %al,(%eax)
 2c8:	00 01                	add    %al,(%ecx)
 2ca:	01 fb                	add    %edi,%ebx
 2cc:	0e                   	push   %cs
 2cd:	0d 00 01 01 01       	or     $0x1010100,%eax
 2d2:	01 00                	add    %eax,(%eax)
 2d4:	00 00                	add    %al,(%eax)
 2d6:	01 00                	add    %eax,(%eax)
 2d8:	00 01                	add    %al,(%ecx)
 2da:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 2dd:	74 2f                	je     30e <PROT_MODE_DSEG+0x2fe>
 2df:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 2e2:	74 31                	je     315 <PROT_MODE_DSEG+0x305>
 2e4:	00 00                	add    %al,(%eax)
 2e6:	65 78 65             	gs js  34e <PROT_MODE_DSEG+0x33e>
 2e9:	63 5f 6b             	arpl   %bx,0x6b(%edi)
 2ec:	65 72 6e             	gs jb  35d <PROT_MODE_DSEG+0x34d>
 2ef:	65 6c                	gs insb (%dx),%es:(%edi)
 2f1:	2e 53                	cs push %ebx
 2f3:	00 01                	add    %al,(%ecx)
 2f5:	00 00                	add    %al,(%eax)
 2f7:	00 00                	add    %al,(%eax)
 2f9:	05 02 7c 8f 00       	add    $0x8f7c02,%eax
 2fe:	00 17                	add    %dl,(%edi)
 300:	21 59 4b             	and    %ebx,0x4b(%ecx)
 303:	4b                   	dec    %ebx
 304:	02 02                	add    (%edx),%al
 306:	00 01                	add    %al,(%ecx)
 308:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	62 6f 6f             	bound  %ebp,0x6f(%edi)
   3:	74 2f                	je     34 <PROT_MODE_DSEG+0x24>
   5:	62 6f 6f             	bound  %ebp,0x6f(%edi)
   8:	74 31                	je     3b <PROT_MODE_DSEG+0x2b>
   a:	2f                   	das    
   b:	62 6f 6f             	bound  %ebp,0x6f(%edi)
   e:	74 31                	je     41 <PROT_MODE_DSEG+0x31>
  10:	2e 53                	cs push %ebx
  12:	00 2f                	add    %ch,(%edi)
  14:	68 6f 6d 65 2f       	push   $0x2f656d6f
  19:	73 6d                	jae    88 <PROT_MODE_DSEG+0x78>
  1b:	63 2f                	arpl   %bp,(%edi)
  1d:	47                   	inc    %edi
  1e:	49                   	dec    %ecx
  1f:	54                   	push   %esp
  20:	2f                   	das    
  21:	6f                   	outsl  %ds:(%esi),(%dx)
  22:	73 2d                	jae    51 <PROT_MODE_DSEG+0x41>
  24:	73 31                	jae    57 <PROT_MODE_DSEG+0x47>
  26:	39 2d 73 61 77 79    	cmp    %ebp,0x79776173
  2c:	65 72 6d             	gs jb  9c <PROT_MODE_DSEG+0x8c>
  2f:	61                   	popa   
  30:	64 65 00 47 4e       	fs add %al,%gs:0x4e(%edi)
  35:	55                   	push   %ebp
  36:	20 41 53             	and    %al,0x53(%ecx)
  39:	20 32                	and    %dh,(%edx)
  3b:	2e 33 30             	xor    %cs:(%eax),%esi
  3e:	00 65 6e             	add    %ah,0x6e(%ebp)
  41:	64 5f                	fs pop %edi
  43:	76 61                	jbe    a6 <PROT_MODE_DSEG+0x96>
  45:	00 77 61             	add    %dh,0x61(%edi)
  48:	69 74 64 69 73 6b 00 	imul   $0x70006b73,0x69(%esp,%eiz,2),%esi
  4f:	70 
  50:	75 74                	jne    c6 <PROT_MODE_DSEG+0xb6>
  52:	6c                   	insb   (%dx),%es:(%edi)
  53:	69 6e 65 00 73 68 6f 	imul   $0x6f687300,0x65(%esi),%ebp
  5a:	72 74                	jb     d0 <PROT_MODE_DSEG+0xc0>
  5c:	20 69 6e             	and    %ch,0x6e(%ecx)
  5f:	74 00                	je     61 <PROT_MODE_DSEG+0x51>
  61:	63 6f 6c             	arpl   %bp,0x6c(%edi)
  64:	6f                   	outsl  %ds:(%esi),(%dx)
  65:	72 00                	jb     67 <PROT_MODE_DSEG+0x57>
  67:	72 6f                	jb     d8 <PROT_MODE_DSEG+0xc8>
  69:	6c                   	insb   (%dx),%es:(%edi)
  6a:	6c                   	insb   (%dx),%es:(%edi)
  6b:	00 73 74             	add    %dh,0x74(%ebx)
  6e:	72 69                	jb     d9 <PROT_MODE_DSEG+0xc9>
  70:	6e                   	outsb  %ds:(%esi),(%dx)
  71:	67 00 70 61          	add    %dh,0x61(%bx,%si)
  75:	6e                   	outsb  %ds:(%esi),(%dx)
  76:	69 63 00 70 75 74 69 	imul   $0x69747570,0x0(%ebx),%esp
  7d:	00 72 65             	add    %dh,0x65(%edx)
  80:	61                   	popa   
  81:	64 73 65             	fs jae e9 <PROT_MODE_DSEG+0xd9>
  84:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
  88:	00 62 6f             	add    %ah,0x6f(%edx)
  8b:	6f                   	outsl  %ds:(%esi),(%dx)
  8c:	74 2f                	je     bd <PROT_MODE_DSEG+0xad>
  8e:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  91:	74 31                	je     c4 <PROT_MODE_DSEG+0xb4>
  93:	2f                   	das    
  94:	62 6f 6f             	bound  %ebp,0x6f(%edi)
  97:	74 31                	je     ca <PROT_MODE_DSEG+0xba>
  99:	6c                   	insb   (%dx),%es:(%edi)
  9a:	69 62 2e 63 00 75 69 	imul   $0x69750063,0x2e(%edx),%esp
  a1:	6e                   	outsb  %ds:(%esi),(%dx)
  a2:	74 38                	je     dc <PROT_MODE_DSEG+0xcc>
  a4:	5f                   	pop    %edi
  a5:	74 00                	je     a7 <PROT_MODE_DSEG+0x97>
  a7:	6f                   	outsl  %ds:(%esi),(%dx)
  a8:	75 74                	jne    11e <PROT_MODE_DSEG+0x10e>
  aa:	62 00                	bound  %eax,(%eax)
  ac:	69 6e 73 6c 00 6c 6f 	imul   $0x6f6c006c,0x73(%esi),%ebp
  b3:	6e                   	outsb  %ds:(%esi),(%dx)
  b4:	67 20 6c 6f          	and    %ch,0x6f(%si)
  b8:	6e                   	outsb  %ds:(%esi),(%dx)
  b9:	67 20 69 6e          	and    %ch,0x6e(%bx,%di)
  bd:	74 00                	je     bf <PROT_MODE_DSEG+0xaf>
  bf:	47                   	inc    %edi
  c0:	4e                   	dec    %esi
  c1:	55                   	push   %ebp
  c2:	20 43 31             	and    %al,0x31(%ebx)
  c5:	31 20                	xor    %esp,(%eax)
  c7:	37                   	aaa    
  c8:	2e 33 2e             	xor    %cs:(%esi),%ebp
  cb:	30 20                	xor    %ah,(%eax)
  cd:	2d 6d 33 32 20       	sub    $0x2032336d,%eax
  d2:	2d 6d 74 75 6e       	sub    $0x6e75746d,%eax
  d7:	65 3d 67 65 6e 65    	gs cmp $0x656e6567,%eax
  dd:	72 69                	jb     148 <PROT_MODE_DSEG+0x138>
  df:	63 20                	arpl   %sp,(%eax)
  e1:	2d 6d 61 72 63       	sub    $0x6372616d,%eax
  e6:	68 3d 69 36 38       	push   $0x3836693d
  eb:	36 20 2d 67 20 2d 4f 	and    %ch,%ss:0x4f2d2067
  f2:	73 20                	jae    114 <PROT_MODE_DSEG+0x104>
  f4:	2d 4f 73 20 2d       	sub    $0x2d20734f,%eax
  f9:	66 6e                	data16 outsb %ds:(%esi),(%dx)
  fb:	6f                   	outsl  %ds:(%esi),(%dx)
  fc:	2d 62 75 69 6c       	sub    $0x6c697562,%eax
 101:	74 69                	je     16c <PROT_MODE_DSEG+0x15c>
 103:	6e                   	outsb  %ds:(%esi),(%dx)
 104:	20 2d 66 6e 6f 2d    	and    %ch,0x2d6f6e66
 10a:	73 74                	jae    180 <PROT_MODE_DSEG+0x170>
 10c:	61                   	popa   
 10d:	63 6b 2d             	arpl   %bp,0x2d(%ebx)
 110:	70 72                	jo     184 <PROT_MODE_DSEG+0x174>
 112:	6f                   	outsl  %ds:(%esi),(%dx)
 113:	74 65                	je     17a <PROT_MODE_DSEG+0x16a>
 115:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
 119:	00 72 65             	add    %dh,0x65(%edx)
 11c:	61                   	popa   
 11d:	64 73 65             	fs jae 185 <PROT_MODE_DSEG+0x175>
 120:	63 74 69 6f          	arpl   %si,0x6f(%ecx,%ebp,2)
 124:	6e                   	outsb  %ds:(%esi),(%dx)
 125:	00 69 74             	add    %ch,0x74(%ecx)
 128:	6f                   	outsl  %ds:(%esi),(%dx)
 129:	61                   	popa   
 12a:	00 75 6e             	add    %dh,0x6e(%ebp)
 12d:	73 69                	jae    198 <PROT_MODE_DSEG+0x188>
 12f:	67 6e                	outsb  %ds:(%si),(%dx)
 131:	65 64 20 63 68       	gs and %ah,%fs:0x68(%ebx)
 136:	61                   	popa   
 137:	72 00                	jb     139 <PROT_MODE_DSEG+0x129>
 139:	69 74 6f 68 00 70 75 	imul   $0x74757000,0x68(%edi,%ebp,2),%esi
 140:	74 
 141:	63 00                	arpl   %ax,(%eax)
 143:	6c                   	insb   (%dx),%es:(%edi)
 144:	6f                   	outsl  %ds:(%esi),(%dx)
 145:	6e                   	outsb  %ds:(%esi),(%dx)
 146:	67 20 6c 6f          	and    %ch,0x6f(%si)
 14a:	6e                   	outsb  %ds:(%esi),(%dx)
 14b:	67 20 75 6e          	and    %dh,0x6e(%di)
 14f:	73 69                	jae    1ba <PROT_MODE_DSEG+0x1aa>
 151:	67 6e                	outsb  %ds:(%si),(%dx)
 153:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 158:	74 00                	je     15a <PROT_MODE_DSEG+0x14a>
 15a:	75 69                	jne    1c5 <PROT_MODE_DSEG+0x1b5>
 15c:	6e                   	outsb  %ds:(%esi),(%dx)
 15d:	74 33                	je     192 <PROT_MODE_DSEG+0x182>
 15f:	32 5f 74             	xor    0x74(%edi),%bl
 162:	00 69 74             	add    %ch,0x74(%ecx)
 165:	6f                   	outsl  %ds:(%esi),(%dx)
 166:	78 00                	js     168 <PROT_MODE_DSEG+0x158>
 168:	70 75                	jo     1df <PROT_MODE_DSEG+0x1cf>
 16a:	74 73                	je     1df <PROT_MODE_DSEG+0x1cf>
 16c:	00 73 68             	add    %dh,0x68(%ebx)
 16f:	6f                   	outsl  %ds:(%esi),(%dx)
 170:	72 74                	jb     1e6 <PROT_MODE_DSEG+0x1d6>
 172:	20 75 6e             	and    %dh,0x6e(%ebp)
 175:	73 69                	jae    1e0 <PROT_MODE_DSEG+0x1d0>
 177:	67 6e                	outsb  %ds:(%si),(%dx)
 179:	65 64 20 69 6e       	gs and %ch,%fs:0x6e(%ecx)
 17e:	74 00                	je     180 <PROT_MODE_DSEG+0x170>
 180:	73 74                	jae    1f6 <PROT_MODE_DSEG+0x1e6>
 182:	72 6c                	jb     1f0 <PROT_MODE_DSEG+0x1e0>
 184:	65 6e                	outsb  %gs:(%esi),(%dx)
 186:	00 64 61 74          	add    %ah,0x74(%ecx,%eiz,2)
 18a:	61                   	popa   
 18b:	00 70 6f             	add    %dh,0x6f(%eax)
 18e:	72 74                	jb     204 <PROT_MODE_DSEG+0x1f4>
 190:	00 73 69             	add    %dh,0x69(%ebx)
 193:	67 6e                	outsb  %ds:(%si),(%dx)
 195:	00 72 65             	add    %dh,0x65(%edx)
 198:	76 65                	jbe    1ff <PROT_MODE_DSEG+0x1ef>
 19a:	72 73                	jb     20f <PROT_MODE_DSEG+0x1ff>
 19c:	65 00 70 75          	add    %dh,%gs:0x75(%eax)
 1a0:	74 69                	je     20b <PROT_MODE_DSEG+0x1fb>
 1a2:	5f                   	pop    %edi
 1a3:	73 74                	jae    219 <PROT_MODE_DSEG+0x209>
 1a5:	72 00                	jb     1a7 <PROT_MODE_DSEG+0x197>
 1a7:	62 6c 61 6e          	bound  %ebp,0x6e(%ecx,%eiz,2)
 1ab:	6b 00 72             	imul   $0x72,(%eax),%eax
 1ae:	6f                   	outsl  %ds:(%esi),(%dx)
 1af:	6f                   	outsl  %ds:(%esi),(%dx)
 1b0:	74 00                	je     1b2 <PROT_MODE_DSEG+0x1a2>
 1b2:	76 69                	jbe    21d <PROT_MODE_DSEG+0x20d>
 1b4:	64 65 6f             	fs outsl %gs:(%esi),(%dx)
 1b7:	00 64 69 73          	add    %ah,0x73(%ecx,%ebp,2)
 1bb:	6b 5f 73 69          	imul   $0x69,0x73(%edi),%ebx
 1bf:	67 00 65 6c          	add    %ah,0x6c(%di)
 1c3:	66 68 64 66          	pushw  $0x6664
 1c7:	00 65 5f             	add    %ah,0x5f(%ebp)
 1ca:	73 68                	jae    234 <PROT_MODE_DSEG+0x224>
 1cc:	73 74                	jae    242 <PROT_MODE_DSEG+0x232>
 1ce:	72 6e                	jb     23e <PROT_MODE_DSEG+0x22e>
 1d0:	64 78 00             	fs js  1d3 <PROT_MODE_DSEG+0x1c3>
 1d3:	6d                   	insl   (%dx),%es:(%edi)
 1d4:	6d                   	insl   (%dx),%es:(%edi)
 1d5:	61                   	popa   
 1d6:	70 5f                	jo     237 <PROT_MODE_DSEG+0x227>
 1d8:	61                   	popa   
 1d9:	64 64 72 00          	fs fs jb 1dd <PROT_MODE_DSEG+0x1cd>
 1dd:	65 6c                	gs insb (%dx),%es:(%edi)
 1df:	66 68 64 72          	pushw  $0x7264
 1e3:	00 76 62             	add    %dh,0x62(%esi)
 1e6:	65 5f                	gs pop %edi
 1e8:	69 6e 74 65 72 66 61 	imul   $0x61667265,0x74(%esi),%ebp
 1ef:	63 65 5f             	arpl   %sp,0x5f(%ebp)
 1f2:	6f                   	outsl  %ds:(%esi),(%dx)
 1f3:	66 66 00 65 5f       	data16 data16 add %ah,0x5f(%ebp)
 1f8:	65 6e                	outsb  %gs:(%esi),(%dx)
 1fa:	74 72                	je     26e <PROT_MODE_DSEG+0x25e>
 1fc:	79 00                	jns    1fe <PROT_MODE_DSEG+0x1ee>
 1fe:	75 69                	jne    269 <PROT_MODE_DSEG+0x259>
 200:	6e                   	outsb  %ds:(%esi),(%dx)
 201:	74 36                	je     239 <PROT_MODE_DSEG+0x229>
 203:	34 5f                	xor    $0x5f,%al
 205:	74 00                	je     207 <PROT_MODE_DSEG+0x1f7>
 207:	6c                   	insb   (%dx),%es:(%edi)
 208:	6f                   	outsl  %ds:(%esi),(%dx)
 209:	61                   	popa   
 20a:	64 5f                	fs pop %edi
 20c:	6b 65 72 6e          	imul   $0x6e,0x72(%ebp),%esp
 210:	65 6c                	gs insb (%dx),%es:(%edi)
 212:	00 70 5f             	add    %dh,0x5f(%eax)
 215:	6d                   	insl   (%dx),%es:(%edi)
 216:	65 6d                	gs insl (%dx),%es:(%edi)
 218:	73 7a                	jae    294 <PROT_MODE_DSEG+0x284>
 21a:	00 70 5f             	add    %dh,0x5f(%eax)
 21d:	6f                   	outsl  %ds:(%esi),(%dx)
 21e:	66 66 73 65          	data16 data16 jae 287 <PROT_MODE_DSEG+0x277>
 222:	74 00                	je     224 <PROT_MODE_DSEG+0x214>
 224:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 227:	74 6c                	je     295 <PROT_MODE_DSEG+0x285>
 229:	6f                   	outsl  %ds:(%esi),(%dx)
 22a:	61                   	popa   
 22b:	64 65 72 00          	fs gs jb 22f <PROT_MODE_DSEG+0x21f>
 22f:	65 5f                	gs pop %edi
 231:	66 6c                	data16 insb (%dx),%es:(%edi)
 233:	61                   	popa   
 234:	67 73 00             	addr16 jae 237 <PROT_MODE_DSEG+0x227>
 237:	63 6d 64             	arpl   %bp,0x64(%ebp)
 23a:	6c                   	insb   (%dx),%es:(%edi)
 23b:	69 6e 65 00 65 5f 6d 	imul   $0x6d5f6500,0x65(%esi),%ebp
 242:	61                   	popa   
 243:	63 68 69             	arpl   %bp,0x69(%eax)
 246:	6e                   	outsb  %ds:(%esi),(%dx)
 247:	65 00 65 5f          	add    %ah,%gs:0x5f(%ebp)
 24b:	70 68                	jo     2b5 <PROT_MODE_DSEG+0x2a5>
 24d:	65 6e                	outsb  %gs:(%esi),(%dx)
 24f:	74 73                	je     2c4 <PROT_MODE_DSEG+0x2b4>
 251:	69 7a 65 00 6d 6f 64 	imul   $0x646f6d00,0x65(%edx),%edi
 258:	73 5f                	jae    2b9 <PROT_MODE_DSEG+0x2a9>
 25a:	61                   	popa   
 25b:	64 64 72 00          	fs fs jb 25f <PROT_MODE_DSEG+0x24f>
 25f:	73 74                	jae    2d5 <PROT_MODE_DSEG+0x2c5>
 261:	72 73                	jb     2d6 <PROT_MODE_DSEG+0x2c6>
 263:	69 7a 65 00 70 61 72 	imul   $0x72617000,0x65(%edx),%edi
 26a:	74 33                	je     29f <PROT_MODE_DSEG+0x28f>
 26c:	00 70 5f             	add    %dh,0x5f(%eax)
 26f:	74 79                	je     2ea <PROT_MODE_DSEG+0x2da>
 271:	70 65                	jo     2d8 <PROT_MODE_DSEG+0x2c8>
 273:	00 70 72             	add    %dh,0x72(%eax)
 276:	6f                   	outsl  %ds:(%esi),(%dx)
 277:	67 68 64 72 00 65    	addr16 push $0x65007264
 27d:	5f                   	pop    %edi
 27e:	73 68                	jae    2e8 <PROT_MODE_DSEG+0x2d8>
 280:	65 6e                	outsb  %gs:(%esi),(%dx)
 282:	74 73                	je     2f7 <PROT_MODE_DSEG+0x2e7>
 284:	69 7a 65 00 73 68 6e 	imul   $0x6e687300,0x65(%edx),%edi
 28b:	64 78 00             	fs js  28e <PROT_MODE_DSEG+0x27e>
 28e:	6d                   	insl   (%dx),%es:(%edi)
 28f:	62 72 5f             	bound  %esi,0x5f(%edx)
 292:	74 00                	je     294 <PROT_MODE_DSEG+0x284>
 294:	65 5f                	gs pop %edi
 296:	74 79                	je     311 <PROT_MODE_DSEG+0x301>
 298:	70 65                	jo     2ff <PROT_MODE_DSEG+0x2ef>
 29a:	00 64 72 69          	add    %ah,0x69(%edx,%esi,2)
 29e:	76 65                	jbe    305 <PROT_MODE_DSEG+0x2f5>
 2a0:	73 5f                	jae    301 <PROT_MODE_DSEG+0x2f1>
 2a2:	61                   	popa   
 2a3:	64 64 72 00          	fs fs jb 2a7 <PROT_MODE_DSEG+0x297>
 2a7:	65 78 65             	gs js  30f <PROT_MODE_DSEG+0x2ff>
 2aa:	63 5f 6b             	arpl   %bx,0x6b(%edi)
 2ad:	65 72 6e             	gs jb  31e <PROT_MODE_DSEG+0x30e>
 2b0:	65 6c                	gs insb (%dx),%es:(%edi)
 2b2:	00 65 5f             	add    %ah,0x5f(%ebp)
 2b5:	65 68 73 69 7a 65    	gs push $0x657a6973
 2bb:	00 70 61             	add    %dh,0x61(%eax)
 2be:	72 74                	jb     334 <PROT_MODE_DSEG+0x324>
 2c0:	69 74 69 6f 6e 00 62 	imul   $0x6962006e,0x6f(%ecx,%ebp,2),%esi
 2c7:	69 
 2c8:	6f                   	outsl  %ds:(%esi),(%dx)
 2c9:	73 5f                	jae    32a <PROT_MODE_DSEG+0x31a>
 2cb:	73 6d                	jae    33a <PROT_MODE_DSEG+0x32a>
 2cd:	61                   	popa   
 2ce:	70 5f                	jo     32f <PROT_MODE_DSEG+0x31f>
 2d0:	74 00                	je     2d2 <PROT_MODE_DSEG+0x2c2>
 2d2:	6d                   	insl   (%dx),%es:(%edi)
 2d3:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 2d6:	74 5f                	je     337 <PROT_MODE_DSEG+0x327>
 2d8:	69 6e 66 6f 5f 74 00 	imul   $0x745f6f,0x66(%esi),%ebp
 2df:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 2e2:	74 31                	je     315 <PROT_MODE_DSEG+0x305>
 2e4:	6d                   	insl   (%dx),%es:(%edi)
 2e5:	61                   	popa   
 2e6:	69 6e 00 65 5f 76 65 	imul   $0x65765f65,0x0(%esi),%ebp
 2ed:	72 73                	jb     362 <PROT_MODE_DSEG+0x352>
 2ef:	69 6f 6e 00 70 61 72 	imul   $0x72617000,0x6e(%edi),%ebp
 2f6:	74 31                	je     329 <PROT_MODE_DSEG+0x319>
 2f8:	00 70 61             	add    %dh,0x61(%eax)
 2fb:	72 74                	jb     371 <PROT_MODE_DSEG+0x361>
 2fd:	32 00                	xor    (%eax),%al
 2ff:	64 72 69             	fs jb  36b <PROT_MODE_DSEG+0x35b>
 302:	76 65                	jbe    369 <PROT_MODE_DSEG+0x359>
 304:	72 00                	jb     306 <PROT_MODE_DSEG+0x2f6>
 306:	66 69 72 73 74 5f    	imul   $0x5f74,0x73(%edx),%si
 30c:	63 68 73             	arpl   %bp,0x73(%eax)
 30f:	00 62 69             	add    %ah,0x69(%edx)
 312:	6f                   	outsl  %ds:(%esi),(%dx)
 313:	73 5f                	jae    374 <PROT_MODE_DSEG+0x364>
 315:	73 6d                	jae    384 <PROT_MODE_DSEG+0x374>
 317:	61                   	popa   
 318:	70 00                	jo     31a <PROT_MODE_DSEG+0x30a>
 31a:	6d                   	insl   (%dx),%es:(%edi)
 31b:	65 6d                	gs insl (%dx),%es:(%edi)
 31d:	5f                   	pop    %edi
 31e:	6c                   	insb   (%dx),%es:(%edi)
 31f:	6f                   	outsl  %ds:(%esi),(%dx)
 320:	77 65                	ja     387 <PROT_MODE_DSEG+0x377>
 322:	72 00                	jb     324 <PROT_MODE_DSEG+0x314>
 324:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 327:	74 61                	je     38a <PROT_MODE_DSEG+0x37a>
 329:	62 6c 65 00          	bound  %ebp,0x0(%ebp,%eiz,2)
 32d:	73 79                	jae    3a8 <PROT_MODE_DSEG+0x398>
 32f:	6d                   	insl   (%dx),%es:(%edi)
 330:	73 00                	jae    332 <PROT_MODE_DSEG+0x322>
 332:	75 69                	jne    39d <PROT_MODE_DSEG+0x38d>
 334:	6e                   	outsb  %ds:(%esi),(%dx)
 335:	74 31                	je     368 <PROT_MODE_DSEG+0x358>
 337:	36 5f                	ss pop %edi
 339:	74 00                	je     33b <PROT_MODE_DSEG+0x32b>
 33b:	6d                   	insl   (%dx),%es:(%edi)
 33c:	6d                   	insl   (%dx),%es:(%edi)
 33d:	61                   	popa   
 33e:	70 5f                	jo     39f <PROT_MODE_DSEG+0x38f>
 340:	6c                   	insb   (%dx),%es:(%edi)
 341:	65 6e                	outsb  %gs:(%esi),(%dx)
 343:	67 74 68             	addr16 je 3ae <PROT_MODE_DSEG+0x39e>
 346:	00 6d 62             	add    %ch,0x62(%ebp)
 349:	6f                   	outsl  %ds:(%esi),(%dx)
 34a:	6f                   	outsl  %ds:(%esi),(%dx)
 34b:	74 5f                	je     3ac <PROT_MODE_DSEG+0x39c>
 34d:	69 6e 66 6f 00 70 5f 	imul   $0x5f70006f,0x66(%esi),%ebp
 354:	76 61                	jbe    3b7 <PROT_MODE_DSEG+0x3a7>
 356:	00 76 62             	add    %dh,0x62(%esi)
 359:	65 5f                	gs pop %edi
 35b:	63 6f 6e             	arpl   %bp,0x6e(%edi)
 35e:	74 72                	je     3d2 <PROT_MODE_DSEG+0x3c2>
 360:	6f                   	outsl  %ds:(%esi),(%dx)
 361:	6c                   	insb   (%dx),%es:(%edi)
 362:	5f                   	pop    %edi
 363:	69 6e 66 6f 00 70 5f 	imul   $0x5f70006f,0x66(%esi),%ebp
 36a:	66 6c                	data16 insb (%dx),%es:(%edi)
 36c:	61                   	popa   
 36d:	67 73 00             	addr16 jae 370 <PROT_MODE_DSEG+0x360>
 370:	70 61                	jo     3d3 <PROT_MODE_DSEG+0x3c3>
 372:	72 73                	jb     3e7 <PROT_MODE_DSEG+0x3d7>
 374:	65 5f                	gs pop %edi
 376:	65 38 32             	cmp    %dh,%gs:(%edx)
 379:	30 00                	xor    %al,(%eax)
 37b:	65 5f                	gs pop %edi
 37d:	65 6c                	gs insb (%dx),%es:(%edi)
 37f:	66 00 62 6f          	data16 add %ah,0x6f(%edx)
 383:	6f                   	outsl  %ds:(%esi),(%dx)
 384:	74 5f                	je     3e5 <PROT_MODE_DSEG+0x3d5>
 386:	64 65 76 69          	fs gs jbe 3f3 <PROT_MODE_DSEG+0x3e3>
 38a:	63 65 00             	arpl   %sp,0x0(%ebp)
 38d:	61                   	popa   
 38e:	6f                   	outsl  %ds:(%esi),(%dx)
 38f:	75 74                	jne    405 <PROT_MODE_DSEG+0x3f5>
 391:	00 64 6b 65          	add    %ah,0x65(%ebx,%ebp,2)
 395:	72 6e                	jb     405 <PROT_MODE_DSEG+0x3f5>
 397:	65 6c                	gs insb (%dx),%es:(%edi)
 399:	00 65 5f             	add    %ah,0x5f(%ebp)
 39c:	70 68                	jo     406 <PROT_MODE_DSEG+0x3f6>
 39e:	6f                   	outsl  %ds:(%esi),(%dx)
 39f:	66 66 00 63 6f       	data16 data16 add %ah,0x6f(%ebx)
 3a4:	6e                   	outsb  %ds:(%esi),(%dx)
 3a5:	66 69 67 5f 74 61    	imul   $0x6174,0x5f(%edi),%sp
 3ab:	62 6c 65 00          	bound  %ebp,0x0(%ebp,%eiz,2)
 3af:	65 5f                	gs pop %edi
 3b1:	6d                   	insl   (%dx),%es:(%edi)
 3b2:	61                   	popa   
 3b3:	67 69 63 00 6c 61 73 	imul   $0x7473616c,0x0(%bp,%di),%esp
 3ba:	74 
 3bb:	5f                   	pop    %edi
 3bc:	63 68 73             	arpl   %bp,0x73(%eax)
 3bf:	00 62 61             	add    %ah,0x61(%edx)
 3c2:	73 65                	jae    429 <PROT_MODE_DSEG+0x419>
 3c4:	5f                   	pop    %edi
 3c5:	61                   	popa   
 3c6:	64 64 72 00          	fs fs jb 3ca <PROT_MODE_DSEG+0x3ba>
 3ca:	76 62                	jbe    42e <PROT_MODE_DSEG+0x41e>
 3cc:	65 5f                	gs pop %edi
 3ce:	6d                   	insl   (%dx),%es:(%edi)
 3cf:	6f                   	outsl  %ds:(%esi),(%dx)
 3d0:	64 65 00 65 5f       	fs add %ah,%gs:0x5f(%ebp)
 3d5:	73 68                	jae    43f <PROT_MODE_DSEG+0x42f>
 3d7:	6f                   	outsl  %ds:(%esi),(%dx)
 3d8:	66 66 00 6d 65       	data16 data16 add %ch,0x65(%ebp)
 3dd:	6d                   	insl   (%dx),%es:(%edi)
 3de:	5f                   	pop    %edi
 3df:	75 70                	jne    451 <PROT_MODE_DSEG+0x441>
 3e1:	70 65                	jo     448 <PROT_MODE_DSEG+0x438>
 3e3:	72 00                	jb     3e5 <PROT_MODE_DSEG+0x3d5>
 3e5:	76 62                	jbe    449 <PROT_MODE_DSEG+0x439>
 3e7:	65 5f                	gs pop %edi
 3e9:	6d                   	insl   (%dx),%es:(%edi)
 3ea:	6f                   	outsl  %ds:(%esi),(%dx)
 3eb:	64 65 5f             	fs gs pop %edi
 3ee:	69 6e 66 6f 00 74 61 	imul   $0x6174006f,0x66(%esi),%ebp
 3f5:	62 73 69             	bound  %esi,0x69(%ebx)
 3f8:	7a 65                	jp     45f <PROT_MODE_DSEG+0x44f>
 3fa:	00 66 69             	add    %ah,0x69(%esi)
 3fd:	72 73                	jb     472 <PROT_MODE_DSEG+0x462>
 3ff:	74 5f                	je     460 <PROT_MODE_DSEG+0x450>
 401:	6c                   	insb   (%dx),%es:(%edi)
 402:	62 61 00             	bound  %esp,0x0(%ecx)
 405:	64 72 69             	fs jb  471 <PROT_MODE_DSEG+0x461>
 408:	76 65                	jbe    46f <PROT_MODE_DSEG+0x45f>
 40a:	73 5f                	jae    46b <PROT_MODE_DSEG+0x45b>
 40c:	6c                   	insb   (%dx),%es:(%edi)
 40d:	65 6e                	outsb  %gs:(%esi),(%dx)
 40f:	67 74 68             	addr16 je 47a <PROT_MODE_DSEG+0x46a>
 412:	00 70 5f             	add    %dh,0x5f(%eax)
 415:	66 69 6c 65 73 7a 00 	imul   $0x7a,0x73(%ebp,%eiz,2),%bp
 41c:	65 5f                	gs pop %edi
 41e:	70 68                	jo     488 <PROT_MODE_DSEG+0x478>
 420:	6e                   	outsb  %ds:(%esi),(%dx)
 421:	75 6d                	jne    490 <PROT_MODE_DSEG+0x480>
 423:	00 73 69             	add    %dh,0x69(%ebx)
 426:	67 6e                	outsb  %ds:(%si),(%dx)
 428:	61                   	popa   
 429:	74 75                	je     4a0 <PROT_MODE_DSEG+0x490>
 42b:	72 65                	jb     492 <PROT_MODE_DSEG+0x482>
 42d:	00 65 5f             	add    %ah,0x5f(%ebp)
 430:	73 68                	jae    49a <PROT_MODE_DSEG+0x48a>
 432:	6e                   	outsb  %ds:(%esi),(%dx)
 433:	75 6d                	jne    4a2 <PROT_MODE_DSEG+0x492>
 435:	00 76 62             	add    %dh,0x62(%esi)
 438:	65 5f                	gs pop %edi
 43a:	69 6e 74 65 72 66 61 	imul   $0x61667265,0x74(%esi),%ebp
 441:	63 65 5f             	arpl   %sp,0x5f(%ebp)
 444:	6c                   	insb   (%dx),%es:(%edi)
 445:	65 6e                	outsb  %gs:(%esi),(%dx)
 447:	00 62 6f             	add    %ah,0x6f(%edx)
 44a:	6f                   	outsl  %ds:(%esi),(%dx)
 44b:	74 2f                	je     47c <PROT_MODE_DSEG+0x46c>
 44d:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 450:	74 31                	je     483 <PROT_MODE_DSEG+0x473>
 452:	2f                   	das    
 453:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 456:	74 31                	je     489 <PROT_MODE_DSEG+0x479>
 458:	6d                   	insl   (%dx),%es:(%edi)
 459:	61                   	popa   
 45a:	69 6e 2e 63 00 6d 6f 	imul   $0x6f6d0063,0x2e(%esi),%ebp
 461:	64 73 5f             	fs jae 4c3 <PROT_MODE_DSEG+0x4b3>
 464:	63 6f 75             	arpl   %bp,0x75(%edi)
 467:	6e                   	outsb  %ds:(%esi),(%dx)
 468:	74 00                	je     46a <PROT_MODE_DSEG+0x45a>
 46a:	5f                   	pop    %edi
 46b:	72 65                	jb     4d2 <PROT_MODE_DSEG+0x4c2>
 46d:	73 65                	jae    4d4 <PROT_MODE_DSEG+0x4c4>
 46f:	72 76                	jb     4e7 <PROT_MODE_DSEG+0x4d7>
 471:	65 64 00 62 6f       	gs add %ah,%fs:0x6f(%edx)
 476:	6f                   	outsl  %ds:(%esi),(%dx)
 477:	74 5f                	je     4d8 <PROT_MODE_DSEG+0x4c8>
 479:	6c                   	insb   (%dx),%es:(%edi)
 47a:	6f                   	outsl  %ds:(%esi),(%dx)
 47b:	61                   	popa   
 47c:	64 65 72 5f          	fs gs jb 4df <PROT_MODE_DSEG+0x4cf>
 480:	6e                   	outsb  %ds:(%esi),(%dx)
 481:	61                   	popa   
 482:	6d                   	insl   (%dx),%es:(%edi)
 483:	65 00 76 62          	add    %dh,%gs:0x62(%esi)
 487:	65 5f                	gs pop %edi
 489:	69 6e 74 65 72 66 61 	imul   $0x61667265,0x74(%esi),%ebp
 490:	63 65 5f             	arpl   %sp,0x5f(%ebp)
 493:	73 65                	jae    4fa <PROT_MODE_DSEG+0x4ea>
 495:	67 00 6d 6d          	add    %ch,0x6d(%di)
 499:	61                   	popa   
 49a:	70 5f                	jo     4fb <PROT_MODE_DSEG+0x4eb>
 49c:	6c                   	insb   (%dx),%es:(%edi)
 49d:	65 6e                	outsb  %gs:(%esi),(%dx)
 49f:	00 70 5f             	add    %dh,0x5f(%eax)
 4a2:	61                   	popa   
 4a3:	6c                   	insb   (%dx),%es:(%edi)
 4a4:	69 67 6e 00 61 70 6d 	imul   $0x6d706100,0x6e(%edi),%esp
 4ab:	5f                   	pop    %edi
 4ac:	74 61                	je     50f <PROT_MODE_DSEG+0x4ff>
 4ae:	62 6c 65 00          	bound  %ebp,0x0(%ebp,%eiz,2)
 4b2:	70 5f                	jo     513 <PROT_MODE_DSEG+0x503>
 4b4:	70 61                	jo     517 <PROT_MODE_DSEG+0x507>
 4b6:	00 73 65             	add    %dh,0x65(%ebx)
 4b9:	63 74 6f 72          	arpl   %si,0x72(%edi,%ebp,2)
 4bd:	73 5f                	jae    51e <PROT_MODE_DSEG+0x50e>
 4bf:	63 6f 75             	arpl   %bp,0x75(%edi)
 4c2:	6e                   	outsb  %ds:(%esi),(%dx)
 4c3:	74 00                	je     4c5 <PROT_MODE_DSEG+0x4b5>
 4c5:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 4c8:	74 2f                	je     4f9 <PROT_MODE_DSEG+0x4e9>
 4ca:	62 6f 6f             	bound  %ebp,0x6f(%edi)
 4cd:	74 31                	je     500 <PROT_MODE_DSEG+0x4f0>
 4cf:	2f                   	das    
 4d0:	65 78 65             	gs js  538 <PROT_MODE_DSEG+0x528>
 4d3:	63 5f 6b             	arpl   %bx,0x6b(%edi)
 4d6:	65 72 6e             	gs jb  547 <PROT_MODE_DSEG+0x537>
 4d9:	65 6c                	gs insb (%dx),%es:(%edi)
 4db:	2e 53                	cs push %ebx
 4dd:	00                   	.byte 0x0

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	60                   	pusha  
   1:	02 00                	add    (%eax),%al
   3:	00 69 02             	add    %ch,0x2(%ecx)
   6:	00 00                	add    %al,(%eax)
   8:	02 00                	add    (%eax),%al
   a:	91                   	xchg   %eax,%ecx
   b:	00 69 02             	add    %ch,0x2(%ecx)
   e:	00 00                	add    %al,(%eax)
  10:	7a 02                	jp     14 <PROT_MODE_DSEG+0x4>
  12:	00 00                	add    %al,(%eax)
  14:	0a 00                	or     (%eax),%al
  16:	91                   	xchg   %eax,%ecx
  17:	00 06                	add    %al,(%esi)
  19:	0c ff                	or     $0xff,%al
  1b:	ff                   	(bad)  
  1c:	ff 00                	incl   (%eax)
  1e:	1a 9f 7a 02 00 00    	sbb    0x27a(%edi),%bl
  24:	80 02 00             	addb   $0x0,(%edx)
  27:	00 01                	add    %al,(%ecx)
  29:	00 56 80             	add    %dl,-0x80(%esi)
  2c:	02 00                	add    (%eax),%al
  2e:	00 90 02 00 00 01    	add    %dl,0x1000002(%eax)
  34:	00 53 90             	add    %dl,-0x70(%ebx)
  37:	02 00                	add    (%eax),%al
  39:	00 94 02 00 00 02 00 	add    %dl,0x20000(%edx,%eax,1)
  40:	74 00                	je     42 <PROT_MODE_DSEG+0x32>
  42:	94                   	xchg   %eax,%esp
  43:	02 00                	add    (%eax),%al
  45:	00 95 02 00 00 04    	add    %dl,0x4000002(%ebp)
  4b:	00 73 80             	add    %dh,-0x80(%ebx)
  4e:	7c 9f                	jl     ffffffef <SMAP_SIG+0xacb2be9f>
  50:	95                   	xchg   %eax,%ebp
  51:	02 00                	add    (%eax),%al
  53:	00 9d 02 00 00 01    	add    %bl,0x1000002(%ebp)
  59:	00 53 00             	add    %dl,0x0(%ebx)
  5c:	00 00                	add    %al,(%eax)
  5e:	00 00                	add    %al,(%eax)
  60:	00 00                	add    %al,(%eax)
  62:	00 60 02             	add    %ah,0x2(%eax)
  65:	00 00                	add    %al,(%eax)
  67:	83 02 00             	addl   $0x0,(%edx)
  6a:	00 02                	add    %al,(%edx)
  6c:	00 91 08 83 02 00    	add    %dl,0x28308(%ecx)
  72:	00 8a 02 00 00 01    	add    %cl,0x1000002(%edx)
  78:	00 57 8a             	add    %dl,-0x76(%edi)
  7b:	02 00                	add    (%eax),%al
  7d:	00 94 02 00 00 02 00 	add    %dl,0x20000(%edx,%eax,1)
  84:	74 04                	je     8a <PROT_MODE_DSEG+0x7a>
  86:	94                   	xchg   %eax,%esp
  87:	02 00                	add    (%eax),%al
  89:	00 95 02 00 00 03    	add    %dl,0x3000002(%ebp)
  8f:	00 77 7f             	add    %dh,0x7f(%edi)
  92:	9f                   	lahf   
  93:	95                   	xchg   %eax,%ebp
  94:	02 00                	add    (%eax),%al
  96:	00 9f 02 00 00 01    	add    %bl,0x1000002(%edi)
  9c:	00 57 00             	add    %dl,0x0(%edi)
  9f:	00 00                	add    %al,(%eax)
  a1:	00 00                	add    %al,(%eax)
  a3:	00 00                	add    %al,(%eax)
  a5:	00 80 02 00 00 9e    	add    %al,-0x61fffffe(%eax)
  ab:	02 00                	add    (%eax),%al
  ad:	00 01                	add    %al,(%ecx)
  af:	00 56 9e             	add    %dl,-0x62(%esi)
  b2:	02 00                	add    (%eax),%al
  b4:	00 a1 02 00 00 0e    	add    %ah,0xe000002(%ecx)
  ba:	00 91 00 06 0c ff    	add    %dl,-0xf3fa00(%ecx)
  c0:	ff                   	(bad)  
  c1:	ff 00                	incl   (%eax)
  c3:	1a 91 04 06 22 9f    	sbb    -0x60ddf9fc(%ecx),%dl
  c9:	00 00                	add    %al,(%eax)
  cb:	00 00                	add    %al,(%eax)
  cd:	00 00                	add    %al,(%eax)
  cf:	00 00                	add    %al,(%eax)
  d1:	fd                   	std    
  d2:	01 00                	add    %eax,(%eax)
  d4:	00 00                	add    %al,(%eax)
  d6:	02 00                	add    (%eax),%al
  d8:	00 04 00             	add    %al,(%eax,%eax,1)
  db:	0a f7                	or     %bh,%dh
  dd:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
  e3:	00 00                	add    %al,(%eax)
  e5:	00 00                	add    %al,(%eax)
  e7:	07                   	pop    %es
  e8:	02 00                	add    (%eax),%al
  ea:	00 0f                	add    %cl,(%edi)
  ec:	02 00                	add    (%eax),%al
  ee:	00 02                	add    %al,(%edx)
  f0:	00 31                	add    %dh,(%ecx)
  f2:	9f                   	lahf   
  f3:	00 00                	add    %al,(%eax)
  f5:	00 00                	add    %al,(%eax)
  f7:	00 00                	add    %al,(%eax)
  f9:	00 00                	add    %al,(%eax)
  fb:	07                   	pop    %es
  fc:	02 00                	add    (%eax),%al
  fe:	00 0f                	add    %cl,(%edi)
 100:	02 00                	add    (%eax),%al
 102:	00 04 00             	add    %al,(%eax,%eax,1)
 105:	0a f2                	or     %dl,%dh
 107:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 10d:	00 00                	add    %al,(%eax)
 10f:	00 00                	add    %al,(%eax)
 111:	0f 02 00             	lar    (%eax),%eax
 114:	00 17                	add    %dl,(%edi)
 116:	02 00                	add    (%eax),%al
 118:	00 01                	add    %al,(%ecx)
 11a:	00 51 00             	add    %dl,0x0(%ecx)
 11d:	00 00                	add    %al,(%eax)
 11f:	00 00                	add    %al,(%eax)
 121:	00 00                	add    %al,(%eax)
 123:	00 0f                	add    %cl,(%edi)
 125:	02 00                	add    (%eax),%al
 127:	00 17                	add    %dl,(%edi)
 129:	02 00                	add    (%eax),%al
 12b:	00 04 00             	add    %al,(%eax,%eax,1)
 12e:	0a f3                	or     %bl,%dh
 130:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 136:	00 00                	add    %al,(%eax)
 138:	00 00                	add    %al,(%eax)
 13a:	17                   	pop    %ss
 13b:	02 00                	add    (%eax),%al
 13d:	00 22                	add    %ah,(%edx)
 13f:	02 00                	add    (%eax),%al
 141:	00 02                	add    %al,(%edx)
 143:	00 91 05 00 00 00    	add    %dl,0x5(%ecx)
 149:	00 00                	add    %al,(%eax)
 14b:	00 00                	add    %al,(%eax)
 14d:	00 17                	add    %dl,(%edi)
 14f:	02 00                	add    (%eax),%al
 151:	00 22                	add    %ah,(%edx)
 153:	02 00                	add    (%eax),%al
 155:	00 04 00             	add    %al,(%eax,%eax,1)
 158:	0a f4                	or     %ah,%dh
 15a:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 160:	00 00                	add    %al,(%eax)
 162:	00 00                	add    %al,(%eax)
 164:	22 02                	and    (%edx),%al
 166:	00 00                	add    %al,(%eax)
 168:	2d 02 00 00 02       	sub    $0x2000002,%eax
 16d:	00 91 06 00 00 00    	add    %dl,0x6(%ecx)
 173:	00 00                	add    %al,(%eax)
 175:	00 00                	add    %al,(%eax)
 177:	00 22                	add    %ah,(%edx)
 179:	02 00                	add    (%eax),%al
 17b:	00 2d 02 00 00 04    	add    %ch,0x4000002
 181:	00 0a                	add    %cl,(%edx)
 183:	f5                   	cmc    
 184:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 18a:	00 00                	add    %al,(%eax)
 18c:	00 00                	add    %al,(%eax)
 18e:	2d 02 00 00 3b       	sub    $0x3b000002,%eax
 193:	02 00                	add    (%eax),%al
 195:	00 08                	add    %cl,(%eax)
 197:	00 91 07 94 01 09    	add    %dl,0x9019407(%ecx)
 19d:	e0 21                	loopne 1c0 <PROT_MODE_DSEG+0x1b0>
 19f:	9f                   	lahf   
 1a0:	00 00                	add    %al,(%eax)
 1a2:	00 00                	add    %al,(%eax)
 1a4:	00 00                	add    %al,(%eax)
 1a6:	00 00                	add    %al,(%eax)
 1a8:	2d 02 00 00 3b       	sub    $0x3b000002,%eax
 1ad:	02 00                	add    (%eax),%al
 1af:	00 04 00             	add    %al,(%eax,%eax,1)
 1b2:	0a f6                	or     %dh,%dh
 1b4:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 1ba:	00 00                	add    %al,(%eax)
 1bc:	00 00                	add    %al,(%eax)
 1be:	3b 02                	cmp    (%edx),%eax
 1c0:	00 00                	add    %al,(%eax)
 1c2:	40                   	inc    %eax
 1c3:	02 00                	add    (%eax),%al
 1c5:	00 03                	add    %al,(%ebx)
 1c7:	00 08                	add    %cl,(%eax)
 1c9:	20 9f 00 00 00 00    	and    %bl,0x0(%edi)
 1cf:	00 00                	add    %al,(%eax)
 1d1:	00 00                	add    %al,(%eax)
 1d3:	3b 02                	cmp    (%edx),%eax
 1d5:	00 00                	add    %al,(%eax)
 1d7:	40                   	inc    %eax
 1d8:	02 00                	add    (%eax),%al
 1da:	00 04 00             	add    %al,(%eax,%eax,1)
 1dd:	0a f7                	or     %bh,%dh
 1df:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 1e5:	00 00                	add    %al,(%eax)
 1e7:	00 00                	add    %al,(%eax)
 1e9:	45                   	inc    %ebp
 1ea:	02 00                	add    (%eax),%al
 1ec:	00 46 02             	add    %al,0x2(%esi)
 1ef:	00 00                	add    %al,(%eax)
 1f1:	04 00                	add    $0x0,%al
 1f3:	0a f7                	or     %bh,%dh
 1f5:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 1fb:	00 00                	add    %al,(%eax)
 1fd:	00 00                	add    %al,(%eax)
 1ff:	4d                   	dec    %ebp
 200:	02 00                	add    (%eax),%al
 202:	00 5d 02             	add    %bl,0x2(%ebp)
 205:	00 00                	add    %al,(%eax)
 207:	03 00                	add    (%eax),%eax
 209:	08 80 9f 00 00 00    	or     %al,0x9f(%eax)
 20f:	00 00                	add    %al,(%eax)
 211:	00 00                	add    %al,(%eax)
 213:	00 4d 02             	add    %cl,0x2(%ebp)
 216:	00 00                	add    %al,(%eax)
 218:	5d                   	pop    %ebp
 219:	02 00                	add    (%eax),%al
 21b:	00 02                	add    %al,(%edx)
 21d:	00 91 00 00 00 00    	add    %dl,0x0(%ecx)
 223:	00 00                	add    %al,(%eax)
 225:	00 00                	add    %al,(%eax)
 227:	00 4d 02             	add    %cl,0x2(%ebp)
 22a:	00 00                	add    %al,(%eax)
 22c:	5d                   	pop    %ebp
 22d:	02 00                	add    (%eax),%al
 22f:	00 04 00             	add    %al,(%eax,%eax,1)
 232:	0a f0                	or     %al,%dh
 234:	01 9f 00 00 00 00    	add    %ebx,0x0(%edi)
 23a:	00 00                	add    %al,(%eax)
 23c:	00 00                	add    %al,(%eax)
 23e:	19 01                	sbb    %eax,(%ecx)
 240:	00 00                	add    %al,(%eax)
 242:	43                   	inc    %ebx
 243:	01 00                	add    %eax,(%eax)
 245:	00 02                	add    %al,(%edx)
 247:	00 91 00 43 01 00    	add    %dl,0x14300(%ecx)
 24d:	00 70 01             	add    %dh,0x1(%eax)
 250:	00 00                	add    %al,(%eax)
 252:	01 00                	add    %eax,(%eax)
 254:	50                   	push   %eax
 255:	00 00                	add    %al,(%eax)
 257:	00 00                	add    %al,(%eax)
 259:	00 00                	add    %al,(%eax)
 25b:	00 00                	add    %al,(%eax)
 25d:	43                   	inc    %ebx
 25e:	01 00                	add    %eax,(%eax)
 260:	00 47 01             	add    %al,0x1(%edi)
 263:	00 00                	add    %al,(%eax)
 265:	01 00                	add    %eax,(%eax)
 267:	53                   	push   %ebx
 268:	47                   	inc    %edi
 269:	01 00                	add    %eax,(%eax)
 26b:	00 5b 01             	add    %bl,0x1(%ebx)
 26e:	00 00                	add    %al,(%eax)
 270:	01 00                	add    %eax,(%eax)
 272:	57                   	push   %edi
 273:	5b                   	pop    %ebx
 274:	01 00                	add    %eax,(%eax)
 276:	00 64 01 00          	add    %ah,0x0(%ecx,%eax,1)
 27a:	00 01                	add    %al,(%ecx)
 27c:	00 52 64             	add    %dl,0x64(%edx)
 27f:	01 00                	add    %eax,(%eax)
 281:	00 74 01 00          	add    %dh,0x0(%ecx,%eax,1)
 285:	00 01                	add    %al,(%ecx)
 287:	00 57 00             	add    %dl,0x0(%edi)
 28a:	00 00                	add    %al,(%eax)
 28c:	00 00                	add    %al,(%eax)
 28e:	00 00                	add    %al,(%eax)
 290:	00 1c 01             	add    %bl,(%ecx,%eax,1)
 293:	00 00                	add    %al,(%eax)
 295:	30 01                	xor    %al,(%ecx)
 297:	00 00                	add    %al,(%eax)
 299:	02 00                	add    (%eax),%al
 29b:	91                   	xchg   %eax,%ecx
 29c:	68 00 00 00 00       	push   $0x0
 2a1:	00 00                	add    %al,(%eax)
 2a3:	00 00                	add    %al,(%eax)
 2a5:	e9 00 00 00 fb       	jmp    fb0002aa <SMAP_SIG+0xa7b2c15a>
 2aa:	00 00                	add    %al,(%eax)
 2ac:	00 02                	add    %al,(%edx)
 2ae:	00 30                	add    %dh,(%eax)
 2b0:	9f                   	lahf   
 2b1:	fb                   	sti    
 2b2:	00 00                	add    %al,(%eax)
 2b4:	00 19                	add    %bl,(%ecx)
 2b6:	01 00                	add    %eax,(%eax)
 2b8:	00 01                	add    %al,(%ecx)
 2ba:	00 52 00             	add    %dl,0x0(%edx)
 2bd:	00 00                	add    %al,(%eax)
 2bf:	00 00                	add    %al,(%eax)
 2c1:	00 00                	add    %al,(%eax)
 2c3:	00 03                	add    %al,(%ebx)
 2c5:	01 00                	add    %eax,(%eax)
 2c7:	00 12                	add    %dl,(%edx)
 2c9:	01 00                	add    %eax,(%eax)
 2cb:	00 01                	add    %al,(%ecx)
 2cd:	00 56 00             	add    %dl,0x0(%esi)
 2d0:	00 00                	add    %al,(%eax)
 2d2:	00 00                	add    %al,(%eax)
 2d4:	00 00                	add    %al,(%eax)
 2d6:	00 d6                	add    %dl,%dh
 2d8:	00 00                	add    %al,(%eax)
 2da:	00 de                	add    %bl,%dh
 2dc:	00 00                	add    %al,(%eax)
 2de:	00 02                	add    %al,(%edx)
 2e0:	00 91 00 de 00 00    	add    %dl,0xde00(%ecx)
 2e6:	00 e9                	add    %ch,%cl
 2e8:	00 00                	add    %al,(%eax)
 2ea:	00 07                	add    %al,(%edi)
 2ec:	00 91 00 06 70 00    	add    %dl,0x700600(%ecx)
 2f2:	22 9f 00 00 00 00    	and    0x0(%edi),%bl
 2f8:	00 00                	add    %al,(%eax)
 2fa:	00 00                	add    %al,(%eax)
 2fc:	d6                   	(bad)  
 2fd:	00 00                	add    %al,(%eax)
 2ff:	00 de                	add    %bl,%dh
 301:	00 00                	add    %al,(%eax)
 303:	00 02                	add    %al,(%edx)
 305:	00 30                	add    %dh,(%eax)
 307:	9f                   	lahf   
 308:	de 00                	fiadds (%eax)
 30a:	00 00                	add    %al,(%eax)
 30c:	e9 00 00 00 01       	jmp    1000311 <_end+0xff6f45>
 311:	00 50 00             	add    %dl,0x0(%eax)
 314:	00 00                	add    %al,(%eax)
 316:	00 00                	add    %al,(%eax)
 318:	00 00                	add    %al,(%eax)
 31a:	00 c6                	add    %al,%dh
 31c:	01 00                	add    %eax,(%eax)
 31e:	00 e8                	add    %ch,%al
 320:	01 00                	add    %eax,(%eax)
 322:	00 02                	add    %al,(%edx)
 324:	00 91 00 00 00 00    	add    %dl,0x0(%ecx)
 32a:	00 00                	add    %al,(%eax)
 32c:	00 00                	add    %al,(%eax)
 32e:	00 26                	add    %ah,(%esi)
 330:	00 00                	add    %al,(%eax)
 332:	00 37                	add    %dh,(%edi)
 334:	00 00                	add    %al,(%eax)
 336:	00 02                	add    %al,(%edx)
 338:	00 91 0c 37 00 00    	add    %dl,0x370c(%ecx)
 33e:	00 44 00 00          	add    %al,0x0(%eax,%eax,1)
 342:	00 0a                	add    %cl,(%edx)
 344:	00 91 0c 06 70 00    	add    %dl,0x70060c(%ecx)
 34a:	22 76 00             	and    0x0(%esi),%dh
 34d:	1c 9f                	sbb    $0x9f,%al
 34f:	44                   	inc    %esp
 350:	00 00                	add    %al,(%eax)
 352:	00 4e 00             	add    %cl,0x0(%esi)
 355:	00 00                	add    %al,(%eax)
 357:	0c 00                	or     $0x0,%al
 359:	91                   	xchg   %eax,%ecx
 35a:	0c 06                	or     $0x6,%al
 35c:	70 00                	jo     35e <PROT_MODE_DSEG+0x34e>
 35e:	22 76 00             	and    0x0(%esi),%dh
 361:	1c 23                	sbb    $0x23,%al
 363:	01 9f 4e 00 00 00    	add    %ebx,0x4e(%edi)
 369:	56                   	push   %esi
 36a:	00 00                	add    %al,(%eax)
 36c:	00 0a                	add    %cl,(%edx)
 36e:	00 91 0c 06 73 00    	add    %dl,0x73060c(%ecx)
 374:	22 76 00             	and    0x0(%esi),%dh
 377:	1c 9f                	sbb    $0x9f,%al
 379:	56                   	push   %esi
 37a:	00 00                	add    %al,(%eax)
 37c:	00 5b 00             	add    %bl,0x0(%ebx)
 37f:	00 00                	add    %al,(%eax)
 381:	0a 00                	or     (%eax),%al
 383:	91                   	xchg   %eax,%ecx
 384:	0c 06                	or     $0x6,%al
 386:	70 00                	jo     388 <PROT_MODE_DSEG+0x378>
 388:	22 76 00             	and    0x0(%esi),%dh
 38b:	1c 9f                	sbb    $0x9f,%al
 38d:	5b                   	pop    %ebx
 38e:	00 00                	add    %al,(%eax)
 390:	00 5d 00             	add    %bl,0x0(%ebp)
 393:	00 00                	add    %al,(%eax)
 395:	12 00                	adc    (%eax),%al
 397:	91                   	xchg   %eax,%ecx
 398:	0c 06                	or     $0x6,%al
 39a:	91                   	xchg   %eax,%ecx
 39b:	00 06                	add    %al,(%esi)
 39d:	08 50 1e             	or     %dl,0x1e(%eax)
 3a0:	1c 70                	sbb    $0x70,%al
 3a2:	00 22                	add    %ah,(%edx)
 3a4:	91                   	xchg   %eax,%ecx
 3a5:	04 06                	add    $0x6,%al
 3a7:	1c 9f                	sbb    $0x9f,%al
 3a9:	00 00                	add    %al,(%eax)
 3ab:	00 00                	add    %al,(%eax)
 3ad:	00 00                	add    %al,(%eax)
 3af:	00 00                	add    %al,(%eax)
 3b1:	35 00 00 00 37       	xor    $0x37000000,%eax
 3b6:	00 00                	add    %al,(%eax)
 3b8:	00 01                	add    %al,(%ecx)
 3ba:	00 56 37             	add    %dl,0x37(%esi)
 3bd:	00 00                	add    %al,(%eax)
 3bf:	00 48 00             	add    %cl,0x0(%eax)
 3c2:	00 00                	add    %al,(%eax)
 3c4:	01 00                	add    %eax,(%eax)
 3c6:	50                   	push   %eax
 3c7:	48                   	dec    %eax
 3c8:	00 00                	add    %al,(%eax)
 3ca:	00 56 00             	add    %dl,0x0(%esi)
 3cd:	00 00                	add    %al,(%eax)
 3cf:	01 00                	add    %eax,(%eax)
 3d1:	53                   	push   %ebx
 3d2:	56                   	push   %esi
 3d3:	00 00                	add    %al,(%eax)
 3d5:	00 5d 00             	add    %bl,0x0(%ebp)
 3d8:	00 00                	add    %al,(%eax)
 3da:	01 00                	add    %eax,(%eax)
 3dc:	50                   	push   %eax
 3dd:	00 00                	add    %al,(%eax)
 3df:	00 00                	add    %al,(%eax)
 3e1:	00 00                	add    %al,(%eax)
 3e3:	00 00                	add    %al,(%eax)
 3e5:	a8 00                	test   $0x0,%al
 3e7:	00 00                	add    %al,(%eax)
 3e9:	b7 00                	mov    $0x0,%bh
 3eb:	00 00                	add    %al,(%eax)
 3ed:	01 00                	add    %eax,(%eax)
 3ef:	57                   	push   %edi
 3f0:	b7 00                	mov    $0x0,%bh
 3f2:	00 00                	add    %al,(%eax)
 3f4:	c9                   	leave  
 3f5:	00 00                	add    %al,(%eax)
 3f7:	00 06                	add    %al,(%esi)
 3f9:	00 77 00             	add    %dh,0x0(%edi)
 3fc:	76 00                	jbe    3fe <PROT_MODE_DSEG+0x3ee>
 3fe:	22 9f c9 00 00 00    	and    0xc9(%edi),%bl
 404:	cf                   	iret   
 405:	00 00                	add    %al,(%eax)
 407:	00 08                	add    %cl,(%eax)
 409:	00 77 00             	add    %dh,0x0(%edi)
 40c:	76 00                	jbe    40e <PROT_MODE_DSEG+0x3fe>
 40e:	22 48 1c             	and    0x1c(%eax),%cl
 411:	9f                   	lahf   
 412:	d4 00                	aam    $0x0
 414:	00 00                	add    %al,(%eax)
 416:	fc                   	cld    
 417:	00 00                	add    %al,(%eax)
 419:	00 06                	add    %al,(%esi)
 41b:	00 77 00             	add    %dh,0x0(%edi)
 41e:	76 00                	jbe    420 <PROT_MODE_DSEG+0x410>
 420:	22 9f fc 00 00 00    	and    0xfc(%edi),%bl
 426:	fd                   	std    
 427:	00 00                	add    %al,(%eax)
 429:	00 0a                	add    %cl,(%edx)
 42b:	00 77 00             	add    %dh,0x0(%edi)
 42e:	03 6c 93 00          	add    0x0(%ebx,%edx,4),%ebp
 432:	00 06                	add    %al,(%esi)
 434:	22 9f fd 00 00 00    	and    0xfd(%edi),%bl
 43a:	ff 00                	incl   (%eax)
 43c:	00 00                	add    %al,(%eax)
 43e:	0b 00                	or     (%eax),%eax
 440:	91                   	xchg   %eax,%ecx
 441:	00 06                	add    %al,(%esi)
 443:	03 6c 93 00          	add    0x0(%ebx,%edx,4),%ebp
 447:	00 06                	add    %al,(%esi)
 449:	22 9f 00 00 00 00    	and    0x0(%edi),%bl
 44f:	00 00                	add    %al,(%eax)
 451:	00 00                	add    %al,(%eax)
 453:	a8 00                	test   $0x0,%al
 455:	00 00                	add    %al,(%eax)
 457:	b7 00                	mov    $0x0,%bh
 459:	00 00                	add    %al,(%eax)
 45b:	02 00                	add    (%eax),%al
 45d:	30 9f b7 00 00 00    	xor    %bl,0xb7(%edi)
 463:	c9                   	leave  
 464:	00 00                	add    %al,(%eax)
 466:	00 01                	add    %al,(%ecx)
 468:	00 56 c9             	add    %dl,-0x37(%esi)
 46b:	00 00                	add    %al,(%eax)
 46d:	00 cf                	add    %cl,%bh
 46f:	00 00                	add    %al,(%eax)
 471:	00 03                	add    %al,(%ebx)
 473:	00 76 68             	add    %dh,0x68(%esi)
 476:	9f                   	lahf   
 477:	cf                   	iret   
 478:	00 00                	add    %al,(%eax)
 47a:	00 fc                	add    %bh,%ah
 47c:	00 00                	add    %al,(%eax)
 47e:	00 01                	add    %al,(%ecx)
 480:	00 56 fc             	add    %dl,-0x4(%esi)
 483:	00 00                	add    %al,(%eax)
 485:	00 ff                	add    %bh,%bh
 487:	00 00                	add    %al,(%eax)
 489:	00 05 00 03 6c 93    	add    %al,0x936c0300
 48f:	00 00                	add    %al,(%eax)
 491:	00 00                	add    %al,(%eax)
 493:	00 00                	add    %al,(%eax)
 495:	00 00                	add    %al,(%eax)
 497:	00 00                	add    %al,(%eax)
 499:	5b                   	pop    %ebx
 49a:	00 00                	add    %al,(%eax)
 49c:	00 6d 00             	add    %ch,0x0(%ebp)
 49f:	00 00                	add    %al,(%eax)
 4a1:	01 00                	add    %eax,(%eax)
 4a3:	57                   	push   %edi
 4a4:	6d                   	insl   (%dx),%es:(%edi)
 4a5:	00 00                	add    %al,(%eax)
 4a7:	00 78 00             	add    %bh,0x0(%eax)
 4aa:	00 00                	add    %al,(%eax)
 4ac:	03 00                	add    (%eax),%eax
 4ae:	77 60                	ja     510 <PROT_MODE_DSEG+0x500>
 4b0:	9f                   	lahf   
 4b1:	78 00                	js     4b3 <PROT_MODE_DSEG+0x4a3>
 4b3:	00 00                	add    %al,(%eax)
 4b5:	8d 00                	lea    (%eax),%eax
 4b7:	00 00                	add    %al,(%eax)
 4b9:	01 00                	add    %eax,(%eax)
 4bb:	57                   	push   %edi
 4bc:	00 00                	add    %al,(%eax)
 4be:	00 00                	add    %al,(%eax)
 4c0:	00 00                	add    %al,(%eax)
 4c2:	00 00                	add    %al,(%eax)
 4c4:	60                   	pusha  
 4c5:	00 00                	add    %al,(%eax)
 4c7:	00 8c 00 00 00 01 00 	add    %cl,0x10000(%eax,%eax,1)
 4ce:	56                   	push   %esi
 4cf:	00 00                	add    %al,(%eax)
 4d1:	00 00                	add    %al,(%eax)
 4d3:	00 00                	add    %al,(%eax)
 4d5:	00 00                	add    %al,(%eax)
 4d7:	2d 01 00 00 30       	sub    $0x30000001,%eax
 4dc:	01 00                	add    %eax,(%eax)
 4de:	00 02                	add    %al,(%edx)
 4e0:	00 30                	add    %dh,(%eax)
 4e2:	9f                   	lahf   
 4e3:	30 01                	xor    %al,(%ecx)
 4e5:	00 00                	add    %al,(%eax)
 4e7:	60                   	pusha  
 4e8:	01 00                	add    %eax,(%eax)
 4ea:	00 01                	add    %al,(%ecx)
 4ec:	00 56 60             	add    %dl,0x60(%esi)
 4ef:	01 00                	add    %eax,(%eax)
 4f1:	00 63 01             	add    %ah,0x1(%ebx)
 4f4:	00 00                	add    %al,(%eax)
 4f6:	03 00                	add    (%eax),%eax
 4f8:	76 65                	jbe    55f <PROT_MODE_DSEG+0x54f>
 4fa:	9f                   	lahf   
 4fb:	00 00                	add    %al,(%eax)
 4fd:	00 00                	add    %al,(%eax)
 4ff:	00 00                	add    %al,(%eax)
 501:	00 00                	add    %al,(%eax)

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	f5                   	cmc    
   1:	01 00                	add    %eax,(%eax)
   3:	00 fa                	add    %bh,%dl
   5:	01 00                	add    %eax,(%eax)
   7:	00 fd                	add    %bh,%ch
   9:	01 00                	add    %eax,(%eax)
   b:	00 07                	add    %al,(%edi)
   d:	02 00                	add    (%eax),%al
   f:	00 00                	add    %al,(%eax)
  11:	00 00                	add    %al,(%eax)
  13:	00 00                	add    %al,(%eax)
  15:	00 00                	add    %al,(%eax)
  17:	00 f5                	add    %dh,%ch
  19:	01 00                	add    %eax,(%eax)
  1b:	00 fa                	add    %bh,%dl
  1d:	01 00                	add    %eax,(%eax)
  1f:	00 fd                	add    %bh,%ch
  21:	01 00                	add    %eax,(%eax)
  23:	00 00                	add    %al,(%eax)
  25:	02 00                	add    (%eax),%al
  27:	00 00                	add    %al,(%eax)
  29:	00 00                	add    %al,(%eax)
  2b:	00 00                	add    %al,(%eax)
  2d:	00 00                	add    %al,(%eax)
  2f:	00 19                	add    %bl,(%ecx)
  31:	02 00                	add    (%eax),%al
  33:	00 1e                	add    %bl,(%esi)
  35:	02 00                	add    (%eax),%al
  37:	00 21                	add    %ah,(%ecx)
  39:	02 00                	add    (%eax),%al
  3b:	00 22                	add    %ah,(%edx)
  3d:	02 00                	add    (%eax),%al
  3f:	00 00                	add    %al,(%eax)
  41:	00 00                	add    %al,(%eax)
  43:	00 00                	add    %al,(%eax)
  45:	00 00                	add    %al,(%eax)
  47:	00 24 02             	add    %ah,(%edx,%eax,1)
  4a:	00 00                	add    %al,(%eax)
  4c:	29 02                	sub    %eax,(%edx)
  4e:	00 00                	add    %al,(%eax)
  50:	2c 02                	sub    $0x2,%al
  52:	00 00                	add    %al,(%eax)
  54:	2d 02 00 00 00       	sub    $0x2,%eax
  59:	00 00                	add    %al,(%eax)
  5b:	00 00                	add    %al,(%eax)
  5d:	00 00                	add    %al,(%eax)
  5f:	00 2f                	add    %ch,(%edi)
  61:	02 00                	add    (%eax),%al
  63:	00 34 02             	add    %dh,(%edx,%eax,1)
  66:	00 00                	add    %al,(%eax)
  68:	3a 02                	cmp    (%edx),%al
  6a:	00 00                	add    %al,(%eax)
  6c:	3b 02                	cmp    (%edx),%eax
  6e:	00 00                	add    %al,(%eax)
  70:	00 00                	add    %al,(%eax)
  72:	00 00                	add    %al,(%eax)
  74:	00 00                	add    %al,(%eax)
  76:	00 00                	add    %al,(%eax)
