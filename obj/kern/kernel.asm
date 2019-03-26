
obj/kern/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <video_init>:
#include "video.h"
//tmphack
//#include<dev/serial.h>
void
video_init(void)
{
  100000:	55                   	push   %ebp
  100001:	57                   	push   %edi
  100002:	56                   	push   %esi
  100003:	53                   	push   %ebx
  100004:	83 ec 0c             	sub    $0xc,%esp
  100007:	e8 03 03 00 00       	call   10030f <__x86.get_pc_thunk.bx>
  10000c:	81 c3 f4 bf 00 00    	add    $0xbff4,%ebx
	uint16_t was;
	unsigned pos;

	/* Get a pointer to the memory-mapped text display buffer. */
	cp = (uint16_t*) CGA_BUF;
	was = *cp;
  100012:	0f b7 15 00 80 0b 00 	movzwl 0xb8000,%edx
	*cp = (uint16_t) 0xA55A;
  100019:	66 c7 05 00 80 0b 00 	movw   $0xa55a,0xb8000
  100020:	5a a5 
	if (*cp != 0xA55A) {
  100022:	0f b7 05 00 80 0b 00 	movzwl 0xb8000,%eax
  100029:	66 3d 5a a5          	cmp    $0xa55a,%ax
  10002d:	0f 84 86 00 00 00    	je     1000b9 <video_init+0xb9>
		cp = (uint16_t*) MONO_BUF;
		addr_6845 = MONO_BASE;
  100033:	c7 c0 8c a4 96 00    	mov    $0x96a48c,%eax
  100039:	c7 00 b4 03 00 00    	movl   $0x3b4,(%eax)
		dprintf("addr_6845:%x\n",addr_6845);
  10003f:	83 ec 08             	sub    $0x8,%esp
  100042:	68 b4 03 00 00       	push   $0x3b4
  100047:	8d 83 a0 a3 ff ff    	lea    -0x5c60(%ebx),%eax
  10004d:	50                   	push   %eax
  10004e:	e8 b1 21 00 00       	call   102204 <dprintf>
  100053:	83 c4 10             	add    $0x10,%esp
		cp = (uint16_t*) MONO_BUF;
  100056:	bd 00 00 0b 00       	mov    $0xb0000,%ebp
		addr_6845 = CGA_BASE;
		dprintf("addr_6845:%x\n",addr_6845);
	}
	
	/* Extract cursor location */
	outb(addr_6845, 14);
  10005b:	83 ec 08             	sub    $0x8,%esp
  10005e:	6a 0e                	push   $0xe
  100060:	c7 c7 8c a4 96 00    	mov    $0x96a48c,%edi
  100066:	ff 37                	pushl  (%edi)
  100068:	e8 fd 29 00 00       	call   102a6a <outb>
	pos = inb(addr_6845 + 1) << 8;
  10006d:	8b 07                	mov    (%edi),%eax
  10006f:	83 c0 01             	add    $0x1,%eax
  100072:	89 04 24             	mov    %eax,(%esp)
  100075:	e8 d8 29 00 00       	call   102a52 <inb>
  10007a:	0f b6 f0             	movzbl %al,%esi
  10007d:	c1 e6 08             	shl    $0x8,%esi
	outb(addr_6845, 15);
  100080:	83 c4 08             	add    $0x8,%esp
  100083:	6a 0f                	push   $0xf
  100085:	ff 37                	pushl  (%edi)
  100087:	e8 de 29 00 00       	call   102a6a <outb>
	pos |= inb(addr_6845 + 1);
  10008c:	8b 07                	mov    (%edi),%eax
  10008e:	83 c0 01             	add    $0x1,%eax
  100091:	89 04 24             	mov    %eax,(%esp)
  100094:	e8 b9 29 00 00       	call   102a52 <inb>
  100099:	0f b6 c0             	movzbl %al,%eax
  10009c:	09 c6                	or     %eax,%esi

	terminal.crt_buf = (uint16_t*) cp;
  10009e:	c7 c0 80 a4 96 00    	mov    $0x96a480,%eax
  1000a4:	89 28                	mov    %ebp,(%eax)
	terminal.crt_pos = pos;
  1000a6:	66 89 70 04          	mov    %si,0x4(%eax)
	terminal.active_console = 0;
  1000aa:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
//  video_clear_screen();
}
  1000b1:	83 c4 1c             	add    $0x1c,%esp
  1000b4:	5b                   	pop    %ebx
  1000b5:	5e                   	pop    %esi
  1000b6:	5f                   	pop    %edi
  1000b7:	5d                   	pop    %ebp
  1000b8:	c3                   	ret    
		*cp = was;
  1000b9:	66 89 15 00 80 0b 00 	mov    %dx,0xb8000
		addr_6845 = CGA_BASE;
  1000c0:	c7 c0 8c a4 96 00    	mov    $0x96a48c,%eax
  1000c6:	c7 00 d4 03 00 00    	movl   $0x3d4,(%eax)
		dprintf("addr_6845:%x\n",addr_6845);
  1000cc:	83 ec 08             	sub    $0x8,%esp
  1000cf:	68 d4 03 00 00       	push   $0x3d4
  1000d4:	8d 83 a0 a3 ff ff    	lea    -0x5c60(%ebx),%eax
  1000da:	50                   	push   %eax
  1000db:	e8 24 21 00 00       	call   102204 <dprintf>
  1000e0:	83 c4 10             	add    $0x10,%esp
	cp = (uint16_t*) CGA_BUF;
  1000e3:	bd 00 80 0b 00       	mov    $0xb8000,%ebp
  1000e8:	e9 6e ff ff ff       	jmp    10005b <video_init+0x5b>

001000ed <video_putc>:

void
video_putc(int c)
{
  1000ed:	57                   	push   %edi
  1000ee:	56                   	push   %esi
  1000ef:	53                   	push   %ebx
  1000f0:	e8 1a 02 00 00       	call   10030f <__x86.get_pc_thunk.bx>
  1000f5:	81 c3 0b bf 00 00    	add    $0xbf0b,%ebx
  1000fb:	8b 44 24 10          	mov    0x10(%esp),%eax

	// if no attribute given, then use black on white
	if (!(c & ~0xFF))
  1000ff:	a9 00 ff ff ff       	test   $0xffffff00,%eax
  100104:	75 03                	jne    100109 <video_putc+0x1c>
		c |= 0x0700;
  100106:	80 cc 07             	or     $0x7,%ah

	switch (c & 0xff) {
  100109:	0f b6 d0             	movzbl %al,%edx
  10010c:	83 fa 09             	cmp    $0x9,%edx
  10010f:	0f 84 ee 00 00 00    	je     100203 <video_putc+0x116>
  100115:	83 fa 09             	cmp    $0x9,%edx
  100118:	0f 8e 96 00 00 00    	jle    1001b4 <video_putc+0xc7>
  10011e:	83 fa 0a             	cmp    $0xa,%edx
  100121:	0f 84 c6 00 00 00    	je     1001ed <video_putc+0x100>
  100127:	83 fa 0d             	cmp    $0xd,%edx
  10012a:	0f 85 15 01 00 00    	jne    100245 <video_putc+0x158>
		break;
	case '\n':
		terminal.crt_pos += CRT_COLS;
		/* fallthru */
	case '\r':
		terminal.crt_pos -= (terminal.crt_pos % CRT_COLS);
  100130:	c7 c2 80 a4 96 00    	mov    $0x96a480,%edx
  100136:	0f b7 42 04          	movzwl 0x4(%edx),%eax
  10013a:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  100140:	c1 e8 10             	shr    $0x10,%eax
  100143:	66 c1 e8 06          	shr    $0x6,%ax
  100147:	8d 04 80             	lea    (%eax,%eax,4),%eax
  10014a:	c1 e0 04             	shl    $0x4,%eax
  10014d:	66 89 42 04          	mov    %ax,0x4(%edx)
	default:
		terminal.crt_buf[terminal.crt_pos++] = c;		/* write the character */
		break;
	}

	if (terminal.crt_pos >= CRT_SIZE) {
  100151:	c7 c0 80 a4 96 00    	mov    $0x96a480,%eax
  100157:	66 81 78 04 cf 07    	cmpw   $0x7cf,0x4(%eax)
  10015d:	0f 87 01 01 00 00    	ja     100264 <video_putc+0x177>
		terminal.crt_pos -= CRT_COLS;
	}


	/* move that little blinky thing */
	outb(addr_6845, 14);
  100163:	83 ec 08             	sub    $0x8,%esp
  100166:	6a 0e                	push   $0xe
  100168:	c7 c6 8c a4 96 00    	mov    $0x96a48c,%esi
  10016e:	ff 36                	pushl  (%esi)
  100170:	e8 f5 28 00 00       	call   102a6a <outb>
	outb(addr_6845 + 1, terminal.crt_pos >> 8);
  100175:	c7 c7 80 a4 96 00    	mov    $0x96a480,%edi
  10017b:	8b 06                	mov    (%esi),%eax
  10017d:	83 c0 01             	add    $0x1,%eax
  100180:	83 c4 08             	add    $0x8,%esp
  100183:	0f b6 57 05          	movzbl 0x5(%edi),%edx
  100187:	52                   	push   %edx
  100188:	50                   	push   %eax
  100189:	e8 dc 28 00 00       	call   102a6a <outb>
	outb(addr_6845, 15);
  10018e:	83 c4 08             	add    $0x8,%esp
  100191:	6a 0f                	push   $0xf
  100193:	ff 36                	pushl  (%esi)
  100195:	e8 d0 28 00 00       	call   102a6a <outb>
	outb(addr_6845 + 1, terminal.crt_pos);
  10019a:	8b 06                	mov    (%esi),%eax
  10019c:	83 c0 01             	add    $0x1,%eax
  10019f:	83 c4 08             	add    $0x8,%esp
  1001a2:	0f b6 57 04          	movzbl 0x4(%edi),%edx
  1001a6:	52                   	push   %edx
  1001a7:	50                   	push   %eax
  1001a8:	e8 bd 28 00 00       	call   102a6a <outb>
       	  }
       outb(COM1+COM_TX, c);
       tmpcount++;
	  }
	*/
}
  1001ad:	83 c4 10             	add    $0x10,%esp
  1001b0:	5b                   	pop    %ebx
  1001b1:	5e                   	pop    %esi
  1001b2:	5f                   	pop    %edi
  1001b3:	c3                   	ret    
	switch (c & 0xff) {
  1001b4:	83 fa 08             	cmp    $0x8,%edx
  1001b7:	0f 85 88 00 00 00    	jne    100245 <video_putc+0x158>
		if (terminal.crt_pos > 0) {
  1001bd:	c7 c2 80 a4 96 00    	mov    $0x96a480,%edx
  1001c3:	0f b7 52 04          	movzwl 0x4(%edx),%edx
  1001c7:	66 85 d2             	test   %dx,%dx
  1001ca:	74 85                	je     100151 <video_putc+0x64>
			terminal.crt_pos--;
  1001cc:	83 ea 01             	sub    $0x1,%edx
  1001cf:	c7 c1 80 a4 96 00    	mov    $0x96a480,%ecx
  1001d5:	66 89 51 04          	mov    %dx,0x4(%ecx)
			terminal.crt_buf[terminal.crt_pos] = (c & ~0xff) | ' ';
  1001d9:	b0 00                	mov    $0x0,%al
  1001db:	0f b7 d2             	movzwl %dx,%edx
  1001de:	01 d2                	add    %edx,%edx
  1001e0:	03 11                	add    (%ecx),%edx
  1001e2:	83 c8 20             	or     $0x20,%eax
  1001e5:	66 89 02             	mov    %ax,(%edx)
  1001e8:	e9 64 ff ff ff       	jmp    100151 <video_putc+0x64>
		terminal.crt_pos += CRT_COLS;
  1001ed:	c7 c2 80 a4 96 00    	mov    $0x96a480,%edx
  1001f3:	0f b7 42 04          	movzwl 0x4(%edx),%eax
  1001f7:	83 c0 50             	add    $0x50,%eax
  1001fa:	66 89 42 04          	mov    %ax,0x4(%edx)
  1001fe:	e9 2d ff ff ff       	jmp    100130 <video_putc+0x43>
		video_putc(' ');
  100203:	83 ec 0c             	sub    $0xc,%esp
  100206:	6a 20                	push   $0x20
  100208:	e8 e0 fe ff ff       	call   1000ed <video_putc>
		video_putc(' ');
  10020d:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  100214:	e8 d4 fe ff ff       	call   1000ed <video_putc>
		video_putc(' ');
  100219:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  100220:	e8 c8 fe ff ff       	call   1000ed <video_putc>
		video_putc(' ');
  100225:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10022c:	e8 bc fe ff ff       	call   1000ed <video_putc>
		video_putc(' ');
  100231:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  100238:	e8 b0 fe ff ff       	call   1000ed <video_putc>
		break;
  10023d:	83 c4 10             	add    $0x10,%esp
  100240:	e9 0c ff ff ff       	jmp    100151 <video_putc+0x64>
		terminal.crt_buf[terminal.crt_pos++] = c;		/* write the character */
  100245:	c7 c1 80 a4 96 00    	mov    $0x96a480,%ecx
  10024b:	8b 31                	mov    (%ecx),%esi
  10024d:	0f b7 51 04          	movzwl 0x4(%ecx),%edx
  100251:	8d 7a 01             	lea    0x1(%edx),%edi
  100254:	66 89 79 04          	mov    %di,0x4(%ecx)
  100258:	0f b7 d2             	movzwl %dx,%edx
  10025b:	66 89 04 56          	mov    %ax,(%esi,%edx,2)
		break;
  10025f:	e9 ed fe ff ff       	jmp    100151 <video_putc+0x64>
		memmove(terminal.crt_buf, terminal.crt_buf + CRT_COLS,
  100264:	8b 00                	mov    (%eax),%eax
  100266:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10026c:	83 ec 04             	sub    $0x4,%esp
  10026f:	68 00 0f 00 00       	push   $0xf00
  100274:	52                   	push   %edx
  100275:	50                   	push   %eax
  100276:	e8 29 1c 00 00       	call   101ea4 <memmove>
		for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
  10027b:	83 c4 10             	add    $0x10,%esp
  10027e:	b8 80 07 00 00       	mov    $0x780,%eax
  100283:	eb 13                	jmp    100298 <video_putc+0x1ab>
			terminal.crt_buf[i] = 0x0700 | ' ';
  100285:	8d 14 00             	lea    (%eax,%eax,1),%edx
  100288:	c7 c1 80 a4 96 00    	mov    $0x96a480,%ecx
  10028e:	03 11                	add    (%ecx),%edx
  100290:	66 c7 02 20 07       	movw   $0x720,(%edx)
		for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i++)
  100295:	83 c0 01             	add    $0x1,%eax
  100298:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  10029d:	7e e6                	jle    100285 <video_putc+0x198>
		terminal.crt_pos -= CRT_COLS;
  10029f:	c7 c2 80 a4 96 00    	mov    $0x96a480,%edx
  1002a5:	0f b7 42 04          	movzwl 0x4(%edx),%eax
  1002a9:	83 e8 50             	sub    $0x50,%eax
  1002ac:	66 89 42 04          	mov    %ax,0x4(%edx)
  1002b0:	e9 ae fe ff ff       	jmp    100163 <video_putc+0x76>

001002b5 <video_set_cursor>:

void
video_set_cursor (int x, int y)
{
  1002b5:	e8 51 00 00 00       	call   10030b <__x86.get_pc_thunk.cx>
  1002ba:	81 c1 46 bd 00 00    	add    $0xbd46,%ecx
  1002c0:	8b 44 24 04          	mov    0x4(%esp),%eax
    terminal.crt_pos = x * CRT_COLS + y;
  1002c4:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1002c7:	c1 e0 04             	shl    $0x4,%eax
  1002ca:	89 c2                	mov    %eax,%edx
  1002cc:	66 03 54 24 08       	add    0x8(%esp),%dx
  1002d1:	c7 c0 80 a4 96 00    	mov    $0x96a480,%eax
  1002d7:	66 89 50 04          	mov    %dx,0x4(%eax)
}
  1002db:	c3                   	ret    

001002dc <video_clear_screen>:

void
video_clear_screen ()
{
  1002dc:	53                   	push   %ebx
  1002dd:	e8 2d 00 00 00       	call   10030f <__x86.get_pc_thunk.bx>
  1002e2:	81 c3 1e bd 00 00    	add    $0xbd1e,%ebx
    int i;
    for (i = 0; i < CRT_SIZE; i++)
  1002e8:	b8 00 00 00 00       	mov    $0x0,%eax
  1002ed:	eb 13                	jmp    100302 <video_clear_screen+0x26>
    {
        terminal.crt_buf[i] = ' ';
  1002ef:	8d 14 00             	lea    (%eax,%eax,1),%edx
  1002f2:	c7 c1 80 a4 96 00    	mov    $0x96a480,%ecx
  1002f8:	03 11                	add    (%ecx),%edx
  1002fa:	66 c7 02 20 00       	movw   $0x20,(%edx)
    for (i = 0; i < CRT_SIZE; i++)
  1002ff:	83 c0 01             	add    $0x1,%eax
  100302:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  100307:	7e e6                	jle    1002ef <video_clear_screen+0x13>
    }
}
  100309:	5b                   	pop    %ebx
  10030a:	c3                   	ret    

0010030b <__x86.get_pc_thunk.cx>:
  10030b:	8b 0c 24             	mov    (%esp),%ecx
  10030e:	c3                   	ret    

0010030f <__x86.get_pc_thunk.bx>:
  10030f:	8b 1c 24             	mov    (%esp),%ebx
  100312:	c3                   	ret    

00100313 <cons_init>:
	uint32_t rpos, wpos;
} cons;

void
cons_init()
{
  100313:	53                   	push   %ebx
  100314:	83 ec 0c             	sub    $0xc,%esp
  100317:	e8 f3 ff ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10031c:	81 c3 e4 bc 00 00    	add    $0xbce4,%ebx
	memset(&cons, 0x0, sizeof(cons));
  100322:	68 08 02 00 00       	push   $0x208
  100327:	6a 00                	push   $0x0
  100329:	ff b3 f8 ff ff ff    	pushl  -0x8(%ebx)
  10032f:	e8 27 1b 00 00       	call   101e5b <memset>
	serial_init();
  100334:	e8 57 03 00 00       	call   100690 <serial_init>
	video_init();
  100339:	e8 c2 fc ff ff       	call   100000 <video_init>
}
  10033e:	83 c4 18             	add    $0x18,%esp
  100341:	5b                   	pop    %ebx
  100342:	c3                   	ret    

00100343 <cons_intr>:

void
cons_intr(int (*proc)(void))
{
  100343:	57                   	push   %edi
  100344:	56                   	push   %esi
  100345:	53                   	push   %ebx
  100346:	e8 d0 01 00 00       	call   10051b <__x86.get_pc_thunk.si>
  10034b:	81 c6 b5 bc 00 00    	add    $0xbcb5,%esi
  100351:	8b 5c 24 10          	mov    0x10(%esp),%ebx
	int c;

	while ((c = (*proc)()) != -1) {
  100355:	ff d3                	call   *%ebx
  100357:	83 f8 ff             	cmp    $0xffffffff,%eax
  10035a:	74 30                	je     10038c <cons_intr+0x49>
		if (c == 0)
  10035c:	85 c0                	test   %eax,%eax
  10035e:	74 f5                	je     100355 <cons_intr+0x12>
			continue;
		cons.buf[cons.wpos++] = c;
  100360:	c7 c2 a0 a4 96 00    	mov    $0x96a4a0,%edx
  100366:	8b ba 04 02 00 00    	mov    0x204(%edx),%edi
  10036c:	8d 4f 01             	lea    0x1(%edi),%ecx
  10036f:	89 8a 04 02 00 00    	mov    %ecx,0x204(%edx)
  100375:	88 04 3a             	mov    %al,(%edx,%edi,1)
		if (cons.wpos == CONSOLE_BUFFER_SIZE)
  100378:	81 f9 00 02 00 00    	cmp    $0x200,%ecx
  10037e:	75 d5                	jne    100355 <cons_intr+0x12>
			cons.wpos = 0;
  100380:	c7 82 04 02 00 00 00 	movl   $0x0,0x204(%edx)
  100387:	00 00 00 
  10038a:	eb c9                	jmp    100355 <cons_intr+0x12>
	}
}
  10038c:	5b                   	pop    %ebx
  10038d:	5e                   	pop    %esi
  10038e:	5f                   	pop    %edi
  10038f:	c3                   	ret    

00100390 <cons_getc>:

char
cons_getc(void)
{
  100390:	53                   	push   %ebx
  100391:	83 ec 08             	sub    $0x8,%esp
  100394:	e8 76 ff ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  100399:	81 c3 67 bc 00 00    	add    $0xbc67,%ebx
  int c;

  // poll for any pending input characters,
  // so that this function works even when interrupts are disabled
  // (e.g., when called from the kernel monitor).
  serial_intr();
  10039f:	e8 42 02 00 00       	call   1005e6 <serial_intr>
  keyboard_intr();
  1003a4:	e8 f7 04 00 00       	call   1008a0 <keyboard_intr>

  // grab the next character from the input buffer.
  if (cons.rpos != cons.wpos) {
  1003a9:	c7 c2 a0 a4 96 00    	mov    $0x96a4a0,%edx
  1003af:	8b 82 00 02 00 00    	mov    0x200(%edx),%eax
  1003b5:	3b 82 04 02 00 00    	cmp    0x204(%edx),%eax
  1003bb:	74 2c                	je     1003e9 <cons_getc+0x59>
    c = cons.buf[cons.rpos++];
  1003bd:	8d 50 01             	lea    0x1(%eax),%edx
  1003c0:	c7 c1 a0 a4 96 00    	mov    $0x96a4a0,%ecx
  1003c6:	89 91 00 02 00 00    	mov    %edx,0x200(%ecx)
  1003cc:	0f b6 04 01          	movzbl (%ecx,%eax,1),%eax
    if (cons.rpos == CONSOLE_BUFFER_SIZE)
  1003d0:	81 fa 00 02 00 00    	cmp    $0x200,%edx
  1003d6:	74 05                	je     1003dd <cons_getc+0x4d>
      cons.rpos = 0;
    return c;
  }
  return 0;
}
  1003d8:	83 c4 08             	add    $0x8,%esp
  1003db:	5b                   	pop    %ebx
  1003dc:	c3                   	ret    
      cons.rpos = 0;
  1003dd:	c7 81 00 02 00 00 00 	movl   $0x0,0x200(%ecx)
  1003e4:	00 00 00 
  1003e7:	eb ef                	jmp    1003d8 <cons_getc+0x48>
  return 0;
  1003e9:	b8 00 00 00 00       	mov    $0x0,%eax
  1003ee:	eb e8                	jmp    1003d8 <cons_getc+0x48>

001003f0 <cons_putc>:

void
cons_putc(char c)
{
  1003f0:	56                   	push   %esi
  1003f1:	53                   	push   %ebx
  1003f2:	83 ec 10             	sub    $0x10,%esp
  1003f5:	e8 15 ff ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1003fa:	81 c3 06 bc 00 00    	add    $0xbc06,%ebx
	serial_putc(c);
  100400:	0f be 74 24 1c       	movsbl 0x1c(%esp),%esi
  100405:	56                   	push   %esi
  100406:	e8 0e 02 00 00       	call   100619 <serial_putc>
  video_putc(c);
  10040b:	89 34 24             	mov    %esi,(%esp)
  10040e:	e8 da fc ff ff       	call   1000ed <video_putc>
}
  100413:	83 c4 14             	add    $0x14,%esp
  100416:	5b                   	pop    %ebx
  100417:	5e                   	pop    %esi
  100418:	c3                   	ret    

00100419 <getchar>:

char
getchar(void)
{
  100419:	83 ec 0c             	sub    $0xc,%esp
  char c;

  while ((c = cons_getc()) == 0)
  10041c:	e8 6f ff ff ff       	call   100390 <cons_getc>
  100421:	84 c0                	test   %al,%al
  100423:	74 f7                	je     10041c <getchar+0x3>
    /* do nothing */;
  return c;
}
  100425:	83 c4 0c             	add    $0xc,%esp
  100428:	c3                   	ret    

00100429 <putchar>:

void
putchar(char c)
{
  100429:	83 ec 18             	sub    $0x18,%esp
  cons_putc(c);
  10042c:	0f be 44 24 1c       	movsbl 0x1c(%esp),%eax
  100431:	50                   	push   %eax
  100432:	e8 b9 ff ff ff       	call   1003f0 <cons_putc>
}
  100437:	83 c4 1c             	add    $0x1c,%esp
  10043a:	c3                   	ret    

0010043b <readline>:

char *
readline(const char *prompt)
{
  10043b:	57                   	push   %edi
  10043c:	56                   	push   %esi
  10043d:	53                   	push   %ebx
  10043e:	e8 dc 00 00 00       	call   10051f <__x86.get_pc_thunk.di>
  100443:	81 c7 bd bb 00 00    	add    $0xbbbd,%edi
  100449:	8b 44 24 10          	mov    0x10(%esp),%eax
  int i;
  char c;

  if (prompt != NULL)
  10044d:	85 c0                	test   %eax,%eax
  10044f:	74 15                	je     100466 <readline+0x2b>
    dprintf("%s", prompt);
  100451:	83 ec 08             	sub    $0x8,%esp
  100454:	50                   	push   %eax
  100455:	8d 87 ae a3 ff ff    	lea    -0x5c52(%edi),%eax
  10045b:	50                   	push   %eax
  10045c:	89 fb                	mov    %edi,%ebx
  10045e:	e8 a1 1d 00 00       	call   102204 <dprintf>
  100463:	83 c4 10             	add    $0x10,%esp
    } else if ((c == '\b' || c == '\x7f') && i > 0) {
      putchar('\b');
      i--;
    } else if (c >= ' ' && i < BUFLEN-1) {
      putchar(c);
      linebuf[i++] = c;
  100466:	be 00 00 00 00       	mov    $0x0,%esi
  10046b:	eb 44                	jmp    1004b1 <readline+0x76>
      dprintf("read error: %e\n", c);
  10046d:	83 ec 08             	sub    $0x8,%esp
  100470:	0f be c0             	movsbl %al,%eax
  100473:	50                   	push   %eax
  100474:	8d 87 b1 a3 ff ff    	lea    -0x5c4f(%edi),%eax
  10047a:	50                   	push   %eax
  10047b:	89 fb                	mov    %edi,%ebx
  10047d:	e8 82 1d 00 00       	call   102204 <dprintf>
      return NULL;
  100482:	83 c4 10             	add    $0x10,%esp
  100485:	b8 00 00 00 00       	mov    $0x0,%eax
      putchar('\n');
      linebuf[i] = 0;
      return linebuf;
    }
  }
}
  10048a:	5b                   	pop    %ebx
  10048b:	5e                   	pop    %esi
  10048c:	5f                   	pop    %edi
  10048d:	c3                   	ret    
    } else if (c >= ' ' && i < BUFLEN-1) {
  10048e:	80 fb 1f             	cmp    $0x1f,%bl
  100491:	0f 9f c2             	setg   %dl
  100494:	81 fe fe 03 00 00    	cmp    $0x3fe,%esi
  10049a:	0f 9e c0             	setle  %al
  10049d:	84 c2                	test   %al,%dl
  10049f:	75 3f                	jne    1004e0 <readline+0xa5>
    } else if (c == '\n' || c == '\r') {
  1004a1:	80 fb 0a             	cmp    $0xa,%bl
  1004a4:	0f 94 c2             	sete   %dl
  1004a7:	80 fb 0d             	cmp    $0xd,%bl
  1004aa:	0f 94 c0             	sete   %al
  1004ad:	08 c2                	or     %al,%dl
  1004af:	75 4a                	jne    1004fb <readline+0xc0>
    c = getchar();
  1004b1:	e8 63 ff ff ff       	call   100419 <getchar>
  1004b6:	89 c3                	mov    %eax,%ebx
    if (c < 0) {
  1004b8:	84 c0                	test   %al,%al
  1004ba:	78 b1                	js     10046d <readline+0x32>
    } else if ((c == '\b' || c == '\x7f') && i > 0) {
  1004bc:	3c 08                	cmp    $0x8,%al
  1004be:	0f 94 c2             	sete   %dl
  1004c1:	3c 7f                	cmp    $0x7f,%al
  1004c3:	0f 94 c0             	sete   %al
  1004c6:	08 c2                	or     %al,%dl
  1004c8:	74 c4                	je     10048e <readline+0x53>
  1004ca:	85 f6                	test   %esi,%esi
  1004cc:	7e c0                	jle    10048e <readline+0x53>
      putchar('\b');
  1004ce:	83 ec 0c             	sub    $0xc,%esp
  1004d1:	6a 08                	push   $0x8
  1004d3:	e8 51 ff ff ff       	call   100429 <putchar>
      i--;
  1004d8:	83 ee 01             	sub    $0x1,%esi
  1004db:	83 c4 10             	add    $0x10,%esp
  1004de:	eb d1                	jmp    1004b1 <readline+0x76>
      putchar(c);
  1004e0:	83 ec 0c             	sub    $0xc,%esp
  1004e3:	0f be c3             	movsbl %bl,%eax
  1004e6:	50                   	push   %eax
  1004e7:	e8 3d ff ff ff       	call   100429 <putchar>
      linebuf[i++] = c;
  1004ec:	88 9c 37 00 d0 01 00 	mov    %bl,0x1d000(%edi,%esi,1)
  1004f3:	83 c4 10             	add    $0x10,%esp
  1004f6:	8d 76 01             	lea    0x1(%esi),%esi
  1004f9:	eb b6                	jmp    1004b1 <readline+0x76>
      putchar('\n');
  1004fb:	83 ec 0c             	sub    $0xc,%esp
  1004fe:	6a 0a                	push   $0xa
  100500:	e8 24 ff ff ff       	call   100429 <putchar>
      linebuf[i] = 0;
  100505:	c6 84 37 00 d0 01 00 	movb   $0x0,0x1d000(%edi,%esi,1)
  10050c:	00 
      return linebuf;
  10050d:	83 c4 10             	add    $0x10,%esp
  100510:	8d 87 00 d0 01 00    	lea    0x1d000(%edi),%eax
  100516:	e9 6f ff ff ff       	jmp    10048a <readline+0x4f>

0010051b <__x86.get_pc_thunk.si>:
  10051b:	8b 34 24             	mov    (%esp),%esi
  10051e:	c3                   	ret    

0010051f <__x86.get_pc_thunk.di>:
  10051f:	8b 3c 24             	mov    (%esp),%edi
  100522:	c3                   	ret    

00100523 <serial_proc_data>:
	inb(0x84);
}

static int
serial_proc_data(void)
{
  100523:	53                   	push   %ebx
  100524:	83 ec 14             	sub    $0x14,%esp
  100527:	e8 e3 fd ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10052c:	81 c3 d4 ba 00 00    	add    $0xbad4,%ebx
	if (!(inb(COM1+COM_LSR) & COM_LSR_DATA))
  100532:	68 fd 03 00 00       	push   $0x3fd
  100537:	e8 16 25 00 00       	call   102a52 <inb>
  10053c:	83 c4 10             	add    $0x10,%esp
  10053f:	a8 01                	test   $0x1,%al
  100541:	74 18                	je     10055b <serial_proc_data+0x38>
		return -1;
	return inb(COM1+COM_RX);
  100543:	83 ec 0c             	sub    $0xc,%esp
  100546:	68 f8 03 00 00       	push   $0x3f8
  10054b:	e8 02 25 00 00       	call   102a52 <inb>
  100550:	0f b6 c0             	movzbl %al,%eax
  100553:	83 c4 10             	add    $0x10,%esp
}
  100556:	83 c4 08             	add    $0x8,%esp
  100559:	5b                   	pop    %ebx
  10055a:	c3                   	ret    
		return -1;
  10055b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100560:	eb f4                	jmp    100556 <serial_proc_data+0x33>

00100562 <delay>:
{
  100562:	53                   	push   %ebx
  100563:	83 ec 14             	sub    $0x14,%esp
  100566:	e8 a4 fd ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10056b:	81 c3 95 ba 00 00    	add    $0xba95,%ebx
	inb(0x84);
  100571:	68 84 00 00 00       	push   $0x84
  100576:	e8 d7 24 00 00       	call   102a52 <inb>
	inb(0x84);
  10057b:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  100582:	e8 cb 24 00 00       	call   102a52 <inb>
	inb(0x84);
  100587:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  10058e:	e8 bf 24 00 00       	call   102a52 <inb>
	inb(0x84);
  100593:	c7 04 24 84 00 00 00 	movl   $0x84,(%esp)
  10059a:	e8 b3 24 00 00       	call   102a52 <inb>
}
  10059f:	83 c4 18             	add    $0x18,%esp
  1005a2:	5b                   	pop    %ebx
  1005a3:	c3                   	ret    

001005a4 <serial_reformatnewline>:
		cons_intr(serial_proc_data);
}

static int
serial_reformatnewline(int c, int p)
{
  1005a4:	56                   	push   %esi
  1005a5:	53                   	push   %ebx
  1005a6:	83 ec 04             	sub    $0x4,%esp
  1005a9:	e8 61 fd ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1005ae:	81 c3 52 ba 00 00    	add    $0xba52,%ebx
	int nl = '\n';
	/* POSIX requires newline on the serial line to
	 * be a CR-LF pair. Without this, you get a malformed output
	 * with clients like minicom or screen
	 */
	if (c == nl) {
  1005b4:	83 f8 0a             	cmp    $0xa,%eax
  1005b7:	74 0b                	je     1005c4 <serial_reformatnewline+0x20>
		outb(p, cr);
		outb(p, nl);
		return 1;
	}
	else
		return 0;
  1005b9:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1005be:	83 c4 04             	add    $0x4,%esp
  1005c1:	5b                   	pop    %ebx
  1005c2:	5e                   	pop    %esi
  1005c3:	c3                   	ret    
  1005c4:	89 d6                	mov    %edx,%esi
		outb(p, cr);
  1005c6:	83 ec 08             	sub    $0x8,%esp
  1005c9:	6a 0d                	push   $0xd
  1005cb:	52                   	push   %edx
  1005cc:	e8 99 24 00 00       	call   102a6a <outb>
		outb(p, nl);
  1005d1:	83 c4 08             	add    $0x8,%esp
  1005d4:	6a 0a                	push   $0xa
  1005d6:	56                   	push   %esi
  1005d7:	e8 8e 24 00 00       	call   102a6a <outb>
		return 1;
  1005dc:	83 c4 10             	add    $0x10,%esp
  1005df:	b8 01 00 00 00       	mov    $0x1,%eax
  1005e4:	eb d8                	jmp    1005be <serial_reformatnewline+0x1a>

001005e6 <serial_intr>:
{
  1005e6:	53                   	push   %ebx
  1005e7:	83 ec 08             	sub    $0x8,%esp
  1005ea:	e8 20 fd ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1005ef:	81 c3 11 ba 00 00    	add    $0xba11,%ebx
	if (serial_exists)
  1005f5:	c7 c0 a8 a6 96 00    	mov    $0x96a6a8,%eax
  1005fb:	80 38 00             	cmpb   $0x0,(%eax)
  1005fe:	75 05                	jne    100605 <serial_intr+0x1f>
}
  100600:	83 c4 08             	add    $0x8,%esp
  100603:	5b                   	pop    %ebx
  100604:	c3                   	ret    
		cons_intr(serial_proc_data);
  100605:	83 ec 0c             	sub    $0xc,%esp
  100608:	8d 83 23 45 ff ff    	lea    -0xbadd(%ebx),%eax
  10060e:	50                   	push   %eax
  10060f:	e8 2f fd ff ff       	call   100343 <cons_intr>
  100614:	83 c4 10             	add    $0x10,%esp
}
  100617:	eb e7                	jmp    100600 <serial_intr+0x1a>

00100619 <serial_putc>:

void
serial_putc(char c)
{
  100619:	57                   	push   %edi
  10061a:	56                   	push   %esi
  10061b:	53                   	push   %ebx
  10061c:	e8 ee fc ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  100621:	81 c3 df b9 00 00    	add    $0xb9df,%ebx
  100627:	8b 7c 24 10          	mov    0x10(%esp),%edi
	if (!serial_exists)
  10062b:	c7 c0 a8 a6 96 00    	mov    $0x96a6a8,%eax
  100631:	80 38 00             	cmpb   $0x0,(%eax)
  100634:	74 3e                	je     100674 <serial_putc+0x5b>
		return;

	int i;
	for (i = 0;
  100636:	be 00 00 00 00       	mov    $0x0,%esi
	     !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800;
  10063b:	83 ec 0c             	sub    $0xc,%esp
  10063e:	68 fd 03 00 00       	push   $0x3fd
  100643:	e8 0a 24 00 00       	call   102a52 <inb>
	for (i = 0;
  100648:	83 c4 10             	add    $0x10,%esp
  10064b:	a8 20                	test   $0x20,%al
  10064d:	75 12                	jne    100661 <serial_putc+0x48>
	     !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800;
  10064f:	81 fe ff 31 00 00    	cmp    $0x31ff,%esi
  100655:	7f 0a                	jg     100661 <serial_putc+0x48>
	     i++)
		delay();
  100657:	e8 06 ff ff ff       	call   100562 <delay>
	     i++)
  10065c:	83 c6 01             	add    $0x1,%esi
  10065f:	eb da                	jmp    10063b <serial_putc+0x22>

	if (!serial_reformatnewline(c, COM1 + COM_TX))
  100661:	89 f8                	mov    %edi,%eax
  100663:	0f be c0             	movsbl %al,%eax
  100666:	ba f8 03 00 00       	mov    $0x3f8,%edx
  10066b:	e8 34 ff ff ff       	call   1005a4 <serial_reformatnewline>
  100670:	85 c0                	test   %eax,%eax
  100672:	74 04                	je     100678 <serial_putc+0x5f>
		outb(COM1 + COM_TX, c);
}
  100674:	5b                   	pop    %ebx
  100675:	5e                   	pop    %esi
  100676:	5f                   	pop    %edi
  100677:	c3                   	ret    
		outb(COM1 + COM_TX, c);
  100678:	83 ec 08             	sub    $0x8,%esp
  10067b:	89 f8                	mov    %edi,%eax
  10067d:	0f b6 f8             	movzbl %al,%edi
  100680:	57                   	push   %edi
  100681:	68 f8 03 00 00       	push   $0x3f8
  100686:	e8 df 23 00 00       	call   102a6a <outb>
  10068b:	83 c4 10             	add    $0x10,%esp
  10068e:	eb e4                	jmp    100674 <serial_putc+0x5b>

00100690 <serial_init>:

void
serial_init(void)
{
  100690:	53                   	push   %ebx
  100691:	83 ec 10             	sub    $0x10,%esp
  100694:	e8 76 fc ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  100699:	81 c3 67 b9 00 00    	add    $0xb967,%ebx
	/* turn off interrupt */
	outb(COM1 + COM_IER, 0);
  10069f:	6a 00                	push   $0x0
  1006a1:	68 f9 03 00 00       	push   $0x3f9
  1006a6:	e8 bf 23 00 00       	call   102a6a <outb>

	/* set DLAB */
	outb(COM1 + COM_LCR, COM_LCR_DLAB);
  1006ab:	83 c4 08             	add    $0x8,%esp
  1006ae:	68 80 00 00 00       	push   $0x80
  1006b3:	68 fb 03 00 00       	push   $0x3fb
  1006b8:	e8 ad 23 00 00       	call   102a6a <outb>

	/* set baud rate */
	outb(COM1 + COM_DLL, 0x0001 & 0xff);
  1006bd:	83 c4 08             	add    $0x8,%esp
  1006c0:	6a 01                	push   $0x1
  1006c2:	68 f8 03 00 00       	push   $0x3f8
  1006c7:	e8 9e 23 00 00       	call   102a6a <outb>
	outb(COM1 + COM_DLM, 0x0001 >> 8);
  1006cc:	83 c4 08             	add    $0x8,%esp
  1006cf:	6a 00                	push   $0x0
  1006d1:	68 f9 03 00 00       	push   $0x3f9
  1006d6:	e8 8f 23 00 00       	call   102a6a <outb>

	/* Set the line status.  */
	outb(COM1 + COM_LCR, COM_LCR_WLEN8 & ~COM_LCR_DLAB);
  1006db:	83 c4 08             	add    $0x8,%esp
  1006de:	6a 03                	push   $0x3
  1006e0:	68 fb 03 00 00       	push   $0x3fb
  1006e5:	e8 80 23 00 00       	call   102a6a <outb>

	/* Enable the FIFO.  */
	outb(COM1 + COM_FCR, 0xc7);
  1006ea:	83 c4 08             	add    $0x8,%esp
  1006ed:	68 c7 00 00 00       	push   $0xc7
  1006f2:	68 fa 03 00 00       	push   $0x3fa
  1006f7:	e8 6e 23 00 00       	call   102a6a <outb>

	/* Turn on DTR, RTS, and OUT2.  */
	outb(COM1 + COM_MCR, 0x0b);
  1006fc:	83 c4 08             	add    $0x8,%esp
  1006ff:	6a 0b                	push   $0xb
  100701:	68 fc 03 00 00       	push   $0x3fc
  100706:	e8 5f 23 00 00       	call   102a6a <outb>

	// Clear any preexisting overrun indications and interrupts
	// Serial COM1 doesn't exist if COM_LSR returns 0xFF
	serial_exists = (inb(COM1+COM_LSR) != 0xFF);
  10070b:	c7 04 24 fd 03 00 00 	movl   $0x3fd,(%esp)
  100712:	e8 3b 23 00 00       	call   102a52 <inb>
  100717:	3c ff                	cmp    $0xff,%al
  100719:	c7 c0 a8 a6 96 00    	mov    $0x96a6a8,%eax
  10071f:	0f 95 00             	setne  (%eax)
	(void) inb(COM1+COM_IIR);
  100722:	c7 04 24 fa 03 00 00 	movl   $0x3fa,(%esp)
  100729:	e8 24 23 00 00       	call   102a52 <inb>
	(void) inb(COM1+COM_RX);
  10072e:	c7 04 24 f8 03 00 00 	movl   $0x3f8,(%esp)
  100735:	e8 18 23 00 00       	call   102a52 <inb>
}
  10073a:	83 c4 18             	add    $0x18,%esp
  10073d:	5b                   	pop    %ebx
  10073e:	c3                   	ret    

0010073f <serial_intenable>:

void
serial_intenable(void)
{
  10073f:	53                   	push   %ebx
  100740:	83 ec 08             	sub    $0x8,%esp
  100743:	e8 c7 fb ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  100748:	81 c3 b8 b8 00 00    	add    $0xb8b8,%ebx
	if (serial_exists) {
  10074e:	c7 c0 a8 a6 96 00    	mov    $0x96a6a8,%eax
  100754:	80 38 00             	cmpb   $0x0,(%eax)
  100757:	75 05                	jne    10075e <serial_intenable+0x1f>
		outb(COM1+COM_IER, 1);
		//intr_enable(IRQ_SERIAL13);
		serial_intr();
	}
}
  100759:	83 c4 08             	add    $0x8,%esp
  10075c:	5b                   	pop    %ebx
  10075d:	c3                   	ret    
		outb(COM1+COM_IER, 1);
  10075e:	83 ec 08             	sub    $0x8,%esp
  100761:	6a 01                	push   $0x1
  100763:	68 f9 03 00 00       	push   $0x3f9
  100768:	e8 fd 22 00 00       	call   102a6a <outb>
		serial_intr();
  10076d:	e8 74 fe ff ff       	call   1005e6 <serial_intr>
  100772:	83 c4 10             	add    $0x10,%esp
}
  100775:	eb e2                	jmp    100759 <serial_intenable+0x1a>

00100777 <kbd_proc_data>:
 * Get data from the keyboard.  If we finish a character, return it.  Else 0.
 * Return -1 if no data.
 */
static int
kbd_proc_data(void)
{
  100777:	56                   	push   %esi
  100778:	53                   	push   %ebx
  100779:	83 ec 10             	sub    $0x10,%esp
  10077c:	e8 8e fb ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  100781:	81 c3 7f b8 00 00    	add    $0xb87f,%ebx
  int c;
  uint8_t data;
  static uint32_t shift;

  if ((inb(KBSTATP) & KBS_DIB) == 0)
  100787:	6a 64                	push   $0x64
  100789:	e8 c4 22 00 00       	call   102a52 <inb>
  10078e:	83 c4 10             	add    $0x10,%esp
  100791:	a8 01                	test   $0x1,%al
  100793:	0f 84 00 01 00 00    	je     100899 <kbd_proc_data+0x122>
    return -1;

  data = inb(KBDATAP);
  100799:	83 ec 0c             	sub    $0xc,%esp
  10079c:	6a 60                	push   $0x60
  10079e:	e8 af 22 00 00       	call   102a52 <inb>

  if (data == 0xE0) {
  1007a3:	83 c4 10             	add    $0x10,%esp
  1007a6:	3c e0                	cmp    $0xe0,%al
  1007a8:	0f 84 97 00 00 00    	je     100845 <kbd_proc_data+0xce>
    // E0 escape character
    shift |= E0ESC;
    return 0;
  } else if (data & 0x80) {
  1007ae:	84 c0                	test   %al,%al
  1007b0:	0f 88 a3 00 00 00    	js     100859 <kbd_proc_data+0xe2>
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if (shift & E0ESC) {
  1007b6:	8b 93 00 d4 01 00    	mov    0x1d400(%ebx),%edx
  1007bc:	f6 c2 40             	test   $0x40,%dl
  1007bf:	74 0c                	je     1007cd <kbd_proc_data+0x56>
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
  1007c1:	83 c8 80             	or     $0xffffff80,%eax
    shift &= ~E0ESC;
  1007c4:	83 e2 bf             	and    $0xffffffbf,%edx
  1007c7:	89 93 00 d4 01 00    	mov    %edx,0x1d400(%ebx)
  }

  shift |= shiftcode[data];
  1007cd:	0f b6 c0             	movzbl %al,%eax
  1007d0:	0f b6 94 03 e0 a4 ff 	movzbl -0x5b20(%ebx,%eax,1),%edx
  1007d7:	ff 
  1007d8:	0b 93 00 d4 01 00    	or     0x1d400(%ebx),%edx
  shift ^= togglecode[data];
  1007de:	0f b6 8c 03 e0 a3 ff 	movzbl -0x5c20(%ebx,%eax,1),%ecx
  1007e5:	ff 
  1007e6:	31 ca                	xor    %ecx,%edx
  1007e8:	89 93 00 d4 01 00    	mov    %edx,0x1d400(%ebx)

  c = charcode[shift & (CTL | SHIFT)][data];
  1007ee:	89 d1                	mov    %edx,%ecx
  1007f0:	83 e1 03             	and    $0x3,%ecx
  1007f3:	8b 8c 8b a0 ff ff ff 	mov    -0x60(%ebx,%ecx,4),%ecx
  1007fa:	0f b6 04 01          	movzbl (%ecx,%eax,1),%eax
  1007fe:	0f b6 f0             	movzbl %al,%esi
  if (shift & CAPSLOCK) {
  100801:	f6 c2 08             	test   $0x8,%dl
  100804:	74 0d                	je     100813 <kbd_proc_data+0x9c>
    if ('a' <= c && c <= 'z')
  100806:	89 f0                	mov    %esi,%eax
  100808:	8d 4e 9f             	lea    -0x61(%esi),%ecx
  10080b:	83 f9 19             	cmp    $0x19,%ecx
  10080e:	77 79                	ja     100889 <kbd_proc_data+0x112>
      c += 'A' - 'a';
  100810:	83 ee 20             	sub    $0x20,%esi
      c += 'a' - 'A';
  }

  // Process special keys
  // Ctrl-Alt-Del: reboot
  if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  100813:	f7 d2                	not    %edx
  100815:	f6 c2 06             	test   $0x6,%dl
  100818:	75 37                	jne    100851 <kbd_proc_data+0xda>
  10081a:	81 fe e9 00 00 00    	cmp    $0xe9,%esi
  100820:	75 2f                	jne    100851 <kbd_proc_data+0xda>
    dprintf("Rebooting!\n");
  100822:	83 ec 0c             	sub    $0xc,%esp
  100825:	8d 83 c1 a3 ff ff    	lea    -0x5c3f(%ebx),%eax
  10082b:	50                   	push   %eax
  10082c:	e8 d3 19 00 00       	call   102204 <dprintf>
    outb(0x92, 0x3); // courtesy of Chris Frost
  100831:	83 c4 08             	add    $0x8,%esp
  100834:	6a 03                	push   $0x3
  100836:	68 92 00 00 00       	push   $0x92
  10083b:	e8 2a 22 00 00       	call   102a6a <outb>
  100840:	83 c4 10             	add    $0x10,%esp
  100843:	eb 0c                	jmp    100851 <kbd_proc_data+0xda>
    shift |= E0ESC;
  100845:	83 8b 00 d4 01 00 40 	orl    $0x40,0x1d400(%ebx)
    return 0;
  10084c:	be 00 00 00 00       	mov    $0x0,%esi
  }

  return c;
}
  100851:	89 f0                	mov    %esi,%eax
  100853:	83 c4 04             	add    $0x4,%esp
  100856:	5b                   	pop    %ebx
  100857:	5e                   	pop    %esi
  100858:	c3                   	ret    
    data = (shift & E0ESC ? data : data & 0x7F);
  100859:	8b 93 00 d4 01 00    	mov    0x1d400(%ebx),%edx
  10085f:	f6 c2 40             	test   $0x40,%dl
  100862:	75 03                	jne    100867 <kbd_proc_data+0xf0>
  100864:	83 e0 7f             	and    $0x7f,%eax
    shift &= ~(shiftcode[data] | E0ESC);
  100867:	0f b6 c0             	movzbl %al,%eax
  10086a:	0f b6 84 03 e0 a4 ff 	movzbl -0x5b20(%ebx,%eax,1),%eax
  100871:	ff 
  100872:	83 c8 40             	or     $0x40,%eax
  100875:	0f b6 c0             	movzbl %al,%eax
  100878:	f7 d0                	not    %eax
  10087a:	21 d0                	and    %edx,%eax
  10087c:	89 83 00 d4 01 00    	mov    %eax,0x1d400(%ebx)
    return 0;
  100882:	be 00 00 00 00       	mov    $0x0,%esi
  100887:	eb c8                	jmp    100851 <kbd_proc_data+0xda>
    else if ('A' <= c && c <= 'Z')
  100889:	83 e8 41             	sub    $0x41,%eax
  10088c:	83 f8 19             	cmp    $0x19,%eax
  10088f:	77 82                	ja     100813 <kbd_proc_data+0x9c>
      c += 'a' - 'A';
  100891:	83 c6 20             	add    $0x20,%esi
  100894:	e9 7a ff ff ff       	jmp    100813 <kbd_proc_data+0x9c>
    return -1;
  100899:	be ff ff ff ff       	mov    $0xffffffff,%esi
  10089e:	eb b1                	jmp    100851 <kbd_proc_data+0xda>

001008a0 <keyboard_intr>:

void
keyboard_intr(void)
{
  1008a0:	53                   	push   %ebx
  1008a1:	83 ec 14             	sub    $0x14,%esp
  1008a4:	e8 66 fa ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1008a9:	81 c3 57 b7 00 00    	add    $0xb757,%ebx
  cons_intr(kbd_proc_data);
  1008af:	8d 83 77 47 ff ff    	lea    -0xb889(%ebx),%eax
  1008b5:	50                   	push   %eax
  1008b6:	e8 88 fa ff ff       	call   100343 <cons_intr>
}
  1008bb:	83 c4 18             	add    $0x18,%esp
  1008be:	5b                   	pop    %ebx
  1008bf:	c3                   	ret    

001008c0 <devinit>:

void intr_init(void);

void
devinit (uintptr_t mbi_addr)
{
  1008c0:	57                   	push   %edi
  1008c1:	56                   	push   %esi
  1008c2:	53                   	push   %ebx
  1008c3:	e8 47 fa ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1008c8:	81 c3 38 b7 00 00    	add    $0xb738,%ebx
  1008ce:	8b 74 24 10          	mov    0x10(%esp),%esi
	seg_init ();
  1008d2:	e8 3b 1e 00 00       	call   102712 <seg_init>

	enable_sse ();
  1008d7:	e8 e7 20 00 00       	call   1029c3 <enable_sse>

	cons_init ();
  1008dc:	e8 32 fa ff ff       	call   100313 <cons_init>
	KERN_DEBUG("cons initialized.\n");
  1008e1:	83 ec 04             	sub    $0x4,%esp
  1008e4:	8d 83 e0 a5 ff ff    	lea    -0x5a20(%ebx),%eax
  1008ea:	50                   	push   %eax
  1008eb:	6a 15                	push   $0x15
  1008ed:	8d bb f3 a5 ff ff    	lea    -0x5a0d(%ebx),%edi
  1008f3:	57                   	push   %edi
  1008f4:	e8 3f 17 00 00       	call   102038 <debug_normal>
	KERN_DEBUG("devinit mbi_adr: %d\n", mbi_addr);
  1008f9:	56                   	push   %esi
  1008fa:	8d 83 06 a6 ff ff    	lea    -0x59fa(%ebx),%eax
  100900:	50                   	push   %eax
  100901:	6a 16                	push   $0x16
  100903:	57                   	push   %edi
  100904:	e8 2f 17 00 00       	call   102038 <debug_normal>

  	tsc_init();
  100909:	83 c4 20             	add    $0x20,%esp
  10090c:	e8 f1 11 00 00       	call   101b02 <tsc_init>

	intr_init();
  100911:	e8 f5 0c 00 00       	call   10160b <intr_init>

  	/* enable interrupts */
  	intr_enable (IRQ_TIMER);
  100916:	83 ec 0c             	sub    $0xc,%esp
  100919:	6a 00                	push   $0x0
  10091b:	e8 1b 0d 00 00       	call   10163b <intr_enable>
  	intr_enable (IRQ_KBD);
  100920:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  100927:	e8 0f 0d 00 00       	call   10163b <intr_enable>
  	intr_enable (IRQ_SERIAL13);
  10092c:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100933:	e8 03 0d 00 00       	call   10163b <intr_enable>

	pmmap_init (mbi_addr);
  100938:	89 34 24             	mov    %esi,(%esp)
  10093b:	e8 66 02 00 00       	call   100ba6 <pmmap_init>
}
  100940:	83 c4 10             	add    $0x10,%esp
  100943:	5b                   	pop    %ebx
  100944:	5e                   	pop    %esi
  100945:	5f                   	pop    %edi
  100946:	c3                   	ret    

00100947 <pmmap_dump>:
		max_usable_memory = last_slot[PMMAP_USABLE]->end;
}

static void
pmmap_dump(void)
{
  100947:	56                   	push   %esi
  100948:	53                   	push   %ebx
  100949:	83 ec 04             	sub    $0x4,%esp
  10094c:	e8 be f9 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  100951:	81 c3 af b6 00 00    	add    $0xb6af,%ebx
	struct pmmap *slot;
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100957:	8b b3 38 d4 01 00    	mov    0x1d438(%ebx),%esi
  10095d:	eb 34                	jmp    100993 <pmmap_dump+0x4c>
		KERN_INFO("BIOS-e820: 0x%08x - 0x%08x (%s)\n",
  10095f:	8d 8b 3d a6 ff ff    	lea    -0x59c3(%ebx),%ecx
  100965:	eb 06                	jmp    10096d <pmmap_dump+0x26>
  100967:	8d 8b 24 a6 ff ff    	lea    -0x59dc(%ebx),%ecx
  10096d:	8b 16                	mov    (%esi),%edx
  10096f:	8b 46 04             	mov    0x4(%esi),%eax
  100972:	39 c2                	cmp    %eax,%edx
  100974:	74 08                	je     10097e <pmmap_dump+0x37>
  100976:	83 f8 ff             	cmp    $0xffffffff,%eax
  100979:	74 03                	je     10097e <pmmap_dump+0x37>
  10097b:	83 e8 01             	sub    $0x1,%eax
  10097e:	51                   	push   %ecx
  10097f:	50                   	push   %eax
  100980:	52                   	push   %edx
  100981:	8d 83 a4 a6 ff ff    	lea    -0x595c(%ebx),%eax
  100987:	50                   	push   %eax
  100988:	e8 86 16 00 00       	call   102013 <debug_info>
	SLIST_FOREACH(slot, &pmmap_list, next) {
  10098d:	8b 76 0c             	mov    0xc(%esi),%esi
  100990:	83 c4 10             	add    $0x10,%esp
  100993:	85 f6                	test   %esi,%esi
  100995:	74 2f                	je     1009c6 <pmmap_dump+0x7f>
		KERN_INFO("BIOS-e820: 0x%08x - 0x%08x (%s)\n",
  100997:	8b 46 08             	mov    0x8(%esi),%eax
  10099a:	83 f8 01             	cmp    $0x1,%eax
  10099d:	74 c8                	je     100967 <pmmap_dump+0x20>
  10099f:	83 f8 02             	cmp    $0x2,%eax
  1009a2:	74 12                	je     1009b6 <pmmap_dump+0x6f>
  1009a4:	83 f8 03             	cmp    $0x3,%eax
  1009a7:	74 15                	je     1009be <pmmap_dump+0x77>
  1009a9:	83 f8 04             	cmp    $0x4,%eax
  1009ac:	74 b1                	je     10095f <pmmap_dump+0x18>
  1009ae:	8d 8b 35 a6 ff ff    	lea    -0x59cb(%ebx),%ecx
  1009b4:	eb b7                	jmp    10096d <pmmap_dump+0x26>
  1009b6:	8d 8b 1b a6 ff ff    	lea    -0x59e5(%ebx),%ecx
  1009bc:	eb af                	jmp    10096d <pmmap_dump+0x26>
  1009be:	8d 8b 2b a6 ff ff    	lea    -0x59d5(%ebx),%ecx
  1009c4:	eb a7                	jmp    10096d <pmmap_dump+0x26>
			  (slot->type == MEM_RESERVED) ? "reserved" :
			  (slot->type == MEM_ACPI) ? "ACPI data" :
			  (slot->type == MEM_NVS) ? "ACPI NVS" :
			  "unknown");
	}
}
  1009c6:	83 c4 04             	add    $0x4,%esp
  1009c9:	5b                   	pop    %ebx
  1009ca:	5e                   	pop    %esi
  1009cb:	c3                   	ret    

001009cc <pmmap_merge>:
{
  1009cc:	56                   	push   %esi
  1009cd:	53                   	push   %ebx
  1009ce:	83 ec 14             	sub    $0x14,%esp
  1009d1:	e8 39 f9 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1009d6:	81 c3 2a b6 00 00    	add    $0xb62a,%ebx
	struct pmmap *last_slot[4] = { NULL, NULL, NULL, NULL };
  1009dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1009e3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  1009ea:	00 
  1009eb:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  1009f2:	00 
  1009f3:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  1009fa:	00 
	SLIST_FOREACH(slot, &pmmap_list, next) {
  1009fb:	8b b3 38 d4 01 00    	mov    0x1d438(%ebx),%esi
  100a01:	eb 03                	jmp    100a06 <pmmap_merge+0x3a>
  100a03:	8b 76 0c             	mov    0xc(%esi),%esi
  100a06:	85 f6                	test   %esi,%esi
  100a08:	74 39                	je     100a43 <pmmap_merge+0x77>
		if ((next_slot = SLIST_NEXT(slot, next)) == NULL)
  100a0a:	8b 46 0c             	mov    0xc(%esi),%eax
  100a0d:	85 c0                	test   %eax,%eax
  100a0f:	74 32                	je     100a43 <pmmap_merge+0x77>
		if (slot->start <= next_slot->start &&
  100a11:	8b 10                	mov    (%eax),%edx
  100a13:	39 16                	cmp    %edx,(%esi)
  100a15:	77 ec                	ja     100a03 <pmmap_merge+0x37>
		    slot->end >= next_slot->start &&
  100a17:	8b 4e 04             	mov    0x4(%esi),%ecx
		if (slot->start <= next_slot->start &&
  100a1a:	39 ca                	cmp    %ecx,%edx
  100a1c:	77 e5                	ja     100a03 <pmmap_merge+0x37>
		    slot->end >= next_slot->start &&
  100a1e:	8b 50 08             	mov    0x8(%eax),%edx
  100a21:	39 56 08             	cmp    %edx,0x8(%esi)
  100a24:	75 dd                	jne    100a03 <pmmap_merge+0x37>
			slot->end = max(slot->end, next_slot->end);
  100a26:	83 ec 08             	sub    $0x8,%esp
  100a29:	ff 70 04             	pushl  0x4(%eax)
  100a2c:	51                   	push   %ecx
  100a2d:	e8 21 1f 00 00       	call   102953 <max>
  100a32:	89 46 04             	mov    %eax,0x4(%esi)
			SLIST_REMOVE_AFTER(slot, next);
  100a35:	8b 46 0c             	mov    0xc(%esi),%eax
  100a38:	8b 40 0c             	mov    0xc(%eax),%eax
  100a3b:	89 46 0c             	mov    %eax,0xc(%esi)
  100a3e:	83 c4 10             	add    $0x10,%esp
  100a41:	eb c0                	jmp    100a03 <pmmap_merge+0x37>
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100a43:	8b b3 38 d4 01 00    	mov    0x1d438(%ebx),%esi
  100a49:	eb 41                	jmp    100a8c <pmmap_merge+0xc0>
    KERN_ASSERT(sublist_nr != -1);
  100a4b:	8d 83 46 a6 ff ff    	lea    -0x59ba(%ebx),%eax
  100a51:	50                   	push   %eax
  100a52:	8d 83 57 a6 ff ff    	lea    -0x59a9(%ebx),%eax
  100a58:	50                   	push   %eax
  100a59:	6a 71                	push   $0x71
  100a5b:	8d 83 74 a6 ff ff    	lea    -0x598c(%ebx),%eax
  100a61:	50                   	push   %eax
  100a62:	e8 0a 16 00 00       	call   102071 <debug_panic>
  100a67:	83 c4 10             	add    $0x10,%esp
		sublist_nr = PMMAP_SUBLIST_NR(slot->type);
  100a6a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100a6f:	eb 05                	jmp    100a76 <pmmap_merge+0xaa>
  100a71:	b8 00 00 00 00       	mov    $0x0,%eax
		if (last_slot[sublist_nr] != NULL)
  100a76:	8b 14 84             	mov    (%esp,%eax,4),%edx
  100a79:	85 d2                	test   %edx,%edx
  100a7b:	74 3f                	je     100abc <pmmap_merge+0xf0>
			SLIST_INSERT_AFTER(last_slot[sublist_nr], slot,
  100a7d:	8b 4a 10             	mov    0x10(%edx),%ecx
  100a80:	89 4e 10             	mov    %ecx,0x10(%esi)
  100a83:	89 72 10             	mov    %esi,0x10(%edx)
		last_slot[sublist_nr] = slot;
  100a86:	89 34 84             	mov    %esi,(%esp,%eax,4)
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100a89:	8b 76 0c             	mov    0xc(%esi),%esi
  100a8c:	85 f6                	test   %esi,%esi
  100a8e:	74 3d                	je     100acd <pmmap_merge+0x101>
		sublist_nr = PMMAP_SUBLIST_NR(slot->type);
  100a90:	8b 46 08             	mov    0x8(%esi),%eax
  100a93:	83 f8 01             	cmp    $0x1,%eax
  100a96:	74 d9                	je     100a71 <pmmap_merge+0xa5>
  100a98:	83 f8 02             	cmp    $0x2,%eax
  100a9b:	74 11                	je     100aae <pmmap_merge+0xe2>
  100a9d:	83 f8 03             	cmp    $0x3,%eax
  100aa0:	74 13                	je     100ab5 <pmmap_merge+0xe9>
  100aa2:	83 f8 04             	cmp    $0x4,%eax
  100aa5:	75 a4                	jne    100a4b <pmmap_merge+0x7f>
  100aa7:	b8 03 00 00 00       	mov    $0x3,%eax
  100aac:	eb c8                	jmp    100a76 <pmmap_merge+0xaa>
  100aae:	b8 01 00 00 00       	mov    $0x1,%eax
  100ab3:	eb c1                	jmp    100a76 <pmmap_merge+0xaa>
  100ab5:	b8 02 00 00 00       	mov    $0x2,%eax
  100aba:	eb ba                	jmp    100a76 <pmmap_merge+0xaa>
			SLIST_INSERT_HEAD(&pmmap_sublist[sublist_nr], slot,
  100abc:	8d 93 28 d4 01 00    	lea    0x1d428(%ebx),%edx
  100ac2:	8b 0c 82             	mov    (%edx,%eax,4),%ecx
  100ac5:	89 4e 10             	mov    %ecx,0x10(%esi)
  100ac8:	89 34 82             	mov    %esi,(%edx,%eax,4)
  100acb:	eb b9                	jmp    100a86 <pmmap_merge+0xba>
	if (last_slot[PMMAP_USABLE] != NULL)
  100acd:	8b 04 24             	mov    (%esp),%eax
  100ad0:	85 c0                	test   %eax,%eax
  100ad2:	74 09                	je     100add <pmmap_merge+0x111>
		max_usable_memory = last_slot[PMMAP_USABLE]->end;
  100ad4:	8b 40 04             	mov    0x4(%eax),%eax
  100ad7:	89 83 24 d4 01 00    	mov    %eax,0x1d424(%ebx)
}
  100add:	83 c4 14             	add    $0x14,%esp
  100ae0:	5b                   	pop    %ebx
  100ae1:	5e                   	pop    %esi
  100ae2:	c3                   	ret    

00100ae3 <pmmap_alloc_slot>:
{
  100ae3:	e8 e9 02 00 00       	call   100dd1 <__x86.get_pc_thunk.dx>
  100ae8:	81 c2 18 b5 00 00    	add    $0xb518,%edx
	if (unlikely(pmmap_slots_next_free == 128))
  100aee:	8b 82 3c d4 01 00    	mov    0x1d43c(%edx),%eax
  100af4:	3d 80 00 00 00       	cmp    $0x80,%eax
  100af9:	74 1b                	je     100b16 <pmmap_alloc_slot+0x33>
	return &pmmap_slots[pmmap_slots_next_free++];
  100afb:	8d 48 01             	lea    0x1(%eax),%ecx
  100afe:	89 8a 3c d4 01 00    	mov    %ecx,0x1d43c(%edx)
  100b04:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  100b07:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
  100b0e:	8d 84 02 40 d4 01 00 	lea    0x1d440(%edx,%eax,1),%eax
  100b15:	c3                   	ret    
		return NULL;
  100b16:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100b1b:	c3                   	ret    

00100b1c <pmmap_insert>:
{
  100b1c:	55                   	push   %ebp
  100b1d:	57                   	push   %edi
  100b1e:	56                   	push   %esi
  100b1f:	53                   	push   %ebx
  100b20:	83 ec 1c             	sub    $0x1c,%esp
  100b23:	e8 e7 f7 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  100b28:	81 c3 d8 b4 00 00    	add    $0xb4d8,%ebx
  100b2e:	89 c6                	mov    %eax,%esi
  100b30:	89 d5                	mov    %edx,%ebp
  100b32:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
	if ((free_slot = pmmap_alloc_slot()) == NULL)
  100b36:	e8 a8 ff ff ff       	call   100ae3 <pmmap_alloc_slot>
  100b3b:	89 c7                	mov    %eax,%edi
  100b3d:	85 c0                	test   %eax,%eax
  100b3f:	74 28                	je     100b69 <pmmap_insert+0x4d>
	free_slot->start = start;
  100b41:	89 37                	mov    %esi,(%edi)
	free_slot->end = end;
  100b43:	89 6f 04             	mov    %ebp,0x4(%edi)
	free_slot->type = type;
  100b46:	8b 44 24 0c          	mov    0xc(%esp),%eax
  100b4a:	89 47 08             	mov    %eax,0x8(%edi)
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b4d:	8b 8b 38 d4 01 00    	mov    0x1d438(%ebx),%ecx
  100b53:	89 c8                	mov    %ecx,%eax
	last_slot = NULL;
  100b55:	ba 00 00 00 00       	mov    $0x0,%edx
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b5a:	85 c0                	test   %eax,%eax
  100b5c:	74 28                	je     100b86 <pmmap_insert+0x6a>
		if (start < slot->start)
  100b5e:	39 30                	cmp    %esi,(%eax)
  100b60:	77 24                	ja     100b86 <pmmap_insert+0x6a>
		last_slot = slot;
  100b62:	89 c2                	mov    %eax,%edx
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100b64:	8b 40 0c             	mov    0xc(%eax),%eax
  100b67:	eb f1                	jmp    100b5a <pmmap_insert+0x3e>
		KERN_PANIC("More than 128 E820 entries.\n");
  100b69:	83 ec 04             	sub    $0x4,%esp
  100b6c:	8d 83 85 a6 ff ff    	lea    -0x597b(%ebx),%eax
  100b72:	50                   	push   %eax
  100b73:	6a 3e                	push   $0x3e
  100b75:	8d 83 74 a6 ff ff    	lea    -0x598c(%ebx),%eax
  100b7b:	50                   	push   %eax
  100b7c:	e8 f0 14 00 00       	call   102071 <debug_panic>
  100b81:	83 c4 10             	add    $0x10,%esp
  100b84:	eb bb                	jmp    100b41 <pmmap_insert+0x25>
	if (last_slot == NULL)
  100b86:	85 d2                	test   %edx,%edx
  100b88:	74 11                	je     100b9b <pmmap_insert+0x7f>
		SLIST_INSERT_AFTER(last_slot, free_slot, next);
  100b8a:	8b 42 0c             	mov    0xc(%edx),%eax
  100b8d:	89 47 0c             	mov    %eax,0xc(%edi)
  100b90:	89 7a 0c             	mov    %edi,0xc(%edx)
}
  100b93:	83 c4 1c             	add    $0x1c,%esp
  100b96:	5b                   	pop    %ebx
  100b97:	5e                   	pop    %esi
  100b98:	5f                   	pop    %edi
  100b99:	5d                   	pop    %ebp
  100b9a:	c3                   	ret    
		SLIST_INSERT_HEAD(&pmmap_list, free_slot, next);
  100b9b:	89 4f 0c             	mov    %ecx,0xc(%edi)
  100b9e:	89 bb 38 d4 01 00    	mov    %edi,0x1d438(%ebx)
  100ba4:	eb ed                	jmp    100b93 <pmmap_insert+0x77>

00100ba6 <pmmap_init>:

void
pmmap_init(uintptr_t mbi_addr)
{
  100ba6:	55                   	push   %ebp
  100ba7:	57                   	push   %edi
  100ba8:	56                   	push   %esi
  100ba9:	53                   	push   %ebx
  100baa:	83 ec 18             	sub    $0x18,%esp
  100bad:	e8 5d f7 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  100bb2:	81 c3 4e b4 00 00    	add    $0xb44e,%ebx
  100bb8:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
	KERN_INFO("\n");
  100bbc:	8d 83 f7 ab ff ff    	lea    -0x5409(%ebx),%eax
  100bc2:	50                   	push   %eax
  100bc3:	e8 4b 14 00 00       	call   102013 <debug_info>

	mboot_info_t *mbi = (mboot_info_t *) mbi_addr;
  100bc8:	89 fe                	mov    %edi,%esi
	mboot_mmap_t *p = (mboot_mmap_t *) mbi->mmap_addr;
  100bca:	8b 4f 30             	mov    0x30(%edi),%ecx

	SLIST_INIT(&pmmap_list);
  100bcd:	c7 83 38 d4 01 00 00 	movl   $0x0,0x1d438(%ebx)
  100bd4:	00 00 00 
	SLIST_INIT(&pmmap_sublist[PMMAP_USABLE]);
  100bd7:	c7 83 28 d4 01 00 00 	movl   $0x0,0x1d428(%ebx)
  100bde:	00 00 00 
	SLIST_INIT(&pmmap_sublist[PMMAP_RESV]);
  100be1:	c7 83 2c d4 01 00 00 	movl   $0x0,0x1d42c(%ebx)
  100be8:	00 00 00 
	SLIST_INIT(&pmmap_sublist[PMMAP_ACPI]);
  100beb:	c7 83 30 d4 01 00 00 	movl   $0x0,0x1d430(%ebx)
  100bf2:	00 00 00 
	SLIST_INIT(&pmmap_sublist[PMMAP_NVS]);
  100bf5:	c7 83 34 d4 01 00 00 	movl   $0x0,0x1d434(%ebx)
  100bfc:	00 00 00 

	/*
	 * Copy memory map information from multiboot information mbi to pmmap.
	 */
	while ((uintptr_t) p - (uintptr_t) mbi->mmap_addr < mbi->mmap_length) {
  100bff:	83 c4 10             	add    $0x10,%esp
  100c02:	eb 10                	jmp    100c14 <pmmap_init+0x6e>
		else
			start = p->base_addr_low;

		if (p->length_high != 0 ||
		    p->length_low >= 0xffffffff - start)
			end = 0xffffffff;
  100c04:	ba ff ff ff ff       	mov    $0xffffffff,%edx
		else
			end = start + p->length_low;

		type = p->type;
  100c09:	8b 49 14             	mov    0x14(%ecx),%ecx

		pmmap_insert(start, end, type);
  100c0c:	e8 0b ff ff ff       	call   100b1c <pmmap_insert>
    //pmmap_dump();

	next:
		p = (mboot_mmap_t *) (((uint32_t) p) + sizeof(mboot_mmap_t)/* p->size */);
  100c11:	8d 4f 18             	lea    0x18(%edi),%ecx
	while ((uintptr_t) p - (uintptr_t) mbi->mmap_addr < mbi->mmap_length) {
  100c14:	89 cf                	mov    %ecx,%edi
  100c16:	89 c8                	mov    %ecx,%eax
  100c18:	2b 46 30             	sub    0x30(%esi),%eax
  100c1b:	3b 46 2c             	cmp    0x2c(%esi),%eax
  100c1e:	73 25                	jae    100c45 <pmmap_init+0x9f>
		if (p->base_addr_high != 0)	/* ignore address above 4G */
  100c20:	83 79 08 00          	cmpl   $0x0,0x8(%ecx)
  100c24:	75 eb                	jne    100c11 <pmmap_init+0x6b>
			start = p->base_addr_low;
  100c26:	8b 41 04             	mov    0x4(%ecx),%eax
		if (p->length_high != 0 ||
  100c29:	83 79 10 00          	cmpl   $0x0,0x10(%ecx)
  100c2d:	75 d5                	jne    100c04 <pmmap_init+0x5e>
		    p->length_low >= 0xffffffff - start)
  100c2f:	8b 51 0c             	mov    0xc(%ecx),%edx
  100c32:	89 c5                	mov    %eax,%ebp
  100c34:	f7 d5                	not    %ebp
		if (p->length_high != 0 ||
  100c36:	39 ea                	cmp    %ebp,%edx
  100c38:	73 04                	jae    100c3e <pmmap_init+0x98>
			end = start + p->length_low;
  100c3a:	01 c2                	add    %eax,%edx
  100c3c:	eb cb                	jmp    100c09 <pmmap_init+0x63>
			end = 0xffffffff;
  100c3e:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  100c43:	eb c4                	jmp    100c09 <pmmap_init+0x63>
	}

	/* merge overlapped memory regions */
	pmmap_merge();
  100c45:	e8 82 fd ff ff       	call   1009cc <pmmap_merge>
	pmmap_dump();
  100c4a:	e8 f8 fc ff ff       	call   100947 <pmmap_dump>

	/* count the number of pmmap entries */
	struct pmmap *slot;
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100c4f:	8b 83 38 d4 01 00    	mov    0x1d438(%ebx),%eax
  100c55:	eb 0a                	jmp    100c61 <pmmap_init+0xbb>
		pmmap_nentries++;
  100c57:	83 83 20 d4 01 00 01 	addl   $0x1,0x1d420(%ebx)
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100c5e:	8b 40 0c             	mov    0xc(%eax),%eax
  100c61:	85 c0                	test   %eax,%eax
  100c63:	75 f2                	jne    100c57 <pmmap_init+0xb1>
	}

	/* Calculate the maximum page number */
	mem_npages = rounddown(max_usable_memory, PAGESIZE) / PAGESIZE;
  100c65:	83 ec 08             	sub    $0x8,%esp
  100c68:	68 00 10 00 00       	push   $0x1000
  100c6d:	ff b3 24 d4 01 00    	pushl  0x1d424(%ebx)
  100c73:	e8 f7 1c 00 00       	call   10296f <rounddown>
}
  100c78:	83 c4 1c             	add    $0x1c,%esp
  100c7b:	5b                   	pop    %ebx
  100c7c:	5e                   	pop    %esi
  100c7d:	5f                   	pop    %edi
  100c7e:	5d                   	pop    %ebp
  100c7f:	c3                   	ret    

00100c80 <get_size>:

int
get_size(void)
{
  100c80:	e8 48 01 00 00       	call   100dcd <__x86.get_pc_thunk.ax>
  100c85:	05 7b b3 00 00       	add    $0xb37b,%eax
	return pmmap_nentries;
  100c8a:	8b 80 20 d4 01 00    	mov    0x1d420(%eax),%eax
}
  100c90:	c3                   	ret    

00100c91 <get_mms>:

uint32_t
get_mms(int idx)
{
  100c91:	53                   	push   %ebx
  100c92:	e8 78 f6 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  100c97:	81 c3 69 b3 00 00    	add    $0xb369,%ebx
  100c9d:	8b 4c 24 08          	mov    0x8(%esp),%ecx
	int i = 0;
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100ca1:	8b 83 38 d4 01 00    	mov    0x1d438(%ebx),%eax
	int i = 0;
  100ca7:	ba 00 00 00 00       	mov    $0x0,%edx
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100cac:	85 c0                	test   %eax,%eax
  100cae:	74 0c                	je     100cbc <get_mms+0x2b>
		if (i == idx)
  100cb0:	39 ca                	cmp    %ecx,%edx
  100cb2:	74 08                	je     100cbc <get_mms+0x2b>
			break;
		i++;
  100cb4:	83 c2 01             	add    $0x1,%edx
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100cb7:	8b 40 0c             	mov    0xc(%eax),%eax
  100cba:	eb f0                	jmp    100cac <get_mms+0x1b>
	}

	if (slot == NULL || i == pmmap_nentries)
  100cbc:	85 c0                	test   %eax,%eax
  100cbe:	74 0c                	je     100ccc <get_mms+0x3b>
  100cc0:	39 93 20 d4 01 00    	cmp    %edx,0x1d420(%ebx)
  100cc6:	74 0b                	je     100cd3 <get_mms+0x42>
		return 0;

	return slot->start;
  100cc8:	8b 00                	mov    (%eax),%eax
}
  100cca:	5b                   	pop    %ebx
  100ccb:	c3                   	ret    
		return 0;
  100ccc:	b8 00 00 00 00       	mov    $0x0,%eax
  100cd1:	eb f7                	jmp    100cca <get_mms+0x39>
  100cd3:	b8 00 00 00 00       	mov    $0x0,%eax
  100cd8:	eb f0                	jmp    100cca <get_mms+0x39>

00100cda <get_mml>:

uint32_t
get_mml(int idx)
{
  100cda:	53                   	push   %ebx
  100cdb:	e8 2f f6 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  100ce0:	81 c3 20 b3 00 00    	add    $0xb320,%ebx
  100ce6:	8b 4c 24 08          	mov    0x8(%esp),%ecx
	int i = 0;
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100cea:	8b 93 38 d4 01 00    	mov    0x1d438(%ebx),%edx
	int i = 0;
  100cf0:	b8 00 00 00 00       	mov    $0x0,%eax
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100cf5:	85 d2                	test   %edx,%edx
  100cf7:	74 0c                	je     100d05 <get_mml+0x2b>
		if (i == idx)
  100cf9:	39 c8                	cmp    %ecx,%eax
  100cfb:	74 08                	je     100d05 <get_mml+0x2b>
			break;
		i++;
  100cfd:	83 c0 01             	add    $0x1,%eax
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100d00:	8b 52 0c             	mov    0xc(%edx),%edx
  100d03:	eb f0                	jmp    100cf5 <get_mml+0x1b>
	}

	if (slot == NULL || i == pmmap_nentries)
  100d05:	85 d2                	test   %edx,%edx
  100d07:	74 0f                	je     100d18 <get_mml+0x3e>
  100d09:	39 83 20 d4 01 00    	cmp    %eax,0x1d420(%ebx)
  100d0f:	74 0e                	je     100d1f <get_mml+0x45>
		return 0;

	return slot->end - slot->start;
  100d11:	8b 42 04             	mov    0x4(%edx),%eax
  100d14:	2b 02                	sub    (%edx),%eax
}
  100d16:	5b                   	pop    %ebx
  100d17:	c3                   	ret    
		return 0;
  100d18:	b8 00 00 00 00       	mov    $0x0,%eax
  100d1d:	eb f7                	jmp    100d16 <get_mml+0x3c>
  100d1f:	b8 00 00 00 00       	mov    $0x0,%eax
  100d24:	eb f0                	jmp    100d16 <get_mml+0x3c>

00100d26 <is_usable>:

int
is_usable(int idx)
{
  100d26:	53                   	push   %ebx
  100d27:	e8 e3 f5 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  100d2c:	81 c3 d4 b2 00 00    	add    $0xb2d4,%ebx
  100d32:	8b 4c 24 08          	mov    0x8(%esp),%ecx
	int i = 0;
	struct pmmap *slot = NULL;

	SLIST_FOREACH(slot, &pmmap_list, next) {
  100d36:	8b 83 38 d4 01 00    	mov    0x1d438(%ebx),%eax
	int i = 0;
  100d3c:	ba 00 00 00 00       	mov    $0x0,%edx
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100d41:	85 c0                	test   %eax,%eax
  100d43:	74 0c                	je     100d51 <is_usable+0x2b>
		if (i == idx)
  100d45:	39 ca                	cmp    %ecx,%edx
  100d47:	74 08                	je     100d51 <is_usable+0x2b>
			break;
		i++;
  100d49:	83 c2 01             	add    $0x1,%edx
	SLIST_FOREACH(slot, &pmmap_list, next) {
  100d4c:	8b 40 0c             	mov    0xc(%eax),%eax
  100d4f:	eb f0                	jmp    100d41 <is_usable+0x1b>
	}

	if (slot == NULL || i == pmmap_nentries)
  100d51:	85 c0                	test   %eax,%eax
  100d53:	74 14                	je     100d69 <is_usable+0x43>
  100d55:	39 93 20 d4 01 00    	cmp    %edx,0x1d420(%ebx)
  100d5b:	74 13                	je     100d70 <is_usable+0x4a>
		return 0;

	return slot->type == MEM_RAM;
  100d5d:	83 78 08 01          	cmpl   $0x1,0x8(%eax)
  100d61:	0f 94 c0             	sete   %al
  100d64:	0f b6 c0             	movzbl %al,%eax
}
  100d67:	5b                   	pop    %ebx
  100d68:	c3                   	ret    
		return 0;
  100d69:	b8 00 00 00 00       	mov    $0x0,%eax
  100d6e:	eb f7                	jmp    100d67 <is_usable+0x41>
  100d70:	b8 00 00 00 00       	mov    $0x0,%eax
  100d75:	eb f0                	jmp    100d67 <is_usable+0x41>

00100d77 <set_cr3>:

void
set_cr3(char **pdir)
{
  100d77:	53                   	push   %ebx
  100d78:	83 ec 14             	sub    $0x14,%esp
  100d7b:	e8 8f f5 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  100d80:	81 c3 80 b2 00 00    	add    $0xb280,%ebx
	lcr3((uint32_t) pdir);
  100d86:	ff 74 24 1c          	pushl  0x1c(%esp)
  100d8a:	e8 af 1c 00 00       	call   102a3e <lcr3>
}
  100d8f:	83 c4 18             	add    $0x18,%esp
  100d92:	5b                   	pop    %ebx
  100d93:	c3                   	ret    

00100d94 <enable_paging>:

void
enable_paging(void)
{
  100d94:	53                   	push   %ebx
  100d95:	83 ec 08             	sub    $0x8,%esp
  100d98:	e8 72 f5 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  100d9d:	81 c3 63 b2 00 00    	add    $0xb263,%ebx
	/* enable global pages (Sec 4.10.2.4, Intel ASDM Vol3) */
	uint32_t cr4 = rcr4();
  100da3:	e8 a6 1c 00 00       	call   102a4e <rcr4>
	cr4 |= CR4_PGE;
  100da8:	0c 80                	or     $0x80,%al
	lcr4(cr4);
  100daa:	83 ec 0c             	sub    $0xc,%esp
  100dad:	50                   	push   %eax
  100dae:	e8 93 1c 00 00       	call   102a46 <lcr4>

	/* turn on paging */
	uint32_t cr0 = rcr0();
  100db3:	e8 7e 1c 00 00       	call   102a36 <rcr0>
  100db8:	83 e0 f3             	and    $0xfffffff3,%eax
	cr0 |= CR0_PE | CR0_PG | CR0_AM | CR0_WP | CR0_NE | CR0_MP;
	cr0 &= ~(CR0_EM | CR0_TS);
  100dbb:	0d 23 00 05 80       	or     $0x80050023,%eax
	lcr0(cr0);
  100dc0:	89 04 24             	mov    %eax,(%esp)
  100dc3:	e8 66 1c 00 00       	call   102a2e <lcr0>
}
  100dc8:	83 c4 18             	add    $0x18,%esp
  100dcb:	5b                   	pop    %ebx
  100dcc:	c3                   	ret    

00100dcd <__x86.get_pc_thunk.ax>:
  100dcd:	8b 04 24             	mov    (%esp),%eax
  100dd0:	c3                   	ret    

00100dd1 <__x86.get_pc_thunk.dx>:
  100dd1:	8b 14 24             	mov    (%esp),%edx
  100dd4:	c3                   	ret    

00100dd5 <intr_init_idt>:
pseudodesc_t idt_pd =
	{ .pd_lim = sizeof(idt) - 1, .pd_base = (uint32_t) idt };

static void
intr_init_idt(void)
{
  100dd5:	55                   	push   %ebp
  100dd6:	57                   	push   %edi
  100dd7:	56                   	push   %esi
  100dd8:	53                   	push   %ebx
  100dd9:	e8 3d f7 ff ff       	call   10051b <__x86.get_pc_thunk.si>
  100dde:	81 c6 22 b2 00 00    	add    $0xb222,%esi

	/* check that T_IRQ0 is a multiple of 8 */
	KERN_ASSERT((T_IRQ0 & 7) == 0);

	/* install a default handler */
	for (i = 0; i < sizeof(idt)/sizeof(idt[0]); i++)
  100de4:	b8 00 00 00 00       	mov    $0x0,%eax
  100de9:	eb 3e                	jmp    100e29 <intr_init_idt+0x54>
		SETGATE(idt[i], 0, CPU_GDT_KCODE, &Xdefault, 0);
  100deb:	c7 c1 c0 a6 96 00    	mov    $0x96a6c0,%ecx
  100df1:	c7 c5 1e 1e 10 00    	mov    $0x101e1e,%ebp
  100df7:	66 89 2c c1          	mov    %bp,(%ecx,%eax,8)
  100dfb:	66 c7 44 c1 02 08 00 	movw   $0x8,0x2(%ecx,%eax,8)
  100e02:	c6 44 c1 04 00       	movb   $0x0,0x4(%ecx,%eax,8)
  100e07:	0f b6 54 c1 05       	movzbl 0x5(%ecx,%eax,8),%edx
  100e0c:	83 e2 f0             	and    $0xfffffff0,%edx
  100e0f:	83 ca 0e             	or     $0xe,%edx
  100e12:	83 e2 8f             	and    $0xffffff8f,%edx
  100e15:	83 ca 80             	or     $0xffffff80,%edx
  100e18:	88 54 c1 05          	mov    %dl,0x5(%ecx,%eax,8)
  100e1c:	89 eb                	mov    %ebp,%ebx
  100e1e:	c1 eb 10             	shr    $0x10,%ebx
  100e21:	66 89 5c c1 06       	mov    %bx,0x6(%ecx,%eax,8)
	for (i = 0; i < sizeof(idt)/sizeof(idt[0]); i++)
  100e26:	83 c0 01             	add    $0x1,%eax
  100e29:	3d ff 00 00 00       	cmp    $0xff,%eax
  100e2e:	76 bb                	jbe    100deb <intr_init_idt+0x16>

	SETGATE(idt[T_DIVIDE],            0, CPU_GDT_KCODE, &Xdivide,       0);
  100e30:	c7 c0 c0 a6 96 00    	mov    $0x96a6c0,%eax
  100e36:	c7 c1 10 1d 10 00    	mov    $0x101d10,%ecx
  100e3c:	66 89 08             	mov    %cx,(%eax)
  100e3f:	66 c7 40 02 08 00    	movw   $0x8,0x2(%eax)
  100e45:	c6 40 04 00          	movb   $0x0,0x4(%eax)
  100e49:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  100e4d:	83 e2 f0             	and    $0xfffffff0,%edx
  100e50:	83 ca 0e             	or     $0xe,%edx
  100e53:	83 e2 8f             	and    $0xffffff8f,%edx
  100e56:	83 ca 80             	or     $0xffffff80,%edx
  100e59:	88 50 05             	mov    %dl,0x5(%eax)
  100e5c:	c1 e9 10             	shr    $0x10,%ecx
  100e5f:	66 89 48 06          	mov    %cx,0x6(%eax)
	SETGATE(idt[T_DEBUG],             0, CPU_GDT_KCODE, &Xdebug,        0);
  100e63:	c7 c1 1a 1d 10 00    	mov    $0x101d1a,%ecx
  100e69:	66 89 48 08          	mov    %cx,0x8(%eax)
  100e6d:	66 c7 40 0a 08 00    	movw   $0x8,0xa(%eax)
  100e73:	c6 40 0c 00          	movb   $0x0,0xc(%eax)
  100e77:	0f b6 50 0d          	movzbl 0xd(%eax),%edx
  100e7b:	83 e2 f0             	and    $0xfffffff0,%edx
  100e7e:	83 ca 0e             	or     $0xe,%edx
  100e81:	83 e2 8f             	and    $0xffffff8f,%edx
  100e84:	83 ca 80             	or     $0xffffff80,%edx
  100e87:	88 50 0d             	mov    %dl,0xd(%eax)
  100e8a:	c1 e9 10             	shr    $0x10,%ecx
  100e8d:	66 89 48 0e          	mov    %cx,0xe(%eax)
	SETGATE(idt[T_NMI],               0, CPU_GDT_KCODE, &Xnmi,          0);
  100e91:	c7 c1 24 1d 10 00    	mov    $0x101d24,%ecx
  100e97:	66 89 48 10          	mov    %cx,0x10(%eax)
  100e9b:	66 c7 40 12 08 00    	movw   $0x8,0x12(%eax)
  100ea1:	c6 40 14 00          	movb   $0x0,0x14(%eax)
  100ea5:	0f b6 50 15          	movzbl 0x15(%eax),%edx
  100ea9:	83 e2 f0             	and    $0xfffffff0,%edx
  100eac:	83 ca 0e             	or     $0xe,%edx
  100eaf:	83 e2 8f             	and    $0xffffff8f,%edx
  100eb2:	83 ca 80             	or     $0xffffff80,%edx
  100eb5:	88 50 15             	mov    %dl,0x15(%eax)
  100eb8:	c1 e9 10             	shr    $0x10,%ecx
  100ebb:	66 89 48 16          	mov    %cx,0x16(%eax)
	SETGATE(idt[T_BRKPT],             0, CPU_GDT_KCODE, &Xbrkpt,        3);
  100ebf:	c7 c1 2e 1d 10 00    	mov    $0x101d2e,%ecx
  100ec5:	66 89 48 18          	mov    %cx,0x18(%eax)
  100ec9:	66 c7 40 1a 08 00    	movw   $0x8,0x1a(%eax)
  100ecf:	c6 40 1c 00          	movb   $0x0,0x1c(%eax)
  100ed3:	0f b6 50 1d          	movzbl 0x1d(%eax),%edx
  100ed7:	83 e2 f0             	and    $0xfffffff0,%edx
  100eda:	83 ca 0e             	or     $0xe,%edx
  100edd:	83 e2 ef             	and    $0xffffffef,%edx
  100ee0:	83 ca e0             	or     $0xffffffe0,%edx
  100ee3:	88 50 1d             	mov    %dl,0x1d(%eax)
  100ee6:	c1 e9 10             	shr    $0x10,%ecx
  100ee9:	66 89 48 1e          	mov    %cx,0x1e(%eax)
	SETGATE(idt[T_OFLOW],             0, CPU_GDT_KCODE, &Xoflow,        3);
  100eed:	c7 c1 38 1d 10 00    	mov    $0x101d38,%ecx
  100ef3:	66 89 48 20          	mov    %cx,0x20(%eax)
  100ef7:	66 c7 40 22 08 00    	movw   $0x8,0x22(%eax)
  100efd:	c6 40 24 00          	movb   $0x0,0x24(%eax)
  100f01:	0f b6 50 25          	movzbl 0x25(%eax),%edx
  100f05:	83 e2 f0             	and    $0xfffffff0,%edx
  100f08:	83 ca 0e             	or     $0xe,%edx
  100f0b:	83 e2 ef             	and    $0xffffffef,%edx
  100f0e:	83 ca e0             	or     $0xffffffe0,%edx
  100f11:	88 50 25             	mov    %dl,0x25(%eax)
  100f14:	c1 e9 10             	shr    $0x10,%ecx
  100f17:	66 89 48 26          	mov    %cx,0x26(%eax)
	SETGATE(idt[T_BOUND],             0, CPU_GDT_KCODE, &Xbound,        0);
  100f1b:	c7 c1 42 1d 10 00    	mov    $0x101d42,%ecx
  100f21:	66 89 48 28          	mov    %cx,0x28(%eax)
  100f25:	66 c7 40 2a 08 00    	movw   $0x8,0x2a(%eax)
  100f2b:	c6 40 2c 00          	movb   $0x0,0x2c(%eax)
  100f2f:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  100f33:	83 e2 f0             	and    $0xfffffff0,%edx
  100f36:	83 ca 0e             	or     $0xe,%edx
  100f39:	83 e2 8f             	and    $0xffffff8f,%edx
  100f3c:	83 ca 80             	or     $0xffffff80,%edx
  100f3f:	88 50 2d             	mov    %dl,0x2d(%eax)
  100f42:	c1 e9 10             	shr    $0x10,%ecx
  100f45:	66 89 48 2e          	mov    %cx,0x2e(%eax)
	SETGATE(idt[T_ILLOP],             0, CPU_GDT_KCODE, &Xillop,        0);
  100f49:	c7 c1 4c 1d 10 00    	mov    $0x101d4c,%ecx
  100f4f:	66 89 48 30          	mov    %cx,0x30(%eax)
  100f53:	66 c7 40 32 08 00    	movw   $0x8,0x32(%eax)
  100f59:	c6 40 34 00          	movb   $0x0,0x34(%eax)
  100f5d:	0f b6 50 35          	movzbl 0x35(%eax),%edx
  100f61:	83 e2 f0             	and    $0xfffffff0,%edx
  100f64:	83 ca 0e             	or     $0xe,%edx
  100f67:	83 e2 8f             	and    $0xffffff8f,%edx
  100f6a:	83 ca 80             	or     $0xffffff80,%edx
  100f6d:	88 50 35             	mov    %dl,0x35(%eax)
  100f70:	c1 e9 10             	shr    $0x10,%ecx
  100f73:	66 89 48 36          	mov    %cx,0x36(%eax)
	SETGATE(idt[T_DEVICE],            0, CPU_GDT_KCODE, &Xdevice,       0);
  100f77:	c7 c1 56 1d 10 00    	mov    $0x101d56,%ecx
  100f7d:	66 89 48 38          	mov    %cx,0x38(%eax)
  100f81:	66 c7 40 3a 08 00    	movw   $0x8,0x3a(%eax)
  100f87:	c6 40 3c 00          	movb   $0x0,0x3c(%eax)
  100f8b:	0f b6 50 3d          	movzbl 0x3d(%eax),%edx
  100f8f:	83 e2 f0             	and    $0xfffffff0,%edx
  100f92:	83 ca 0e             	or     $0xe,%edx
  100f95:	83 e2 8f             	and    $0xffffff8f,%edx
  100f98:	83 ca 80             	or     $0xffffff80,%edx
  100f9b:	88 50 3d             	mov    %dl,0x3d(%eax)
  100f9e:	c1 e9 10             	shr    $0x10,%ecx
  100fa1:	66 89 48 3e          	mov    %cx,0x3e(%eax)
	SETGATE(idt[T_DBLFLT],            0, CPU_GDT_KCODE, &Xdblflt,       0);
  100fa5:	c7 c1 60 1d 10 00    	mov    $0x101d60,%ecx
  100fab:	66 89 48 40          	mov    %cx,0x40(%eax)
  100faf:	66 c7 40 42 08 00    	movw   $0x8,0x42(%eax)
  100fb5:	c6 40 44 00          	movb   $0x0,0x44(%eax)
  100fb9:	0f b6 50 45          	movzbl 0x45(%eax),%edx
  100fbd:	83 e2 f0             	and    $0xfffffff0,%edx
  100fc0:	83 ca 0e             	or     $0xe,%edx
  100fc3:	83 e2 8f             	and    $0xffffff8f,%edx
  100fc6:	83 ca 80             	or     $0xffffff80,%edx
  100fc9:	88 50 45             	mov    %dl,0x45(%eax)
  100fcc:	c1 e9 10             	shr    $0x10,%ecx
  100fcf:	66 89 48 46          	mov    %cx,0x46(%eax)
	SETGATE(idt[T_TSS],               0, CPU_GDT_KCODE, &Xtss,          0);
  100fd3:	c7 c1 72 1d 10 00    	mov    $0x101d72,%ecx
  100fd9:	66 89 48 50          	mov    %cx,0x50(%eax)
  100fdd:	66 c7 40 52 08 00    	movw   $0x8,0x52(%eax)
  100fe3:	c6 40 54 00          	movb   $0x0,0x54(%eax)
  100fe7:	0f b6 50 55          	movzbl 0x55(%eax),%edx
  100feb:	83 e2 f0             	and    $0xfffffff0,%edx
  100fee:	83 ca 0e             	or     $0xe,%edx
  100ff1:	83 e2 8f             	and    $0xffffff8f,%edx
  100ff4:	83 ca 80             	or     $0xffffff80,%edx
  100ff7:	88 50 55             	mov    %dl,0x55(%eax)
  100ffa:	c1 e9 10             	shr    $0x10,%ecx
  100ffd:	66 89 48 56          	mov    %cx,0x56(%eax)
	SETGATE(idt[T_SEGNP],             0, CPU_GDT_KCODE, &Xsegnp,        0);
  101001:	c7 c1 7a 1d 10 00    	mov    $0x101d7a,%ecx
  101007:	66 89 48 58          	mov    %cx,0x58(%eax)
  10100b:	66 c7 40 5a 08 00    	movw   $0x8,0x5a(%eax)
  101011:	c6 40 5c 00          	movb   $0x0,0x5c(%eax)
  101015:	0f b6 50 5d          	movzbl 0x5d(%eax),%edx
  101019:	83 e2 f0             	and    $0xfffffff0,%edx
  10101c:	83 ca 0e             	or     $0xe,%edx
  10101f:	83 e2 8f             	and    $0xffffff8f,%edx
  101022:	83 ca 80             	or     $0xffffff80,%edx
  101025:	88 50 5d             	mov    %dl,0x5d(%eax)
  101028:	c1 e9 10             	shr    $0x10,%ecx
  10102b:	66 89 48 5e          	mov    %cx,0x5e(%eax)
	SETGATE(idt[T_STACK],             0, CPU_GDT_KCODE, &Xstack,        0);
  10102f:	c7 c1 82 1d 10 00    	mov    $0x101d82,%ecx
  101035:	66 89 48 60          	mov    %cx,0x60(%eax)
  101039:	66 c7 40 62 08 00    	movw   $0x8,0x62(%eax)
  10103f:	c6 40 64 00          	movb   $0x0,0x64(%eax)
  101043:	0f b6 50 65          	movzbl 0x65(%eax),%edx
  101047:	83 e2 f0             	and    $0xfffffff0,%edx
  10104a:	83 ca 0e             	or     $0xe,%edx
  10104d:	83 e2 8f             	and    $0xffffff8f,%edx
  101050:	83 ca 80             	or     $0xffffff80,%edx
  101053:	88 50 65             	mov    %dl,0x65(%eax)
  101056:	c1 e9 10             	shr    $0x10,%ecx
  101059:	66 89 48 66          	mov    %cx,0x66(%eax)
	SETGATE(idt[T_GPFLT],             0, CPU_GDT_KCODE, &Xgpflt,        0);
  10105d:	c7 c1 8a 1d 10 00    	mov    $0x101d8a,%ecx
  101063:	66 89 48 68          	mov    %cx,0x68(%eax)
  101067:	66 c7 40 6a 08 00    	movw   $0x8,0x6a(%eax)
  10106d:	c6 40 6c 00          	movb   $0x0,0x6c(%eax)
  101071:	0f b6 50 6d          	movzbl 0x6d(%eax),%edx
  101075:	83 e2 f0             	and    $0xfffffff0,%edx
  101078:	83 ca 0e             	or     $0xe,%edx
  10107b:	83 e2 8f             	and    $0xffffff8f,%edx
  10107e:	83 ca 80             	or     $0xffffff80,%edx
  101081:	88 50 6d             	mov    %dl,0x6d(%eax)
  101084:	c1 e9 10             	shr    $0x10,%ecx
  101087:	66 89 48 6e          	mov    %cx,0x6e(%eax)
	SETGATE(idt[T_PGFLT],             0, CPU_GDT_KCODE, &Xpgflt,        0);
  10108b:	c7 c1 92 1d 10 00    	mov    $0x101d92,%ecx
  101091:	66 89 48 70          	mov    %cx,0x70(%eax)
  101095:	66 c7 40 72 08 00    	movw   $0x8,0x72(%eax)
  10109b:	c6 40 74 00          	movb   $0x0,0x74(%eax)
  10109f:	0f b6 50 75          	movzbl 0x75(%eax),%edx
  1010a3:	83 e2 f0             	and    $0xfffffff0,%edx
  1010a6:	83 ca 0e             	or     $0xe,%edx
  1010a9:	83 e2 8f             	and    $0xffffff8f,%edx
  1010ac:	83 ca 80             	or     $0xffffff80,%edx
  1010af:	88 50 75             	mov    %dl,0x75(%eax)
  1010b2:	c1 e9 10             	shr    $0x10,%ecx
  1010b5:	66 89 48 76          	mov    %cx,0x76(%eax)
	SETGATE(idt[T_FPERR],             0, CPU_GDT_KCODE, &Xfperr,        0);
  1010b9:	c7 c1 a4 1d 10 00    	mov    $0x101da4,%ecx
  1010bf:	66 89 88 80 00 00 00 	mov    %cx,0x80(%eax)
  1010c6:	66 c7 80 82 00 00 00 	movw   $0x8,0x82(%eax)
  1010cd:	08 00 
  1010cf:	c6 80 84 00 00 00 00 	movb   $0x0,0x84(%eax)
  1010d6:	0f b6 90 85 00 00 00 	movzbl 0x85(%eax),%edx
  1010dd:	83 e2 f0             	and    $0xfffffff0,%edx
  1010e0:	83 ca 0e             	or     $0xe,%edx
  1010e3:	83 e2 8f             	and    $0xffffff8f,%edx
  1010e6:	83 ca 80             	or     $0xffffff80,%edx
  1010e9:	88 90 85 00 00 00    	mov    %dl,0x85(%eax)
  1010ef:	c1 e9 10             	shr    $0x10,%ecx
  1010f2:	66 89 88 86 00 00 00 	mov    %cx,0x86(%eax)
	SETGATE(idt[T_ALIGN],             0, CPU_GDT_KCODE, &Xalign,        0);
  1010f9:	c7 c1 ae 1d 10 00    	mov    $0x101dae,%ecx
  1010ff:	66 89 88 88 00 00 00 	mov    %cx,0x88(%eax)
  101106:	66 c7 80 8a 00 00 00 	movw   $0x8,0x8a(%eax)
  10110d:	08 00 
  10110f:	c6 80 8c 00 00 00 00 	movb   $0x0,0x8c(%eax)
  101116:	0f b6 90 8d 00 00 00 	movzbl 0x8d(%eax),%edx
  10111d:	83 e2 f0             	and    $0xfffffff0,%edx
  101120:	83 ca 0e             	or     $0xe,%edx
  101123:	83 e2 8f             	and    $0xffffff8f,%edx
  101126:	83 ca 80             	or     $0xffffff80,%edx
  101129:	88 90 8d 00 00 00    	mov    %dl,0x8d(%eax)
  10112f:	c1 e9 10             	shr    $0x10,%ecx
  101132:	66 89 88 8e 00 00 00 	mov    %cx,0x8e(%eax)
	SETGATE(idt[T_MCHK],              0, CPU_GDT_KCODE, &Xmchk,         0);
  101139:	c7 c1 b2 1d 10 00    	mov    $0x101db2,%ecx
  10113f:	66 89 88 90 00 00 00 	mov    %cx,0x90(%eax)
  101146:	66 c7 80 92 00 00 00 	movw   $0x8,0x92(%eax)
  10114d:	08 00 
  10114f:	c6 80 94 00 00 00 00 	movb   $0x0,0x94(%eax)
  101156:	0f b6 90 95 00 00 00 	movzbl 0x95(%eax),%edx
  10115d:	83 e2 f0             	and    $0xfffffff0,%edx
  101160:	83 ca 0e             	or     $0xe,%edx
  101163:	83 e2 8f             	and    $0xffffff8f,%edx
  101166:	83 ca 80             	or     $0xffffff80,%edx
  101169:	88 90 95 00 00 00    	mov    %dl,0x95(%eax)
  10116f:	c1 e9 10             	shr    $0x10,%ecx
  101172:	66 89 88 96 00 00 00 	mov    %cx,0x96(%eax)

	SETGATE(idt[T_IRQ0+IRQ_TIMER],    0, CPU_GDT_KCODE, &Xirq_timer,    0);
  101179:	c7 c1 b8 1d 10 00    	mov    $0x101db8,%ecx
  10117f:	66 89 88 00 01 00 00 	mov    %cx,0x100(%eax)
  101186:	66 c7 80 02 01 00 00 	movw   $0x8,0x102(%eax)
  10118d:	08 00 
  10118f:	c6 80 04 01 00 00 00 	movb   $0x0,0x104(%eax)
  101196:	0f b6 90 05 01 00 00 	movzbl 0x105(%eax),%edx
  10119d:	83 e2 f0             	and    $0xfffffff0,%edx
  1011a0:	83 ca 0e             	or     $0xe,%edx
  1011a3:	83 e2 8f             	and    $0xffffff8f,%edx
  1011a6:	83 ca 80             	or     $0xffffff80,%edx
  1011a9:	88 90 05 01 00 00    	mov    %dl,0x105(%eax)
  1011af:	c1 e9 10             	shr    $0x10,%ecx
  1011b2:	66 89 88 06 01 00 00 	mov    %cx,0x106(%eax)
	SETGATE(idt[T_IRQ0+IRQ_KBD],      0, CPU_GDT_KCODE, &Xirq_kbd,      0);
  1011b9:	c7 c1 be 1d 10 00    	mov    $0x101dbe,%ecx
  1011bf:	66 89 88 08 01 00 00 	mov    %cx,0x108(%eax)
  1011c6:	66 c7 80 0a 01 00 00 	movw   $0x8,0x10a(%eax)
  1011cd:	08 00 
  1011cf:	c6 80 0c 01 00 00 00 	movb   $0x0,0x10c(%eax)
  1011d6:	0f b6 90 0d 01 00 00 	movzbl 0x10d(%eax),%edx
  1011dd:	83 e2 f0             	and    $0xfffffff0,%edx
  1011e0:	83 ca 0e             	or     $0xe,%edx
  1011e3:	83 e2 8f             	and    $0xffffff8f,%edx
  1011e6:	83 ca 80             	or     $0xffffff80,%edx
  1011e9:	88 90 0d 01 00 00    	mov    %dl,0x10d(%eax)
  1011ef:	c1 e9 10             	shr    $0x10,%ecx
  1011f2:	66 89 88 0e 01 00 00 	mov    %cx,0x10e(%eax)
	SETGATE(idt[T_IRQ0+IRQ_SLAVE],    0, CPU_GDT_KCODE, &Xirq_slave,    0);
  1011f9:	c7 c1 c4 1d 10 00    	mov    $0x101dc4,%ecx
  1011ff:	66 89 88 10 01 00 00 	mov    %cx,0x110(%eax)
  101206:	66 c7 80 12 01 00 00 	movw   $0x8,0x112(%eax)
  10120d:	08 00 
  10120f:	c6 80 14 01 00 00 00 	movb   $0x0,0x114(%eax)
  101216:	0f b6 90 15 01 00 00 	movzbl 0x115(%eax),%edx
  10121d:	83 e2 f0             	and    $0xfffffff0,%edx
  101220:	83 ca 0e             	or     $0xe,%edx
  101223:	83 e2 8f             	and    $0xffffff8f,%edx
  101226:	83 ca 80             	or     $0xffffff80,%edx
  101229:	88 90 15 01 00 00    	mov    %dl,0x115(%eax)
  10122f:	c1 e9 10             	shr    $0x10,%ecx
  101232:	66 89 88 16 01 00 00 	mov    %cx,0x116(%eax)
	SETGATE(idt[T_IRQ0+IRQ_SERIAL24], 0, CPU_GDT_KCODE, &Xirq_serial2,  0);
  101239:	c7 c1 ca 1d 10 00    	mov    $0x101dca,%ecx
  10123f:	66 89 88 18 01 00 00 	mov    %cx,0x118(%eax)
  101246:	66 c7 80 1a 01 00 00 	movw   $0x8,0x11a(%eax)
  10124d:	08 00 
  10124f:	c6 80 1c 01 00 00 00 	movb   $0x0,0x11c(%eax)
  101256:	0f b6 90 1d 01 00 00 	movzbl 0x11d(%eax),%edx
  10125d:	83 e2 f0             	and    $0xfffffff0,%edx
  101260:	83 ca 0e             	or     $0xe,%edx
  101263:	83 e2 8f             	and    $0xffffff8f,%edx
  101266:	83 ca 80             	or     $0xffffff80,%edx
  101269:	88 90 1d 01 00 00    	mov    %dl,0x11d(%eax)
  10126f:	c1 e9 10             	shr    $0x10,%ecx
  101272:	66 89 88 1e 01 00 00 	mov    %cx,0x11e(%eax)
	SETGATE(idt[T_IRQ0+IRQ_SERIAL13], 0, CPU_GDT_KCODE, &Xirq_serial1,  0);
  101279:	c7 c1 d0 1d 10 00    	mov    $0x101dd0,%ecx
  10127f:	66 89 88 20 01 00 00 	mov    %cx,0x120(%eax)
  101286:	66 c7 80 22 01 00 00 	movw   $0x8,0x122(%eax)
  10128d:	08 00 
  10128f:	c6 80 24 01 00 00 00 	movb   $0x0,0x124(%eax)
  101296:	0f b6 90 25 01 00 00 	movzbl 0x125(%eax),%edx
  10129d:	83 e2 f0             	and    $0xfffffff0,%edx
  1012a0:	83 ca 0e             	or     $0xe,%edx
  1012a3:	83 e2 8f             	and    $0xffffff8f,%edx
  1012a6:	83 ca 80             	or     $0xffffff80,%edx
  1012a9:	88 90 25 01 00 00    	mov    %dl,0x125(%eax)
  1012af:	c1 e9 10             	shr    $0x10,%ecx
  1012b2:	66 89 88 26 01 00 00 	mov    %cx,0x126(%eax)
	SETGATE(idt[T_IRQ0+IRQ_LPT2],     0, CPU_GDT_KCODE, &Xirq_lpt,      0);
  1012b9:	c7 c1 d6 1d 10 00    	mov    $0x101dd6,%ecx
  1012bf:	66 89 88 28 01 00 00 	mov    %cx,0x128(%eax)
  1012c6:	66 c7 80 2a 01 00 00 	movw   $0x8,0x12a(%eax)
  1012cd:	08 00 
  1012cf:	c6 80 2c 01 00 00 00 	movb   $0x0,0x12c(%eax)
  1012d6:	0f b6 90 2d 01 00 00 	movzbl 0x12d(%eax),%edx
  1012dd:	83 e2 f0             	and    $0xfffffff0,%edx
  1012e0:	83 ca 0e             	or     $0xe,%edx
  1012e3:	83 e2 8f             	and    $0xffffff8f,%edx
  1012e6:	83 ca 80             	or     $0xffffff80,%edx
  1012e9:	88 90 2d 01 00 00    	mov    %dl,0x12d(%eax)
  1012ef:	c1 e9 10             	shr    $0x10,%ecx
  1012f2:	66 89 88 2e 01 00 00 	mov    %cx,0x12e(%eax)
	SETGATE(idt[T_IRQ0+IRQ_FLOPPY],   0, CPU_GDT_KCODE, &Xirq_floppy,   0);
  1012f9:	c7 c1 dc 1d 10 00    	mov    $0x101ddc,%ecx
  1012ff:	66 89 88 30 01 00 00 	mov    %cx,0x130(%eax)
  101306:	66 c7 80 32 01 00 00 	movw   $0x8,0x132(%eax)
  10130d:	08 00 
  10130f:	c6 80 34 01 00 00 00 	movb   $0x0,0x134(%eax)
  101316:	0f b6 90 35 01 00 00 	movzbl 0x135(%eax),%edx
  10131d:	83 e2 f0             	and    $0xfffffff0,%edx
  101320:	83 ca 0e             	or     $0xe,%edx
  101323:	83 e2 8f             	and    $0xffffff8f,%edx
  101326:	83 ca 80             	or     $0xffffff80,%edx
  101329:	88 90 35 01 00 00    	mov    %dl,0x135(%eax)
  10132f:	c1 e9 10             	shr    $0x10,%ecx
  101332:	66 89 88 36 01 00 00 	mov    %cx,0x136(%eax)
	SETGATE(idt[T_IRQ0+IRQ_SPURIOUS], 0, CPU_GDT_KCODE, &Xirq_spurious, 0);
  101339:	c7 c1 e2 1d 10 00    	mov    $0x101de2,%ecx
  10133f:	66 89 88 38 01 00 00 	mov    %cx,0x138(%eax)
  101346:	66 c7 80 3a 01 00 00 	movw   $0x8,0x13a(%eax)
  10134d:	08 00 
  10134f:	c6 80 3c 01 00 00 00 	movb   $0x0,0x13c(%eax)
  101356:	0f b6 90 3d 01 00 00 	movzbl 0x13d(%eax),%edx
  10135d:	83 e2 f0             	and    $0xfffffff0,%edx
  101360:	83 ca 0e             	or     $0xe,%edx
  101363:	83 e2 8f             	and    $0xffffff8f,%edx
  101366:	83 ca 80             	or     $0xffffff80,%edx
  101369:	88 90 3d 01 00 00    	mov    %dl,0x13d(%eax)
  10136f:	c1 e9 10             	shr    $0x10,%ecx
  101372:	66 89 88 3e 01 00 00 	mov    %cx,0x13e(%eax)
	SETGATE(idt[T_IRQ0+IRQ_RTC],      0, CPU_GDT_KCODE, &Xirq_rtc,      0);
  101379:	c7 c1 e8 1d 10 00    	mov    $0x101de8,%ecx
  10137f:	66 89 88 40 01 00 00 	mov    %cx,0x140(%eax)
  101386:	66 c7 80 42 01 00 00 	movw   $0x8,0x142(%eax)
  10138d:	08 00 
  10138f:	c6 80 44 01 00 00 00 	movb   $0x0,0x144(%eax)
  101396:	0f b6 90 45 01 00 00 	movzbl 0x145(%eax),%edx
  10139d:	83 e2 f0             	and    $0xfffffff0,%edx
  1013a0:	83 ca 0e             	or     $0xe,%edx
  1013a3:	83 e2 8f             	and    $0xffffff8f,%edx
  1013a6:	83 ca 80             	or     $0xffffff80,%edx
  1013a9:	88 90 45 01 00 00    	mov    %dl,0x145(%eax)
  1013af:	c1 e9 10             	shr    $0x10,%ecx
  1013b2:	66 89 88 46 01 00 00 	mov    %cx,0x146(%eax)
	SETGATE(idt[T_IRQ0+9],            0, CPU_GDT_KCODE, &Xirq9,         0);
  1013b9:	c7 c1 ee 1d 10 00    	mov    $0x101dee,%ecx
  1013bf:	66 89 88 48 01 00 00 	mov    %cx,0x148(%eax)
  1013c6:	66 c7 80 4a 01 00 00 	movw   $0x8,0x14a(%eax)
  1013cd:	08 00 
  1013cf:	c6 80 4c 01 00 00 00 	movb   $0x0,0x14c(%eax)
  1013d6:	0f b6 90 4d 01 00 00 	movzbl 0x14d(%eax),%edx
  1013dd:	83 e2 f0             	and    $0xfffffff0,%edx
  1013e0:	83 ca 0e             	or     $0xe,%edx
  1013e3:	83 e2 8f             	and    $0xffffff8f,%edx
  1013e6:	83 ca 80             	or     $0xffffff80,%edx
  1013e9:	88 90 4d 01 00 00    	mov    %dl,0x14d(%eax)
  1013ef:	c1 e9 10             	shr    $0x10,%ecx
  1013f2:	66 89 88 4e 01 00 00 	mov    %cx,0x14e(%eax)
	SETGATE(idt[T_IRQ0+10],           0, CPU_GDT_KCODE, &Xirq10,        0);
  1013f9:	c7 c2 f4 1d 10 00    	mov    $0x101df4,%edx
  1013ff:	66 89 90 50 01 00 00 	mov    %dx,0x150(%eax)
  101406:	66 c7 80 52 01 00 00 	movw   $0x8,0x152(%eax)
  10140d:	08 00 
  10140f:	c6 80 54 01 00 00 00 	movb   $0x0,0x154(%eax)
  101416:	0f b6 90 55 01 00 00 	movzbl 0x155(%eax),%edx
  10141d:	83 e2 f0             	and    $0xfffffff0,%edx
  101420:	83 ca 0e             	or     $0xe,%edx
  101423:	83 e2 8f             	and    $0xffffff8f,%edx
  101426:	83 ca 80             	or     $0xffffff80,%edx
  101429:	88 90 55 01 00 00    	mov    %dl,0x155(%eax)
  10142f:	c7 c2 f4 1d 10 00    	mov    $0x101df4,%edx
  101435:	c1 ea 10             	shr    $0x10,%edx
  101438:	66 89 90 56 01 00 00 	mov    %dx,0x156(%eax)
	SETGATE(idt[T_IRQ0+11],           0, CPU_GDT_KCODE, &Xirq11,        0);
  10143f:	c7 c1 fa 1d 10 00    	mov    $0x101dfa,%ecx
  101445:	66 89 88 58 01 00 00 	mov    %cx,0x158(%eax)
  10144c:	66 c7 80 5a 01 00 00 	movw   $0x8,0x15a(%eax)
  101453:	08 00 
  101455:	c6 80 5c 01 00 00 00 	movb   $0x0,0x15c(%eax)
  10145c:	0f b6 90 5d 01 00 00 	movzbl 0x15d(%eax),%edx
  101463:	83 e2 f0             	and    $0xfffffff0,%edx
  101466:	83 ca 0e             	or     $0xe,%edx
  101469:	83 e2 8f             	and    $0xffffff8f,%edx
  10146c:	83 ca 80             	or     $0xffffff80,%edx
  10146f:	88 90 5d 01 00 00    	mov    %dl,0x15d(%eax)
  101475:	c1 e9 10             	shr    $0x10,%ecx
  101478:	66 89 88 5e 01 00 00 	mov    %cx,0x15e(%eax)
	SETGATE(idt[T_IRQ0+IRQ_MOUSE],    0, CPU_GDT_KCODE, &Xirq_mouse,    0);
  10147f:	c7 c1 00 1e 10 00    	mov    $0x101e00,%ecx
  101485:	66 89 88 60 01 00 00 	mov    %cx,0x160(%eax)
  10148c:	66 c7 80 62 01 00 00 	movw   $0x8,0x162(%eax)
  101493:	08 00 
  101495:	c6 80 64 01 00 00 00 	movb   $0x0,0x164(%eax)
  10149c:	0f b6 90 65 01 00 00 	movzbl 0x165(%eax),%edx
  1014a3:	83 e2 f0             	and    $0xfffffff0,%edx
  1014a6:	83 ca 0e             	or     $0xe,%edx
  1014a9:	83 e2 8f             	and    $0xffffff8f,%edx
  1014ac:	83 ca 80             	or     $0xffffff80,%edx
  1014af:	88 90 65 01 00 00    	mov    %dl,0x165(%eax)
  1014b5:	c1 e9 10             	shr    $0x10,%ecx
  1014b8:	66 89 88 66 01 00 00 	mov    %cx,0x166(%eax)
	SETGATE(idt[T_IRQ0+IRQ_COPROCESSOR], 0, CPU_GDT_KCODE, &Xirq_coproc, 0);
  1014bf:	c7 c1 06 1e 10 00    	mov    $0x101e06,%ecx
  1014c5:	66 89 88 68 01 00 00 	mov    %cx,0x168(%eax)
  1014cc:	66 c7 80 6a 01 00 00 	movw   $0x8,0x16a(%eax)
  1014d3:	08 00 
  1014d5:	c6 80 6c 01 00 00 00 	movb   $0x0,0x16c(%eax)
  1014dc:	0f b6 90 6d 01 00 00 	movzbl 0x16d(%eax),%edx
  1014e3:	83 e2 f0             	and    $0xfffffff0,%edx
  1014e6:	83 ca 0e             	or     $0xe,%edx
  1014e9:	83 e2 8f             	and    $0xffffff8f,%edx
  1014ec:	83 ca 80             	or     $0xffffff80,%edx
  1014ef:	88 90 6d 01 00 00    	mov    %dl,0x16d(%eax)
  1014f5:	c1 e9 10             	shr    $0x10,%ecx
  1014f8:	66 89 88 6e 01 00 00 	mov    %cx,0x16e(%eax)
	SETGATE(idt[T_IRQ0+IRQ_IDE1],     0, CPU_GDT_KCODE, &Xirq_ide1,     0);
  1014ff:	c7 c1 0c 1e 10 00    	mov    $0x101e0c,%ecx
  101505:	66 89 88 70 01 00 00 	mov    %cx,0x170(%eax)
  10150c:	66 c7 80 72 01 00 00 	movw   $0x8,0x172(%eax)
  101513:	08 00 
  101515:	c6 80 74 01 00 00 00 	movb   $0x0,0x174(%eax)
  10151c:	0f b6 90 75 01 00 00 	movzbl 0x175(%eax),%edx
  101523:	83 e2 f0             	and    $0xfffffff0,%edx
  101526:	83 ca 0e             	or     $0xe,%edx
  101529:	83 e2 8f             	and    $0xffffff8f,%edx
  10152c:	83 ca 80             	or     $0xffffff80,%edx
  10152f:	88 90 75 01 00 00    	mov    %dl,0x175(%eax)
  101535:	c1 e9 10             	shr    $0x10,%ecx
  101538:	66 89 88 76 01 00 00 	mov    %cx,0x176(%eax)
	SETGATE(idt[T_IRQ0+IRQ_IDE2],     0, CPU_GDT_KCODE, &Xirq_ide2,     0);
  10153f:	c7 c1 12 1e 10 00    	mov    $0x101e12,%ecx
  101545:	66 89 88 78 01 00 00 	mov    %cx,0x178(%eax)
  10154c:	66 c7 80 7a 01 00 00 	movw   $0x8,0x17a(%eax)
  101553:	08 00 
  101555:	c6 80 7c 01 00 00 00 	movb   $0x0,0x17c(%eax)
  10155c:	0f b6 90 7d 01 00 00 	movzbl 0x17d(%eax),%edx
  101563:	83 e2 f0             	and    $0xfffffff0,%edx
  101566:	83 ca 0e             	or     $0xe,%edx
  101569:	83 e2 8f             	and    $0xffffff8f,%edx
  10156c:	83 ca 80             	or     $0xffffff80,%edx
  10156f:	88 90 7d 01 00 00    	mov    %dl,0x17d(%eax)
  101575:	c1 e9 10             	shr    $0x10,%ecx
  101578:	66 89 88 7e 01 00 00 	mov    %cx,0x17e(%eax)

	// Use DPL=3 here because system calls are explicitly invoked
	// by the user process (with "int $T_SYSCALL").
	SETGATE(idt[T_SYSCALL],           0, CPU_GDT_KCODE, &Xsyscall,      3);
  10157f:	c7 c1 18 1e 10 00    	mov    $0x101e18,%ecx
  101585:	66 89 88 80 01 00 00 	mov    %cx,0x180(%eax)
  10158c:	66 c7 80 82 01 00 00 	movw   $0x8,0x182(%eax)
  101593:	08 00 
  101595:	c6 80 84 01 00 00 00 	movb   $0x0,0x184(%eax)
  10159c:	0f b6 90 85 01 00 00 	movzbl 0x185(%eax),%edx
  1015a3:	83 e2 f0             	and    $0xfffffff0,%edx
  1015a6:	83 ca 0e             	or     $0xe,%edx
  1015a9:	83 e2 ef             	and    $0xffffffef,%edx
  1015ac:	83 ca e0             	or     $0xffffffe0,%edx
  1015af:	88 90 85 01 00 00    	mov    %dl,0x185(%eax)
  1015b5:	c1 e9 10             	shr    $0x10,%ecx
  1015b8:	66 89 88 86 01 00 00 	mov    %cx,0x186(%eax)

	/* default */
	SETGATE(idt[T_DEFAULT],           0, CPU_GDT_KCODE, &Xdefault,      0);
  1015bf:	c7 c1 1e 1e 10 00    	mov    $0x101e1e,%ecx
  1015c5:	66 89 88 f0 07 00 00 	mov    %cx,0x7f0(%eax)
  1015cc:	66 c7 80 f2 07 00 00 	movw   $0x8,0x7f2(%eax)
  1015d3:	08 00 
  1015d5:	c6 80 f4 07 00 00 00 	movb   $0x0,0x7f4(%eax)
  1015dc:	0f b6 90 f5 07 00 00 	movzbl 0x7f5(%eax),%edx
  1015e3:	83 e2 f0             	and    $0xfffffff0,%edx
  1015e6:	83 ca 0e             	or     $0xe,%edx
  1015e9:	83 e2 8f             	and    $0xffffff8f,%edx
  1015ec:	83 ca 80             	or     $0xffffff80,%edx
  1015ef:	88 90 f5 07 00 00    	mov    %dl,0x7f5(%eax)
  1015f5:	c1 e9 10             	shr    $0x10,%ecx
  1015f8:	66 89 88 f6 07 00 00 	mov    %cx,0x7f6(%eax)

	asm volatile("lidt %0" : : "m" (idt_pd));
  1015ff:	0f 01 9e 20 03 00 00 	lidtl  0x320(%esi)
}
  101606:	5b                   	pop    %ebx
  101607:	5e                   	pop    %esi
  101608:	5f                   	pop    %edi
  101609:	5d                   	pop    %ebp
  10160a:	c3                   	ret    

0010160b <intr_init>:

void
intr_init(void)
{
  10160b:	53                   	push   %ebx
  10160c:	83 ec 08             	sub    $0x8,%esp
  10160f:	e8 fb ec ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  101614:	81 c3 ec a9 00 00    	add    $0xa9ec,%ebx
	if (intr_inited == TRUE)
  10161a:	0f b6 83 40 de 01 00 	movzbl 0x1de40(%ebx),%eax
  101621:	3c 01                	cmp    $0x1,%al
  101623:	74 11                	je     101636 <intr_init+0x2b>
		return;

  pic_init();
  101625:	e8 89 00 00 00       	call   1016b3 <pic_init>
	intr_init_idt();
  10162a:	e8 a6 f7 ff ff       	call   100dd5 <intr_init_idt>
	intr_inited = TRUE;
  10162f:	c6 83 40 de 01 00 01 	movb   $0x1,0x1de40(%ebx)
}
  101636:	83 c4 08             	add    $0x8,%esp
  101639:	5b                   	pop    %ebx
  10163a:	c3                   	ret    

0010163b <intr_enable>:

void
intr_enable(uint8_t irq)
{
  10163b:	53                   	push   %ebx
  10163c:	83 ec 08             	sub    $0x8,%esp
  10163f:	e8 cb ec ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  101644:	81 c3 bc a9 00 00    	add    $0xa9bc,%ebx
  10164a:	8b 44 24 10          	mov    0x10(%esp),%eax
	if (irq >= 16)
  10164e:	3c 0f                	cmp    $0xf,%al
  101650:	76 05                	jbe    101657 <intr_enable+0x1c>
		return;
	pic_enable(irq);
}
  101652:	83 c4 08             	add    $0x8,%esp
  101655:	5b                   	pop    %ebx
  101656:	c3                   	ret    
	pic_enable(irq);
  101657:	83 ec 0c             	sub    $0xc,%esp
  10165a:	0f b6 c0             	movzbl %al,%eax
  10165d:	50                   	push   %eax
  10165e:	e8 a0 01 00 00       	call   101803 <pic_enable>
  101663:	83 c4 10             	add    $0x10,%esp
  101666:	eb ea                	jmp    101652 <intr_enable+0x17>

00101668 <intr_eoi>:

void
intr_eoi(void)
{
  101668:	53                   	push   %ebx
  101669:	83 ec 08             	sub    $0x8,%esp
  10166c:	e8 9e ec ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  101671:	81 c3 8f a9 00 00    	add    $0xa98f,%ebx
	pic_eoi();
  101677:	e8 b6 01 00 00       	call   101832 <pic_eoi>
}
  10167c:	83 c4 08             	add    $0x8,%esp
  10167f:	5b                   	pop    %ebx
  101680:	c3                   	ret    

00101681 <intr_local_enable>:

void
intr_local_enable(void)
{
  101681:	53                   	push   %ebx
  101682:	83 ec 08             	sub    $0x8,%esp
  101685:	e8 85 ec ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10168a:	81 c3 76 a9 00 00    	add    $0xa976,%ebx
	sti();
  101690:	e8 10 13 00 00       	call   1029a5 <sti>
}
  101695:	83 c4 08             	add    $0x8,%esp
  101698:	5b                   	pop    %ebx
  101699:	c3                   	ret    

0010169a <intr_local_disable>:

void
intr_local_disable(void)
{
  10169a:	53                   	push   %ebx
  10169b:	83 ec 08             	sub    $0x8,%esp
  10169e:	e8 6c ec ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1016a3:	81 c3 5d a9 00 00    	add    $0xa95d,%ebx
	cli();
  1016a9:	e8 f5 12 00 00       	call   1029a3 <cli>
}
  1016ae:	83 c4 08             	add    $0x8,%esp
  1016b1:	5b                   	pop    %ebx
  1016b2:	c3                   	ret    

001016b3 <pic_init>:
static bool pic_inited = FALSE;

/* Initialize the 8259A interrupt controllers. */
void
pic_init(void)
{
  1016b3:	53                   	push   %ebx
  1016b4:	83 ec 08             	sub    $0x8,%esp
  1016b7:	e8 53 ec ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1016bc:	81 c3 44 a9 00 00    	add    $0xa944,%ebx
	if (pic_inited == TRUE)		// only do once on bootstrap CPU
  1016c2:	80 bb 41 de 01 00 01 	cmpb   $0x1,0x1de41(%ebx)
  1016c9:	0f 84 ee 00 00 00    	je     1017bd <pic_init+0x10a>
		return;
	pic_inited = TRUE;
  1016cf:	c6 83 41 de 01 00 01 	movb   $0x1,0x1de41(%ebx)

	/* mask all interrupts */
	outb(IO_PIC1+1, 0xff);
  1016d6:	83 ec 08             	sub    $0x8,%esp
  1016d9:	68 ff 00 00 00       	push   $0xff
  1016de:	6a 21                	push   $0x21
  1016e0:	e8 85 13 00 00       	call   102a6a <outb>
	outb(IO_PIC2+1, 0xff);
  1016e5:	83 c4 08             	add    $0x8,%esp
  1016e8:	68 ff 00 00 00       	push   $0xff
  1016ed:	68 a1 00 00 00       	push   $0xa1
  1016f2:	e8 73 13 00 00       	call   102a6a <outb>

	// ICW1:  0001g0hi
	//    g:  0 = edge triggering, 1 = level triggering
	//    h:  0 = cascaded PICs, 1 = master only
	//    i:  0 = no ICW4, 1 = ICW4 required
	outb(IO_PIC1, 0x11);
  1016f7:	83 c4 08             	add    $0x8,%esp
  1016fa:	6a 11                	push   $0x11
  1016fc:	6a 20                	push   $0x20
  1016fe:	e8 67 13 00 00       	call   102a6a <outb>

	// ICW2:  Vector offset
	outb(IO_PIC1+1, T_IRQ0);
  101703:	83 c4 08             	add    $0x8,%esp
  101706:	6a 20                	push   $0x20
  101708:	6a 21                	push   $0x21
  10170a:	e8 5b 13 00 00       	call   102a6a <outb>

	// ICW3:  bit mask of IR lines connected to slave PICs (master PIC),
	//        3-bit No of IR line at which slave connects to master(slave PIC).
	outb(IO_PIC1+1, 1<<IRQ_SLAVE);
  10170f:	83 c4 08             	add    $0x8,%esp
  101712:	6a 04                	push   $0x4
  101714:	6a 21                	push   $0x21
  101716:	e8 4f 13 00 00       	call   102a6a <outb>
	//    m:  0 = slave PIC, 1 = master PIC
	//	  (ignored when b is 0, as the master/slave role
	//	  can be hardwired).
	//    a:  1 = Automatic EOI mode
	//    p:  0 = MCS-80/85 mode, 1 = intel x86 mode
	outb(IO_PIC1+1, 0x1);
  10171b:	83 c4 08             	add    $0x8,%esp
  10171e:	6a 01                	push   $0x1
  101720:	6a 21                	push   $0x21
  101722:	e8 43 13 00 00       	call   102a6a <outb>

	// Set up slave (8259A-2)
	outb(IO_PIC2, 0x11);			// ICW1
  101727:	83 c4 08             	add    $0x8,%esp
  10172a:	6a 11                	push   $0x11
  10172c:	68 a0 00 00 00       	push   $0xa0
  101731:	e8 34 13 00 00       	call   102a6a <outb>
	outb(IO_PIC2+1, T_IRQ0 + 8);		// ICW2
  101736:	83 c4 08             	add    $0x8,%esp
  101739:	6a 28                	push   $0x28
  10173b:	68 a1 00 00 00       	push   $0xa1
  101740:	e8 25 13 00 00       	call   102a6a <outb>
	outb(IO_PIC2+1, IRQ_SLAVE);		// ICW3
  101745:	83 c4 08             	add    $0x8,%esp
  101748:	6a 02                	push   $0x2
  10174a:	68 a1 00 00 00       	push   $0xa1
  10174f:	e8 16 13 00 00       	call   102a6a <outb>
	// NB Automatic EOI mode doesn't tend to work on the slave.
	// Linux source code says it's "to be investigated".
	outb(IO_PIC2+1, 0x01);			// ICW4
  101754:	83 c4 08             	add    $0x8,%esp
  101757:	6a 01                	push   $0x1
  101759:	68 a1 00 00 00       	push   $0xa1
  10175e:	e8 07 13 00 00       	call   102a6a <outb>

	// OCW3:  0ef01prs
	//   ef:  0x = NOP, 10 = clear specific mask, 11 = set specific mask
	//    p:  0 = no polling, 1 = polling mode
	//   rs:  0x = NOP, 10 = read IRR, 11 = read ISR
	outb(IO_PIC1, 0x68);             /* clear specific mask */
  101763:	83 c4 08             	add    $0x8,%esp
  101766:	6a 68                	push   $0x68
  101768:	6a 20                	push   $0x20
  10176a:	e8 fb 12 00 00       	call   102a6a <outb>
	outb(IO_PIC1, 0x0a);             /* read IRR by default */
  10176f:	83 c4 08             	add    $0x8,%esp
  101772:	6a 0a                	push   $0xa
  101774:	6a 20                	push   $0x20
  101776:	e8 ef 12 00 00       	call   102a6a <outb>

	outb(IO_PIC2, 0x68);               /* OCW3 */
  10177b:	83 c4 08             	add    $0x8,%esp
  10177e:	6a 68                	push   $0x68
  101780:	68 a0 00 00 00       	push   $0xa0
  101785:	e8 e0 12 00 00       	call   102a6a <outb>
	outb(IO_PIC2, 0x0a);               /* OCW3 */
  10178a:	83 c4 08             	add    $0x8,%esp
  10178d:	6a 0a                	push   $0xa
  10178f:	68 a0 00 00 00       	push   $0xa0
  101794:	e8 d1 12 00 00       	call   102a6a <outb>

	// mask all interrupts
	outb(IO_PIC1+1, 0xFF);
  101799:	83 c4 08             	add    $0x8,%esp
  10179c:	68 ff 00 00 00       	push   $0xff
  1017a1:	6a 21                	push   $0x21
  1017a3:	e8 c2 12 00 00       	call   102a6a <outb>
	outb(IO_PIC2+1, 0xFF);
  1017a8:	83 c4 08             	add    $0x8,%esp
  1017ab:	68 ff 00 00 00       	push   $0xff
  1017b0:	68 a1 00 00 00       	push   $0xa1
  1017b5:	e8 b0 12 00 00       	call   102a6a <outb>
  1017ba:	83 c4 10             	add    $0x10,%esp
}
  1017bd:	83 c4 08             	add    $0x8,%esp
  1017c0:	5b                   	pop    %ebx
  1017c1:	c3                   	ret    

001017c2 <pic_setmask>:

void
pic_setmask(uint16_t mask)
{
  1017c2:	56                   	push   %esi
  1017c3:	53                   	push   %ebx
  1017c4:	83 ec 0c             	sub    $0xc,%esp
  1017c7:	e8 43 eb ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1017cc:	81 c3 34 a8 00 00    	add    $0xa834,%ebx
  1017d2:	8b 74 24 18          	mov    0x18(%esp),%esi
	irqmask = mask;
  1017d6:	66 89 b3 26 03 00 00 	mov    %si,0x326(%ebx)
	outb(IO_PIC1+1, (char)mask);
  1017dd:	89 f0                	mov    %esi,%eax
  1017df:	0f b6 c0             	movzbl %al,%eax
  1017e2:	50                   	push   %eax
  1017e3:	6a 21                	push   $0x21
  1017e5:	e8 80 12 00 00       	call   102a6a <outb>
	outb(IO_PIC2+1, (char)(mask >> 8));
  1017ea:	83 c4 08             	add    $0x8,%esp
  1017ed:	89 f0                	mov    %esi,%eax
  1017ef:	0f b6 f4             	movzbl %ah,%esi
  1017f2:	56                   	push   %esi
  1017f3:	68 a1 00 00 00       	push   $0xa1
  1017f8:	e8 6d 12 00 00       	call   102a6a <outb>
}
  1017fd:	83 c4 14             	add    $0x14,%esp
  101800:	5b                   	pop    %ebx
  101801:	5e                   	pop    %esi
  101802:	c3                   	ret    

00101803 <pic_enable>:

void
pic_enable(int irq)
{
  101803:	83 ec 18             	sub    $0x18,%esp
  101806:	e8 c6 f5 ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  10180b:	81 c2 f5 a7 00 00    	add    $0xa7f5,%edx
	pic_setmask(irqmask & ~(1 << irq));
  101811:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
  101815:	b8 01 00 00 00       	mov    $0x1,%eax
  10181a:	d3 e0                	shl    %cl,%eax
  10181c:	f7 d0                	not    %eax
  10181e:	66 23 82 26 03 00 00 	and    0x326(%edx),%ax
  101825:	0f b7 c0             	movzwl %ax,%eax
  101828:	50                   	push   %eax
  101829:	e8 94 ff ff ff       	call   1017c2 <pic_setmask>
}
  10182e:	83 c4 1c             	add    $0x1c,%esp
  101831:	c3                   	ret    

00101832 <pic_eoi>:

void
pic_eoi(void)
{
  101832:	53                   	push   %ebx
  101833:	83 ec 10             	sub    $0x10,%esp
  101836:	e8 d4 ea ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10183b:	81 c3 c5 a7 00 00    	add    $0xa7c5,%ebx
	// OCW2: rse00xxx
	//   r: rotate
	//   s: specific
	//   e: end-of-interrupt
	// xxx: specific interrupt line
	outb(IO_PIC1, 0x20);
  101841:	6a 20                	push   $0x20
  101843:	6a 20                	push   $0x20
  101845:	e8 20 12 00 00       	call   102a6a <outb>
	outb(IO_PIC2, 0x20);
  10184a:	83 c4 08             	add    $0x8,%esp
  10184d:	6a 20                	push   $0x20
  10184f:	68 a0 00 00 00       	push   $0xa0
  101854:	e8 11 12 00 00       	call   102a6a <outb>
}
  101859:	83 c4 18             	add    $0x18,%esp
  10185c:	5b                   	pop    %ebx
  10185d:	c3                   	ret    

0010185e <pic_reset>:

void
pic_reset(void)
{
  10185e:	53                   	push   %ebx
  10185f:	83 ec 10             	sub    $0x10,%esp
  101862:	e8 a8 ea ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  101867:	81 c3 99 a7 00 00    	add    $0xa799,%ebx
	// mask all interrupts
	outb(IO_PIC1+1, 0x00);
  10186d:	6a 00                	push   $0x0
  10186f:	6a 21                	push   $0x21
  101871:	e8 f4 11 00 00       	call   102a6a <outb>
	outb(IO_PIC2+1, 0x00);
  101876:	83 c4 08             	add    $0x8,%esp
  101879:	6a 00                	push   $0x0
  10187b:	68 a1 00 00 00       	push   $0xa1
  101880:	e8 e5 11 00 00       	call   102a6a <outb>

	// ICW1:  0001g0hi
	//    g:  0 = edge triggering, 1 = level triggering
	//    h:  0 = cascaded PICs, 1 = master only
	//    i:  0 = no ICW4, 1 = ICW4 required
	outb(IO_PIC1, 0x11);
  101885:	83 c4 08             	add    $0x8,%esp
  101888:	6a 11                	push   $0x11
  10188a:	6a 20                	push   $0x20
  10188c:	e8 d9 11 00 00       	call   102a6a <outb>

	// ICW2:  Vector offset
	outb(IO_PIC1+1, T_IRQ0);
  101891:	83 c4 08             	add    $0x8,%esp
  101894:	6a 20                	push   $0x20
  101896:	6a 21                	push   $0x21
  101898:	e8 cd 11 00 00       	call   102a6a <outb>

	// ICW3:  bit mask of IR lines connected to slave PICs (master PIC),
	//        3-bit No of IR line at which slave connects to master(slave PIC).
	outb(IO_PIC1+1, 1<<IRQ_SLAVE);
  10189d:	83 c4 08             	add    $0x8,%esp
  1018a0:	6a 04                	push   $0x4
  1018a2:	6a 21                	push   $0x21
  1018a4:	e8 c1 11 00 00       	call   102a6a <outb>
	//    m:  0 = slave PIC, 1 = master PIC
	//	  (ignored when b is 0, as the master/slave role
	//	  can be hardwired).
	//    a:  1 = Automatic EOI mode
	//    p:  0 = MCS-80/85 mode, 1 = intel x86 mode
	outb(IO_PIC1+1, 0x3);
  1018a9:	83 c4 08             	add    $0x8,%esp
  1018ac:	6a 03                	push   $0x3
  1018ae:	6a 21                	push   $0x21
  1018b0:	e8 b5 11 00 00       	call   102a6a <outb>

	// Set up slave (8259A-2)
	outb(IO_PIC2, 0x11);			// ICW1
  1018b5:	83 c4 08             	add    $0x8,%esp
  1018b8:	6a 11                	push   $0x11
  1018ba:	68 a0 00 00 00       	push   $0xa0
  1018bf:	e8 a6 11 00 00       	call   102a6a <outb>
	outb(IO_PIC2+1, T_IRQ0 + 8);		// ICW2
  1018c4:	83 c4 08             	add    $0x8,%esp
  1018c7:	6a 28                	push   $0x28
  1018c9:	68 a1 00 00 00       	push   $0xa1
  1018ce:	e8 97 11 00 00       	call   102a6a <outb>
	outb(IO_PIC2+1, IRQ_SLAVE);		// ICW3
  1018d3:	83 c4 08             	add    $0x8,%esp
  1018d6:	6a 02                	push   $0x2
  1018d8:	68 a1 00 00 00       	push   $0xa1
  1018dd:	e8 88 11 00 00       	call   102a6a <outb>
	// NB Automatic EOI mode doesn't tend to work on the slave.
	// Linux source code says it's "to be investigated".
	outb(IO_PIC2+1, 0x01);			// ICW4
  1018e2:	83 c4 08             	add    $0x8,%esp
  1018e5:	6a 01                	push   $0x1
  1018e7:	68 a1 00 00 00       	push   $0xa1
  1018ec:	e8 79 11 00 00       	call   102a6a <outb>

	// OCW3:  0ef01prs
	//   ef:  0x = NOP, 10 = clear specific mask, 11 = set specific mask
	//    p:  0 = no polling, 1 = polling mode
	//   rs:  0x = NOP, 10 = read IRR, 11 = read ISR
	outb(IO_PIC1, 0x68);             /* clear specific mask */
  1018f1:	83 c4 08             	add    $0x8,%esp
  1018f4:	6a 68                	push   $0x68
  1018f6:	6a 20                	push   $0x20
  1018f8:	e8 6d 11 00 00       	call   102a6a <outb>
	outb(IO_PIC1, 0x0a);             /* read IRR by default */
  1018fd:	83 c4 08             	add    $0x8,%esp
  101900:	6a 0a                	push   $0xa
  101902:	6a 20                	push   $0x20
  101904:	e8 61 11 00 00       	call   102a6a <outb>

	outb(IO_PIC2, 0x68);               /* OCW3 */
  101909:	83 c4 08             	add    $0x8,%esp
  10190c:	6a 68                	push   $0x68
  10190e:	68 a0 00 00 00       	push   $0xa0
  101913:	e8 52 11 00 00       	call   102a6a <outb>
	outb(IO_PIC2, 0x0a);               /* OCW3 */
  101918:	83 c4 08             	add    $0x8,%esp
  10191b:	6a 0a                	push   $0xa
  10191d:	68 a0 00 00 00       	push   $0xa0
  101922:	e8 43 11 00 00       	call   102a6a <outb>
}
  101927:	83 c4 18             	add    $0x18,%esp
  10192a:	5b                   	pop    %ebx
  10192b:	c3                   	ret    

0010192c <timer_hw_init>:

// Initialize the programmable interval timer.

void
timer_hw_init(void)
{
  10192c:	53                   	push   %ebx
  10192d:	83 ec 10             	sub    $0x10,%esp
  101930:	e8 da e9 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  101935:	81 c3 cb a6 00 00    	add    $0xa6cb,%ebx
	outb(PIT_CONTROL, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
  10193b:	6a 34                	push   $0x34
  10193d:	6a 43                	push   $0x43
  10193f:	e8 26 11 00 00       	call   102a6a <outb>
	outb(PIT_CHANNEL0, LOW8(LATCH));
  101944:	83 c4 08             	add    $0x8,%esp
  101947:	68 9c 00 00 00       	push   $0x9c
  10194c:	6a 40                	push   $0x40
  10194e:	e8 17 11 00 00       	call   102a6a <outb>
	outb(PIT_CHANNEL0, HIGH8(LATCH));
  101953:	83 c4 08             	add    $0x8,%esp
  101956:	6a 2e                	push   $0x2e
  101958:	6a 40                	push   $0x40
  10195a:	e8 0b 11 00 00       	call   102a6a <outb>
}
  10195f:	83 c4 18             	add    $0x18,%esp
  101962:	5b                   	pop    %ebx
  101963:	c3                   	ret    

00101964 <tsc_calibrate>:
/*
 * XXX: From Linux 3.2.6: arch/x86/kernel/tsc.c: pit_calibrate_tsc()
 */
static uint64_t
tsc_calibrate(uint32_t latch, uint32_t ms, int loopmin)
{
  101964:	55                   	push   %ebp
  101965:	57                   	push   %edi
  101966:	56                   	push   %esi
  101967:	53                   	push   %ebx
  101968:	83 ec 48             	sub    $0x48,%esp
  10196b:	e8 ab eb ff ff       	call   10051b <__x86.get_pc_thunk.si>
  101970:	81 c6 90 a6 00 00    	add    $0xa690,%esi
  101976:	89 c7                	mov    %eax,%edi
  101978:	89 54 24 38          	mov    %edx,0x38(%esp)
  10197c:	89 cd                	mov    %ecx,%ebp
	uint64_t tsc, t1, t2, delta, tscmin, tscmax;;
	int pitcnt;

	/* Set the Gate high, disable speaker */
	outb(0x61, (inb(0x61) & ~0x02) | 0x01);
  10197e:	6a 61                	push   $0x61
  101980:	89 f3                	mov    %esi,%ebx
  101982:	e8 cb 10 00 00       	call   102a52 <inb>
  101987:	83 e0 fc             	and    $0xfffffffc,%eax
  10198a:	83 c8 01             	or     $0x1,%eax
  10198d:	83 c4 08             	add    $0x8,%esp
  101990:	0f b6 c0             	movzbl %al,%eax
  101993:	50                   	push   %eax
  101994:	6a 61                	push   $0x61
  101996:	e8 cf 10 00 00       	call   102a6a <outb>
	/*
	 * Setup CTC channel 2 for mode 0, (interrupt on terminal
	 * count mode), binary count. Set the latch register to 50ms
	 * (LSB then MSB) to begin countdown.
	 */
	outb(0x43, 0xb0);
  10199b:	83 c4 08             	add    $0x8,%esp
  10199e:	68 b0 00 00 00       	push   $0xb0
  1019a3:	6a 43                	push   $0x43
  1019a5:	e8 c0 10 00 00       	call   102a6a <outb>
	outb(0x42, latch & 0xff);
  1019aa:	83 c4 08             	add    $0x8,%esp
  1019ad:	89 f8                	mov    %edi,%eax
  1019af:	0f b6 c0             	movzbl %al,%eax
  1019b2:	50                   	push   %eax
  1019b3:	6a 42                	push   $0x42
  1019b5:	e8 b0 10 00 00       	call   102a6a <outb>
	outb(0x42, latch >> 8);
  1019ba:	83 c4 08             	add    $0x8,%esp
  1019bd:	89 f8                	mov    %edi,%eax
  1019bf:	0f b6 fc             	movzbl %ah,%edi
  1019c2:	57                   	push   %edi
  1019c3:	6a 42                	push   $0x42
  1019c5:	e8 a0 10 00 00       	call   102a6a <outb>

	tsc = t1 = t2 = rdtsc();
  1019ca:	e8 f1 0f 00 00       	call   1029c0 <rdtsc>
  1019cf:	89 44 24 30          	mov    %eax,0x30(%esp)
  1019d3:	89 54 24 34          	mov    %edx,0x34(%esp)

	pitcnt = 0;
	tscmax = 0;
	tscmin = ~(uint64_t) 0x0;
	while ((inb(0x61) & 0x20) == 0) {
  1019d7:	83 c4 10             	add    $0x10,%esp
	tsc = t1 = t2 = rdtsc();
  1019da:	89 44 24 18          	mov    %eax,0x18(%esp)
  1019de:	89 54 24 1c          	mov    %edx,0x1c(%esp)
	pitcnt = 0;
  1019e2:	bf 00 00 00 00       	mov    $0x0,%edi
	tscmax = 0;
  1019e7:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  1019ee:	00 
  1019ef:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  1019f6:	00 
	tscmin = ~(uint64_t) 0x0;
  1019f7:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
  1019fe:	ff 
  1019ff:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  101a06:	ff 
	while ((inb(0x61) & 0x20) == 0) {
  101a07:	eb 13                	jmp    101a1c <tsc_calibrate+0xb8>
		delta = t2 - tsc;
		tsc = t2;
		if (delta < tscmin)
			tscmin = delta;
		if (delta > tscmax)
			tscmax = delta;
  101a09:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  101a0d:	89 5c 24 14          	mov    %ebx,0x14(%esp)
		pitcnt++;
  101a11:	83 c7 01             	add    $0x1,%edi
		tsc = t2;
  101a14:	89 44 24 18          	mov    %eax,0x18(%esp)
  101a18:	89 54 24 1c          	mov    %edx,0x1c(%esp)
	while ((inb(0x61) & 0x20) == 0) {
  101a1c:	83 ec 0c             	sub    $0xc,%esp
  101a1f:	6a 61                	push   $0x61
  101a21:	89 f3                	mov    %esi,%ebx
  101a23:	e8 2a 10 00 00       	call   102a52 <inb>
  101a28:	83 c4 10             	add    $0x10,%esp
  101a2b:	a8 20                	test   $0x20,%al
  101a2d:	75 39                	jne    101a68 <tsc_calibrate+0x104>
		t2 = rdtsc();
  101a2f:	89 f3                	mov    %esi,%ebx
  101a31:	e8 8a 0f 00 00       	call   1029c0 <rdtsc>
		delta = t2 - tsc;
  101a36:	89 c1                	mov    %eax,%ecx
  101a38:	89 d3                	mov    %edx,%ebx
  101a3a:	2b 4c 24 18          	sub    0x18(%esp),%ecx
  101a3e:	1b 5c 24 1c          	sbb    0x1c(%esp),%ebx
		if (delta < tscmin)
  101a42:	39 5c 24 0c          	cmp    %ebx,0xc(%esp)
  101a46:	77 08                	ja     101a50 <tsc_calibrate+0xec>
  101a48:	72 0e                	jb     101a58 <tsc_calibrate+0xf4>
  101a4a:	39 4c 24 08          	cmp    %ecx,0x8(%esp)
  101a4e:	76 08                	jbe    101a58 <tsc_calibrate+0xf4>
			tscmin = delta;
  101a50:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  101a54:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
		if (delta > tscmax)
  101a58:	39 5c 24 14          	cmp    %ebx,0x14(%esp)
  101a5c:	72 ab                	jb     101a09 <tsc_calibrate+0xa5>
  101a5e:	77 b1                	ja     101a11 <tsc_calibrate+0xad>
  101a60:	39 4c 24 10          	cmp    %ecx,0x10(%esp)
  101a64:	73 ab                	jae    101a11 <tsc_calibrate+0xad>
  101a66:	eb a1                	jmp    101a09 <tsc_calibrate+0xa5>
	 * times, then we have been hit by a massive SMI
	 *
	 * If the maximum is 10 times larger than the minimum,
	 * then we got hit by an SMI as well.
	 */
	KERN_DEBUG("pitcnt=%u, tscmin=%llu, tscmax=%llu\n",
  101a68:	ff 74 24 14          	pushl  0x14(%esp)
  101a6c:	ff 74 24 14          	pushl  0x14(%esp)
  101a70:	ff 74 24 14          	pushl  0x14(%esp)
  101a74:	ff 74 24 14          	pushl  0x14(%esp)
  101a78:	57                   	push   %edi
  101a79:	8d 86 c8 a6 ff ff    	lea    -0x5938(%esi),%eax
  101a7f:	50                   	push   %eax
  101a80:	6a 3a                	push   $0x3a
  101a82:	8d 86 ed a6 ff ff    	lea    -0x5913(%esi),%eax
  101a88:	50                   	push   %eax
  101a89:	e8 aa 05 00 00       	call   102038 <debug_normal>
		   pitcnt, tscmin, tscmax);
	if (pitcnt < loopmin || tscmax > 10 * tscmin)
  101a8e:	83 c4 20             	add    $0x20,%esp
  101a91:	39 ef                	cmp    %ebp,%edi
  101a93:	7c 55                	jl     101aea <tsc_calibrate+0x186>
  101a95:	8b 7c 24 08          	mov    0x8(%esp),%edi
  101a99:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  101a9d:	6b cd 0a             	imul   $0xa,%ebp,%ecx
  101aa0:	b8 0a 00 00 00       	mov    $0xa,%eax
  101aa5:	f7 e7                	mul    %edi
  101aa7:	01 ca                	add    %ecx,%edx
  101aa9:	8b 7c 24 10          	mov    0x10(%esp),%edi
  101aad:	8b 6c 24 14          	mov    0x14(%esp),%ebp
  101ab1:	39 ea                	cmp    %ebp,%edx
  101ab3:	72 41                	jb     101af6 <tsc_calibrate+0x192>
  101ab5:	77 04                	ja     101abb <tsc_calibrate+0x157>
  101ab7:	39 f8                	cmp    %edi,%eax
  101ab9:	72 3b                	jb     101af6 <tsc_calibrate+0x192>
		return ~(uint64_t) 0x0;

	/* Calculate the PIT value */
	delta = t2 - t1;
  101abb:	8b 44 24 18          	mov    0x18(%esp),%eax
  101abf:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  101ac3:	2b 44 24 20          	sub    0x20(%esp),%eax
  101ac7:	1b 54 24 24          	sbb    0x24(%esp),%edx
	return delta / ms;
  101acb:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
  101acf:	bb 00 00 00 00       	mov    $0x0,%ebx
  101ad4:	53                   	push   %ebx
  101ad5:	51                   	push   %ecx
  101ad6:	52                   	push   %edx
  101ad7:	50                   	push   %eax
  101ad8:	89 f3                	mov    %esi,%ebx
  101ada:	e8 71 46 00 00       	call   106150 <__udivdi3>
  101adf:	83 c4 10             	add    $0x10,%esp
}
  101ae2:	83 c4 3c             	add    $0x3c,%esp
  101ae5:	5b                   	pop    %ebx
  101ae6:	5e                   	pop    %esi
  101ae7:	5f                   	pop    %edi
  101ae8:	5d                   	pop    %ebp
  101ae9:	c3                   	ret    
		return ~(uint64_t) 0x0;
  101aea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101aef:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  101af4:	eb ec                	jmp    101ae2 <tsc_calibrate+0x17e>
  101af6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101afb:	ba ff ff ff ff       	mov    $0xffffffff,%edx
  101b00:	eb e0                	jmp    101ae2 <tsc_calibrate+0x17e>

00101b02 <tsc_init>:

int
tsc_init(void)
{
  101b02:	55                   	push   %ebp
  101b03:	57                   	push   %edi
  101b04:	56                   	push   %esi
  101b05:	53                   	push   %ebx
  101b06:	83 ec 0c             	sub    $0xc,%esp
  101b09:	e8 01 e8 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  101b0e:	81 c3 f2 a4 00 00    	add    $0xa4f2,%ebx
	uint64_t ret;
	int i;

	timer_hw_init();
  101b14:	e8 13 fe ff ff       	call   10192c <timer_hw_init>

	tsc_per_ms = 0;
  101b19:	c7 c0 c0 ae 96 00    	mov    $0x96aec0,%eax
  101b1f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  101b25:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)

	/*
	 * XXX: If TSC calibration fails frequently, try to increase the
	 *      upperbound of loop condition, e.g. alternating 3 to 10.
	 */
	for (i = 0; i < 10; i++) {
  101b2c:	bd 00 00 00 00       	mov    $0x0,%ebp
  101b31:	83 fd 09             	cmp    $0x9,%ebp
  101b34:	7f 3e                	jg     101b74 <tsc_init+0x72>
		ret = tsc_calibrate(CAL_LATCH, CAL_MS, CAL_PIT_LOOPS);
  101b36:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
  101b3b:	ba 0a 00 00 00       	mov    $0xa,%edx
  101b40:	b8 9b 2e 00 00       	mov    $0x2e9b,%eax
  101b45:	e8 1a fe ff ff       	call   101964 <tsc_calibrate>
  101b4a:	89 c6                	mov    %eax,%esi
  101b4c:	89 d7                	mov    %edx,%edi
		if (ret != ~(uint64_t) 0x0)
  101b4e:	f7 d0                	not    %eax
  101b50:	f7 d2                	not    %edx
  101b52:	09 c2                	or     %eax,%edx
  101b54:	75 1e                	jne    101b74 <tsc_init+0x72>
			break;
		KERN_DEBUG("[%d] Retry to calibrate TSC.\n", i+1);
  101b56:	83 c5 01             	add    $0x1,%ebp
  101b59:	55                   	push   %ebp
  101b5a:	8d 83 fc a6 ff ff    	lea    -0x5904(%ebx),%eax
  101b60:	50                   	push   %eax
  101b61:	6a 55                	push   $0x55
  101b63:	8d 83 ed a6 ff ff    	lea    -0x5913(%ebx),%eax
  101b69:	50                   	push   %eax
  101b6a:	e8 c9 04 00 00       	call   102038 <debug_normal>
	for (i = 0; i < 10; i++) {
  101b6f:	83 c4 10             	add    $0x10,%esp
  101b72:	eb bd                	jmp    101b31 <tsc_init+0x2f>
	}

	if (ret == ~(uint64_t) 0x0) {
  101b74:	89 fa                	mov    %edi,%edx
  101b76:	f7 d2                	not    %edx
  101b78:	89 f0                	mov    %esi,%eax
  101b7a:	f7 d0                	not    %eax
  101b7c:	09 c2                	or     %eax,%edx
  101b7e:	74 50                	je     101bd0 <tsc_init+0xce>
		tsc_per_ms = 1000000;

		timer_hw_init();
		return 1;
	} else {
		tsc_per_ms = ret;
  101b80:	c7 c0 c0 ae 96 00    	mov    $0x96aec0,%eax
  101b86:	89 30                	mov    %esi,(%eax)
  101b88:	89 78 04             	mov    %edi,0x4(%eax)
		KERN_DEBUG("TSC freq = %llu Hz.\n", tsc_per_ms*1000);
  101b8b:	8b 38                	mov    (%eax),%edi
  101b8d:	8b 68 04             	mov    0x4(%eax),%ebp
  101b90:	83 ec 0c             	sub    $0xc,%esp
  101b93:	69 cd e8 03 00 00    	imul   $0x3e8,%ebp,%ecx
  101b99:	be e8 03 00 00       	mov    $0x3e8,%esi
  101b9e:	89 f8                	mov    %edi,%eax
  101ba0:	f7 e6                	mul    %esi
  101ba2:	01 ca                	add    %ecx,%edx
  101ba4:	52                   	push   %edx
  101ba5:	50                   	push   %eax
  101ba6:	8d 83 4d a7 ff ff    	lea    -0x58b3(%ebx),%eax
  101bac:	50                   	push   %eax
  101bad:	6a 61                	push   $0x61
  101baf:	8d 83 ed a6 ff ff    	lea    -0x5913(%ebx),%eax
  101bb5:	50                   	push   %eax
  101bb6:	e8 7d 04 00 00       	call   102038 <debug_normal>

		timer_hw_init();
  101bbb:	83 c4 20             	add    $0x20,%esp
  101bbe:	e8 69 fd ff ff       	call   10192c <timer_hw_init>
		return 0;
  101bc3:	b8 00 00 00 00       	mov    $0x0,%eax
	}
}
  101bc8:	83 c4 0c             	add    $0xc,%esp
  101bcb:	5b                   	pop    %ebx
  101bcc:	5e                   	pop    %esi
  101bcd:	5f                   	pop    %edi
  101bce:	5d                   	pop    %ebp
  101bcf:	c3                   	ret    
		KERN_DEBUG("TSC calibration failed.\n");
  101bd0:	83 ec 04             	sub    $0x4,%esp
  101bd3:	8d 83 1a a7 ff ff    	lea    -0x58e6(%ebx),%eax
  101bd9:	50                   	push   %eax
  101bda:	6a 59                	push   $0x59
  101bdc:	8d b3 ed a6 ff ff    	lea    -0x5913(%ebx),%esi
  101be2:	56                   	push   %esi
  101be3:	e8 50 04 00 00       	call   102038 <debug_normal>
		KERN_DEBUG("Assume TSC freq = 1 GHz.\n");
  101be8:	83 c4 0c             	add    $0xc,%esp
  101beb:	8d 83 33 a7 ff ff    	lea    -0x58cd(%ebx),%eax
  101bf1:	50                   	push   %eax
  101bf2:	6a 5a                	push   $0x5a
  101bf4:	56                   	push   %esi
  101bf5:	e8 3e 04 00 00       	call   102038 <debug_normal>
		tsc_per_ms = 1000000;
  101bfa:	c7 c0 c0 ae 96 00    	mov    $0x96aec0,%eax
  101c00:	c7 00 40 42 0f 00    	movl   $0xf4240,(%eax)
  101c06:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
		timer_hw_init();
  101c0d:	e8 1a fd ff ff       	call   10192c <timer_hw_init>
		return 1;
  101c12:	83 c4 10             	add    $0x10,%esp
  101c15:	b8 01 00 00 00       	mov    $0x1,%eax
  101c1a:	eb ac                	jmp    101bc8 <tsc_init+0xc6>

00101c1c <delay>:
/*
 * Wait for ms millisecond.
 */
void
delay(uint32_t ms)
{
  101c1c:	55                   	push   %ebp
  101c1d:	57                   	push   %edi
  101c1e:	56                   	push   %esi
  101c1f:	53                   	push   %ebx
  101c20:	83 ec 1c             	sub    $0x1c,%esp
  101c23:	e8 e7 e6 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  101c28:	81 c3 d8 a3 00 00    	add    $0xa3d8,%ebx
  101c2e:	8b 6c 24 30          	mov    0x30(%esp),%ebp
	volatile uint64_t ticks = tsc_per_ms * ms;
  101c32:	c7 c0 c0 ae 96 00    	mov    $0x96aec0,%eax
  101c38:	8b 30                	mov    (%eax),%esi
  101c3a:	8b 78 04             	mov    0x4(%eax),%edi
  101c3d:	89 f9                	mov    %edi,%ecx
  101c3f:	0f af cd             	imul   %ebp,%ecx
  101c42:	89 e8                	mov    %ebp,%eax
  101c44:	f7 e6                	mul    %esi
  101c46:	01 ca                	add    %ecx,%edx
  101c48:	89 44 24 08          	mov    %eax,0x8(%esp)
  101c4c:	89 54 24 0c          	mov    %edx,0xc(%esp)
	volatile uint64_t start = rdtsc();
  101c50:	e8 6b 0d 00 00       	call   1029c0 <rdtsc>
  101c55:	89 04 24             	mov    %eax,(%esp)
  101c58:	89 54 24 04          	mov    %edx,0x4(%esp)
	while (rdtsc() < start + ticks);
  101c5c:	e8 5f 0d 00 00       	call   1029c0 <rdtsc>
  101c61:	89 c5                	mov    %eax,%ebp
  101c63:	89 d1                	mov    %edx,%ecx
  101c65:	8b 04 24             	mov    (%esp),%eax
  101c68:	8b 54 24 04          	mov    0x4(%esp),%edx
  101c6c:	8b 74 24 08          	mov    0x8(%esp),%esi
  101c70:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  101c74:	01 f0                	add    %esi,%eax
  101c76:	11 fa                	adc    %edi,%edx
  101c78:	39 d1                	cmp    %edx,%ecx
  101c7a:	72 e0                	jb     101c5c <delay+0x40>
  101c7c:	77 04                	ja     101c82 <delay+0x66>
  101c7e:	39 c5                	cmp    %eax,%ebp
  101c80:	72 da                	jb     101c5c <delay+0x40>
}
  101c82:	83 c4 1c             	add    $0x1c,%esp
  101c85:	5b                   	pop    %ebx
  101c86:	5e                   	pop    %esi
  101c87:	5f                   	pop    %edi
  101c88:	5d                   	pop    %ebp
  101c89:	c3                   	ret    

00101c8a <udelay>:
/*
 * Wait for us microsecond.
 */
void
udelay(uint32_t us)
{
  101c8a:	55                   	push   %ebp
  101c8b:	57                   	push   %edi
  101c8c:	56                   	push   %esi
  101c8d:	53                   	push   %ebx
  101c8e:	83 ec 1c             	sub    $0x1c,%esp
  101c91:	e8 79 e6 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  101c96:	81 c3 6a a3 00 00    	add    $0xa36a,%ebx
  101c9c:	8b 74 24 30          	mov    0x30(%esp),%esi
    volatile uint64_t ticks = tsc_per_ms / 1000 * us;
  101ca0:	c7 c0 c0 ae 96 00    	mov    $0x96aec0,%eax
  101ca6:	8b 50 04             	mov    0x4(%eax),%edx
  101ca9:	8b 00                	mov    (%eax),%eax
  101cab:	6a 00                	push   $0x0
  101cad:	68 e8 03 00 00       	push   $0x3e8
  101cb2:	52                   	push   %edx
  101cb3:	50                   	push   %eax
  101cb4:	e8 97 44 00 00       	call   106150 <__udivdi3>
  101cb9:	83 c4 10             	add    $0x10,%esp
  101cbc:	89 d1                	mov    %edx,%ecx
  101cbe:	0f af ce             	imul   %esi,%ecx
  101cc1:	f7 e6                	mul    %esi
  101cc3:	01 ca                	add    %ecx,%edx
  101cc5:	89 44 24 08          	mov    %eax,0x8(%esp)
  101cc9:	89 54 24 0c          	mov    %edx,0xc(%esp)
    volatile uint64_t start = rdtsc();
  101ccd:	e8 ee 0c 00 00       	call   1029c0 <rdtsc>
  101cd2:	89 04 24             	mov    %eax,(%esp)
  101cd5:	89 54 24 04          	mov    %edx,0x4(%esp)
    while (rdtsc() < start + ticks);
  101cd9:	e8 e2 0c 00 00       	call   1029c0 <rdtsc>
  101cde:	89 c5                	mov    %eax,%ebp
  101ce0:	89 d1                	mov    %edx,%ecx
  101ce2:	8b 04 24             	mov    (%esp),%eax
  101ce5:	8b 54 24 04          	mov    0x4(%esp),%edx
  101ce9:	8b 74 24 08          	mov    0x8(%esp),%esi
  101ced:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  101cf1:	01 f0                	add    %esi,%eax
  101cf3:	11 fa                	adc    %edi,%edx
  101cf5:	39 d1                	cmp    %edx,%ecx
  101cf7:	72 e0                	jb     101cd9 <udelay+0x4f>
  101cf9:	77 04                	ja     101cff <udelay+0x75>
  101cfb:	39 c5                	cmp    %eax,%ebp
  101cfd:	72 da                	jb     101cd9 <udelay+0x4f>
}
  101cff:	83 c4 1c             	add    $0x1c,%esp
  101d02:	5b                   	pop    %ebx
  101d03:	5e                   	pop    %esi
  101d04:	5f                   	pop    %edi
  101d05:	5d                   	pop    %ebp
  101d06:	c3                   	ret    
  101d07:	66 90                	xchg   %ax,%ax
  101d09:	66 90                	xchg   %ax,%ax
  101d0b:	66 90                	xchg   %ax,%ax
  101d0d:	66 90                	xchg   %ax,%ax
  101d0f:	90                   	nop

00101d10 <Xdivide>:
	jmp _alltraps

.text

/* exceptions  */
TRAPHANDLER_NOEC(Xdivide,	T_DIVIDE)
  101d10:	6a 00                	push   $0x0
  101d12:	6a 00                	push   $0x0
  101d14:	e9 17 01 00 00       	jmp    101e30 <_alltraps>
  101d19:	90                   	nop

00101d1a <Xdebug>:
TRAPHANDLER_NOEC(Xdebug,	T_DEBUG)
  101d1a:	6a 00                	push   $0x0
  101d1c:	6a 01                	push   $0x1
  101d1e:	e9 0d 01 00 00       	jmp    101e30 <_alltraps>
  101d23:	90                   	nop

00101d24 <Xnmi>:
TRAPHANDLER_NOEC(Xnmi,		T_NMI)
  101d24:	6a 00                	push   $0x0
  101d26:	6a 02                	push   $0x2
  101d28:	e9 03 01 00 00       	jmp    101e30 <_alltraps>
  101d2d:	90                   	nop

00101d2e <Xbrkpt>:
TRAPHANDLER_NOEC(Xbrkpt,	T_BRKPT)
  101d2e:	6a 00                	push   $0x0
  101d30:	6a 03                	push   $0x3
  101d32:	e9 f9 00 00 00       	jmp    101e30 <_alltraps>
  101d37:	90                   	nop

00101d38 <Xoflow>:
TRAPHANDLER_NOEC(Xoflow,	T_OFLOW)
  101d38:	6a 00                	push   $0x0
  101d3a:	6a 04                	push   $0x4
  101d3c:	e9 ef 00 00 00       	jmp    101e30 <_alltraps>
  101d41:	90                   	nop

00101d42 <Xbound>:
TRAPHANDLER_NOEC(Xbound,	T_BOUND)
  101d42:	6a 00                	push   $0x0
  101d44:	6a 05                	push   $0x5
  101d46:	e9 e5 00 00 00       	jmp    101e30 <_alltraps>
  101d4b:	90                   	nop

00101d4c <Xillop>:
TRAPHANDLER_NOEC(Xillop,	T_ILLOP)
  101d4c:	6a 00                	push   $0x0
  101d4e:	6a 06                	push   $0x6
  101d50:	e9 db 00 00 00       	jmp    101e30 <_alltraps>
  101d55:	90                   	nop

00101d56 <Xdevice>:
TRAPHANDLER_NOEC(Xdevice,	T_DEVICE)
  101d56:	6a 00                	push   $0x0
  101d58:	6a 07                	push   $0x7
  101d5a:	e9 d1 00 00 00       	jmp    101e30 <_alltraps>
  101d5f:	90                   	nop

00101d60 <Xdblflt>:
TRAPHANDLER     (Xdblflt,	T_DBLFLT)
  101d60:	6a 08                	push   $0x8
  101d62:	e9 c9 00 00 00       	jmp    101e30 <_alltraps>
  101d67:	90                   	nop

00101d68 <Xcoproc>:
TRAPHANDLER_NOEC(Xcoproc,	T_COPROC)
  101d68:	6a 00                	push   $0x0
  101d6a:	6a 09                	push   $0x9
  101d6c:	e9 bf 00 00 00       	jmp    101e30 <_alltraps>
  101d71:	90                   	nop

00101d72 <Xtss>:
TRAPHANDLER     (Xtss,		T_TSS)
  101d72:	6a 0a                	push   $0xa
  101d74:	e9 b7 00 00 00       	jmp    101e30 <_alltraps>
  101d79:	90                   	nop

00101d7a <Xsegnp>:
TRAPHANDLER     (Xsegnp,	T_SEGNP)
  101d7a:	6a 0b                	push   $0xb
  101d7c:	e9 af 00 00 00       	jmp    101e30 <_alltraps>
  101d81:	90                   	nop

00101d82 <Xstack>:
TRAPHANDLER     (Xstack,	T_STACK)
  101d82:	6a 0c                	push   $0xc
  101d84:	e9 a7 00 00 00       	jmp    101e30 <_alltraps>
  101d89:	90                   	nop

00101d8a <Xgpflt>:
TRAPHANDLER     (Xgpflt,	T_GPFLT)
  101d8a:	6a 0d                	push   $0xd
  101d8c:	e9 9f 00 00 00       	jmp    101e30 <_alltraps>
  101d91:	90                   	nop

00101d92 <Xpgflt>:
TRAPHANDLER     (Xpgflt,	T_PGFLT)
  101d92:	6a 0e                	push   $0xe
  101d94:	e9 97 00 00 00       	jmp    101e30 <_alltraps>
  101d99:	90                   	nop

00101d9a <Xres>:
TRAPHANDLER_NOEC(Xres,		T_RES)
  101d9a:	6a 00                	push   $0x0
  101d9c:	6a 0f                	push   $0xf
  101d9e:	e9 8d 00 00 00       	jmp    101e30 <_alltraps>
  101da3:	90                   	nop

00101da4 <Xfperr>:
TRAPHANDLER_NOEC(Xfperr,	T_FPERR)
  101da4:	6a 00                	push   $0x0
  101da6:	6a 10                	push   $0x10
  101da8:	e9 83 00 00 00       	jmp    101e30 <_alltraps>
  101dad:	90                   	nop

00101dae <Xalign>:
TRAPHANDLER     (Xalign,	T_ALIGN)
  101dae:	6a 11                	push   $0x11
  101db0:	eb 7e                	jmp    101e30 <_alltraps>

00101db2 <Xmchk>:
TRAPHANDLER_NOEC(Xmchk,		T_MCHK)
  101db2:	6a 00                	push   $0x0
  101db4:	6a 12                	push   $0x12
  101db6:	eb 78                	jmp    101e30 <_alltraps>

00101db8 <Xirq_timer>:

/* ISA interrupts  */
TRAPHANDLER_NOEC(Xirq_timer,	T_IRQ0 + IRQ_TIMER)
  101db8:	6a 00                	push   $0x0
  101dba:	6a 20                	push   $0x20
  101dbc:	eb 72                	jmp    101e30 <_alltraps>

00101dbe <Xirq_kbd>:
TRAPHANDLER_NOEC(Xirq_kbd,	T_IRQ0 + IRQ_KBD)
  101dbe:	6a 00                	push   $0x0
  101dc0:	6a 21                	push   $0x21
  101dc2:	eb 6c                	jmp    101e30 <_alltraps>

00101dc4 <Xirq_slave>:
TRAPHANDLER_NOEC(Xirq_slave,	T_IRQ0 + IRQ_SLAVE)
  101dc4:	6a 00                	push   $0x0
  101dc6:	6a 22                	push   $0x22
  101dc8:	eb 66                	jmp    101e30 <_alltraps>

00101dca <Xirq_serial2>:
TRAPHANDLER_NOEC(Xirq_serial2,	T_IRQ0 + IRQ_SERIAL24)
  101dca:	6a 00                	push   $0x0
  101dcc:	6a 23                	push   $0x23
  101dce:	eb 60                	jmp    101e30 <_alltraps>

00101dd0 <Xirq_serial1>:
TRAPHANDLER_NOEC(Xirq_serial1,	T_IRQ0 + IRQ_SERIAL13)
  101dd0:	6a 00                	push   $0x0
  101dd2:	6a 24                	push   $0x24
  101dd4:	eb 5a                	jmp    101e30 <_alltraps>

00101dd6 <Xirq_lpt>:
TRAPHANDLER_NOEC(Xirq_lpt,	T_IRQ0 + IRQ_LPT2)
  101dd6:	6a 00                	push   $0x0
  101dd8:	6a 25                	push   $0x25
  101dda:	eb 54                	jmp    101e30 <_alltraps>

00101ddc <Xirq_floppy>:
TRAPHANDLER_NOEC(Xirq_floppy,	T_IRQ0 + IRQ_FLOPPY)
  101ddc:	6a 00                	push   $0x0
  101dde:	6a 26                	push   $0x26
  101de0:	eb 4e                	jmp    101e30 <_alltraps>

00101de2 <Xirq_spurious>:
TRAPHANDLER_NOEC(Xirq_spurious,	T_IRQ0 + IRQ_SPURIOUS)
  101de2:	6a 00                	push   $0x0
  101de4:	6a 27                	push   $0x27
  101de6:	eb 48                	jmp    101e30 <_alltraps>

00101de8 <Xirq_rtc>:
TRAPHANDLER_NOEC(Xirq_rtc,	T_IRQ0 + IRQ_RTC)
  101de8:	6a 00                	push   $0x0
  101dea:	6a 28                	push   $0x28
  101dec:	eb 42                	jmp    101e30 <_alltraps>

00101dee <Xirq9>:
TRAPHANDLER_NOEC(Xirq9,		T_IRQ0 + 9)
  101dee:	6a 00                	push   $0x0
  101df0:	6a 29                	push   $0x29
  101df2:	eb 3c                	jmp    101e30 <_alltraps>

00101df4 <Xirq10>:
TRAPHANDLER_NOEC(Xirq10,	T_IRQ0 + 10)
  101df4:	6a 00                	push   $0x0
  101df6:	6a 2a                	push   $0x2a
  101df8:	eb 36                	jmp    101e30 <_alltraps>

00101dfa <Xirq11>:
TRAPHANDLER_NOEC(Xirq11,	T_IRQ0 + 11)
  101dfa:	6a 00                	push   $0x0
  101dfc:	6a 2b                	push   $0x2b
  101dfe:	eb 30                	jmp    101e30 <_alltraps>

00101e00 <Xirq_mouse>:
TRAPHANDLER_NOEC(Xirq_mouse,	T_IRQ0 + IRQ_MOUSE)
  101e00:	6a 00                	push   $0x0
  101e02:	6a 2c                	push   $0x2c
  101e04:	eb 2a                	jmp    101e30 <_alltraps>

00101e06 <Xirq_coproc>:
TRAPHANDLER_NOEC(Xirq_coproc,	T_IRQ0 + IRQ_COPROCESSOR)
  101e06:	6a 00                	push   $0x0
  101e08:	6a 2d                	push   $0x2d
  101e0a:	eb 24                	jmp    101e30 <_alltraps>

00101e0c <Xirq_ide1>:
TRAPHANDLER_NOEC(Xirq_ide1,	T_IRQ0 + IRQ_IDE1)
  101e0c:	6a 00                	push   $0x0
  101e0e:	6a 2e                	push   $0x2e
  101e10:	eb 1e                	jmp    101e30 <_alltraps>

00101e12 <Xirq_ide2>:
TRAPHANDLER_NOEC(Xirq_ide2,	T_IRQ0 + IRQ_IDE2)
  101e12:	6a 00                	push   $0x0
  101e14:	6a 2f                	push   $0x2f
  101e16:	eb 18                	jmp    101e30 <_alltraps>

00101e18 <Xsyscall>:

/* syscall */
TRAPHANDLER_NOEC(Xsyscall,	T_SYSCALL)
  101e18:	6a 00                	push   $0x0
  101e1a:	6a 30                	push   $0x30
  101e1c:	eb 12                	jmp    101e30 <_alltraps>

00101e1e <Xdefault>:

/* default */
TRAPHANDLER     (Xdefault,	T_DEFAULT)
  101e1e:	68 fe 00 00 00       	push   $0xfe
  101e23:	eb 0b                	jmp    101e30 <_alltraps>
  101e25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101e30 <_alltraps>:

.globl	_alltraps
.type	_alltraps,@function
.p2align 4, 0x90		/* 16-byte alignment, nop filled */
_alltraps:
	cli			# make sure there is no nested trap
  101e30:	fa                   	cli    

	cld
  101e31:	fc                   	cld    

	# -------------
	# build context
	# -------------
	
	pushl %ds		
  101e32:	1e                   	push   %ds
	pushl %es
  101e33:	06                   	push   %es
	pushal
  101e34:	60                   	pusha  

	# -------------

	movl $CPU_GDT_KDATA,%eax # load kernel's data segment
  101e35:	b8 10 00 00 00       	mov    $0x10,%eax
	movw %ax,%ds
  101e3a:	8e d8                	mov    %eax,%ds
	movw %ax,%es
  101e3c:	8e c0                	mov    %eax,%es

	pushl %esp		# pass pointer to this trapframe
  101e3e:	54                   	push   %esp
	call trap		# and call trap (does not return)
  101e3f:	e8 ec 42 00 00       	call   106130 <trap>

1:	hlt			# should never get here; just spin...
  101e44:	f4                   	hlt    
  101e45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  101e49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00101e50 <trap_return>:
.globl	trap_return
.type	trap_return,@function
.p2align 4, 0x90		/* 16-byte alignment, nop filled */
trap_return:
	/* TODO */
	movl 4(%esp), %esp
  101e50:	8b 64 24 04          	mov    0x4(%esp),%esp
	popal
  101e54:	61                   	popa   
	popl %es 
  101e55:	07                   	pop    %es
	popl %ds 
  101e56:	1f                   	pop    %ds
	addl $8, %esp
  101e57:	83 c4 08             	add    $0x8,%esp

  101e5a:	c3                   	ret    

00101e5b <memset>:
#include "string.h"
#include "types.h"

void *
memset(void *v, int c, size_t n)
{
  101e5b:	57                   	push   %edi
  101e5c:	53                   	push   %ebx
  101e5d:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  101e61:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    if (n == 0)
  101e65:	85 c9                	test   %ecx,%ecx
  101e67:	74 14                	je     101e7d <memset+0x22>
        return v;
    if ((int)v%4 == 0 && n%4 == 0) {
  101e69:	f7 c7 03 00 00 00    	test   $0x3,%edi
  101e6f:	75 05                	jne    101e76 <memset+0x1b>
  101e71:	f6 c1 03             	test   $0x3,%cl
  101e74:	74 0c                	je     101e82 <memset+0x27>
        c = (c<<24)|(c<<16)|(c<<8)|c;
        asm volatile("cld; rep stosl\n"
                 :: "D" (v), "a" (c), "c" (n/4)
                 : "cc", "memory");
    } else
        asm volatile("cld; rep stosb\n"
  101e76:	8b 44 24 10          	mov    0x10(%esp),%eax
  101e7a:	fc                   	cld    
  101e7b:	f3 aa                	rep stos %al,%es:(%edi)
                 :: "D" (v), "a" (c), "c" (n)
                 : "cc", "memory");
    return v;
}
  101e7d:	89 f8                	mov    %edi,%eax
  101e7f:	5b                   	pop    %ebx
  101e80:	5f                   	pop    %edi
  101e81:	c3                   	ret    
        c &= 0xFF;
  101e82:	0f b6 44 24 10       	movzbl 0x10(%esp),%eax
        c = (c<<24)|(c<<16)|(c<<8)|c;
  101e87:	89 c2                	mov    %eax,%edx
  101e89:	c1 e2 18             	shl    $0x18,%edx
  101e8c:	89 c3                	mov    %eax,%ebx
  101e8e:	c1 e3 10             	shl    $0x10,%ebx
  101e91:	09 da                	or     %ebx,%edx
  101e93:	89 c3                	mov    %eax,%ebx
  101e95:	c1 e3 08             	shl    $0x8,%ebx
  101e98:	09 da                	or     %ebx,%edx
  101e9a:	09 d0                	or     %edx,%eax
                 :: "D" (v), "a" (c), "c" (n/4)
  101e9c:	c1 e9 02             	shr    $0x2,%ecx
        asm volatile("cld; rep stosl\n"
  101e9f:	fc                   	cld    
  101ea0:	f3 ab                	rep stos %eax,%es:(%edi)
  101ea2:	eb d9                	jmp    101e7d <memset+0x22>

00101ea4 <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
  101ea4:	57                   	push   %edi
  101ea5:	56                   	push   %esi
  101ea6:	8b 44 24 0c          	mov    0xc(%esp),%eax
  101eaa:	8b 74 24 10          	mov    0x10(%esp),%esi
  101eae:	8b 4c 24 14          	mov    0x14(%esp),%ecx
    const char *s;
    char *d;

    s = src;
    d = dst;
    if (s < d && s + n > d) {
  101eb2:	39 c6                	cmp    %eax,%esi
  101eb4:	73 36                	jae    101eec <memmove+0x48>
  101eb6:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  101eb9:	39 c2                	cmp    %eax,%edx
  101ebb:	76 2f                	jbe    101eec <memmove+0x48>
        s += n;
        d += n;
  101ebd:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
        if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
  101ec0:	f6 c2 03             	test   $0x3,%dl
  101ec3:	75 1b                	jne    101ee0 <memmove+0x3c>
  101ec5:	f7 c7 03 00 00 00    	test   $0x3,%edi
  101ecb:	75 13                	jne    101ee0 <memmove+0x3c>
  101ecd:	f6 c1 03             	test   $0x3,%cl
  101ed0:	75 0e                	jne    101ee0 <memmove+0x3c>
            asm volatile("std; rep movsl\n"
                     :: "D" (d-4), "S" (s-4), "c" (n/4)
  101ed2:	83 ef 04             	sub    $0x4,%edi
  101ed5:	8d 72 fc             	lea    -0x4(%edx),%esi
  101ed8:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile("std; rep movsl\n"
  101edb:	fd                   	std    
  101edc:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101ede:	eb 09                	jmp    101ee9 <memmove+0x45>
                     : "cc", "memory");
        else
            asm volatile("std; rep movsb\n"
                     :: "D" (d-1), "S" (s-1), "c" (n)
  101ee0:	83 ef 01             	sub    $0x1,%edi
  101ee3:	8d 72 ff             	lea    -0x1(%edx),%esi
            asm volatile("std; rep movsb\n"
  101ee6:	fd                   	std    
  101ee7:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                     : "cc", "memory");
        // Some versions of GCC rely on DF being clear
        asm volatile("cld" ::: "cc");
  101ee9:	fc                   	cld    
  101eea:	eb 16                	jmp    101f02 <memmove+0x5e>
    } else {
        if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
  101eec:	f7 c6 03 00 00 00    	test   $0x3,%esi
  101ef2:	75 09                	jne    101efd <memmove+0x59>
  101ef4:	a8 03                	test   $0x3,%al
  101ef6:	75 05                	jne    101efd <memmove+0x59>
  101ef8:	f6 c1 03             	test   $0x3,%cl
  101efb:	74 08                	je     101f05 <memmove+0x61>
            asm volatile("cld; rep movsl\n"
                     :: "D" (d), "S" (s), "c" (n/4)
                     : "cc", "memory");
        else
            asm volatile("cld; rep movsb\n"
  101efd:	89 c7                	mov    %eax,%edi
  101eff:	fc                   	cld    
  101f00:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
                     :: "D" (d), "S" (s), "c" (n)
                     : "cc", "memory");
    }
    return dst;
}
  101f02:	5e                   	pop    %esi
  101f03:	5f                   	pop    %edi
  101f04:	c3                   	ret    
                     :: "D" (d), "S" (s), "c" (n/4)
  101f05:	c1 e9 02             	shr    $0x2,%ecx
            asm volatile("cld; rep movsl\n"
  101f08:	89 c7                	mov    %eax,%edi
  101f0a:	fc                   	cld    
  101f0b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  101f0d:	eb f3                	jmp    101f02 <memmove+0x5e>

00101f0f <memcpy>:

void *
memcpy(void *dst, const void *src, size_t n)
{
	return memmove(dst, src, n);
  101f0f:	ff 74 24 0c          	pushl  0xc(%esp)
  101f13:	ff 74 24 0c          	pushl  0xc(%esp)
  101f17:	ff 74 24 0c          	pushl  0xc(%esp)
  101f1b:	e8 84 ff ff ff       	call   101ea4 <memmove>
  101f20:	83 c4 0c             	add    $0xc,%esp
}
  101f23:	c3                   	ret    

00101f24 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
  101f24:	53                   	push   %ebx
  101f25:	8b 54 24 08          	mov    0x8(%esp),%edx
  101f29:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
  101f2d:	8b 44 24 10          	mov    0x10(%esp),%eax
	while (n > 0 && *p && *p == *q)
  101f31:	eb 09                	jmp    101f3c <strncmp+0x18>
		n--, p++, q++;
  101f33:	83 e8 01             	sub    $0x1,%eax
  101f36:	83 c2 01             	add    $0x1,%edx
  101f39:	83 c1 01             	add    $0x1,%ecx
	while (n > 0 && *p && *p == *q)
  101f3c:	85 c0                	test   %eax,%eax
  101f3e:	74 0b                	je     101f4b <strncmp+0x27>
  101f40:	0f b6 1a             	movzbl (%edx),%ebx
  101f43:	84 db                	test   %bl,%bl
  101f45:	74 04                	je     101f4b <strncmp+0x27>
  101f47:	3a 19                	cmp    (%ecx),%bl
  101f49:	74 e8                	je     101f33 <strncmp+0xf>
	if (n == 0)
  101f4b:	85 c0                	test   %eax,%eax
  101f4d:	74 0a                	je     101f59 <strncmp+0x35>
		return 0;
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
  101f4f:	0f b6 02             	movzbl (%edx),%eax
  101f52:	0f b6 11             	movzbl (%ecx),%edx
  101f55:	29 d0                	sub    %edx,%eax
}
  101f57:	5b                   	pop    %ebx
  101f58:	c3                   	ret    
		return 0;
  101f59:	b8 00 00 00 00       	mov    $0x0,%eax
  101f5e:	eb f7                	jmp    101f57 <strncmp+0x33>

00101f60 <strnlen>:

int
strnlen(const char *s, size_t size)
{
  101f60:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  101f64:	8b 54 24 08          	mov    0x8(%esp),%edx
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  101f68:	b8 00 00 00 00       	mov    $0x0,%eax
  101f6d:	eb 09                	jmp    101f78 <strnlen+0x18>
		n++;
  101f6f:	83 c0 01             	add    $0x1,%eax
	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  101f72:	83 c1 01             	add    $0x1,%ecx
  101f75:	83 ea 01             	sub    $0x1,%edx
  101f78:	85 d2                	test   %edx,%edx
  101f7a:	74 05                	je     101f81 <strnlen+0x21>
  101f7c:	80 39 00             	cmpb   $0x0,(%ecx)
  101f7f:	75 ee                	jne    101f6f <strnlen+0xf>
	return n;
}
  101f81:	f3 c3                	repz ret 

00101f83 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  101f83:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  101f87:	8b 54 24 08          	mov    0x8(%esp),%edx
  while (*p && *p == *q)
  101f8b:	eb 06                	jmp    101f93 <strcmp+0x10>
    p++, q++;
  101f8d:	83 c1 01             	add    $0x1,%ecx
  101f90:	83 c2 01             	add    $0x1,%edx
  while (*p && *p == *q)
  101f93:	0f b6 01             	movzbl (%ecx),%eax
  101f96:	84 c0                	test   %al,%al
  101f98:	74 04                	je     101f9e <strcmp+0x1b>
  101f9a:	3a 02                	cmp    (%edx),%al
  101f9c:	74 ef                	je     101f8d <strcmp+0xa>
  return (int) ((unsigned char) *p - (unsigned char) *q);
  101f9e:	0f b6 c0             	movzbl %al,%eax
  101fa1:	0f b6 12             	movzbl (%edx),%edx
  101fa4:	29 d0                	sub    %edx,%eax
}
  101fa6:	c3                   	ret    

00101fa7 <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
  101fa7:	8b 44 24 04          	mov    0x4(%esp),%eax
  101fab:	0f b6 4c 24 08       	movzbl 0x8(%esp),%ecx
  for (; *s; s++)
  101fb0:	0f b6 10             	movzbl (%eax),%edx
  101fb3:	84 d2                	test   %dl,%dl
  101fb5:	74 09                	je     101fc0 <strchr+0x19>
    if (*s == c)
  101fb7:	38 ca                	cmp    %cl,%dl
  101fb9:	74 0a                	je     101fc5 <strchr+0x1e>
  for (; *s; s++)
  101fbb:	83 c0 01             	add    $0x1,%eax
  101fbe:	eb f0                	jmp    101fb0 <strchr+0x9>
      return (char *) s;
  return 0;
  101fc0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101fc5:	f3 c3                	repz ret 

00101fc7 <memzero>:

void *
memzero(void *v, size_t n)
{
	return memset(v, 0, n);
  101fc7:	ff 74 24 08          	pushl  0x8(%esp)
  101fcb:	6a 00                	push   $0x0
  101fcd:	ff 74 24 0c          	pushl  0xc(%esp)
  101fd1:	e8 85 fe ff ff       	call   101e5b <memset>
  101fd6:	83 c4 0c             	add    $0xc,%esp
}
  101fd9:	c3                   	ret    

00101fda <debug_trace>:

#define DEBUG_TRACEFRAMES	10

static void
debug_trace(uintptr_t ebp, uintptr_t *eips)
{
  101fda:	56                   	push   %esi
  101fdb:	53                   	push   %ebx
  101fdc:	89 d6                	mov    %edx,%esi
	int i;
	uintptr_t *frame = (uintptr_t *) ebp;

	for (i = 0; i < DEBUG_TRACEFRAMES && frame; i++) {
  101fde:	b9 00 00 00 00       	mov    $0x0,%ecx
  101fe3:	eb 0b                	jmp    101ff0 <debug_trace+0x16>
		eips[i] = frame[1];		/* saved %eip */
  101fe5:	8b 50 04             	mov    0x4(%eax),%edx
  101fe8:	89 14 8e             	mov    %edx,(%esi,%ecx,4)
		frame = (uintptr_t *) frame[0];	/* saved %ebp */
  101feb:	8b 00                	mov    (%eax),%eax
	for (i = 0; i < DEBUG_TRACEFRAMES && frame; i++) {
  101fed:	83 c1 01             	add    $0x1,%ecx
  101ff0:	83 f9 09             	cmp    $0x9,%ecx
  101ff3:	0f 9e c3             	setle  %bl
  101ff6:	85 c0                	test   %eax,%eax
  101ff8:	0f 95 c2             	setne  %dl
  101ffb:	84 da                	test   %bl,%dl
  101ffd:	75 e6                	jne    101fe5 <debug_trace+0xb>
  101fff:	eb 0a                	jmp    10200b <debug_trace+0x31>
	}
	for (; i < DEBUG_TRACEFRAMES; i++)
		eips[i] = 0;
  102001:	c7 04 8e 00 00 00 00 	movl   $0x0,(%esi,%ecx,4)
	for (; i < DEBUG_TRACEFRAMES; i++)
  102008:	83 c1 01             	add    $0x1,%ecx
  10200b:	83 f9 09             	cmp    $0x9,%ecx
  10200e:	7e f1                	jle    102001 <debug_trace+0x27>
}
  102010:	5b                   	pop    %ebx
  102011:	5e                   	pop    %esi
  102012:	c3                   	ret    

00102013 <debug_info>:
{
  102013:	53                   	push   %ebx
  102014:	83 ec 08             	sub    $0x8,%esp
  102017:	e8 f3 e2 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10201c:	81 c3 e4 9f 00 00    	add    $0x9fe4,%ebx
	va_start(ap, fmt);
  102022:	8d 44 24 14          	lea    0x14(%esp),%eax
	vdprintf(fmt, ap);
  102026:	83 ec 08             	sub    $0x8,%esp
  102029:	50                   	push   %eax
  10202a:	ff 74 24 1c          	pushl  0x1c(%esp)
  10202e:	e8 72 01 00 00       	call   1021a5 <vdprintf>
}
  102033:	83 c4 18             	add    $0x18,%esp
  102036:	5b                   	pop    %ebx
  102037:	c3                   	ret    

00102038 <debug_normal>:
{
  102038:	53                   	push   %ebx
  102039:	83 ec 0c             	sub    $0xc,%esp
  10203c:	e8 ce e2 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  102041:	81 c3 bf 9f 00 00    	add    $0x9fbf,%ebx
	dprintf("[D] %s:%d: ", file, line);
  102047:	ff 74 24 18          	pushl  0x18(%esp)
  10204b:	ff 74 24 18          	pushl  0x18(%esp)
  10204f:	8d 83 62 a7 ff ff    	lea    -0x589e(%ebx),%eax
  102055:	50                   	push   %eax
  102056:	e8 a9 01 00 00       	call   102204 <dprintf>
	va_start(ap, fmt);
  10205b:	8d 44 24 2c          	lea    0x2c(%esp),%eax
	vdprintf(fmt, ap);
  10205f:	83 c4 08             	add    $0x8,%esp
  102062:	50                   	push   %eax
  102063:	ff 74 24 24          	pushl  0x24(%esp)
  102067:	e8 39 01 00 00       	call   1021a5 <vdprintf>
}
  10206c:	83 c4 18             	add    $0x18,%esp
  10206f:	5b                   	pop    %ebx
  102070:	c3                   	ret    

00102071 <debug_panic>:

gcc_noinline void
debug_panic(const char *file, int line, const char *fmt,...)
{
  102071:	56                   	push   %esi
  102072:	53                   	push   %ebx
  102073:	83 ec 38             	sub    $0x38,%esp
  102076:	e8 94 e2 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10207b:	81 c3 85 9f 00 00    	add    $0x9f85,%ebx
	int i;
	uintptr_t eips[DEBUG_TRACEFRAMES];
	va_list ap;

	dprintf("[P] %s:%d: ", file, line);
  102081:	ff 74 24 48          	pushl  0x48(%esp)
  102085:	ff 74 24 48          	pushl  0x48(%esp)
  102089:	8d 83 6e a7 ff ff    	lea    -0x5892(%ebx),%eax
  10208f:	50                   	push   %eax
  102090:	e8 6f 01 00 00       	call   102204 <dprintf>

	va_start(ap, fmt);
  102095:	8d 44 24 5c          	lea    0x5c(%esp),%eax
	vdprintf(fmt, ap);
  102099:	83 c4 08             	add    $0x8,%esp
  10209c:	50                   	push   %eax
  10209d:	ff 74 24 54          	pushl  0x54(%esp)
  1020a1:	e8 ff 00 00 00       	call   1021a5 <vdprintf>

static inline uint32_t __attribute__((always_inline))
read_ebp(void)
{
	uint32_t ebp;
	__asm __volatile("movl %%ebp,%0" : "=rm" (ebp));
  1020a6:	89 e8                	mov    %ebp,%eax
	va_end(ap);

	debug_trace(read_ebp(), eips);
  1020a8:	8d 54 24 18          	lea    0x18(%esp),%edx
  1020ac:	e8 29 ff ff ff       	call   101fda <debug_trace>
	for (i = 0; i < DEBUG_TRACEFRAMES && eips[i] != 0; i++)
  1020b1:	83 c4 10             	add    $0x10,%esp
  1020b4:	be 00 00 00 00       	mov    $0x0,%esi
  1020b9:	eb 16                	jmp    1020d1 <debug_panic+0x60>
		dprintf("\tfrom 0x%08x\n", eips[i]);
  1020bb:	83 ec 08             	sub    $0x8,%esp
  1020be:	50                   	push   %eax
  1020bf:	8d 83 7a a7 ff ff    	lea    -0x5886(%ebx),%eax
  1020c5:	50                   	push   %eax
  1020c6:	e8 39 01 00 00       	call   102204 <dprintf>
	for (i = 0; i < DEBUG_TRACEFRAMES && eips[i] != 0; i++)
  1020cb:	83 c6 01             	add    $0x1,%esi
  1020ce:	83 c4 10             	add    $0x10,%esp
  1020d1:	83 fe 09             	cmp    $0x9,%esi
  1020d4:	7f 08                	jg     1020de <debug_panic+0x6d>
  1020d6:	8b 44 b4 08          	mov    0x8(%esp,%esi,4),%eax
  1020da:	85 c0                	test   %eax,%eax
  1020dc:	75 dd                	jne    1020bb <debug_panic+0x4a>

	dprintf("Kernel Panic !!!\n");
  1020de:	83 ec 0c             	sub    $0xc,%esp
  1020e1:	8d 83 88 a7 ff ff    	lea    -0x5878(%ebx),%eax
  1020e7:	50                   	push   %eax
  1020e8:	e8 17 01 00 00       	call   102204 <dprintf>

	//intr_local_disable();
	halt();
  1020ed:	e8 cc 08 00 00       	call   1029be <halt>
}
  1020f2:	83 c4 44             	add    $0x44,%esp
  1020f5:	5b                   	pop    %ebx
  1020f6:	5e                   	pop    %esi
  1020f7:	c3                   	ret    

001020f8 <debug_warn>:

void
debug_warn(const char *file, int line, const char *fmt,...)
{
  1020f8:	53                   	push   %ebx
  1020f9:	83 ec 0c             	sub    $0xc,%esp
  1020fc:	e8 0e e2 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  102101:	81 c3 ff 9e 00 00    	add    $0x9eff,%ebx
	dprintf("[W] %s:%d: ", file, line);
  102107:	ff 74 24 18          	pushl  0x18(%esp)
  10210b:	ff 74 24 18          	pushl  0x18(%esp)
  10210f:	8d 83 9a a7 ff ff    	lea    -0x5866(%ebx),%eax
  102115:	50                   	push   %eax
  102116:	e8 e9 00 00 00       	call   102204 <dprintf>

	va_list ap;
	va_start(ap, fmt);
  10211b:	8d 44 24 2c          	lea    0x2c(%esp),%eax
	vdprintf(fmt, ap);
  10211f:	83 c4 08             	add    $0x8,%esp
  102122:	50                   	push   %eax
  102123:	ff 74 24 24          	pushl  0x24(%esp)
  102127:	e8 79 00 00 00       	call   1021a5 <vdprintf>
	va_end(ap);
}
  10212c:	83 c4 18             	add    $0x18,%esp
  10212f:	5b                   	pop    %ebx
  102130:	c3                   	ret    

00102131 <cputs>:
    char buf[CONSOLE_BUFFER_SIZE];
};

static void
cputs (const char *str)
{
  102131:	56                   	push   %esi
  102132:	53                   	push   %ebx
  102133:	83 ec 04             	sub    $0x4,%esp
  102136:	e8 d4 e1 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10213b:	81 c3 c5 9e 00 00    	add    $0x9ec5,%ebx
  102141:	89 c6                	mov    %eax,%esi
    while (*str)
  102143:	eb 12                	jmp    102157 <cputs+0x26>
    {
        cons_putc (*str);
  102145:	83 ec 0c             	sub    $0xc,%esp
  102148:	0f be c0             	movsbl %al,%eax
  10214b:	50                   	push   %eax
  10214c:	e8 9f e2 ff ff       	call   1003f0 <cons_putc>
        str += 1;
  102151:	83 c6 01             	add    $0x1,%esi
  102154:	83 c4 10             	add    $0x10,%esp
    while (*str)
  102157:	0f b6 06             	movzbl (%esi),%eax
  10215a:	84 c0                	test   %al,%al
  10215c:	75 e7                	jne    102145 <cputs+0x14>
    }
}
  10215e:	83 c4 04             	add    $0x4,%esp
  102161:	5b                   	pop    %ebx
  102162:	5e                   	pop    %esi
  102163:	c3                   	ret    

00102164 <putch>:

static void
putch (int ch, struct dprintbuf *b)
{
  102164:	53                   	push   %ebx
  102165:	83 ec 08             	sub    $0x8,%esp
  102168:	8b 5c 24 14          	mov    0x14(%esp),%ebx
    b->buf[b->idx++] = ch;
  10216c:	8b 13                	mov    (%ebx),%edx
  10216e:	8d 42 01             	lea    0x1(%edx),%eax
  102171:	89 03                	mov    %eax,(%ebx)
  102173:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  102177:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
    if (b->idx == CONSOLE_BUFFER_SIZE - 1)
  10217b:	3d ff 01 00 00       	cmp    $0x1ff,%eax
  102180:	74 0e                	je     102190 <putch+0x2c>
    {
        b->buf[b->idx] = 0;
        cputs (b->buf);
        b->idx = 0;
    }
    b->cnt++;
  102182:	8b 43 04             	mov    0x4(%ebx),%eax
  102185:	83 c0 01             	add    $0x1,%eax
  102188:	89 43 04             	mov    %eax,0x4(%ebx)
}
  10218b:	83 c4 08             	add    $0x8,%esp
  10218e:	5b                   	pop    %ebx
  10218f:	c3                   	ret    
        b->buf[b->idx] = 0;
  102190:	c6 44 13 09 00       	movb   $0x0,0x9(%ebx,%edx,1)
        cputs (b->buf);
  102195:	8d 43 08             	lea    0x8(%ebx),%eax
  102198:	e8 94 ff ff ff       	call   102131 <cputs>
        b->idx = 0;
  10219d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  1021a3:	eb dd                	jmp    102182 <putch+0x1e>

001021a5 <vdprintf>:

int
vdprintf (const char *fmt, va_list ap)
{
  1021a5:	53                   	push   %ebx
  1021a6:	81 ec 18 02 00 00    	sub    $0x218,%esp
  1021ac:	e8 5e e1 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1021b1:	81 c3 4f 9e 00 00    	add    $0x9e4f,%ebx
    struct dprintbuf b;

    b.idx = 0;
  1021b7:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  1021be:	00 
    b.cnt = 0;
  1021bf:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  1021c6:	00 
    vprintfmt ((void*) putch, &b, fmt, ap);
  1021c7:	ff b4 24 24 02 00 00 	pushl  0x224(%esp)
  1021ce:	ff b4 24 24 02 00 00 	pushl  0x224(%esp)
  1021d5:	8d 44 24 10          	lea    0x10(%esp),%eax
  1021d9:	50                   	push   %eax
  1021da:	8d 83 64 61 ff ff    	lea    -0x9e9c(%ebx),%eax
  1021e0:	50                   	push   %eax
  1021e1:	e8 6b 01 00 00       	call   102351 <vprintfmt>

    b.buf[b.idx] = 0;
  1021e6:	8b 44 24 18          	mov    0x18(%esp),%eax
  1021ea:	c6 44 04 20 00       	movb   $0x0,0x20(%esp,%eax,1)
    cputs (b.buf);
  1021ef:	8d 44 24 20          	lea    0x20(%esp),%eax
  1021f3:	e8 39 ff ff ff       	call   102131 <cputs>

    return b.cnt;
}
  1021f8:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  1021fc:	81 c4 28 02 00 00    	add    $0x228,%esp
  102202:	5b                   	pop    %ebx
  102203:	c3                   	ret    

00102204 <dprintf>:

int
dprintf (const char *fmt, ...)
{
  102204:	83 ec 0c             	sub    $0xc,%esp
    va_list ap;
    int cnt;

    va_start(ap, fmt);
  102207:	8d 44 24 14          	lea    0x14(%esp),%eax
    cnt = vdprintf (fmt, ap);
  10220b:	83 ec 08             	sub    $0x8,%esp
  10220e:	50                   	push   %eax
  10220f:	ff 74 24 1c          	pushl  0x1c(%esp)
  102213:	e8 8d ff ff ff       	call   1021a5 <vdprintf>
    va_end(ap);

    return cnt;
}
  102218:	83 c4 1c             	add    $0x1c,%esp
  10221b:	c3                   	ret    

0010221c <printnum>:
 * using specified putch function and associated pointer putdat.
 */
static void
printnum(putch_t putch, void *putdat,
	 unsigned long long num, unsigned base, int width, int padc)
{
  10221c:	55                   	push   %ebp
  10221d:	57                   	push   %edi
  10221e:	56                   	push   %esi
  10221f:	53                   	push   %ebx
  102220:	83 ec 2c             	sub    $0x2c,%esp
  102223:	e8 e3 e0 ff ff       	call   10030b <__x86.get_pc_thunk.cx>
  102228:	81 c1 d8 9d 00 00    	add    $0x9dd8,%ecx
  10222e:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  102232:	89 c6                	mov    %eax,%esi
  102234:	89 d7                	mov    %edx,%edi
  102236:	8b 44 24 40          	mov    0x40(%esp),%eax
  10223a:	8b 54 24 44          	mov    0x44(%esp),%edx
  10223e:	89 44 24 18          	mov    %eax,0x18(%esp)
  102242:	89 54 24 1c          	mov    %edx,0x1c(%esp)
  102246:	8b 6c 24 50          	mov    0x50(%esp),%ebp
	/* first recursively print all preceding (more significant) digits */
	if (num >= base) {
  10224a:	8b 4c 24 48          	mov    0x48(%esp),%ecx
  10224e:	bb 00 00 00 00       	mov    $0x0,%ebx
  102253:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  102257:	89 5c 24 14          	mov    %ebx,0x14(%esp)
  10225b:	39 d3                	cmp    %edx,%ebx
  10225d:	72 0a                	jb     102269 <printnum+0x4d>
  10225f:	39 44 24 48          	cmp    %eax,0x48(%esp)
  102263:	0f 87 82 00 00 00    	ja     1022eb <printnum+0xcf>
		printnum(putch, putdat, num / base, base, width - 1, padc);
  102269:	83 ec 0c             	sub    $0xc,%esp
  10226c:	55                   	push   %ebp
  10226d:	8b 44 24 5c          	mov    0x5c(%esp),%eax
  102271:	8d 58 ff             	lea    -0x1(%eax),%ebx
  102274:	53                   	push   %ebx
  102275:	ff 74 24 5c          	pushl  0x5c(%esp)
  102279:	83 ec 08             	sub    $0x8,%esp
  10227c:	ff 74 24 34          	pushl  0x34(%esp)
  102280:	ff 74 24 34          	pushl  0x34(%esp)
  102284:	ff 74 24 44          	pushl  0x44(%esp)
  102288:	ff 74 24 44          	pushl  0x44(%esp)
  10228c:	8b 5c 24 3c          	mov    0x3c(%esp),%ebx
  102290:	e8 bb 3e 00 00       	call   106150 <__udivdi3>
  102295:	83 c4 18             	add    $0x18,%esp
  102298:	52                   	push   %edx
  102299:	50                   	push   %eax
  10229a:	89 fa                	mov    %edi,%edx
  10229c:	89 f0                	mov    %esi,%eax
  10229e:	e8 79 ff ff ff       	call   10221c <printnum>
  1022a3:	83 c4 20             	add    $0x20,%esp
  1022a6:	eb 11                	jmp    1022b9 <printnum+0x9d>
	} else {
		/* print any needed pad characters before first digit */
		while (--width > 0)
			putch(padc, putdat);
  1022a8:	83 ec 08             	sub    $0x8,%esp
  1022ab:	57                   	push   %edi
  1022ac:	55                   	push   %ebp
  1022ad:	ff d6                	call   *%esi
  1022af:	83 c4 10             	add    $0x10,%esp
		while (--width > 0)
  1022b2:	83 eb 01             	sub    $0x1,%ebx
  1022b5:	85 db                	test   %ebx,%ebx
  1022b7:	7f ef                	jg     1022a8 <printnum+0x8c>
	}

	// then print this (the least significant) digit
	putch("0123456789abcdef"[num % base], putdat);
  1022b9:	ff 74 24 14          	pushl  0x14(%esp)
  1022bd:	ff 74 24 14          	pushl  0x14(%esp)
  1022c1:	ff 74 24 24          	pushl  0x24(%esp)
  1022c5:	ff 74 24 24          	pushl  0x24(%esp)
  1022c9:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
  1022cd:	89 eb                	mov    %ebp,%ebx
  1022cf:	e8 9c 3f 00 00       	call   106270 <__umoddi3>
  1022d4:	83 c4 08             	add    $0x8,%esp
  1022d7:	57                   	push   %edi
  1022d8:	0f be 84 05 a6 a7 ff 	movsbl -0x585a(%ebp,%eax,1),%eax
  1022df:	ff 
  1022e0:	50                   	push   %eax
  1022e1:	ff d6                	call   *%esi
}
  1022e3:	83 c4 3c             	add    $0x3c,%esp
  1022e6:	5b                   	pop    %ebx
  1022e7:	5e                   	pop    %esi
  1022e8:	5f                   	pop    %edi
  1022e9:	5d                   	pop    %ebp
  1022ea:	c3                   	ret    
  1022eb:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
  1022ef:	eb c1                	jmp    1022b2 <printnum+0x96>

001022f1 <getuint>:
 * depending on the lflag parameter.
 */
static unsigned long long
getuint(va_list *ap, int lflag)
{
	if (lflag >= 2)
  1022f1:	83 fa 01             	cmp    $0x1,%edx
  1022f4:	7e 0d                	jle    102303 <getuint+0x12>
		return va_arg(*ap, unsigned long long);
  1022f6:	8b 10                	mov    (%eax),%edx
  1022f8:	8d 4a 08             	lea    0x8(%edx),%ecx
  1022fb:	89 08                	mov    %ecx,(%eax)
  1022fd:	8b 02                	mov    (%edx),%eax
  1022ff:	8b 52 04             	mov    0x4(%edx),%edx
  102302:	c3                   	ret    
	else if (lflag)
  102303:	85 d2                	test   %edx,%edx
  102305:	75 0f                	jne    102316 <getuint+0x25>
		return va_arg(*ap, unsigned long);
	else
		return va_arg(*ap, unsigned int);
  102307:	8b 10                	mov    (%eax),%edx
  102309:	8d 4a 04             	lea    0x4(%edx),%ecx
  10230c:	89 08                	mov    %ecx,(%eax)
  10230e:	8b 02                	mov    (%edx),%eax
  102310:	ba 00 00 00 00       	mov    $0x0,%edx
}
  102315:	c3                   	ret    
		return va_arg(*ap, unsigned long);
  102316:	8b 10                	mov    (%eax),%edx
  102318:	8d 4a 04             	lea    0x4(%edx),%ecx
  10231b:	89 08                	mov    %ecx,(%eax)
  10231d:	8b 02                	mov    (%edx),%eax
  10231f:	ba 00 00 00 00       	mov    $0x0,%edx
  102324:	c3                   	ret    

00102325 <getint>:
 * because of sign extension
 */
static long long
getint(va_list *ap, int lflag)
{
	if (lflag >= 2)
  102325:	83 fa 01             	cmp    $0x1,%edx
  102328:	7e 0d                	jle    102337 <getint+0x12>
		return va_arg(*ap, long long);
  10232a:	8b 10                	mov    (%eax),%edx
  10232c:	8d 4a 08             	lea    0x8(%edx),%ecx
  10232f:	89 08                	mov    %ecx,(%eax)
  102331:	8b 02                	mov    (%edx),%eax
  102333:	8b 52 04             	mov    0x4(%edx),%edx
  102336:	c3                   	ret    
	else if (lflag)
  102337:	85 d2                	test   %edx,%edx
  102339:	75 0b                	jne    102346 <getint+0x21>
		return va_arg(*ap, long);
	else
		return va_arg(*ap, int);
  10233b:	8b 10                	mov    (%eax),%edx
  10233d:	8d 4a 04             	lea    0x4(%edx),%ecx
  102340:	89 08                	mov    %ecx,(%eax)
  102342:	8b 02                	mov    (%edx),%eax
  102344:	99                   	cltd   
}
  102345:	c3                   	ret    
		return va_arg(*ap, long);
  102346:	8b 10                	mov    (%eax),%edx
  102348:	8d 4a 04             	lea    0x4(%edx),%ecx
  10234b:	89 08                	mov    %ecx,(%eax)
  10234d:	8b 02                	mov    (%edx),%eax
  10234f:	99                   	cltd   
  102350:	c3                   	ret    

00102351 <vprintfmt>:

void
vprintfmt(putch_t putch, void *putdat, const char *fmt, va_list ap)
{
  102351:	55                   	push   %ebp
  102352:	57                   	push   %edi
  102353:	56                   	push   %esi
  102354:	53                   	push   %ebx
  102355:	83 ec 2c             	sub    $0x2c,%esp
  102358:	e8 70 ea ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  10235d:	05 a3 9c 00 00       	add    $0x9ca3,%eax
  102362:	89 44 24 04          	mov    %eax,0x4(%esp)
  102366:	8b 74 24 40          	mov    0x40(%esp),%esi
  10236a:	8b 7c 24 44          	mov    0x44(%esp),%edi
  10236e:	8b 6c 24 48          	mov    0x48(%esp),%ebp
	unsigned long long num;
	int base, lflag, width, precision, altflag;
	char padc;

	while (1) {
		while ((ch = *(unsigned char *) fmt++) != '%') {
  102372:	8d 5d 01             	lea    0x1(%ebp),%ebx
  102375:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
  102379:	83 f8 25             	cmp    $0x25,%eax
  10237c:	74 16                	je     102394 <vprintfmt+0x43>
			if (ch == '\0')
  10237e:	85 c0                	test   %eax,%eax
  102380:	0f 84 09 03 00 00    	je     10268f <.L27+0x1d>
				return;
			putch(ch, putdat);
  102386:	83 ec 08             	sub    $0x8,%esp
  102389:	57                   	push   %edi
  10238a:	50                   	push   %eax
  10238b:	ff d6                	call   *%esi
		while ((ch = *(unsigned char *) fmt++) != '%') {
  10238d:	83 c4 10             	add    $0x10,%esp
  102390:	89 dd                	mov    %ebx,%ebp
  102392:	eb de                	jmp    102372 <vprintfmt+0x21>
		}

		// Process a %-escape sequence
		padc = ' ';
  102394:	c6 44 24 17 20       	movb   $0x20,0x17(%esp)
		width = -1;
		precision = -1;
		lflag = 0;
		altflag = 0;
  102399:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  1023a0:	00 
		precision = -1;
  1023a1:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
  1023a8:	ff 
		width = -1;
  1023a9:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
		lflag = 0;
  1023b0:	ba 00 00 00 00       	mov    $0x0,%edx
  1023b5:	89 54 24 18          	mov    %edx,0x18(%esp)
	reswitch:
		switch (ch = *(unsigned char *) fmt++) {
  1023b9:	8d 6b 01             	lea    0x1(%ebx),%ebp
  1023bc:	0f b6 03             	movzbl (%ebx),%eax
  1023bf:	0f b6 d0             	movzbl %al,%edx
  1023c2:	89 54 24 08          	mov    %edx,0x8(%esp)
  1023c6:	83 e8 23             	sub    $0x23,%eax
  1023c9:	3c 55                	cmp    $0x55,%al
  1023cb:	0f 87 a1 02 00 00    	ja     102672 <.L27>
  1023d1:	0f b6 c0             	movzbl %al,%eax
  1023d4:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  1023d8:	03 8c 81 c0 a7 ff ff 	add    -0x5840(%ecx,%eax,4),%ecx
  1023df:	ff e1                	jmp    *%ecx

001023e1 <.L25>:
  1023e1:	89 eb                	mov    %ebp,%ebx

			// flag to pad on the right
		case '-':
			padc = '-';
  1023e3:	c6 44 24 17 2d       	movb   $0x2d,0x17(%esp)
  1023e8:	eb cf                	jmp    1023b9 <vprintfmt+0x68>

001023ea <.L58>:
		switch (ch = *(unsigned char *) fmt++) {
  1023ea:	89 eb                	mov    %ebp,%ebx
			goto reswitch;

			// flag to pad with 0's instead of spaces
		case '0':
			padc = '0';
  1023ec:	c6 44 24 17 30       	movb   $0x30,0x17(%esp)
  1023f1:	eb c6                	jmp    1023b9 <vprintfmt+0x68>
		switch (ch = *(unsigned char *) fmt++) {
  1023f3:	89 eb                	mov    %ebp,%ebx
			precision = va_arg(ap, int);
			goto process_precision;

		case '.':
			if (width < 0)
				width = 0;
  1023f5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1023fc:	eb bb                	jmp    1023b9 <vprintfmt+0x68>

001023fe <.L59>:
			for (precision = 0; ; ++fmt) {
  1023fe:	b8 00 00 00 00       	mov    $0x0,%eax
  102403:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  102407:	8b 54 24 18          	mov    0x18(%esp),%edx
				precision = precision * 10 + ch - '0';
  10240b:	8d 1c 80             	lea    (%eax,%eax,4),%ebx
  10240e:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
  102411:	8d 44 01 d0          	lea    -0x30(%ecx,%eax,1),%eax
				ch = *fmt;
  102415:	0f be 4d 00          	movsbl 0x0(%ebp),%ecx
				if (ch < '0' || ch > '9')
  102419:	8d 59 d0             	lea    -0x30(%ecx),%ebx
  10241c:	83 fb 09             	cmp    $0x9,%ebx
  10241f:	77 52                	ja     102473 <.L28+0xf>
			for (precision = 0; ; ++fmt) {
  102421:	83 c5 01             	add    $0x1,%ebp
				precision = precision * 10 + ch - '0';
  102424:	eb e5                	jmp    10240b <.L59+0xd>

00102426 <.L31>:
			precision = va_arg(ap, int);
  102426:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  10242a:	8d 48 04             	lea    0x4(%eax),%ecx
  10242d:	89 4c 24 4c          	mov    %ecx,0x4c(%esp)
  102431:	8b 00                	mov    (%eax),%eax
  102433:	89 44 24 1c          	mov    %eax,0x1c(%esp)
		switch (ch = *(unsigned char *) fmt++) {
  102437:	89 eb                	mov    %ebp,%ebx
		case '#':
			altflag = 1;
			goto reswitch;

		process_precision:
			if (width < 0)
  102439:	83 3c 24 00          	cmpl   $0x0,(%esp)
  10243d:	0f 89 76 ff ff ff    	jns    1023b9 <vprintfmt+0x68>
				width = precision, precision = -1;
  102443:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  102447:	89 04 24             	mov    %eax,(%esp)
  10244a:	c7 44 24 1c ff ff ff 	movl   $0xffffffff,0x1c(%esp)
  102451:	ff 
  102452:	e9 62 ff ff ff       	jmp    1023b9 <vprintfmt+0x68>

00102457 <.L32>:
			if (width < 0)
  102457:	83 3c 24 00          	cmpl   $0x0,(%esp)
  10245b:	78 96                	js     1023f3 <.L58+0x9>
		switch (ch = *(unsigned char *) fmt++) {
  10245d:	89 eb                	mov    %ebp,%ebx
  10245f:	e9 55 ff ff ff       	jmp    1023b9 <vprintfmt+0x68>

00102464 <.L28>:
  102464:	89 eb                	mov    %ebp,%ebx
			altflag = 1;
  102466:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
  10246d:	00 
			goto reswitch;
  10246e:	e9 46 ff ff ff       	jmp    1023b9 <vprintfmt+0x68>
  102473:	89 54 24 18          	mov    %edx,0x18(%esp)
  102477:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  10247b:	89 eb                	mov    %ebp,%ebx
  10247d:	eb ba                	jmp    102439 <.L31+0x13>

0010247f <.L36>:
			goto reswitch;

			// long flag (doubled for long long)
		case 'l':
			lflag++;
  10247f:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
		switch (ch = *(unsigned char *) fmt++) {
  102484:	89 eb                	mov    %ebp,%ebx
			goto reswitch;
  102486:	e9 2e ff ff ff       	jmp    1023b9 <vprintfmt+0x68>

0010248b <.L34>:

			// character
		case 'c':
			putch(va_arg(ap, int), putdat);
  10248b:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  10248f:	8d 50 04             	lea    0x4(%eax),%edx
  102492:	89 54 24 4c          	mov    %edx,0x4c(%esp)
  102496:	83 ec 08             	sub    $0x8,%esp
  102499:	57                   	push   %edi
  10249a:	ff 30                	pushl  (%eax)
  10249c:	ff d6                	call   *%esi
			break;
  10249e:	83 c4 10             	add    $0x10,%esp
  1024a1:	e9 cc fe ff ff       	jmp    102372 <vprintfmt+0x21>

001024a6 <.L38>:

			// string
		case 's':
			if ((p = va_arg(ap, char *)) == NULL)
  1024a6:	8b 44 24 4c          	mov    0x4c(%esp),%eax
  1024aa:	8d 50 04             	lea    0x4(%eax),%edx
  1024ad:	89 54 24 4c          	mov    %edx,0x4c(%esp)
  1024b1:	8b 00                	mov    (%eax),%eax
  1024b3:	89 44 24 08          	mov    %eax,0x8(%esp)
  1024b7:	85 c0                	test   %eax,%eax
  1024b9:	74 21                	je     1024dc <.L38+0x36>
				p = "(null)";
			if (width > 0 && padc != '-')
  1024bb:	83 3c 24 00          	cmpl   $0x0,(%esp)
  1024bf:	0f 9f c2             	setg   %dl
  1024c2:	80 7c 24 17 2d       	cmpb   $0x2d,0x17(%esp)
  1024c7:	0f 95 c0             	setne  %al
  1024ca:	84 c2                	test   %al,%dl
  1024cc:	75 1e                	jne    1024ec <.L38+0x46>
  1024ce:	8b 44 24 08          	mov    0x8(%esp),%eax
  1024d2:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  1024d6:	89 6c 24 48          	mov    %ebp,0x48(%esp)
  1024da:	eb 71                	jmp    10254d <.L38+0xa7>
				p = "(null)";
  1024dc:	8b 44 24 04          	mov    0x4(%esp),%eax
  1024e0:	8d 80 b7 a7 ff ff    	lea    -0x5849(%eax),%eax
  1024e6:	89 44 24 08          	mov    %eax,0x8(%esp)
  1024ea:	eb cf                	jmp    1024bb <.L38+0x15>
				for (width -= strnlen(p, precision);
  1024ec:	83 ec 08             	sub    $0x8,%esp
  1024ef:	ff 74 24 24          	pushl  0x24(%esp)
  1024f3:	ff 74 24 14          	pushl  0x14(%esp)
  1024f7:	8b 5c 24 14          	mov    0x14(%esp),%ebx
  1024fb:	e8 60 fa ff ff       	call   101f60 <strnlen>
  102500:	29 44 24 10          	sub    %eax,0x10(%esp)
  102504:	8b 54 24 10          	mov    0x10(%esp),%edx
  102508:	83 c4 10             	add    $0x10,%esp
  10250b:	89 d3                	mov    %edx,%ebx
  10250d:	eb 12                	jmp    102521 <.L38+0x7b>
				     width > 0;
				     width--)
					putch(padc, putdat);
  10250f:	83 ec 08             	sub    $0x8,%esp
  102512:	57                   	push   %edi
  102513:	0f be 44 24 23       	movsbl 0x23(%esp),%eax
  102518:	50                   	push   %eax
  102519:	ff d6                	call   *%esi
				     width--)
  10251b:	83 eb 01             	sub    $0x1,%ebx
  10251e:	83 c4 10             	add    $0x10,%esp
				for (width -= strnlen(p, precision);
  102521:	85 db                	test   %ebx,%ebx
  102523:	7f ea                	jg     10250f <.L38+0x69>
  102525:	89 1c 24             	mov    %ebx,(%esp)
  102528:	8b 44 24 08          	mov    0x8(%esp),%eax
  10252c:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
  102530:	89 6c 24 48          	mov    %ebp,0x48(%esp)
  102534:	eb 17                	jmp    10254d <.L38+0xa7>
			for (;
			     (ch = *p++) != '\0' &&
				     (precision < 0 || --precision >= 0);
			     width--)
				if (altflag && (ch < ' ' || ch > '~'))
  102536:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  10253b:	75 2f                	jne    10256c <.L38+0xc6>
					putch('?', putdat);
				else
					putch(ch, putdat);
  10253d:	83 ec 08             	sub    $0x8,%esp
  102540:	57                   	push   %edi
  102541:	50                   	push   %eax
  102542:	ff d6                	call   *%esi
  102544:	83 c4 10             	add    $0x10,%esp
			     width--)
  102547:	83 2c 24 01          	subl   $0x1,(%esp)
			     (ch = *p++) != '\0' &&
  10254b:	89 e8                	mov    %ebp,%eax
  10254d:	8d 68 01             	lea    0x1(%eax),%ebp
  102550:	0f b6 10             	movzbl (%eax),%edx
  102553:	0f be c2             	movsbl %dl,%eax
			for (;
  102556:	85 c0                	test   %eax,%eax
  102558:	74 41                	je     10259b <.L38+0xf5>
			     (ch = *p++) != '\0' &&
  10255a:	85 db                	test   %ebx,%ebx
  10255c:	78 d8                	js     102536 <.L38+0x90>
				     (precision < 0 || --precision >= 0);
  10255e:	83 eb 01             	sub    $0x1,%ebx
  102561:	79 d3                	jns    102536 <.L38+0x90>
  102563:	8b 6c 24 48          	mov    0x48(%esp),%ebp
  102567:	8b 1c 24             	mov    (%esp),%ebx
  10256a:	eb 26                	jmp    102592 <.L38+0xec>
				if (altflag && (ch < ' ' || ch > '~'))
  10256c:	0f be d2             	movsbl %dl,%edx
  10256f:	83 ea 20             	sub    $0x20,%edx
  102572:	83 fa 5e             	cmp    $0x5e,%edx
  102575:	76 c6                	jbe    10253d <.L38+0x97>
					putch('?', putdat);
  102577:	83 ec 08             	sub    $0x8,%esp
  10257a:	57                   	push   %edi
  10257b:	6a 3f                	push   $0x3f
  10257d:	ff d6                	call   *%esi
  10257f:	83 c4 10             	add    $0x10,%esp
  102582:	eb c3                	jmp    102547 <.L38+0xa1>
			for (; width > 0; width--)
				putch(' ', putdat);
  102584:	83 ec 08             	sub    $0x8,%esp
  102587:	57                   	push   %edi
  102588:	6a 20                	push   $0x20
  10258a:	ff d6                	call   *%esi
			for (; width > 0; width--)
  10258c:	83 eb 01             	sub    $0x1,%ebx
  10258f:	83 c4 10             	add    $0x10,%esp
  102592:	85 db                	test   %ebx,%ebx
  102594:	7f ee                	jg     102584 <.L38+0xde>
  102596:	e9 d7 fd ff ff       	jmp    102372 <vprintfmt+0x21>
  10259b:	8b 1c 24             	mov    (%esp),%ebx
  10259e:	8b 6c 24 48          	mov    0x48(%esp),%ebp
  1025a2:	eb ee                	jmp    102592 <.L38+0xec>

001025a4 <.L35>:
  1025a4:	8b 54 24 18          	mov    0x18(%esp),%edx
			break;

			// (signed) decimal
		case 'd':
			num = getint(&ap, lflag);
  1025a8:	8d 44 24 4c          	lea    0x4c(%esp),%eax
  1025ac:	e8 74 fd ff ff       	call   102325 <getint>
			if ((long long) num < 0) {
  1025b1:	89 44 24 08          	mov    %eax,0x8(%esp)
  1025b5:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1025b9:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  1025be:	0f 89 94 00 00 00    	jns    102658 <.L40+0x14>
				putch('-', putdat);
  1025c4:	83 ec 08             	sub    $0x8,%esp
  1025c7:	57                   	push   %edi
  1025c8:	6a 2d                	push   $0x2d
  1025ca:	ff d6                	call   *%esi
				num = -(long long) num;
  1025cc:	8b 44 24 18          	mov    0x18(%esp),%eax
  1025d0:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  1025d4:	f7 d8                	neg    %eax
  1025d6:	83 d2 00             	adc    $0x0,%edx
  1025d9:	f7 da                	neg    %edx
  1025db:	83 c4 10             	add    $0x10,%esp
			}
			base = 10;
  1025de:	bb 0a 00 00 00       	mov    $0xa,%ebx
  1025e3:	eb 12                	jmp    1025f7 <.L39+0x12>

001025e5 <.L39>:
  1025e5:	8b 54 24 18          	mov    0x18(%esp),%edx
			goto number;

			// unsigned decimal
		case 'u':
			num = getuint(&ap, lflag);
  1025e9:	8d 44 24 4c          	lea    0x4c(%esp),%eax
  1025ed:	e8 ff fc ff ff       	call   1022f1 <getuint>
			base = 10;
  1025f2:	bb 0a 00 00 00       	mov    $0xa,%ebx
			// (unsigned) hexadecimal
		case 'x':
			num = getuint(&ap, lflag);
			base = 16;
		number:
			printnum(putch, putdat, num, base, width, padc);
  1025f7:	83 ec 0c             	sub    $0xc,%esp
  1025fa:	0f be 4c 24 23       	movsbl 0x23(%esp),%ecx
  1025ff:	51                   	push   %ecx
  102600:	ff 74 24 10          	pushl  0x10(%esp)
  102604:	53                   	push   %ebx
  102605:	52                   	push   %edx
  102606:	50                   	push   %eax
  102607:	89 fa                	mov    %edi,%edx
  102609:	89 f0                	mov    %esi,%eax
  10260b:	e8 0c fc ff ff       	call   10221c <printnum>
			break;
  102610:	83 c4 20             	add    $0x20,%esp
  102613:	e9 5a fd ff ff       	jmp    102372 <vprintfmt+0x21>

00102618 <.L37>:
			putch('0', putdat);
  102618:	83 ec 08             	sub    $0x8,%esp
  10261b:	57                   	push   %edi
  10261c:	6a 30                	push   $0x30
  10261e:	ff d6                	call   *%esi
			putch('x', putdat);
  102620:	83 c4 08             	add    $0x8,%esp
  102623:	57                   	push   %edi
  102624:	6a 78                	push   $0x78
  102626:	ff d6                	call   *%esi
				(uintptr_t) va_arg(ap, void *);
  102628:	8b 44 24 5c          	mov    0x5c(%esp),%eax
  10262c:	8d 50 04             	lea    0x4(%eax),%edx
  10262f:	89 54 24 5c          	mov    %edx,0x5c(%esp)
			num = (unsigned long long)
  102633:	8b 00                	mov    (%eax),%eax
  102635:	ba 00 00 00 00       	mov    $0x0,%edx
			goto number;
  10263a:	83 c4 10             	add    $0x10,%esp
			base = 16;
  10263d:	bb 10 00 00 00       	mov    $0x10,%ebx
			goto number;
  102642:	eb b3                	jmp    1025f7 <.L39+0x12>

00102644 <.L40>:
  102644:	8b 54 24 18          	mov    0x18(%esp),%edx
			num = getuint(&ap, lflag);
  102648:	8d 44 24 4c          	lea    0x4c(%esp),%eax
  10264c:	e8 a0 fc ff ff       	call   1022f1 <getuint>
			base = 16;
  102651:	bb 10 00 00 00       	mov    $0x10,%ebx
  102656:	eb 9f                	jmp    1025f7 <.L39+0x12>
			base = 10;
  102658:	bb 0a 00 00 00       	mov    $0xa,%ebx
  10265d:	eb 98                	jmp    1025f7 <.L39+0x12>

0010265f <.L30>:
  10265f:	8b 4c 24 08          	mov    0x8(%esp),%ecx

			// escaped '%' character
		case '%':
			putch(ch, putdat);
  102663:	83 ec 08             	sub    $0x8,%esp
  102666:	57                   	push   %edi
  102667:	51                   	push   %ecx
  102668:	ff d6                	call   *%esi
			break;
  10266a:	83 c4 10             	add    $0x10,%esp
  10266d:	e9 00 fd ff ff       	jmp    102372 <vprintfmt+0x21>

00102672 <.L27>:

			// unrecognized escape sequence - just print it literally
		default:
			putch('%', putdat);
  102672:	83 ec 08             	sub    $0x8,%esp
  102675:	57                   	push   %edi
  102676:	6a 25                	push   $0x25
  102678:	ff d6                	call   *%esi
			for (fmt--; fmt[-1] != '%'; fmt--)
  10267a:	83 c4 10             	add    $0x10,%esp
  10267d:	89 dd                	mov    %ebx,%ebp
  10267f:	eb 03                	jmp    102684 <.L27+0x12>
  102681:	83 ed 01             	sub    $0x1,%ebp
  102684:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
  102688:	75 f7                	jne    102681 <.L27+0xf>
  10268a:	e9 e3 fc ff ff       	jmp    102372 <vprintfmt+0x21>
				/* do nothing */;
			break;
		}
	}
}
  10268f:	83 c4 2c             	add    $0x2c,%esp
  102692:	5b                   	pop    %ebx
  102693:	5e                   	pop    %esi
  102694:	5f                   	pop    %edi
  102695:	5d                   	pop    %ebp
  102696:	c3                   	ret    

00102697 <tss_switch>:

segdesc_t gdt_LOC[CPU_GDT_NDESC];
tss_t tss_LOC[64];

void tss_switch(uint32_t pid)
{
  102697:	55                   	push   %ebp
  102698:	57                   	push   %edi
  102699:	56                   	push   %esi
  10269a:	53                   	push   %ebx
  10269b:	83 ec 18             	sub    $0x18,%esp
  10269e:	e8 6c dc ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1026a3:	81 c3 5d 99 00 00    	add    $0x995d,%ebx
	gdt_LOC[CPU_GDT_TSS >> 3] =
		SEGDESC16(STS_T32A,
  1026a9:	69 54 24 2c ec 00 00 	imul   $0xec,0x2c(%esp),%edx
  1026b0:	00 
  1026b1:	81 c2 40 c0 9a 00    	add    $0x9ac040,%edx
  1026b7:	89 d1                	mov    %edx,%ecx
  1026b9:	c1 e9 10             	shr    $0x10,%ecx
  1026bc:	89 d6                	mov    %edx,%esi
  1026be:	c1 ee 18             	shr    $0x18,%esi
	gdt_LOC[CPU_GDT_TSS >> 3] =
  1026c1:	c7 c0 00 c0 9a 00    	mov    $0x9ac000,%eax
  1026c7:	66 c7 40 28 eb 00    	movw   $0xeb,0x28(%eax)
  1026cd:	66 89 50 2a          	mov    %dx,0x2a(%eax)
  1026d1:	88 48 2c             	mov    %cl,0x2c(%eax)
  1026d4:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  1026d8:	83 e2 f0             	and    $0xfffffff0,%edx
  1026db:	83 ca 09             	or     $0x9,%edx
  1026de:	83 e2 9f             	and    $0xffffff9f,%edx
  1026e1:	83 ca 80             	or     $0xffffff80,%edx
  1026e4:	89 d5                	mov    %edx,%ebp
  1026e6:	0f b6 48 2e          	movzbl 0x2e(%eax),%ecx
  1026ea:	83 e1 c0             	and    $0xffffffc0,%ecx
  1026ed:	83 c9 40             	or     $0x40,%ecx
  1026f0:	83 e1 7f             	and    $0x7f,%ecx
  1026f3:	88 48 2e             	mov    %cl,0x2e(%eax)
  1026f6:	89 f1                	mov    %esi,%ecx
  1026f8:	88 48 2f             	mov    %cl,0x2f(%eax)
			  (uint32_t) (&tss_LOC[pid]), sizeof(tss_t) - 1, 0);
	gdt_LOC[CPU_GDT_TSS >> 3].sd_s = 0;
  1026fb:	89 ea                	mov    %ebp,%edx
  1026fd:	83 e2 ef             	and    $0xffffffef,%edx
  102700:	88 50 2d             	mov    %dl,0x2d(%eax)
	ltr(CPU_GDT_TSS);
  102703:	6a 28                	push   $0x28
  102705:	e8 1c 03 00 00       	call   102a26 <ltr>
}
  10270a:	83 c4 1c             	add    $0x1c,%esp
  10270d:	5b                   	pop    %ebx
  10270e:	5e                   	pop    %esi
  10270f:	5f                   	pop    %edi
  102710:	5d                   	pop    %ebp
  102711:	c3                   	ret    

00102712 <seg_init>:

void seg_init (void)
{
  102712:	55                   	push   %ebp
  102713:	57                   	push   %edi
  102714:	56                   	push   %esi
  102715:	53                   	push   %ebx
  102716:	83 ec 24             	sub    $0x24,%esp
  102719:	e8 f1 db ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10271e:	81 c3 e2 98 00 00    	add    $0x98e2,%ebx
	/* clear BSS */
	extern uint8_t end[], edata[];
	memzero (edata, bsp_kstack - edata);
  102724:	c7 c6 00 b0 96 00    	mov    $0x96b000,%esi
  10272a:	c7 c0 18 83 12 00    	mov    $0x128318,%eax
  102730:	89 f2                	mov    %esi,%edx
  102732:	29 c2                	sub    %eax,%edx
  102734:	52                   	push   %edx
  102735:	50                   	push   %eax
  102736:	e8 8c f8 ff ff       	call   101fc7 <memzero>
	memzero (bsp_kstack + 4096, end - bsp_kstack - 4096);
  10273b:	c7 c0 20 1c df 00    	mov    $0xdf1c20,%eax
  102741:	2d 00 10 00 00       	sub    $0x1000,%eax
  102746:	29 f0                	sub    %esi,%eax
  102748:	83 c4 08             	add    $0x8,%esp
  10274b:	50                   	push   %eax
  10274c:	8d b6 00 10 00 00    	lea    0x1000(%esi),%esi
  102752:	56                   	push   %esi
  102753:	e8 6f f8 ff ff       	call   101fc7 <memzero>

	/* setup GDT */
	gdt_LOC[0] = SEGDESC_NULL
  102758:	c7 c0 00 c0 9a 00    	mov    $0x9ac000,%eax
  10275e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  102764:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	;
	/* 0x08: kernel code */
	gdt_LOC[CPU_GDT_KCODE >> 3] = SEGDESC32(STA_X | STA_R, 0x0, 0xffffffff, 0);
  10276b:	66 c7 40 08 ff ff    	movw   $0xffff,0x8(%eax)
  102771:	66 c7 40 0a 00 00    	movw   $0x0,0xa(%eax)
  102777:	c6 40 0c 00          	movb   $0x0,0xc(%eax)
  10277b:	0f b6 50 0d          	movzbl 0xd(%eax),%edx
  10277f:	83 e2 f0             	and    $0xfffffff0,%edx
  102782:	83 ca 1a             	or     $0x1a,%edx
  102785:	83 e2 9f             	and    $0xffffff9f,%edx
  102788:	83 ca 80             	or     $0xffffff80,%edx
  10278b:	88 50 0d             	mov    %dl,0xd(%eax)
  10278e:	0f b6 50 0e          	movzbl 0xe(%eax),%edx
  102792:	83 ca 0f             	or     $0xf,%edx
  102795:	83 e2 cf             	and    $0xffffffcf,%edx
  102798:	83 ca c0             	or     $0xffffffc0,%edx
  10279b:	88 50 0e             	mov    %dl,0xe(%eax)
  10279e:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
	/* 0x10: kernel data */
	gdt_LOC[CPU_GDT_KDATA >> 3] = SEGDESC32(STA_W, 0x0, 0xffffffff, 0);
  1027a2:	66 c7 40 10 ff ff    	movw   $0xffff,0x10(%eax)
  1027a8:	66 c7 40 12 00 00    	movw   $0x0,0x12(%eax)
  1027ae:	c6 40 14 00          	movb   $0x0,0x14(%eax)
  1027b2:	0f b6 50 15          	movzbl 0x15(%eax),%edx
  1027b6:	83 e2 f0             	and    $0xfffffff0,%edx
  1027b9:	83 ca 12             	or     $0x12,%edx
  1027bc:	83 e2 9f             	and    $0xffffff9f,%edx
  1027bf:	83 ca 80             	or     $0xffffff80,%edx
  1027c2:	88 50 15             	mov    %dl,0x15(%eax)
  1027c5:	0f b6 50 16          	movzbl 0x16(%eax),%edx
  1027c9:	83 ca 0f             	or     $0xf,%edx
  1027cc:	83 e2 cf             	and    $0xffffffcf,%edx
  1027cf:	83 ca c0             	or     $0xffffffc0,%edx
  1027d2:	88 50 16             	mov    %dl,0x16(%eax)
  1027d5:	c6 40 17 00          	movb   $0x0,0x17(%eax)
	/* 0x18: user code */
	gdt_LOC[CPU_GDT_UCODE >> 3] = SEGDESC32(STA_X | STA_R, 0x00000000,
  1027d9:	66 c7 40 18 ff ff    	movw   $0xffff,0x18(%eax)
  1027df:	66 c7 40 1a 00 00    	movw   $0x0,0x1a(%eax)
  1027e5:	c6 40 1c 00          	movb   $0x0,0x1c(%eax)
  1027e9:	c6 40 1d fa          	movb   $0xfa,0x1d(%eax)
  1027ed:	0f b6 50 1e          	movzbl 0x1e(%eax),%edx
  1027f1:	83 ca 0f             	or     $0xf,%edx
  1027f4:	83 e2 cf             	and    $0xffffffcf,%edx
  1027f7:	83 ca c0             	or     $0xffffffc0,%edx
  1027fa:	88 50 1e             	mov    %dl,0x1e(%eax)
  1027fd:	c6 40 1f 00          	movb   $0x0,0x1f(%eax)
		0xffffffff, 3);
	/* 0x20: user data */
	gdt_LOC[CPU_GDT_UDATA >> 3] = SEGDESC32(STA_W, 0x00000000, 0xffffffff, 3);
  102801:	66 c7 40 20 ff ff    	movw   $0xffff,0x20(%eax)
  102807:	66 c7 40 22 00 00    	movw   $0x0,0x22(%eax)
  10280d:	c6 40 24 00          	movb   $0x0,0x24(%eax)
  102811:	c6 40 25 f2          	movb   $0xf2,0x25(%eax)
  102815:	0f b6 50 26          	movzbl 0x26(%eax),%edx
  102819:	83 ca 0f             	or     $0xf,%edx
  10281c:	83 e2 cf             	and    $0xffffffcf,%edx
  10281f:	83 ca c0             	or     $0xffffffc0,%edx
  102822:	88 50 26             	mov    %dl,0x26(%eax)
  102825:	c6 40 27 00          	movb   $0x0,0x27(%eax)

	/* setup TSS */
	tss0.ts_esp0 = (uint32_t) bsp_kstack + 4096;
  102829:	89 b3 64 de 01 00    	mov    %esi,0x1de64(%ebx)
	tss0.ts_ss0 = CPU_GDT_KDATA;
  10282f:	66 c7 83 68 de 01 00 	movw   $0x10,0x1de68(%ebx)
  102836:	10 00 
	gdt_LOC[CPU_GDT_TSS >> 3] = SEGDESC16(STS_T32A, (uint32_t) (&tss0),
  102838:	66 c7 40 28 eb 00    	movw   $0xeb,0x28(%eax)
  10283e:	8d b3 60 de 01 00    	lea    0x1de60(%ebx),%esi
  102844:	66 89 70 2a          	mov    %si,0x2a(%eax)
  102848:	89 f2                	mov    %esi,%edx
  10284a:	c1 ea 10             	shr    $0x10,%edx
  10284d:	88 50 2c             	mov    %dl,0x2c(%eax)
  102850:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  102854:	83 e2 f0             	and    $0xfffffff0,%edx
  102857:	83 ca 09             	or     $0x9,%edx
  10285a:	83 e2 9f             	and    $0xffffff9f,%edx
  10285d:	83 ca 80             	or     $0xffffff80,%edx
  102860:	89 d5                	mov    %edx,%ebp
  102862:	0f b6 48 2e          	movzbl 0x2e(%eax),%ecx
  102866:	83 e1 c0             	and    $0xffffffc0,%ecx
  102869:	83 c9 40             	or     $0x40,%ecx
  10286c:	83 e1 7f             	and    $0x7f,%ecx
  10286f:	88 48 2e             	mov    %cl,0x2e(%eax)
  102872:	c1 ee 18             	shr    $0x18,%esi
  102875:	89 f1                	mov    %esi,%ecx
  102877:	88 48 2f             	mov    %cl,0x2f(%eax)
		sizeof(tss_t) - 1, 0);
	gdt_LOC[CPU_GDT_TSS >> 3].sd_s = 0;
  10287a:	89 ea                	mov    %ebp,%edx
  10287c:	83 e2 ef             	and    $0xffffffef,%edx
  10287f:	88 50 2d             	mov    %dl,0x2d(%eax)

	pseudodesc_t gdt_desc =
  102882:	66 c7 44 24 1a 2f 00 	movw   $0x2f,0x1a(%esp)
  102889:	89 44 24 1c          	mov    %eax,0x1c(%esp)
		{ .pd_lim = sizeof(gdt_LOC) - 1, .pd_base = (uint32_t) gdt_LOC };
	asm volatile("lgdt %0" :: "m" (gdt_desc));
  10288d:	0f 01 54 24 1a       	lgdtl  0x1a(%esp)
	asm volatile("movw %%ax,%%gs" :: "a" (CPU_GDT_KDATA));
  102892:	b8 10 00 00 00       	mov    $0x10,%eax
  102897:	8e e8                	mov    %eax,%gs
	asm volatile("movw %%ax,%%fs" :: "a" (CPU_GDT_KDATA));
  102899:	8e e0                	mov    %eax,%fs
	asm volatile("movw %%ax,%%es" :: "a" (CPU_GDT_KDATA));
  10289b:	8e c0                	mov    %eax,%es
	asm volatile("movw %%ax,%%ds" :: "a" (CPU_GDT_KDATA));
  10289d:	8e d8                	mov    %eax,%ds
	asm volatile("movw %%ax,%%ss" :: "a" (CPU_GDT_KDATA));
  10289f:	8e d0                	mov    %eax,%ss
	/* reload %cs */
	asm volatile("ljmp %0,$1f\n 1:\n" :: "i" (CPU_GDT_KCODE));
  1028a1:	ea a8 28 10 00 08 00 	ljmp   $0x8,$0x1028a8

	/*
	 * Load a null LDT.
	 */
	lldt (0);
  1028a8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1028af:	e8 e7 00 00 00       	call   10299b <lldt>

	/*
	 * Load the bootstrap TSS.
	 */
	ltr (CPU_GDT_TSS);
  1028b4:	c7 04 24 28 00 00 00 	movl   $0x28,(%esp)
  1028bb:	e8 66 01 00 00       	call   102a26 <ltr>

	/*
	 * Load IDT.
	 */
	extern pseudodesc_t idt_pd;
	asm volatile("lidt %0" : : "m" (idt_pd));
  1028c0:	c7 c0 20 c3 10 00    	mov    $0x10c320,%eax
  1028c6:	0f 01 18             	lidtl  (%eax)

	/*
	 * Initialize all TSS structures for processes.
	 */
	unsigned int pid;
	memzero (tss_LOC, sizeof(tss_t) * 64);
  1028c9:	83 c4 08             	add    $0x8,%esp
  1028cc:	68 00 3b 00 00       	push   $0x3b00
  1028d1:	ff b3 f4 ff ff ff    	pushl  -0xc(%ebx)
  1028d7:	e8 eb f6 ff ff       	call   101fc7 <memzero>
	memzero (STACK_LOC, sizeof(char) * 64 * 4096);
  1028dc:	83 c4 08             	add    $0x8,%esp
  1028df:	68 00 00 04 00       	push   $0x40000
  1028e4:	ff b3 ec ff ff ff    	pushl  -0x14(%ebx)
  1028ea:	e8 d8 f6 ff ff       	call   101fc7 <memzero>
	for (pid = 0; pid < 64; pid++)
  1028ef:	83 c4 10             	add    $0x10,%esp
  1028f2:	be 00 00 00 00       	mov    $0x0,%esi
  1028f7:	eb 4d                	jmp    102946 <seg_init+0x234>
	{
		tss_LOC[pid].ts_esp0 = (uint32_t) STACK_LOC[pid] + 4096;
  1028f9:	89 f0                	mov    %esi,%eax
  1028fb:	c1 e0 0c             	shl    $0xc,%eax
  1028fe:	81 c0 00 c0 96 00    	add    $0x96c000,%eax
  102904:	05 00 10 00 00       	add    $0x1000,%eax
  102909:	c7 c1 40 c0 9a 00    	mov    $0x9ac040,%ecx
  10290f:	69 d6 ec 00 00 00    	imul   $0xec,%esi,%edx
  102915:	8d 3c 11             	lea    (%ecx,%edx,1),%edi
  102918:	89 47 04             	mov    %eax,0x4(%edi)
		tss_LOC[pid].ts_ss0 = CPU_GDT_KDATA;
  10291b:	66 c7 47 08 10 00    	movw   $0x10,0x8(%edi)
		tss_LOC[pid].ts_iomb = offsetof(tss_t, ts_iopm);
  102921:	66 c7 47 66 68 00    	movw   $0x68,0x66(%edi)
		memzero (tss_LOC[pid].ts_iopm, sizeof(uint8_t) * 128);
  102927:	8d 44 11 68          	lea    0x68(%ecx,%edx,1),%eax
  10292b:	83 ec 08             	sub    $0x8,%esp
  10292e:	68 80 00 00 00       	push   $0x80
  102933:	50                   	push   %eax
  102934:	e8 8e f6 ff ff       	call   101fc7 <memzero>
		tss_LOC[pid].ts_iopm[128] = 0xff;
  102939:	c6 87 e8 00 00 00 ff 	movb   $0xff,0xe8(%edi)
	for (pid = 0; pid < 64; pid++)
  102940:	83 c6 01             	add    $0x1,%esi
  102943:	83 c4 10             	add    $0x10,%esp
  102946:	83 fe 3f             	cmp    $0x3f,%esi
  102949:	76 ae                	jbe    1028f9 <seg_init+0x1e7>
	}
}
  10294b:	83 c4 1c             	add    $0x1c,%esp
  10294e:	5b                   	pop    %ebx
  10294f:	5e                   	pop    %esi
  102950:	5f                   	pop    %edi
  102951:	5d                   	pop    %ebp
  102952:	c3                   	ret    

00102953 <max>:
#include "types.h"

uint32_t
max(uint32_t a, uint32_t b)
{
  102953:	8b 54 24 04          	mov    0x4(%esp),%edx
  102957:	8b 44 24 08          	mov    0x8(%esp),%eax
	return (a > b) ? a : b;
  10295b:	39 d0                	cmp    %edx,%eax
  10295d:	0f 42 c2             	cmovb  %edx,%eax
}
  102960:	c3                   	ret    

00102961 <min>:

uint32_t
min(uint32_t a, uint32_t b)
{
  102961:	8b 54 24 04          	mov    0x4(%esp),%edx
  102965:	8b 44 24 08          	mov    0x8(%esp),%eax
	return (a < b) ? a : b;
  102969:	39 d0                	cmp    %edx,%eax
  10296b:	0f 47 c2             	cmova  %edx,%eax
}
  10296e:	c3                   	ret    

0010296f <rounddown>:

uint32_t
rounddown(uint32_t a, uint32_t n)
{
  10296f:	8b 4c 24 04          	mov    0x4(%esp),%ecx
	return a - a % n;
  102973:	89 c8                	mov    %ecx,%eax
  102975:	ba 00 00 00 00       	mov    $0x0,%edx
  10297a:	f7 74 24 08          	divl   0x8(%esp)
  10297e:	89 c8                	mov    %ecx,%eax
  102980:	29 d0                	sub    %edx,%eax
}
  102982:	c3                   	ret    

00102983 <roundup>:

uint32_t
roundup(uint32_t a, uint32_t n)
{
  102983:	8b 54 24 08          	mov    0x8(%esp),%edx
	return rounddown(a+n-1, n);
  102987:	89 d0                	mov    %edx,%eax
  102989:	03 44 24 04          	add    0x4(%esp),%eax
  10298d:	52                   	push   %edx
  10298e:	83 e8 01             	sub    $0x1,%eax
  102991:	50                   	push   %eax
  102992:	e8 d8 ff ff ff       	call   10296f <rounddown>
  102997:	83 c4 08             	add    $0x8,%esp
}
  10299a:	c3                   	ret    

0010299b <lldt>:
#include "x86.h"

gcc_inline void
lldt(uint16_t sel)
{
	__asm __volatile("lldt %0" : : "r" (sel));
  10299b:	8b 44 24 04          	mov    0x4(%esp),%eax
  10299f:	0f 00 d0             	lldt   %ax
}
  1029a2:	c3                   	ret    

001029a3 <cli>:

gcc_inline void
cli(void)
{
	__asm __volatile("cli":::"memory");
  1029a3:	fa                   	cli    
}
  1029a4:	c3                   	ret    

001029a5 <sti>:

gcc_inline void
sti(void)
{
	__asm __volatile("sti;nop");
  1029a5:	fb                   	sti    
  1029a6:	90                   	nop
}
  1029a7:	c3                   	ret    

001029a8 <rdmsr>:

gcc_inline uint64_t
rdmsr(uint32_t msr)
{
	uint64_t rv;
	__asm __volatile("rdmsr" : "=A" (rv) : "c" (msr));
  1029a8:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  1029ac:	0f 32                	rdmsr  
	return rv;
}
  1029ae:	c3                   	ret    

001029af <wrmsr>:

gcc_inline void
wrmsr(uint32_t msr, uint64_t newval)
{
        __asm __volatile("wrmsr" : : "A" (newval), "c" (msr));
  1029af:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  1029b3:	8b 44 24 08          	mov    0x8(%esp),%eax
  1029b7:	8b 54 24 0c          	mov    0xc(%esp),%edx
  1029bb:	0f 30                	wrmsr  
}
  1029bd:	c3                   	ret    

001029be <halt>:

gcc_inline void
halt(void)
{
	__asm __volatile("hlt");
  1029be:	f4                   	hlt    
}
  1029bf:	c3                   	ret    

001029c0 <rdtsc>:
gcc_inline uint64_t
rdtsc(void)
{
	uint64_t rv;

	__asm __volatile("rdtsc" : "=A" (rv));
  1029c0:	0f 31                	rdtsc  
	return (rv);
}
  1029c2:	c3                   	ret    

001029c3 <enable_sse>:

gcc_inline uint32_t
rcr4(void)
{
	uint32_t cr4;
	__asm __volatile("movl %%cr4,%0" : "=r" (cr4));
  1029c3:	0f 20 e0             	mov    %cr4,%eax
	cr4 = rcr4() | CR4_OSFXSR | CR4_OSXMMEXCPT;
  1029c6:	80 cc 06             	or     $0x6,%ah
	FENCE();
  1029c9:	0f ae f0             	mfence 
	__asm __volatile("movl %0,%%cr4" : : "r" (val));
  1029cc:	0f 22 e0             	mov    %eax,%cr4
	__asm __volatile("movl %%cr0,%0" : "=r" (val));
  1029cf:	0f 20 c0             	mov    %cr0,%eax
	FENCE();
  1029d2:	0f ae f0             	mfence 
}
  1029d5:	c3                   	ret    

001029d6 <cpuid>:
{
  1029d6:	55                   	push   %ebp
  1029d7:	57                   	push   %edi
  1029d8:	56                   	push   %esi
  1029d9:	53                   	push   %ebx
  1029da:	8b 44 24 14          	mov    0x14(%esp),%eax
  1029de:	8b 7c 24 18          	mov    0x18(%esp),%edi
  1029e2:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
  1029e6:	8b 74 24 24          	mov    0x24(%esp),%esi
	__asm __volatile("cpuid"
  1029ea:	0f a2                	cpuid  
	if (eaxp)
  1029ec:	85 ff                	test   %edi,%edi
  1029ee:	74 02                	je     1029f2 <cpuid+0x1c>
		*eaxp = eax;
  1029f0:	89 07                	mov    %eax,(%edi)
	if (ebxp)
  1029f2:	85 ed                	test   %ebp,%ebp
  1029f4:	74 03                	je     1029f9 <cpuid+0x23>
		*ebxp = ebx;
  1029f6:	89 5d 00             	mov    %ebx,0x0(%ebp)
	if (ecxp)
  1029f9:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
  1029fe:	74 06                	je     102a06 <cpuid+0x30>
		*ecxp = ecx;
  102a00:	8b 44 24 20          	mov    0x20(%esp),%eax
  102a04:	89 08                	mov    %ecx,(%eax)
	if (edxp)
  102a06:	85 f6                	test   %esi,%esi
  102a08:	74 02                	je     102a0c <cpuid+0x36>
		*edxp = edx;
  102a0a:	89 16                	mov    %edx,(%esi)
}
  102a0c:	5b                   	pop    %ebx
  102a0d:	5e                   	pop    %esi
  102a0e:	5f                   	pop    %edi
  102a0f:	5d                   	pop    %ebp
  102a10:	c3                   	ret    

00102a11 <rcr3>:
    __asm __volatile("movl %%cr3,%0" : "=r" (val));
  102a11:	0f 20 d8             	mov    %cr3,%eax
}
  102a14:	c3                   	ret    

00102a15 <outl>:
	__asm __volatile("outl %0,%w1" : : "a" (data), "d" (port));
  102a15:	8b 54 24 04          	mov    0x4(%esp),%edx
  102a19:	8b 44 24 08          	mov    0x8(%esp),%eax
  102a1d:	ef                   	out    %eax,(%dx)
}
  102a1e:	c3                   	ret    

00102a1f <inl>:
	__asm __volatile("inl %w1,%0" : "=a" (data) : "d" (port));
  102a1f:	8b 54 24 04          	mov    0x4(%esp),%edx
  102a23:	ed                   	in     (%dx),%eax
}
  102a24:	c3                   	ret    

00102a25 <smp_wmb>:
}
  102a25:	c3                   	ret    

00102a26 <ltr>:
	__asm __volatile("ltr %0" : : "r" (sel));
  102a26:	8b 44 24 04          	mov    0x4(%esp),%eax
  102a2a:	0f 00 d8             	ltr    %ax
}
  102a2d:	c3                   	ret    

00102a2e <lcr0>:
	__asm __volatile("movl %0,%%cr0" : : "r" (val));
  102a2e:	8b 44 24 04          	mov    0x4(%esp),%eax
  102a32:	0f 22 c0             	mov    %eax,%cr0
}
  102a35:	c3                   	ret    

00102a36 <rcr0>:
	__asm __volatile("movl %%cr0,%0" : "=r" (val));
  102a36:	0f 20 c0             	mov    %cr0,%eax
}
  102a39:	c3                   	ret    

00102a3a <rcr2>:
	__asm __volatile("movl %%cr2,%0" : "=r" (val));
  102a3a:	0f 20 d0             	mov    %cr2,%eax
}
  102a3d:	c3                   	ret    

00102a3e <lcr3>:
	__asm __volatile("movl %0,%%cr3" : : "r" (val));
  102a3e:	8b 44 24 04          	mov    0x4(%esp),%eax
  102a42:	0f 22 d8             	mov    %eax,%cr3
}
  102a45:	c3                   	ret    

00102a46 <lcr4>:
	__asm __volatile("movl %0,%%cr4" : : "r" (val));
  102a46:	8b 44 24 04          	mov    0x4(%esp),%eax
  102a4a:	0f 22 e0             	mov    %eax,%cr4
}
  102a4d:	c3                   	ret    

00102a4e <rcr4>:
	__asm __volatile("movl %%cr4,%0" : "=r" (cr4));
  102a4e:	0f 20 e0             	mov    %cr4,%eax
	return cr4;
}
  102a51:	c3                   	ret    

00102a52 <inb>:

gcc_inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  102a52:	8b 54 24 04          	mov    0x4(%esp),%edx
  102a56:	ec                   	in     (%dx),%al
	return data;
}
  102a57:	c3                   	ret    

00102a58 <insl>:

gcc_inline void
insl(int port, void *addr, int cnt)
{
  102a58:	57                   	push   %edi
	__asm __volatile("cld\n\trepne\n\tinsl"                 :
  102a59:	8b 7c 24 0c          	mov    0xc(%esp),%edi
  102a5d:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  102a61:	8b 54 24 08          	mov    0x8(%esp),%edx
  102a65:	fc                   	cld    
  102a66:	f2 6d                	repnz insl (%dx),%es:(%edi)
			 "=D" (addr), "=c" (cnt)                :
			 "d" (port), "0" (addr), "1" (cnt)      :
			 "memory", "cc");
}
  102a68:	5f                   	pop    %edi
  102a69:	c3                   	ret    

00102a6a <outb>:

gcc_inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  102a6a:	8b 54 24 04          	mov    0x4(%esp),%edx
  102a6e:	8b 44 24 08          	mov    0x8(%esp),%eax
  102a72:	ee                   	out    %al,(%dx)
}
  102a73:	c3                   	ret    

00102a74 <outsw>:

gcc_inline void
outsw(int port, const void *addr, int cnt)
{
  102a74:	56                   	push   %esi
	__asm __volatile("cld\n\trepne\n\toutsw"                :
  102a75:	8b 74 24 0c          	mov    0xc(%esp),%esi
  102a79:	8b 4c 24 10          	mov    0x10(%esp),%ecx
  102a7d:	8b 54 24 08          	mov    0x8(%esp),%edx
  102a81:	fc                   	cld    
  102a82:	f2 66 6f             	repnz outsw %ds:(%esi),(%dx)
			 "=S" (addr), "=c" (cnt)                :
			 "d" (port), "0" (addr), "1" (cnt)      :
			 "cc");
}
  102a85:	5e                   	pop    %esi
  102a86:	c3                   	ret    

00102a87 <mon_start_user>:
extern void set_curid(unsigned int);
extern void kctx_switch(unsigned int, unsigned int);

int
mon_start_user (int argc, char **argv, struct Trapframe *tf)
{
  102a87:	57                   	push   %edi
  102a88:	56                   	push   %esi
  102a89:	53                   	push   %ebx
  102a8a:	e8 80 d8 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  102a8f:	81 c3 71 95 00 00    	add    $0x9571,%ebx
    unsigned int idle_pid;
    idle_pid = proc_create (_binary___obj_user_idle_idle_start, 10000);
  102a95:	83 ec 08             	sub    $0x8,%esp
  102a98:	68 10 27 00 00       	push   $0x2710
  102a9d:	ff b3 e4 ff ff ff    	pushl  -0x1c(%ebx)
  102aa3:	e8 58 30 00 00       	call   105b00 <proc_create>
  102aa8:	89 c6                	mov    %eax,%esi
    KERN_DEBUG("process idle %d is created.\n", idle_pid);
  102aaa:	50                   	push   %eax
  102aab:	8d 83 18 a9 ff ff    	lea    -0x56e8(%ebx),%eax
  102ab1:	50                   	push   %eax
  102ab2:	6a 2d                	push   $0x2d
  102ab4:	8d bb 35 a9 ff ff    	lea    -0x56cb(%ebx),%edi
  102aba:	57                   	push   %edi
  102abb:	e8 78 f5 ff ff       	call   102038 <debug_normal>

    KERN_INFO("Start user-space ... \n");
  102ac0:	83 c4 14             	add    $0x14,%esp
  102ac3:	8d 83 48 a9 ff ff    	lea    -0x56b8(%ebx),%eax
  102ac9:	50                   	push   %eax
  102aca:	e8 44 f5 ff ff       	call   102013 <debug_info>

    tqueue_remove (NUM_IDS, idle_pid);
  102acf:	83 c4 08             	add    $0x8,%esp
  102ad2:	56                   	push   %esi
  102ad3:	6a 40                	push   $0x40
  102ad5:	e8 06 2b 00 00       	call   1055e0 <tqueue_remove>
    tcb_set_state (idle_pid, TSTATE_RUN);
  102ada:	83 c4 08             	add    $0x8,%esp
  102add:	6a 01                	push   $0x1
  102adf:	56                   	push   %esi
  102ae0:	e8 0b 28 00 00       	call   1052f0 <tcb_set_state>
    set_curid (idle_pid);
  102ae5:	89 34 24             	mov    %esi,(%esp)
  102ae8:	e8 23 2e 00 00       	call   105910 <set_curid>
    kctx_switch (0, idle_pid);
  102aed:	83 c4 08             	add    $0x8,%esp
  102af0:	56                   	push   %esi
  102af1:	6a 00                	push   $0x0
  102af3:	e8 68 26 00 00       	call   105160 <kctx_switch>

    KERN_PANIC("mon_startuser() should never reach here.\n");
  102af8:	83 c4 0c             	add    $0xc,%esp
  102afb:	8d 83 4c aa ff ff    	lea    -0x55b4(%ebx),%eax
  102b01:	50                   	push   %eax
  102b02:	6a 36                	push   $0x36
  102b04:	57                   	push   %edi
  102b05:	e8 67 f5 ff ff       	call   102071 <debug_panic>
}
  102b0a:	83 c4 10             	add    $0x10,%esp
  102b0d:	5b                   	pop    %ebx
  102b0e:	5e                   	pop    %esi
  102b0f:	5f                   	pop    %edi
  102b10:	c3                   	ret    

00102b11 <mon_help>:

int
mon_help (int argc, char **argv, struct Trapframe *tf)
{
  102b11:	56                   	push   %esi
  102b12:	53                   	push   %ebx
  102b13:	83 ec 04             	sub    $0x4,%esp
  102b16:	e8 f4 d7 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  102b1b:	81 c3 e5 94 00 00    	add    $0x94e5,%ebx
	int i;

	for (i = 0; i < NCOMMANDS; i++)
  102b21:	be 00 00 00 00       	mov    $0x0,%esi
  102b26:	eb 30                	jmp    102b58 <mon_help+0x47>
		dprintf("%s - %s\n", commands[i].name, commands[i].desc);
  102b28:	83 ec 04             	sub    $0x4,%esp
  102b2b:	8d 04 36             	lea    (%esi,%esi,1),%eax
  102b2e:	8d 0c 30             	lea    (%eax,%esi,1),%ecx
  102b31:	8d 14 8d 00 00 00 00 	lea    0x0(,%ecx,4),%edx
  102b38:	ff b4 13 c4 ff ff ff 	pushl  -0x3c(%ebx,%edx,1)
  102b3f:	ff b4 13 c0 ff ff ff 	pushl  -0x40(%ebx,%edx,1)
  102b46:	8d 83 5f a9 ff ff    	lea    -0x56a1(%ebx),%eax
  102b4c:	50                   	push   %eax
  102b4d:	e8 b2 f6 ff ff       	call   102204 <dprintf>
	for (i = 0; i < NCOMMANDS; i++)
  102b52:	83 c6 01             	add    $0x1,%esi
  102b55:	83 c4 10             	add    $0x10,%esp
  102b58:	83 fe 02             	cmp    $0x2,%esi
  102b5b:	76 cb                	jbe    102b28 <mon_help+0x17>
	return 0;
}
  102b5d:	b8 00 00 00 00       	mov    $0x0,%eax
  102b62:	83 c4 04             	add    $0x4,%esp
  102b65:	5b                   	pop    %ebx
  102b66:	5e                   	pop    %esi
  102b67:	c3                   	ret    

00102b68 <mon_kerninfo>:

int
mon_kerninfo (int argc, char **argv, struct Trapframe *tf)
{
  102b68:	57                   	push   %edi
  102b69:	56                   	push   %esi
  102b6a:	53                   	push   %ebx
  102b6b:	e8 9f d7 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  102b70:	81 c3 90 94 00 00    	add    $0x9490,%ebx
	extern uint8_t start[], etext[], edata[], end[];

	dprintf("Special kernel symbols:\n");
  102b76:	83 ec 0c             	sub    $0xc,%esp
  102b79:	8d 83 68 a9 ff ff    	lea    -0x5698(%ebx),%eax
  102b7f:	50                   	push   %eax
  102b80:	e8 7f f6 ff ff       	call   102204 <dprintf>
	dprintf("  start  %08x\n", start);
  102b85:	83 c4 08             	add    $0x8,%esp
  102b88:	c7 c7 e4 32 10 00    	mov    $0x1032e4,%edi
  102b8e:	57                   	push   %edi
  102b8f:	8d 83 81 a9 ff ff    	lea    -0x567f(%ebx),%eax
  102b95:	50                   	push   %eax
  102b96:	e8 69 f6 ff ff       	call   102204 <dprintf>
	dprintf("  etext  %08x\n", etext);
  102b9b:	83 c4 08             	add    $0x8,%esp
  102b9e:	ff b3 f0 ff ff ff    	pushl  -0x10(%ebx)
  102ba4:	8d 83 90 a9 ff ff    	lea    -0x5670(%ebx),%eax
  102baa:	50                   	push   %eax
  102bab:	e8 54 f6 ff ff       	call   102204 <dprintf>
	dprintf("  edata  %08x\n", edata);
  102bb0:	83 c4 08             	add    $0x8,%esp
  102bb3:	ff b3 e8 ff ff ff    	pushl  -0x18(%ebx)
  102bb9:	8d 83 9f a9 ff ff    	lea    -0x5661(%ebx),%eax
  102bbf:	50                   	push   %eax
  102bc0:	e8 3f f6 ff ff       	call   102204 <dprintf>
	dprintf("  end    %08x\n", end);
  102bc5:	83 c4 08             	add    $0x8,%esp
  102bc8:	c7 c6 20 1c df 00    	mov    $0xdf1c20,%esi
  102bce:	56                   	push   %esi
  102bcf:	8d 83 ae a9 ff ff    	lea    -0x5652(%ebx),%eax
  102bd5:	50                   	push   %eax
  102bd6:	e8 29 f6 ff ff       	call   102204 <dprintf>
	dprintf("Kernel executable memory footprint: %dKB\n",
		ROUNDUP(end - start, 1024) / 1024);
  102bdb:	29 fe                	sub    %edi,%esi
  102bdd:	8d 86 ff 03 00 00    	lea    0x3ff(%esi),%eax
  102be3:	89 c1                	mov    %eax,%ecx
  102be5:	c1 f9 1f             	sar    $0x1f,%ecx
  102be8:	c1 e9 16             	shr    $0x16,%ecx
  102beb:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  102bee:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
  102bf4:	29 ca                	sub    %ecx,%edx
  102bf6:	29 d0                	sub    %edx,%eax
	dprintf("Kernel executable memory footprint: %dKB\n",
  102bf8:	83 c4 08             	add    $0x8,%esp
  102bfb:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  102c01:	85 c0                	test   %eax,%eax
  102c03:	0f 49 d0             	cmovns %eax,%edx
  102c06:	c1 fa 0a             	sar    $0xa,%edx
  102c09:	52                   	push   %edx
  102c0a:	8d 83 78 aa ff ff    	lea    -0x5588(%ebx),%eax
  102c10:	50                   	push   %eax
  102c11:	e8 ee f5 ff ff       	call   102204 <dprintf>
	return 0;
  102c16:	83 c4 10             	add    $0x10,%esp
}
  102c19:	b8 00 00 00 00       	mov    $0x0,%eax
  102c1e:	5b                   	pop    %ebx
  102c1f:	5e                   	pop    %esi
  102c20:	5f                   	pop    %edi
  102c21:	c3                   	ret    

00102c22 <runcmd>:
#define WHITESPACE "\t\r\n "
#define MAXARGS 16

static int
runcmd (char *buf, struct Trapframe *tf)
{
  102c22:	55                   	push   %ebp
  102c23:	57                   	push   %edi
  102c24:	56                   	push   %esi
  102c25:	53                   	push   %ebx
  102c26:	83 ec 5c             	sub    $0x5c,%esp
  102c29:	e8 e1 d6 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  102c2e:	81 c3 d2 93 00 00    	add    $0x93d2,%ebx
  102c34:	89 c6                	mov    %eax,%esi
  102c36:	89 54 24 0c          	mov    %edx,0xc(%esp)
	char *argv[MAXARGS];
	int i;

	// Parse the command buffer into whitespace-separated arguments
	argc = 0;
	argv[argc] = 0;
  102c3a:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  102c41:	00 
	argc = 0;
  102c42:	bf 00 00 00 00       	mov    $0x0,%edi
  102c47:	eb 6d                	jmp    102cb6 <runcmd+0x94>
	while (1)
	{
		// gobble whitespace
		while (*buf && strchr (WHITESPACE, *buf))
  102c49:	83 ec 08             	sub    $0x8,%esp
  102c4c:	0f be c0             	movsbl %al,%eax
  102c4f:	50                   	push   %eax
  102c50:	8d 83 bd a9 ff ff    	lea    -0x5643(%ebx),%eax
  102c56:	50                   	push   %eax
  102c57:	e8 4b f3 ff ff       	call   101fa7 <strchr>
  102c5c:	83 c4 10             	add    $0x10,%esp
  102c5f:	85 c0                	test   %eax,%eax
  102c61:	74 5a                	je     102cbd <runcmd+0x9b>
			*buf++ = 0;
  102c63:	c6 06 00             	movb   $0x0,(%esi)
  102c66:	89 fd                	mov    %edi,%ebp
  102c68:	8d 76 01             	lea    0x1(%esi),%esi
  102c6b:	eb 47                	jmp    102cb4 <runcmd+0x92>
			break;

		// save and scan past next arg
		if (argc == MAXARGS - 1)
		{
			dprintf("Too many arguments (max %d)\n", MAXARGS);
  102c6d:	83 ec 08             	sub    $0x8,%esp
  102c70:	6a 10                	push   $0x10
  102c72:	8d 83 c2 a9 ff ff    	lea    -0x563e(%ebx),%eax
  102c78:	50                   	push   %eax
  102c79:	e8 86 f5 ff ff       	call   102204 <dprintf>
			return 0;
  102c7e:	83 c4 10             	add    $0x10,%esp
  102c81:	bf 00 00 00 00       	mov    $0x0,%edi
		if (strcmp (argv[0], commands[i].name) == 0)
			return commands[i].func (argc, argv, tf);
	}
	dprintf("Unknown command '%s'\n", argv[0]);
	return 0;
}
  102c86:	89 f8                	mov    %edi,%eax
  102c88:	83 c4 5c             	add    $0x5c,%esp
  102c8b:	5b                   	pop    %ebx
  102c8c:	5e                   	pop    %esi
  102c8d:	5f                   	pop    %edi
  102c8e:	5d                   	pop    %ebp
  102c8f:	c3                   	ret    
			buf++;
  102c90:	83 c6 01             	add    $0x1,%esi
		while (*buf && !strchr (WHITESPACE, *buf))
  102c93:	0f b6 06             	movzbl (%esi),%eax
  102c96:	84 c0                	test   %al,%al
  102c98:	74 1a                	je     102cb4 <runcmd+0x92>
  102c9a:	83 ec 08             	sub    $0x8,%esp
  102c9d:	0f be c0             	movsbl %al,%eax
  102ca0:	50                   	push   %eax
  102ca1:	8d 83 bd a9 ff ff    	lea    -0x5643(%ebx),%eax
  102ca7:	50                   	push   %eax
  102ca8:	e8 fa f2 ff ff       	call   101fa7 <strchr>
  102cad:	83 c4 10             	add    $0x10,%esp
  102cb0:	85 c0                	test   %eax,%eax
  102cb2:	74 dc                	je     102c90 <runcmd+0x6e>
			*buf++ = 0;
  102cb4:	89 ef                	mov    %ebp,%edi
		while (*buf && strchr (WHITESPACE, *buf))
  102cb6:	0f b6 06             	movzbl (%esi),%eax
  102cb9:	84 c0                	test   %al,%al
  102cbb:	75 8c                	jne    102c49 <runcmd+0x27>
		if (*buf == 0)
  102cbd:	80 3e 00             	cmpb   $0x0,(%esi)
  102cc0:	74 0e                	je     102cd0 <runcmd+0xae>
		if (argc == MAXARGS - 1)
  102cc2:	83 ff 0f             	cmp    $0xf,%edi
  102cc5:	74 a6                	je     102c6d <runcmd+0x4b>
		argv[argc++] = buf;
  102cc7:	8d 6f 01             	lea    0x1(%edi),%ebp
  102cca:	89 74 bc 10          	mov    %esi,0x10(%esp,%edi,4)
		while (*buf && !strchr (WHITESPACE, *buf))
  102cce:	eb c3                	jmp    102c93 <runcmd+0x71>
	argv[argc] = 0;
  102cd0:	c7 44 bc 10 00 00 00 	movl   $0x0,0x10(%esp,%edi,4)
  102cd7:	00 
	if (argc == 0)
  102cd8:	85 ff                	test   %edi,%edi
  102cda:	74 aa                	je     102c86 <runcmd+0x64>
	for (i = 0; i < NCOMMANDS; i++)
  102cdc:	be 00 00 00 00       	mov    $0x0,%esi
  102ce1:	eb 03                	jmp    102ce6 <runcmd+0xc4>
  102ce3:	83 c6 01             	add    $0x1,%esi
  102ce6:	83 fe 02             	cmp    $0x2,%esi
  102ce9:	77 4c                	ja     102d37 <runcmd+0x115>
		if (strcmp (argv[0], commands[i].name) == 0)
  102ceb:	83 ec 08             	sub    $0x8,%esp
  102cee:	8d 14 76             	lea    (%esi,%esi,2),%edx
  102cf1:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
  102cf8:	ff b4 03 c0 ff ff ff 	pushl  -0x40(%ebx,%eax,1)
  102cff:	ff 74 24 1c          	pushl  0x1c(%esp)
  102d03:	e8 7b f2 ff ff       	call   101f83 <strcmp>
  102d08:	83 c4 10             	add    $0x10,%esp
  102d0b:	85 c0                	test   %eax,%eax
  102d0d:	75 d4                	jne    102ce3 <runcmd+0xc1>
			return commands[i].func (argc, argv, tf);
  102d0f:	8d 14 76             	lea    (%esi,%esi,2),%edx
  102d12:	8d 04 95 00 00 00 00 	lea    0x0(,%edx,4),%eax
  102d19:	83 ec 04             	sub    $0x4,%esp
  102d1c:	ff 74 24 10          	pushl  0x10(%esp)
  102d20:	8d 54 24 18          	lea    0x18(%esp),%edx
  102d24:	52                   	push   %edx
  102d25:	57                   	push   %edi
  102d26:	ff 94 03 c8 ff ff ff 	call   *-0x38(%ebx,%eax,1)
  102d2d:	89 c7                	mov    %eax,%edi
  102d2f:	83 c4 10             	add    $0x10,%esp
  102d32:	e9 4f ff ff ff       	jmp    102c86 <runcmd+0x64>
	dprintf("Unknown command '%s'\n", argv[0]);
  102d37:	83 ec 08             	sub    $0x8,%esp
  102d3a:	ff 74 24 18          	pushl  0x18(%esp)
  102d3e:	8d 83 df a9 ff ff    	lea    -0x5621(%ebx),%eax
  102d44:	50                   	push   %eax
  102d45:	e8 ba f4 ff ff       	call   102204 <dprintf>
	return 0;
  102d4a:	83 c4 10             	add    $0x10,%esp
  102d4d:	bf 00 00 00 00       	mov    $0x0,%edi
  102d52:	e9 2f ff ff ff       	jmp    102c86 <runcmd+0x64>

00102d57 <monitor>:

void
monitor (struct Trapframe *tf)
{
  102d57:	57                   	push   %edi
  102d58:	56                   	push   %esi
  102d59:	53                   	push   %ebx
  102d5a:	e8 b0 d5 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  102d5f:	81 c3 a1 92 00 00    	add    $0x92a1,%ebx
  102d65:	8b 74 24 10          	mov    0x10(%esp),%esi
	char *buf;

	dprintf("\n****************************************\n\n");
  102d69:	83 ec 0c             	sub    $0xc,%esp
  102d6c:	8d bb a4 aa ff ff    	lea    -0x555c(%ebx),%edi
  102d72:	57                   	push   %edi
  102d73:	e8 8c f4 ff ff       	call   102204 <dprintf>
	dprintf("Welcome to the mCertiKOS kernel monitor!\n");
  102d78:	8d 83 d0 aa ff ff    	lea    -0x5530(%ebx),%eax
  102d7e:	89 04 24             	mov    %eax,(%esp)
  102d81:	e8 7e f4 ff ff       	call   102204 <dprintf>
	dprintf("\n****************************************\n\n");
  102d86:	89 3c 24             	mov    %edi,(%esp)
  102d89:	e8 76 f4 ff ff       	call   102204 <dprintf>
	dprintf("Type 'help' for a list of commands.\n");
  102d8e:	8d 83 fc aa ff ff    	lea    -0x5504(%ebx),%eax
  102d94:	89 04 24             	mov    %eax,(%esp)
  102d97:	e8 68 f4 ff ff       	call   102204 <dprintf>
  102d9c:	83 c4 10             	add    $0x10,%esp

	while (1)
	{
		buf = (char *) readline ("$> ");
  102d9f:	83 ec 0c             	sub    $0xc,%esp
  102da2:	8d 83 f5 a9 ff ff    	lea    -0x560b(%ebx),%eax
  102da8:	50                   	push   %eax
  102da9:	e8 8d d6 ff ff       	call   10043b <readline>
		if (buf != NULL)
  102dae:	83 c4 10             	add    $0x10,%esp
  102db1:	85 c0                	test   %eax,%eax
  102db3:	74 ea                	je     102d9f <monitor+0x48>
			if (runcmd (buf, tf) < 0)
  102db5:	89 f2                	mov    %esi,%edx
  102db7:	e8 66 fe ff ff       	call   102c22 <runcmd>
  102dbc:	85 c0                	test   %eax,%eax
  102dbe:	79 df                	jns    102d9f <monitor+0x48>
				break;
	}
}
  102dc0:	5b                   	pop    %ebx
  102dc1:	5e                   	pop    %esi
  102dc2:	5f                   	pop    %edi
  102dc3:	c3                   	ret    

00102dc4 <pt_copyin>:
extern void alloc_page(unsigned int pid, unsigned int vaddr, unsigned int perm);
extern unsigned int get_ptbl_entry_by_va(unsigned int pid, unsigned int vaddr);

size_t
pt_copyin(uint32_t pmap_id, uintptr_t uva, void *kva, size_t len)
{
  102dc4:	55                   	push   %ebp
  102dc5:	57                   	push   %edi
  102dc6:	56                   	push   %esi
  102dc7:	53                   	push   %ebx
  102dc8:	83 ec 1c             	sub    $0x1c,%esp
  102dcb:	e8 3f d5 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  102dd0:	81 c3 30 92 00 00    	add    $0x9230,%ebx
  102dd6:	8b 7c 24 34          	mov    0x34(%esp),%edi
  102dda:	8b 6c 24 3c          	mov    0x3c(%esp),%ebp
	if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
  102dde:	81 ff ff ff ff 3f    	cmp    $0x3fffffff,%edi
  102de4:	0f 86 a2 00 00 00    	jbe    102e8c <pt_copyin+0xc8>
  102dea:	8d 04 2f             	lea    (%edi,%ebp,1),%eax
  102ded:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  102df2:	0f 87 a8 00 00 00    	ja     102ea0 <pt_copyin+0xdc>
		return 0;

	if ((uintptr_t) kva + len > VM_USERHI)
  102df8:	89 e8                	mov    %ebp,%eax
  102dfa:	03 44 24 38          	add    0x38(%esp),%eax
  102dfe:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  102e03:	0f 87 a1 00 00 00    	ja     102eaa <pt_copyin+0xe6>
		return 0;

	size_t copied = 0;
  102e09:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102e10:	00 
  102e11:	eb 40                	jmp    102e53 <pt_copyin+0x8f>
		if ((uva_pa & PTE_P) == 0) {
			alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
		}

		uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  102e13:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  102e18:	89 fa                	mov    %edi,%edx
  102e1a:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102e20:	09 d0                	or     %edx,%eax

		size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  102e22:	89 c2                	mov    %eax,%edx
  102e24:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102e2a:	be 00 10 00 00       	mov    $0x1000,%esi
  102e2f:	29 d6                	sub    %edx,%esi
  102e31:	39 ee                	cmp    %ebp,%esi
  102e33:	0f 47 f5             	cmova  %ebp,%esi
			len : PAGESIZE - uva_pa % PAGESIZE;

		memcpy(kva, (void *) uva_pa, size);
  102e36:	83 ec 04             	sub    $0x4,%esp
  102e39:	56                   	push   %esi
  102e3a:	50                   	push   %eax
  102e3b:	ff 74 24 44          	pushl  0x44(%esp)
  102e3f:	e8 cb f0 ff ff       	call   101f0f <memcpy>

		len -= size;
  102e44:	29 f5                	sub    %esi,%ebp
		uva += size;
  102e46:	01 f7                	add    %esi,%edi
		kva += size;
  102e48:	01 74 24 48          	add    %esi,0x48(%esp)
		copied += size;
  102e4c:	01 74 24 1c          	add    %esi,0x1c(%esp)
  102e50:	83 c4 10             	add    $0x10,%esp
	while (len) {
  102e53:	85 ed                	test   %ebp,%ebp
  102e55:	74 3d                	je     102e94 <pt_copyin+0xd0>
		uintptr_t uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  102e57:	83 ec 08             	sub    $0x8,%esp
  102e5a:	57                   	push   %edi
  102e5b:	ff 74 24 3c          	pushl  0x3c(%esp)
  102e5f:	e8 ac 16 00 00       	call   104510 <get_ptbl_entry_by_va>
		if ((uva_pa & PTE_P) == 0) {
  102e64:	83 c4 10             	add    $0x10,%esp
  102e67:	a8 01                	test   $0x1,%al
  102e69:	75 a8                	jne    102e13 <pt_copyin+0x4f>
			alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
  102e6b:	83 ec 04             	sub    $0x4,%esp
  102e6e:	6a 07                	push   $0x7
  102e70:	57                   	push   %edi
  102e71:	ff 74 24 3c          	pushl  0x3c(%esp)
  102e75:	e8 c6 20 00 00       	call   104f40 <alloc_page>
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  102e7a:	83 c4 08             	add    $0x8,%esp
  102e7d:	57                   	push   %edi
  102e7e:	ff 74 24 3c          	pushl  0x3c(%esp)
  102e82:	e8 89 16 00 00       	call   104510 <get_ptbl_entry_by_va>
  102e87:	83 c4 10             	add    $0x10,%esp
  102e8a:	eb 87                	jmp    102e13 <pt_copyin+0x4f>
		return 0;
  102e8c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102e93:	00 
	}

	return copied;
}
  102e94:	8b 44 24 0c          	mov    0xc(%esp),%eax
  102e98:	83 c4 1c             	add    $0x1c,%esp
  102e9b:	5b                   	pop    %ebx
  102e9c:	5e                   	pop    %esi
  102e9d:	5f                   	pop    %edi
  102e9e:	5d                   	pop    %ebp
  102e9f:	c3                   	ret    
		return 0;
  102ea0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102ea7:	00 
  102ea8:	eb ea                	jmp    102e94 <pt_copyin+0xd0>
		return 0;
  102eaa:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102eb1:	00 
  102eb2:	eb e0                	jmp    102e94 <pt_copyin+0xd0>

00102eb4 <pt_copyout>:

size_t
pt_copyout(void *kva, uint32_t pmap_id, uintptr_t uva, size_t len)
{
  102eb4:	55                   	push   %ebp
  102eb5:	57                   	push   %edi
  102eb6:	56                   	push   %esi
  102eb7:	53                   	push   %ebx
  102eb8:	83 ec 1c             	sub    $0x1c,%esp
  102ebb:	e8 4f d4 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  102ec0:	81 c3 40 91 00 00    	add    $0x9140,%ebx
  102ec6:	8b 7c 24 38          	mov    0x38(%esp),%edi
  102eca:	8b 6c 24 3c          	mov    0x3c(%esp),%ebp
	if (!(VM_USERLO <= uva && uva + len <= VM_USERHI))
  102ece:	81 ff ff ff ff 3f    	cmp    $0x3fffffff,%edi
  102ed4:	0f 86 a2 00 00 00    	jbe    102f7c <pt_copyout+0xc8>
  102eda:	8d 04 2f             	lea    (%edi,%ebp,1),%eax
  102edd:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  102ee2:	0f 87 a8 00 00 00    	ja     102f90 <pt_copyout+0xdc>
		return 0;

	if ((uintptr_t) kva + len > VM_USERHI)
  102ee8:	89 e8                	mov    %ebp,%eax
  102eea:	03 44 24 30          	add    0x30(%esp),%eax
  102eee:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  102ef3:	0f 87 a1 00 00 00    	ja     102f9a <pt_copyout+0xe6>
		return 0;

	size_t copied = 0;
  102ef9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102f00:	00 
  102f01:	eb 40                	jmp    102f43 <pt_copyout+0x8f>
		if ((uva_pa & PTE_P) == 0) {
			alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
		}

		uva_pa = (uva_pa & 0xfffff000) + (uva % PAGESIZE);
  102f03:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  102f08:	89 fa                	mov    %edi,%edx
  102f0a:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102f10:	09 d0                	or     %edx,%eax

		size_t size = (len < PAGESIZE - uva_pa % PAGESIZE) ?
  102f12:	89 c2                	mov    %eax,%edx
  102f14:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102f1a:	be 00 10 00 00       	mov    $0x1000,%esi
  102f1f:	29 d6                	sub    %edx,%esi
  102f21:	39 ee                	cmp    %ebp,%esi
  102f23:	0f 47 f5             	cmova  %ebp,%esi
			len : PAGESIZE - uva_pa % PAGESIZE;

		memcpy((void *) uva_pa, kva, size);
  102f26:	83 ec 04             	sub    $0x4,%esp
  102f29:	56                   	push   %esi
  102f2a:	ff 74 24 38          	pushl  0x38(%esp)
  102f2e:	50                   	push   %eax
  102f2f:	e8 db ef ff ff       	call   101f0f <memcpy>

		len -= size;
  102f34:	29 f5                	sub    %esi,%ebp
		uva += size;
  102f36:	01 f7                	add    %esi,%edi
		kva += size;
  102f38:	01 74 24 40          	add    %esi,0x40(%esp)
		copied += size;
  102f3c:	01 74 24 1c          	add    %esi,0x1c(%esp)
  102f40:	83 c4 10             	add    $0x10,%esp
	while (len) {
  102f43:	85 ed                	test   %ebp,%ebp
  102f45:	74 3d                	je     102f84 <pt_copyout+0xd0>
		uintptr_t uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  102f47:	83 ec 08             	sub    $0x8,%esp
  102f4a:	57                   	push   %edi
  102f4b:	ff 74 24 40          	pushl  0x40(%esp)
  102f4f:	e8 bc 15 00 00       	call   104510 <get_ptbl_entry_by_va>
		if ((uva_pa & PTE_P) == 0) {
  102f54:	83 c4 10             	add    $0x10,%esp
  102f57:	a8 01                	test   $0x1,%al
  102f59:	75 a8                	jne    102f03 <pt_copyout+0x4f>
			alloc_page(pmap_id, uva, PTE_P | PTE_U | PTE_W);
  102f5b:	83 ec 04             	sub    $0x4,%esp
  102f5e:	6a 07                	push   $0x7
  102f60:	57                   	push   %edi
  102f61:	ff 74 24 40          	pushl  0x40(%esp)
  102f65:	e8 d6 1f 00 00       	call   104f40 <alloc_page>
			uva_pa = get_ptbl_entry_by_va(pmap_id, uva);
  102f6a:	83 c4 08             	add    $0x8,%esp
  102f6d:	57                   	push   %edi
  102f6e:	ff 74 24 40          	pushl  0x40(%esp)
  102f72:	e8 99 15 00 00       	call   104510 <get_ptbl_entry_by_va>
  102f77:	83 c4 10             	add    $0x10,%esp
  102f7a:	eb 87                	jmp    102f03 <pt_copyout+0x4f>
		return 0;
  102f7c:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102f83:	00 
	}

	return copied;
}
  102f84:	8b 44 24 0c          	mov    0xc(%esp),%eax
  102f88:	83 c4 1c             	add    $0x1c,%esp
  102f8b:	5b                   	pop    %ebx
  102f8c:	5e                   	pop    %esi
  102f8d:	5f                   	pop    %edi
  102f8e:	5d                   	pop    %ebp
  102f8f:	c3                   	ret    
		return 0;
  102f90:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102f97:	00 
  102f98:	eb ea                	jmp    102f84 <pt_copyout+0xd0>
		return 0;
  102f9a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  102fa1:	00 
  102fa2:	eb e0                	jmp    102f84 <pt_copyout+0xd0>

00102fa4 <pt_memset>:

size_t
pt_memset(uint32_t pmap_id, uintptr_t va, char c, size_t len)
{
  102fa4:	55                   	push   %ebp
  102fa5:	57                   	push   %edi
  102fa6:	56                   	push   %esi
  102fa7:	53                   	push   %ebx
  102fa8:	83 ec 1c             	sub    $0x1c,%esp
  102fab:	e8 5f d3 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  102fb0:	81 c3 50 90 00 00    	add    $0x9050,%ebx
  102fb6:	8b 6c 24 34          	mov    0x34(%esp),%ebp
  102fba:	8b 7c 24 3c          	mov    0x3c(%esp),%edi
  102fbe:	0f b6 44 24 38       	movzbl 0x38(%esp),%eax
  102fc3:	88 44 24 0f          	mov    %al,0xf(%esp)
        size_t set = 0;
  102fc7:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  102fce:	00 

	while (len) {
  102fcf:	eb 3e                	jmp    10300f <pt_memset+0x6b>
		if ((pa & PTE_P) == 0) {
			alloc_page(pmap_id, va, PTE_P | PTE_U | PTE_W);
			pa = get_ptbl_entry_by_va(pmap_id, va);
		}

		pa = (pa & 0xfffff000) + (va % PAGESIZE);
  102fd1:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  102fd6:	89 ea                	mov    %ebp,%edx
  102fd8:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102fde:	09 d0                	or     %edx,%eax

		size_t size = (len < PAGESIZE - pa % PAGESIZE) ?
  102fe0:	89 c2                	mov    %eax,%edx
  102fe2:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
  102fe8:	be 00 10 00 00       	mov    $0x1000,%esi
  102fed:	29 d6                	sub    %edx,%esi
  102fef:	39 fe                	cmp    %edi,%esi
  102ff1:	0f 47 f7             	cmova  %edi,%esi
			len : PAGESIZE - pa % PAGESIZE;

		memset((void *) pa, c, size);
  102ff4:	83 ec 04             	sub    $0x4,%esp
  102ff7:	56                   	push   %esi
  102ff8:	0f be 54 24 17       	movsbl 0x17(%esp),%edx
  102ffd:	52                   	push   %edx
  102ffe:	50                   	push   %eax
  102fff:	e8 57 ee ff ff       	call   101e5b <memset>

		len -= size;
  103004:	29 f7                	sub    %esi,%edi
		va += size;
  103006:	01 f5                	add    %esi,%ebp
		set += size;
  103008:	01 74 24 18          	add    %esi,0x18(%esp)
  10300c:	83 c4 10             	add    $0x10,%esp
	while (len) {
  10300f:	85 ff                	test   %edi,%edi
  103011:	74 35                	je     103048 <pt_memset+0xa4>
		uintptr_t pa = get_ptbl_entry_by_va(pmap_id, va);
  103013:	83 ec 08             	sub    $0x8,%esp
  103016:	55                   	push   %ebp
  103017:	ff 74 24 3c          	pushl  0x3c(%esp)
  10301b:	e8 f0 14 00 00       	call   104510 <get_ptbl_entry_by_va>
		if ((pa & PTE_P) == 0) {
  103020:	83 c4 10             	add    $0x10,%esp
  103023:	a8 01                	test   $0x1,%al
  103025:	75 aa                	jne    102fd1 <pt_memset+0x2d>
			alloc_page(pmap_id, va, PTE_P | PTE_U | PTE_W);
  103027:	83 ec 04             	sub    $0x4,%esp
  10302a:	6a 07                	push   $0x7
  10302c:	55                   	push   %ebp
  10302d:	ff 74 24 3c          	pushl  0x3c(%esp)
  103031:	e8 0a 1f 00 00       	call   104f40 <alloc_page>
			pa = get_ptbl_entry_by_va(pmap_id, va);
  103036:	83 c4 08             	add    $0x8,%esp
  103039:	55                   	push   %ebp
  10303a:	ff 74 24 3c          	pushl  0x3c(%esp)
  10303e:	e8 cd 14 00 00       	call   104510 <get_ptbl_entry_by_va>
  103043:	83 c4 10             	add    $0x10,%esp
  103046:	eb 89                	jmp    102fd1 <pt_memset+0x2d>
	}

	return set;
}
  103048:	8b 44 24 08          	mov    0x8(%esp),%eax
  10304c:	83 c4 1c             	add    $0x1c,%esp
  10304f:	5b                   	pop    %ebx
  103050:	5e                   	pop    %esi
  103051:	5f                   	pop    %edi
  103052:	5d                   	pop    %ebp
  103053:	c3                   	ret    

00103054 <elf_load>:
/*
 * Load elf execution file exe to the virtual address space pmap.
 */
void
elf_load (void *exe_ptr, int pid)
{
  103054:	55                   	push   %ebp
  103055:	57                   	push   %edi
  103056:	56                   	push   %esi
  103057:	53                   	push   %ebx
  103058:	83 ec 2c             	sub    $0x2c,%esp
  10305b:	e8 af d2 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103060:	81 c3 a0 8f 00 00    	add    $0x8fa0,%ebx
  103066:	8b 74 24 40          	mov    0x40(%esp),%esi
	elfhdr *eh;
	proghdr *ph, *eph;
	sechdr *sh, *esh;
	char *strtab;
	uintptr_t exe = (uintptr_t) exe_ptr;
  10306a:	89 74 24 1c          	mov    %esi,0x1c(%esp)

	eh = (elfhdr *) exe;

	KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  10306e:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  103074:	75 3a                	jne    1030b0 <elf_load+0x5c>
	KERN_ASSERT(eh->e_shstrndx != ELF_SHN_UNDEF);
  103076:	66 83 7e 32 00       	cmpw   $0x0,0x32(%esi)
  10307b:	74 54                	je     1030d1 <elf_load+0x7d>

	sh = (sechdr *) ((uintptr_t) eh + eh->e_shoff);
  10307d:	89 f1                	mov    %esi,%ecx
  10307f:	03 4e 20             	add    0x20(%esi),%ecx
	esh = sh + eh->e_shnum;

	strtab = (char *) (exe + sh[eh->e_shstrndx].sh_offset);
  103082:	0f b7 46 32          	movzwl 0x32(%esi),%eax
  103086:	8d 14 80             	lea    (%eax,%eax,4),%edx
  103089:	8d 04 d5 00 00 00 00 	lea    0x0(,%edx,8),%eax
	KERN_ASSERT(sh[eh->e_shstrndx].sh_type == ELF_SHT_STRTAB);
  103090:	83 7c 01 04 03       	cmpl   $0x3,0x4(%ecx,%eax,1)
  103095:	75 5b                	jne    1030f2 <elf_load+0x9e>

	ph = (proghdr *) ((uintptr_t) eh + eh->e_phoff);
  103097:	89 f2                	mov    %esi,%edx
  103099:	03 56 1c             	add    0x1c(%esi),%edx
  10309c:	89 d5                	mov    %edx,%ebp
	eph = ph + eh->e_phnum;
  10309e:	0f b7 46 2c          	movzwl 0x2c(%esi),%eax
  1030a2:	c1 e0 05             	shl    $0x5,%eax
  1030a5:	01 d0                	add    %edx,%eax
  1030a7:	89 44 24 14          	mov    %eax,0x14(%esp)

	for (; ph < eph; ph++)
  1030ab:	e9 09 01 00 00       	jmp    1031b9 <elf_load+0x165>
	KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  1030b0:	8d 83 49 ab ff ff    	lea    -0x54b7(%ebx),%eax
  1030b6:	50                   	push   %eax
  1030b7:	8d 83 57 a6 ff ff    	lea    -0x59a9(%ebx),%eax
  1030bd:	50                   	push   %eax
  1030be:	6a 20                	push   $0x20
  1030c0:	8d 83 62 ab ff ff    	lea    -0x549e(%ebx),%eax
  1030c6:	50                   	push   %eax
  1030c7:	e8 a5 ef ff ff       	call   102071 <debug_panic>
  1030cc:	83 c4 10             	add    $0x10,%esp
  1030cf:	eb a5                	jmp    103076 <elf_load+0x22>
	KERN_ASSERT(eh->e_shstrndx != ELF_SHN_UNDEF);
  1030d1:	8d 83 74 ab ff ff    	lea    -0x548c(%ebx),%eax
  1030d7:	50                   	push   %eax
  1030d8:	8d 83 57 a6 ff ff    	lea    -0x59a9(%ebx),%eax
  1030de:	50                   	push   %eax
  1030df:	6a 21                	push   $0x21
  1030e1:	8d 83 62 ab ff ff    	lea    -0x549e(%ebx),%eax
  1030e7:	50                   	push   %eax
  1030e8:	e8 84 ef ff ff       	call   102071 <debug_panic>
  1030ed:	83 c4 10             	add    $0x10,%esp
  1030f0:	eb 8b                	jmp    10307d <elf_load+0x29>
	KERN_ASSERT(sh[eh->e_shstrndx].sh_type == ELF_SHT_STRTAB);
  1030f2:	8d 83 94 ab ff ff    	lea    -0x546c(%ebx),%eax
  1030f8:	50                   	push   %eax
  1030f9:	8d 83 57 a6 ff ff    	lea    -0x59a9(%ebx),%eax
  1030ff:	50                   	push   %eax
  103100:	6a 27                	push   $0x27
  103102:	8d 83 62 ab ff ff    	lea    -0x549e(%ebx),%eax
  103108:	50                   	push   %eax
  103109:	e8 63 ef ff ff       	call   102071 <debug_panic>
  10310e:	83 c4 10             	add    $0x10,%esp
  103111:	eb 84                	jmp    103097 <elf_load+0x43>
			alloc_page (pid, va, perm);

			if (va < rounddown (zva, PAGESIZE))
			{
				/* copy a complete page */
				pt_copyout ((void *) fa, pid, va, PAGESIZE);
  103113:	68 00 10 00 00       	push   $0x1000
  103118:	56                   	push   %esi
  103119:	55                   	push   %ebp
  10311a:	57                   	push   %edi
  10311b:	e8 94 fd ff ff       	call   102eb4 <pt_copyout>
  103120:	83 c4 10             	add    $0x10,%esp
  103123:	eb 11                	jmp    103136 <elf_load+0xe2>
				pt_copyout ((void *) fa, pid, va, zva - va);
			}
			else
			{
				/* zero a page */
				pt_memset (pid, va, 0, PAGESIZE);
  103125:	68 00 10 00 00       	push   $0x1000
  10312a:	6a 00                	push   $0x0
  10312c:	56                   	push   %esi
  10312d:	55                   	push   %ebp
  10312e:	e8 71 fe ff ff       	call   102fa4 <pt_memset>
  103133:	83 c4 10             	add    $0x10,%esp
		for (; va < eva; va += PAGESIZE, fa += PAGESIZE)
  103136:	81 c6 00 10 00 00    	add    $0x1000,%esi
  10313c:	81 c7 00 10 00 00    	add    $0x1000,%edi
  103142:	3b 74 24 0c          	cmp    0xc(%esp),%esi
  103146:	73 6a                	jae    1031b2 <elf_load+0x15e>
			alloc_page (pid, va, perm);
  103148:	83 ec 04             	sub    $0x4,%esp
  10314b:	ff 74 24 14          	pushl  0x14(%esp)
  10314f:	56                   	push   %esi
  103150:	55                   	push   %ebp
  103151:	e8 ea 1d 00 00       	call   104f40 <alloc_page>
			if (va < rounddown (zva, PAGESIZE))
  103156:	83 c4 08             	add    $0x8,%esp
  103159:	68 00 10 00 00       	push   $0x1000
  10315e:	ff 74 24 14          	pushl  0x14(%esp)
  103162:	e8 08 f8 ff ff       	call   10296f <rounddown>
  103167:	83 c4 10             	add    $0x10,%esp
  10316a:	39 f0                	cmp    %esi,%eax
  10316c:	77 a5                	ja     103113 <elf_load+0xbf>
			else if (va < zva && ph->p_filesz)
  10316e:	3b 74 24 08          	cmp    0x8(%esp),%esi
  103172:	73 b1                	jae    103125 <elf_load+0xd1>
  103174:	8b 44 24 18          	mov    0x18(%esp),%eax
  103178:	83 78 10 00          	cmpl   $0x0,0x10(%eax)
  10317c:	74 a7                	je     103125 <elf_load+0xd1>
				pt_memset (pid, va, 0, PAGESIZE);
  10317e:	68 00 10 00 00       	push   $0x1000
  103183:	6a 00                	push   $0x0
  103185:	56                   	push   %esi
  103186:	55                   	push   %ebp
  103187:	e8 18 fe ff ff       	call   102fa4 <pt_memset>
				pt_copyout ((void *) fa, pid, va, zva - va);
  10318c:	8b 44 24 18          	mov    0x18(%esp),%eax
  103190:	29 f0                	sub    %esi,%eax
  103192:	50                   	push   %eax
  103193:	56                   	push   %esi
  103194:	55                   	push   %ebp
  103195:	57                   	push   %edi
  103196:	e8 19 fd ff ff       	call   102eb4 <pt_copyout>
  10319b:	83 c4 20             	add    $0x20,%esp
  10319e:	eb 96                	jmp    103136 <elf_load+0xe2>
			perm |= PTE_W;
  1031a0:	c7 44 24 10 07 00 00 	movl   $0x7,0x10(%esp)
  1031a7:	00 
  1031a8:	89 6c 24 18          	mov    %ebp,0x18(%esp)
  1031ac:	8b 6c 24 44          	mov    0x44(%esp),%ebp
  1031b0:	eb 90                	jmp    103142 <elf_load+0xee>
  1031b2:	8b 6c 24 18          	mov    0x18(%esp),%ebp
	for (; ph < eph; ph++)
  1031b6:	83 c5 20             	add    $0x20,%ebp
  1031b9:	3b 6c 24 14          	cmp    0x14(%esp),%ebp
  1031bd:	73 6e                	jae    10322d <elf_load+0x1d9>
		if (ph->p_type != ELF_PROG_LOAD)
  1031bf:	83 7d 00 01          	cmpl   $0x1,0x0(%ebp)
  1031c3:	75 f1                	jne    1031b6 <elf_load+0x162>
		fa = (uintptr_t) eh + rounddown (ph->p_offset, PAGESIZE);
  1031c5:	83 ec 08             	sub    $0x8,%esp
  1031c8:	68 00 10 00 00       	push   $0x1000
  1031cd:	ff 75 04             	pushl  0x4(%ebp)
  1031d0:	e8 9a f7 ff ff       	call   10296f <rounddown>
  1031d5:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
  1031d9:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
		va = rounddown (ph->p_va, PAGESIZE);
  1031dc:	83 c4 08             	add    $0x8,%esp
  1031df:	68 00 10 00 00       	push   $0x1000
  1031e4:	ff 75 08             	pushl  0x8(%ebp)
  1031e7:	e8 83 f7 ff ff       	call   10296f <rounddown>
  1031ec:	89 c6                	mov    %eax,%esi
		zva = ph->p_va + ph->p_filesz;
  1031ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1031f1:	89 c1                	mov    %eax,%ecx
  1031f3:	03 4d 10             	add    0x10(%ebp),%ecx
  1031f6:	89 4c 24 18          	mov    %ecx,0x18(%esp)
		eva = roundup (ph->p_va + ph->p_memsz, PAGESIZE);
  1031fa:	03 45 14             	add    0x14(%ebp),%eax
  1031fd:	83 c4 08             	add    $0x8,%esp
  103200:	68 00 10 00 00       	push   $0x1000
  103205:	50                   	push   %eax
  103206:	e8 78 f7 ff ff       	call   102983 <roundup>
  10320b:	89 44 24 1c          	mov    %eax,0x1c(%esp)
		if (ph->p_flags & ELF_PROG_FLAG_WRITE)
  10320f:	83 c4 10             	add    $0x10,%esp
  103212:	f6 45 18 02          	testb  $0x2,0x18(%ebp)
  103216:	75 88                	jne    1031a0 <elf_load+0x14c>
		perm = PTE_U | PTE_P;
  103218:	c7 44 24 10 05 00 00 	movl   $0x5,0x10(%esp)
  10321f:	00 
  103220:	89 6c 24 18          	mov    %ebp,0x18(%esp)
  103224:	8b 6c 24 44          	mov    0x44(%esp),%ebp
  103228:	e9 15 ff ff ff       	jmp    103142 <elf_load+0xee>
			}
		}
	}

}
  10322d:	83 c4 2c             	add    $0x2c,%esp
  103230:	5b                   	pop    %ebx
  103231:	5e                   	pop    %esi
  103232:	5f                   	pop    %edi
  103233:	5d                   	pop    %ebp
  103234:	c3                   	ret    

00103235 <elf_entry>:

uintptr_t
elf_entry (void *exe_ptr)
{
  103235:	56                   	push   %esi
  103236:	53                   	push   %ebx
  103237:	83 ec 04             	sub    $0x4,%esp
  10323a:	e8 d0 d0 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10323f:	81 c3 c1 8d 00 00    	add    $0x8dc1,%ebx
  103245:	8b 74 24 10          	mov    0x10(%esp),%esi
	uintptr_t exe = (uintptr_t) exe_ptr;
	elfhdr *eh = (elfhdr *) exe;
	KERN_ASSERT(eh->e_magic == ELF_MAGIC);
  103249:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  10324f:	74 1f                	je     103270 <elf_entry+0x3b>
  103251:	8d 83 49 ab ff ff    	lea    -0x54b7(%ebx),%eax
  103257:	50                   	push   %eax
  103258:	8d 83 57 a6 ff ff    	lea    -0x59a9(%ebx),%eax
  10325e:	50                   	push   %eax
  10325f:	6a 5b                	push   $0x5b
  103261:	8d 83 62 ab ff ff    	lea    -0x549e(%ebx),%eax
  103267:	50                   	push   %eax
  103268:	e8 04 ee ff ff       	call   102071 <debug_panic>
  10326d:	83 c4 10             	add    $0x10,%esp
	return (uintptr_t) eh->e_entry;
  103270:	8b 46 18             	mov    0x18(%esi),%eax
}
  103273:	83 c4 04             	add    $0x4,%esp
  103276:	5b                   	pop    %ebx
  103277:	5e                   	pop    %esi
  103278:	c3                   	ret    
  103279:	66 90                	xchg   %ax,%ax
  10327b:	66 90                	xchg   %ax,%ax
  10327d:	66 90                	xchg   %ax,%ax
  10327f:	90                   	nop

00103280 <kern_init>:
    #endif
}

void
kern_init (uintptr_t mbi_addr)
{
  103280:	56                   	push   %esi
  103281:	53                   	push   %ebx
  103282:	e8 88 d0 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103287:	81 c3 79 8d 00 00    	add    $0x8d79,%ebx
  10328d:	83 ec 10             	sub    $0x10,%esp
    thread_init(mbi_addr);
  103290:	ff 74 24 1c          	pushl  0x1c(%esp)

    KERN_DEBUG("Kernel initialized.\n");
  103294:	8d b3 d6 ab ff ff    	lea    -0x542a(%ebx),%esi
    thread_init(mbi_addr);
  10329a:	e8 91 26 00 00       	call   105930 <thread_init>
    KERN_DEBUG("Kernel initialized.\n");
  10329f:	8d 83 c1 ab ff ff    	lea    -0x543f(%ebx),%eax
  1032a5:	83 c4 0c             	add    $0xc,%esp
  1032a8:	50                   	push   %eax
  1032a9:	6a 39                	push   $0x39
  1032ab:	56                   	push   %esi
  1032ac:	e8 87 ed ff ff       	call   102038 <debug_normal>
    KERN_DEBUG("In kernel main.\n\n");
  1032b1:	8d 83 e7 ab ff ff    	lea    -0x5419(%ebx),%eax
  1032b7:	83 c4 0c             	add    $0xc,%esp
  1032ba:	50                   	push   %eax
  1032bb:	6a 10                	push   $0x10
  1032bd:	56                   	push   %esi
  1032be:	e8 75 ed ff ff       	call   102038 <debug_normal>
    monitor(NULL);
  1032c3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1032ca:	e8 88 fa ff ff       	call   102d57 <monitor>

    kern_main ();
}
  1032cf:	83 c4 14             	add    $0x14,%esp
  1032d2:	5b                   	pop    %ebx
  1032d3:	5e                   	pop    %esi
  1032d4:	c3                   	ret    
  1032d5:	66 90                	xchg   %ax,%ax
  1032d7:	90                   	nop
  1032d8:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  1032de:	00 00                	add    %al,(%eax)
  1032e0:	fb                   	sti    
  1032e1:	4f                   	dec    %edi
  1032e2:	52                   	push   %edx
  1032e3:	e4                   	.byte 0xe4

001032e4 <start>:
	.long	CHECKSUM

	/* this is the entry of the kernel */
	.globl	start
start:
	cli
  1032e4:	fa                   	cli    

	/* check whether the bootloader provide multiboot information */
	cmpl    $MULTIBOOT_BOOTLOADER_MAGIC, %eax
  1032e5:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
	jne     spin
  1032ea:	75 27                	jne    103313 <spin>
	movl	%ebx, multiboot_ptr
  1032ec:	89 1d 14 33 10 00    	mov    %ebx,0x103314

	/* tell BIOS to warmboot next time */
	movw	$0x1234,0x472
  1032f2:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
  1032f9:	34 12 

	/* clear EFLAGS */
	pushl	$0x2
  1032fb:	6a 02                	push   $0x2
	popfl
  1032fd:	9d                   	popf   

	/* prepare the kernel stack  */
	movl	$0x0,%ebp
  1032fe:	bd 00 00 00 00       	mov    $0x0,%ebp
	movl	$(bsp_kstack+4096),%esp
  103303:	bc 00 c0 96 00       	mov    $0x96c000,%esp

	/* jump to the C code */
	push	multiboot_ptr
  103308:	ff 35 14 33 10 00    	pushl  0x103314
	call	kern_init
  10330e:	e8 6d ff ff ff       	call   103280 <kern_init>

00103313 <spin>:

	/* should not be here */
spin:
	hlt
  103313:	f4                   	hlt    

00103314 <multiboot_ptr>:
  103314:	00 00                	add    %al,(%eax)
  103316:	00 00                	add    %al,(%eax)
  103318:	66 90                	xchg   %ax,%ax
  10331a:	66 90                	xchg   %ax,%ax
  10331c:	66 90                	xchg   %ax,%ax
  10331e:	66 90                	xchg   %ax,%ax

00103320 <get_nps>:
static struct ATStruct AT[1 << 20];  

//The getter function for NUM_PAGES.
unsigned int
get_nps(void)
{
  103320:	e8 a8 da ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  103325:	05 db 8c 00 00       	add    $0x8cdb,%eax
	return NUM_PAGES;
  10332a:	8b 80 60 df 81 00    	mov    0x81df60(%eax),%eax
}
  103330:	c3                   	ret    
  103331:	eb 0d                	jmp    103340 <set_nps>
  103333:	90                   	nop
  103334:	90                   	nop
  103335:	90                   	nop
  103336:	90                   	nop
  103337:	90                   	nop
  103338:	90                   	nop
  103339:	90                   	nop
  10333a:	90                   	nop
  10333b:	90                   	nop
  10333c:	90                   	nop
  10333d:	90                   	nop
  10333e:	90                   	nop
  10333f:	90                   	nop

00103340 <set_nps>:

//The setter function for NUM_PAGES.
void
set_nps(unsigned int nps)
{
	NUM_PAGES = nps;
  103340:	8b 54 24 04          	mov    0x4(%esp),%edx
  103344:	e8 84 da ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  103349:	05 b7 8c 00 00       	add    $0x8cb7,%eax
  10334e:	89 90 60 df 81 00    	mov    %edx,0x81df60(%eax)
}
  103354:	c3                   	ret    
  103355:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103360 <at_is_norm>:
  */
unsigned int
at_is_norm(unsigned int page_index)
{
  //TODO
  if(AT[page_index].perm > 1)
  103360:	8b 54 24 04          	mov    0x4(%esp),%edx
  103364:	e8 64 da ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  103369:	05 97 8c 00 00       	add    $0x8c97,%eax
  10336e:	83 bc d0 60 df 01 00 	cmpl   $0x1,0x1df60(%eax,%edx,8)
  103375:	01 
  103376:	0f 97 c0             	seta   %al
  103379:	0f b6 c0             	movzbl %al,%eax
    return 1;
  return 0;
}
  10337c:	c3                   	ret    
  10337d:	8d 76 00             	lea    0x0(%esi),%esi

00103380 <at_set_perm>:
  *  - It also marks the page as unallocated.
  * Hint: See the definition of ATStruct for allocated.
  */
void
at_set_perm(unsigned int page_index, unsigned int norm_val)
{
  103380:	8b 54 24 04          	mov    0x4(%esp),%edx
  //TODO
  AT[page_index].perm = norm_val;
  103384:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  103388:	e8 40 da ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  10338d:	05 73 8c 00 00       	add    $0x8c73,%eax
  103392:	89 8c d0 60 df 01 00 	mov    %ecx,0x1df60(%eax,%edx,8)
  AT[page_index].allocated = 0;
  103399:	c7 84 d0 64 df 01 00 	movl   $0x0,0x1df64(%eax,%edx,8)
  1033a0:	00 00 00 00 
}
  1033a4:	c3                   	ret    
  1033a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1033a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001033b0 <at_is_allocated>:
  */
unsigned int
at_is_allocated(unsigned int page_index)
{
  //TODO
  if(AT[page_index].allocated == 0)
  1033b0:	8b 54 24 04          	mov    0x4(%esp),%edx
  1033b4:	e8 14 da ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  1033b9:	05 47 8c 00 00       	add    $0x8c47,%eax
  1033be:	8b 84 d0 64 df 01 00 	mov    0x1df64(%eax,%edx,8),%eax
  1033c5:	85 c0                	test   %eax,%eax
  1033c7:	0f 95 c0             	setne  %al
  1033ca:	0f b6 c0             	movzbl %al,%eax
    return 0;
  return 1;
}
  1033cd:	c3                   	ret    
  1033ce:	66 90                	xchg   %ax,%ax

001033d0 <at_set_allocated>:
  */
void
at_set_allocated(unsigned int page_index, unsigned int allocated)
{
  //TODO
  AT[page_index].allocated = allocated;
  1033d0:	8b 54 24 04          	mov    0x4(%esp),%edx
  1033d4:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  1033d8:	e8 f0 d9 ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  1033dd:	05 23 8c 00 00       	add    $0x8c23,%eax
  1033e2:	89 8c d0 64 df 01 00 	mov    %ecx,0x1df64(%eax,%edx,8)
}
  1033e9:	c3                   	ret    
  1033ea:	66 90                	xchg   %ax,%ax
  1033ec:	66 90                	xchg   %ax,%ax
  1033ee:	66 90                	xchg   %ax,%ax

001033f0 <MATIntro_test1>:
#include <lib/debug.h>
#include "export.h"

int MATIntro_test1()
{
  1033f0:	55                   	push   %ebp
  1033f1:	57                   	push   %edi
  int rn10[] = {1,3,5,6,78,3576,32,8,0,100};
  int i;
  int nps = get_nps();
  1033f2:	bd 01 00 00 00       	mov    $0x1,%ebp
{
  1033f7:	56                   	push   %esi
  1033f8:	53                   	push   %ebx
  1033f9:	e8 11 cf ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1033fe:	81 c3 02 8c 00 00    	add    $0x8c02,%ebx
  103404:	83 ec 4c             	sub    $0x4c,%esp
  int rn10[] = {1,3,5,6,78,3576,32,8,0,100};
  103407:	c7 44 24 18 01 00 00 	movl   $0x1,0x18(%esp)
  10340e:	00 
  10340f:	c7 44 24 1c 03 00 00 	movl   $0x3,0x1c(%esp)
  103416:	00 
  103417:	8d 74 24 1c          	lea    0x1c(%esp),%esi
  10341b:	c7 44 24 20 05 00 00 	movl   $0x5,0x20(%esp)
  103422:	00 
  103423:	c7 44 24 24 06 00 00 	movl   $0x6,0x24(%esp)
  10342a:	00 
  10342b:	8d 7c 24 40          	lea    0x40(%esp),%edi
  10342f:	c7 44 24 28 4e 00 00 	movl   $0x4e,0x28(%esp)
  103436:	00 
  103437:	c7 44 24 2c f8 0d 00 	movl   $0xdf8,0x2c(%esp)
  10343e:	00 
  10343f:	c7 44 24 30 20 00 00 	movl   $0x20,0x30(%esp)
  103446:	00 
  103447:	c7 44 24 34 08 00 00 	movl   $0x8,0x34(%esp)
  10344e:	00 
  10344f:	c7 44 24 38 00 00 00 	movl   $0x0,0x38(%esp)
  103456:	00 
  103457:	c7 44 24 3c 64 00 00 	movl   $0x64,0x3c(%esp)
  10345e:	00 
  int nps = get_nps();
  10345f:	e8 bc fe ff ff       	call   103320 <get_nps>
  103464:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103468:	eb 0b                	jmp    103475 <MATIntro_test1+0x85>
  10346a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103470:	8b 2e                	mov    (%esi),%ebp
  103472:	83 c6 04             	add    $0x4,%esi
  for(i = 0; i< 10; i++) {
    set_nps(rn10[i]);
  103475:	83 ec 0c             	sub    $0xc,%esp
  103478:	55                   	push   %ebp
  103479:	e8 c2 fe ff ff       	call   103340 <set_nps>
    if (get_nps() != rn10[i]) {
  10347e:	e8 9d fe ff ff       	call   103320 <get_nps>
  103483:	83 c4 10             	add    $0x10,%esp
  103486:	39 c5                	cmp    %eax,%ebp
  103488:	75 2e                	jne    1034b8 <MATIntro_test1+0xc8>
  for(i = 0; i< 10; i++) {
  10348a:	39 fe                	cmp    %edi,%esi
  10348c:	75 e2                	jne    103470 <MATIntro_test1+0x80>
      set_nps(nps);
      dprintf("test 1 failed.\n");
      return 1;
    }
  }
  set_nps(nps);
  10348e:	83 ec 0c             	sub    $0xc,%esp
  103491:	ff 74 24 18          	pushl  0x18(%esp)
  103495:	e8 a6 fe ff ff       	call   103340 <set_nps>
  dprintf("test 1 passed.\n");
  10349a:	8d 83 09 ac ff ff    	lea    -0x53f7(%ebx),%eax
  1034a0:	89 04 24             	mov    %eax,(%esp)
  1034a3:	e8 5c ed ff ff       	call   102204 <dprintf>
  return 0;
  1034a8:	83 c4 10             	add    $0x10,%esp
  1034ab:	31 c0                	xor    %eax,%eax
}
  1034ad:	83 c4 4c             	add    $0x4c,%esp
  1034b0:	5b                   	pop    %ebx
  1034b1:	5e                   	pop    %esi
  1034b2:	5f                   	pop    %edi
  1034b3:	5d                   	pop    %ebp
  1034b4:	c3                   	ret    
  1034b5:	8d 76 00             	lea    0x0(%esi),%esi
      set_nps(nps);
  1034b8:	83 ec 0c             	sub    $0xc,%esp
  1034bb:	ff 74 24 18          	pushl  0x18(%esp)
  1034bf:	e8 7c fe ff ff       	call   103340 <set_nps>
      dprintf("test 1 failed.\n");
  1034c4:	8d 83 f9 ab ff ff    	lea    -0x5407(%ebx),%eax
  1034ca:	89 04 24             	mov    %eax,(%esp)
  1034cd:	e8 32 ed ff ff       	call   102204 <dprintf>
      return 1;
  1034d2:	83 c4 10             	add    $0x10,%esp
  1034d5:	b8 01 00 00 00       	mov    $0x1,%eax
}
  1034da:	83 c4 4c             	add    $0x4c,%esp
  1034dd:	5b                   	pop    %ebx
  1034de:	5e                   	pop    %esi
  1034df:	5f                   	pop    %edi
  1034e0:	5d                   	pop    %ebp
  1034e1:	c3                   	ret    
  1034e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1034e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001034f0 <MATIntro_test2>:

int MATIntro_test2()
{
  1034f0:	53                   	push   %ebx
  1034f1:	e8 19 ce ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1034f6:	81 c3 0a 8b 00 00    	add    $0x8b0a,%ebx
  1034fc:	83 ec 10             	sub    $0x10,%esp
  at_set_perm(0, 0);
  1034ff:	6a 00                	push   $0x0
  103501:	6a 00                	push   $0x0
  103503:	e8 78 fe ff ff       	call   103380 <at_set_perm>
  if (at_is_norm(0) != 0 || at_is_allocated(0) != 0) {
  103508:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10350f:	e8 4c fe ff ff       	call   103360 <at_is_norm>
  103514:	83 c4 10             	add    $0x10,%esp
  103517:	85 c0                	test   %eax,%eax
  103519:	75 11                	jne    10352c <MATIntro_test2+0x3c>
  10351b:	83 ec 0c             	sub    $0xc,%esp
  10351e:	6a 00                	push   $0x0
  103520:	e8 8b fe ff ff       	call   1033b0 <at_is_allocated>
  103525:	83 c4 10             	add    $0x10,%esp
  103528:	85 c0                	test   %eax,%eax
  10352a:	74 2c                	je     103558 <MATIntro_test2+0x68>
    at_set_perm(0, 0);
  10352c:	83 ec 08             	sub    $0x8,%esp
  10352f:	6a 00                	push   $0x0
  103531:	6a 00                	push   $0x0
  103533:	e8 48 fe ff ff       	call   103380 <at_set_perm>
    dprintf("test 2 failed.\n");
  103538:	8d 83 19 ac ff ff    	lea    -0x53e7(%ebx),%eax
  10353e:	89 04 24             	mov    %eax,(%esp)
  103541:	e8 be ec ff ff       	call   102204 <dprintf>
    return 1;
  103546:	83 c4 10             	add    $0x10,%esp
  103549:	b8 01 00 00 00       	mov    $0x1,%eax
    return 1;
  }
  at_set_perm(0, 0);
  dprintf("test 2 passed.\n");
  return 0;
}
  10354e:	83 c4 08             	add    $0x8,%esp
  103551:	5b                   	pop    %ebx
  103552:	c3                   	ret    
  103553:	90                   	nop
  103554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  at_set_perm(0, 1);
  103558:	83 ec 08             	sub    $0x8,%esp
  10355b:	6a 01                	push   $0x1
  10355d:	6a 00                	push   $0x0
  10355f:	e8 1c fe ff ff       	call   103380 <at_set_perm>
  if (at_is_norm(0) != 0 || at_is_allocated(0) != 0) {
  103564:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10356b:	e8 f0 fd ff ff       	call   103360 <at_is_norm>
  103570:	83 c4 10             	add    $0x10,%esp
  103573:	85 c0                	test   %eax,%eax
  103575:	75 b5                	jne    10352c <MATIntro_test2+0x3c>
  103577:	83 ec 0c             	sub    $0xc,%esp
  10357a:	6a 00                	push   $0x0
  10357c:	e8 2f fe ff ff       	call   1033b0 <at_is_allocated>
  103581:	83 c4 10             	add    $0x10,%esp
  103584:	85 c0                	test   %eax,%eax
  103586:	75 a4                	jne    10352c <MATIntro_test2+0x3c>
  at_set_perm(0, 2);
  103588:	83 ec 08             	sub    $0x8,%esp
  10358b:	6a 02                	push   $0x2
  10358d:	6a 00                	push   $0x0
  10358f:	e8 ec fd ff ff       	call   103380 <at_set_perm>
  if (at_is_norm(0) != 1 || at_is_allocated(0) != 0) {
  103594:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10359b:	e8 c0 fd ff ff       	call   103360 <at_is_norm>
  1035a0:	83 c4 10             	add    $0x10,%esp
  1035a3:	83 f8 01             	cmp    $0x1,%eax
  1035a6:	75 84                	jne    10352c <MATIntro_test2+0x3c>
  1035a8:	83 ec 0c             	sub    $0xc,%esp
  1035ab:	6a 00                	push   $0x0
  1035ad:	e8 fe fd ff ff       	call   1033b0 <at_is_allocated>
  1035b2:	83 c4 10             	add    $0x10,%esp
  1035b5:	85 c0                	test   %eax,%eax
  1035b7:	0f 85 6f ff ff ff    	jne    10352c <MATIntro_test2+0x3c>
  at_set_perm(0, 100);
  1035bd:	83 ec 08             	sub    $0x8,%esp
  1035c0:	6a 64                	push   $0x64
  1035c2:	6a 00                	push   $0x0
  1035c4:	e8 b7 fd ff ff       	call   103380 <at_set_perm>
  if (at_is_norm(0) != 1 || at_is_allocated(0) != 0) {
  1035c9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1035d0:	e8 8b fd ff ff       	call   103360 <at_is_norm>
  1035d5:	83 c4 10             	add    $0x10,%esp
  1035d8:	83 f8 01             	cmp    $0x1,%eax
  1035db:	0f 85 4b ff ff ff    	jne    10352c <MATIntro_test2+0x3c>
  1035e1:	83 ec 0c             	sub    $0xc,%esp
  1035e4:	6a 00                	push   $0x0
  1035e6:	e8 c5 fd ff ff       	call   1033b0 <at_is_allocated>
  1035eb:	83 c4 10             	add    $0x10,%esp
  1035ee:	85 c0                	test   %eax,%eax
  1035f0:	0f 85 36 ff ff ff    	jne    10352c <MATIntro_test2+0x3c>
  at_set_perm(0, 0);
  1035f6:	50                   	push   %eax
  1035f7:	50                   	push   %eax
  1035f8:	6a 00                	push   $0x0
  1035fa:	6a 00                	push   $0x0
  1035fc:	e8 7f fd ff ff       	call   103380 <at_set_perm>
  dprintf("test 2 passed.\n");
  103601:	8d 83 29 ac ff ff    	lea    -0x53d7(%ebx),%eax
  103607:	89 04 24             	mov    %eax,(%esp)
  10360a:	e8 f5 eb ff ff       	call   102204 <dprintf>
  10360f:	83 c4 10             	add    $0x10,%esp
  return 0;
  103612:	31 c0                	xor    %eax,%eax
  103614:	e9 35 ff ff ff       	jmp    10354e <MATIntro_test2+0x5e>
  103619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00103620 <MATIntro_test3>:

int MATIntro_test3()
{
  103620:	53                   	push   %ebx
  103621:	e8 e9 cc ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103626:	81 c3 da 89 00 00    	add    $0x89da,%ebx
  10362c:	83 ec 10             	sub    $0x10,%esp
  at_set_allocated(1, 0);
  10362f:	6a 00                	push   $0x0
  103631:	6a 01                	push   $0x1
  103633:	e8 98 fd ff ff       	call   1033d0 <at_set_allocated>
  if (at_is_allocated(1) != 0) {
  103638:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10363f:	e8 6c fd ff ff       	call   1033b0 <at_is_allocated>
  103644:	83 c4 10             	add    $0x10,%esp
  103647:	85 c0                	test   %eax,%eax
  103649:	75 20                	jne    10366b <MATIntro_test3+0x4b>
    at_set_allocated(1, 0);
    dprintf("test 3 failed.\n");
    return 1;
  }
  at_set_allocated(1, 1);
  10364b:	83 ec 08             	sub    $0x8,%esp
  10364e:	6a 01                	push   $0x1
  103650:	6a 01                	push   $0x1
  103652:	e8 79 fd ff ff       	call   1033d0 <at_set_allocated>
  if (at_is_allocated(1) != 1) {
  103657:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10365e:	e8 4d fd ff ff       	call   1033b0 <at_is_allocated>
  103663:	83 c4 10             	add    $0x10,%esp
  103666:	83 f8 01             	cmp    $0x1,%eax
  103669:	74 2d                	je     103698 <MATIntro_test3+0x78>
    at_set_allocated(1, 0);
  10366b:	83 ec 08             	sub    $0x8,%esp
  10366e:	6a 00                	push   $0x0
  103670:	6a 01                	push   $0x1
  103672:	e8 59 fd ff ff       	call   1033d0 <at_set_allocated>
    dprintf("test 3 failed.\n");
  103677:	8d 83 39 ac ff ff    	lea    -0x53c7(%ebx),%eax
  10367d:	89 04 24             	mov    %eax,(%esp)
  103680:	e8 7f eb ff ff       	call   102204 <dprintf>
    return 1;
  103685:	83 c4 10             	add    $0x10,%esp
  103688:	b8 01 00 00 00       	mov    $0x1,%eax
    return 1;
  }
  at_set_allocated(1, 0);
  dprintf("test 3 passed.\n");
  return 0;
}
  10368d:	83 c4 08             	add    $0x8,%esp
  103690:	5b                   	pop    %ebx
  103691:	c3                   	ret    
  103692:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  at_set_allocated(1, 100);
  103698:	83 ec 08             	sub    $0x8,%esp
  10369b:	6a 64                	push   $0x64
  10369d:	6a 01                	push   $0x1
  10369f:	e8 2c fd ff ff       	call   1033d0 <at_set_allocated>
  if (at_is_allocated(1) != 1) {
  1036a4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1036ab:	e8 00 fd ff ff       	call   1033b0 <at_is_allocated>
  1036b0:	83 c4 10             	add    $0x10,%esp
  1036b3:	83 f8 01             	cmp    $0x1,%eax
  1036b6:	75 b3                	jne    10366b <MATIntro_test3+0x4b>
  at_set_allocated(1, 0);
  1036b8:	83 ec 08             	sub    $0x8,%esp
  1036bb:	6a 00                	push   $0x0
  1036bd:	6a 01                	push   $0x1
  1036bf:	e8 0c fd ff ff       	call   1033d0 <at_set_allocated>
  dprintf("test 3 passed.\n");
  1036c4:	8d 83 49 ac ff ff    	lea    -0x53b7(%ebx),%eax
  1036ca:	89 04 24             	mov    %eax,(%esp)
  1036cd:	e8 32 eb ff ff       	call   102204 <dprintf>
  1036d2:	83 c4 10             	add    $0x10,%esp
  return 0;
  1036d5:	31 c0                	xor    %eax,%eax
  1036d7:	eb b4                	jmp    10368d <MATIntro_test3+0x6d>
  1036d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001036e0 <MATIntro_test_own>:
int MATIntro_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  1036e0:	31 c0                	xor    %eax,%eax
  1036e2:	c3                   	ret    
  1036e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1036e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001036f0 <test_MATIntro>:

int test_MATIntro()
{
  1036f0:	53                   	push   %ebx
  1036f1:	83 ec 08             	sub    $0x8,%esp
  return MATIntro_test1() + MATIntro_test2() + MATIntro_test3() + MATIntro_test_own();
  1036f4:	e8 f7 fc ff ff       	call   1033f0 <MATIntro_test1>
  1036f9:	89 c3                	mov    %eax,%ebx
  1036fb:	e8 f0 fd ff ff       	call   1034f0 <MATIntro_test2>
  103700:	01 c3                	add    %eax,%ebx
  103702:	e8 19 ff ff ff       	call   103620 <MATIntro_test3>
}
  103707:	83 c4 08             	add    $0x8,%esp
  return MATIntro_test1() + MATIntro_test2() + MATIntro_test3() + MATIntro_test_own();
  10370a:	01 d8                	add    %ebx,%eax
}
  10370c:	5b                   	pop    %ebx
  10370d:	c3                   	ret    
  10370e:	66 90                	xchg   %ax,%ax

00103710 <pmem_init>:
  *
  *  - Review import.h in the current directory for the list of available getter and setter functions.
  */
void
pmem_init(unsigned int mbi_addr)
{
  103710:	55                   	push   %ebp
  103711:	57                   	push   %edi
  103712:	56                   	push   %esi
  103713:	53                   	push   %ebx
  103714:	e8 f6 cb ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103719:	81 c3 e7 88 00 00    	add    $0x88e7,%ebx
  10371f:	83 ec 28             	sub    $0x28,%esp
  unsigned int numRows, lastAddr, i, row, start, stop, addrStart, addrStop;
  char found;

  //Calls the lower layer initializatin primitives.
  //The parameter mbi_addr shell not be used in the further code.
	devinit(mbi_addr);
  103722:	ff 74 24 3c          	pushl  0x3c(%esp)
  103726:	e8 95 d1 ff ff       	call   1008c0 <devinit>
    * Hint 1: Review the import.h file for available functions.
    * Hint 2: Think of it as the highest address possible in the ranges of the memory map table,
    *         divided by the page size plus 1.
    */
  // TODO
  numRows = get_size();
  10372b:	e8 50 d5 ff ff       	call   100c80 <get_size>
  lastAddr = get_mms(numRows - 1) + get_mml(numRows - 1);
  103730:	8d 78 ff             	lea    -0x1(%eax),%edi
  numRows = get_size();
  103733:	89 44 24 10          	mov    %eax,0x10(%esp)
  lastAddr = get_mms(numRows - 1) + get_mml(numRows - 1);
  103737:	89 3c 24             	mov    %edi,(%esp)
  10373a:	e8 52 d5 ff ff       	call   100c91 <get_mms>
  10373f:	89 c6                	mov    %eax,%esi
  103741:	89 3c 24             	mov    %edi,(%esp)
  103744:	e8 91 d5 ff ff       	call   100cda <get_mml>
  103749:	01 c6                	add    %eax,%esi
  nps = lastAddr / PAGESIZE + 1;
  10374b:	c1 ee 0c             	shr    $0xc,%esi
  10374e:	8d 6e 01             	lea    0x1(%esi),%ebp
  //   stop = start + get_mml(row);
  //   dprintf("\nrow = %u, start = %u, range = %u, stop = %u\n", row, start, get_mml(row), stop);
  // }
  // dprintf("\nTRUE = %d, FALSE = %d\n", TRUE, FALSE);

  for(i = 0; i < nps; i++){
  103751:	31 f6                	xor    %esi,%esi
	set_nps(nps); // Setting the value computed above to NUM_PAGES.
  103753:	89 2c 24             	mov    %ebp,(%esp)
  103756:	e8 e5 fb ff ff       	call   103340 <set_nps>
  10375b:	83 c4 10             	add    $0x10,%esp
  10375e:	66 90                	xchg   %ax,%ax
    // Kernel pages
    if(i < VM_USERLO_PI || i >= VM_USERHI_PI)
  103760:	8d 86 00 00 fc ff    	lea    -0x40000(%esi),%eax
  103766:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  10376b:	76 23                	jbe    103790 <pmem_init+0x80>
      at_set_perm(i, 1);
  10376d:	83 ec 08             	sub    $0x8,%esp
  103770:	6a 01                	push   $0x1
  103772:	56                   	push   %esi
  103773:	e8 08 fc ff ff       	call   103380 <at_set_perm>
  103778:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < nps; i++){
  10377b:	83 c6 01             	add    $0x1,%esi
  10377e:	39 f5                	cmp    %esi,%ebp
  103780:	75 de                	jne    103760 <pmem_init+0x50>
      if(found == FALSE)
        at_set_perm(i, 0);
    }
  }

  103782:	83 c4 1c             	add    $0x1c,%esp
  103785:	5b                   	pop    %ebx
  103786:	5e                   	pop    %esi
  103787:	5f                   	pop    %edi
  103788:	5d                   	pop    %ebp
  103789:	c3                   	ret    
  10378a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      addrStart = i*PAGESIZE;
  103790:	89 f0                	mov    %esi,%eax
  103792:	c1 e0 0c             	shl    $0xc,%eax
  103795:	89 44 24 04          	mov    %eax,0x4(%esp)
  103799:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
      for(row = 0; row < numRows; row++){
  10379f:	8b 04 24             	mov    (%esp),%eax
  1037a2:	85 c0                	test   %eax,%eax
  1037a4:	74 79                	je     10381f <pmem_init+0x10f>
  1037a6:	31 ff                	xor    %edi,%edi
  1037a8:	89 6c 24 08          	mov    %ebp,0x8(%esp)
  1037ac:	89 74 24 0c          	mov    %esi,0xc(%esp)
  1037b0:	89 fd                	mov    %edi,%ebp
  1037b2:	89 d7                	mov    %edx,%edi
  1037b4:	eb 12                	jmp    1037c8 <pmem_init+0xb8>
  1037b6:	8d 76 00             	lea    0x0(%esi),%esi
  1037b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  1037c0:	83 c5 01             	add    $0x1,%ebp
  1037c3:	39 2c 24             	cmp    %ebp,(%esp)
  1037c6:	74 4f                	je     103817 <pmem_init+0x107>
        start = get_mms(row);
  1037c8:	83 ec 0c             	sub    $0xc,%esp
  1037cb:	55                   	push   %ebp
  1037cc:	e8 c0 d4 ff ff       	call   100c91 <get_mms>
  1037d1:	89 c6                	mov    %eax,%esi
        stop = start + get_mml(row);
  1037d3:	89 2c 24             	mov    %ebp,(%esp)
  1037d6:	e8 ff d4 ff ff       	call   100cda <get_mml>
  1037db:	01 f0                	add    %esi,%eax
        if(addrStart >= start && addrStop < stop){
  1037dd:	83 c4 10             	add    $0x10,%esp
  1037e0:	39 f8                	cmp    %edi,%eax
  1037e2:	76 dc                	jbe    1037c0 <pmem_init+0xb0>
  1037e4:	39 74 24 04          	cmp    %esi,0x4(%esp)
  1037e8:	72 d6                	jb     1037c0 <pmem_init+0xb0>
  1037ea:	8b 74 24 0c          	mov    0xc(%esp),%esi
  1037ee:	89 ef                	mov    %ebp,%edi
          if(is_usable(row))
  1037f0:	83 ec 0c             	sub    $0xc,%esp
  1037f3:	8b 6c 24 14          	mov    0x14(%esp),%ebp
  1037f7:	57                   	push   %edi
  1037f8:	e8 29 d5 ff ff       	call   100d26 <is_usable>
  1037fd:	83 c4 10             	add    $0x10,%esp
  103800:	85 c0                	test   %eax,%eax
  103802:	74 1b                	je     10381f <pmem_init+0x10f>
            at_set_perm(i, 2);
  103804:	83 ec 08             	sub    $0x8,%esp
  103807:	6a 02                	push   $0x2
  103809:	56                   	push   %esi
  10380a:	e8 71 fb ff ff       	call   103380 <at_set_perm>
  10380f:	83 c4 10             	add    $0x10,%esp
  103812:	e9 64 ff ff ff       	jmp    10377b <pmem_init+0x6b>
  103817:	8b 6c 24 08          	mov    0x8(%esp),%ebp
  10381b:	8b 74 24 0c          	mov    0xc(%esp),%esi
        at_set_perm(i, 0);
  10381f:	83 ec 08             	sub    $0x8,%esp
  103822:	6a 00                	push   $0x0
  103824:	56                   	push   %esi
  103825:	e8 56 fb ff ff       	call   103380 <at_set_perm>
  10382a:	83 c4 10             	add    $0x10,%esp
  10382d:	e9 49 ff ff ff       	jmp    10377b <pmem_init+0x6b>
  103832:	66 90                	xchg   %ax,%ax
  103834:	66 90                	xchg   %ax,%ax
  103836:	66 90                	xchg   %ax,%ax
  103838:	66 90                	xchg   %ax,%ax
  10383a:	66 90                	xchg   %ax,%ax
  10383c:	66 90                	xchg   %ax,%ax
  10383e:	66 90                	xchg   %ax,%ax

00103840 <MATInit_test1>:
#include <lib/debug.h>
#include <pmm/MATIntro/export.h>

int MATInit_test1()
{
  103840:	57                   	push   %edi
  103841:	56                   	push   %esi
  103842:	31 f6                	xor    %esi,%esi
  103844:	53                   	push   %ebx
  103845:	e8 c5 ca ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10384a:	81 c3 b6 87 00 00    	add    $0x87b6,%ebx
  int i;
  int nps = get_nps();
  103850:	e8 cb fa ff ff       	call   103320 <get_nps>
  if (nps <= 1000) {
  103855:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  10385a:	89 c7                	mov    %eax,%edi
  10385c:	7e 52                	jle    1038b0 <MATInit_test1+0x70>
  10385e:	66 90                	xchg   %ax,%ax
    dprintf("test 1 failed.\n");
    return 1;
  }
  for(i = 0; i < nps; i ++) {
    if (at_is_allocated(i) != 0) {
  103860:	83 ec 0c             	sub    $0xc,%esp
  103863:	56                   	push   %esi
  103864:	e8 47 fb ff ff       	call   1033b0 <at_is_allocated>
  103869:	83 c4 10             	add    $0x10,%esp
  10386c:	85 c0                	test   %eax,%eax
  10386e:	75 60                	jne    1038d0 <MATInit_test1+0x90>
      dprintf("allocated: %d: %d\n", i, at_is_allocated(i));
      dprintf("test 1 failed.\n");
      return 1;
    }
    if ((i < 0x40000000/4096 || i >= 0xF0000000/4096) && at_is_norm(i) != 0) {
  103870:	8d 86 00 00 fc ff    	lea    -0x40000(%esi),%eax
  103876:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  10387b:	76 10                	jbe    10388d <MATInit_test1+0x4d>
  10387d:	83 ec 0c             	sub    $0xc,%esp
  103880:	56                   	push   %esi
  103881:	e8 da fa ff ff       	call   103360 <at_is_norm>
  103886:	83 c4 10             	add    $0x10,%esp
  103889:	85 c0                	test   %eax,%eax
  10388b:	75 7b                	jne    103908 <MATInit_test1+0xc8>
  for(i = 0; i < nps; i ++) {
  10388d:	83 c6 01             	add    $0x1,%esi
  103890:	39 f7                	cmp    %esi,%edi
  103892:	75 cc                	jne    103860 <MATInit_test1+0x20>
      dprintf("norm: %d: %d\n", i, at_is_norm(i));
      dprintf("test 1 failed.\n");
      return 1;
    }
  }
  dprintf("test 1 passed.\n");
  103894:	8d 83 09 ac ff ff    	lea    -0x53f7(%ebx),%eax
  10389a:	83 ec 0c             	sub    $0xc,%esp
  10389d:	50                   	push   %eax
  10389e:	e8 61 e9 ff ff       	call   102204 <dprintf>
  return 0;
  1038a3:	83 c4 10             	add    $0x10,%esp
  1038a6:	31 c0                	xor    %eax,%eax
}
  1038a8:	5b                   	pop    %ebx
  1038a9:	5e                   	pop    %esi
  1038aa:	5f                   	pop    %edi
  1038ab:	c3                   	ret    
  1038ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1 failed.\n");
  1038b0:	8d 83 f9 ab ff ff    	lea    -0x5407(%ebx),%eax
  1038b6:	83 ec 0c             	sub    $0xc,%esp
  1038b9:	50                   	push   %eax
  1038ba:	e8 45 e9 ff ff       	call   102204 <dprintf>
    return 1;
  1038bf:	83 c4 10             	add    $0x10,%esp
  1038c2:	b8 01 00 00 00       	mov    $0x1,%eax
}
  1038c7:	5b                   	pop    %ebx
  1038c8:	5e                   	pop    %esi
  1038c9:	5f                   	pop    %edi
  1038ca:	c3                   	ret    
  1038cb:	90                   	nop
  1038cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      dprintf("allocated: %d: %d\n", i, at_is_allocated(i));
  1038d0:	83 ec 0c             	sub    $0xc,%esp
  1038d3:	56                   	push   %esi
  1038d4:	e8 d7 fa ff ff       	call   1033b0 <at_is_allocated>
  1038d9:	83 c4 0c             	add    $0xc,%esp
  1038dc:	50                   	push   %eax
  1038dd:	8d 83 59 ac ff ff    	lea    -0x53a7(%ebx),%eax
  1038e3:	56                   	push   %esi
      dprintf("norm: %d: %d\n", i, at_is_norm(i));
  1038e4:	50                   	push   %eax
  1038e5:	e8 1a e9 ff ff       	call   102204 <dprintf>
      dprintf("test 1 failed.\n");
  1038ea:	8d 83 f9 ab ff ff    	lea    -0x5407(%ebx),%eax
  1038f0:	89 04 24             	mov    %eax,(%esp)
  1038f3:	e8 0c e9 ff ff       	call   102204 <dprintf>
      return 1;
  1038f8:	83 c4 10             	add    $0x10,%esp
  1038fb:	b8 01 00 00 00       	mov    $0x1,%eax
}
  103900:	5b                   	pop    %ebx
  103901:	5e                   	pop    %esi
  103902:	5f                   	pop    %edi
  103903:	c3                   	ret    
  103904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      dprintf("norm: %d: %d\n", i, at_is_norm(i));
  103908:	83 ec 0c             	sub    $0xc,%esp
  10390b:	56                   	push   %esi
  10390c:	e8 4f fa ff ff       	call   103360 <at_is_norm>
  103911:	83 c4 0c             	add    $0xc,%esp
  103914:	50                   	push   %eax
  103915:	8d 83 6c ac ff ff    	lea    -0x5394(%ebx),%eax
  10391b:	56                   	push   %esi
  10391c:	eb c6                	jmp    1038e4 <MATInit_test1+0xa4>
  10391e:	66 90                	xchg   %ax,%ax

00103920 <MATInit_test_own>:
int MATInit_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  103920:	31 c0                	xor    %eax,%eax
  103922:	c3                   	ret    
  103923:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103930 <test_MATInit>:

int test_MATInit()
{
  return MATInit_test1() + MATInit_test_own();
  103930:	e9 0b ff ff ff       	jmp    103840 <MATInit_test1>
  103935:	66 90                	xchg   %ax,%ax
  103937:	66 90                	xchg   %ax,%ax
  103939:	66 90                	xchg   %ax,%ax
  10393b:	66 90                	xchg   %ax,%ax
  10393d:	66 90                	xchg   %ax,%ax
  10393f:	90                   	nop

00103940 <palloc>:
  */
static unsigned int START = VM_USERLO_PI;

unsigned int
palloc()
{
  103940:	56                   	push   %esi
  103941:	53                   	push   %ebx
  103942:	e8 c8 c9 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103947:	81 c3 b9 86 00 00    	add    $0x86b9,%ebx
  10394d:	83 ec 04             	sub    $0x4,%esp
  // TODO
  // dprintf("\nSTART = %u\n", START);
  unsigned int i;
  for(i = START; i < VM_USERHI_PI; i++){
  103950:	8b b3 28 03 00 00    	mov    0x328(%ebx),%esi
  103956:	81 fe ff ff 0e 00    	cmp    $0xeffff,%esi
  10395c:	76 0d                	jbe    10396b <palloc+0x2b>
  10395e:	eb 50                	jmp    1039b0 <palloc+0x70>
  103960:	83 c6 01             	add    $0x1,%esi
  103963:	81 fe 00 00 0f 00    	cmp    $0xf0000,%esi
  103969:	74 45                	je     1039b0 <palloc+0x70>
    if(at_is_norm(i) && !at_is_allocated(i)){
  10396b:	83 ec 0c             	sub    $0xc,%esp
  10396e:	56                   	push   %esi
  10396f:	e8 ec f9 ff ff       	call   103360 <at_is_norm>
  103974:	83 c4 10             	add    $0x10,%esp
  103977:	85 c0                	test   %eax,%eax
  103979:	74 e5                	je     103960 <palloc+0x20>
  10397b:	83 ec 0c             	sub    $0xc,%esp
  10397e:	56                   	push   %esi
  10397f:	e8 2c fa ff ff       	call   1033b0 <at_is_allocated>
  103984:	83 c4 10             	add    $0x10,%esp
  103987:	85 c0                	test   %eax,%eax
  103989:	75 d5                	jne    103960 <palloc+0x20>
      START = i+1;
      at_set_allocated(i, 1);
  10398b:	83 ec 08             	sub    $0x8,%esp
      START = i+1;
  10398e:	8d 46 01             	lea    0x1(%esi),%eax
      at_set_allocated(i, 1);
  103991:	6a 01                	push   $0x1
  103993:	56                   	push   %esi
      START = i+1;
  103994:	89 83 28 03 00 00    	mov    %eax,0x328(%ebx)
      at_set_allocated(i, 1);
  10399a:	e8 31 fa ff ff       	call   1033d0 <at_set_allocated>
      return i;
  10399f:	83 c4 10             	add    $0x10,%esp
    }
  }

  return 0;
} 
  1039a2:	89 f0                	mov    %esi,%eax
  1039a4:	83 c4 04             	add    $0x4,%esp
  1039a7:	5b                   	pop    %ebx
  1039a8:	5e                   	pop    %esi
  1039a9:	c3                   	ret    
  1039aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return 0;
  1039b0:	31 f6                	xor    %esi,%esi
} 
  1039b2:	83 c4 04             	add    $0x4,%esp
  1039b5:	89 f0                	mov    %esi,%eax
  1039b7:	5b                   	pop    %ebx
  1039b8:	5e                   	pop    %esi
  1039b9:	c3                   	ret    
  1039ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001039c0 <pfree>:
  * Hint: Simple. You have already implemented the functions required to check if a page
  * 	  is allocated and to set the allocation status of a page index. (See import.h)
  */
void
pfree(unsigned int pfree_index)
{
  1039c0:	56                   	push   %esi
  1039c1:	53                   	push   %ebx
  1039c2:	e8 48 c9 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1039c7:	81 c3 39 86 00 00    	add    $0x8639,%ebx
  1039cd:	83 ec 10             	sub    $0x10,%esp
  1039d0:	8b 74 24 1c          	mov    0x1c(%esp),%esi
  // TODO
  if(at_is_allocated(pfree_index)){
  1039d4:	56                   	push   %esi
  1039d5:	e8 d6 f9 ff ff       	call   1033b0 <at_is_allocated>
  1039da:	83 c4 10             	add    $0x10,%esp
  1039dd:	85 c0                	test   %eax,%eax
  1039df:	75 0f                	jne    1039f0 <pfree+0x30>
    at_set_allocated(pfree_index, 0);
    if(pfree_index < START)
      START = pfree_index;
  }
}
  1039e1:	83 c4 04             	add    $0x4,%esp
  1039e4:	5b                   	pop    %ebx
  1039e5:	5e                   	pop    %esi
  1039e6:	c3                   	ret    
  1039e7:	89 f6                	mov    %esi,%esi
  1039e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    at_set_allocated(pfree_index, 0);
  1039f0:	83 ec 08             	sub    $0x8,%esp
  1039f3:	6a 00                	push   $0x0
  1039f5:	56                   	push   %esi
  1039f6:	e8 d5 f9 ff ff       	call   1033d0 <at_set_allocated>
    if(pfree_index < START)
  1039fb:	83 c4 10             	add    $0x10,%esp
  1039fe:	39 b3 28 03 00 00    	cmp    %esi,0x328(%ebx)
  103a04:	76 db                	jbe    1039e1 <pfree+0x21>
      START = pfree_index;
  103a06:	89 b3 28 03 00 00    	mov    %esi,0x328(%ebx)
}
  103a0c:	83 c4 04             	add    $0x4,%esp
  103a0f:	5b                   	pop    %ebx
  103a10:	5e                   	pop    %esi
  103a11:	c3                   	ret    
  103a12:	66 90                	xchg   %ax,%ax
  103a14:	66 90                	xchg   %ax,%ax
  103a16:	66 90                	xchg   %ax,%ax
  103a18:	66 90                	xchg   %ax,%ax
  103a1a:	66 90                	xchg   %ax,%ax
  103a1c:	66 90                	xchg   %ax,%ax
  103a1e:	66 90                	xchg   %ax,%ax

00103a20 <test_allocation>:
#include <lib/debug.h>
#include <pmm/MATIntro/export.h>
#include "export.h"

int test_allocation(int page_index) {
  103a20:	56                   	push   %esi
  103a21:	53                   	push   %ebx
  103a22:	e8 e8 c8 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103a27:	81 c3 d9 85 00 00    	add    $0x85d9,%ebx
  103a2d:	83 ec 04             	sub    $0x4,%esp
  103a30:	8b 74 24 10          	mov    0x10(%esp),%esi
  if (page_index < 262144) {
  103a34:	81 fe ff ff 03 00    	cmp    $0x3ffff,%esi
  103a3a:	7e 7c                	jle    103ab8 <test_allocation+0x98>
    pfree(page_index);
    dprintf("test 1-a failed with page_index = %d.\n", page_index);
    return 1;
  }
  if (at_is_norm(page_index) != 1) {
  103a3c:	83 ec 0c             	sub    $0xc,%esp
  103a3f:	56                   	push   %esi
  103a40:	e8 1b f9 ff ff       	call   103360 <at_is_norm>
  103a45:	83 c4 10             	add    $0x10,%esp
  103a48:	83 f8 01             	cmp    $0x1,%eax
  103a4b:	74 2b                	je     103a78 <test_allocation+0x58>
    pfree(page_index);
  103a4d:	83 ec 0c             	sub    $0xc,%esp
  103a50:	56                   	push   %esi
  103a51:	e8 6a ff ff ff       	call   1039c0 <pfree>
    dprintf("test 1-b failed.\n");
  103a56:	8d 83 fc ac ff ff    	lea    -0x5304(%ebx),%eax
  103a5c:	89 04 24             	mov    %eax,(%esp)
  103a5f:	e8 a0 e7 ff ff       	call   102204 <dprintf>
    return 1;
  103a64:	83 c4 10             	add    $0x10,%esp
  103a67:	b8 01 00 00 00       	mov    $0x1,%eax
    pfree(page_index);
    dprintf("test 1-c failed.\n");
    return 1;
  }
  return 0;
}
  103a6c:	83 c4 04             	add    $0x4,%esp
  103a6f:	5b                   	pop    %ebx
  103a70:	5e                   	pop    %esi
  103a71:	c3                   	ret    
  103a72:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (at_is_allocated(page_index) != 1) {
  103a78:	83 ec 0c             	sub    $0xc,%esp
  103a7b:	56                   	push   %esi
  103a7c:	e8 2f f9 ff ff       	call   1033b0 <at_is_allocated>
  103a81:	89 c2                	mov    %eax,%edx
  103a83:	83 c4 10             	add    $0x10,%esp
  return 0;
  103a86:	31 c0                	xor    %eax,%eax
  if (at_is_allocated(page_index) != 1) {
  103a88:	83 fa 01             	cmp    $0x1,%edx
  103a8b:	74 df                	je     103a6c <test_allocation+0x4c>
    pfree(page_index);
  103a8d:	83 ec 0c             	sub    $0xc,%esp
  103a90:	56                   	push   %esi
  103a91:	e8 2a ff ff ff       	call   1039c0 <pfree>
    dprintf("test 1-c failed.\n");
  103a96:	8d 83 0e ad ff ff    	lea    -0x52f2(%ebx),%eax
  103a9c:	89 04 24             	mov    %eax,(%esp)
  103a9f:	e8 60 e7 ff ff       	call   102204 <dprintf>
    return 1;
  103aa4:	83 c4 10             	add    $0x10,%esp
  103aa7:	b8 01 00 00 00       	mov    $0x1,%eax
}
  103aac:	83 c4 04             	add    $0x4,%esp
  103aaf:	5b                   	pop    %ebx
  103ab0:	5e                   	pop    %esi
  103ab1:	c3                   	ret    
  103ab2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    pfree(page_index);
  103ab8:	83 ec 0c             	sub    $0xc,%esp
  103abb:	56                   	push   %esi
  103abc:	e8 ff fe ff ff       	call   1039c0 <pfree>
    dprintf("test 1-a failed with page_index = %d.\n", page_index);
  103ac1:	58                   	pop    %eax
  103ac2:	8d 83 7c ac ff ff    	lea    -0x5384(%ebx),%eax
  103ac8:	5a                   	pop    %edx
  103ac9:	56                   	push   %esi
  103aca:	50                   	push   %eax
  103acb:	e8 34 e7 ff ff       	call   102204 <dprintf>
  103ad0:	83 c4 10             	add    $0x10,%esp
  103ad3:	b8 01 00 00 00       	mov    $0x1,%eax
}
  103ad8:	83 c4 04             	add    $0x4,%esp
  103adb:	5b                   	pop    %ebx
  103adc:	5e                   	pop    %esi
  103add:	c3                   	ret    
  103ade:	66 90                	xchg   %ax,%ax

00103ae0 <test_free>:

int test_free(int page_index) {
  103ae0:	56                   	push   %esi
  103ae1:	53                   	push   %ebx
  103ae2:	e8 28 c8 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103ae7:	81 c3 19 85 00 00    	add    $0x8519,%ebx
  103aed:	83 ec 10             	sub    $0x10,%esp
  103af0:	8b 74 24 1c          	mov    0x1c(%esp),%esi
  pfree(page_index);
  103af4:	56                   	push   %esi
  103af5:	e8 c6 fe ff ff       	call   1039c0 <pfree>
  if (at_is_allocated(page_index) != 0) {
  103afa:	89 34 24             	mov    %esi,(%esp)
  103afd:	e8 ae f8 ff ff       	call   1033b0 <at_is_allocated>
  103b02:	83 c4 10             	add    $0x10,%esp
  103b05:	31 d2                	xor    %edx,%edx
  103b07:	85 c0                	test   %eax,%eax
  103b09:	74 17                	je     103b22 <test_free+0x42>
    dprintf("test 1-d failed.\n");
  103b0b:	8d 83 20 ad ff ff    	lea    -0x52e0(%ebx),%eax
  103b11:	83 ec 0c             	sub    $0xc,%esp
  103b14:	50                   	push   %eax
  103b15:	e8 ea e6 ff ff       	call   102204 <dprintf>
    return 1;
  103b1a:	83 c4 10             	add    $0x10,%esp
  103b1d:	ba 01 00 00 00       	mov    $0x1,%edx
  }
  return 0; 
}
  103b22:	83 c4 04             	add    $0x4,%esp
  103b25:	89 d0                	mov    %edx,%eax
  103b27:	5b                   	pop    %ebx
  103b28:	5e                   	pop    %esi
  103b29:	c3                   	ret    
  103b2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00103b30 <MATOp_test1>:

int MATOp_test1()
{
  103b30:	56                   	push   %esi
  103b31:	53                   	push   %ebx
  103b32:	e8 d8 c7 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103b37:	81 c3 c9 84 00 00    	add    $0x84c9,%ebx
  103b3d:	83 ec 04             	sub    $0x4,%esp
  int page_index = palloc();
  103b40:	e8 fb fd ff ff       	call   103940 <palloc>
  if (test_allocation(page_index) == 1) return 1;
  103b45:	83 ec 0c             	sub    $0xc,%esp
  int page_index = palloc();
  103b48:	89 c6                	mov    %eax,%esi
  if (test_allocation(page_index) == 1) return 1;
  103b4a:	50                   	push   %eax
  103b4b:	e8 d0 fe ff ff       	call   103a20 <test_allocation>
  103b50:	83 c4 10             	add    $0x10,%esp
  103b53:	83 f8 01             	cmp    $0x1,%eax
  103b56:	74 30                	je     103b88 <MATOp_test1+0x58>
  if (test_free(page_index) == 1) return 1;
  103b58:	83 ec 0c             	sub    $0xc,%esp
  103b5b:	56                   	push   %esi
  103b5c:	e8 7f ff ff ff       	call   103ae0 <test_free>
  103b61:	83 c4 10             	add    $0x10,%esp
  103b64:	83 f8 01             	cmp    $0x1,%eax
  103b67:	74 1f                	je     103b88 <MATOp_test1+0x58>
  dprintf("test 1 passed.\n");
  103b69:	8d 83 09 ac ff ff    	lea    -0x53f7(%ebx),%eax
  103b6f:	83 ec 0c             	sub    $0xc,%esp
  103b72:	50                   	push   %eax
  103b73:	e8 8c e6 ff ff       	call   102204 <dprintf>
  return 0;
  103b78:	83 c4 10             	add    $0x10,%esp
  103b7b:	31 c0                	xor    %eax,%eax
}
  103b7d:	83 c4 04             	add    $0x4,%esp
  103b80:	5b                   	pop    %ebx
  103b81:	5e                   	pop    %esi
  103b82:	c3                   	ret    
  103b83:	90                   	nop
  103b84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103b88:	83 c4 04             	add    $0x4,%esp
  if (test_allocation(page_index) == 1) return 1;
  103b8b:	b8 01 00 00 00       	mov    $0x1,%eax
}
  103b90:	5b                   	pop    %ebx
  103b91:	5e                   	pop    %esi
  103b92:	c3                   	ret    
  103b93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  103b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103ba0 <MATOp_test_own>:
 * Be extra careful to make sure that if you overwrite some of the kernel data, they are set back to
 * the original value. O.w., it may make the future test scripts to fail even if you implement all
 * the functions correctly.
 */
int MATOp_test_own()
{
  103ba0:	55                   	push   %ebp
  103ba1:	57                   	push   %edi
  103ba2:	56                   	push   %esi
  103ba3:	53                   	push   %ebx
  103ba4:	e8 66 c7 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103ba9:	81 c3 57 84 00 00    	add    $0x8457,%ebx
  103baf:	83 ec 1c             	sub    $0x1c,%esp
  // TODO (optional)
  int page_index = palloc();
  103bb2:	e8 89 fd ff ff       	call   103940 <palloc>
  103bb7:	89 c6                	mov    %eax,%esi
  int next_page_index;
  int max_available_pages = get_nps() - 262144;
  103bb9:	e8 62 f7 ff ff       	call   103320 <get_nps>
  for (int i = 0; i < max_available_pages + 10; i++) {
  103bbe:	2d f7 ff 03 00       	sub    $0x3fff7,%eax
  103bc3:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103bc7:	78 60                	js     103c29 <MATOp_test_own+0x89>
  103bc9:	31 ff                	xor    %edi,%edi
  103bcb:	eb 1f                	jmp    103bec <MATOp_test_own+0x4c>
  103bcd:	8d 76 00             	lea    0x0(%esi),%esi
    next_page_index = palloc();
    if (test_allocation(page_index) == 1){
      dprintf("Own allocation test: Failed on iteration: %d\n", i); 
      return 1;
    }
    if (test_free(page_index) == 1) {
  103bd0:	83 ec 0c             	sub    $0xc,%esp
  103bd3:	56                   	push   %esi
  103bd4:	e8 07 ff ff ff       	call   103ae0 <test_free>
  103bd9:	83 c4 10             	add    $0x10,%esp
  103bdc:	83 f8 01             	cmp    $0x1,%eax
  103bdf:	74 7f                	je     103c60 <MATOp_test_own+0xc0>
  for (int i = 0; i < max_available_pages + 10; i++) {
  103be1:	83 c7 01             	add    $0x1,%edi
  103be4:	3b 7c 24 0c          	cmp    0xc(%esp),%edi
    next_page_index = palloc();
  103be8:	89 ee                	mov    %ebp,%esi
  for (int i = 0; i < max_available_pages + 10; i++) {
  103bea:	7f 3f                	jg     103c2b <MATOp_test_own+0x8b>
    next_page_index = palloc();
  103bec:	e8 4f fd ff ff       	call   103940 <palloc>
    if (test_allocation(page_index) == 1){
  103bf1:	83 ec 0c             	sub    $0xc,%esp
    next_page_index = palloc();
  103bf4:	89 c5                	mov    %eax,%ebp
    if (test_allocation(page_index) == 1){
  103bf6:	56                   	push   %esi
  103bf7:	e8 24 fe ff ff       	call   103a20 <test_allocation>
  103bfc:	83 c4 10             	add    $0x10,%esp
  103bff:	83 f8 01             	cmp    $0x1,%eax
  103c02:	75 cc                	jne    103bd0 <MATOp_test_own+0x30>
  103c04:	89 44 24 0c          	mov    %eax,0xc(%esp)
      dprintf("Own allocation test: Failed on iteration: %d\n", i); 
  103c08:	8d 83 a4 ac ff ff    	lea    -0x535c(%ebx),%eax
  103c0e:	83 ec 08             	sub    $0x8,%esp
  103c11:	57                   	push   %edi
  103c12:	50                   	push   %eax
  103c13:	e8 ec e5 ff ff       	call   102204 <dprintf>
      return 1;
  103c18:	83 c4 10             	add    $0x10,%esp
  103c1b:	8b 54 24 0c          	mov    0xc(%esp),%edx
  pfree(page_index);
  dprintf("page_index is: %d\n", page_index);

  dprintf("own test passed.\n");
  return 0;
}
  103c1f:	83 c4 1c             	add    $0x1c,%esp
  103c22:	5b                   	pop    %ebx
  103c23:	89 d0                	mov    %edx,%eax
  103c25:	5e                   	pop    %esi
  103c26:	5f                   	pop    %edi
  103c27:	5d                   	pop    %ebp
  103c28:	c3                   	ret    
  int page_index = palloc();
  103c29:	89 f5                	mov    %esi,%ebp
  pfree(page_index);
  103c2b:	83 ec 0c             	sub    $0xc,%esp
  103c2e:	55                   	push   %ebp
  103c2f:	e8 8c fd ff ff       	call   1039c0 <pfree>
  dprintf("page_index is: %d\n", page_index);
  103c34:	58                   	pop    %eax
  103c35:	8d 83 32 ad ff ff    	lea    -0x52ce(%ebx),%eax
  103c3b:	5a                   	pop    %edx
  103c3c:	55                   	push   %ebp
  103c3d:	50                   	push   %eax
  103c3e:	e8 c1 e5 ff ff       	call   102204 <dprintf>
  dprintf("own test passed.\n");
  103c43:	8d 83 45 ad ff ff    	lea    -0x52bb(%ebx),%eax
  103c49:	89 04 24             	mov    %eax,(%esp)
  103c4c:	e8 b3 e5 ff ff       	call   102204 <dprintf>
  return 0;
  103c51:	83 c4 10             	add    $0x10,%esp
  103c54:	31 d2                	xor    %edx,%edx
}
  103c56:	83 c4 1c             	add    $0x1c,%esp
  103c59:	89 d0                	mov    %edx,%eax
  103c5b:	5b                   	pop    %ebx
  103c5c:	5e                   	pop    %esi
  103c5d:	5f                   	pop    %edi
  103c5e:	5d                   	pop    %ebp
  103c5f:	c3                   	ret    
  103c60:	89 44 24 0c          	mov    %eax,0xc(%esp)
      dprintf("Own free test: Failed on iteration: %d\n", i);
  103c64:	8d 83 d4 ac ff ff    	lea    -0x532c(%ebx),%eax
  103c6a:	83 ec 08             	sub    $0x8,%esp
  103c6d:	57                   	push   %edi
  103c6e:	50                   	push   %eax
  103c6f:	e8 90 e5 ff ff       	call   102204 <dprintf>
      return 1;
  103c74:	83 c4 10             	add    $0x10,%esp
  103c77:	8b 54 24 0c          	mov    0xc(%esp),%edx
}
  103c7b:	83 c4 1c             	add    $0x1c,%esp
  103c7e:	5b                   	pop    %ebx
  103c7f:	89 d0                	mov    %edx,%eax
  103c81:	5e                   	pop    %esi
  103c82:	5f                   	pop    %edi
  103c83:	5d                   	pop    %ebp
  103c84:	c3                   	ret    
  103c85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  103c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103c90 <test_MATOp>:

int test_MATOp()
{
  103c90:	53                   	push   %ebx
  103c91:	83 ec 08             	sub    $0x8,%esp
  return MATOp_test1() + MATOp_test_own();
  103c94:	e8 97 fe ff ff       	call   103b30 <MATOp_test1>
  103c99:	89 c3                	mov    %eax,%ebx
  103c9b:	e8 00 ff ff ff       	call   103ba0 <MATOp_test_own>
}
  103ca0:	83 c4 08             	add    $0x8,%esp
  return MATOp_test1() + MATOp_test_own();
  103ca3:	01 d8                	add    %ebx,%eax
}
  103ca5:	5b                   	pop    %ebx
  103ca6:	c3                   	ret    
  103ca7:	66 90                	xchg   %ax,%ax
  103ca9:	66 90                	xchg   %ax,%ax
  103cab:	66 90                	xchg   %ax,%ax
  103cad:	66 90                	xchg   %ax,%ax
  103caf:	90                   	nop

00103cb0 <container_init>:
/**
  * Initializes the container data for the root process (the one with index 0).
  * The root process is the one that gets spawned first by the kernel.
  */
void container_init(unsigned int mbi_addr)
{
  103cb0:	55                   	push   %ebp
  103cb1:	57                   	push   %edi
  103cb2:	56                   	push   %esi
  103cb3:	53                   	push   %ebx
  103cb4:	e8 56 c6 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103cb9:	81 c3 47 83 00 00    	add    $0x8347,%ebx
  103cbf:	83 ec 18             	sub    $0x18,%esp
  unsigned int real_quota;
  // TODO: define your local variables here.
  unsigned int i, nps;

  pmem_init(mbi_addr);
  103cc2:	ff 74 24 2c          	pushl  0x2c(%esp)
  103cc6:	e8 45 fa ff ff       	call   103710 <pmem_init>
    *  - It should be the number of the unallocated pages with the normal permission
    *    in the physical memory allocation table (AT).
    *  - We have already implemented functions that deal with AT data-structure in MATIntro layer.
    *    (see import.h for available functions)
    */
  nps = get_nps();
  103ccb:	e8 50 f6 ff ff       	call   103320 <get_nps>
  for(i = 0; i < nps; i++)
  103cd0:	83 c4 10             	add    $0x10,%esp
  103cd3:	85 c0                	test   %eax,%eax
  103cd5:	0f 84 95 00 00 00    	je     103d70 <container_init+0xc0>
  103cdb:	89 c7                	mov    %eax,%edi
  103cdd:	31 f6                	xor    %esi,%esi
  real_quota = 0;
  103cdf:	31 ed                	xor    %ebp,%ebp
  103ce1:	eb 0c                	jmp    103cef <container_init+0x3f>
  103ce3:	90                   	nop
  103ce4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < nps; i++)
  103ce8:	83 c6 01             	add    $0x1,%esi
  103ceb:	39 f7                	cmp    %esi,%edi
  103ced:	74 29                	je     103d18 <container_init+0x68>
    if(at_is_norm(i) && !at_is_allocated(i))
  103cef:	83 ec 0c             	sub    $0xc,%esp
  103cf2:	56                   	push   %esi
  103cf3:	e8 68 f6 ff ff       	call   103360 <at_is_norm>
  103cf8:	83 c4 10             	add    $0x10,%esp
  103cfb:	85 c0                	test   %eax,%eax
  103cfd:	74 e9                	je     103ce8 <container_init+0x38>
  103cff:	83 ec 0c             	sub    $0xc,%esp
  103d02:	56                   	push   %esi
  103d03:	e8 a8 f6 ff ff       	call   1033b0 <at_is_allocated>
  103d08:	83 c4 10             	add    $0x10,%esp
      real_quota++;
  103d0b:	83 f8 01             	cmp    $0x1,%eax
  103d0e:	83 d5 00             	adc    $0x0,%ebp
  for(i = 0; i < nps; i++)
  103d11:	83 c6 01             	add    $0x1,%esi
  103d14:	39 f7                	cmp    %esi,%edi
  103d16:	75 d7                	jne    103cef <container_init+0x3f>
  103d18:	89 ee                	mov    %ebp,%esi

  KERN_DEBUG("\nreal quota: %d\n\n", real_quota);
  103d1a:	8d 83 57 ad ff ff    	lea    -0x52a9(%ebx),%eax
  103d20:	55                   	push   %ebp
  103d21:	50                   	push   %eax
  103d22:	8d 83 6c ad ff ff    	lea    -0x5294(%ebx),%eax
  103d28:	6a 3a                	push   $0x3a
  103d2a:	50                   	push   %eax
  103d2b:	e8 08 e3 ff ff       	call   102038 <debug_normal>

  CONTAINER[0].quota = real_quota;
  103d30:	89 b3 80 df 81 00    	mov    %esi,0x81df80(%ebx)
  CONTAINER[0].usage = 0;
  103d36:	c7 83 84 df 81 00 00 	movl   $0x0,0x81df84(%ebx)
  103d3d:	00 00 00 
  CONTAINER[0].parent = 0;
  103d40:	c7 83 88 df 81 00 00 	movl   $0x0,0x81df88(%ebx)
  103d47:	00 00 00 
  CONTAINER[0].nchildren = 0;
  103d4a:	c7 83 8c df 81 00 00 	movl   $0x0,0x81df8c(%ebx)
  103d51:	00 00 00 
  CONTAINER[0].used = 1;
  103d54:	c7 83 90 df 81 00 01 	movl   $0x1,0x81df90(%ebx)
  103d5b:	00 00 00 
}
  103d5e:	83 c4 1c             	add    $0x1c,%esp
  103d61:	5b                   	pop    %ebx
  103d62:	5e                   	pop    %esi
  103d63:	5f                   	pop    %edi
  103d64:	5d                   	pop    %ebp
  103d65:	c3                   	ret    
  103d66:	8d 76 00             	lea    0x0(%esi),%esi
  103d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  real_quota = 0;
  103d70:	31 ed                	xor    %ebp,%ebp
  for(i = 0; i < nps; i++)
  103d72:	31 f6                	xor    %esi,%esi
  103d74:	eb a4                	jmp    103d1a <container_init+0x6a>
  103d76:	8d 76 00             	lea    0x0(%esi),%esi
  103d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103d80 <container_get_parent>:
/** TASK 2:
  * * Get the id of parent process of process # [id]
  * Hint: Simply return the parent field from CONTAINER for process id.
  */
unsigned int container_get_parent(unsigned int id)
{
  103d80:	8b 44 24 04          	mov    0x4(%esp),%eax
  103d84:	e8 48 d0 ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  103d89:	81 c2 77 82 00 00    	add    $0x8277,%edx
  // TODO
  return CONTAINER[id].parent;
  103d8f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  103d92:	8b 84 82 88 df 81 00 	mov    0x81df88(%edx,%eax,4),%eax
}
  103d99:	c3                   	ret    
  103d9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00103da0 <container_get_nchildren>:

/** TASK 3:
  * * Get the number of children of process # [id]
  */
unsigned int container_get_nchildren(unsigned int id)
{
  103da0:	8b 44 24 04          	mov    0x4(%esp),%eax
  103da4:	e8 28 d0 ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  103da9:	81 c2 57 82 00 00    	add    $0x8257,%edx
  // TODO
  return CONTAINER[id].nchildren;
  103daf:	8d 04 80             	lea    (%eax,%eax,4),%eax
  103db2:	8b 84 82 8c df 81 00 	mov    0x81df8c(%edx,%eax,4),%eax
}
  103db9:	c3                   	ret    
  103dba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00103dc0 <container_get_quota>:

/** TASK 4:
  * * Get the maximum memory quota of process # [id]
  */
unsigned int container_get_quota(unsigned int id)
{
  103dc0:	8b 44 24 04          	mov    0x4(%esp),%eax
  103dc4:	e8 08 d0 ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  103dc9:	81 c2 37 82 00 00    	add    $0x8237,%edx
  // TODO
  return CONTAINER[id].quota;
  103dcf:	8d 04 80             	lea    (%eax,%eax,4),%eax
  103dd2:	8b 84 82 80 df 81 00 	mov    0x81df80(%edx,%eax,4),%eax
}
  103dd9:	c3                   	ret    
  103dda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00103de0 <container_get_usage>:

/** TASK 5:
  * * Get the current memory usage of process # [id]
  */
unsigned int container_get_usage(unsigned int id)
{
  103de0:	8b 44 24 04          	mov    0x4(%esp),%eax
  103de4:	e8 e8 cf ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  103de9:	81 c2 17 82 00 00    	add    $0x8217,%edx
  // TODO
  return CONTAINER[id].usage;
  103def:	8d 04 80             	lea    (%eax,%eax,4),%eax
  103df2:	8b 84 82 84 df 81 00 	mov    0x81df84(%edx,%eax,4),%eax
}
  103df9:	c3                   	ret    
  103dfa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00103e00 <container_can_consume>:
  * * Determine whether the process # [id] can consume extra
  *   [n] pages of memory. If so, return 1, otherwise, return 0.
  * Hint 1: Check the definition of available fields in SContainer data-structure.
  */
unsigned int container_can_consume(unsigned int id, unsigned int n)
{
  103e00:	8b 44 24 04          	mov    0x4(%esp),%eax
  103e04:	e8 c8 cf ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  103e09:	81 c2 f7 81 00 00    	add    $0x81f7,%edx
  // TODO
  if(CONTAINER[id].quota - CONTAINER[id].usage >= n)
  103e0f:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  103e12:	8b 84 8a 80 df 81 00 	mov    0x81df80(%edx,%ecx,4),%eax
  103e19:	2b 84 8a 84 df 81 00 	sub    0x81df84(%edx,%ecx,4),%eax
  103e20:	3b 44 24 08          	cmp    0x8(%esp),%eax
  103e24:	0f 93 c0             	setae  %al
  103e27:	0f b6 c0             	movzbl %al,%eax
    return 1;
  return 0;
}
  103e2a:	c3                   	ret    
  103e2b:	90                   	nop
  103e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00103e30 <container_split>:
/**
 * Dedicates [quota] pages of memory for a new child process.
 * returns the container index for the new child process.
 */
unsigned int container_split(unsigned int id, unsigned int quota)
{
  103e30:	57                   	push   %edi
  103e31:	56                   	push   %esi
  103e32:	53                   	push   %ebx
  103e33:	8b 54 24 10          	mov    0x10(%esp),%edx
  103e37:	e8 d3 c4 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103e3c:	81 c3 c4 81 00 00    	add    $0x81c4,%ebx
  103e42:	8b 74 24 14          	mov    0x14(%esp),%esi
  unsigned int child, nc;

  nc = CONTAINER[id].nchildren;
  103e46:	8d 04 92             	lea    (%edx,%edx,4),%eax
  103e49:	8d 8c 83 80 df 81 00 	lea    0x81df80(%ebx,%eax,4),%ecx
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process
  103e50:	8d 44 52 01          	lea    0x1(%edx,%edx,2),%eax
  nc = CONTAINER[id].nchildren;
  103e54:	8b 79 0c             	mov    0xc(%ecx),%edi
    * Hint 1: Read about the parent/child relationship maintained in you kernel 
    *         (available at the top of this page and handout)
    */
  // Updates parent
  CONTAINER[id].nchildren++;
  CONTAINER[id].usage += quota;
  103e57:	01 71 04             	add    %esi,0x4(%ecx)
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process
  103e5a:	01 f8                	add    %edi,%eax
  CONTAINER[id].nchildren++;
  103e5c:	83 c7 01             	add    $0x1,%edi
  103e5f:	89 79 0c             	mov    %edi,0xc(%ecx)

  // Updates child
  CONTAINER[child].quota = quota;
  103e62:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  103e65:	c1 e1 02             	shl    $0x2,%ecx
  103e68:	8d bc 0b 80 df 81 00 	lea    0x81df80(%ebx,%ecx,1),%edi
  103e6f:	89 37                	mov    %esi,(%edi)
  CONTAINER[child].parent = id;
  103e71:	89 57 08             	mov    %edx,0x8(%edi)
  CONTAINER[child].usage = 0;
  103e74:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
  CONTAINER[child].nchildren = 0;
  103e7b:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
  CONTAINER[child].used = 1;
  103e82:	c7 47 10 01 00 00 00 	movl   $0x1,0x10(%edi)

  return child;
}
  103e89:	5b                   	pop    %ebx
  103e8a:	5e                   	pop    %esi
  103e8b:	5f                   	pop    %edi
  103e8c:	c3                   	ret    
  103e8d:	8d 76 00             	lea    0x0(%esi),%esi

00103e90 <container_alloc>:
  * * 1. Allocates one more page for process # [id], given that its usage would not exceed the quota.
  * * 2. Update the contained structure to reflect the container structure should be updated accordingly after the allocation.
  * returns the page index of the allocated page, or 0 in the case of failure.
  */
unsigned int container_alloc(unsigned int id)
{
  103e90:	56                   	push   %esi
  103e91:	53                   	push   %ebx
  103e92:	e8 78 c4 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103e97:	81 c3 69 81 00 00    	add    $0x8169,%ebx
  103e9d:	83 ec 04             	sub    $0x4,%esp
  103ea0:	8b 44 24 10          	mov    0x10(%esp),%eax
  /*
   * TODO: implement the function here.
   */
  if(CONTAINER[id].usage + 1 <= CONTAINER[id].quota){
  103ea4:	8d 14 80             	lea    (%eax,%eax,4),%edx
  103ea7:	31 c0                	xor    %eax,%eax
  103ea9:	c1 e2 02             	shl    $0x2,%edx
  103eac:	8d b4 13 80 df 81 00 	lea    0x81df80(%ebx,%edx,1),%esi
  103eb3:	8b 4e 04             	mov    0x4(%esi),%ecx
  103eb6:	3b 8c 13 80 df 81 00 	cmp    0x81df80(%ebx,%edx,1),%ecx
  103ebd:	7d 0b                	jge    103eca <container_alloc+0x3a>
    CONTAINER[id].usage++;
  103ebf:	83 c1 01             	add    $0x1,%ecx
  103ec2:	89 4e 04             	mov    %ecx,0x4(%esi)
    return palloc();
  103ec5:	e8 76 fa ff ff       	call   103940 <palloc>
  }
  return 0;
}
  103eca:	83 c4 04             	add    $0x4,%esp
  103ecd:	5b                   	pop    %ebx
  103ece:	5e                   	pop    %esi
  103ecf:	c3                   	ret    

00103ed0 <container_free>:
  * Hint: You have already implemented functions:
  *  - to check if a page_index is allocated
  *  - to free a page_index in MATOp layer.
  */
void container_free(unsigned int id, unsigned int page_index)
{
  103ed0:	53                   	push   %ebx
  103ed1:	e8 39 c4 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103ed6:	81 c3 2a 81 00 00    	add    $0x812a,%ebx
  103edc:	83 ec 14             	sub    $0x14,%esp
  103edf:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  // TODO
  CONTAINER[id].usage--;
  pfree(page_index);
  103ee3:	ff 74 24 20          	pushl  0x20(%esp)
  CONTAINER[id].usage--;
  103ee7:	8d 04 80             	lea    (%eax,%eax,4),%eax
  103eea:	83 ac 83 84 df 81 00 	subl   $0x1,0x81df84(%ebx,%eax,4)
  103ef1:	01 
  pfree(page_index);
  103ef2:	e8 c9 fa ff ff       	call   1039c0 <pfree>
}
  103ef7:	83 c4 18             	add    $0x18,%esp
  103efa:	5b                   	pop    %ebx
  103efb:	c3                   	ret    
  103efc:	66 90                	xchg   %ax,%ax
  103efe:	66 90                	xchg   %ax,%ax

00103f00 <MContainer_test1>:
#include <lib/debug.h>
#include "export.h"

int MContainer_test1()
{
  103f00:	53                   	push   %ebx
  103f01:	e8 09 c4 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103f06:	81 c3 fa 80 00 00    	add    $0x80fa,%ebx
  103f0c:	83 ec 14             	sub    $0x14,%esp
  if (container_get_quota(0) <= 10000) {
  103f0f:	6a 00                	push   $0x0
  103f11:	e8 aa fe ff ff       	call   103dc0 <container_get_quota>
  103f16:	83 c4 10             	add    $0x10,%esp
  103f19:	3d 10 27 00 00       	cmp    $0x2710,%eax
  103f1e:	76 17                	jbe    103f37 <MContainer_test1+0x37>
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (container_can_consume(0, 10000) != 1) {
  103f20:	83 ec 08             	sub    $0x8,%esp
  103f23:	68 10 27 00 00       	push   $0x2710
  103f28:	6a 00                	push   $0x0
  103f2a:	e8 d1 fe ff ff       	call   103e00 <container_can_consume>
  103f2f:	83 c4 10             	add    $0x10,%esp
  103f32:	83 f8 01             	cmp    $0x1,%eax
  103f35:	74 21                	je     103f58 <MContainer_test1+0x58>
    dprintf("test 1 failed.\n");
  103f37:	8d 83 f9 ab ff ff    	lea    -0x5407(%ebx),%eax
  103f3d:	83 ec 0c             	sub    $0xc,%esp
  103f40:	50                   	push   %eax
  103f41:	e8 be e2 ff ff       	call   102204 <dprintf>
    return 1;
  103f46:	83 c4 10             	add    $0x10,%esp
  103f49:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  103f4e:	83 c4 08             	add    $0x8,%esp
  103f51:	5b                   	pop    %ebx
  103f52:	c3                   	ret    
  103f53:	90                   	nop
  103f54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (container_can_consume(0, 10000000) != 0) {
  103f58:	83 ec 08             	sub    $0x8,%esp
  103f5b:	68 80 96 98 00       	push   $0x989680
  103f60:	6a 00                	push   $0x0
  103f62:	e8 99 fe ff ff       	call   103e00 <container_can_consume>
  103f67:	83 c4 10             	add    $0x10,%esp
  103f6a:	85 c0                	test   %eax,%eax
  103f6c:	75 c9                	jne    103f37 <MContainer_test1+0x37>
  dprintf("test 1 passed.\n");
  103f6e:	8d 83 09 ac ff ff    	lea    -0x53f7(%ebx),%eax
  103f74:	83 ec 0c             	sub    $0xc,%esp
  103f77:	50                   	push   %eax
  103f78:	e8 87 e2 ff ff       	call   102204 <dprintf>
  103f7d:	83 c4 10             	add    $0x10,%esp
  return 0;
  103f80:	31 c0                	xor    %eax,%eax
}
  103f82:	83 c4 08             	add    $0x8,%esp
  103f85:	5b                   	pop    %ebx
  103f86:	c3                   	ret    
  103f87:	89 f6                	mov    %esi,%esi
  103f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00103f90 <MContainer_test2>:


int MContainer_test2()
{
  103f90:	55                   	push   %ebp
  103f91:	57                   	push   %edi
  103f92:	56                   	push   %esi
  103f93:	53                   	push   %ebx
  103f94:	e8 76 c3 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  103f99:	81 c3 67 80 00 00    	add    $0x8067,%ebx
  103f9f:	83 ec 18             	sub    $0x18,%esp
  unsigned int old_usage = container_get_usage(0);
  103fa2:	6a 00                	push   $0x0
  103fa4:	e8 37 fe ff ff       	call   103de0 <container_get_usage>
  unsigned int old_nchildren = container_get_nchildren(0);
  103fa9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  unsigned int old_usage = container_get_usage(0);
  103fb0:	89 c7                	mov    %eax,%edi
  unsigned int old_nchildren = container_get_nchildren(0);
  103fb2:	e8 e9 fd ff ff       	call   103da0 <container_get_nchildren>
  103fb7:	89 c5                	mov    %eax,%ebp
  unsigned int chid = container_split(0, 100);
  103fb9:	58                   	pop    %eax
  103fba:	5a                   	pop    %edx
  103fbb:	6a 64                	push   $0x64
  103fbd:	6a 00                	push   $0x0
  103fbf:	e8 6c fe ff ff       	call   103e30 <container_split>
  if (container_get_quota(chid) != 100 || container_get_parent(chid) != 0 ||
  103fc4:	89 04 24             	mov    %eax,(%esp)
  unsigned int chid = container_split(0, 100);
  103fc7:	89 c6                	mov    %eax,%esi
  if (container_get_quota(chid) != 100 || container_get_parent(chid) != 0 ||
  103fc9:	e8 f2 fd ff ff       	call   103dc0 <container_get_quota>
  103fce:	83 c4 10             	add    $0x10,%esp
  103fd1:	83 f8 64             	cmp    $0x64,%eax
  103fd4:	74 22                	je     103ff8 <MContainer_test2+0x68>
      container_get_usage(chid) != 0 || container_get_nchildren(chid) != 0 ||
      container_get_usage(0) != old_usage + 100 || container_get_nchildren(0) != old_nchildren + 1) {
    dprintf("test 2 failed.\n");
  103fd6:	8d 83 19 ac ff ff    	lea    -0x53e7(%ebx),%eax
  103fdc:	83 ec 0c             	sub    $0xc,%esp
  103fdf:	50                   	push   %eax
  103fe0:	e8 1f e2 ff ff       	call   102204 <dprintf>
    return 1;
  103fe5:	83 c4 10             	add    $0x10,%esp
  103fe8:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 2 failed.\n");
    return 1;
  }
  dprintf("test 2 passed.\n");
  return 0;
}
  103fed:	83 c4 0c             	add    $0xc,%esp
  103ff0:	5b                   	pop    %ebx
  103ff1:	5e                   	pop    %esi
  103ff2:	5f                   	pop    %edi
  103ff3:	5d                   	pop    %ebp
  103ff4:	c3                   	ret    
  103ff5:	8d 76 00             	lea    0x0(%esi),%esi
  if (container_get_quota(chid) != 100 || container_get_parent(chid) != 0 ||
  103ff8:	83 ec 0c             	sub    $0xc,%esp
  103ffb:	56                   	push   %esi
  103ffc:	e8 7f fd ff ff       	call   103d80 <container_get_parent>
  104001:	83 c4 10             	add    $0x10,%esp
  104004:	85 c0                	test   %eax,%eax
  104006:	75 ce                	jne    103fd6 <MContainer_test2+0x46>
      container_get_usage(chid) != 0 || container_get_nchildren(chid) != 0 ||
  104008:	83 ec 0c             	sub    $0xc,%esp
  10400b:	56                   	push   %esi
  10400c:	e8 cf fd ff ff       	call   103de0 <container_get_usage>
  if (container_get_quota(chid) != 100 || container_get_parent(chid) != 0 ||
  104011:	83 c4 10             	add    $0x10,%esp
  104014:	85 c0                	test   %eax,%eax
  104016:	75 be                	jne    103fd6 <MContainer_test2+0x46>
      container_get_usage(chid) != 0 || container_get_nchildren(chid) != 0 ||
  104018:	83 ec 0c             	sub    $0xc,%esp
  10401b:	56                   	push   %esi
  10401c:	e8 7f fd ff ff       	call   103da0 <container_get_nchildren>
  104021:	83 c4 10             	add    $0x10,%esp
  104024:	85 c0                	test   %eax,%eax
  104026:	75 ae                	jne    103fd6 <MContainer_test2+0x46>
      container_get_usage(0) != old_usage + 100 || container_get_nchildren(0) != old_nchildren + 1) {
  104028:	83 ec 0c             	sub    $0xc,%esp
  10402b:	83 c7 64             	add    $0x64,%edi
  10402e:	6a 00                	push   $0x0
  104030:	e8 ab fd ff ff       	call   103de0 <container_get_usage>
      container_get_usage(chid) != 0 || container_get_nchildren(chid) != 0 ||
  104035:	83 c4 10             	add    $0x10,%esp
  104038:	39 f8                	cmp    %edi,%eax
  10403a:	75 9a                	jne    103fd6 <MContainer_test2+0x46>
      container_get_usage(0) != old_usage + 100 || container_get_nchildren(0) != old_nchildren + 1) {
  10403c:	83 ec 0c             	sub    $0xc,%esp
  10403f:	83 c5 01             	add    $0x1,%ebp
  104042:	6a 00                	push   $0x0
  104044:	e8 57 fd ff ff       	call   103da0 <container_get_nchildren>
  104049:	83 c4 10             	add    $0x10,%esp
  10404c:	39 e8                	cmp    %ebp,%eax
  10404e:	75 86                	jne    103fd6 <MContainer_test2+0x46>
  container_alloc(chid);
  104050:	83 ec 0c             	sub    $0xc,%esp
  104053:	56                   	push   %esi
  104054:	e8 37 fe ff ff       	call   103e90 <container_alloc>
  if (container_get_usage(chid) != 1) {
  104059:	89 34 24             	mov    %esi,(%esp)
  10405c:	e8 7f fd ff ff       	call   103de0 <container_get_usage>
  104061:	83 c4 10             	add    $0x10,%esp
  104064:	83 f8 01             	cmp    $0x1,%eax
  104067:	0f 85 69 ff ff ff    	jne    103fd6 <MContainer_test2+0x46>
  dprintf("test 2 passed.\n");
  10406d:	8d 83 29 ac ff ff    	lea    -0x53d7(%ebx),%eax
  104073:	83 ec 0c             	sub    $0xc,%esp
  104076:	50                   	push   %eax
  104077:	e8 88 e1 ff ff       	call   102204 <dprintf>
  return 0;
  10407c:	83 c4 10             	add    $0x10,%esp
  10407f:	31 c0                	xor    %eax,%eax
  104081:	e9 67 ff ff ff       	jmp    103fed <MContainer_test2+0x5d>
  104086:	8d 76 00             	lea    0x0(%esi),%esi
  104089:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104090 <MContainer_test_own>:
int MContainer_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  104090:	31 c0                	xor    %eax,%eax
  104092:	c3                   	ret    
  104093:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001040a0 <test_MContainer>:

int test_MContainer()
{
  1040a0:	53                   	push   %ebx
  1040a1:	83 ec 08             	sub    $0x8,%esp
  return MContainer_test1() + MContainer_test2() + MContainer_test_own();
  1040a4:	e8 57 fe ff ff       	call   103f00 <MContainer_test1>
  1040a9:	89 c3                	mov    %eax,%ebx
  1040ab:	e8 e0 fe ff ff       	call   103f90 <MContainer_test2>
}
  1040b0:	83 c4 08             	add    $0x8,%esp
  return MContainer_test1() + MContainer_test2() + MContainer_test_own();
  1040b3:	01 d8                	add    %ebx,%eax
}
  1040b5:	5b                   	pop    %ebx
  1040b6:	c3                   	ret    
  1040b7:	66 90                	xchg   %ax,%ax
  1040b9:	66 90                	xchg   %ax,%ax
  1040bb:	66 90                	xchg   %ax,%ax
  1040bd:	66 90                	xchg   %ax,%ax
  1040bf:	90                   	nop

001040c0 <set_pdir_base>:

/** TASK 1:
  * * Set the CR3 register with the start address of the page structure for process # [index]
  */
void set_pdir_base(unsigned int index)
{
  1040c0:	53                   	push   %ebx
  1040c1:	e8 49 c2 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1040c6:	81 c3 3a 7f 00 00    	add    $0x7f3a,%ebx
  1040cc:	83 ec 14             	sub    $0x14,%esp
    // TODO
    // dprintf("\nPDirPool[index][0] = %d\n", PDirPool[index]);
    set_cr3((unsigned int)PDirPool[index]);
  1040cf:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  1040d3:	c1 e0 0c             	shl    $0xc,%eax
  1040d6:	81 c0 00 00 db 00    	add    $0xdb0000,%eax
  1040dc:	50                   	push   %eax
  1040dd:	e8 95 cc ff ff       	call   100d77 <set_cr3>
    // int i;
    // for(i = 0; i < NUM_IDS; i++){
    //   dprintf("i = %d, pde = %u\n", i, (unsigned int)PDirPool[i][300]);
    // }

}
  1040e2:	83 c4 18             	add    $0x18,%esp
  1040e5:	5b                   	pop    %ebx
  1040e6:	c3                   	ret    
  1040e7:	89 f6                	mov    %esi,%esi
  1040e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001040f0 <get_pdir_entry>:
/** TASK 2:
  * * Return the page directory entry # [pde_index] of the process # [proc_index]
  * - This can be used to test whether the page directory entry is mapped
  */
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
  1040f0:	e8 d8 cc ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  1040f5:	05 0b 7f 00 00       	add    $0x7f0b,%eax
    // TODO
    return (unsigned int)PDirPool[proc_index][pde_index];
  1040fa:	c7 c2 00 00 db 00    	mov    $0xdb0000,%edx
  104100:	8b 44 24 04          	mov    0x4(%esp),%eax
  104104:	c1 e0 0a             	shl    $0xa,%eax
  104107:	03 44 24 08          	add    0x8(%esp),%eax
  10410b:	8b 04 82             	mov    (%edx,%eax,4),%eax
}   
  10410e:	c3                   	ret    
  10410f:	90                   	nop

00104110 <set_pdir_entry>:
  * - You should also set the permissions PTE_P, PTE_W, and PTE_U
  * Hint 1: PT_PERM_PTU is defined for you.
  * Hint 2: 
  */
void set_pdir_entry(unsigned int proc_index, unsigned int pde_index, unsigned int page_index)
{
  104110:	e8 b8 cc ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  104115:	05 eb 7e 00 00       	add    $0x7eeb,%eax
    // TODO
    // PDirPool[page_index] = IDPTbl[proc_index][pde_index];
    PDirPool[proc_index][pde_index] = (char*)((page_index<<12) | PT_PERM_PTU);
  10411a:	8b 54 24 0c          	mov    0xc(%esp),%edx
  10411e:	c7 c1 00 00 db 00    	mov    $0xdb0000,%ecx
  104124:	8b 44 24 04          	mov    0x4(%esp),%eax
  104128:	c1 e2 0c             	shl    $0xc,%edx
  10412b:	c1 e0 0a             	shl    $0xa,%eax
  10412e:	03 44 24 08          	add    0x8(%esp),%eax
  104132:	83 ca 07             	or     $0x7,%edx
  104135:	89 14 81             	mov    %edx,(%ecx,%eax,4)
    // dprintf("\nPDirPool[proc][pde] = %u\n", PDirPool[proc_index][pde_index]);
}   
  104138:	c3                   	ret    
  104139:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104140 <set_pdir_entry_identity>:
  * - You should also set the permissions PTE_P, PTE_W, and PTE_U
  * - This will be used to map the page directory entry to identity page table.
  * Hint 1: Cast the first entry of IDPTbl[pde_index] to char *.
  */
void set_pdir_entry_identity(unsigned int proc_index, unsigned int pde_index)
{   
  104140:	53                   	push   %ebx
    // TODO
    PDirPool[proc_index][pde_index] = (char*)((unsigned int)IDPTbl[pde_index] | PT_PERM_PTU);
  104141:	8b 54 24 08          	mov    0x8(%esp),%edx
{   
  104145:	8b 44 24 0c          	mov    0xc(%esp),%eax
  104149:	e8 c1 c1 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10414e:	81 c3 b2 7e 00 00    	add    $0x7eb2,%ebx
    PDirPool[proc_index][pde_index] = (char*)((unsigned int)IDPTbl[pde_index] | PT_PERM_PTU);
  104154:	c1 e2 0a             	shl    $0xa,%edx
  104157:	01 c2                	add    %eax,%edx
  104159:	c1 e0 0c             	shl    $0xc,%eax
  10415c:	81 c0 00 00 9b 00    	add    $0x9b0000,%eax
  104162:	c7 c1 00 00 db 00    	mov    $0xdb0000,%ecx
  104168:	83 c8 07             	or     $0x7,%eax
  10416b:	89 04 91             	mov    %eax,(%ecx,%edx,4)
    // dprintf("\nIDPTbl[pde_index] = %u\n", (unsigned int)IDPTbl[pde_index] + 7);
    // dprintf("\nval = %u\n", ((unsigned int)IDPTbl[pde_index] | PT_PERM_PTU));
}   
  10416e:	5b                   	pop    %ebx
  10416f:	c3                   	ret    

00104170 <rmv_pdir_entry>:
  * * Remove specified page directory entry 
  * Hint 1: Set the page directory entry to PT_PERM_UP.
  * Hint 2: Don't forget to cast the value to (char *).
  */
void rmv_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
  104170:	e8 58 cc ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  104175:	05 8b 7e 00 00       	add    $0x7e8b,%eax
    // TODO
    PDirPool[proc_index][pde_index] = (char*)PT_PERM_UP;
  10417a:	c7 c2 00 00 db 00    	mov    $0xdb0000,%edx
  104180:	8b 44 24 04          	mov    0x4(%esp),%eax
  104184:	c1 e0 0a             	shl    $0xa,%eax
  104187:	03 44 24 08          	add    0x8(%esp),%eax
  10418b:	c7 04 82 00 00 00 00 	movl   $0x0,(%edx,%eax,4)
}   
  104192:	c3                   	ret    
  104193:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001041a0 <get_ptbl_entry>:
  * Hint 2: Do not forget that the permission info is also stored in the page directory entries.
  *         (You will have to mask out the permission info.)
  * Hint 3: Remember to cast to a pointer before de-referencing an address.
  */
unsigned int get_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{   
  1041a0:	e8 28 cc ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  1041a5:	05 5b 7e 00 00       	add    $0x7e5b,%eax
    // unsigned int* frame = (unsigned int*)PDirPool[proc_index][pde_index];
    // frame = frame>>12;
    // frame = frame<<12;
    // return frame[pte_index];
    unsigned int* frame;
    unsigned int frameNum = (unsigned int)PDirPool[proc_index][pde_index];
  1041aa:	c7 c2 00 00 db 00    	mov    $0xdb0000,%edx
  1041b0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1041b4:	c1 e0 0a             	shl    $0xa,%eax
  1041b7:	03 44 24 08          	add    0x8(%esp),%eax
  1041bb:	8b 04 82             	mov    (%edx,%eax,4),%eax
    frameNum = frameNum>>12;
    frameNum = frameNum<<12;
    frame = (unsigned int*)frameNum;
    return frame[pte_index];
  1041be:	8b 54 24 0c          	mov    0xc(%esp),%edx
    frameNum = frameNum<<12;
  1041c2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    return frame[pte_index];
  1041c7:	8b 04 90             	mov    (%eax,%edx,4),%eax
}
  1041ca:	c3                   	ret    
  1041cb:	90                   	nop
  1041cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001041d0 <set_ptbl_entry>:
  * * Sets specified page table entry with the start address of physical page # [page_index]
  * - You should also set the given permission
  * Hint 1: Same as TASK 6
  */
void set_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index, unsigned int page_index, unsigned int perm)
{   
  1041d0:	e8 f8 cb ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  1041d5:	05 2b 7e 00 00       	add    $0x7e2b,%eax
    unsigned int* frame;
    unsigned int frameNum = (unsigned int)PDirPool[proc_index][pde_index];
    frameNum = frameNum>>12;
    frameNum = frameNum<<12;
    frame = (unsigned int*)frameNum;
    frame[pte_index] = (page_index<<12) | perm;
  1041da:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    unsigned int frameNum = (unsigned int)PDirPool[proc_index][pde_index];
  1041de:	c7 c2 00 00 db 00    	mov    $0xdb0000,%edx
  1041e4:	8b 44 24 04          	mov    0x4(%esp),%eax
  1041e8:	c1 e0 0a             	shl    $0xa,%eax
  1041eb:	03 44 24 08          	add    0x8(%esp),%eax
  1041ef:	8b 14 82             	mov    (%edx,%eax,4),%edx
    frame[pte_index] = (page_index<<12) | perm;
  1041f2:	8b 44 24 10          	mov    0x10(%esp),%eax
  1041f6:	c1 e0 0c             	shl    $0xc,%eax
  1041f9:	0b 44 24 14          	or     0x14(%esp),%eax
    frameNum = frameNum<<12;
  1041fd:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    frame[pte_index] = (page_index<<12) | perm;
  104203:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
}   
  104206:	c3                   	ret    
  104207:	89 f6                	mov    %esi,%esi
  104209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104210 <set_ptbl_entry_identity>:
  * | 4       |    A[1][1]   |
  * | 5       |    A[1][2]   |
  * |---------|--------------|
  */
void set_ptbl_entry_identity(unsigned int pde_index, unsigned int pte_index, unsigned int perm)
{
  104210:	e8 b8 cb ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  104215:	05 eb 7d 00 00       	add    $0x7deb,%eax
    // IDPTbl[pde_index][pte_index] = ((pde_index*1024 + pte_index)*4096) | perm;
    // IDPTbl[pde_index][pte_index] = pde_index*1024*4096 | perm;
    // dprintf("perm = %u\n", perm);
    // IDPTbl[pde_index][pte_index] = pde_index*1024*4096 + perm;
    // dprintf("\nidptbl[0] addr = %u\n", (unsigned int)IDPTbl[0]);
    IDPTbl[pde_index][pte_index] = (pde_index*1024 + pte_index)*4096 | perm;
  10421a:	c7 c1 00 00 9b 00    	mov    $0x9b0000,%ecx
  104220:	8b 44 24 04          	mov    0x4(%esp),%eax
  104224:	c1 e0 0a             	shl    $0xa,%eax
  104227:	03 44 24 08          	add    0x8(%esp),%eax
  10422b:	89 c2                	mov    %eax,%edx
  10422d:	c1 e2 0c             	shl    $0xc,%edx
  104230:	0b 54 24 0c          	or     0xc(%esp),%edx
  104234:	89 14 81             	mov    %edx,(%ecx,%eax,4)
}
  104237:	c3                   	ret    
  104238:	90                   	nop
  104239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104240 <rmv_ptbl_entry>:
  * * Set the specified page table entry to 0
  * Hint 1: Remember that page directory entries also have permissions stored. Mask them out.
  * Hint 2: Remember to cast to a pointer before de-referencing an address.
  */
void rmv_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{
  104240:	e8 88 cb ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  104245:	05 bb 7d 00 00       	add    $0x7dbb,%eax
    // frame += 4*pte_index;
    // frame = frame<<12;
    // val = (unsigned int*)frame;
    // *val = 0;
    unsigned int* frame;
    unsigned int frameNum = (unsigned int)PDirPool[proc_index][pde_index];
  10424a:	c7 c2 00 00 db 00    	mov    $0xdb0000,%edx
  104250:	8b 44 24 04          	mov    0x4(%esp),%eax
  104254:	c1 e0 0a             	shl    $0xa,%eax
  104257:	03 44 24 08          	add    0x8(%esp),%eax
  10425b:	8b 04 82             	mov    (%edx,%eax,4),%eax
    frameNum = frameNum>>12;
    frameNum = frameNum<<12;
    frame = (unsigned int*)frameNum;
    frame[pte_index] = 0;
  10425e:	8b 54 24 0c          	mov    0xc(%esp),%edx
    frameNum = frameNum<<12;
  104262:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    frame[pte_index] = 0;
  104267:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
}
  10426e:	c3                   	ret    
  10426f:	90                   	nop

00104270 <MPTIntro_test1>:

extern char * PDirPool[NUM_IDS][1024];
extern unsigned int IDPTbl[1024][1024];

int MPTIntro_test1()
{
  104270:	53                   	push   %ebx
  104271:	e8 99 c0 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104276:	81 c3 8a 7d 00 00    	add    $0x7d8a,%ebx
  10427c:	83 ec 14             	sub    $0x14,%esp
  set_pdir_base(0);
  10427f:	6a 00                	push   $0x0
  104281:	e8 3a fe ff ff       	call   1040c0 <set_pdir_base>
  if ((unsigned int)PDirPool[0] != rcr3()) {
  104286:	e8 86 e7 ff ff       	call   102a11 <rcr3>
  10428b:	83 c4 10             	add    $0x10,%esp
  10428e:	81 f8 00 00 db 00    	cmp    $0xdb0000,%eax
  104294:	74 22                	je     1042b8 <MPTIntro_test1+0x48>
    dprintf("test 1a failed.\n");
  104296:	8d 83 8d ad ff ff    	lea    -0x5273(%ebx),%eax
  10429c:	83 ec 0c             	sub    $0xc,%esp
  10429f:	50                   	push   %eax
  1042a0:	e8 5f df ff ff       	call   102204 <dprintf>
    return 1;
  1042a5:	83 c4 10             	add    $0x10,%esp
  1042a8:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 1d failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  1042ad:	83 c4 08             	add    $0x8,%esp
  1042b0:	5b                   	pop    %ebx
  1042b1:	c3                   	ret    
  1042b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  set_pdir_entry_identity(1, 1);
  1042b8:	83 ec 08             	sub    $0x8,%esp
  1042bb:	6a 01                	push   $0x1
  1042bd:	6a 01                	push   $0x1
  1042bf:	e8 7c fe ff ff       	call   104140 <set_pdir_entry_identity>
  set_pdir_entry(1, 2, 100);
  1042c4:	83 c4 0c             	add    $0xc,%esp
  1042c7:	6a 64                	push   $0x64
  1042c9:	6a 02                	push   $0x2
  1042cb:	6a 01                	push   $0x1
  1042cd:	e8 3e fe ff ff       	call   104110 <set_pdir_entry>
  if (get_pdir_entry(1, 1) != (unsigned int)IDPTbl[1] +   7) {
  1042d2:	58                   	pop    %eax
  1042d3:	5a                   	pop    %edx
  1042d4:	6a 01                	push   $0x1
  1042d6:	6a 01                	push   $0x1
  1042d8:	e8 13 fe ff ff       	call   1040f0 <get_pdir_entry>
  1042dd:	c7 c2 00 00 9b 00    	mov    $0x9b0000,%edx
  1042e3:	83 c4 10             	add    $0x10,%esp
  1042e6:	81 c2 07 10 00 00    	add    $0x1007,%edx
  1042ec:	39 d0                	cmp    %edx,%eax
  1042ee:	74 20                	je     104310 <MPTIntro_test1+0xa0>
    dprintf("test 1b failed.\n");
  1042f0:	8d 83 9e ad ff ff    	lea    -0x5262(%ebx),%eax
  1042f6:	83 ec 0c             	sub    $0xc,%esp
  1042f9:	50                   	push   %eax
  1042fa:	e8 05 df ff ff       	call   102204 <dprintf>
    return 1;
  1042ff:	83 c4 10             	add    $0x10,%esp
  104302:	b8 01 00 00 00       	mov    $0x1,%eax
}
  104307:	83 c4 08             	add    $0x8,%esp
  10430a:	5b                   	pop    %ebx
  10430b:	c3                   	ret    
  10430c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  if (get_pdir_entry(1, 2) != 409607) {
  104310:	83 ec 08             	sub    $0x8,%esp
  104313:	6a 02                	push   $0x2
  104315:	6a 01                	push   $0x1
  104317:	e8 d4 fd ff ff       	call   1040f0 <get_pdir_entry>
  10431c:	83 c4 10             	add    $0x10,%esp
  10431f:	3d 07 40 06 00       	cmp    $0x64007,%eax
  104324:	74 22                	je     104348 <MPTIntro_test1+0xd8>
    dprintf("test 1c failed.\n");
  104326:	8d 83 af ad ff ff    	lea    -0x5251(%ebx),%eax
  10432c:	83 ec 0c             	sub    $0xc,%esp
  10432f:	50                   	push   %eax
  104330:	e8 cf de ff ff       	call   102204 <dprintf>
    return 1;
  104335:	83 c4 10             	add    $0x10,%esp
  104338:	b8 01 00 00 00       	mov    $0x1,%eax
  10433d:	e9 6b ff ff ff       	jmp    1042ad <MPTIntro_test1+0x3d>
  104342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  rmv_pdir_entry(1, 1);
  104348:	83 ec 08             	sub    $0x8,%esp
  10434b:	6a 01                	push   $0x1
  10434d:	6a 01                	push   $0x1
  10434f:	e8 1c fe ff ff       	call   104170 <rmv_pdir_entry>
  rmv_pdir_entry(1, 2);
  104354:	58                   	pop    %eax
  104355:	5a                   	pop    %edx
  104356:	6a 02                	push   $0x2
  104358:	6a 01                	push   $0x1
  10435a:	e8 11 fe ff ff       	call   104170 <rmv_pdir_entry>
  if (get_pdir_entry(1, 1) != 0 || get_pdir_entry(1, 2) != 0) {
  10435f:	59                   	pop    %ecx
  104360:	58                   	pop    %eax
  104361:	6a 01                	push   $0x1
  104363:	6a 01                	push   $0x1
  104365:	e8 86 fd ff ff       	call   1040f0 <get_pdir_entry>
  10436a:	83 c4 10             	add    $0x10,%esp
  10436d:	85 c0                	test   %eax,%eax
  10436f:	75 13                	jne    104384 <MPTIntro_test1+0x114>
  104371:	83 ec 08             	sub    $0x8,%esp
  104374:	6a 02                	push   $0x2
  104376:	6a 01                	push   $0x1
  104378:	e8 73 fd ff ff       	call   1040f0 <get_pdir_entry>
  10437d:	83 c4 10             	add    $0x10,%esp
  104380:	85 c0                	test   %eax,%eax
  104382:	74 1c                	je     1043a0 <MPTIntro_test1+0x130>
    dprintf("test 1d failed.\n");
  104384:	8d 83 c0 ad ff ff    	lea    -0x5240(%ebx),%eax
  10438a:	83 ec 0c             	sub    $0xc,%esp
  10438d:	50                   	push   %eax
  10438e:	e8 71 de ff ff       	call   102204 <dprintf>
  104393:	83 c4 10             	add    $0x10,%esp
    return 1;
  104396:	b8 01 00 00 00       	mov    $0x1,%eax
  10439b:	e9 0d ff ff ff       	jmp    1042ad <MPTIntro_test1+0x3d>
  dprintf("test 1 passed.\n");
  1043a0:	8d 83 09 ac ff ff    	lea    -0x53f7(%ebx),%eax
  1043a6:	83 ec 0c             	sub    $0xc,%esp
  1043a9:	50                   	push   %eax
  1043aa:	e8 55 de ff ff       	call   102204 <dprintf>
  1043af:	83 c4 10             	add    $0x10,%esp
  return 0;
  1043b2:	31 c0                	xor    %eax,%eax
  1043b4:	e9 f4 fe ff ff       	jmp    1042ad <MPTIntro_test1+0x3d>
  1043b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001043c0 <MPTIntro_test2>:

int MPTIntro_test2()
{
  1043c0:	53                   	push   %ebx
  1043c1:	e8 49 bf ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1043c6:	81 c3 3a 7c 00 00    	add    $0x7c3a,%ebx
  1043cc:	83 ec 0c             	sub    $0xc,%esp
  set_pdir_entry(1, 1, 10000);
  1043cf:	68 10 27 00 00       	push   $0x2710
  1043d4:	6a 01                	push   $0x1
  1043d6:	6a 01                	push   $0x1
  1043d8:	e8 33 fd ff ff       	call   104110 <set_pdir_entry>
  set_ptbl_entry(1, 1, 1, 10000, 259);
  1043dd:	c7 04 24 03 01 00 00 	movl   $0x103,(%esp)
  1043e4:	68 10 27 00 00       	push   $0x2710
  1043e9:	6a 01                	push   $0x1
  1043eb:	6a 01                	push   $0x1
  1043ed:	6a 01                	push   $0x1
  1043ef:	e8 dc fd ff ff       	call   1041d0 <set_ptbl_entry>
  // dprintf("%u\n", get_ptbl_entry(1, 1, 1));
  if (get_ptbl_entry(1, 1, 1) != 40960259) {
  1043f4:	83 c4 1c             	add    $0x1c,%esp
  1043f7:	6a 01                	push   $0x1
  1043f9:	6a 01                	push   $0x1
  1043fb:	6a 01                	push   $0x1
  1043fd:	e8 9e fd ff ff       	call   1041a0 <get_ptbl_entry>
  104402:	83 c4 10             	add    $0x10,%esp
  104405:	3d 03 01 71 02       	cmp    $0x2710103,%eax
  10440a:	74 34                	je     104440 <MPTIntro_test2+0x80>
    dprintf("test 2-a failed with get_ptbl_entry = %d.\n", get_ptbl_entry(1, 1, 1));
  10440c:	83 ec 04             	sub    $0x4,%esp
  10440f:	6a 01                	push   $0x1
  104411:	6a 01                	push   $0x1
  104413:	6a 01                	push   $0x1
  104415:	e8 86 fd ff ff       	call   1041a0 <get_ptbl_entry>
  10441a:	5a                   	pop    %edx
  10441b:	59                   	pop    %ecx
  10441c:	50                   	push   %eax
  10441d:	8d 83 e4 ad ff ff    	lea    -0x521c(%ebx),%eax
  104423:	50                   	push   %eax
  104424:	e8 db dd ff ff       	call   102204 <dprintf>
    return 1;
  104429:	83 c4 10             	add    $0x10,%esp
  10442c:	b8 01 00 00 00       	mov    $0x1,%eax
    return 1;
  }
  rmv_pdir_entry(1, 1);
  dprintf("test 2 passed.\n");
  return 0;
}
  104431:	83 c4 08             	add    $0x8,%esp
  104434:	5b                   	pop    %ebx
  104435:	c3                   	ret    
  104436:	8d 76 00             	lea    0x0(%esi),%esi
  104439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  rmv_ptbl_entry(1, 1, 1);
  104440:	83 ec 04             	sub    $0x4,%esp
  104443:	6a 01                	push   $0x1
  104445:	6a 01                	push   $0x1
  104447:	6a 01                	push   $0x1
  104449:	e8 f2 fd ff ff       	call   104240 <rmv_ptbl_entry>
  if (get_ptbl_entry(1, 1, 1) != 0) {
  10444e:	83 c4 0c             	add    $0xc,%esp
  104451:	6a 01                	push   $0x1
  104453:	6a 01                	push   $0x1
  104455:	6a 01                	push   $0x1
  104457:	e8 44 fd ff ff       	call   1041a0 <get_ptbl_entry>
  10445c:	83 c4 10             	add    $0x10,%esp
  10445f:	85 c0                	test   %eax,%eax
  104461:	75 2d                	jne    104490 <MPTIntro_test2+0xd0>
  rmv_pdir_entry(1, 1);
  104463:	83 ec 08             	sub    $0x8,%esp
  104466:	6a 01                	push   $0x1
  104468:	6a 01                	push   $0x1
  10446a:	e8 01 fd ff ff       	call   104170 <rmv_pdir_entry>
  dprintf("test 2 passed.\n");
  10446f:	8d 83 29 ac ff ff    	lea    -0x53d7(%ebx),%eax
  104475:	89 04 24             	mov    %eax,(%esp)
  104478:	e8 87 dd ff ff       	call   102204 <dprintf>
  10447d:	83 c4 10             	add    $0x10,%esp
  return 0;
  104480:	31 c0                	xor    %eax,%eax
}
  104482:	83 c4 08             	add    $0x8,%esp
  104485:	5b                   	pop    %ebx
  104486:	c3                   	ret    
  104487:	89 f6                	mov    %esi,%esi
  104489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    dprintf("test 2-b failed.\n");
  104490:	8d 83 d1 ad ff ff    	lea    -0x522f(%ebx),%eax
  104496:	83 ec 0c             	sub    $0xc,%esp
  104499:	50                   	push   %eax
  10449a:	e8 65 dd ff ff       	call   102204 <dprintf>
  10449f:	83 c4 10             	add    $0x10,%esp
    return 1;
  1044a2:	b8 01 00 00 00       	mov    $0x1,%eax
}
  1044a7:	83 c4 08             	add    $0x8,%esp
  1044aa:	5b                   	pop    %ebx
  1044ab:	c3                   	ret    
  1044ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001044b0 <MPTIntro_test_own>:
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  // set_ptbl_entry_identity(1, 1, 7);
  return 0;
}
  1044b0:	31 c0                	xor    %eax,%eax
  1044b2:	c3                   	ret    
  1044b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1044b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001044c0 <test_MPTIntro>:

int test_MPTIntro()
{
  1044c0:	53                   	push   %ebx
  1044c1:	83 ec 08             	sub    $0x8,%esp
  return MPTIntro_test1() + MPTIntro_test2() + MPTIntro_test_own();
  1044c4:	e8 a7 fd ff ff       	call   104270 <MPTIntro_test1>
  1044c9:	89 c3                	mov    %eax,%ebx
  1044cb:	e8 f0 fe ff ff       	call   1043c0 <MPTIntro_test2>
}
  1044d0:	83 c4 08             	add    $0x8,%esp
  return MPTIntro_test1() + MPTIntro_test2() + MPTIntro_test_own();
  1044d3:	01 d8                	add    %ebx,%eax
}
  1044d5:	5b                   	pop    %ebx
  1044d6:	c3                   	ret    
  1044d7:	66 90                	xchg   %ax,%ax
  1044d9:	66 90                	xchg   %ax,%ax
  1044db:	66 90                	xchg   %ax,%ax
  1044dd:	66 90                	xchg   %ax,%ax
  1044df:	90                   	nop

001044e0 <get_pdir_entry_by_va>:
  *         Use the masks defined above. (Do think of what the values are.)
  * Hint 2: Use the appropriate functions in MATIntro layer to 
  *         read the pdir_entry
  */
unsigned int get_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  1044e0:	53                   	push   %ebx
  1044e1:	e8 29 be ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1044e6:	81 c3 1a 7b 00 00    	add    $0x7b1a,%ebx
  1044ec:	83 ec 10             	sub    $0x10,%esp
    // TODO
    unsigned int pde_index = vaddr & DIR_MASK, pde;
    pde_index = pde_index>>DIR_SHIFT;
    // pde_index = pde_index / 4096;
    pde = get_pdir_entry(proc_index, pde_index);
  1044ef:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  1044f3:	c1 e8 16             	shr    $0x16,%eax
  1044f6:	50                   	push   %eax
  1044f7:	ff 74 24 1c          	pushl  0x1c(%esp)
  1044fb:	e8 f0 fb ff ff       	call   1040f0 <get_pdir_entry>
    // dprintf("\nvaddr = %u, pde_index = %u, pde = %u\n", vaddr, pde_index, pde);
    return pde;
}
  104500:	83 c4 18             	add    $0x18,%esp
  104503:	5b                   	pop    %ebx
  104504:	c3                   	ret    
  104505:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104510 <get_ptbl_entry_by_va>:
  * - Return 0 if the mapping does not exist in page directory entry (i.e. pde = 0).
  *
  * Hint 1: Same as TASK 1.
  */
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  104510:	55                   	push   %ebp
  104511:	57                   	push   %edi
  104512:	56                   	push   %esi
  104513:	53                   	push   %ebx
  104514:	e8 f6 bd ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104519:	81 c3 e7 7a 00 00    	add    $0x7ae7,%ebx
  10451f:	83 ec 14             	sub    $0x14,%esp
  104522:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  104526:	89 f7                	mov    %esi,%edi
    // TODO
    unsigned int pde_index = vaddr & DIR_MASK, pte_index = vaddr & PAGE_MASK, pte, pde, i;
    pde_index = pde_index>>DIR_SHIFT;
    pte_index = pte_index>>PAGE_SHIFT;
  104528:	c1 ee 0c             	shr    $0xc,%esi
  10452b:	c1 ef 16             	shr    $0x16,%edi
  10452e:	81 e6 ff 03 00 00    	and    $0x3ff,%esi
    pde = get_pdir_entry(proc_index, pde_index);
  104534:	57                   	push   %edi
  104535:	ff 74 24 2c          	pushl  0x2c(%esp)
  104539:	e8 b2 fb ff ff       	call   1040f0 <get_pdir_entry>
    pde = get_pdir_entry_by_va(proc_index, vaddr);
    // pde = get_pdir_entry(proc_index, pde_index);
    pte = get_ptbl_entry(proc_index, pde_index, pte_index);
  10453e:	83 c4 0c             	add    $0xc,%esp
    pde = get_pdir_entry(proc_index, pde_index);
  104541:	89 c5                	mov    %eax,%ebp
    pte = get_ptbl_entry(proc_index, pde_index, pte_index);
  104543:	56                   	push   %esi
  104544:	57                   	push   %edi
  104545:	ff 74 24 2c          	pushl  0x2c(%esp)
  104549:	e8 52 fc ff ff       	call   1041a0 <get_ptbl_entry>

    if(pde == 0)
      return 0;
    return pte;
  10454e:	85 ed                	test   %ebp,%ebp
  104550:	0f 45 e8             	cmovne %eax,%ebp
}         
  104553:	83 c4 1c             	add    $0x1c,%esp
  104556:	5b                   	pop    %ebx
  104557:	89 e8                	mov    %ebp,%eax
  104559:	5e                   	pop    %esi
  10455a:	5f                   	pop    %edi
  10455b:	5d                   	pop    %ebp
  10455c:	c3                   	ret    
  10455d:	8d 76 00             	lea    0x0(%esi),%esi

00104560 <rmv_pdir_entry_by_va>:
  * * Remove the page directory entry for the given virtual address
  * Hint 1: Calculate the arguments required by the function(rmv_pdir_entry) in MPTIntro layer
  *         and simply call it.
  */
void rmv_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  104560:	53                   	push   %ebx
  104561:	e8 a9 bd ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104566:	81 c3 9a 7a 00 00    	add    $0x7a9a,%ebx
  10456c:	83 ec 10             	sub    $0x10,%esp
    // TODO
    unsigned int pde_index = vaddr & DIR_MASK, pde;
    pde_index = pde_index>>DIR_SHIFT;
    rmv_pdir_entry(proc_index, pde_index);
  10456f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  104573:	c1 e8 16             	shr    $0x16,%eax
  104576:	50                   	push   %eax
  104577:	ff 74 24 1c          	pushl  0x1c(%esp)
  10457b:	e8 f0 fb ff ff       	call   104170 <rmv_pdir_entry>
}
  104580:	83 c4 18             	add    $0x18,%esp
  104583:	5b                   	pop    %ebx
  104584:	c3                   	ret    
  104585:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104590 <rmv_ptbl_entry_by_va>:
/** TASK 4:
  * * Remove the page table entry for the given virtual address
  * Hint 1: Same as TASK 3. Use the correct function.
  */
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  104590:	53                   	push   %ebx
  104591:	e8 79 bd ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104596:	81 c3 6a 7a 00 00    	add    $0x7a6a,%ebx
  10459c:	83 ec 0c             	sub    $0xc,%esp
  10459f:	8b 44 24 18          	mov    0x18(%esp),%eax
    // TODO
    unsigned int pde_index = vaddr & DIR_MASK, pte_index = vaddr & PAGE_MASK, pte, pde;
    pde_index = pde_index>>DIR_SHIFT;
    pte_index = pte_index>>PAGE_SHIFT;
  1045a3:	89 c2                	mov    %eax,%edx
    rmv_ptbl_entry(proc_index, pde_index, pte_index);
  1045a5:	c1 e8 16             	shr    $0x16,%eax
    pte_index = pte_index>>PAGE_SHIFT;
  1045a8:	c1 ea 0c             	shr    $0xc,%edx
  1045ab:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
    rmv_ptbl_entry(proc_index, pde_index, pte_index);
  1045b1:	52                   	push   %edx
  1045b2:	50                   	push   %eax
  1045b3:	ff 74 24 1c          	pushl  0x1c(%esp)
  1045b7:	e8 84 fc ff ff       	call   104240 <rmv_ptbl_entry>
}
  1045bc:	83 c4 18             	add    $0x18,%esp
  1045bf:	5b                   	pop    %ebx
  1045c0:	c3                   	ret    
  1045c1:	eb 0d                	jmp    1045d0 <set_pdir_entry_by_va>
  1045c3:	90                   	nop
  1045c4:	90                   	nop
  1045c5:	90                   	nop
  1045c6:	90                   	nop
  1045c7:	90                   	nop
  1045c8:	90                   	nop
  1045c9:	90                   	nop
  1045ca:	90                   	nop
  1045cb:	90                   	nop
  1045cc:	90                   	nop
  1045cd:	90                   	nop
  1045ce:	90                   	nop
  1045cf:	90                   	nop

001045d0 <set_pdir_entry_by_va>:
/** TASK 5:
  * * Register the mapping from the virtual address [vaddr] to physical page # [page_index] in the page directory.
  * Hint: Same as TASK 3. Use the correct function.
  */
void set_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index)
{
  1045d0:	53                   	push   %ebx
  1045d1:	e8 39 bd ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1045d6:	81 c3 2a 7a 00 00    	add    $0x7a2a,%ebx
  1045dc:	83 ec 0c             	sub    $0xc,%esp
    // TODO
    unsigned int pde_index = vaddr & DIR_MASK, pde;
    pde_index = pde_index>>DIR_SHIFT;
    set_pdir_entry(proc_index, pde_index, page_index);
  1045df:	ff 74 24 1c          	pushl  0x1c(%esp)
  1045e3:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  1045e7:	c1 e8 16             	shr    $0x16,%eax
  1045ea:	50                   	push   %eax
  1045eb:	ff 74 24 1c          	pushl  0x1c(%esp)
  1045ef:	e8 1c fb ff ff       	call   104110 <set_pdir_entry>
}   
  1045f4:	83 c4 18             	add    $0x18,%esp
  1045f7:	5b                   	pop    %ebx
  1045f8:	c3                   	ret    
  1045f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104600 <set_ptbl_entry_by_va>:
  * * Register the mapping from the virtual address [vaddr] to the physical page # [page_index] with permission [perm]
  * - You do not need to worry about the page directory entry. just map the page table entry.
  * Hint: Same as TASK 3. Use the correct function.
  */
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index, unsigned int perm)
{
  104600:	53                   	push   %ebx
  104601:	e8 09 bd ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104606:	81 c3 fa 79 00 00    	add    $0x79fa,%ebx
  10460c:	83 ec 14             	sub    $0x14,%esp
  10460f:	8b 44 24 20          	mov    0x20(%esp),%eax
    // TODO
    unsigned int pde_index = vaddr & DIR_MASK, pte_index = vaddr & PAGE_MASK, pte, pde;
    pde_index = pde_index>>DIR_SHIFT;
    pte_index = pte_index>>PAGE_SHIFT;
    // pte = get_ptbl_entry(proc_index, pde_index, pte_index);
    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  104613:	ff 74 24 28          	pushl  0x28(%esp)
  104617:	ff 74 24 28          	pushl  0x28(%esp)
    pte_index = pte_index>>PAGE_SHIFT;
  10461b:	89 c2                	mov    %eax,%edx
    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  10461d:	c1 e8 16             	shr    $0x16,%eax
    pte_index = pte_index>>PAGE_SHIFT;
  104620:	c1 ea 0c             	shr    $0xc,%edx
  104623:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  104629:	52                   	push   %edx
  10462a:	50                   	push   %eax
  10462b:	ff 74 24 2c          	pushl  0x2c(%esp)
  10462f:	e8 9c fb ff ff       	call   1041d0 <set_ptbl_entry>
}
  104634:	83 c4 28             	add    $0x28,%esp
  104637:	5b                   	pop    %ebx
  104638:	c3                   	ret    
  104639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00104640 <idptbl_init>:
  * Hint 2: You have already created the functions that deal with IDPTbl. 
  *         Calculate the appropriate permission values as mentioned above 
  *         and call set_ptbl_entry_identity from MATIntro layer.
  */
void idptbl_init(unsigned int mbi_adr)
{
  104640:	55                   	push   %ebp
  104641:	57                   	push   %edi
    // TODO: define your local variables here.
    container_init(mbi_adr);
  104642:	bf 00 ff ff ff       	mov    $0xffffff00,%edi
{
  104647:	56                   	push   %esi
  104648:	53                   	push   %ebx
  104649:	e8 c1 bc ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10464e:	81 c3 b2 79 00 00    	add    $0x79b2,%ebx
  104654:	83 ec 18             	sub    $0x18,%esp
    container_init(mbi_adr);
  104657:	ff 74 24 2c          	pushl  0x2c(%esp)
  10465b:	e8 50 f6 ff ff       	call   103cb0 <container_init>
  104660:	83 c4 10             	add    $0x10,%esp
  104663:	90                   	nop
  104664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  104668:	8d af 00 01 00 00    	lea    0x100(%edi),%ebp
    // TODO
    unsigned int i, j, addr, size = 1024, hi, lo;
    lo = VM_USERLO / 4096 / 1024;
    hi = VM_USERHI / 4096 / 1024;
    for(i = 0; i < size; i++){
      for(j = 0; j < size; j++){
  10466e:	31 f6                	xor    %esi,%esi
  104670:	eb 23                	jmp    104695 <idptbl_init+0x55>
  104672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        // addr = j*size*4096;
        // if(addr < VM_USERLO || addr >= VM_USERHI)
        if(i < lo || i >= hi)
          set_ptbl_entry_identity(i, j, PTE_P | PTE_W | PTE_G);
  104678:	83 ec 04             	sub    $0x4,%esp
  10467b:	68 03 01 00 00       	push   $0x103
  104680:	56                   	push   %esi
      for(j = 0; j < size; j++){
  104681:	83 c6 01             	add    $0x1,%esi
          set_ptbl_entry_identity(i, j, PTE_P | PTE_W | PTE_G);
  104684:	55                   	push   %ebp
  104685:	e8 86 fb ff ff       	call   104210 <set_ptbl_entry_identity>
  10468a:	83 c4 10             	add    $0x10,%esp
      for(j = 0; j < size; j++){
  10468d:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  104693:	74 22                	je     1046b7 <idptbl_init+0x77>
        if(i < lo || i >= hi)
  104695:	81 ff bf 02 00 00    	cmp    $0x2bf,%edi
  10469b:	77 db                	ja     104678 <idptbl_init+0x38>
        else
          set_ptbl_entry_identity(i, j, PTE_P | PTE_W);
  10469d:	83 ec 04             	sub    $0x4,%esp
  1046a0:	6a 03                	push   $0x3
  1046a2:	56                   	push   %esi
      for(j = 0; j < size; j++){
  1046a3:	83 c6 01             	add    $0x1,%esi
          set_ptbl_entry_identity(i, j, PTE_P | PTE_W);
  1046a6:	55                   	push   %ebp
  1046a7:	e8 64 fb ff ff       	call   104210 <set_ptbl_entry_identity>
  1046ac:	83 c4 10             	add    $0x10,%esp
      for(j = 0; j < size; j++){
  1046af:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  1046b5:	75 de                	jne    104695 <idptbl_init+0x55>
  1046b7:	83 c7 01             	add    $0x1,%edi
    for(i = 0; i < size; i++){
  1046ba:	81 ff 00 03 00 00    	cmp    $0x300,%edi
  1046c0:	75 a6                	jne    104668 <idptbl_init+0x28>
      }
    }
}
  1046c2:	83 c4 0c             	add    $0xc,%esp
  1046c5:	5b                   	pop    %ebx
  1046c6:	5e                   	pop    %esi
  1046c7:	5f                   	pop    %edi
  1046c8:	5d                   	pop    %ebp
  1046c9:	c3                   	ret    
  1046ca:	66 90                	xchg   %ax,%ax
  1046cc:	66 90                	xchg   %ax,%ax
  1046ce:	66 90                	xchg   %ax,%ax

001046d0 <MPTOp_test1>:
#include <lib/debug.h>
#include "export.h"

int MPTOp_test1()
{
  1046d0:	53                   	push   %ebx
  1046d1:	e8 39 bc ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1046d6:	81 c3 2a 79 00 00    	add    $0x792a,%ebx
  1046dc:	83 ec 10             	sub    $0x10,%esp
  unsigned int vaddr = 4096*1024*300;
  if (get_ptbl_entry_by_va(10, vaddr) != 0) {
  1046df:	68 00 00 00 4b       	push   $0x4b000000
  1046e4:	6a 0a                	push   $0xa
  1046e6:	e8 25 fe ff ff       	call   104510 <get_ptbl_entry_by_va>
  1046eb:	83 c4 10             	add    $0x10,%esp
  1046ee:	85 c0                	test   %eax,%eax
  1046f0:	0f 85 fa 00 00 00    	jne    1047f0 <MPTOp_test1+0x120>
    dprintf("test 1-a failed with value: %d.\n", get_ptbl_entry_by_va(10, vaddr));
    return 1;
  }
  if (get_pdir_entry_by_va(10, vaddr) != 0) {
  1046f6:	83 ec 08             	sub    $0x8,%esp
  1046f9:	68 00 00 00 4b       	push   $0x4b000000
  1046fe:	6a 0a                	push   $0xa
  104700:	e8 db fd ff ff       	call   1044e0 <get_pdir_entry_by_va>
  104705:	83 c4 10             	add    $0x10,%esp
  104708:	85 c0                	test   %eax,%eax
  10470a:	0f 85 c0 00 00 00    	jne    1047d0 <MPTOp_test1+0x100>
    dprintf("test 1-b failed.\n");
    return 1;
  }
  set_pdir_entry_by_va(10, vaddr, 100);
  104710:	83 ec 04             	sub    $0x4,%esp
  104713:	6a 64                	push   $0x64
  104715:	68 00 00 00 4b       	push   $0x4b000000
  10471a:	6a 0a                	push   $0xa
  10471c:	e8 af fe ff ff       	call   1045d0 <set_pdir_entry_by_va>
  set_ptbl_entry_by_va(10, vaddr, 100, 259);
  104721:	68 03 01 00 00       	push   $0x103
  104726:	6a 64                	push   $0x64
  104728:	68 00 00 00 4b       	push   $0x4b000000
  10472d:	6a 0a                	push   $0xa
  10472f:	e8 cc fe ff ff       	call   104600 <set_ptbl_entry_by_va>
  if (get_ptbl_entry_by_va(10, vaddr) == 0) {
  104734:	83 c4 18             	add    $0x18,%esp
  104737:	68 00 00 00 4b       	push   $0x4b000000
  10473c:	6a 0a                	push   $0xa
  10473e:	e8 cd fd ff ff       	call   104510 <get_ptbl_entry_by_va>
  104743:	83 c4 10             	add    $0x10,%esp
  104746:	85 c0                	test   %eax,%eax
  104748:	0f 84 d2 00 00 00    	je     104820 <MPTOp_test1+0x150>
    dprintf("test 1-c failed.\n");
    return 1;
  }
  if (get_pdir_entry_by_va(10, vaddr) == 0) {
  10474e:	83 ec 08             	sub    $0x8,%esp
  104751:	68 00 00 00 4b       	push   $0x4b000000
  104756:	6a 0a                	push   $0xa
  104758:	e8 83 fd ff ff       	call   1044e0 <get_pdir_entry_by_va>
  10475d:	83 c4 10             	add    $0x10,%esp
  104760:	85 c0                	test   %eax,%eax
  104762:	0f 84 d8 00 00 00    	je     104840 <MPTOp_test1+0x170>
    dprintf("test 1-d failed.\n");
    return 1;
  }
  rmv_ptbl_entry_by_va(10, vaddr);
  104768:	83 ec 08             	sub    $0x8,%esp
  10476b:	68 00 00 00 4b       	push   $0x4b000000
  104770:	6a 0a                	push   $0xa
  104772:	e8 19 fe ff ff       	call   104590 <rmv_ptbl_entry_by_va>
  rmv_pdir_entry_by_va(10, vaddr);
  104777:	58                   	pop    %eax
  104778:	5a                   	pop    %edx
  104779:	68 00 00 00 4b       	push   $0x4b000000
  10477e:	6a 0a                	push   $0xa
  104780:	e8 db fd ff ff       	call   104560 <rmv_pdir_entry_by_va>
  if (get_ptbl_entry_by_va(10, vaddr) != 0) {
  104785:	59                   	pop    %ecx
  104786:	58                   	pop    %eax
  104787:	68 00 00 00 4b       	push   $0x4b000000
  10478c:	6a 0a                	push   $0xa
  10478e:	e8 7d fd ff ff       	call   104510 <get_ptbl_entry_by_va>
  104793:	83 c4 10             	add    $0x10,%esp
  104796:	85 c0                	test   %eax,%eax
  104798:	0f 85 c2 00 00 00    	jne    104860 <MPTOp_test1+0x190>
    dprintf("test 1-e failed.\n");
    return 1;
  }
  if (get_pdir_entry_by_va(10, vaddr) != 0) {
  10479e:	83 ec 08             	sub    $0x8,%esp
  1047a1:	68 00 00 00 4b       	push   $0x4b000000
  1047a6:	6a 0a                	push   $0xa
  1047a8:	e8 33 fd ff ff       	call   1044e0 <get_pdir_entry_by_va>
  1047ad:	83 c4 10             	add    $0x10,%esp
  1047b0:	85 c0                	test   %eax,%eax
  1047b2:	0f 85 c8 00 00 00    	jne    104880 <MPTOp_test1+0x1b0>
    dprintf("test 1-f failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  1047b8:	8d 83 09 ac ff ff    	lea    -0x53f7(%ebx),%eax
  1047be:	83 ec 0c             	sub    $0xc,%esp
  1047c1:	50                   	push   %eax
  1047c2:	e8 3d da ff ff       	call   102204 <dprintf>
  1047c7:	83 c4 10             	add    $0x10,%esp
  return 0;
  1047ca:	31 c0                	xor    %eax,%eax
  1047cc:	eb 19                	jmp    1047e7 <MPTOp_test1+0x117>
  1047ce:	66 90                	xchg   %ax,%ax
    dprintf("test 1-b failed.\n");
  1047d0:	8d 83 fc ac ff ff    	lea    -0x5304(%ebx),%eax
  1047d6:	83 ec 0c             	sub    $0xc,%esp
  1047d9:	50                   	push   %eax
  1047da:	e8 25 da ff ff       	call   102204 <dprintf>
    return 1;
  1047df:	83 c4 10             	add    $0x10,%esp
  1047e2:	b8 01 00 00 00       	mov    $0x1,%eax
}
  1047e7:	83 c4 08             	add    $0x8,%esp
  1047ea:	5b                   	pop    %ebx
  1047eb:	c3                   	ret    
  1047ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1-a failed with value: %d.\n", get_ptbl_entry_by_va(10, vaddr));
  1047f0:	83 ec 08             	sub    $0x8,%esp
  1047f3:	68 00 00 00 4b       	push   $0x4b000000
  1047f8:	6a 0a                	push   $0xa
  1047fa:	e8 11 fd ff ff       	call   104510 <get_ptbl_entry_by_va>
  1047ff:	5a                   	pop    %edx
  104800:	59                   	pop    %ecx
  104801:	50                   	push   %eax
  104802:	8d 83 10 ae ff ff    	lea    -0x51f0(%ebx),%eax
  104808:	50                   	push   %eax
  104809:	e8 f6 d9 ff ff       	call   102204 <dprintf>
    return 1;
  10480e:	83 c4 10             	add    $0x10,%esp
  104811:	b8 01 00 00 00       	mov    $0x1,%eax
}
  104816:	83 c4 08             	add    $0x8,%esp
  104819:	5b                   	pop    %ebx
  10481a:	c3                   	ret    
  10481b:	90                   	nop
  10481c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1-c failed.\n");
  104820:	8d 83 0e ad ff ff    	lea    -0x52f2(%ebx),%eax
  104826:	83 ec 0c             	sub    $0xc,%esp
  104829:	50                   	push   %eax
  10482a:	e8 d5 d9 ff ff       	call   102204 <dprintf>
  10482f:	83 c4 10             	add    $0x10,%esp
    return 1;
  104832:	b8 01 00 00 00       	mov    $0x1,%eax
}
  104837:	83 c4 08             	add    $0x8,%esp
  10483a:	5b                   	pop    %ebx
  10483b:	c3                   	ret    
  10483c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1-d failed.\n");
  104840:	8d 83 20 ad ff ff    	lea    -0x52e0(%ebx),%eax
  104846:	83 ec 0c             	sub    $0xc,%esp
  104849:	50                   	push   %eax
  10484a:	e8 b5 d9 ff ff       	call   102204 <dprintf>
  10484f:	83 c4 10             	add    $0x10,%esp
    return 1;
  104852:	b8 01 00 00 00       	mov    $0x1,%eax
  104857:	eb 8e                	jmp    1047e7 <MPTOp_test1+0x117>
  104859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1-e failed.\n");
  104860:	8d 83 31 ae ff ff    	lea    -0x51cf(%ebx),%eax
  104866:	83 ec 0c             	sub    $0xc,%esp
  104869:	50                   	push   %eax
  10486a:	e8 95 d9 ff ff       	call   102204 <dprintf>
  10486f:	83 c4 10             	add    $0x10,%esp
    return 1;
  104872:	b8 01 00 00 00       	mov    $0x1,%eax
  104877:	e9 6b ff ff ff       	jmp    1047e7 <MPTOp_test1+0x117>
  10487c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1-f failed.\n");
  104880:	8d 83 43 ae ff ff    	lea    -0x51bd(%ebx),%eax
  104886:	83 ec 0c             	sub    $0xc,%esp
  104889:	50                   	push   %eax
  10488a:	e8 75 d9 ff ff       	call   102204 <dprintf>
  10488f:	83 c4 10             	add    $0x10,%esp
    return 1;
  104892:	b8 01 00 00 00       	mov    $0x1,%eax
  104897:	e9 4b ff ff ff       	jmp    1047e7 <MPTOp_test1+0x117>
  10489c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001048a0 <MPTOp_test_own>:
{
  // TODO (optional)
  // idptbl_init(1000);
  // dprintf("own test passed.\n");
  return 0;
}
  1048a0:	31 c0                	xor    %eax,%eax
  1048a2:	c3                   	ret    
  1048a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1048a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001048b0 <test_MPTOp>:

int test_MPTOp()
{
  return MPTOp_test1() + MPTOp_test_own();
  1048b0:	e9 1b fe ff ff       	jmp    1046d0 <MPTOp_test1>
  1048b5:	66 90                	xchg   %ax,%ax
  1048b7:	66 90                	xchg   %ax,%ax
  1048b9:	66 90                	xchg   %ax,%ax
  1048bb:	66 90                	xchg   %ax,%ax
  1048bd:	66 90                	xchg   %ax,%ax
  1048bf:	90                   	nop

001048c0 <pdir_init>:
  * Hint 1: Recall which portions are reserved for the kernel and calculate the pde_index.       
  * Hint 2: Recall which function in MPTIntro layer is used to set identity map. (See import.h) 
  * Hint 3: Remove the page directory entry to unmap it.
  */
void pdir_init(unsigned int mbi_adr)
{
  1048c0:	57                   	push   %edi
  1048c1:	56                   	push   %esi
    idptbl_init(mbi_adr);

    // // // TODO
    lo = VM_USERLO / 4096 / 1024;
    hi = VM_USERHI / 4096 / 1024;
    for(i = 0; i < NUM_IDS; i++){
  1048c2:	31 ff                	xor    %edi,%edi
{
  1048c4:	53                   	push   %ebx
  1048c5:	e8 45 ba ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1048ca:	81 c3 36 77 00 00    	add    $0x7736,%ebx
    idptbl_init(mbi_adr);
  1048d0:	83 ec 0c             	sub    $0xc,%esp
  1048d3:	ff 74 24 1c          	pushl  0x1c(%esp)
  1048d7:	e8 64 fd ff ff       	call   104640 <idptbl_init>
  1048dc:	83 c4 10             	add    $0x10,%esp
  1048df:	90                   	nop
      for(j = 0; j < size; j++){
  1048e0:	31 f6                	xor    %esi,%esi
  1048e2:	eb 1c                	jmp    104900 <pdir_init+0x40>
  1048e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if(j < lo || j >= hi)
          set_pdir_entry_identity(i,j);
  1048e8:	83 ec 08             	sub    $0x8,%esp
  1048eb:	56                   	push   %esi
  1048ec:	57                   	push   %edi
      for(j = 0; j < size; j++){
  1048ed:	83 c6 01             	add    $0x1,%esi
          set_pdir_entry_identity(i,j);
  1048f0:	e8 4b f8 ff ff       	call   104140 <set_pdir_entry_identity>
  1048f5:	83 c4 10             	add    $0x10,%esp
      for(j = 0; j < size; j++){
  1048f8:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  1048fe:	74 25                	je     104925 <pdir_init+0x65>
        if(j < lo || j >= hi)
  104900:	8d 86 00 ff ff ff    	lea    -0x100(%esi),%eax
  104906:	3d bf 02 00 00       	cmp    $0x2bf,%eax
  10490b:	77 db                	ja     1048e8 <pdir_init+0x28>
        else
          rmv_pdir_entry(i,j);
  10490d:	83 ec 08             	sub    $0x8,%esp
  104910:	56                   	push   %esi
  104911:	57                   	push   %edi
      for(j = 0; j < size; j++){
  104912:	83 c6 01             	add    $0x1,%esi
          rmv_pdir_entry(i,j);
  104915:	e8 56 f8 ff ff       	call   104170 <rmv_pdir_entry>
  10491a:	83 c4 10             	add    $0x10,%esp
      for(j = 0; j < size; j++){
  10491d:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  104923:	75 db                	jne    104900 <pdir_init+0x40>
    for(i = 0; i < NUM_IDS; i++){
  104925:	83 c7 01             	add    $0x1,%edi
  104928:	83 ff 40             	cmp    $0x40,%edi
  10492b:	75 b3                	jne    1048e0 <pdir_init+0x20>
      }
    }
}
  10492d:	5b                   	pop    %ebx
  10492e:	5e                   	pop    %esi
  10492f:	5f                   	pop    %edi
  104930:	c3                   	ret    
  104931:	eb 0d                	jmp    104940 <alloc_ptbl>
  104933:	90                   	nop
  104934:	90                   	nop
  104935:	90                   	nop
  104936:	90                   	nop
  104937:	90                   	nop
  104938:	90                   	nop
  104939:	90                   	nop
  10493a:	90                   	nop
  10493b:	90                   	nop
  10493c:	90                   	nop
  10493d:	90                   	nop
  10493e:	90                   	nop
  10493f:	90                   	nop

00104940 <alloc_ptbl>:
  * * 3. Clear (set to 0) all the page table entries for this newly mapped page table.
  * * 4. Return the page index of the newly allocated physical page.
  * 	 In the case when there's no physical page available, it returns 0.
  */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vadr)
{
  104940:	55                   	push   %ebp
  104941:	57                   	push   %edi
  104942:	56                   	push   %esi
  104943:	53                   	push   %ebx
  104944:	e8 c6 b9 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104949:	81 c3 b7 76 00 00    	add    $0x76b7,%ebx
  10494f:	83 ec 28             	sub    $0x28,%esp
  104952:	8b 74 24 3c          	mov    0x3c(%esp),%esi
  // TODO
  unsigned int addr, pde_index, i, size = 1024;
  addr = container_alloc(proc_index);
  104956:	56                   	push   %esi
  104957:	e8 34 f5 ff ff       	call   103e90 <container_alloc>
  10495c:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  pde_index = (vadr & DIR_MASK)>>DIR_SHIFT;
  if(addr > 0){
  104960:	83 c4 10             	add    $0x10,%esp
  104963:	85 c0                	test   %eax,%eax
  104965:	75 11                	jne    104978 <alloc_ptbl+0x38>
    }
    return addr;
  }

  return 0;
}
  104967:	8b 44 24 0c          	mov    0xc(%esp),%eax
  10496b:	83 c4 1c             	add    $0x1c,%esp
  10496e:	5b                   	pop    %ebx
  10496f:	5e                   	pop    %esi
  104970:	5f                   	pop    %edi
  104971:	5d                   	pop    %ebp
  104972:	c3                   	ret    
  104973:	90                   	nop
  104974:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    set_pdir_entry_by_va(proc_index, vadr, addr);
  104978:	83 ec 04             	sub    $0x4,%esp
    for(i = 0; i < size; i++){
  10497b:	31 ed                	xor    %ebp,%ebp
    set_pdir_entry_by_va(proc_index, vadr, addr);
  10497d:	ff 74 24 10          	pushl  0x10(%esp)
  104981:	ff 74 24 3c          	pushl  0x3c(%esp)
  104985:	56                   	push   %esi
  104986:	e8 45 fc ff ff       	call   1045d0 <set_pdir_entry_by_va>
  pde_index = (vadr & DIR_MASK)>>DIR_SHIFT;
  10498b:	8b 7c 24 44          	mov    0x44(%esp),%edi
  10498f:	83 c4 10             	add    $0x10,%esp
  104992:	c1 ef 16             	shr    $0x16,%edi
  104995:	8d 76 00             	lea    0x0(%esi),%esi
      rmv_ptbl_entry(proc_index, pde_index, i);
  104998:	83 ec 04             	sub    $0x4,%esp
  10499b:	55                   	push   %ebp
  10499c:	57                   	push   %edi
    for(i = 0; i < size; i++){
  10499d:	83 c5 01             	add    $0x1,%ebp
      rmv_ptbl_entry(proc_index, pde_index, i);
  1049a0:	56                   	push   %esi
  1049a1:	e8 9a f8 ff ff       	call   104240 <rmv_ptbl_entry>
    for(i = 0; i < size; i++){
  1049a6:	83 c4 10             	add    $0x10,%esp
  1049a9:	81 fd 00 04 00 00    	cmp    $0x400,%ebp
  1049af:	75 e7                	jne    104998 <alloc_ptbl+0x58>
}
  1049b1:	8b 44 24 0c          	mov    0xc(%esp),%eax
  1049b5:	83 c4 1c             	add    $0x1c,%esp
  1049b8:	5b                   	pop    %ebx
  1049b9:	5e                   	pop    %esi
  1049ba:	5f                   	pop    %edi
  1049bb:	5d                   	pop    %ebp
  1049bc:	c3                   	ret    
  1049bd:	8d 76 00             	lea    0x0(%esi),%esi

001049c0 <free_ptbl>:
  * Hint 1: Find the pde corresponding to vadr (MPTOp layer)
  * Hint 2: Remove the pde (MPTOp layer)
  * Hint 3: Use container free
  */
void free_ptbl(unsigned int proc_index, unsigned int vadr)
{
  1049c0:	55                   	push   %ebp
  1049c1:	57                   	push   %edi
  1049c2:	56                   	push   %esi
  1049c3:	53                   	push   %ebx
  1049c4:	e8 46 b9 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1049c9:	81 c3 37 76 00 00    	add    $0x7637,%ebx
  1049cf:	83 ec 14             	sub    $0x14,%esp
  1049d2:	8b 74 24 28          	mov    0x28(%esp),%esi
  1049d6:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  // TODO
  unsigned int addr, i, pde;
  pde = get_pdir_entry_by_va(proc_index, vadr);
  1049da:	57                   	push   %edi
  1049db:	56                   	push   %esi
  1049dc:	e8 ff fa ff ff       	call   1044e0 <get_pdir_entry_by_va>
  1049e1:	89 c5                	mov    %eax,%ebp
  rmv_pdir_entry_by_va(proc_index, vadr);
  1049e3:	58                   	pop    %eax
  1049e4:	5a                   	pop    %edx
  1049e5:	57                   	push   %edi
  1049e6:	56                   	push   %esi
  addr = pde & DIR_MASK;
  1049e7:	81 e5 00 00 c0 ff    	and    $0xffc00000,%ebp
  rmv_pdir_entry_by_va(proc_index, vadr);
  1049ed:	e8 6e fb ff ff       	call   104560 <rmv_pdir_entry_by_va>
  container_free(proc_index, addr);
  1049f2:	59                   	pop    %ecx
  1049f3:	5f                   	pop    %edi
  1049f4:	55                   	push   %ebp
  1049f5:	56                   	push   %esi
  1049f6:	e8 d5 f4 ff ff       	call   103ed0 <container_free>
  1049fb:	83 c4 1c             	add    $0x1c,%esp
  1049fe:	5b                   	pop    %ebx
  1049ff:	5e                   	pop    %esi
  104a00:	5f                   	pop    %edi
  104a01:	5d                   	pop    %ebp
  104a02:	c3                   	ret    
  104a03:	66 90                	xchg   %ax,%ax
  104a05:	66 90                	xchg   %ax,%ax
  104a07:	66 90                	xchg   %ax,%ax
  104a09:	66 90                	xchg   %ax,%ax
  104a0b:	66 90                	xchg   %ax,%ax
  104a0d:	66 90                	xchg   %ax,%ax
  104a0f:	90                   	nop

00104a10 <MPTComm_test1>:
#include <pmm/MContainer/export.h>
#include <vmm/MPTOp/export.h>
#include "export.h"

int MPTComm_test1()
{
  104a10:	57                   	push   %edi
  104a11:	56                   	push   %esi
  104a12:	be 00 ff ff ff       	mov    $0xffffff00,%esi
  104a17:	53                   	push   %ebx
  104a18:	e8 f2 b8 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104a1d:	81 c3 e3 75 00 00    	add    $0x75e3,%ebx
  104a23:	90                   	nop
  104a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int i;
  for (i = 0; i < 1024; i ++) {
    if (i < 256 || i >= 960) {
  104a28:	81 fe bf 02 00 00    	cmp    $0x2bf,%esi
  104a2e:	77 23                	ja     104a53 <MPTComm_test1+0x43>
  104a30:	83 c6 01             	add    $0x1,%esi
  for (i = 0; i < 1024; i ++) {
  104a33:	81 fe 00 03 00 00    	cmp    $0x300,%esi
  104a39:	75 ed                	jne    104a28 <MPTComm_test1+0x18>
        // val = get_ptbl_entry_by_va(10, addr);
        // dprintf("i = %d, val = %u, addr = %u, addr+p = %u\n", i, val, addr, addr+259);
      }
    }
  }
  dprintf("test 1 passed.\n");
  104a3b:	8d 83 09 ac ff ff    	lea    -0x53f7(%ebx),%eax
  104a41:	83 ec 0c             	sub    $0xc,%esp
  104a44:	50                   	push   %eax
  104a45:	e8 ba d7 ff ff       	call   102204 <dprintf>
  return 0;
  104a4a:	83 c4 10             	add    $0x10,%esp
  104a4d:	31 c0                	xor    %eax,%eax
}
  104a4f:	5b                   	pop    %ebx
  104a50:	5e                   	pop    %esi
  104a51:	5f                   	pop    %edi
  104a52:	c3                   	ret    
  104a53:	8d be 00 01 00 00    	lea    0x100(%esi),%edi
      if (get_ptbl_entry_by_va(10, i * 4096 * 1024) != i * 4096 * 1024 + 259) {
  104a59:	50                   	push   %eax
  104a5a:	50                   	push   %eax
  104a5b:	c1 e7 16             	shl    $0x16,%edi
  104a5e:	57                   	push   %edi
  104a5f:	6a 0a                	push   $0xa
  104a61:	81 c7 03 01 00 00    	add    $0x103,%edi
  104a67:	e8 a4 fa ff ff       	call   104510 <get_ptbl_entry_by_va>
  104a6c:	83 c4 10             	add    $0x10,%esp
  104a6f:	39 f8                	cmp    %edi,%eax
  104a71:	74 bd                	je     104a30 <MPTComm_test1+0x20>
        dprintf("test 1 failed.\n");
  104a73:	8d 83 f9 ab ff ff    	lea    -0x5407(%ebx),%eax
  104a79:	83 ec 0c             	sub    $0xc,%esp
  104a7c:	50                   	push   %eax
  104a7d:	e8 82 d7 ff ff       	call   102204 <dprintf>
        return 1;
  104a82:	83 c4 10             	add    $0x10,%esp
  104a85:	b8 01 00 00 00       	mov    $0x1,%eax
  104a8a:	eb c3                	jmp    104a4f <MPTComm_test1+0x3f>
  104a8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104a90 <MPTComm_test2>:

int MPTComm_test2()
{
  104a90:	53                   	push   %ebx
  104a91:	e8 79 b8 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104a96:	81 c3 6a 75 00 00    	add    $0x756a,%ebx
  104a9c:	83 ec 10             	sub    $0x10,%esp
  unsigned int vaddr = 300 * 4096 * 1024;
  container_split(0, 100);
  104a9f:	6a 64                	push   $0x64
  104aa1:	6a 00                	push   $0x0
  104aa3:	e8 88 f3 ff ff       	call   103e30 <container_split>
  alloc_ptbl(1, vaddr);
  104aa8:	59                   	pop    %ecx
  104aa9:	58                   	pop    %eax
  104aaa:	68 00 00 00 4b       	push   $0x4b000000
  104aaf:	6a 01                	push   $0x1
  104ab1:	e8 8a fe ff ff       	call   104940 <alloc_ptbl>
  if (get_pdir_entry_by_va(1, vaddr) == 0) {
  104ab6:	58                   	pop    %eax
  104ab7:	5a                   	pop    %edx
  104ab8:	68 00 00 00 4b       	push   $0x4b000000
  104abd:	6a 01                	push   $0x1
  104abf:	e8 1c fa ff ff       	call   1044e0 <get_pdir_entry_by_va>
  104ac4:	83 c4 10             	add    $0x10,%esp
  104ac7:	85 c0                	test   %eax,%eax
  104ac9:	74 75                	je     104b40 <MPTComm_test2+0xb0>
    dprintf("test 2a failed.\n");
    return 1;
  }
  if(get_ptbl_entry_by_va(1, vaddr) != 0) {
  104acb:	83 ec 08             	sub    $0x8,%esp
  104ace:	68 00 00 00 4b       	push   $0x4b000000
  104ad3:	6a 01                	push   $0x1
  104ad5:	e8 36 fa ff ff       	call   104510 <get_ptbl_entry_by_va>
  104ada:	83 c4 10             	add    $0x10,%esp
  104add:	85 c0                	test   %eax,%eax
  104adf:	75 3f                	jne    104b20 <MPTComm_test2+0x90>
    dprintf("test 2b failed.\n");
    return 1;
  }
  free_ptbl(1, vaddr);
  104ae1:	83 ec 08             	sub    $0x8,%esp
  104ae4:	68 00 00 00 4b       	push   $0x4b000000
  104ae9:	6a 01                	push   $0x1
  104aeb:	e8 d0 fe ff ff       	call   1049c0 <free_ptbl>
  if (get_pdir_entry_by_va(1, vaddr) != 0) {
  104af0:	58                   	pop    %eax
  104af1:	5a                   	pop    %edx
  104af2:	68 00 00 00 4b       	push   $0x4b000000
  104af7:	6a 01                	push   $0x1
  104af9:	e8 e2 f9 ff ff       	call   1044e0 <get_pdir_entry_by_va>
  104afe:	83 c4 10             	add    $0x10,%esp
  104b01:	85 c0                	test   %eax,%eax
  104b03:	75 5b                	jne    104b60 <MPTComm_test2+0xd0>
    dprintf("test 2c failed.\n");
    return 1;
  }
  dprintf("test 2 passed.\n");
  104b05:	8d 83 29 ac ff ff    	lea    -0x53d7(%ebx),%eax
  104b0b:	83 ec 0c             	sub    $0xc,%esp
  104b0e:	50                   	push   %eax
  104b0f:	e8 f0 d6 ff ff       	call   102204 <dprintf>
  104b14:	83 c4 10             	add    $0x10,%esp
  return 0;
  104b17:	31 c0                	xor    %eax,%eax
}
  104b19:	83 c4 08             	add    $0x8,%esp
  104b1c:	5b                   	pop    %ebx
  104b1d:	c3                   	ret    
  104b1e:	66 90                	xchg   %ax,%ax
    dprintf("test 2b failed.\n");
  104b20:	8d 83 66 ae ff ff    	lea    -0x519a(%ebx),%eax
  104b26:	83 ec 0c             	sub    $0xc,%esp
  104b29:	50                   	push   %eax
  104b2a:	e8 d5 d6 ff ff       	call   102204 <dprintf>
    return 1;
  104b2f:	83 c4 10             	add    $0x10,%esp
  104b32:	b8 01 00 00 00       	mov    $0x1,%eax
}
  104b37:	83 c4 08             	add    $0x8,%esp
  104b3a:	5b                   	pop    %ebx
  104b3b:	c3                   	ret    
  104b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 2a failed.\n");
  104b40:	8d 83 55 ae ff ff    	lea    -0x51ab(%ebx),%eax
  104b46:	83 ec 0c             	sub    $0xc,%esp
  104b49:	50                   	push   %eax
  104b4a:	e8 b5 d6 ff ff       	call   102204 <dprintf>
    return 1;
  104b4f:	83 c4 10             	add    $0x10,%esp
  104b52:	b8 01 00 00 00       	mov    $0x1,%eax
}
  104b57:	83 c4 08             	add    $0x8,%esp
  104b5a:	5b                   	pop    %ebx
  104b5b:	c3                   	ret    
  104b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 2c failed.\n");
  104b60:	8d 83 77 ae ff ff    	lea    -0x5189(%ebx),%eax
  104b66:	83 ec 0c             	sub    $0xc,%esp
  104b69:	50                   	push   %eax
  104b6a:	e8 95 d6 ff ff       	call   102204 <dprintf>
  104b6f:	83 c4 10             	add    $0x10,%esp
    return 1;
  104b72:	b8 01 00 00 00       	mov    $0x1,%eax
}
  104b77:	83 c4 08             	add    $0x8,%esp
  104b7a:	5b                   	pop    %ebx
  104b7b:	c3                   	ret    
  104b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104b80 <MPTComm_test_own>:
int MPTComm_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  104b80:	31 c0                	xor    %eax,%eax
  104b82:	c3                   	ret    
  104b83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104b90 <test_MPTComm>:

int test_MPTComm()
{
  104b90:	53                   	push   %ebx
  104b91:	83 ec 08             	sub    $0x8,%esp
  return MPTComm_test1() + MPTComm_test2() + MPTComm_test_own();
  104b94:	e8 77 fe ff ff       	call   104a10 <MPTComm_test1>
  104b99:	89 c3                	mov    %eax,%ebx
  104b9b:	e8 f0 fe ff ff       	call   104a90 <MPTComm_test2>
}
  104ba0:	83 c4 08             	add    $0x8,%esp
  return MPTComm_test1() + MPTComm_test2() + MPTComm_test_own();
  104ba3:	01 d8                	add    %ebx,%eax
}
  104ba5:	5b                   	pop    %ebx
  104ba6:	c3                   	ret    
  104ba7:	66 90                	xchg   %ax,%ax
  104ba9:	66 90                	xchg   %ax,%ax
  104bab:	66 90                	xchg   %ax,%ax
  104bad:	66 90                	xchg   %ax,%ax
  104baf:	90                   	nop

00104bb0 <pdir_init_kern>:
  *  
  * Hint 1: Note that part of the task is already completed by pdir_init.
  * Hint 2: Here just set the remaining portion of process 0's page directory entry as identity map.
  */
void pdir_init_kern(unsigned int mbi_adr)
{
  104bb0:	56                   	push   %esi
  104bb1:	53                   	push   %ebx
    pdir_init(mbi_adr);
    
    //TODO
    lo = VM_USERLO / 4096 / 1024;
    hi = VM_USERHI / 4096 / 1024;
    for(i = lo; i < hi; i++){
  104bb2:	be 00 01 00 00       	mov    $0x100,%esi
  104bb7:	e8 53 b7 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104bbc:	81 c3 44 74 00 00    	add    $0x7444,%ebx
{
  104bc2:	83 ec 10             	sub    $0x10,%esp
    pdir_init(mbi_adr);
  104bc5:	ff 74 24 1c          	pushl  0x1c(%esp)
  104bc9:	e8 f2 fc ff ff       	call   1048c0 <pdir_init>
  104bce:	83 c4 10             	add    $0x10,%esp
  104bd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      set_pdir_entry_identity(0,i);
  104bd8:	83 ec 08             	sub    $0x8,%esp
  104bdb:	56                   	push   %esi
  104bdc:	6a 00                	push   $0x0
    for(i = lo; i < hi; i++){
  104bde:	83 c6 01             	add    $0x1,%esi
      set_pdir_entry_identity(0,i);
  104be1:	e8 5a f5 ff ff       	call   104140 <set_pdir_entry_identity>
    for(i = lo; i < hi; i++){
  104be6:	83 c4 10             	add    $0x10,%esp
  104be9:	81 fe c0 03 00 00    	cmp    $0x3c0,%esi
  104bef:	75 e7                	jne    104bd8 <pdir_init_kern+0x28>
    }
}
  104bf1:	83 c4 04             	add    $0x4,%esp
  104bf4:	5b                   	pop    %ebx
  104bf5:	5e                   	pop    %esi
  104bf6:	c3                   	ret    
  104bf7:	89 f6                	mov    %esi,%esi
  104bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104c00 <map_page>:
  *         - If there is an error during allocation, return MagicNumber.
  * Hint 3: If you have a valid pde, set the page table entry to new physical page (page_index) and perm.
  * Hint 4: Return the pde index or MagicNumber.
  */
unsigned int map_page(unsigned int proc_index, unsigned int vadr, unsigned int page_index, unsigned int perm)
{   
  104c00:	55                   	push   %ebp
  104c01:	57                   	push   %edi
  104c02:	56                   	push   %esi
  104c03:	53                   	push   %ebx
  104c04:	e8 06 b7 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104c09:	81 c3 f7 73 00 00    	add    $0x73f7,%ebx
  104c0f:	83 ec 14             	sub    $0x14,%esp
  104c12:	8b 74 24 28          	mov    0x28(%esp),%esi
  104c16:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  // TODO
  unsigned int pde_index=0, pde=0, addr=0;
  pde = get_pdir_entry_by_va(proc_index, vadr);
  104c1a:	57                   	push   %edi
  104c1b:	56                   	push   %esi
  104c1c:	e8 bf f8 ff ff       	call   1044e0 <get_pdir_entry_by_va>
  if(pde > 0){
  104c21:	83 c4 10             	add    $0x10,%esp
  104c24:	85 c0                	test   %eax,%eax
  104c26:	74 28                	je     104c50 <map_page+0x50>
    pde_index = pde>>12;
  104c28:	c1 e8 0c             	shr    $0xc,%eax
  104c2b:	89 c5                	mov    %eax,%ebp
    addr = alloc_ptbl(proc_index, vadr);
    if(addr == 0){
      return MagicNumber;
    }
  }
  set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
  104c2d:	ff 74 24 2c          	pushl  0x2c(%esp)
  104c31:	ff 74 24 2c          	pushl  0x2c(%esp)
  104c35:	57                   	push   %edi
  104c36:	56                   	push   %esi
  104c37:	e8 c4 f9 ff ff       	call   104600 <set_ptbl_entry_by_va>
  104c3c:	83 c4 10             	add    $0x10,%esp
  // dprintf("\npde, pde_index, addr = %u, %u, %u\n", pde, pde_index, addr);
  if(addr != 0)
    return addr;
  else
    return pde_index;
}
  104c3f:	89 e8                	mov    %ebp,%eax
  104c41:	83 c4 0c             	add    $0xc,%esp
  104c44:	5b                   	pop    %ebx
  104c45:	5e                   	pop    %esi
  104c46:	5f                   	pop    %edi
  104c47:	5d                   	pop    %ebp
  104c48:	c3                   	ret    
  104c49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    addr = alloc_ptbl(proc_index, vadr);
  104c50:	83 ec 08             	sub    $0x8,%esp
  104c53:	57                   	push   %edi
  104c54:	56                   	push   %esi
  104c55:	e8 e6 fc ff ff       	call   104940 <alloc_ptbl>
    if(addr == 0){
  104c5a:	83 c4 10             	add    $0x10,%esp
  104c5d:	85 c0                	test   %eax,%eax
    addr = alloc_ptbl(proc_index, vadr);
  104c5f:	89 c5                	mov    %eax,%ebp
    if(addr == 0){
  104c61:	75 ca                	jne    104c2d <map_page+0x2d>
}
  104c63:	83 c4 0c             	add    $0xc,%esp
      return MagicNumber;
  104c66:	bd 01 00 10 00       	mov    $0x100001,%ebp
}
  104c6b:	5b                   	pop    %ebx
  104c6c:	89 e8                	mov    %ebp,%eax
  104c6e:	5e                   	pop    %esi
  104c6f:	5f                   	pop    %edi
  104c70:	5d                   	pop    %ebp
  104c71:	c3                   	ret    
  104c72:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  104c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104c80 <unmap_page>:
  *         - Nothing should be done if the mapping no longer exists.
  * Hint 2: If pte is valid, remove page table entry for vadr.
  * Hint 3: Return the corresponding page table entry.
  */
unsigned int unmap_page(unsigned int proc_index, unsigned int vadr)
{
  104c80:	57                   	push   %edi
  104c81:	56                   	push   %esi
  104c82:	53                   	push   %ebx
  104c83:	e8 87 b6 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104c88:	81 c3 78 73 00 00    	add    $0x7378,%ebx
  104c8e:	83 ec 18             	sub    $0x18,%esp
  104c91:	8b 74 24 28          	mov    0x28(%esp),%esi
  104c95:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  // TODO
  unsigned int pte=0;
  pte = get_ptbl_entry_by_va(proc_index, vadr);
  104c99:	57                   	push   %edi
  104c9a:	56                   	push   %esi
  104c9b:	e8 70 f8 ff ff       	call   104510 <get_ptbl_entry_by_va>
  // dprintf("pte = %u\n", pte);
  if(pte != 0){
  104ca0:	83 c4 10             	add    $0x10,%esp
  104ca3:	85 c0                	test   %eax,%eax
  104ca5:	74 15                	je     104cbc <unmap_page+0x3c>
  104ca7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    rmv_ptbl_entry_by_va(proc_index, vadr);
  104cab:	83 ec 08             	sub    $0x8,%esp
  104cae:	57                   	push   %edi
  104caf:	56                   	push   %esi
  104cb0:	e8 db f8 ff ff       	call   104590 <rmv_ptbl_entry_by_va>
  104cb5:	83 c4 10             	add    $0x10,%esp
  104cb8:	8b 44 24 0c          	mov    0xc(%esp),%eax
  }

  return pte;
}   
  104cbc:	83 c4 10             	add    $0x10,%esp
  104cbf:	5b                   	pop    %ebx
  104cc0:	5e                   	pop    %esi
  104cc1:	5f                   	pop    %edi
  104cc2:	c3                   	ret    
  104cc3:	66 90                	xchg   %ax,%ax
  104cc5:	66 90                	xchg   %ax,%ax
  104cc7:	66 90                	xchg   %ax,%ax
  104cc9:	66 90                	xchg   %ax,%ax
  104ccb:	66 90                	xchg   %ax,%ax
  104ccd:	66 90                	xchg   %ax,%ax
  104ccf:	90                   	nop

00104cd0 <MPTKern_test1>:
#include <pmm/MContainer/export.h>
#include <vmm/MPTOp/export.h>
#include "export.h"

int MPTKern_test1()
{
  104cd0:	53                   	push   %ebx
  104cd1:	e8 39 b6 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104cd6:	81 c3 2a 73 00 00    	add    $0x732a,%ebx
  104cdc:	83 ec 10             	sub    $0x10,%esp
  unsigned int vaddr = 4096*1024*300;
  container_split(0, 100);
  104cdf:	6a 64                	push   $0x64
  104ce1:	6a 00                	push   $0x0
  104ce3:	e8 48 f1 ff ff       	call   103e30 <container_split>
  if (get_ptbl_entry_by_va(1, vaddr) != 0) {
  104ce8:	58                   	pop    %eax
  104ce9:	5a                   	pop    %edx
  104cea:	68 00 00 00 4b       	push   $0x4b000000
  104cef:	6a 01                	push   $0x1
  104cf1:	e8 1a f8 ff ff       	call   104510 <get_ptbl_entry_by_va>
  104cf6:	83 c4 10             	add    $0x10,%esp
  104cf9:	85 c0                	test   %eax,%eax
  104cfb:	0f 85 bf 00 00 00    	jne    104dc0 <MPTKern_test1+0xf0>
    dprintf("test 1a failed.\n");
    return 1;
  }
  if (get_pdir_entry_by_va(1, vaddr) != 0) {
  104d01:	83 ec 08             	sub    $0x8,%esp
  104d04:	68 00 00 00 4b       	push   $0x4b000000
  104d09:	6a 01                	push   $0x1
  104d0b:	e8 d0 f7 ff ff       	call   1044e0 <get_pdir_entry_by_va>
  104d10:	83 c4 10             	add    $0x10,%esp
  104d13:	85 c0                	test   %eax,%eax
  104d15:	0f 85 85 00 00 00    	jne    104da0 <MPTKern_test1+0xd0>
    dprintf("test 1b failed.\n");
    return 1;
  }
  map_page(1, vaddr, 100, 7);
  104d1b:	6a 07                	push   $0x7
  104d1d:	6a 64                	push   $0x64
  104d1f:	68 00 00 00 4b       	push   $0x4b000000
  104d24:	6a 01                	push   $0x1
  104d26:	e8 d5 fe ff ff       	call   104c00 <map_page>
  if (get_ptbl_entry_by_va(1, vaddr) == 0) {
  104d2b:	59                   	pop    %ecx
  104d2c:	58                   	pop    %eax
  104d2d:	68 00 00 00 4b       	push   $0x4b000000
  104d32:	6a 01                	push   $0x1
  104d34:	e8 d7 f7 ff ff       	call   104510 <get_ptbl_entry_by_va>
  104d39:	83 c4 10             	add    $0x10,%esp
  104d3c:	85 c0                	test   %eax,%eax
  104d3e:	0f 84 9c 00 00 00    	je     104de0 <MPTKern_test1+0x110>
    dprintf("%u\n", get_ptbl_entry_by_va(1, vaddr));
    dprintf("test 1c failed.\n");
    return 1;
  }
  if (get_pdir_entry_by_va(1, vaddr) == 0) {
  104d44:	83 ec 08             	sub    $0x8,%esp
  104d47:	68 00 00 00 4b       	push   $0x4b000000
  104d4c:	6a 01                	push   $0x1
  104d4e:	e8 8d f7 ff ff       	call   1044e0 <get_pdir_entry_by_va>
  104d53:	83 c4 10             	add    $0x10,%esp
  104d56:	85 c0                	test   %eax,%eax
  104d58:	0f 84 c2 00 00 00    	je     104e20 <MPTKern_test1+0x150>
    dprintf("test 1d failed.\n");
    return 1;
  }
  unmap_page(1, vaddr);
  104d5e:	83 ec 08             	sub    $0x8,%esp
  104d61:	68 00 00 00 4b       	push   $0x4b000000
  104d66:	6a 01                	push   $0x1
  104d68:	e8 13 ff ff ff       	call   104c80 <unmap_page>
  if (get_ptbl_entry_by_va(1, vaddr) != 0) {
  104d6d:	58                   	pop    %eax
  104d6e:	5a                   	pop    %edx
  104d6f:	68 00 00 00 4b       	push   $0x4b000000
  104d74:	6a 01                	push   $0x1
  104d76:	e8 95 f7 ff ff       	call   104510 <get_ptbl_entry_by_va>
  104d7b:	83 c4 10             	add    $0x10,%esp
  104d7e:	85 c0                	test   %eax,%eax
  104d80:	0f 85 ba 00 00 00    	jne    104e40 <MPTKern_test1+0x170>
    dprintf("test 1e failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  104d86:	8d 83 09 ac ff ff    	lea    -0x53f7(%ebx),%eax
  104d8c:	83 ec 0c             	sub    $0xc,%esp
  104d8f:	50                   	push   %eax
  104d90:	e8 6f d4 ff ff       	call   102204 <dprintf>
  104d95:	83 c4 10             	add    $0x10,%esp
  return 0;
  104d98:	31 c0                	xor    %eax,%eax
  104d9a:	eb 1b                	jmp    104db7 <MPTKern_test1+0xe7>
  104d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1b failed.\n");
  104da0:	8d 83 9e ad ff ff    	lea    -0x5262(%ebx),%eax
  104da6:	83 ec 0c             	sub    $0xc,%esp
  104da9:	50                   	push   %eax
  104daa:	e8 55 d4 ff ff       	call   102204 <dprintf>
    return 1;
  104daf:	83 c4 10             	add    $0x10,%esp
  104db2:	b8 01 00 00 00       	mov    $0x1,%eax
}
  104db7:	83 c4 08             	add    $0x8,%esp
  104dba:	5b                   	pop    %ebx
  104dbb:	c3                   	ret    
  104dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1a failed.\n");
  104dc0:	8d 83 8d ad ff ff    	lea    -0x5273(%ebx),%eax
  104dc6:	83 ec 0c             	sub    $0xc,%esp
  104dc9:	50                   	push   %eax
  104dca:	e8 35 d4 ff ff       	call   102204 <dprintf>
    return 1;
  104dcf:	83 c4 10             	add    $0x10,%esp
  104dd2:	b8 01 00 00 00       	mov    $0x1,%eax
}
  104dd7:	83 c4 08             	add    $0x8,%esp
  104dda:	5b                   	pop    %ebx
  104ddb:	c3                   	ret    
  104ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("%u\n", get_ptbl_entry_by_va(1, vaddr));
  104de0:	83 ec 08             	sub    $0x8,%esp
  104de3:	68 00 00 00 4b       	push   $0x4b000000
  104de8:	6a 01                	push   $0x1
  104dea:	e8 21 f7 ff ff       	call   104510 <get_ptbl_entry_by_va>
  104def:	59                   	pop    %ecx
  104df0:	5a                   	pop    %edx
  104df1:	50                   	push   %eax
  104df2:	8d 83 88 ae ff ff    	lea    -0x5178(%ebx),%eax
  104df8:	50                   	push   %eax
  104df9:	e8 06 d4 ff ff       	call   102204 <dprintf>
    dprintf("test 1c failed.\n");
  104dfe:	8d 83 af ad ff ff    	lea    -0x5251(%ebx),%eax
  104e04:	89 04 24             	mov    %eax,(%esp)
  104e07:	e8 f8 d3 ff ff       	call   102204 <dprintf>
  104e0c:	83 c4 10             	add    $0x10,%esp
    return 1;
  104e0f:	b8 01 00 00 00       	mov    $0x1,%eax
}
  104e14:	83 c4 08             	add    $0x8,%esp
  104e17:	5b                   	pop    %ebx
  104e18:	c3                   	ret    
  104e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1d failed.\n");
  104e20:	8d 83 c0 ad ff ff    	lea    -0x5240(%ebx),%eax
  104e26:	83 ec 0c             	sub    $0xc,%esp
  104e29:	50                   	push   %eax
  104e2a:	e8 d5 d3 ff ff       	call   102204 <dprintf>
  104e2f:	83 c4 10             	add    $0x10,%esp
    return 1;
  104e32:	b8 01 00 00 00       	mov    $0x1,%eax
  104e37:	e9 7b ff ff ff       	jmp    104db7 <MPTKern_test1+0xe7>
  104e3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1e failed.\n");
  104e40:	8d 83 8c ae ff ff    	lea    -0x5174(%ebx),%eax
  104e46:	83 ec 0c             	sub    $0xc,%esp
  104e49:	50                   	push   %eax
  104e4a:	e8 b5 d3 ff ff       	call   102204 <dprintf>
  104e4f:	83 c4 10             	add    $0x10,%esp
    return 1;
  104e52:	b8 01 00 00 00       	mov    $0x1,%eax
  104e57:	e9 5b ff ff ff       	jmp    104db7 <MPTKern_test1+0xe7>
  104e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104e60 <MPTKern_test2>:

int MPTKern_test2()
{
  104e60:	56                   	push   %esi
  104e61:	53                   	push   %ebx
  104e62:	be 00 00 00 40       	mov    $0x40000000,%esi
  104e67:	e8 a3 b4 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104e6c:	81 c3 94 71 00 00    	add    $0x7194,%ebx
  104e72:	83 ec 04             	sub    $0x4,%esp
  104e75:	eb 17                	jmp    104e8e <MPTKern_test2+0x2e>
  104e77:	89 f6                	mov    %esi,%esi
  104e79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  104e80:	81 c6 00 00 40 00    	add    $0x400000,%esi
  unsigned int i, val;
  for (i = 256; i < 960; i ++) {
  104e86:	81 fe 00 00 00 f0    	cmp    $0xf0000000,%esi
  104e8c:	74 32                	je     104ec0 <MPTKern_test2+0x60>
    // val = get_ptbl_entry_by_va(0, i * 4096 * 1024L);
    // if (val != i * 4096 * 1024L + 3) {
    if (get_ptbl_entry_by_va(0, i * 4096 * 1024L) != i * 4096 * 1024L + 3) {
  104e8e:	83 ec 08             	sub    $0x8,%esp
  104e91:	56                   	push   %esi
  104e92:	6a 00                	push   $0x0
  104e94:	e8 77 f6 ff ff       	call   104510 <get_ptbl_entry_by_va>
  104e99:	8d 56 03             	lea    0x3(%esi),%edx
  104e9c:	83 c4 10             	add    $0x10,%esp
  104e9f:	39 d0                	cmp    %edx,%eax
  104ea1:	74 dd                	je     104e80 <MPTKern_test2+0x20>
      // dprintf("%u == %u\n", i * 4096 * 1024L + 3, val);
      dprintf("test 2 failed.\n");
  104ea3:	8d 83 19 ac ff ff    	lea    -0x53e7(%ebx),%eax
  104ea9:	83 ec 0c             	sub    $0xc,%esp
  104eac:	50                   	push   %eax
  104ead:	e8 52 d3 ff ff       	call   102204 <dprintf>
      return 1;
  104eb2:	83 c4 10             	add    $0x10,%esp
  104eb5:	b8 01 00 00 00       	mov    $0x1,%eax
    }
  }
  dprintf("test 2 passed.\n");
  return 0;
}
  104eba:	83 c4 04             	add    $0x4,%esp
  104ebd:	5b                   	pop    %ebx
  104ebe:	5e                   	pop    %esi
  104ebf:	c3                   	ret    
  dprintf("test 2 passed.\n");
  104ec0:	8d 83 29 ac ff ff    	lea    -0x53d7(%ebx),%eax
  104ec6:	83 ec 0c             	sub    $0xc,%esp
  104ec9:	50                   	push   %eax
  104eca:	e8 35 d3 ff ff       	call   102204 <dprintf>
  return 0;
  104ecf:	83 c4 10             	add    $0x10,%esp
  104ed2:	31 c0                	xor    %eax,%eax
}
  104ed4:	83 c4 04             	add    $0x4,%esp
  104ed7:	5b                   	pop    %ebx
  104ed8:	5e                   	pop    %esi
  104ed9:	c3                   	ret    
  104eda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00104ee0 <MPTKern_test_own>:
int MPTKern_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  104ee0:	31 c0                	xor    %eax,%eax
  104ee2:	c3                   	ret    
  104ee3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  104ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00104ef0 <test_MPTKern>:

int test_MPTKern()
{
  104ef0:	53                   	push   %ebx
  104ef1:	83 ec 08             	sub    $0x8,%esp
  return MPTKern_test1() + MPTKern_test2() + MPTKern_test_own();
  104ef4:	e8 d7 fd ff ff       	call   104cd0 <MPTKern_test1>
  104ef9:	89 c3                	mov    %eax,%ebx
  104efb:	e8 60 ff ff ff       	call   104e60 <MPTKern_test2>
}
  104f00:	83 c4 08             	add    $0x8,%esp
  return MPTKern_test1() + MPTKern_test2() + MPTKern_test_own();
  104f03:	01 d8                	add    %ebx,%eax
}
  104f05:	5b                   	pop    %ebx
  104f06:	c3                   	ret    
  104f07:	66 90                	xchg   %ax,%ax
  104f09:	66 90                	xchg   %ax,%ax
  104f0b:	66 90                	xchg   %ax,%ax
  104f0d:	66 90                	xchg   %ax,%ax
  104f0f:	90                   	nop

00104f10 <paging_init>:
 * Initializes the page structures,
 * move to the page structure # 0 (kernel).
 * and turn on the paging.
 */
void paging_init(unsigned int mbi_addr)
{
  104f10:	53                   	push   %ebx
  104f11:	e8 f9 b3 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104f16:	81 c3 ea 70 00 00    	add    $0x70ea,%ebx
  104f1c:	83 ec 14             	sub    $0x14,%esp
	pdir_init_kern(mbi_addr);
  104f1f:	ff 74 24 1c          	pushl  0x1c(%esp)
  104f23:	e8 88 fc ff ff       	call   104bb0 <pdir_init_kern>
	set_pdir_base(0);
  104f28:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  104f2f:	e8 8c f1 ff ff       	call   1040c0 <set_pdir_base>
	enable_paging();
  104f34:	e8 5b be ff ff       	call   100d94 <enable_paging>
}
  104f39:	83 c4 18             	add    $0x18,%esp
  104f3c:	5b                   	pop    %ebx
  104f3d:	c3                   	ret    
  104f3e:	66 90                	xchg   %ax,%ax

00104f40 <alloc_page>:
  *   - It should return the physical page index registered in the page directory, i.e., the
  *     return value from map_page.
  *   - In the case of error, it should return the MagicNumber.
  */
unsigned int alloc_page(unsigned int proc_index, unsigned int vaddr, unsigned int perm)
{
  104f40:	56                   	push   %esi
  104f41:	53                   	push   %ebx
  104f42:	e8 c8 b3 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104f47:	81 c3 b9 70 00 00    	add    $0x70b9,%ebx
  104f4d:	83 ec 10             	sub    $0x10,%esp
  104f50:	8b 74 24 1c          	mov    0x1c(%esp),%esi
	// TODO
  unsigned int addr, retaddr;
  addr = container_alloc(proc_index);
  104f54:	56                   	push   %esi
  104f55:	e8 36 ef ff ff       	call   103e90 <container_alloc>
  if(addr == 0)
  104f5a:	83 c4 10             	add    $0x10,%esp
  104f5d:	85 c0                	test   %eax,%eax
  104f5f:	74 1f                	je     104f80 <alloc_page+0x40>
    return MagicNumber;
  retaddr = map_page(proc_index, vaddr, addr, perm);
  104f61:	ff 74 24 18          	pushl  0x18(%esp)
  104f65:	50                   	push   %eax
  104f66:	ff 74 24 1c          	pushl  0x1c(%esp)
  104f6a:	56                   	push   %esi
  104f6b:	e8 90 fc ff ff       	call   104c00 <map_page>
  if(retaddr == 0)
  104f70:	83 c4 10             	add    $0x10,%esp
  104f73:	85 c0                	test   %eax,%eax
  104f75:	74 09                	je     104f80 <alloc_page+0x40>
    return MagicNumber;
  // dprintf("addr = %u, retaddr = %u\n", addr, retaddr);
	return retaddr;
}
  104f77:	83 c4 04             	add    $0x4,%esp
  104f7a:	5b                   	pop    %ebx
  104f7b:	5e                   	pop    %esi
  104f7c:	c3                   	ret    
  104f7d:	8d 76 00             	lea    0x0(%esi),%esi
  104f80:	83 c4 04             	add    $0x4,%esp
    return MagicNumber;
  104f83:	b8 01 00 10 00       	mov    $0x100001,%eax
}
  104f88:	5b                   	pop    %ebx
  104f89:	5e                   	pop    %esi
  104f8a:	c3                   	ret    
  104f8b:	90                   	nop
  104f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00104f90 <alloc_mem_quota>:

/**
 * Designate some memory quota for the next child process.
 */
unsigned int alloc_mem_quota(unsigned int id, unsigned int quota)
{
  104f90:	53                   	push   %ebx
  104f91:	e8 79 b3 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104f96:	81 c3 6a 70 00 00    	add    $0x706a,%ebx
  104f9c:	83 ec 10             	sub    $0x10,%esp
	unsigned int child;
	child = container_split(id, quota);
  104f9f:	ff 74 24 1c          	pushl  0x1c(%esp)
  104fa3:	ff 74 24 1c          	pushl  0x1c(%esp)
  104fa7:	e8 84 ee ff ff       	call   103e30 <container_split>
	return child;
}
  104fac:	83 c4 18             	add    $0x18,%esp
  104faf:	5b                   	pop    %ebx
  104fb0:	c3                   	ret    
  104fb1:	66 90                	xchg   %ax,%ax
  104fb3:	66 90                	xchg   %ax,%ax
  104fb5:	66 90                	xchg   %ax,%ax
  104fb7:	66 90                	xchg   %ax,%ax
  104fb9:	66 90                	xchg   %ax,%ax
  104fbb:	66 90                	xchg   %ax,%ax
  104fbd:	66 90                	xchg   %ax,%ax
  104fbf:	90                   	nop

00104fc0 <MPTNew_test1>:
#include <vmm/MPTOp/export.h>

#include "export.h"

int MPTNew_test1()
{
  104fc0:	53                   	push   %ebx
  104fc1:	e8 49 b3 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  104fc6:	81 c3 3a 70 00 00    	add    $0x703a,%ebx
  104fcc:	83 ec 10             	sub    $0x10,%esp
  unsigned int vaddr = 4096*1024*400;
  container_split(0, 100);
  104fcf:	6a 64                	push   $0x64
  104fd1:	6a 00                	push   $0x0
  104fd3:	e8 58 ee ff ff       	call   103e30 <container_split>
  if (get_ptbl_entry_by_va(1, vaddr) != 0) {
  104fd8:	59                   	pop    %ecx
  104fd9:	58                   	pop    %eax
  104fda:	68 00 00 00 64       	push   $0x64000000
  104fdf:	6a 01                	push   $0x1
  104fe1:	e8 2a f5 ff ff       	call   104510 <get_ptbl_entry_by_va>
  104fe6:	83 c4 10             	add    $0x10,%esp
  104fe9:	85 c0                	test   %eax,%eax
  104feb:	0f 85 8f 00 00 00    	jne    105080 <MPTNew_test1+0xc0>
    dprintf("test 1a failed.\n");
    return 1;
  }
  if (get_pdir_entry_by_va(1, vaddr) != 0) {
  104ff1:	83 ec 08             	sub    $0x8,%esp
  104ff4:	68 00 00 00 64       	push   $0x64000000
  104ff9:	6a 01                	push   $0x1
  104ffb:	e8 e0 f4 ff ff       	call   1044e0 <get_pdir_entry_by_va>
  105000:	83 c4 10             	add    $0x10,%esp
  105003:	85 c0                	test   %eax,%eax
  105005:	75 59                	jne    105060 <MPTNew_test1+0xa0>
    dprintf("test 1b failed.\n");
    return 1;
  }
  alloc_page(1, vaddr, 7);
  105007:	83 ec 04             	sub    $0x4,%esp
  10500a:	6a 07                	push   $0x7
  10500c:	68 00 00 00 64       	push   $0x64000000
  105011:	6a 01                	push   $0x1
  105013:	e8 28 ff ff ff       	call   104f40 <alloc_page>
  if (get_ptbl_entry_by_va(1, vaddr) == 0) {
  105018:	58                   	pop    %eax
  105019:	5a                   	pop    %edx
  10501a:	68 00 00 00 64       	push   $0x64000000
  10501f:	6a 01                	push   $0x1
  105021:	e8 ea f4 ff ff       	call   104510 <get_ptbl_entry_by_va>
  105026:	83 c4 10             	add    $0x10,%esp
  105029:	85 c0                	test   %eax,%eax
  10502b:	74 73                	je     1050a0 <MPTNew_test1+0xe0>
    dprintf("test 1c failed.\n");
    return 1;
  }
  if (get_pdir_entry_by_va(1, vaddr) == 0) {
  10502d:	83 ec 08             	sub    $0x8,%esp
  105030:	68 00 00 00 64       	push   $0x64000000
  105035:	6a 01                	push   $0x1
  105037:	e8 a4 f4 ff ff       	call   1044e0 <get_pdir_entry_by_va>
  10503c:	83 c4 10             	add    $0x10,%esp
  10503f:	85 c0                	test   %eax,%eax
  105041:	74 7d                	je     1050c0 <MPTNew_test1+0x100>
    dprintf("test 1d failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  105043:	8d 83 09 ac ff ff    	lea    -0x53f7(%ebx),%eax
  105049:	83 ec 0c             	sub    $0xc,%esp
  10504c:	50                   	push   %eax
  10504d:	e8 b2 d1 ff ff       	call   102204 <dprintf>
  105052:	83 c4 10             	add    $0x10,%esp
  return 0;
  105055:	31 c0                	xor    %eax,%eax
  105057:	eb 1e                	jmp    105077 <MPTNew_test1+0xb7>
  105059:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1b failed.\n");
  105060:	8d 83 9e ad ff ff    	lea    -0x5262(%ebx),%eax
  105066:	83 ec 0c             	sub    $0xc,%esp
  105069:	50                   	push   %eax
  10506a:	e8 95 d1 ff ff       	call   102204 <dprintf>
    return 1;
  10506f:	83 c4 10             	add    $0x10,%esp
  105072:	b8 01 00 00 00       	mov    $0x1,%eax
}
  105077:	83 c4 08             	add    $0x8,%esp
  10507a:	5b                   	pop    %ebx
  10507b:	c3                   	ret    
  10507c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1a failed.\n");
  105080:	8d 83 8d ad ff ff    	lea    -0x5273(%ebx),%eax
  105086:	83 ec 0c             	sub    $0xc,%esp
  105089:	50                   	push   %eax
  10508a:	e8 75 d1 ff ff       	call   102204 <dprintf>
    return 1;
  10508f:	83 c4 10             	add    $0x10,%esp
  105092:	b8 01 00 00 00       	mov    $0x1,%eax
}
  105097:	83 c4 08             	add    $0x8,%esp
  10509a:	5b                   	pop    %ebx
  10509b:	c3                   	ret    
  10509c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1c failed.\n");
  1050a0:	8d 83 af ad ff ff    	lea    -0x5251(%ebx),%eax
  1050a6:	83 ec 0c             	sub    $0xc,%esp
  1050a9:	50                   	push   %eax
  1050aa:	e8 55 d1 ff ff       	call   102204 <dprintf>
    return 1;
  1050af:	83 c4 10             	add    $0x10,%esp
  1050b2:	b8 01 00 00 00       	mov    $0x1,%eax
}
  1050b7:	83 c4 08             	add    $0x8,%esp
  1050ba:	5b                   	pop    %ebx
  1050bb:	c3                   	ret    
  1050bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    dprintf("test 1d failed.\n");
  1050c0:	8d 83 c0 ad ff ff    	lea    -0x5240(%ebx),%eax
  1050c6:	83 ec 0c             	sub    $0xc,%esp
  1050c9:	50                   	push   %eax
  1050ca:	e8 35 d1 ff ff       	call   102204 <dprintf>
  1050cf:	83 c4 10             	add    $0x10,%esp
    return 1;
  1050d2:	b8 01 00 00 00       	mov    $0x1,%eax
  1050d7:	eb 9e                	jmp    105077 <MPTNew_test1+0xb7>
  1050d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001050e0 <MPTNew_test_own>:
int MPTNew_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  1050e0:	31 c0                	xor    %eax,%eax
  1050e2:	c3                   	ret    
  1050e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1050e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001050f0 <test_MPTNew>:

int test_MPTNew()
{
  return MPTNew_test1() + MPTNew_test_own();
  1050f0:	e9 cb fe ff ff       	jmp    104fc0 <MPTNew_test1>
  1050f5:	66 90                	xchg   %ax,%ax
  1050f7:	66 90                	xchg   %ax,%ax
  1050f9:	66 90                	xchg   %ax,%ax
  1050fb:	66 90                	xchg   %ax,%ax
  1050fd:	66 90                	xchg   %ax,%ax
  1050ff:	90                   	nop

00105100 <kctx_set_esp>:

//places to save the [NUM_IDS] kernel thread states.
struct kctx kctx_pool[NUM_IDS];

void kctx_set_esp(unsigned int pid, void *esp)
{
  105100:	e8 cc bc ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  105105:	81 c2 fb 6e 00 00    	add    $0x6efb,%edx
  10510b:	8b 44 24 04          	mov    0x4(%esp),%eax
	kctx_pool[pid].esp = esp;
  10510f:	c7 c1 00 00 df 00    	mov    $0xdf0000,%ecx
  105115:	8b 54 24 08          	mov    0x8(%esp),%edx
  105119:	8d 04 40             	lea    (%eax,%eax,2),%eax
  10511c:	8d 04 c1             	lea    (%ecx,%eax,8),%eax
  10511f:	89 10                	mov    %edx,(%eax)
}
  105121:	c3                   	ret    
  105122:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105130 <kctx_set_eip>:

void kctx_set_eip(unsigned int pid, void *eip)
{
  105130:	e8 9c bc ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  105135:	81 c2 cb 6e 00 00    	add    $0x6ecb,%edx
  10513b:	8b 44 24 04          	mov    0x4(%esp),%eax
	kctx_pool[pid].eip = eip;
  10513f:	c7 c1 00 00 df 00    	mov    $0xdf0000,%ecx
  105145:	8b 54 24 08          	mov    0x8(%esp),%edx
  105149:	8d 04 40             	lea    (%eax,%eax,2),%eax
  10514c:	8d 04 c1             	lea    (%ecx,%eax,8),%eax
  10514f:	89 50 14             	mov    %edx,0x14(%eax)
}
  105152:	c3                   	ret    
  105153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105160 <kctx_switch>:
/**
 * Saves the states for thread # [from_pid] and restores the states
 * for thread # [to_pid].
 */
void kctx_switch(unsigned int from_pid, unsigned int to_pid)
{
  105160:	53                   	push   %ebx
  105161:	e8 a9 b1 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  105166:	81 c3 9a 6e 00 00    	add    $0x6e9a,%ebx
  10516c:	83 ec 10             	sub    $0x10,%esp
  10516f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  105173:	8b 54 24 18          	mov    0x18(%esp),%edx
	cswitch(&kctx_pool[from_pid], &kctx_pool[to_pid]);
  105177:	8d 0c 40             	lea    (%eax,%eax,2),%ecx
  10517a:	c7 c0 00 00 df 00    	mov    $0xdf0000,%eax
  105180:	8d 14 52             	lea    (%edx,%edx,2),%edx
  105183:	8d 0c c8             	lea    (%eax,%ecx,8),%ecx
  105186:	8d 04 d0             	lea    (%eax,%edx,8),%eax
  105189:	51                   	push   %ecx
  10518a:	50                   	push   %eax
  10518b:	e8 05 00 00 00       	call   105195 <cswitch>
}
  105190:	83 c4 18             	add    $0x18,%esp
  105193:	5b                   	pop    %ebx
  105194:	c3                   	ret    

00105195 <cswitch>:
cswitch:
	/**
	  * The pointer *from is saved to register %eax.
	  * This is the pointer to the kctx structure to be saved.
	  */
	movl	  4(%esp), %eax	
  105195:	8b 44 24 04          	mov    0x4(%esp),%eax

	/**
	  * The pointer *to is saved to register %edx.
	  * This is the pointer to the kctx structure to be loaded.
	  */
	movl	  8(%esp), %edx	
  105199:	8b 54 24 08          	mov    0x8(%esp),%edx
		- To save the old kernel context, you have to save the values of the corresponding registers 
		  into these memory locations.

	  *  - The saved eip in this data-structure should point to the return address of this function.
	  */
	movl %esp, 0(%eax)
  10519d:	89 20                	mov    %esp,(%eax)
	movl %edi, 4(%eax)
  10519f:	89 78 04             	mov    %edi,0x4(%eax)
	movl %esi, 8(%eax)
  1051a2:	89 70 08             	mov    %esi,0x8(%eax)
	movl %ebx, 12(%eax)
  1051a5:	89 58 0c             	mov    %ebx,0xc(%eax)
	movl %ebp, 16(%eax)
  1051a8:	89 68 10             	mov    %ebp,0x10(%eax)
	movl 0(%esp), %ecx
  1051ab:	8b 0c 24             	mov    (%esp),%ecx
	movl %ecx, 20(%eax)
  1051ae:	89 48 14             	mov    %ecx,0x14(%eax)
	  *  
	  *  - %eip is not a general purpose register and cannot be manipulated directly. Instead we load the eip from kctx structure 
	  *    "to" as the return address. For this, we want to place the eip field of kctx structure onto the top of the stack (i.e. 0(%esp))
	  *    so that it will use that value in the ret statement.  
	  */
	movl 0(%edx), %esp
  1051b1:	8b 22                	mov    (%edx),%esp
	movl 4(%edx), %edi
  1051b3:	8b 7a 04             	mov    0x4(%edx),%edi
	movl 8(%edx), %esi
  1051b6:	8b 72 08             	mov    0x8(%edx),%esi
	movl 12(%edx), %ebx
  1051b9:	8b 5a 0c             	mov    0xc(%edx),%ebx
	movl 16(%edx), %ebp
  1051bc:	8b 6a 10             	mov    0x10(%edx),%ebp
	movl 20(%edx), %ecx
  1051bf:	8b 4a 14             	mov    0x14(%edx),%ecx
	movl %ecx, 0(%esp)
  1051c2:	89 0c 24             	mov    %ecx,(%esp)

	/**
	  * The return value is stored in eax. Returns 0.
	  */
	xor     %eax, %eax
  1051c5:	31 c0                	xor    %eax,%eax
	ret
  1051c7:	c3                   	ret    
  1051c8:	66 90                	xchg   %ax,%ax
  1051ca:	66 90                	xchg   %ax,%ax
  1051cc:	66 90                	xchg   %ax,%ax
  1051ce:	66 90                	xchg   %ax,%ax

001051d0 <kctx_new>:
  */
// unsigned int alloc_mem_quota(unsigned int id, unsigned int quota);
// void kctx_set_esp(unsigned int pid, void *esp);
// void kctx_set_eip(unsigned int pid, void *eip);
unsigned int kctx_new(void *entry, unsigned int id, unsigned int quota)
{
  1051d0:	56                   	push   %esi
  1051d1:	53                   	push   %ebx
  1051d2:	e8 38 b1 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1051d7:	81 c3 29 6e 00 00    	add    $0x6e29,%ebx
  1051dd:	83 ec 0c             	sub    $0xc,%esp
  // TODO
  unsigned int pid = alloc_mem_quota(id, quota);
  1051e0:	ff 74 24 20          	pushl  0x20(%esp)
  1051e4:	ff 74 24 20          	pushl  0x20(%esp)
  1051e8:	e8 a3 fd ff ff       	call   104f90 <alloc_mem_quota>
  1051ed:	89 c6                	mov    %eax,%esi
  kctx_set_eip(pid, entry);
  1051ef:	58                   	pop    %eax
  1051f0:	5a                   	pop    %edx
  1051f1:	ff 74 24 18          	pushl  0x18(%esp)
  1051f5:	56                   	push   %esi
  1051f6:	e8 35 ff ff ff       	call   105130 <kctx_set_eip>
  kctx_set_esp(pid, &STACK_LOC[pid][PAGESIZE-1]);
  1051fb:	59                   	pop    %ecx
  1051fc:	58                   	pop    %eax
  1051fd:	c7 c0 00 c0 96 00    	mov    $0x96c000,%eax
  105203:	89 f2                	mov    %esi,%edx
  105205:	c1 e2 0c             	shl    $0xc,%edx
  105208:	8d 84 02 ff 0f 00 00 	lea    0xfff(%edx,%eax,1),%eax
  10520f:	50                   	push   %eax
  105210:	56                   	push   %esi
  105211:	e8 ea fe ff ff       	call   105100 <kctx_set_esp>

  return pid;
}
  105216:	83 c4 14             	add    $0x14,%esp
  105219:	89 f0                	mov    %esi,%eax
  10521b:	5b                   	pop    %ebx
  10521c:	5e                   	pop    %esi
  10521d:	c3                   	ret    
  10521e:	66 90                	xchg   %ax,%ax

00105220 <PKCtxNew_test1>:
	void	*eip;
} kctx;
extern kctx kctx_pool[NUM_IDS];

int PKCtxNew_test1()
{
  105220:	56                   	push   %esi
  105221:	53                   	push   %ebx
  105222:	e8 e8 b0 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  105227:	81 c3 d9 6d 00 00    	add    $0x6dd9,%ebx
  10522d:	83 ec 08             	sub    $0x8,%esp
  void * dummy_addr = (void *) 0;
  unsigned int chid = kctx_new(dummy_addr, 0, 1000);
  105230:	68 e8 03 00 00       	push   $0x3e8
  105235:	6a 00                	push   $0x0
  105237:	6a 00                	push   $0x0
  105239:	e8 92 ff ff ff       	call   1051d0 <kctx_new>
  if (container_get_quota(chid) != 1000) {
  10523e:	89 04 24             	mov    %eax,(%esp)
  unsigned int chid = kctx_new(dummy_addr, 0, 1000);
  105241:	89 c6                	mov    %eax,%esi
  if (container_get_quota(chid) != 1000) {
  105243:	e8 78 eb ff ff       	call   103dc0 <container_get_quota>
  105248:	83 c4 10             	add    $0x10,%esp
  10524b:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  105250:	75 13                	jne    105265 <PKCtxNew_test1+0x45>
    dprintf("test 1 failed.\n");
    return 1;
  }

  if (kctx_pool[chid].eip != dummy_addr) {
  105252:	c7 c2 00 00 df 00    	mov    $0xdf0000,%edx
  105258:	8d 04 76             	lea    (%esi,%esi,2),%eax
  10525b:	8d 04 c2             	lea    (%edx,%eax,8),%eax
  10525e:	8b 48 14             	mov    0x14(%eax),%ecx
  105261:	85 c9                	test   %ecx,%ecx
  105263:	74 23                	je     105288 <PKCtxNew_test1+0x68>
    dprintf("test 1 failed.\n");
  105265:	8d 83 f9 ab ff ff    	lea    -0x5407(%ebx),%eax
  10526b:	83 ec 0c             	sub    $0xc,%esp
  10526e:	50                   	push   %eax
  10526f:	e8 90 cf ff ff       	call   102204 <dprintf>
    return 1;
  105274:	83 c4 10             	add    $0x10,%esp
  105277:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  10527c:	83 c4 04             	add    $0x4,%esp
  10527f:	5b                   	pop    %ebx
  105280:	5e                   	pop    %esi
  105281:	c3                   	ret    
  105282:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  dprintf("test 1 passed.\n");
  105288:	8d 83 09 ac ff ff    	lea    -0x53f7(%ebx),%eax
  10528e:	83 ec 0c             	sub    $0xc,%esp
  105291:	50                   	push   %eax
  105292:	e8 6d cf ff ff       	call   102204 <dprintf>
  return 0;
  105297:	83 c4 10             	add    $0x10,%esp
  10529a:	31 c0                	xor    %eax,%eax
}
  10529c:	83 c4 04             	add    $0x4,%esp
  10529f:	5b                   	pop    %ebx
  1052a0:	5e                   	pop    %esi
  1052a1:	c3                   	ret    
  1052a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1052a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001052b0 <PKCtxNew_test_own>:
int PKCtxNew_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  1052b0:	31 c0                	xor    %eax,%eax
  1052b2:	c3                   	ret    
  1052b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1052b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001052c0 <test_PKCtxNew>:

int test_PKCtxNew()
{
  return PKCtxNew_test1() + PKCtxNew_test_own();
  1052c0:	e9 5b ff ff ff       	jmp    105220 <PKCtxNew_test1>
  1052c5:	66 90                	xchg   %ax,%ax
  1052c7:	66 90                	xchg   %ax,%ax
  1052c9:	66 90                	xchg   %ax,%ax
  1052cb:	66 90                	xchg   %ax,%ax
  1052cd:	66 90                	xchg   %ax,%ax
  1052cf:	90                   	nop

001052d0 <tcb_get_state>:

struct TCB TCBPool[NUM_IDS];


unsigned int tcb_get_state(unsigned int pid)
{
  1052d0:	e8 fc ba ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  1052d5:	81 c2 2b 6d 00 00    	add    $0x6d2b,%edx
  1052db:	8b 44 24 04          	mov    0x4(%esp),%eax
	return TCBPool[pid].state;
  1052df:	c7 c1 00 06 df 00    	mov    $0xdf0600,%ecx
  1052e5:	8d 04 40             	lea    (%eax,%eax,2),%eax
  1052e8:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1052eb:	8b 00                	mov    (%eax),%eax
}
  1052ed:	c3                   	ret    
  1052ee:	66 90                	xchg   %ax,%ax

001052f0 <tcb_set_state>:

void tcb_set_state(unsigned int pid, unsigned int state)
{
  1052f0:	e8 dc ba ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  1052f5:	81 c2 0b 6d 00 00    	add    $0x6d0b,%edx
  1052fb:	8b 44 24 04          	mov    0x4(%esp),%eax
	TCBPool[pid].state = state;
  1052ff:	c7 c1 00 06 df 00    	mov    $0xdf0600,%ecx
  105305:	8b 54 24 08          	mov    0x8(%esp),%edx
  105309:	8d 04 40             	lea    (%eax,%eax,2),%eax
  10530c:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  10530f:	89 10                	mov    %edx,(%eax)
}
  105311:	c3                   	ret    
  105312:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105320 <tcb_get_prev>:

unsigned int tcb_get_prev(unsigned int pid)
{
  105320:	e8 ac ba ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  105325:	81 c2 db 6c 00 00    	add    $0x6cdb,%edx
  10532b:	8b 44 24 04          	mov    0x4(%esp),%eax
	return TCBPool[pid].prev;
  10532f:	c7 c1 00 06 df 00    	mov    $0xdf0600,%ecx
  105335:	8d 04 40             	lea    (%eax,%eax,2),%eax
  105338:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  10533b:	8b 40 04             	mov    0x4(%eax),%eax
}
  10533e:	c3                   	ret    
  10533f:	90                   	nop

00105340 <tcb_set_prev>:

void tcb_set_prev(unsigned int pid, unsigned int prev_pid)
{
  105340:	e8 8c ba ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  105345:	81 c2 bb 6c 00 00    	add    $0x6cbb,%edx
  10534b:	8b 44 24 04          	mov    0x4(%esp),%eax
	TCBPool[pid].prev = prev_pid;
  10534f:	c7 c1 00 06 df 00    	mov    $0xdf0600,%ecx
  105355:	8b 54 24 08          	mov    0x8(%esp),%edx
  105359:	8d 04 40             	lea    (%eax,%eax,2),%eax
  10535c:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  10535f:	89 50 04             	mov    %edx,0x4(%eax)
}
  105362:	c3                   	ret    
  105363:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105370 <tcb_get_next>:

unsigned int tcb_get_next(unsigned int pid)
{
  105370:	e8 5c ba ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  105375:	81 c2 8b 6c 00 00    	add    $0x6c8b,%edx
  10537b:	8b 44 24 04          	mov    0x4(%esp),%eax
	return TCBPool[pid].next;
  10537f:	c7 c1 00 06 df 00    	mov    $0xdf0600,%ecx
  105385:	8d 04 40             	lea    (%eax,%eax,2),%eax
  105388:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  10538b:	8b 40 08             	mov    0x8(%eax),%eax
}
  10538e:	c3                   	ret    
  10538f:	90                   	nop

00105390 <tcb_set_next>:

void tcb_set_next(unsigned int pid, unsigned int next_pid)
{
  105390:	e8 3c ba ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  105395:	81 c2 6b 6c 00 00    	add    $0x6c6b,%edx
  10539b:	8b 44 24 04          	mov    0x4(%esp),%eax
	TCBPool[pid].next = next_pid;
  10539f:	c7 c1 00 06 df 00    	mov    $0xdf0600,%ecx
  1053a5:	8b 54 24 08          	mov    0x8(%esp),%edx
  1053a9:	8d 04 40             	lea    (%eax,%eax,2),%eax
  1053ac:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1053af:	89 50 08             	mov    %edx,0x8(%eax)
}
  1053b2:	c3                   	ret    
  1053b3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1053b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001053c0 <tcb_init_at_id>:

void tcb_init_at_id(unsigned int pid)
{
  1053c0:	e8 0c ba ff ff       	call   100dd1 <__x86.get_pc_thunk.dx>
  1053c5:	81 c2 3b 6c 00 00    	add    $0x6c3b,%edx
  1053cb:	8b 44 24 04          	mov    0x4(%esp),%eax
	TCBPool[pid].state = TSTATE_DEAD;
  1053cf:	c7 c1 00 06 df 00    	mov    $0xdf0600,%ecx
  1053d5:	8d 04 40             	lea    (%eax,%eax,2),%eax
  1053d8:	8d 04 81             	lea    (%ecx,%eax,4),%eax
  1053db:	c7 00 03 00 00 00    	movl   $0x3,(%eax)
	TCBPool[pid].prev = NUM_IDS;
  1053e1:	c7 40 04 40 00 00 00 	movl   $0x40,0x4(%eax)
	TCBPool[pid].next = NUM_IDS;
  1053e8:	c7 40 08 40 00 00 00 	movl   $0x40,0x8(%eax)
}
  1053ef:	c3                   	ret    

001053f0 <tcb_init>:
  * 
  *  Hint 1:
  *  - Use function tcb_init_at_id, defined in PTCBIntro.c
  */
void tcb_init(unsigned int mbi_addr)
{
  1053f0:	56                   	push   %esi
  1053f1:	53                   	push   %ebx
  // TODO: define your local variables here.
	int i;
	paging_init(mbi_addr);

  // TODO
	for(i = 0; i < NUM_IDS; i++)
  1053f2:	31 f6                	xor    %esi,%esi
  1053f4:	e8 16 af ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1053f9:	81 c3 07 6c 00 00    	add    $0x6c07,%ebx
{
  1053ff:	83 ec 10             	sub    $0x10,%esp
	paging_init(mbi_addr);
  105402:	ff 74 24 1c          	pushl  0x1c(%esp)
  105406:	e8 05 fb ff ff       	call   104f10 <paging_init>
  10540b:	83 c4 10             	add    $0x10,%esp
  10540e:	66 90                	xchg   %ax,%ax
		tcb_init_at_id(i);
  105410:	83 ec 0c             	sub    $0xc,%esp
  105413:	56                   	push   %esi
	for(i = 0; i < NUM_IDS; i++)
  105414:	83 c6 01             	add    $0x1,%esi
		tcb_init_at_id(i);
  105417:	e8 a4 ff ff ff       	call   1053c0 <tcb_init_at_id>
	for(i = 0; i < NUM_IDS; i++)
  10541c:	83 c4 10             	add    $0x10,%esp
  10541f:	83 fe 40             	cmp    $0x40,%esi
  105422:	75 ec                	jne    105410 <tcb_init+0x20>
}
  105424:	83 c4 04             	add    $0x4,%esp
  105427:	5b                   	pop    %ebx
  105428:	5e                   	pop    %esi
  105429:	c3                   	ret    
  10542a:	66 90                	xchg   %ax,%ax
  10542c:	66 90                	xchg   %ax,%ax
  10542e:	66 90                	xchg   %ax,%ax

00105430 <PTCBInit_test1>:
#include <lib/thread.h>
#include <thread/PTCBIntro/export.h>
#include "export.h"

int PTCBInit_test1()
{
  105430:	56                   	push   %esi
  105431:	53                   	push   %ebx
  unsigned int i;
  for (i = 1; i < NUM_IDS; i ++) {
  105432:	be 01 00 00 00       	mov    $0x1,%esi
  105437:	e8 d3 ae ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  10543c:	81 c3 c4 6b 00 00    	add    $0x6bc4,%ebx
{
  105442:	83 ec 04             	sub    $0x4,%esp
  105445:	eb 33                	jmp    10547a <PTCBInit_test1+0x4a>
  105447:	89 f6                	mov    %esi,%esi
  105449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if (tcb_get_state(i) != TSTATE_DEAD || tcb_get_prev(i) != NUM_IDS || tcb_get_next(i) != NUM_IDS) {
  105450:	83 ec 0c             	sub    $0xc,%esp
  105453:	56                   	push   %esi
  105454:	e8 c7 fe ff ff       	call   105320 <tcb_get_prev>
  105459:	83 c4 10             	add    $0x10,%esp
  10545c:	83 f8 40             	cmp    $0x40,%eax
  10545f:	75 2a                	jne    10548b <PTCBInit_test1+0x5b>
  105461:	83 ec 0c             	sub    $0xc,%esp
  105464:	56                   	push   %esi
  105465:	e8 06 ff ff ff       	call   105370 <tcb_get_next>
  10546a:	83 c4 10             	add    $0x10,%esp
  10546d:	83 f8 40             	cmp    $0x40,%eax
  105470:	75 19                	jne    10548b <PTCBInit_test1+0x5b>
  for (i = 1; i < NUM_IDS; i ++) {
  105472:	83 c6 01             	add    $0x1,%esi
  105475:	83 fe 40             	cmp    $0x40,%esi
  105478:	74 36                	je     1054b0 <PTCBInit_test1+0x80>
    if (tcb_get_state(i) != TSTATE_DEAD || tcb_get_prev(i) != NUM_IDS || tcb_get_next(i) != NUM_IDS) {
  10547a:	83 ec 0c             	sub    $0xc,%esp
  10547d:	56                   	push   %esi
  10547e:	e8 4d fe ff ff       	call   1052d0 <tcb_get_state>
  105483:	83 c4 10             	add    $0x10,%esp
  105486:	83 f8 03             	cmp    $0x3,%eax
  105489:	74 c5                	je     105450 <PTCBInit_test1+0x20>
      dprintf("test 1 failed.\n");
  10548b:	8d 83 f9 ab ff ff    	lea    -0x5407(%ebx),%eax
  105491:	83 ec 0c             	sub    $0xc,%esp
  105494:	50                   	push   %eax
  105495:	e8 6a cd ff ff       	call   102204 <dprintf>
      return 1;
  10549a:	83 c4 10             	add    $0x10,%esp
  10549d:	b8 01 00 00 00       	mov    $0x1,%eax
    }
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  1054a2:	83 c4 04             	add    $0x4,%esp
  1054a5:	5b                   	pop    %ebx
  1054a6:	5e                   	pop    %esi
  1054a7:	c3                   	ret    
  1054a8:	90                   	nop
  1054a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  dprintf("test 1 passed.\n");
  1054b0:	8d 83 09 ac ff ff    	lea    -0x53f7(%ebx),%eax
  1054b6:	83 ec 0c             	sub    $0xc,%esp
  1054b9:	50                   	push   %eax
  1054ba:	e8 45 cd ff ff       	call   102204 <dprintf>
  return 0;
  1054bf:	83 c4 10             	add    $0x10,%esp
  1054c2:	31 c0                	xor    %eax,%eax
}
  1054c4:	83 c4 04             	add    $0x4,%esp
  1054c7:	5b                   	pop    %ebx
  1054c8:	5e                   	pop    %esi
  1054c9:	c3                   	ret    
  1054ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001054d0 <PTCBInit_test_own>:
int PTCBInit_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  1054d0:	31 c0                	xor    %eax,%eax
  1054d2:	c3                   	ret    
  1054d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1054d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001054e0 <test_PTCBInit>:

int test_PTCBInit()
{
  return PTCBInit_test1() + PTCBInit_test_own();
  1054e0:	e9 4b ff ff ff       	jmp    105430 <PTCBInit_test1>
  1054e5:	66 90                	xchg   %ax,%ax
  1054e7:	66 90                	xchg   %ax,%ax
  1054e9:	66 90                	xchg   %ax,%ax
  1054eb:	66 90                	xchg   %ax,%ax
  1054ed:	66 90                	xchg   %ax,%ax
  1054ef:	90                   	nop

001054f0 <tqueue_get_head>:
 * and are scheduled in a round-robin manner.
 */
struct TQueue TQueuePool[NUM_IDS + 1];

unsigned int tqueue_get_head(unsigned int chid)
{
  1054f0:	e8 d8 b8 ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  1054f5:	05 0b 6b 00 00       	add    $0x6b0b,%eax
	return TQueuePool[chid].head;
  1054fa:	8b 54 24 04          	mov    0x4(%esp),%edx
  1054fe:	c7 c0 00 09 df 00    	mov    $0xdf0900,%eax
  105504:	8b 04 d0             	mov    (%eax,%edx,8),%eax
}
  105507:	c3                   	ret    
  105508:	90                   	nop
  105509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105510 <tqueue_set_head>:

void tqueue_set_head(unsigned int chid, unsigned int head)
{
  105510:	e8 b8 b8 ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  105515:	05 eb 6a 00 00       	add    $0x6aeb,%eax
	TQueuePool[chid].head = head;
  10551a:	8b 54 24 04          	mov    0x4(%esp),%edx
  10551e:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  105522:	c7 c0 00 09 df 00    	mov    $0xdf0900,%eax
  105528:	89 0c d0             	mov    %ecx,(%eax,%edx,8)
}
  10552b:	c3                   	ret    
  10552c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105530 <tqueue_get_tail>:

unsigned int tqueue_get_tail(unsigned int chid)
{
  105530:	e8 98 b8 ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  105535:	05 cb 6a 00 00       	add    $0x6acb,%eax
	return TQueuePool[chid].tail;
  10553a:	8b 54 24 04          	mov    0x4(%esp),%edx
  10553e:	c7 c0 00 09 df 00    	mov    $0xdf0900,%eax
  105544:	8b 44 d0 04          	mov    0x4(%eax,%edx,8),%eax
}
  105548:	c3                   	ret    
  105549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105550 <tqueue_set_tail>:

void tqueue_set_tail(unsigned int chid, unsigned int tail)
{
  105550:	e8 78 b8 ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  105555:	05 ab 6a 00 00       	add    $0x6aab,%eax
	TQueuePool[chid].tail = tail;
  10555a:	8b 54 24 04          	mov    0x4(%esp),%edx
  10555e:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  105562:	c7 c0 00 09 df 00    	mov    $0xdf0900,%eax
  105568:	89 4c d0 04          	mov    %ecx,0x4(%eax,%edx,8)
}
  10556c:	c3                   	ret    
  10556d:	8d 76 00             	lea    0x0(%esi),%esi

00105570 <tqueue_init_at_id>:

void tqueue_init_at_id(unsigned int chid)
{
  105570:	e8 58 b8 ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  105575:	05 8b 6a 00 00       	add    $0x6a8b,%eax
  10557a:	8b 54 24 04          	mov    0x4(%esp),%edx
	TQueuePool[chid].head = NUM_IDS;
  10557e:	c7 c0 00 09 df 00    	mov    $0xdf0900,%eax
  105584:	c7 04 d0 40 00 00 00 	movl   $0x40,(%eax,%edx,8)
	TQueuePool[chid].tail = NUM_IDS;
  10558b:	c7 44 d0 04 40 00 00 	movl   $0x40,0x4(%eax,%edx,8)
  105592:	00 
}
  105593:	c3                   	ret    
  105594:	66 90                	xchg   %ax,%ax
  105596:	66 90                	xchg   %ax,%ax
  105598:	66 90                	xchg   %ax,%ax
  10559a:	66 90                	xchg   %ax,%ax
  10559c:	66 90                	xchg   %ax,%ax
  10559e:	66 90                	xchg   %ax,%ax

001055a0 <tqueue_init>:
  *  Hint 1:
  *  - Remember that there are NUM_IDS + 1 queues. The first NUM_IDS queues are the sleep queues and 
  *    the last queue with id NUM_IDS is the ready queue.
  */
void tqueue_init(unsigned int mbi_addr)
{
  1055a0:	53                   	push   %ebx
  1055a1:	e8 69 ad ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1055a6:	81 c3 5a 6a 00 00    	add    $0x6a5a,%ebx
  1055ac:	83 ec 14             	sub    $0x14,%esp
  // TODO: define your local variables here.

	tcb_init(mbi_addr);
  1055af:	ff 74 24 1c          	pushl  0x1c(%esp)
  1055b3:	e8 38 fe ff ff       	call   1053f0 <tcb_init>

  // TODO
}
  1055b8:	83 c4 18             	add    $0x18,%esp
  1055bb:	5b                   	pop    %ebx
  1055bc:	c3                   	ret    
  1055bd:	8d 76 00             	lea    0x0(%esi),%esi

001055c0 <tqueue_enqueue>:
  *    3. and the next pointer for #pid should point to NULL (i.e. NUM_IDS)
  */
void tqueue_enqueue(unsigned int chid, unsigned int pid)
{
  // TODO
}
  1055c0:	f3 c3                	repz ret 
  1055c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  1055c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001055d0 <tqueue_dequeue>:
  */
unsigned int tqueue_dequeue(unsigned int chid)
{
  // TODO
  return 0;
}
  1055d0:	31 c0                	xor    %eax,%eax
  1055d2:	c3                   	ret    
  1055d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1055d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001055e0 <tqueue_remove>:
  1055e0:	f3 c3                	repz ret 
  1055e2:	66 90                	xchg   %ax,%ax
  1055e4:	66 90                	xchg   %ax,%ax
  1055e6:	66 90                	xchg   %ax,%ax
  1055e8:	66 90                	xchg   %ax,%ax
  1055ea:	66 90                	xchg   %ax,%ax
  1055ec:	66 90                	xchg   %ax,%ax
  1055ee:	66 90                	xchg   %ax,%ax

001055f0 <PTQueueInit_test1>:
#include <thread/PTCBIntro/export.h>
#include <thread/PTQueueIntro/export.h>
#include "export.h"

int PTQueueInit_test1()
{
  1055f0:	56                   	push   %esi
  1055f1:	53                   	push   %ebx
  unsigned int i;
  for (i = 0; i < NUM_IDS; i ++) {
  1055f2:	31 f6                	xor    %esi,%esi
  1055f4:	e8 16 ad ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1055f9:	81 c3 07 6a 00 00    	add    $0x6a07,%ebx
{
  1055ff:	83 ec 04             	sub    $0x4,%esp
  105602:	eb 1d                	jmp    105621 <PTQueueInit_test1+0x31>
  105604:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if (tqueue_get_head(i) != NUM_IDS || tqueue_get_tail(i) != NUM_IDS) {
  105608:	83 ec 0c             	sub    $0xc,%esp
  10560b:	56                   	push   %esi
  10560c:	e8 1f ff ff ff       	call   105530 <tqueue_get_tail>
  105611:	83 c4 10             	add    $0x10,%esp
  105614:	83 f8 40             	cmp    $0x40,%eax
  105617:	75 19                	jne    105632 <PTQueueInit_test1+0x42>
  for (i = 0; i < NUM_IDS; i ++) {
  105619:	83 c6 01             	add    $0x1,%esi
  10561c:	83 fe 40             	cmp    $0x40,%esi
  10561f:	74 2f                	je     105650 <PTQueueInit_test1+0x60>
    if (tqueue_get_head(i) != NUM_IDS || tqueue_get_tail(i) != NUM_IDS) {
  105621:	83 ec 0c             	sub    $0xc,%esp
  105624:	56                   	push   %esi
  105625:	e8 c6 fe ff ff       	call   1054f0 <tqueue_get_head>
  10562a:	83 c4 10             	add    $0x10,%esp
  10562d:	83 f8 40             	cmp    $0x40,%eax
  105630:	74 d6                	je     105608 <PTQueueInit_test1+0x18>
      dprintf("test 1 failed.\n");
  105632:	8d 83 f9 ab ff ff    	lea    -0x5407(%ebx),%eax
  105638:	83 ec 0c             	sub    $0xc,%esp
  10563b:	50                   	push   %eax
  10563c:	e8 c3 cb ff ff       	call   102204 <dprintf>
      return 1;
  105641:	83 c4 10             	add    $0x10,%esp
  105644:	b8 01 00 00 00       	mov    $0x1,%eax
    }
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  105649:	83 c4 04             	add    $0x4,%esp
  10564c:	5b                   	pop    %ebx
  10564d:	5e                   	pop    %esi
  10564e:	c3                   	ret    
  10564f:	90                   	nop
  dprintf("test 1 passed.\n");
  105650:	8d 83 09 ac ff ff    	lea    -0x53f7(%ebx),%eax
  105656:	83 ec 0c             	sub    $0xc,%esp
  105659:	50                   	push   %eax
  10565a:	e8 a5 cb ff ff       	call   102204 <dprintf>
  return 0;
  10565f:	83 c4 10             	add    $0x10,%esp
  105662:	31 c0                	xor    %eax,%eax
}
  105664:	83 c4 04             	add    $0x4,%esp
  105667:	5b                   	pop    %ebx
  105668:	5e                   	pop    %esi
  105669:	c3                   	ret    
  10566a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105670 <PTQueueInit_test2>:

int PTQueueInit_test2()
{
  105670:	53                   	push   %ebx
  105671:	e8 99 ac ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  105676:	81 c3 8a 69 00 00    	add    $0x698a,%ebx
  10567c:	83 ec 10             	sub    $0x10,%esp
  unsigned int pid;
  tqueue_enqueue(0, 2);
  10567f:	6a 02                	push   $0x2
  105681:	6a 00                	push   $0x0
  105683:	e8 38 ff ff ff       	call   1055c0 <tqueue_enqueue>
  tqueue_enqueue(0, 3);
  105688:	5a                   	pop    %edx
  105689:	59                   	pop    %ecx
  10568a:	6a 03                	push   $0x3
  10568c:	6a 00                	push   $0x0
  10568e:	e8 2d ff ff ff       	call   1055c0 <tqueue_enqueue>
  tqueue_enqueue(0, 4);
  105693:	58                   	pop    %eax
  105694:	5a                   	pop    %edx
  105695:	6a 04                	push   $0x4
  105697:	6a 00                	push   $0x0
  105699:	e8 22 ff ff ff       	call   1055c0 <tqueue_enqueue>
  if (tcb_get_prev(2) != NUM_IDS || tcb_get_next(2) != 3) {
  10569e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1056a5:	e8 76 fc ff ff       	call   105320 <tcb_get_prev>
  1056aa:	83 c4 10             	add    $0x10,%esp
  1056ad:	83 f8 40             	cmp    $0x40,%eax
  1056b0:	74 1e                	je     1056d0 <PTQueueInit_test2+0x60>
    dprintf("test 2-a failed.\n");
  1056b2:	8d 83 9d ae ff ff    	lea    -0x5163(%ebx),%eax
  1056b8:	83 ec 0c             	sub    $0xc,%esp
  1056bb:	50                   	push   %eax
  1056bc:	e8 43 cb ff ff       	call   102204 <dprintf>
    return 1;
  1056c1:	83 c4 10             	add    $0x10,%esp
  1056c4:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 2-g failed.\n");
    return 1;
  }
  dprintf("test 2 passed.\n");
  return 0;
}
  1056c9:	83 c4 08             	add    $0x8,%esp
  1056cc:	5b                   	pop    %ebx
  1056cd:	c3                   	ret    
  1056ce:	66 90                	xchg   %ax,%ax
  if (tcb_get_prev(2) != NUM_IDS || tcb_get_next(2) != 3) {
  1056d0:	83 ec 0c             	sub    $0xc,%esp
  1056d3:	6a 02                	push   $0x2
  1056d5:	e8 96 fc ff ff       	call   105370 <tcb_get_next>
  1056da:	83 c4 10             	add    $0x10,%esp
  1056dd:	83 f8 03             	cmp    $0x3,%eax
  1056e0:	75 d0                	jne    1056b2 <PTQueueInit_test2+0x42>
  if (tcb_get_prev(3) != 2 || tcb_get_next(3) != 4) {
  1056e2:	83 ec 0c             	sub    $0xc,%esp
  1056e5:	6a 03                	push   $0x3
  1056e7:	e8 34 fc ff ff       	call   105320 <tcb_get_prev>
  1056ec:	83 c4 10             	add    $0x10,%esp
  1056ef:	83 f8 02             	cmp    $0x2,%eax
  1056f2:	74 1c                	je     105710 <PTQueueInit_test2+0xa0>
    dprintf("test 2-b failed.\n");
  1056f4:	8d 83 d1 ad ff ff    	lea    -0x522f(%ebx),%eax
  1056fa:	83 ec 0c             	sub    $0xc,%esp
  1056fd:	50                   	push   %eax
  1056fe:	e8 01 cb ff ff       	call   102204 <dprintf>
    return 1;
  105703:	83 c4 10             	add    $0x10,%esp
  105706:	b8 01 00 00 00       	mov    $0x1,%eax
  10570b:	eb bc                	jmp    1056c9 <PTQueueInit_test2+0x59>
  10570d:	8d 76 00             	lea    0x0(%esi),%esi
  if (tcb_get_prev(3) != 2 || tcb_get_next(3) != 4) {
  105710:	83 ec 0c             	sub    $0xc,%esp
  105713:	6a 03                	push   $0x3
  105715:	e8 56 fc ff ff       	call   105370 <tcb_get_next>
  10571a:	83 c4 10             	add    $0x10,%esp
  10571d:	83 f8 04             	cmp    $0x4,%eax
  105720:	75 d2                	jne    1056f4 <PTQueueInit_test2+0x84>
  if (tcb_get_prev(4) != 3 || tcb_get_next(4) != NUM_IDS) {
  105722:	83 ec 0c             	sub    $0xc,%esp
  105725:	6a 04                	push   $0x4
  105727:	e8 f4 fb ff ff       	call   105320 <tcb_get_prev>
  10572c:	83 c4 10             	add    $0x10,%esp
  10572f:	83 f8 03             	cmp    $0x3,%eax
  105732:	74 1c                	je     105750 <PTQueueInit_test2+0xe0>
    dprintf("test 2-c failed.\n");
  105734:	8d 83 af ae ff ff    	lea    -0x5151(%ebx),%eax
  10573a:	83 ec 0c             	sub    $0xc,%esp
  10573d:	50                   	push   %eax
  10573e:	e8 c1 ca ff ff       	call   102204 <dprintf>
  105743:	83 c4 10             	add    $0x10,%esp
    return 1;
  105746:	b8 01 00 00 00       	mov    $0x1,%eax
  10574b:	e9 79 ff ff ff       	jmp    1056c9 <PTQueueInit_test2+0x59>
  if (tcb_get_prev(4) != 3 || tcb_get_next(4) != NUM_IDS) {
  105750:	83 ec 0c             	sub    $0xc,%esp
  105753:	6a 04                	push   $0x4
  105755:	e8 16 fc ff ff       	call   105370 <tcb_get_next>
  10575a:	83 c4 10             	add    $0x10,%esp
  10575d:	83 f8 40             	cmp    $0x40,%eax
  105760:	75 d2                	jne    105734 <PTQueueInit_test2+0xc4>
  tqueue_remove(0, 3);
  105762:	50                   	push   %eax
  105763:	50                   	push   %eax
  105764:	6a 03                	push   $0x3
  105766:	6a 00                	push   $0x0
  105768:	e8 73 fe ff ff       	call   1055e0 <tqueue_remove>
  if (tcb_get_prev(2) != NUM_IDS || tcb_get_next(2) != 4) {
  10576d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  105774:	e8 a7 fb ff ff       	call   105320 <tcb_get_prev>
  105779:	83 c4 10             	add    $0x10,%esp
  10577c:	83 f8 40             	cmp    $0x40,%eax
  10577f:	74 1c                	je     10579d <PTQueueInit_test2+0x12d>
    dprintf("test 2-d failed.\n");
  105781:	8d 83 c1 ae ff ff    	lea    -0x513f(%ebx),%eax
  105787:	83 ec 0c             	sub    $0xc,%esp
  10578a:	50                   	push   %eax
  10578b:	e8 74 ca ff ff       	call   102204 <dprintf>
  105790:	83 c4 10             	add    $0x10,%esp
    return 1;
  105793:	b8 01 00 00 00       	mov    $0x1,%eax
  105798:	e9 2c ff ff ff       	jmp    1056c9 <PTQueueInit_test2+0x59>
  if (tcb_get_prev(2) != NUM_IDS || tcb_get_next(2) != 4) {
  10579d:	83 ec 0c             	sub    $0xc,%esp
  1057a0:	6a 02                	push   $0x2
  1057a2:	e8 c9 fb ff ff       	call   105370 <tcb_get_next>
  1057a7:	83 c4 10             	add    $0x10,%esp
  1057aa:	83 f8 04             	cmp    $0x4,%eax
  1057ad:	75 d2                	jne    105781 <PTQueueInit_test2+0x111>
  if (tcb_get_prev(3) != NUM_IDS || tcb_get_next(3) != NUM_IDS) {
  1057af:	83 ec 0c             	sub    $0xc,%esp
  1057b2:	6a 03                	push   $0x3
  1057b4:	e8 67 fb ff ff       	call   105320 <tcb_get_prev>
  1057b9:	83 c4 10             	add    $0x10,%esp
  1057bc:	83 f8 40             	cmp    $0x40,%eax
  1057bf:	74 1c                	je     1057dd <PTQueueInit_test2+0x16d>
    dprintf("test 2-e failed.\n");
  1057c1:	8d 83 d3 ae ff ff    	lea    -0x512d(%ebx),%eax
  1057c7:	83 ec 0c             	sub    $0xc,%esp
  1057ca:	50                   	push   %eax
  1057cb:	e8 34 ca ff ff       	call   102204 <dprintf>
  1057d0:	83 c4 10             	add    $0x10,%esp
    return 1;
  1057d3:	b8 01 00 00 00       	mov    $0x1,%eax
  1057d8:	e9 ec fe ff ff       	jmp    1056c9 <PTQueueInit_test2+0x59>
  if (tcb_get_prev(3) != NUM_IDS || tcb_get_next(3) != NUM_IDS) {
  1057dd:	83 ec 0c             	sub    $0xc,%esp
  1057e0:	6a 03                	push   $0x3
  1057e2:	e8 89 fb ff ff       	call   105370 <tcb_get_next>
  1057e7:	83 c4 10             	add    $0x10,%esp
  1057ea:	83 f8 40             	cmp    $0x40,%eax
  1057ed:	75 d2                	jne    1057c1 <PTQueueInit_test2+0x151>
  if (tcb_get_prev(4) != 2 || tcb_get_next(4) != NUM_IDS) {
  1057ef:	83 ec 0c             	sub    $0xc,%esp
  1057f2:	6a 04                	push   $0x4
  1057f4:	e8 27 fb ff ff       	call   105320 <tcb_get_prev>
  1057f9:	83 c4 10             	add    $0x10,%esp
  1057fc:	83 f8 02             	cmp    $0x2,%eax
  1057ff:	74 1c                	je     10581d <PTQueueInit_test2+0x1ad>
    dprintf("test 2-f failed.\n");
  105801:	8d 83 e5 ae ff ff    	lea    -0x511b(%ebx),%eax
  105807:	83 ec 0c             	sub    $0xc,%esp
  10580a:	50                   	push   %eax
  10580b:	e8 f4 c9 ff ff       	call   102204 <dprintf>
  105810:	83 c4 10             	add    $0x10,%esp
    return 1;
  105813:	b8 01 00 00 00       	mov    $0x1,%eax
  105818:	e9 ac fe ff ff       	jmp    1056c9 <PTQueueInit_test2+0x59>
  if (tcb_get_prev(4) != 2 || tcb_get_next(4) != NUM_IDS) {
  10581d:	83 ec 0c             	sub    $0xc,%esp
  105820:	6a 04                	push   $0x4
  105822:	e8 49 fb ff ff       	call   105370 <tcb_get_next>
  105827:	83 c4 10             	add    $0x10,%esp
  10582a:	83 f8 40             	cmp    $0x40,%eax
  10582d:	75 d2                	jne    105801 <PTQueueInit_test2+0x191>
  pid = tqueue_dequeue(0);
  10582f:	83 ec 0c             	sub    $0xc,%esp
  105832:	6a 00                	push   $0x0
  105834:	e8 97 fd ff ff       	call   1055d0 <tqueue_dequeue>
  if (pid != 2 || tcb_get_prev(pid) != NUM_IDS || tcb_get_next(pid) != NUM_IDS
  105839:	83 c4 10             	add    $0x10,%esp
  10583c:	83 f8 02             	cmp    $0x2,%eax
  10583f:	74 1c                	je     10585d <PTQueueInit_test2+0x1ed>
    dprintf("test 2-g failed.\n");
  105841:	8d 83 f7 ae ff ff    	lea    -0x5109(%ebx),%eax
  105847:	83 ec 0c             	sub    $0xc,%esp
  10584a:	50                   	push   %eax
  10584b:	e8 b4 c9 ff ff       	call   102204 <dprintf>
  105850:	83 c4 10             	add    $0x10,%esp
    return 1;
  105853:	b8 01 00 00 00       	mov    $0x1,%eax
  105858:	e9 6c fe ff ff       	jmp    1056c9 <PTQueueInit_test2+0x59>
  if (pid != 2 || tcb_get_prev(pid) != NUM_IDS || tcb_get_next(pid) != NUM_IDS
  10585d:	83 ec 0c             	sub    $0xc,%esp
  105860:	6a 02                	push   $0x2
  105862:	e8 b9 fa ff ff       	call   105320 <tcb_get_prev>
  105867:	83 c4 10             	add    $0x10,%esp
  10586a:	83 f8 40             	cmp    $0x40,%eax
  10586d:	75 d2                	jne    105841 <PTQueueInit_test2+0x1d1>
  10586f:	83 ec 0c             	sub    $0xc,%esp
  105872:	6a 02                	push   $0x2
  105874:	e8 f7 fa ff ff       	call   105370 <tcb_get_next>
  105879:	83 c4 10             	add    $0x10,%esp
  10587c:	83 f8 40             	cmp    $0x40,%eax
  10587f:	75 c0                	jne    105841 <PTQueueInit_test2+0x1d1>
   || tqueue_get_head(0) != 4 || tqueue_get_tail(0) != 4) {
  105881:	83 ec 0c             	sub    $0xc,%esp
  105884:	6a 00                	push   $0x0
  105886:	e8 65 fc ff ff       	call   1054f0 <tqueue_get_head>
  10588b:	83 c4 10             	add    $0x10,%esp
  10588e:	83 f8 04             	cmp    $0x4,%eax
  105891:	75 ae                	jne    105841 <PTQueueInit_test2+0x1d1>
  105893:	83 ec 0c             	sub    $0xc,%esp
  105896:	6a 00                	push   $0x0
  105898:	e8 93 fc ff ff       	call   105530 <tqueue_get_tail>
  10589d:	83 c4 10             	add    $0x10,%esp
  1058a0:	83 f8 04             	cmp    $0x4,%eax
  1058a3:	75 9c                	jne    105841 <PTQueueInit_test2+0x1d1>
  dprintf("test 2 passed.\n");
  1058a5:	8d 83 29 ac ff ff    	lea    -0x53d7(%ebx),%eax
  1058ab:	83 ec 0c             	sub    $0xc,%esp
  1058ae:	50                   	push   %eax
  1058af:	e8 50 c9 ff ff       	call   102204 <dprintf>
  1058b4:	83 c4 10             	add    $0x10,%esp
  return 0;
  1058b7:	31 c0                	xor    %eax,%eax
  1058b9:	e9 0b fe ff ff       	jmp    1056c9 <PTQueueInit_test2+0x59>
  1058be:	66 90                	xchg   %ax,%ax

001058c0 <PTQueueInit_test_own>:
int PTQueueInit_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  1058c0:	31 c0                	xor    %eax,%eax
  1058c2:	c3                   	ret    
  1058c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1058c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001058d0 <test_PTQueueInit>:

int test_PTQueueInit()
{
  1058d0:	53                   	push   %ebx
  1058d1:	83 ec 08             	sub    $0x8,%esp
  return PTQueueInit_test1() + PTQueueInit_test2() + PTQueueInit_test_own();
  1058d4:	e8 17 fd ff ff       	call   1055f0 <PTQueueInit_test1>
  1058d9:	89 c3                	mov    %eax,%ebx
  1058db:	e8 90 fd ff ff       	call   105670 <PTQueueInit_test2>
}
  1058e0:	83 c4 08             	add    $0x8,%esp
  return PTQueueInit_test1() + PTQueueInit_test2() + PTQueueInit_test_own();
  1058e3:	01 d8                	add    %ebx,%eax
}
  1058e5:	5b                   	pop    %ebx
  1058e6:	c3                   	ret    
  1058e7:	66 90                	xchg   %ax,%ax
  1058e9:	66 90                	xchg   %ax,%ax
  1058eb:	66 90                	xchg   %ax,%ax
  1058ed:	66 90                	xchg   %ax,%ax
  1058ef:	90                   	nop

001058f0 <get_curid>:
unsigned int CURID;

unsigned int get_curid(void)
{
  1058f0:	e8 d8 b4 ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  1058f5:	05 0b 67 00 00       	add    $0x670b,%eax
	return CURID;
  1058fa:	c7 c0 08 0b df 00    	mov    $0xdf0b08,%eax
  105900:	8b 00                	mov    (%eax),%eax
}
  105902:	c3                   	ret    
  105903:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105910 <set_curid>:

void set_curid(unsigned int curid)
{
  105910:	e8 b8 b4 ff ff       	call   100dcd <__x86.get_pc_thunk.ax>
  105915:	05 eb 66 00 00       	add    $0x66eb,%eax
	CURID = curid;
  10591a:	8b 54 24 04          	mov    0x4(%esp),%edx
  10591e:	c7 c0 08 0b df 00    	mov    $0xdf0b08,%eax
  105924:	89 10                	mov    %edx,(%eax)
}
  105926:	c3                   	ret    
  105927:	66 90                	xchg   %ax,%ax
  105929:	66 90                	xchg   %ax,%ax
  10592b:	66 90                	xchg   %ax,%ax
  10592d:	66 90                	xchg   %ax,%ax
  10592f:	90                   	nop

00105930 <thread_init>:
#include <lib/thread.h>

#include "import.h"

void thread_init(unsigned int mbi_addr)
{
  105930:	53                   	push   %ebx
  105931:	e8 d9 a9 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  105936:	81 c3 ca 66 00 00    	add    $0x66ca,%ebx
  10593c:	83 ec 14             	sub    $0x14,%esp
	tqueue_init(mbi_addr);
  10593f:	ff 74 24 1c          	pushl  0x1c(%esp)
  105943:	e8 58 fc ff ff       	call   1055a0 <tqueue_init>
	set_curid(0);
  105948:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10594f:	e8 bc ff ff ff       	call   105910 <set_curid>
	tcb_set_state(0, TSTATE_RUN);
  105954:	58                   	pop    %eax
  105955:	5a                   	pop    %edx
  105956:	6a 01                	push   $0x1
  105958:	6a 00                	push   $0x0
  10595a:	e8 91 f9 ff ff       	call   1052f0 <tcb_set_state>
}
  10595f:	83 c4 18             	add    $0x18,%esp
  105962:	5b                   	pop    %ebx
  105963:	c3                   	ret    
  105964:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  10596a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00105970 <thread_spawn>:
  *  - import.h has all the functions you will need.
  *  Hint 2:
  *  - The ready queue is the queue with index NUM_IDS. 
  */
unsigned int thread_spawn(void *entry, unsigned int id, unsigned int quota)
{
  105970:	56                   	push   %esi
  105971:	53                   	push   %ebx
  105972:	e8 98 a9 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  105977:	81 c3 89 66 00 00    	add    $0x6689,%ebx
  10597d:	83 ec 08             	sub    $0x8,%esp
  // TODO
  unsigned int chid = kctx_new(entry, id, quota);
  105980:	ff 74 24 1c          	pushl  0x1c(%esp)
  105984:	ff 74 24 1c          	pushl  0x1c(%esp)
  105988:	ff 74 24 1c          	pushl  0x1c(%esp)
  10598c:	e8 3f f8 ff ff       	call   1051d0 <kctx_new>
  105991:	89 c6                	mov    %eax,%esi
  tcb_set_state(chid, TSTATE_READY);
  105993:	58                   	pop    %eax
  105994:	5a                   	pop    %edx
  105995:	6a 00                	push   $0x0
  105997:	56                   	push   %esi
  105998:	e8 53 f9 ff ff       	call   1052f0 <tcb_set_state>
  tqueue_enqueue(chid, NUM_IDS);
  10599d:	59                   	pop    %ecx
  10599e:	58                   	pop    %eax
  10599f:	6a 40                	push   $0x40
  1059a1:	56                   	push   %esi
  1059a2:	e8 19 fc ff ff       	call   1055c0 <tqueue_enqueue>
  
  return chid;
}
  1059a7:	83 c4 14             	add    $0x14,%esp
  1059aa:	89 f0                	mov    %esi,%eax
  1059ac:	5b                   	pop    %ebx
  1059ad:	5e                   	pop    %esi
  1059ae:	c3                   	ret    
  1059af:	90                   	nop

001059b0 <thread_yield>:
  *          i.e. The thread at the head of the ready queue is run next.
  *  Hint 2: If you are the only thread that is ready to run,
  *          do you need to switch to yourself?
  */
void thread_yield(void)
{
  1059b0:	57                   	push   %edi
  1059b1:	56                   	push   %esi
  1059b2:	53                   	push   %ebx
  1059b3:	e8 57 a9 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1059b8:	81 c3 48 66 00 00    	add    $0x6648,%ebx
  unsigned int curid, next; 

  // TODO
  // ...
  curid = get_curid();
  1059be:	e8 2d ff ff ff       	call   1058f0 <get_curid>
  tcb_set_state(curid, TSTATE_READY);
  1059c3:	83 ec 08             	sub    $0x8,%esp
  curid = get_curid();
  1059c6:	89 c7                	mov    %eax,%edi
  tcb_set_state(curid, TSTATE_READY);
  1059c8:	6a 00                	push   $0x0
  1059ca:	50                   	push   %eax
  1059cb:	e8 20 f9 ff ff       	call   1052f0 <tcb_set_state>
  tqueue_enqueue(curid, NUM_IDS);
  1059d0:	59                   	pop    %ecx
  1059d1:	5e                   	pop    %esi
  1059d2:	6a 40                	push   $0x40
  1059d4:	57                   	push   %edi
  1059d5:	e8 e6 fb ff ff       	call   1055c0 <tqueue_enqueue>
  
  next = tqueue_dequeue(NUM_IDS);
  1059da:	c7 04 24 40 00 00 00 	movl   $0x40,(%esp)
  1059e1:	e8 ea fb ff ff       	call   1055d0 <tqueue_dequeue>
  // Check to make sure there is another thread to yield to.
  if (next != NUM_IDS) {
  1059e6:	83 c4 10             	add    $0x10,%esp
  1059e9:	83 f8 40             	cmp    $0x40,%eax
  1059ec:	74 21                	je     105a0f <thread_yield+0x5f>
    // TODO
    // ...
    tcb_set_state(next, TSTATE_RUN);
  1059ee:	83 ec 08             	sub    $0x8,%esp
  1059f1:	89 c6                	mov    %eax,%esi
  1059f3:	6a 01                	push   $0x1
  1059f5:	50                   	push   %eax
  1059f6:	e8 f5 f8 ff ff       	call   1052f0 <tcb_set_state>
    set_curid(next);
  1059fb:	89 34 24             	mov    %esi,(%esp)
  1059fe:	e8 0d ff ff ff       	call   105910 <set_curid>

    // This performs the switch.
    kctx_switch(curid, next);
  105a03:	58                   	pop    %eax
  105a04:	5a                   	pop    %edx
  105a05:	56                   	push   %esi
  105a06:	57                   	push   %edi
  105a07:	e8 54 f7 ff ff       	call   105160 <kctx_switch>
  105a0c:	83 c4 10             	add    $0x10,%esp
  } 
}
  105a0f:	5b                   	pop    %ebx
  105a10:	5e                   	pop    %esi
  105a11:	5f                   	pop    %edi
  105a12:	c3                   	ret    
  105a13:	66 90                	xchg   %ax,%ax
  105a15:	66 90                	xchg   %ax,%ax
  105a17:	66 90                	xchg   %ax,%ax
  105a19:	66 90                	xchg   %ax,%ax
  105a1b:	66 90                	xchg   %ax,%ax
  105a1d:	66 90                	xchg   %ax,%ax
  105a1f:	90                   	nop

00105a20 <PThread_test1>:
#include <thread/PTCBIntro/export.h>
#include <thread/PTQueueIntro/export.h>
#include "export.h"

int PThread_test1()
{
  105a20:	56                   	push   %esi
  105a21:	53                   	push   %ebx
  105a22:	e8 e8 a8 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  105a27:	81 c3 d9 65 00 00    	add    $0x65d9,%ebx
  105a2d:	83 ec 08             	sub    $0x8,%esp
  void * dummy_addr = (void *) 0;
  unsigned int chid = thread_spawn(dummy_addr, 0, 1000);
  105a30:	68 e8 03 00 00       	push   $0x3e8
  105a35:	6a 00                	push   $0x0
  105a37:	6a 00                	push   $0x0
  105a39:	e8 32 ff ff ff       	call   105970 <thread_spawn>
  if (tcb_get_state(chid) != TSTATE_READY) {
  105a3e:	89 04 24             	mov    %eax,(%esp)
  unsigned int chid = thread_spawn(dummy_addr, 0, 1000);
  105a41:	89 c6                	mov    %eax,%esi
  if (tcb_get_state(chid) != TSTATE_READY) {
  105a43:	e8 88 f8 ff ff       	call   1052d0 <tcb_get_state>
  105a48:	83 c4 10             	add    $0x10,%esp
  105a4b:	85 c0                	test   %eax,%eax
  105a4d:	75 11                	jne    105a60 <PThread_test1+0x40>
    dprintf("test 1 failed.\n");
    return 1;
  }
  if (tqueue_get_tail(NUM_IDS) != chid) {
  105a4f:	83 ec 0c             	sub    $0xc,%esp
  105a52:	6a 40                	push   $0x40
  105a54:	e8 d7 fa ff ff       	call   105530 <tqueue_get_tail>
  105a59:	83 c4 10             	add    $0x10,%esp
  105a5c:	39 f0                	cmp    %esi,%eax
  105a5e:	74 20                	je     105a80 <PThread_test1+0x60>
    dprintf("test 1 failed.\n");
  105a60:	8d 83 f9 ab ff ff    	lea    -0x5407(%ebx),%eax
  105a66:	83 ec 0c             	sub    $0xc,%esp
  105a69:	50                   	push   %eax
  105a6a:	e8 95 c7 ff ff       	call   102204 <dprintf>
    return 1;
  105a6f:	83 c4 10             	add    $0x10,%esp
  105a72:	b8 01 00 00 00       	mov    $0x1,%eax
    dprintf("test 1 failed.\n");
    return 1;
  }
  dprintf("test 1 passed.\n");
  return 0;
}
  105a77:	83 c4 04             	add    $0x4,%esp
  105a7a:	5b                   	pop    %ebx
  105a7b:	5e                   	pop    %esi
  105a7c:	c3                   	ret    
  105a7d:	8d 76 00             	lea    0x0(%esi),%esi
  dprintf("test 1 passed.\n");
  105a80:	8d 83 09 ac ff ff    	lea    -0x53f7(%ebx),%eax
  105a86:	83 ec 0c             	sub    $0xc,%esp
  105a89:	50                   	push   %eax
  105a8a:	e8 75 c7 ff ff       	call   102204 <dprintf>
  return 0;
  105a8f:	83 c4 10             	add    $0x10,%esp
  105a92:	31 c0                	xor    %eax,%eax
}
  105a94:	83 c4 04             	add    $0x4,%esp
  105a97:	5b                   	pop    %ebx
  105a98:	5e                   	pop    %esi
  105a99:	c3                   	ret    
  105a9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105aa0 <PThread_test_own>:
int PThread_test_own()
{
  // TODO (optional)
  // dprintf("own test passed.\n");
  return 0;
}
  105aa0:	31 c0                	xor    %eax,%eax
  105aa2:	c3                   	ret    
  105aa3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105ab0 <test_PThread>:

int test_PThread()
{
  return PThread_test1() + PThread_test_own();
  105ab0:	e9 6b ff ff ff       	jmp    105a20 <PThread_test1>
  105ab5:	66 90                	xchg   %ax,%ax
  105ab7:	66 90                	xchg   %ax,%ax
  105ab9:	66 90                	xchg   %ax,%ax
  105abb:	66 90                	xchg   %ax,%ax
  105abd:	66 90                	xchg   %ax,%ax
  105abf:	90                   	nop

00105ac0 <proc_start_user>:
  *   - Set the page structures to the current user process.
  *   - call trap_return() with the pointer to the current process' user context.
  *     - User context's are stored in uctx_pool.
  */
void proc_start_user(void)
{
  105ac0:	56                   	push   %esi
  105ac1:	53                   	push   %ebx
  105ac2:	e8 48 a8 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  105ac7:	81 c3 39 65 00 00    	add    $0x6539,%ebx
  105acd:	83 ec 04             	sub    $0x4,%esp
	// TODO
  unsigned int curid = get_curid();
  105ad0:	e8 1b fe ff ff       	call   1058f0 <get_curid>
  tss_switch(curid);
  105ad5:	83 ec 0c             	sub    $0xc,%esp
  unsigned int curid = get_curid();
  105ad8:	89 c6                	mov    %eax,%esi
  tss_switch(curid);
  105ada:	50                   	push   %eax
  105adb:	e8 b7 cb ff ff       	call   102697 <tss_switch>
  set_pdir_base(curid);
  105ae0:	89 34 24             	mov    %esi,(%esp)
  105ae3:	e8 d8 e5 ff ff       	call   1040c0 <set_pdir_base>

  trap_return(&uctx_pool[curid]);
  105ae8:	6b f6 44             	imul   $0x44,%esi,%esi
  105aeb:	81 c6 20 0b df 00    	add    $0xdf0b20,%esi
  105af1:	89 34 24             	mov    %esi,(%esp)
  105af4:	e8 57 c3 ff ff       	call   101e50 <trap_return>
}
  105af9:	83 c4 14             	add    $0x14,%esp
  105afc:	5b                   	pop    %ebx
  105afd:	5e                   	pop    %esi
  105afe:	c3                   	ret    
  105aff:	90                   	nop

00105b00 <proc_create>:
  *           - The entry point for the given elf [elf_addr] can be retrieved using 
  *             elf_entry() function defined in elf.c
  *   4. Return: the pid of the new thread. 
  */
unsigned int proc_create(void *elf_addr, unsigned int quota)
{
  105b00:	55                   	push   %ebp
  105b01:	57                   	push   %edi
  105b02:	56                   	push   %esi
  105b03:	53                   	push   %ebx
  105b04:	e8 06 a8 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  105b09:	81 c3 f7 64 00 00    	add    $0x64f7,%ebx
  105b0f:	83 ec 0c             	sub    $0xc,%esp
  105b12:	8b 6c 24 20          	mov    0x20(%esp),%ebp
	  unsigned int pid, id;

    id = get_curid();
  105b16:	e8 d5 fd ff ff       	call   1058f0 <get_curid>
    pid = thread_spawn((void *) proc_start_user, id, quota);
  105b1b:	83 ec 04             	sub    $0x4,%esp
  105b1e:	ff 74 24 28          	pushl  0x28(%esp)
  105b22:	50                   	push   %eax
  105b23:	8d 83 c0 9a ff ff    	lea    -0x6540(%ebx),%eax
  105b29:	50                   	push   %eax
  105b2a:	e8 41 fe ff ff       	call   105970 <thread_spawn>
  105b2f:	89 c7                	mov    %eax,%edi

	  elf_load(elf_addr, pid);
  105b31:	58                   	pop    %eax
  105b32:	5a                   	pop    %edx
  105b33:	57                   	push   %edi
  105b34:	55                   	push   %ebp

    uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  105b35:	6b f7 44             	imul   $0x44,%edi,%esi
	  elf_load(elf_addr, pid);
  105b38:	e8 17 d5 ff ff       	call   103054 <elf_load>
    uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  105b3d:	81 c6 20 0b df 00    	add    $0xdf0b20,%esi
    uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  105b43:	b8 23 00 00 00       	mov    $0x23,%eax
    uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  105b48:	b9 23 00 00 00       	mov    $0x23,%ecx
    uctx_pool[pid].ds = CPU_GDT_UDATA | 3;
  105b4d:	66 89 46 24          	mov    %ax,0x24(%esi)
    uctx_pool[pid].cs = CPU_GDT_UCODE | 3;
  105b51:	b8 1b 00 00 00       	mov    $0x1b,%eax
    uctx_pool[pid].es = CPU_GDT_UDATA | 3;
  105b56:	66 89 4e 20          	mov    %cx,0x20(%esi)
    uctx_pool[pid].cs = CPU_GDT_UCODE | 3;
  105b5a:	66 89 46 34          	mov    %ax,0x34(%esi)
    uctx_pool[pid].ss = CPU_GDT_UDATA | 3;
  105b5e:	b8 23 00 00 00       	mov    $0x23,%eax
    uctx_pool[pid].esp = VM_USERHI;
  105b63:	c7 46 3c 00 00 00 f0 	movl   $0xf0000000,0x3c(%esi)
    uctx_pool[pid].ss = CPU_GDT_UDATA | 3;
  105b6a:	66 89 46 40          	mov    %ax,0x40(%esi)
    uctx_pool[pid].eflags = FL_IF;
  105b6e:	c7 46 38 00 02 00 00 	movl   $0x200,0x38(%esi)
    uctx_pool[pid].eip = elf_entry(elf_addr);
  105b75:	89 2c 24             	mov    %ebp,(%esp)
  105b78:	e8 b8 d6 ff ff       	call   103235 <elf_entry>
  105b7d:	89 46 30             	mov    %eax,0x30(%esi)

	  return pid;
}
  105b80:	83 c4 1c             	add    $0x1c,%esp
  105b83:	89 f8                	mov    %edi,%eax
  105b85:	5b                   	pop    %ebx
  105b86:	5e                   	pop    %esi
  105b87:	5f                   	pop    %edi
  105b88:	5d                   	pop    %ebp
  105b89:	c3                   	ret    
  105b8a:	66 90                	xchg   %ax,%ax
  105b8c:	66 90                	xchg   %ax,%ax
  105b8e:	66 90                	xchg   %ax,%ax

00105b90 <syscall_get_arg1>:

unsigned int syscall_get_arg1(void)
{
  // TODO
  return 0;
}
  105b90:	31 c0                	xor    %eax,%eax
  105b92:	c3                   	ret    
  105b93:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105ba0 <syscall_get_arg2>:
  105ba0:	31 c0                	xor    %eax,%eax
  105ba2:	c3                   	ret    
  105ba3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105bb0 <syscall_get_arg3>:
  105bb0:	31 c0                	xor    %eax,%eax
  105bb2:	c3                   	ret    
  105bb3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105bc0 <syscall_get_arg4>:
  105bc0:	31 c0                	xor    %eax,%eax
  105bc2:	c3                   	ret    
  105bc3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105bd0 <syscall_get_arg5>:
  105bd0:	31 c0                	xor    %eax,%eax
  105bd2:	c3                   	ret    
  105bd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105be0 <syscall_get_arg6>:
  105be0:	31 c0                	xor    %eax,%eax
  105be2:	c3                   	ret    
  105be3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105bf0 <syscall_set_errno>:
  *  - Set the err field of uctx_pool to errno.
  */
void syscall_set_errno(unsigned int errno)
{
  // TODO
}
  105bf0:	f3 c3                	repz ret 
  105bf2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105c00 <syscall_set_retval1>:
  105c00:	f3 c3                	repz ret 
  105c02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105c10 <syscall_set_retval2>:
  105c10:	f3 c3                	repz ret 
  105c12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105c20 <syscall_set_retval3>:
  105c20:	f3 c3                	repz ret 
  105c22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105c30 <syscall_set_retval4>:
  105c30:	f3 c3                	repz ret 
  105c32:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105c40 <syscall_set_retval5>:
  105c40:	f3 c3                	repz ret 
  105c42:	66 90                	xchg   %ax,%ax
  105c44:	66 90                	xchg   %ax,%ax
  105c46:	66 90                	xchg   %ax,%ax
  105c48:	66 90                	xchg   %ax,%ax
  105c4a:	66 90                	xchg   %ax,%ax
  105c4c:	66 90                	xchg   %ax,%ax
  105c4e:	66 90                	xchg   %ax,%ax

00105c50 <sys_puts>:
/**
 * Copies a string from user into buffer and prints it to the screen.
 * This is called by the user level "printf" library as a system call.
 */
void sys_puts(void)
{
  105c50:	55                   	push   %ebp
  105c51:	57                   	push   %edi
  105c52:	56                   	push   %esi
  105c53:	53                   	push   %ebx
  105c54:	e8 b6 a6 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  105c59:	81 c3 a7 63 00 00    	add    $0x63a7,%ebx
  105c5f:	83 ec 1c             	sub    $0x1c,%esp
	unsigned int cur_pid;
	unsigned int str_uva, str_len;
	unsigned int remain, cur_pos, nbytes;

	cur_pid = get_curid();
  105c62:	e8 89 fc ff ff       	call   1058f0 <get_curid>
  105c67:	89 c7                	mov    %eax,%edi
  105c69:	89 44 24 04          	mov    %eax,0x4(%esp)
	str_uva = syscall_get_arg2();
  105c6d:	e8 2e ff ff ff       	call   105ba0 <syscall_get_arg2>
  105c72:	89 c6                	mov    %eax,%esi
	str_len = syscall_get_arg3();
  105c74:	e8 37 ff ff ff       	call   105bb0 <syscall_get_arg3>

	if (!(VM_USERLO <= str_uva && str_uva + str_len <= VM_USERHI)) {
  105c79:	81 fe ff ff ff 3f    	cmp    $0x3fffffff,%esi
  105c7f:	0f 86 ab 00 00 00    	jbe    105d30 <sys_puts+0xe0>
  105c85:	89 c5                	mov    %eax,%ebp
  105c87:	8d 04 06             	lea    (%esi,%eax,1),%eax
  105c8a:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  105c8f:	0f 87 9b 00 00 00    	ja     105d30 <sys_puts+0xe0>
			nbytes = remain;
		else
			nbytes = PAGESIZE - 1;

		if (pt_copyin(cur_pid,
			      cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
  105c95:	8d 83 80 e4 81 00    	lea    0x81e480(%ebx),%eax
  105c9b:	c1 e7 0c             	shl    $0xc,%edi
  105c9e:	01 c7                	add    %eax,%edi
	while (remain) {
  105ca0:	85 ed                	test   %ebp,%ebp
			      cur_pos, sys_buf[cur_pid], nbytes) != nbytes) {
  105ca2:	89 44 24 0c          	mov    %eax,0xc(%esp)
			syscall_set_errno(E_MEM);
			return;
		}

		sys_buf[cur_pid][nbytes] = '\0';
  105ca6:	89 7c 24 08          	mov    %edi,0x8(%esp)
	while (remain) {
  105caa:	75 52                	jne    105cfe <sys_puts+0xae>
  105cac:	e9 bc 00 00 00       	jmp    105d6d <sys_puts+0x11d>
  105cb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
		if (pt_copyin(cur_pid,
  105cb8:	68 ff 0f 00 00       	push   $0xfff
  105cbd:	57                   	push   %edi
  105cbe:	56                   	push   %esi
  105cbf:	ff 74 24 10          	pushl  0x10(%esp)
  105cc3:	e8 fc d0 ff ff       	call   102dc4 <pt_copyin>
  105cc8:	83 c4 10             	add    $0x10,%esp
  105ccb:	3d ff 0f 00 00       	cmp    $0xfff,%eax
  105cd0:	75 47                	jne    105d19 <sys_puts+0xc9>
		sys_buf[cur_pid][nbytes] = '\0';
  105cd2:	8b 44 24 08          	mov    0x8(%esp),%eax
		KERN_INFO("%s", sys_buf[cur_pid]);
  105cd6:	83 ec 08             	sub    $0x8,%esp

		remain -= nbytes;
		cur_pos += nbytes;
  105cd9:	81 c6 ff 0f 00 00    	add    $0xfff,%esi
		sys_buf[cur_pid][nbytes] = '\0';
  105cdf:	c6 80 ff 0f 00 00 00 	movb   $0x0,0xfff(%eax)
		KERN_INFO("%s", sys_buf[cur_pid]);
  105ce6:	8d 83 ae a3 ff ff    	lea    -0x5c52(%ebx),%eax
  105cec:	57                   	push   %edi
  105ced:	50                   	push   %eax
  105cee:	e8 20 c3 ff ff       	call   102013 <debug_info>
	while (remain) {
  105cf3:	83 c4 10             	add    $0x10,%esp
  105cf6:	81 ed ff 0f 00 00    	sub    $0xfff,%ebp
  105cfc:	74 6f                	je     105d6d <sys_puts+0x11d>
		if (remain < PAGESIZE - 1)
  105cfe:	81 fd fe 0f 00 00    	cmp    $0xffe,%ebp
  105d04:	77 b2                	ja     105cb8 <sys_puts+0x68>
		if (pt_copyin(cur_pid,
  105d06:	55                   	push   %ebp
  105d07:	57                   	push   %edi
  105d08:	56                   	push   %esi
  105d09:	ff 74 24 10          	pushl  0x10(%esp)
  105d0d:	e8 b2 d0 ff ff       	call   102dc4 <pt_copyin>
  105d12:	83 c4 10             	add    $0x10,%esp
  105d15:	39 c5                	cmp    %eax,%ebp
  105d17:	74 2f                	je     105d48 <sys_puts+0xf8>
			syscall_set_errno(E_MEM);
  105d19:	83 ec 0c             	sub    $0xc,%esp
  105d1c:	6a 01                	push   $0x1
  105d1e:	e8 cd fe ff ff       	call   105bf0 <syscall_set_errno>
			return;
  105d23:	83 c4 10             	add    $0x10,%esp
	}

	syscall_set_errno(E_SUCC);
}
  105d26:	83 c4 1c             	add    $0x1c,%esp
  105d29:	5b                   	pop    %ebx
  105d2a:	5e                   	pop    %esi
  105d2b:	5f                   	pop    %edi
  105d2c:	5d                   	pop    %ebp
  105d2d:	c3                   	ret    
  105d2e:	66 90                	xchg   %ax,%ax
		syscall_set_errno(E_INVAL_ADDR);
  105d30:	83 ec 0c             	sub    $0xc,%esp
  105d33:	6a 04                	push   $0x4
  105d35:	e8 b6 fe ff ff       	call   105bf0 <syscall_set_errno>
		return;
  105d3a:	83 c4 10             	add    $0x10,%esp
}
  105d3d:	83 c4 1c             	add    $0x1c,%esp
  105d40:	5b                   	pop    %ebx
  105d41:	5e                   	pop    %esi
  105d42:	5f                   	pop    %edi
  105d43:	5d                   	pop    %ebp
  105d44:	c3                   	ret    
  105d45:	8d 76 00             	lea    0x0(%esi),%esi
		sys_buf[cur_pid][nbytes] = '\0';
  105d48:	8b 44 24 04          	mov    0x4(%esp),%eax
		KERN_INFO("%s", sys_buf[cur_pid]);
  105d4c:	83 ec 08             	sub    $0x8,%esp
		sys_buf[cur_pid][nbytes] = '\0';
  105d4f:	c1 e0 0c             	shl    $0xc,%eax
  105d52:	8d 14 28             	lea    (%eax,%ebp,1),%edx
  105d55:	8b 44 24 14          	mov    0x14(%esp),%eax
  105d59:	c6 04 10 00          	movb   $0x0,(%eax,%edx,1)
		KERN_INFO("%s", sys_buf[cur_pid]);
  105d5d:	8d 83 ae a3 ff ff    	lea    -0x5c52(%ebx),%eax
  105d63:	57                   	push   %edi
  105d64:	50                   	push   %eax
  105d65:	e8 a9 c2 ff ff       	call   102013 <debug_info>
  105d6a:	83 c4 10             	add    $0x10,%esp
	syscall_set_errno(E_SUCC);
  105d6d:	83 ec 0c             	sub    $0xc,%esp
  105d70:	6a 00                	push   $0x0
  105d72:	e8 79 fe ff ff       	call   105bf0 <syscall_set_errno>
  105d77:	83 c4 10             	add    $0x10,%esp
  105d7a:	eb c1                	jmp    105d3d <sys_puts+0xed>
  105d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105d80 <sys_spawn>:
  *  - If successful, retval1 = pid (return value of proc_create()) else NUM_IDS
  */
void sys_spawn(void)
{
  // TODO
}
  105d80:	f3 c3                	repz ret 
  105d82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105d90 <sys_yield>:
  105d90:	f3 c3                	repz ret 
  105d92:	66 90                	xchg   %ax,%ax
  105d94:	66 90                	xchg   %ax,%ax
  105d96:	66 90                	xchg   %ax,%ax
  105d98:	66 90                	xchg   %ax,%ax
  105d9a:	66 90                	xchg   %ax,%ax
  105d9c:	66 90                	xchg   %ax,%ax
  105d9e:	66 90                	xchg   %ax,%ax

00105da0 <syscall_dispatch>:
  *   
  */
void syscall_dispatch(void)
{
	// TODO
}
  105da0:	f3 c3                	repz ret 
  105da2:	66 90                	xchg   %ax,%ax
  105da4:	66 90                	xchg   %ax,%ax
  105da6:	66 90                	xchg   %ax,%ax
  105da8:	66 90                	xchg   %ax,%ax
  105daa:	66 90                	xchg   %ax,%ax
  105dac:	66 90                	xchg   %ax,%ax
  105dae:	66 90                	xchg   %ax,%ax

00105db0 <default_exception_handler>:
	KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->esp, tf->esp);
	KERN_DEBUG("\t%08x:\tss:    \t\t%08x\n", &tf->ss, tf->ss);
}

void default_exception_handler(void)
{
  105db0:	55                   	push   %ebp
  105db1:	57                   	push   %edi
  105db2:	56                   	push   %esi
  105db3:	53                   	push   %ebx
  105db4:	e8 56 a5 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  105db9:	81 c3 47 62 00 00    	add    $0x6247,%ebx
  105dbf:	83 ec 1c             	sub    $0x1c,%esp
	unsigned int cur_pid;

	cur_pid = get_curid();
  105dc2:	e8 29 fb ff ff       	call   1058f0 <get_curid>
  105dc7:	6b e8 44             	imul   $0x44,%eax,%ebp
	trap_dump(&uctx_pool[cur_pid]);
  105dca:	c7 c0 20 0b df 00    	mov    $0xdf0b20,%eax
	KERN_DEBUG("trapframe at %x\n", base);
  105dd0:	8d bb 90 b0 ff ff    	lea    -0x4f70(%ebx),%edi
	trap_dump(&uctx_pool[cur_pid]);
  105dd6:	8d 74 05 00          	lea    0x0(%ebp,%eax,1),%esi
  105dda:	89 44 24 08          	mov    %eax,0x8(%esp)
	KERN_DEBUG("trapframe at %x\n", base);
  105dde:	8d 83 09 af ff ff    	lea    -0x50f7(%ebx),%eax
  105de4:	56                   	push   %esi
  105de5:	50                   	push   %eax
  105de6:	6a 15                	push   $0x15
  105de8:	57                   	push   %edi
  105de9:	e8 4a c2 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\tedi:   \t\t%08x\n", &tf->regs.edi, tf->regs.edi);
  105dee:	58                   	pop    %eax
  105def:	8d 83 1a af ff ff    	lea    -0x50e6(%ebx),%eax
  105df5:	ff 36                	pushl  (%esi)
  105df7:	56                   	push   %esi
  105df8:	50                   	push   %eax
  105df9:	6a 16                	push   $0x16
  105dfb:	57                   	push   %edi
  105dfc:	e8 37 c2 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\tesi:   \t\t%08x\n", &tf->regs.esi, tf->regs.esi);
  105e01:	83 c4 14             	add    $0x14,%esp
  105e04:	ff 76 04             	pushl  0x4(%esi)
  105e07:	8b 44 24 18          	mov    0x18(%esp),%eax
  105e0b:	8d 44 05 04          	lea    0x4(%ebp,%eax,1),%eax
  105e0f:	50                   	push   %eax
  105e10:	8d 83 30 af ff ff    	lea    -0x50d0(%ebx),%eax
  105e16:	50                   	push   %eax
  105e17:	6a 17                	push   $0x17
  105e19:	57                   	push   %edi
  105e1a:	e8 19 c2 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\tebp:   \t\t%08x\n", &tf->regs.ebp, tf->regs.ebp);
  105e1f:	83 c4 14             	add    $0x14,%esp
  105e22:	ff 76 08             	pushl  0x8(%esi)
  105e25:	8b 44 24 18          	mov    0x18(%esp),%eax
  105e29:	8d 44 05 08          	lea    0x8(%ebp,%eax,1),%eax
  105e2d:	50                   	push   %eax
  105e2e:	8d 83 46 af ff ff    	lea    -0x50ba(%ebx),%eax
  105e34:	50                   	push   %eax
  105e35:	6a 18                	push   $0x18
  105e37:	57                   	push   %edi
  105e38:	e8 fb c1 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->regs.oesp, tf->regs.oesp);
  105e3d:	83 c4 14             	add    $0x14,%esp
  105e40:	ff 76 0c             	pushl  0xc(%esi)
  105e43:	8b 44 24 18          	mov    0x18(%esp),%eax
  105e47:	8d 44 05 0c          	lea    0xc(%ebp,%eax,1),%eax
  105e4b:	50                   	push   %eax
  105e4c:	8d 83 5c af ff ff    	lea    -0x50a4(%ebx),%eax
  105e52:	50                   	push   %eax
  105e53:	89 44 24 24          	mov    %eax,0x24(%esp)
  105e57:	6a 19                	push   $0x19
  105e59:	57                   	push   %edi
  105e5a:	e8 d9 c1 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\tebx:   \t\t%08x\n", &tf->regs.ebx, tf->regs.ebx);
  105e5f:	83 c4 14             	add    $0x14,%esp
  105e62:	ff 76 10             	pushl  0x10(%esi)
  105e65:	8b 44 24 18          	mov    0x18(%esp),%eax
  105e69:	8d 54 05 10          	lea    0x10(%ebp,%eax,1),%edx
  105e6d:	52                   	push   %edx
  105e6e:	8d 93 72 af ff ff    	lea    -0x508e(%ebx),%edx
  105e74:	52                   	push   %edx
  105e75:	6a 1a                	push   $0x1a
  105e77:	57                   	push   %edi
  105e78:	e8 bb c1 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\tedx:   \t\t%08x\n", &tf->regs.edx, tf->regs.edx);
  105e7d:	83 c4 14             	add    $0x14,%esp
  105e80:	ff 76 14             	pushl  0x14(%esi)
  105e83:	8b 44 24 18          	mov    0x18(%esp),%eax
  105e87:	8d 54 05 14          	lea    0x14(%ebp,%eax,1),%edx
  105e8b:	52                   	push   %edx
  105e8c:	8d 93 88 af ff ff    	lea    -0x5078(%ebx),%edx
  105e92:	52                   	push   %edx
  105e93:	6a 1b                	push   $0x1b
  105e95:	57                   	push   %edi
  105e96:	e8 9d c1 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\tecx:   \t\t%08x\n", &tf->regs.ecx, tf->regs.ecx);
  105e9b:	83 c4 14             	add    $0x14,%esp
  105e9e:	ff 76 18             	pushl  0x18(%esi)
  105ea1:	8b 44 24 18          	mov    0x18(%esp),%eax
  105ea5:	8d 54 05 18          	lea    0x18(%ebp,%eax,1),%edx
  105ea9:	52                   	push   %edx
  105eaa:	8d 93 9e af ff ff    	lea    -0x5062(%ebx),%edx
  105eb0:	52                   	push   %edx
  105eb1:	6a 1c                	push   $0x1c
  105eb3:	57                   	push   %edi
  105eb4:	e8 7f c1 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\teax:   \t\t%08x\n", &tf->regs.eax, tf->regs.eax);
  105eb9:	83 c4 14             	add    $0x14,%esp
  105ebc:	ff 76 1c             	pushl  0x1c(%esi)
  105ebf:	8b 44 24 18          	mov    0x18(%esp),%eax
  105ec3:	8d 54 05 1c          	lea    0x1c(%ebp,%eax,1),%edx
  105ec7:	52                   	push   %edx
  105ec8:	8d 93 b4 af ff ff    	lea    -0x504c(%ebx),%edx
  105ece:	52                   	push   %edx
  105ecf:	6a 1d                	push   $0x1d
  105ed1:	57                   	push   %edi
  105ed2:	e8 61 c1 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\tes:    \t\t%08x\n", &tf->es, tf->es);
  105ed7:	0f b7 56 20          	movzwl 0x20(%esi),%edx
  105edb:	83 c4 14             	add    $0x14,%esp
  105ede:	52                   	push   %edx
  105edf:	8b 44 24 18          	mov    0x18(%esp),%eax
  105ee3:	8d 54 05 20          	lea    0x20(%ebp,%eax,1),%edx
  105ee7:	52                   	push   %edx
  105ee8:	8d 93 ca af ff ff    	lea    -0x5036(%ebx),%edx
  105eee:	52                   	push   %edx
  105eef:	6a 1e                	push   $0x1e
  105ef1:	57                   	push   %edi
  105ef2:	e8 41 c1 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\tds:    \t\t%08x\n", &tf->ds, tf->ds);
  105ef7:	0f b7 56 24          	movzwl 0x24(%esi),%edx
  105efb:	83 c4 14             	add    $0x14,%esp
  105efe:	52                   	push   %edx
  105eff:	8b 44 24 18          	mov    0x18(%esp),%eax
  105f03:	8d 54 05 24          	lea    0x24(%ebp,%eax,1),%edx
  105f07:	52                   	push   %edx
  105f08:	8d 93 e0 af ff ff    	lea    -0x5020(%ebx),%edx
  105f0e:	52                   	push   %edx
  105f0f:	6a 1f                	push   $0x1f
  105f11:	57                   	push   %edi
  105f12:	e8 21 c1 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\ttrapno:\t\t%08x\n", &tf->trapno, tf->trapno);
  105f17:	83 c4 14             	add    $0x14,%esp
  105f1a:	ff 76 28             	pushl  0x28(%esi)
  105f1d:	8b 44 24 18          	mov    0x18(%esp),%eax
  105f21:	8d 54 05 28          	lea    0x28(%ebp,%eax,1),%edx
  105f25:	52                   	push   %edx
  105f26:	8d 93 f6 af ff ff    	lea    -0x500a(%ebx),%edx
  105f2c:	52                   	push   %edx
  105f2d:	6a 20                	push   $0x20
  105f2f:	57                   	push   %edi
  105f30:	e8 03 c1 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\terr:   \t\t%08x\n", &tf->err, tf->err);
  105f35:	83 c4 14             	add    $0x14,%esp
  105f38:	ff 76 2c             	pushl  0x2c(%esi)
  105f3b:	8b 44 24 18          	mov    0x18(%esp),%eax
  105f3f:	8d 54 05 2c          	lea    0x2c(%ebp,%eax,1),%edx
  105f43:	52                   	push   %edx
  105f44:	8d 93 0c b0 ff ff    	lea    -0x4ff4(%ebx),%edx
  105f4a:	52                   	push   %edx
  105f4b:	6a 21                	push   $0x21
  105f4d:	57                   	push   %edi
  105f4e:	e8 e5 c0 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\teip:   \t\t%08x\n", &tf->eip, tf->eip);
  105f53:	83 c4 14             	add    $0x14,%esp
  105f56:	ff 76 30             	pushl  0x30(%esi)
  105f59:	8b 44 24 18          	mov    0x18(%esp),%eax
  105f5d:	8d 54 05 30          	lea    0x30(%ebp,%eax,1),%edx
  105f61:	52                   	push   %edx
  105f62:	8d 93 22 b0 ff ff    	lea    -0x4fde(%ebx),%edx
  105f68:	52                   	push   %edx
  105f69:	6a 22                	push   $0x22
  105f6b:	57                   	push   %edi
  105f6c:	e8 c7 c0 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\tcs:    \t\t%08x\n", &tf->cs, tf->cs);
  105f71:	0f b7 56 34          	movzwl 0x34(%esi),%edx
  105f75:	83 c4 14             	add    $0x14,%esp
  105f78:	52                   	push   %edx
  105f79:	8b 44 24 18          	mov    0x18(%esp),%eax
  105f7d:	8d 54 05 34          	lea    0x34(%ebp,%eax,1),%edx
  105f81:	52                   	push   %edx
  105f82:	8d 93 38 b0 ff ff    	lea    -0x4fc8(%ebx),%edx
  105f88:	52                   	push   %edx
  105f89:	6a 23                	push   $0x23
  105f8b:	57                   	push   %edi
  105f8c:	e8 a7 c0 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\teflags:\t\t%08x\n", &tf->eflags, tf->eflags);
  105f91:	83 c4 14             	add    $0x14,%esp
  105f94:	ff 76 38             	pushl  0x38(%esi)
  105f97:	8b 44 24 18          	mov    0x18(%esp),%eax
  105f9b:	8d 54 05 38          	lea    0x38(%ebp,%eax,1),%edx
  105f9f:	52                   	push   %edx
  105fa0:	8d 93 4e b0 ff ff    	lea    -0x4fb2(%ebx),%edx
  105fa6:	52                   	push   %edx
  105fa7:	6a 24                	push   $0x24
  105fa9:	57                   	push   %edi
  105faa:	e8 89 c0 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\tesp:   \t\t%08x\n", &tf->esp, tf->esp);
  105faf:	83 c4 14             	add    $0x14,%esp
  105fb2:	ff 76 3c             	pushl  0x3c(%esi)
  105fb5:	8b 44 24 18          	mov    0x18(%esp),%eax
  105fb9:	8d 54 05 3c          	lea    0x3c(%ebp,%eax,1),%edx
  105fbd:	52                   	push   %edx
  105fbe:	8b 44 24 20          	mov    0x20(%esp),%eax
  105fc2:	50                   	push   %eax
  105fc3:	6a 25                	push   $0x25
  105fc5:	57                   	push   %edi
  105fc6:	e8 6d c0 ff ff       	call   102038 <debug_normal>
	KERN_DEBUG("\t%08x:\tss:    \t\t%08x\n", &tf->ss, tf->ss);
  105fcb:	0f b7 46 40          	movzwl 0x40(%esi),%eax
  105fcf:	83 c4 14             	add    $0x14,%esp
  105fd2:	50                   	push   %eax
  105fd3:	8b 44 24 18          	mov    0x18(%esp),%eax
  105fd7:	8d 44 05 40          	lea    0x40(%ebp,%eax,1),%eax
  105fdb:	50                   	push   %eax
  105fdc:	8d 83 64 b0 ff ff    	lea    -0x4f9c(%ebx),%eax
  105fe2:	50                   	push   %eax
  105fe3:	6a 26                	push   $0x26
  105fe5:	57                   	push   %edi
  105fe6:	e8 4d c0 ff ff       	call   102038 <debug_normal>

	KERN_PANIC("Trap %d @ 0x%08x.\n", uctx_pool[cur_pid].trapno, uctx_pool[cur_pid].eip);
  105feb:	8d 83 7a b0 ff ff    	lea    -0x4f86(%ebx),%eax
  105ff1:	83 c4 14             	add    $0x14,%esp
  105ff4:	ff 76 30             	pushl  0x30(%esi)
  105ff7:	ff 76 28             	pushl  0x28(%esi)
  105ffa:	50                   	push   %eax
  105ffb:	6a 30                	push   $0x30
  105ffd:	57                   	push   %edi
  105ffe:	e8 6e c0 ff ff       	call   102071 <debug_panic>
}
  106003:	83 c4 3c             	add    $0x3c,%esp
  106006:	5b                   	pop    %ebx
  106007:	5e                   	pop    %esi
  106008:	5f                   	pop    %edi
  106009:	5d                   	pop    %ebp
  10600a:	c3                   	ret    
  10600b:	90                   	nop
  10600c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00106010 <pgflt_handler>:

void pgflt_handler(void)
{
  106010:	55                   	push   %ebp
  106011:	57                   	push   %edi
  106012:	56                   	push   %esi
  106013:	53                   	push   %ebx
  106014:	e8 f6 a2 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  106019:	81 c3 e7 5f 00 00    	add    $0x5fe7,%ebx
  10601f:	83 ec 0c             	sub    $0xc,%esp
	unsigned int cur_pid;
	unsigned int errno;
	unsigned int fault_va;
	unsigned int pte_entry;

	cur_pid = get_curid();
  106022:	e8 c9 f8 ff ff       	call   1058f0 <get_curid>
  106027:	89 c7                	mov    %eax,%edi
	errno = uctx_pool[cur_pid].err;
  106029:	6b c0 44             	imul   $0x44,%eax,%eax
  10602c:	81 c0 20 0b df 00    	add    $0xdf0b20,%eax
  106032:	8b 70 2c             	mov    0x2c(%eax),%esi
	fault_va = rcr2();
  106035:	e8 00 ca ff ff       	call   102a3a <rcr2>
  10603a:	89 c5                	mov    %eax,%ebp
	 */

  //Uncomment this line if you need to see the information of the sequence of page faults occured.
	//KERN_DEBUG("Page fault: VA 0x%08x, errno 0x%08x, process %d, EIP 0x%08x.\n", fault_va, errno, cur_pid, uctx_pool[cur_pid].eip);

	if (errno & PFE_PR) {
  10603c:	f7 c6 01 00 00 00    	test   $0x1,%esi
  106042:	75 24                	jne    106068 <pgflt_handler+0x58>
		KERN_PANIC("Permission denied: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);
		return;
	}

	if (alloc_page(cur_pid, fault_va, PTE_W | PTE_U | PTE_P) == MagicNumber)
  106044:	83 ec 04             	sub    $0x4,%esp
  106047:	6a 07                	push   $0x7
  106049:	50                   	push   %eax
  10604a:	57                   	push   %edi
  10604b:	e8 f0 ee ff ff       	call   104f40 <alloc_page>
  106050:	83 c4 10             	add    $0x10,%esp
  106053:	3d 01 00 10 00       	cmp    $0x100001,%eax
  106058:	74 36                	je     106090 <pgflt_handler+0x80>
    KERN_PANIC("Page allocation failed: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);

}
  10605a:	83 c4 0c             	add    $0xc,%esp
  10605d:	5b                   	pop    %ebx
  10605e:	5e                   	pop    %esi
  10605f:	5f                   	pop    %edi
  106060:	5d                   	pop    %ebp
  106061:	c3                   	ret    
  106062:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
		KERN_PANIC("Permission denied: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);
  106068:	83 ec 0c             	sub    $0xc,%esp
  10606b:	56                   	push   %esi
  10606c:	50                   	push   %eax
  10606d:	8d 83 b8 b0 ff ff    	lea    -0x4f48(%ebx),%eax
  106073:	50                   	push   %eax
  106074:	8d 83 90 b0 ff ff    	lea    -0x4f70(%ebx),%eax
  10607a:	6a 47                	push   $0x47
  10607c:	50                   	push   %eax
  10607d:	e8 ef bf ff ff       	call   102071 <debug_panic>
		return;
  106082:	83 c4 20             	add    $0x20,%esp
}
  106085:	83 c4 0c             	add    $0xc,%esp
  106088:	5b                   	pop    %ebx
  106089:	5e                   	pop    %esi
  10608a:	5f                   	pop    %edi
  10608b:	5d                   	pop    %ebp
  10608c:	c3                   	ret    
  10608d:	8d 76 00             	lea    0x0(%esi),%esi
    KERN_PANIC("Page allocation failed: va = 0x%08x, errno = 0x%08x.\n", fault_va, errno);
  106090:	8d 83 ec b0 ff ff    	lea    -0x4f14(%ebx),%eax
  106096:	83 ec 0c             	sub    $0xc,%esp
  106099:	56                   	push   %esi
  10609a:	55                   	push   %ebp
  10609b:	50                   	push   %eax
  10609c:	8d 83 90 b0 ff ff    	lea    -0x4f70(%ebx),%eax
  1060a2:	6a 4c                	push   $0x4c
  1060a4:	50                   	push   %eax
  1060a5:	e8 c7 bf ff ff       	call   102071 <debug_panic>
  1060aa:	83 c4 20             	add    $0x20,%esp
}
  1060ad:	83 c4 0c             	add    $0xc,%esp
  1060b0:	5b                   	pop    %ebx
  1060b1:	5e                   	pop    %esi
  1060b2:	5f                   	pop    %edi
  1060b3:	5d                   	pop    %ebp
  1060b4:	c3                   	ret    
  1060b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1060b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001060c0 <exception_handler>:

void exception_handler(void)
{
  1060c0:	53                   	push   %ebx
  1060c1:	e8 49 a2 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  1060c6:	81 c3 3a 5f 00 00    	add    $0x5f3a,%ebx
  1060cc:	83 ec 08             	sub    $0x8,%esp
    unsigned int curid, syscall_num; 
  
    curid = get_curid();
  1060cf:	e8 1c f8 ff ff       	call   1058f0 <get_curid>
    syscall_num = uctx_pool[curid].trapno;
  1060d4:	6b c0 44             	imul   $0x44,%eax,%eax
  1060d7:	81 c0 20 0b df 00    	add    $0xdf0b20,%eax
  
    switch (syscall_num) {
  1060dd:	83 78 28 0e          	cmpl   $0xe,0x28(%eax)
  1060e1:	74 0d                	je     1060f0 <exception_handler+0x30>
        break;
  
      default: 
        default_exception_handler();
   }
}
  1060e3:	83 c4 08             	add    $0x8,%esp
  1060e6:	5b                   	pop    %ebx
        default_exception_handler();
  1060e7:	e9 c4 fc ff ff       	jmp    105db0 <default_exception_handler>
  1060ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
  1060f0:	83 c4 08             	add    $0x8,%esp
  1060f3:	5b                   	pop    %ebx
        pgflt_handler();
  1060f4:	e9 17 ff ff ff       	jmp    106010 <pgflt_handler>
  1060f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00106100 <interrupt_handler>:
    intr_eoi ();
    return 0;
}

void interrupt_handler (void)
{
  106100:	53                   	push   %ebx
  106101:	e8 09 a2 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  106106:	81 c3 fa 5e 00 00    	add    $0x5efa,%ebx
  10610c:	83 ec 08             	sub    $0x8,%esp
    unsigned int curid, intr;
  
    curid = get_curid();
  10610f:	e8 dc f7 ff ff       	call   1058f0 <get_curid>
    intr = uctx_pool[curid].trapno;
  106114:	6b c0 44             	imul   $0x44,%eax,%eax
  106117:	81 c0 20 0b df 00    	add    $0xdf0b20,%eax
  
    // dprintf("interrupt handler: intr = %d", intr);
  
    switch (intr) {
  10611d:	83 78 28 27          	cmpl   $0x27,0x28(%eax)
  106121:	74 05                	je     106128 <interrupt_handler+0x28>
    intr_eoi ();
  106123:	e8 40 b5 ff ff       	call   101668 <intr_eoi>
        break;
  
      default:
        default_intr_handler();
  }
}
  106128:	83 c4 08             	add    $0x8,%esp
  10612b:	5b                   	pop    %ebx
  10612c:	c3                   	ret    
  10612d:	8d 76 00             	lea    0x0(%esi),%esi

00106130 <trap>:
  * 
  *  Hint: 
  *  - Please look at _alltraps functions in idt.S
  */
void trap (tf_t *tf)
{
  106130:	53                   	push   %ebx
  106131:	e8 d9 a1 ff ff       	call   10030f <__x86.get_pc_thunk.bx>
  106136:	81 c3 ca 5e 00 00    	add    $0x5eca,%ebx
  10613c:	83 ec 08             	sub    $0x8,%esp
    // TODO

	  // Trap handled: call proc_start_user() to initiate return from trap.
    proc_start_user (); 
  10613f:	e8 7c f9 ff ff       	call   105ac0 <proc_start_user>
}
  106144:	83 c4 08             	add    $0x8,%esp
  106147:	5b                   	pop    %ebx
  106148:	c3                   	ret    
  106149:	66 90                	xchg   %ax,%ax
  10614b:	66 90                	xchg   %ax,%ax
  10614d:	66 90                	xchg   %ax,%ax
  10614f:	90                   	nop

00106150 <__udivdi3>:
  106150:	55                   	push   %ebp
  106151:	57                   	push   %edi
  106152:	56                   	push   %esi
  106153:	53                   	push   %ebx
  106154:	83 ec 1c             	sub    $0x1c,%esp
  106157:	8b 54 24 3c          	mov    0x3c(%esp),%edx
  10615b:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  10615f:	8b 74 24 34          	mov    0x34(%esp),%esi
  106163:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  106167:	85 d2                	test   %edx,%edx
  106169:	75 35                	jne    1061a0 <__udivdi3+0x50>
  10616b:	39 f3                	cmp    %esi,%ebx
  10616d:	0f 87 bd 00 00 00    	ja     106230 <__udivdi3+0xe0>
  106173:	85 db                	test   %ebx,%ebx
  106175:	89 d9                	mov    %ebx,%ecx
  106177:	75 0b                	jne    106184 <__udivdi3+0x34>
  106179:	b8 01 00 00 00       	mov    $0x1,%eax
  10617e:	31 d2                	xor    %edx,%edx
  106180:	f7 f3                	div    %ebx
  106182:	89 c1                	mov    %eax,%ecx
  106184:	31 d2                	xor    %edx,%edx
  106186:	89 f0                	mov    %esi,%eax
  106188:	f7 f1                	div    %ecx
  10618a:	89 c6                	mov    %eax,%esi
  10618c:	89 e8                	mov    %ebp,%eax
  10618e:	89 f7                	mov    %esi,%edi
  106190:	f7 f1                	div    %ecx
  106192:	89 fa                	mov    %edi,%edx
  106194:	83 c4 1c             	add    $0x1c,%esp
  106197:	5b                   	pop    %ebx
  106198:	5e                   	pop    %esi
  106199:	5f                   	pop    %edi
  10619a:	5d                   	pop    %ebp
  10619b:	c3                   	ret    
  10619c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1061a0:	39 f2                	cmp    %esi,%edx
  1061a2:	77 7c                	ja     106220 <__udivdi3+0xd0>
  1061a4:	0f bd fa             	bsr    %edx,%edi
  1061a7:	83 f7 1f             	xor    $0x1f,%edi
  1061aa:	0f 84 98 00 00 00    	je     106248 <__udivdi3+0xf8>
  1061b0:	89 f9                	mov    %edi,%ecx
  1061b2:	b8 20 00 00 00       	mov    $0x20,%eax
  1061b7:	29 f8                	sub    %edi,%eax
  1061b9:	d3 e2                	shl    %cl,%edx
  1061bb:	89 54 24 08          	mov    %edx,0x8(%esp)
  1061bf:	89 c1                	mov    %eax,%ecx
  1061c1:	89 da                	mov    %ebx,%edx
  1061c3:	d3 ea                	shr    %cl,%edx
  1061c5:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  1061c9:	09 d1                	or     %edx,%ecx
  1061cb:	89 f2                	mov    %esi,%edx
  1061cd:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  1061d1:	89 f9                	mov    %edi,%ecx
  1061d3:	d3 e3                	shl    %cl,%ebx
  1061d5:	89 c1                	mov    %eax,%ecx
  1061d7:	d3 ea                	shr    %cl,%edx
  1061d9:	89 f9                	mov    %edi,%ecx
  1061db:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1061df:	d3 e6                	shl    %cl,%esi
  1061e1:	89 eb                	mov    %ebp,%ebx
  1061e3:	89 c1                	mov    %eax,%ecx
  1061e5:	d3 eb                	shr    %cl,%ebx
  1061e7:	09 de                	or     %ebx,%esi
  1061e9:	89 f0                	mov    %esi,%eax
  1061eb:	f7 74 24 08          	divl   0x8(%esp)
  1061ef:	89 d6                	mov    %edx,%esi
  1061f1:	89 c3                	mov    %eax,%ebx
  1061f3:	f7 64 24 0c          	mull   0xc(%esp)
  1061f7:	39 d6                	cmp    %edx,%esi
  1061f9:	72 0c                	jb     106207 <__udivdi3+0xb7>
  1061fb:	89 f9                	mov    %edi,%ecx
  1061fd:	d3 e5                	shl    %cl,%ebp
  1061ff:	39 c5                	cmp    %eax,%ebp
  106201:	73 5d                	jae    106260 <__udivdi3+0x110>
  106203:	39 d6                	cmp    %edx,%esi
  106205:	75 59                	jne    106260 <__udivdi3+0x110>
  106207:	8d 43 ff             	lea    -0x1(%ebx),%eax
  10620a:	31 ff                	xor    %edi,%edi
  10620c:	89 fa                	mov    %edi,%edx
  10620e:	83 c4 1c             	add    $0x1c,%esp
  106211:	5b                   	pop    %ebx
  106212:	5e                   	pop    %esi
  106213:	5f                   	pop    %edi
  106214:	5d                   	pop    %ebp
  106215:	c3                   	ret    
  106216:	8d 76 00             	lea    0x0(%esi),%esi
  106219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  106220:	31 ff                	xor    %edi,%edi
  106222:	31 c0                	xor    %eax,%eax
  106224:	89 fa                	mov    %edi,%edx
  106226:	83 c4 1c             	add    $0x1c,%esp
  106229:	5b                   	pop    %ebx
  10622a:	5e                   	pop    %esi
  10622b:	5f                   	pop    %edi
  10622c:	5d                   	pop    %ebp
  10622d:	c3                   	ret    
  10622e:	66 90                	xchg   %ax,%ax
  106230:	31 ff                	xor    %edi,%edi
  106232:	89 e8                	mov    %ebp,%eax
  106234:	89 f2                	mov    %esi,%edx
  106236:	f7 f3                	div    %ebx
  106238:	89 fa                	mov    %edi,%edx
  10623a:	83 c4 1c             	add    $0x1c,%esp
  10623d:	5b                   	pop    %ebx
  10623e:	5e                   	pop    %esi
  10623f:	5f                   	pop    %edi
  106240:	5d                   	pop    %ebp
  106241:	c3                   	ret    
  106242:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  106248:	39 f2                	cmp    %esi,%edx
  10624a:	72 06                	jb     106252 <__udivdi3+0x102>
  10624c:	31 c0                	xor    %eax,%eax
  10624e:	39 eb                	cmp    %ebp,%ebx
  106250:	77 d2                	ja     106224 <__udivdi3+0xd4>
  106252:	b8 01 00 00 00       	mov    $0x1,%eax
  106257:	eb cb                	jmp    106224 <__udivdi3+0xd4>
  106259:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  106260:	89 d8                	mov    %ebx,%eax
  106262:	31 ff                	xor    %edi,%edi
  106264:	eb be                	jmp    106224 <__udivdi3+0xd4>
  106266:	66 90                	xchg   %ax,%ax
  106268:	66 90                	xchg   %ax,%ax
  10626a:	66 90                	xchg   %ax,%ax
  10626c:	66 90                	xchg   %ax,%ax
  10626e:	66 90                	xchg   %ax,%ax

00106270 <__umoddi3>:
  106270:	55                   	push   %ebp
  106271:	57                   	push   %edi
  106272:	56                   	push   %esi
  106273:	53                   	push   %ebx
  106274:	83 ec 1c             	sub    $0x1c,%esp
  106277:	8b 6c 24 3c          	mov    0x3c(%esp),%ebp
  10627b:	8b 74 24 30          	mov    0x30(%esp),%esi
  10627f:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  106283:	8b 7c 24 38          	mov    0x38(%esp),%edi
  106287:	85 ed                	test   %ebp,%ebp
  106289:	89 f0                	mov    %esi,%eax
  10628b:	89 da                	mov    %ebx,%edx
  10628d:	75 19                	jne    1062a8 <__umoddi3+0x38>
  10628f:	39 df                	cmp    %ebx,%edi
  106291:	0f 86 b1 00 00 00    	jbe    106348 <__umoddi3+0xd8>
  106297:	f7 f7                	div    %edi
  106299:	89 d0                	mov    %edx,%eax
  10629b:	31 d2                	xor    %edx,%edx
  10629d:	83 c4 1c             	add    $0x1c,%esp
  1062a0:	5b                   	pop    %ebx
  1062a1:	5e                   	pop    %esi
  1062a2:	5f                   	pop    %edi
  1062a3:	5d                   	pop    %ebp
  1062a4:	c3                   	ret    
  1062a5:	8d 76 00             	lea    0x0(%esi),%esi
  1062a8:	39 dd                	cmp    %ebx,%ebp
  1062aa:	77 f1                	ja     10629d <__umoddi3+0x2d>
  1062ac:	0f bd cd             	bsr    %ebp,%ecx
  1062af:	83 f1 1f             	xor    $0x1f,%ecx
  1062b2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  1062b6:	0f 84 b4 00 00 00    	je     106370 <__umoddi3+0x100>
  1062bc:	b8 20 00 00 00       	mov    $0x20,%eax
  1062c1:	89 c2                	mov    %eax,%edx
  1062c3:	8b 44 24 04          	mov    0x4(%esp),%eax
  1062c7:	29 c2                	sub    %eax,%edx
  1062c9:	89 c1                	mov    %eax,%ecx
  1062cb:	89 f8                	mov    %edi,%eax
  1062cd:	d3 e5                	shl    %cl,%ebp
  1062cf:	89 d1                	mov    %edx,%ecx
  1062d1:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1062d5:	d3 e8                	shr    %cl,%eax
  1062d7:	09 c5                	or     %eax,%ebp
  1062d9:	8b 44 24 04          	mov    0x4(%esp),%eax
  1062dd:	89 c1                	mov    %eax,%ecx
  1062df:	d3 e7                	shl    %cl,%edi
  1062e1:	89 d1                	mov    %edx,%ecx
  1062e3:	89 7c 24 08          	mov    %edi,0x8(%esp)
  1062e7:	89 df                	mov    %ebx,%edi
  1062e9:	d3 ef                	shr    %cl,%edi
  1062eb:	89 c1                	mov    %eax,%ecx
  1062ed:	89 f0                	mov    %esi,%eax
  1062ef:	d3 e3                	shl    %cl,%ebx
  1062f1:	89 d1                	mov    %edx,%ecx
  1062f3:	89 fa                	mov    %edi,%edx
  1062f5:	d3 e8                	shr    %cl,%eax
  1062f7:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  1062fc:	09 d8                	or     %ebx,%eax
  1062fe:	f7 f5                	div    %ebp
  106300:	d3 e6                	shl    %cl,%esi
  106302:	89 d1                	mov    %edx,%ecx
  106304:	f7 64 24 08          	mull   0x8(%esp)
  106308:	39 d1                	cmp    %edx,%ecx
  10630a:	89 c3                	mov    %eax,%ebx
  10630c:	89 d7                	mov    %edx,%edi
  10630e:	72 06                	jb     106316 <__umoddi3+0xa6>
  106310:	75 0e                	jne    106320 <__umoddi3+0xb0>
  106312:	39 c6                	cmp    %eax,%esi
  106314:	73 0a                	jae    106320 <__umoddi3+0xb0>
  106316:	2b 44 24 08          	sub    0x8(%esp),%eax
  10631a:	19 ea                	sbb    %ebp,%edx
  10631c:	89 d7                	mov    %edx,%edi
  10631e:	89 c3                	mov    %eax,%ebx
  106320:	89 ca                	mov    %ecx,%edx
  106322:	0f b6 4c 24 0c       	movzbl 0xc(%esp),%ecx
  106327:	29 de                	sub    %ebx,%esi
  106329:	19 fa                	sbb    %edi,%edx
  10632b:	8b 5c 24 04          	mov    0x4(%esp),%ebx
  10632f:	89 d0                	mov    %edx,%eax
  106331:	d3 e0                	shl    %cl,%eax
  106333:	89 d9                	mov    %ebx,%ecx
  106335:	d3 ee                	shr    %cl,%esi
  106337:	d3 ea                	shr    %cl,%edx
  106339:	09 f0                	or     %esi,%eax
  10633b:	83 c4 1c             	add    $0x1c,%esp
  10633e:	5b                   	pop    %ebx
  10633f:	5e                   	pop    %esi
  106340:	5f                   	pop    %edi
  106341:	5d                   	pop    %ebp
  106342:	c3                   	ret    
  106343:	90                   	nop
  106344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  106348:	85 ff                	test   %edi,%edi
  10634a:	89 f9                	mov    %edi,%ecx
  10634c:	75 0b                	jne    106359 <__umoddi3+0xe9>
  10634e:	b8 01 00 00 00       	mov    $0x1,%eax
  106353:	31 d2                	xor    %edx,%edx
  106355:	f7 f7                	div    %edi
  106357:	89 c1                	mov    %eax,%ecx
  106359:	89 d8                	mov    %ebx,%eax
  10635b:	31 d2                	xor    %edx,%edx
  10635d:	f7 f1                	div    %ecx
  10635f:	89 f0                	mov    %esi,%eax
  106361:	f7 f1                	div    %ecx
  106363:	e9 31 ff ff ff       	jmp    106299 <__umoddi3+0x29>
  106368:	90                   	nop
  106369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  106370:	39 dd                	cmp    %ebx,%ebp
  106372:	72 08                	jb     10637c <__umoddi3+0x10c>
  106374:	39 f7                	cmp    %esi,%edi
  106376:	0f 87 21 ff ff ff    	ja     10629d <__umoddi3+0x2d>
  10637c:	89 da                	mov    %ebx,%edx
  10637e:	89 f0                	mov    %esi,%eax
  106380:	29 f8                	sub    %edi,%eax
  106382:	19 ea                	sbb    %ebp,%edx
  106384:	e9 14 ff ff ff       	jmp    10629d <__umoddi3+0x2d>
