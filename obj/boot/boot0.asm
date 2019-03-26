
obj/boot/boot0.elf:     file format elf32-i386


Disassembly of section .text:

00007c00 <start>:
     *  - Clear the interrupts flag, disabling the interrupts.
     *  - Clear the direction flag, to configure auto-increment mode.
     *
     *     Hint: see the cli/sti and cld/std instructions.
     */
    cli
    7c00:	fa                   	cli    
    cld
    7c01:	fc                   	cld    
     *  Hint 2: Set the %ax register to zero, then move it into the segment registers.
     *    Hint 3: XORing a register with itself will set it to zero.
     *    Hint 4: These are 16-bit registers so use "w" instruction suffix (e.g. xorw, movw).
     *
     */
    xorw %ax, %ax
    7c02:	31 c0                	xor    %ax,%ax
    movw %ax, %ds
    7c04:	8e d8                	mov    %ax,%ds
    movw %ax, %es
    7c06:	8e c0                	mov    %ax,%es
    movw %ax, %ss
    7c08:	8e d0                	mov    %ax,%ss
     * Hint 3: The same instruction can MOVE data between registers or between a register and memory.
     *
     * Info 1: We will use this information in boot1.
     * Info 2: The device ID is the ID of the Disk we booted from.
     */
    movb %dl, BOOTIDADDR
    7c0a:	88 16 fc 7b          	mov    %dl,0x7bfc
     *     Info:
     *        - Remember that the stack grows downward on x86 processors.
     *        - This stack will grow just below the device id we stored in task 4.
     *        - 32-bit code would use %ebp and %esp instead of %bp and %sp.
     */
    movw $BOOTIDADDR, %bp
    7c0e:	bd fc 7b             	mov    $0x7bfc,%bp
    movw $BOOTIDADDR, %sp
    7c11:	bc fc 7b             	mov    $0x7bfc,%sp

00007c14 <set_video_mode>:

    /* set to normal (80x25 text) video mode */
set_video_mode:
    movw    $0x03, %ax
    7c14:	b8 03 00             	mov    $0x3,%ax
    int    $0x10
    7c17:	cd 10                	int    $0x10


    /* print starting message */
    movw    $STARTUP_MSG, %si
    7c19:	be 4a 7c             	mov    $0x7c4a,%si
    call    putstr
    7c1c:	e8 1d 00             	call   7c3c <putstr>

00007c1f <load_boot1>:
     *    Hint 5: Move the %sp register to the %si register after pushing the DAP.
     *    Hint 6: Use the "int" instruction to trigger an intterupt after all the arguments and registers have been configured.
     *    Hint 7: Use the "jmp" to unconditionally jump.
     */
    /* stack pushes */
    pushl $0x00000000
    7c1f:	66 6a 00             	pushl  $0x0
    pushl $0x00000001
    7c22:	66 6a 01             	pushl  $0x1
    pushl $0x00007e00
    7c25:	66 68 00 7e 00 00    	pushl  $0x7e00
    pushw $0x003e
    7c2b:	6a 3e                	push   $0x3e
    pushw $0x0010
    7c2d:	6a 10                	push   $0x10
    /* other shit */
    xorl %eax, %eax
    7c2f:	66 31 c0             	xor    %eax,%eax
    movb  $0x42, %ah
    7c32:	b4 42                	mov    $0x42,%ah
    movw  %sp, %si 
    7c34:	89 e6                	mov    %sp,%si
    int  $0x13
    7c36:	cd 13                	int    $0x13
    jmp  BOOT1ADDR
    7c38:	e9 c5 01             	jmp    7e00 <BOOT1ADDR>

00007c3b <spin>:

     /* Execution should never get here */
spin:
    hlt
    7c3b:	f4                   	hlt    

00007c3c <putstr>:

/*
 * print a string (@ %si) to the screen
 */
putstr:
    pusha
    7c3c:	60                   	pusha  
    movb    $0xe, %ah
    7c3d:	b4 0e                	mov    $0xe,%ah

00007c3f <putstr.1>:
putstr.1:
    lodsb
    7c3f:	ac                   	lods   %ds:(%si),%al
    cmp    $0, %al
    7c40:	3c 00                	cmp    $0x0,%al
    je    putstr.2
    7c42:	74 04                	je     7c48 <putstr.2>
    int    $0x10
    7c44:	cd 10                	int    $0x10
    jmp    putstr.1
    7c46:	eb f7                	jmp    7c3f <putstr.1>

00007c48 <putstr.2>:
putstr.2:
    popa
    7c48:	61                   	popa   
    ret
    7c49:	c3                   	ret    

00007c4a <STARTUP_MSG>:
    7c4a:	53                   	push   %bx
    7c4b:	74 61                	je     7cae <_end+0x32>
    7c4d:	72 74                	jb     7cc3 <_end+0x47>
    7c4f:	20 62 6f             	and    %ah,0x6f(%bp,%si)
    7c52:	6f                   	outsw  %ds:(%si),(%dx)
    7c53:	74 30                	je     7c85 <_end+0x9>
    7c55:	20 2e 2e 2e          	and    %ch,0x2e2e
    7c59:	0d 0a 00             	or     $0xa,%ax

00007c5c <LOAD_FAIL_MSG>:
    7c5c:	45                   	inc    %bp
    7c5d:	72 72                	jb     7cd1 <_end+0x55>
    7c5f:	6f                   	outsw  %ds:(%si),(%dx)
    7c60:	72 20                	jb     7c82 <_end+0x6>
    7c62:	64 75 72             	fs jne 7cd7 <_end+0x5b>
    7c65:	69 6e 67 20 6c       	imul   $0x6c20,0x67(%bp),%bp
    7c6a:	6f                   	outsw  %ds:(%si),(%dx)
    7c6b:	61                   	popa   
    7c6c:	64 69 6e 67 20 62    	imul   $0x6220,%fs:0x67(%bp),%bp
    7c72:	6f                   	outsw  %ds:(%si),(%dx)
    7c73:	6f                   	outsw  %ds:(%si),(%dx)
    7c74:	74 31                	je     7ca7 <_end+0x2b>
    7c76:	2e 0d 0a 00          	cs or  $0xa,%ax
