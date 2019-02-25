
obj/kern/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <video_init>:
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	53                   	push   %ebx
  100004:	83 ec 14             	sub    $0x14,%esp
  100007:	e8 07 04 00 00       	call   100413 <__x86.get_pc_thunk.bx>
  10000c:	81 c3 f4 8f 00 00    	add    $0x8ff4,%ebx
  100012:	c7 45 f4 00 80 0b 00 	movl   $0xb8000,-0xc(%ebp)
  100019:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10001c:	0f b7 00             	movzwl (%eax),%eax
  10001f:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  100023:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100026:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
  10002b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10002e:	0f b7 00             	movzwl (%eax),%eax
  100031:	66 3d 5a a5          	cmp    $0xa55a,%ax
  100035:	74 30                	je     100067 <video_init+0x67>
  100037:	c7 45 f4 00 00 0b 00 	movl   $0xb0000,-0xc(%ebp)
  10003e:	c7 c0 8c 14 91 00    	mov    $0x91148c,%eax
  100044:	c7 00 b4 03 00 00    	movl   $0x3b4,(%eax)
  10004a:	c7 c0 8c 14 91 00    	mov    $0x91148c,%eax
  100050:	8b 00                	mov    (%eax),%eax
  100052:	83 ec 08             	sub    $0x8,%esp
  100055:	50                   	push   %eax
  100056:	8d 83 cc ce ff ff    	lea    -0x3134(%ebx),%eax
  10005c:	50                   	push   %eax
  10005d:	e8 16 33 00 00       	call   103378 <dprintf>
  100062:	83 c4 10             	add    $0x10,%esp
  100065:	eb 31                	jmp    100098 <video_init+0x98>
  100067:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10006a:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10006e:	66 89 10             	mov    %dx,(%eax)
  100071:	c7 c0 8c 14 91 00    	mov    $0x91148c,%eax
  100077:	c7 00 d4 03 00 00    	movl   $0x3d4,(%eax)
  10007d:	c7 c0 8c 14 91 00    	mov    $0x91148c,%eax
  100083:	8b 00                	mov    (%eax),%eax
  100085:	83 ec 08             	sub    $0x8,%esp
  100088:	50                   	push   %eax
  100089:	8d 83 cc ce ff ff    	lea    -0x3134(%ebx),%eax
  10008f:	50                   	push   %eax
  100090:	e8 e3 32 00 00       	call   103378 <dprintf>
  100095:	83 c4 10             	add    $0x10,%esp
  100098:	c7 c0 8c 14 91 00    	mov    $0x91148c,%eax
  10009e:	8b 00                	mov    (%eax),%eax
  1000a0:	83 ec 08             	sub    $0x8,%esp
  1000a3:	6a 0e                	push   $0xe
  1000a5:	50                   	push   %eax
  1000a6:	e8 cd 40 00 00       	call   104178 <outb>
  1000ab:	83 c4 10             	add    $0x10,%esp
  1000ae:	c7 c0 8c 14 91 00    	mov    $0x91148c,%eax
  1000b4:	8b 00                	mov    (%eax),%eax
  1000b6:	83 c0 01             	add    $0x1,%eax
  1000b9:	83 ec 0c             	sub    $0xc,%esp
  1000bc:	50                   	push   %eax
  1000bd:	e8 67 40 00 00       	call   104129 <inb>
  1000c2:	83 c4 10             	add    $0x10,%esp
  1000c5:	0f b6 c0             	movzbl %al,%eax
  1000c8:	c1 e0 08             	shl    $0x8,%eax
  1000cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1000ce:	c7 c0 8c 14 91 00    	mov    $0x91148c,%eax
  1000d4:	8b 00                	mov    (%eax),%eax
  1000d6:	83 ec 08             	sub    $0x8,%esp
  1000d9:	6a 0f                	push   $0xf
  1000db:	50                   	push   %eax
  1000dc:	e8 97 40 00 00       	call   104178 <outb>
  1000e1:	83 c4 10             	add    $0x10,%esp
  1000e4:	c7 c0 8c 14 91 00    	mov    $0x91148c,%eax
  1000ea:	8b 00                	mov    (%eax),%eax
  1000ec:	83 c0 01             	add    $0x1,%eax
  1000ef:	83 ec 0c             	sub    $0xc,%esp
  1000f2:	50                   	push   %eax
  1000f3:	e8 31 40 00 00       	call   104129 <inb>
  1000f8:	83 c4 10             	add    $0x10,%esp
  1000fb:	0f b6 c0             	movzbl %al,%eax
  1000fe:	09 45 ec             	or     %eax,-0x14(%ebp)
  100101:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  100107:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10010a:	89 10                	mov    %edx,(%eax)
  10010c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10010f:	89 c2                	mov    %eax,%edx
  100111:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  100117:	66 89 50 04          	mov    %dx,0x4(%eax)
  10011b:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  100121:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
  100128:	90                   	nop
  100129:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10012c:	c9                   	leave  
  10012d:	c3                   	ret    

0010012e <video_putc>:
  10012e:	55                   	push   %ebp
  10012f:	89 e5                	mov    %esp,%ebp
  100131:	56                   	push   %esi
  100132:	53                   	push   %ebx
  100133:	83 ec 10             	sub    $0x10,%esp
  100136:	e8 d8 02 00 00       	call   100413 <__x86.get_pc_thunk.bx>
  10013b:	81 c3 c5 8e 00 00    	add    $0x8ec5,%ebx
  100141:	8b 45 08             	mov    0x8(%ebp),%eax
  100144:	b0 00                	mov    $0x0,%al
  100146:	85 c0                	test   %eax,%eax
  100148:	75 07                	jne    100151 <video_putc+0x23>
  10014a:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
  100151:	8b 45 08             	mov    0x8(%ebp),%eax
  100154:	0f b6 c0             	movzbl %al,%eax
  100157:	83 f8 09             	cmp    $0x9,%eax
  10015a:	0f 84 d0 00 00 00    	je     100230 <video_putc+0x102>
  100160:	83 f8 09             	cmp    $0x9,%eax
  100163:	7f 0a                	jg     10016f <video_putc+0x41>
  100165:	83 f8 08             	cmp    $0x8,%eax
  100168:	74 14                	je     10017e <video_putc+0x50>
  10016a:	e9 04 01 00 00       	jmp    100273 <video_putc+0x145>
  10016f:	83 f8 0a             	cmp    $0xa,%eax
  100172:	74 61                	je     1001d5 <video_putc+0xa7>
  100174:	83 f8 0d             	cmp    $0xd,%eax
  100177:	74 73                	je     1001ec <video_putc+0xbe>
  100179:	e9 f5 00 00 00       	jmp    100273 <video_putc+0x145>
  10017e:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  100184:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  100188:	66 85 c0             	test   %ax,%ax
  10018b:	0f 84 10 01 00 00    	je     1002a1 <video_putc+0x173>
  100191:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  100197:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  10019b:	8d 50 ff             	lea    -0x1(%eax),%edx
  10019e:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  1001a4:	66 89 50 04          	mov    %dx,0x4(%eax)
  1001a8:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ab:	b0 00                	mov    $0x0,%al
  1001ad:	83 c8 20             	or     $0x20,%eax
  1001b0:	89 c1                	mov    %eax,%ecx
  1001b2:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  1001b8:	8b 10                	mov    (%eax),%edx
  1001ba:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  1001c0:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  1001c4:	0f b7 c0             	movzwl %ax,%eax
  1001c7:	01 c0                	add    %eax,%eax
  1001c9:	01 d0                	add    %edx,%eax
  1001cb:	89 ca                	mov    %ecx,%edx
  1001cd:	66 89 10             	mov    %dx,(%eax)
  1001d0:	e9 cc 00 00 00       	jmp    1002a1 <video_putc+0x173>
  1001d5:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  1001db:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  1001df:	8d 50 50             	lea    0x50(%eax),%edx
  1001e2:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  1001e8:	66 89 50 04          	mov    %dx,0x4(%eax)
  1001ec:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  1001f2:	0f b7 70 04          	movzwl 0x4(%eax),%esi
  1001f6:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  1001fc:	0f b7 48 04          	movzwl 0x4(%eax),%ecx
  100200:	0f b7 c1             	movzwl %cx,%eax
  100203:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
  100209:	c1 e8 10             	shr    $0x10,%eax
  10020c:	89 c2                	mov    %eax,%edx
  10020e:	66 c1 ea 06          	shr    $0x6,%dx
  100212:	89 d0                	mov    %edx,%eax
  100214:	c1 e0 02             	shl    $0x2,%eax
  100217:	01 d0                	add    %edx,%eax
  100219:	c1 e0 04             	shl    $0x4,%eax
  10021c:	29 c1                	sub    %eax,%ecx
  10021e:	89 ca                	mov    %ecx,%edx
  100220:	29 d6                	sub    %edx,%esi
  100222:	89 f2                	mov    %esi,%edx
  100224:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  10022a:	66 89 50 04          	mov    %dx,0x4(%eax)
  10022e:	eb 72                	jmp    1002a2 <video_putc+0x174>
  100230:	83 ec 0c             	sub    $0xc,%esp
  100233:	6a 20                	push   $0x20
  100235:	e8 f4 fe ff ff       	call   10012e <video_putc>
  10023a:	83 c4 10             	add    $0x10,%esp
  10023d:	83 ec 0c             	sub    $0xc,%esp
  100240:	6a 20                	push   $0x20
  100242:	e8 e7 fe ff ff       	call   10012e <video_putc>
  100247:	83 c4 10             	add    $0x10,%esp
  10024a:	83 ec 0c             	sub    $0xc,%esp
  10024d:	6a 20                	push   $0x20
  10024f:	e8 da fe ff ff       	call   10012e <video_putc>
  100254:	83 c4 10             	add    $0x10,%esp
  100257:	83 ec 0c             	sub    $0xc,%esp
  10025a:	6a 20                	push   $0x20
  10025c:	e8 cd fe ff ff       	call   10012e <video_putc>
  100261:	83 c4 10             	add    $0x10,%esp
  100264:	83 ec 0c             	sub    $0xc,%esp
  100267:	6a 20                	push   $0x20
  100269:	e8 c0 fe ff ff       	call   10012e <video_putc>
  10026e:	83 c4 10             	add    $0x10,%esp
  100271:	eb 2f                	jmp    1002a2 <video_putc+0x174>
  100273:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  100279:	8b 30                	mov    (%eax),%esi
  10027b:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  100281:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  100285:	8d 48 01             	lea    0x1(%eax),%ecx
  100288:	c7 c2 80 14 91 00    	mov    $0x911480,%edx
  10028e:	66 89 4a 04          	mov    %cx,0x4(%edx)
  100292:	0f b7 c0             	movzwl %ax,%eax
  100295:	01 c0                	add    %eax,%eax
  100297:	01 f0                	add    %esi,%eax
  100299:	8b 55 08             	mov    0x8(%ebp),%edx
  10029c:	66 89 10             	mov    %dx,(%eax)
  10029f:	eb 01                	jmp    1002a2 <video_putc+0x174>
  1002a1:	90                   	nop
  1002a2:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  1002a8:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  1002ac:	66 3d cf 07          	cmp    $0x7cf,%ax
  1002b0:	76 69                	jbe    10031b <video_putc+0x1ed>
  1002b2:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  1002b8:	8b 00                	mov    (%eax),%eax
  1002ba:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1002c0:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  1002c6:	8b 00                	mov    (%eax),%eax
  1002c8:	83 ec 04             	sub    $0x4,%esp
  1002cb:	68 00 0f 00 00       	push   $0xf00
  1002d0:	52                   	push   %edx
  1002d1:	50                   	push   %eax
  1002d2:	e8 5c 2b 00 00       	call   102e33 <memmove>
  1002d7:	83 c4 10             	add    $0x10,%esp
  1002da:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1002e1:	eb 18                	jmp    1002fb <video_putc+0x1cd>
  1002e3:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  1002e9:	8b 00                	mov    (%eax),%eax
  1002eb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1002ee:	01 d2                	add    %edx,%edx
  1002f0:	01 d0                	add    %edx,%eax
  1002f2:	66 c7 00 20 07       	movw   $0x720,(%eax)
  1002f7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1002fb:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  100302:	7e df                	jle    1002e3 <video_putc+0x1b5>
  100304:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  10030a:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  10030e:	8d 50 b0             	lea    -0x50(%eax),%edx
  100311:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  100317:	66 89 50 04          	mov    %dx,0x4(%eax)
  10031b:	c7 c0 8c 14 91 00    	mov    $0x91148c,%eax
  100321:	8b 00                	mov    (%eax),%eax
  100323:	83 ec 08             	sub    $0x8,%esp
  100326:	6a 0e                	push   $0xe
  100328:	50                   	push   %eax
  100329:	e8 4a 3e 00 00       	call   104178 <outb>
  10032e:	83 c4 10             	add    $0x10,%esp
  100331:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  100337:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  10033b:	66 c1 e8 08          	shr    $0x8,%ax
  10033f:	0f b6 c0             	movzbl %al,%eax
  100342:	c7 c2 8c 14 91 00    	mov    $0x91148c,%edx
  100348:	8b 12                	mov    (%edx),%edx
  10034a:	83 c2 01             	add    $0x1,%edx
  10034d:	83 ec 08             	sub    $0x8,%esp
  100350:	50                   	push   %eax
  100351:	52                   	push   %edx
  100352:	e8 21 3e 00 00       	call   104178 <outb>
  100357:	83 c4 10             	add    $0x10,%esp
  10035a:	c7 c0 8c 14 91 00    	mov    $0x91148c,%eax
  100360:	8b 00                	mov    (%eax),%eax
  100362:	83 ec 08             	sub    $0x8,%esp
  100365:	6a 0f                	push   $0xf
  100367:	50                   	push   %eax
  100368:	e8 0b 3e 00 00       	call   104178 <outb>
  10036d:	83 c4 10             	add    $0x10,%esp
  100370:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  100376:	0f b7 40 04          	movzwl 0x4(%eax),%eax
  10037a:	0f b6 c0             	movzbl %al,%eax
  10037d:	c7 c2 8c 14 91 00    	mov    $0x91148c,%edx
  100383:	8b 12                	mov    (%edx),%edx
  100385:	83 c2 01             	add    $0x1,%edx
  100388:	83 ec 08             	sub    $0x8,%esp
  10038b:	50                   	push   %eax
  10038c:	52                   	push   %edx
  10038d:	e8 e6 3d 00 00       	call   104178 <outb>
  100392:	83 c4 10             	add    $0x10,%esp
  100395:	90                   	nop
  100396:	8d 65 f8             	lea    -0x8(%ebp),%esp
  100399:	5b                   	pop    %ebx
  10039a:	5e                   	pop    %esi
  10039b:	5d                   	pop    %ebp
  10039c:	c3                   	ret    

0010039d <video_set_cursor>:
  10039d:	55                   	push   %ebp
  10039e:	89 e5                	mov    %esp,%ebp
  1003a0:	e8 6a 00 00 00       	call   10040f <__x86.get_pc_thunk.dx>
  1003a5:	81 c2 5b 8c 00 00    	add    $0x8c5b,%edx
  1003ab:	8b 45 08             	mov    0x8(%ebp),%eax
  1003ae:	89 c1                	mov    %eax,%ecx
  1003b0:	89 c8                	mov    %ecx,%eax
  1003b2:	c1 e0 02             	shl    $0x2,%eax
  1003b5:	01 c8                	add    %ecx,%eax
  1003b7:	c1 e0 04             	shl    $0x4,%eax
  1003ba:	89 c1                	mov    %eax,%ecx
  1003bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003bf:	01 c1                	add    %eax,%ecx
  1003c1:	c7 c0 80 14 91 00    	mov    $0x911480,%eax
  1003c7:	66 89 48 04          	mov    %cx,0x4(%eax)
  1003cb:	90                   	nop
  1003cc:	5d                   	pop    %ebp
  1003cd:	c3                   	ret    

001003ce <video_clear_screen>:
  1003ce:	55                   	push   %ebp
  1003cf:	89 e5                	mov    %esp,%ebp
  1003d1:	83 ec 10             	sub    $0x10,%esp
  1003d4:	e8 32 00 00 00       	call   10040b <__x86.get_pc_thunk.ax>
  1003d9:	05 27 8c 00 00       	add    $0x8c27,%eax
  1003de:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1003e5:	eb 18                	jmp    1003ff <video_clear_screen+0x31>
  1003e7:	c7 c2 80 14 91 00    	mov    $0x911480,%edx
  1003ed:	8b 12                	mov    (%edx),%edx
  1003ef:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  1003f2:	01 c9                	add    %ecx,%ecx
  1003f4:	01 ca                	add    %ecx,%edx
  1003f6:	66 c7 02 20 00       	movw   $0x20,(%edx)
  1003fb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1003ff:	81 7d fc cf 07 00 00 	cmpl   $0x7cf,-0x4(%ebp)
  100406:	7e df                	jle    1003e7 <video_clear_screen+0x19>
  100408:	90                   	nop
  100409:	c9                   	leave  
  10040a:	c3                   	ret    

0010040b <__x86.get_pc_thunk.ax>:
  10040b:	8b 04 24             	mov    (%esp),%eax
  10040e:	c3                   	ret    

0010040f <__x86.get_pc_thunk.dx>:
  10040f:	8b 14 24             	mov    (%esp),%edx
  100412:	c3                   	ret    

00100413 <__x86.get_pc_thunk.bx>:
  100413:	8b 1c 24             	mov    (%esp),%ebx
  100416:	c3                   	ret    

00100417 <cons_init>:
  100417:	55                   	push   %ebp
  100418:	89 e5                	mov    %esp,%ebp
  10041a:	53                   	push   %ebx
  10041b:	83 ec 04             	sub    $0x4,%esp
  10041e:	e8 f0 ff ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  100423:	81 c3 dd 8b 00 00    	add    $0x8bdd,%ebx
  100429:	83 ec 04             	sub    $0x4,%esp
  10042c:	68 08 02 00 00       	push   $0x208
  100431:	6a 00                	push   $0x0
  100433:	c7 c0 a0 14 91 00    	mov    $0x9114a0,%eax
  100439:	50                   	push   %eax
  10043a:	e8 7c 29 00 00       	call   102dbb <memset>
  10043f:	83 c4 10             	add    $0x10,%esp
  100442:	e8 74 04 00 00       	call   1008bb <serial_init>
  100447:	e8 b4 fb ff ff       	call   100000 <video_init>
  10044c:	90                   	nop
  10044d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100450:	c9                   	leave  
  100451:	c3                   	ret    

00100452 <cons_intr>:
  100452:	55                   	push   %ebp
  100453:	89 e5                	mov    %esp,%ebp
  100455:	53                   	push   %ebx
  100456:	83 ec 14             	sub    $0x14,%esp
  100459:	e8 b5 ff ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  10045e:	81 c3 a2 8b 00 00    	add    $0x8ba2,%ebx
  100464:	eb 54                	jmp    1004ba <cons_intr+0x68>
  100466:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10046a:	75 02                	jne    10046e <cons_intr+0x1c>
  10046c:	eb 4c                	jmp    1004ba <cons_intr+0x68>
  10046e:	c7 c0 a0 14 91 00    	mov    $0x9114a0,%eax
  100474:	8b 80 04 02 00 00    	mov    0x204(%eax),%eax
  10047a:	8d 48 01             	lea    0x1(%eax),%ecx
  10047d:	c7 c2 a0 14 91 00    	mov    $0x9114a0,%edx
  100483:	89 8a 04 02 00 00    	mov    %ecx,0x204(%edx)
  100489:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10048c:	89 d1                	mov    %edx,%ecx
  10048e:	c7 c2 a0 14 91 00    	mov    $0x9114a0,%edx
  100494:	88 0c 02             	mov    %cl,(%edx,%eax,1)
  100497:	c7 c0 a0 14 91 00    	mov    $0x9114a0,%eax
  10049d:	8b 80 04 02 00 00    	mov    0x204(%eax),%eax
  1004a3:	3d 00 02 00 00       	cmp    $0x200,%eax
  1004a8:	75 10                	jne    1004ba <cons_intr+0x68>
  1004aa:	c7 c0 a0 14 91 00    	mov    $0x9114a0,%eax
  1004b0:	c7 80 04 02 00 00 00 	movl   $0x0,0x204(%eax)
  1004b7:	00 00 00 
  1004ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1004bd:	ff d0                	call   *%eax
  1004bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1004c2:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  1004c6:	75 9e                	jne    100466 <cons_intr+0x14>
  1004c8:	90                   	nop
  1004c9:	83 c4 14             	add    $0x14,%esp
  1004cc:	5b                   	pop    %ebx
  1004cd:	5d                   	pop    %ebp
  1004ce:	c3                   	ret    

001004cf <cons_getc>:
  1004cf:	55                   	push   %ebp
  1004d0:	89 e5                	mov    %esp,%ebp
  1004d2:	53                   	push   %ebx
  1004d3:	83 ec 14             	sub    $0x14,%esp
  1004d6:	e8 38 ff ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1004db:	81 c3 25 8b 00 00    	add    $0x8b25,%ebx
  1004e1:	e8 a7 02 00 00       	call   10078d <serial_intr>
  1004e6:	e8 86 06 00 00       	call   100b71 <keyboard_intr>
  1004eb:	c7 c0 a0 14 91 00    	mov    $0x9114a0,%eax
  1004f1:	8b 90 00 02 00 00    	mov    0x200(%eax),%edx
  1004f7:	c7 c0 a0 14 91 00    	mov    $0x9114a0,%eax
  1004fd:	8b 80 04 02 00 00    	mov    0x204(%eax),%eax
  100503:	39 c2                	cmp    %eax,%edx
  100505:	74 53                	je     10055a <cons_getc+0x8b>
  100507:	c7 c0 a0 14 91 00    	mov    $0x9114a0,%eax
  10050d:	8b 80 00 02 00 00    	mov    0x200(%eax),%eax
  100513:	8d 48 01             	lea    0x1(%eax),%ecx
  100516:	c7 c2 a0 14 91 00    	mov    $0x9114a0,%edx
  10051c:	89 8a 00 02 00 00    	mov    %ecx,0x200(%edx)
  100522:	c7 c2 a0 14 91 00    	mov    $0x9114a0,%edx
  100528:	0f b6 04 02          	movzbl (%edx,%eax,1),%eax
  10052c:	0f be c0             	movsbl %al,%eax
  10052f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100532:	c7 c0 a0 14 91 00    	mov    $0x9114a0,%eax
  100538:	8b 80 00 02 00 00    	mov    0x200(%eax),%eax
  10053e:	3d 00 02 00 00       	cmp    $0x200,%eax
  100543:	75 10                	jne    100555 <cons_getc+0x86>
  100545:	c7 c0 a0 14 91 00    	mov    $0x9114a0,%eax
  10054b:	c7 80 00 02 00 00 00 	movl   $0x0,0x200(%eax)
  100552:	00 00 00 
  100555:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100558:	eb 05                	jmp    10055f <cons_getc+0x90>
  10055a:	b8 00 00 00 00       	mov    $0x0,%eax
  10055f:	83 c4 14             	add    $0x14,%esp
  100562:	5b                   	pop    %ebx
  100563:	5d                   	pop    %ebp
  100564:	c3                   	ret    

00100565 <cons_putc>:
  100565:	55                   	push   %ebp
  100566:	89 e5                	mov    %esp,%ebp
  100568:	53                   	push   %ebx
  100569:	83 ec 14             	sub    $0x14,%esp
  10056c:	e8 a2 fe ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  100571:	81 c3 8f 8a 00 00    	add    $0x8a8f,%ebx
  100577:	8b 45 08             	mov    0x8(%ebp),%eax
  10057a:	88 45 f4             	mov    %al,-0xc(%ebp)
  10057d:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  100581:	83 ec 0c             	sub    $0xc,%esp
  100584:	50                   	push   %eax
  100585:	e8 9e 02 00 00       	call   100828 <serial_putc>
  10058a:	83 c4 10             	add    $0x10,%esp
  10058d:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  100591:	83 ec 0c             	sub    $0xc,%esp
  100594:	50                   	push   %eax
  100595:	e8 94 fb ff ff       	call   10012e <video_putc>
  10059a:	83 c4 10             	add    $0x10,%esp
  10059d:	90                   	nop
  10059e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1005a1:	c9                   	leave  
  1005a2:	c3                   	ret    

001005a3 <getchar>:
  1005a3:	55                   	push   %ebp
  1005a4:	89 e5                	mov    %esp,%ebp
  1005a6:	83 ec 18             	sub    $0x18,%esp
  1005a9:	e8 5d fe ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1005ae:	05 52 8a 00 00       	add    $0x8a52,%eax
  1005b3:	e8 17 ff ff ff       	call   1004cf <cons_getc>
  1005b8:	88 45 f7             	mov    %al,-0x9(%ebp)
  1005bb:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1005bf:	74 f2                	je     1005b3 <getchar+0x10>
  1005c1:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  1005c5:	c9                   	leave  
  1005c6:	c3                   	ret    

001005c7 <putchar>:
  1005c7:	55                   	push   %ebp
  1005c8:	89 e5                	mov    %esp,%ebp
  1005ca:	83 ec 18             	sub    $0x18,%esp
  1005cd:	e8 39 fe ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1005d2:	05 2e 8a 00 00       	add    $0x8a2e,%eax
  1005d7:	8b 45 08             	mov    0x8(%ebp),%eax
  1005da:	88 45 f4             	mov    %al,-0xc(%ebp)
  1005dd:	0f be 45 f4          	movsbl -0xc(%ebp),%eax
  1005e1:	83 ec 0c             	sub    $0xc,%esp
  1005e4:	50                   	push   %eax
  1005e5:	e8 7b ff ff ff       	call   100565 <cons_putc>
  1005ea:	83 c4 10             	add    $0x10,%esp
  1005ed:	90                   	nop
  1005ee:	c9                   	leave  
  1005ef:	c3                   	ret    

001005f0 <readline>:
  1005f0:	55                   	push   %ebp
  1005f1:	89 e5                	mov    %esp,%ebp
  1005f3:	53                   	push   %ebx
  1005f4:	83 ec 14             	sub    $0x14,%esp
  1005f7:	e8 17 fe ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1005fc:	81 c3 04 8a 00 00    	add    $0x8a04,%ebx
  100602:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100606:	74 15                	je     10061d <readline+0x2d>
  100608:	83 ec 08             	sub    $0x8,%esp
  10060b:	ff 75 08             	pushl  0x8(%ebp)
  10060e:	8d 83 da ce ff ff    	lea    -0x3126(%ebx),%eax
  100614:	50                   	push   %eax
  100615:	e8 5e 2d 00 00       	call   103378 <dprintf>
  10061a:	83 c4 10             	add    $0x10,%esp
  10061d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100624:	e8 7a ff ff ff       	call   1005a3 <getchar>
  100629:	88 45 f3             	mov    %al,-0xd(%ebp)
  10062c:	80 7d f3 00          	cmpb   $0x0,-0xd(%ebp)
  100630:	79 21                	jns    100653 <readline+0x63>
  100632:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
  100636:	83 ec 08             	sub    $0x8,%esp
  100639:	50                   	push   %eax
  10063a:	8d 83 dd ce ff ff    	lea    -0x3123(%ebx),%eax
  100640:	50                   	push   %eax
  100641:	e8 32 2d 00 00       	call   103378 <dprintf>
  100646:	83 c4 10             	add    $0x10,%esp
  100649:	b8 00 00 00 00       	mov    $0x0,%eax
  10064e:	e9 92 00 00 00       	jmp    1006e5 <readline+0xf5>
  100653:	80 7d f3 08          	cmpb   $0x8,-0xd(%ebp)
  100657:	74 06                	je     10065f <readline+0x6f>
  100659:	80 7d f3 7f          	cmpb   $0x7f,-0xd(%ebp)
  10065d:	75 19                	jne    100678 <readline+0x88>
  10065f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100663:	7e 13                	jle    100678 <readline+0x88>
  100665:	83 ec 0c             	sub    $0xc,%esp
  100668:	6a 08                	push   $0x8
  10066a:	e8 58 ff ff ff       	call   1005c7 <putchar>
  10066f:	83 c4 10             	add    $0x10,%esp
  100672:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  100676:	eb 68                	jmp    1006e0 <readline+0xf0>
  100678:	80 7d f3 1f          	cmpb   $0x1f,-0xd(%ebp)
  10067c:	7e 2f                	jle    1006ad <readline+0xbd>
  10067e:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100685:	7f 26                	jg     1006ad <readline+0xbd>
  100687:	0f be 45 f3          	movsbl -0xd(%ebp),%eax
  10068b:	83 ec 0c             	sub    $0xc,%esp
  10068e:	50                   	push   %eax
  10068f:	e8 33 ff ff ff       	call   1005c7 <putchar>
  100694:	83 c4 10             	add    $0x10,%esp
  100697:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10069a:	8d 50 01             	lea    0x1(%eax),%edx
  10069d:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1006a0:	0f b6 55 f3          	movzbl -0xd(%ebp),%edx
  1006a4:	88 94 03 00 70 00 00 	mov    %dl,0x7000(%ebx,%eax,1)
  1006ab:	eb 33                	jmp    1006e0 <readline+0xf0>
  1006ad:	80 7d f3 0a          	cmpb   $0xa,-0xd(%ebp)
  1006b1:	74 0a                	je     1006bd <readline+0xcd>
  1006b3:	80 7d f3 0d          	cmpb   $0xd,-0xd(%ebp)
  1006b7:	0f 85 67 ff ff ff    	jne    100624 <readline+0x34>
  1006bd:	83 ec 0c             	sub    $0xc,%esp
  1006c0:	6a 0a                	push   $0xa
  1006c2:	e8 00 ff ff ff       	call   1005c7 <putchar>
  1006c7:	83 c4 10             	add    $0x10,%esp
  1006ca:	8d 93 00 70 00 00    	lea    0x7000(%ebx),%edx
  1006d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006d3:	01 d0                	add    %edx,%eax
  1006d5:	c6 00 00             	movb   $0x0,(%eax)
  1006d8:	8d 83 00 70 00 00    	lea    0x7000(%ebx),%eax
  1006de:	eb 05                	jmp    1006e5 <readline+0xf5>
  1006e0:	e9 3f ff ff ff       	jmp    100624 <readline+0x34>
  1006e5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1006e8:	c9                   	leave  
  1006e9:	c3                   	ret    

001006ea <delay>:
  1006ea:	55                   	push   %ebp
  1006eb:	89 e5                	mov    %esp,%ebp
  1006ed:	53                   	push   %ebx
  1006ee:	83 ec 04             	sub    $0x4,%esp
  1006f1:	e8 1d fd ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1006f6:	81 c3 0a 89 00 00    	add    $0x890a,%ebx
  1006fc:	83 ec 0c             	sub    $0xc,%esp
  1006ff:	68 84 00 00 00       	push   $0x84
  100704:	e8 20 3a 00 00       	call   104129 <inb>
  100709:	83 c4 10             	add    $0x10,%esp
  10070c:	83 ec 0c             	sub    $0xc,%esp
  10070f:	68 84 00 00 00       	push   $0x84
  100714:	e8 10 3a 00 00       	call   104129 <inb>
  100719:	83 c4 10             	add    $0x10,%esp
  10071c:	83 ec 0c             	sub    $0xc,%esp
  10071f:	68 84 00 00 00       	push   $0x84
  100724:	e8 00 3a 00 00       	call   104129 <inb>
  100729:	83 c4 10             	add    $0x10,%esp
  10072c:	83 ec 0c             	sub    $0xc,%esp
  10072f:	68 84 00 00 00       	push   $0x84
  100734:	e8 f0 39 00 00       	call   104129 <inb>
  100739:	83 c4 10             	add    $0x10,%esp
  10073c:	90                   	nop
  10073d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100740:	c9                   	leave  
  100741:	c3                   	ret    

00100742 <serial_proc_data>:
  100742:	55                   	push   %ebp
  100743:	89 e5                	mov    %esp,%ebp
  100745:	53                   	push   %ebx
  100746:	83 ec 04             	sub    $0x4,%esp
  100749:	e8 c5 fc ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  10074e:	81 c3 b2 88 00 00    	add    $0x88b2,%ebx
  100754:	83 ec 0c             	sub    $0xc,%esp
  100757:	68 fd 03 00 00       	push   $0x3fd
  10075c:	e8 c8 39 00 00       	call   104129 <inb>
  100761:	83 c4 10             	add    $0x10,%esp
  100764:	0f b6 c0             	movzbl %al,%eax
  100767:	83 e0 01             	and    $0x1,%eax
  10076a:	85 c0                	test   %eax,%eax
  10076c:	75 07                	jne    100775 <serial_proc_data+0x33>
  10076e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100773:	eb 13                	jmp    100788 <serial_proc_data+0x46>
  100775:	83 ec 0c             	sub    $0xc,%esp
  100778:	68 f8 03 00 00       	push   $0x3f8
  10077d:	e8 a7 39 00 00       	call   104129 <inb>
  100782:	83 c4 10             	add    $0x10,%esp
  100785:	0f b6 c0             	movzbl %al,%eax
  100788:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10078b:	c9                   	leave  
  10078c:	c3                   	ret    

0010078d <serial_intr>:
  10078d:	55                   	push   %ebp
  10078e:	89 e5                	mov    %esp,%ebp
  100790:	53                   	push   %ebx
  100791:	83 ec 04             	sub    $0x4,%esp
  100794:	e8 72 fc ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  100799:	05 67 88 00 00       	add    $0x8867,%eax
  10079e:	c7 c2 a8 16 91 00    	mov    $0x9116a8,%edx
  1007a4:	0f b6 12             	movzbl (%edx),%edx
  1007a7:	84 d2                	test   %dl,%dl
  1007a9:	74 14                	je     1007bf <serial_intr+0x32>
  1007ab:	83 ec 0c             	sub    $0xc,%esp
  1007ae:	8d 90 42 77 ff ff    	lea    -0x88be(%eax),%edx
  1007b4:	52                   	push   %edx
  1007b5:	89 c3                	mov    %eax,%ebx
  1007b7:	e8 96 fc ff ff       	call   100452 <cons_intr>
  1007bc:	83 c4 10             	add    $0x10,%esp
  1007bf:	90                   	nop
  1007c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1007c3:	c9                   	leave  
  1007c4:	c3                   	ret    

001007c5 <serial_reformatnewline>:
  1007c5:	55                   	push   %ebp
  1007c6:	89 e5                	mov    %esp,%ebp
  1007c8:	53                   	push   %ebx
  1007c9:	83 ec 14             	sub    $0x14,%esp
  1007cc:	e8 42 fc ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1007d1:	81 c3 2f 88 00 00    	add    $0x882f,%ebx
  1007d7:	c7 45 f4 0d 00 00 00 	movl   $0xd,-0xc(%ebp)
  1007de:	c7 45 f0 0a 00 00 00 	movl   $0xa,-0x10(%ebp)
  1007e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1007e8:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  1007eb:	75 31                	jne    10081e <serial_reformatnewline+0x59>
  1007ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007f0:	0f b6 c0             	movzbl %al,%eax
  1007f3:	83 ec 08             	sub    $0x8,%esp
  1007f6:	50                   	push   %eax
  1007f7:	ff 75 0c             	pushl  0xc(%ebp)
  1007fa:	e8 79 39 00 00       	call   104178 <outb>
  1007ff:	83 c4 10             	add    $0x10,%esp
  100802:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100805:	0f b6 c0             	movzbl %al,%eax
  100808:	83 ec 08             	sub    $0x8,%esp
  10080b:	50                   	push   %eax
  10080c:	ff 75 0c             	pushl  0xc(%ebp)
  10080f:	e8 64 39 00 00       	call   104178 <outb>
  100814:	83 c4 10             	add    $0x10,%esp
  100817:	b8 01 00 00 00       	mov    $0x1,%eax
  10081c:	eb 05                	jmp    100823 <serial_reformatnewline+0x5e>
  10081e:	b8 00 00 00 00       	mov    $0x0,%eax
  100823:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100826:	c9                   	leave  
  100827:	c3                   	ret    

00100828 <serial_putc>:
  100828:	55                   	push   %ebp
  100829:	89 e5                	mov    %esp,%ebp
  10082b:	53                   	push   %ebx
  10082c:	83 ec 24             	sub    $0x24,%esp
  10082f:	e8 df fb ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  100834:	81 c3 cc 87 00 00    	add    $0x87cc,%ebx
  10083a:	8b 45 08             	mov    0x8(%ebp),%eax
  10083d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  100840:	c7 c0 a8 16 91 00    	mov    $0x9116a8,%eax
  100846:	0f b6 00             	movzbl (%eax),%eax
  100849:	84 c0                	test   %al,%al
  10084b:	74 68                	je     1008b5 <serial_putc+0x8d>
  10084d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100854:	eb 09                	jmp    10085f <serial_putc+0x37>
  100856:	e8 8f fe ff ff       	call   1006ea <delay>
  10085b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10085f:	83 ec 0c             	sub    $0xc,%esp
  100862:	68 fd 03 00 00       	push   $0x3fd
  100867:	e8 bd 38 00 00       	call   104129 <inb>
  10086c:	83 c4 10             	add    $0x10,%esp
  10086f:	0f b6 c0             	movzbl %al,%eax
  100872:	83 e0 20             	and    $0x20,%eax
  100875:	85 c0                	test   %eax,%eax
  100877:	75 09                	jne    100882 <serial_putc+0x5a>
  100879:	81 7d f4 ff 31 00 00 	cmpl   $0x31ff,-0xc(%ebp)
  100880:	7e d4                	jle    100856 <serial_putc+0x2e>
  100882:	0f be 45 e4          	movsbl -0x1c(%ebp),%eax
  100886:	83 ec 08             	sub    $0x8,%esp
  100889:	68 f8 03 00 00       	push   $0x3f8
  10088e:	50                   	push   %eax
  10088f:	e8 31 ff ff ff       	call   1007c5 <serial_reformatnewline>
  100894:	83 c4 10             	add    $0x10,%esp
  100897:	85 c0                	test   %eax,%eax
  100899:	75 1b                	jne    1008b6 <serial_putc+0x8e>
  10089b:	0f b6 45 e4          	movzbl -0x1c(%ebp),%eax
  10089f:	0f b6 c0             	movzbl %al,%eax
  1008a2:	83 ec 08             	sub    $0x8,%esp
  1008a5:	50                   	push   %eax
  1008a6:	68 f8 03 00 00       	push   $0x3f8
  1008ab:	e8 c8 38 00 00       	call   104178 <outb>
  1008b0:	83 c4 10             	add    $0x10,%esp
  1008b3:	eb 01                	jmp    1008b6 <serial_putc+0x8e>
  1008b5:	90                   	nop
  1008b6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1008b9:	c9                   	leave  
  1008ba:	c3                   	ret    

001008bb <serial_init>:
  1008bb:	55                   	push   %ebp
  1008bc:	89 e5                	mov    %esp,%ebp
  1008be:	53                   	push   %ebx
  1008bf:	83 ec 04             	sub    $0x4,%esp
  1008c2:	e8 4c fb ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1008c7:	81 c3 39 87 00 00    	add    $0x8739,%ebx
  1008cd:	83 ec 08             	sub    $0x8,%esp
  1008d0:	6a 00                	push   $0x0
  1008d2:	68 f9 03 00 00       	push   $0x3f9
  1008d7:	e8 9c 38 00 00       	call   104178 <outb>
  1008dc:	83 c4 10             	add    $0x10,%esp
  1008df:	83 ec 08             	sub    $0x8,%esp
  1008e2:	68 80 00 00 00       	push   $0x80
  1008e7:	68 fb 03 00 00       	push   $0x3fb
  1008ec:	e8 87 38 00 00       	call   104178 <outb>
  1008f1:	83 c4 10             	add    $0x10,%esp
  1008f4:	83 ec 08             	sub    $0x8,%esp
  1008f7:	6a 01                	push   $0x1
  1008f9:	68 f8 03 00 00       	push   $0x3f8
  1008fe:	e8 75 38 00 00       	call   104178 <outb>
  100903:	83 c4 10             	add    $0x10,%esp
  100906:	83 ec 08             	sub    $0x8,%esp
  100909:	6a 00                	push   $0x0
  10090b:	68 f9 03 00 00       	push   $0x3f9
  100910:	e8 63 38 00 00       	call   104178 <outb>
  100915:	83 c4 10             	add    $0x10,%esp
  100918:	83 ec 08             	sub    $0x8,%esp
  10091b:	6a 03                	push   $0x3
  10091d:	68 fb 03 00 00       	push   $0x3fb
  100922:	e8 51 38 00 00       	call   104178 <outb>
  100927:	83 c4 10             	add    $0x10,%esp
  10092a:	83 ec 08             	sub    $0x8,%esp
  10092d:	68 c7 00 00 00       	push   $0xc7
  100932:	68 fa 03 00 00       	push   $0x3fa
  100937:	e8 3c 38 00 00       	call   104178 <outb>
  10093c:	83 c4 10             	add    $0x10,%esp
  10093f:	83 ec 08             	sub    $0x8,%esp
  100942:	6a 0b                	push   $0xb
  100944:	68 fc 03 00 00       	push   $0x3fc
  100949:	e8 2a 38 00 00       	call   104178 <outb>
  10094e:	83 c4 10             	add    $0x10,%esp
  100951:	83 ec 0c             	sub    $0xc,%esp
  100954:	68 fd 03 00 00       	push   $0x3fd
  100959:	e8 cb 37 00 00       	call   104129 <inb>
  10095e:	83 c4 10             	add    $0x10,%esp
  100961:	3c ff                	cmp    $0xff,%al
  100963:	0f 95 c0             	setne  %al
  100966:	89 c2                	mov    %eax,%edx
  100968:	c7 c0 a8 16 91 00    	mov    $0x9116a8,%eax
  10096e:	88 10                	mov    %dl,(%eax)
  100970:	83 ec 0c             	sub    $0xc,%esp
  100973:	68 fa 03 00 00       	push   $0x3fa
  100978:	e8 ac 37 00 00       	call   104129 <inb>
  10097d:	83 c4 10             	add    $0x10,%esp
  100980:	83 ec 0c             	sub    $0xc,%esp
  100983:	68 f8 03 00 00       	push   $0x3f8
  100988:	e8 9c 37 00 00       	call   104129 <inb>
  10098d:	83 c4 10             	add    $0x10,%esp
  100990:	90                   	nop
  100991:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100994:	c9                   	leave  
  100995:	c3                   	ret    

00100996 <serial_intenable>:
  100996:	55                   	push   %ebp
  100997:	89 e5                	mov    %esp,%ebp
  100999:	53                   	push   %ebx
  10099a:	83 ec 04             	sub    $0x4,%esp
  10099d:	e8 69 fa ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1009a2:	05 5e 86 00 00       	add    $0x865e,%eax
  1009a7:	c7 c2 a8 16 91 00    	mov    $0x9116a8,%edx
  1009ad:	0f b6 12             	movzbl (%edx),%edx
  1009b0:	84 d2                	test   %dl,%dl
  1009b2:	74 19                	je     1009cd <serial_intenable+0x37>
  1009b4:	83 ec 08             	sub    $0x8,%esp
  1009b7:	6a 01                	push   $0x1
  1009b9:	68 f9 03 00 00       	push   $0x3f9
  1009be:	89 c3                	mov    %eax,%ebx
  1009c0:	e8 b3 37 00 00       	call   104178 <outb>
  1009c5:	83 c4 10             	add    $0x10,%esp
  1009c8:	e8 c0 fd ff ff       	call   10078d <serial_intr>
  1009cd:	90                   	nop
  1009ce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1009d1:	c9                   	leave  
  1009d2:	c3                   	ret    

001009d3 <kbd_proc_data>:
  1009d3:	55                   	push   %ebp
  1009d4:	89 e5                	mov    %esp,%ebp
  1009d6:	53                   	push   %ebx
  1009d7:	83 ec 14             	sub    $0x14,%esp
  1009da:	e8 34 fa ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1009df:	81 c3 21 86 00 00    	add    $0x8621,%ebx
  1009e5:	83 ec 0c             	sub    $0xc,%esp
  1009e8:	6a 64                	push   $0x64
  1009ea:	e8 3a 37 00 00       	call   104129 <inb>
  1009ef:	83 c4 10             	add    $0x10,%esp
  1009f2:	83 e0 01             	and    $0x1,%eax
  1009f5:	85 c0                	test   %eax,%eax
  1009f7:	75 0a                	jne    100a03 <kbd_proc_data+0x30>
  1009f9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1009fe:	e9 69 01 00 00       	jmp    100b6c <kbd_proc_data+0x199>
  100a03:	83 ec 0c             	sub    $0xc,%esp
  100a06:	6a 60                	push   $0x60
  100a08:	e8 1c 37 00 00       	call   104129 <inb>
  100a0d:	83 c4 10             	add    $0x10,%esp
  100a10:	88 45 f3             	mov    %al,-0xd(%ebp)
  100a13:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  100a17:	75 19                	jne    100a32 <kbd_proc_data+0x5f>
  100a19:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100a1f:	83 c8 40             	or     $0x40,%eax
  100a22:	89 83 00 74 00 00    	mov    %eax,0x7400(%ebx)
  100a28:	b8 00 00 00 00       	mov    $0x0,%eax
  100a2d:	e9 3a 01 00 00       	jmp    100b6c <kbd_proc_data+0x199>
  100a32:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a36:	84 c0                	test   %al,%al
  100a38:	79 4b                	jns    100a85 <kbd_proc_data+0xb2>
  100a3a:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100a40:	83 e0 40             	and    $0x40,%eax
  100a43:	85 c0                	test   %eax,%eax
  100a45:	75 09                	jne    100a50 <kbd_proc_data+0x7d>
  100a47:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a4b:	83 e0 7f             	and    $0x7f,%eax
  100a4e:	eb 04                	jmp    100a54 <kbd_proc_data+0x81>
  100a50:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a54:	88 45 f3             	mov    %al,-0xd(%ebp)
  100a57:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100a5b:	0f b6 84 03 00 10 00 	movzbl 0x1000(%ebx,%eax,1),%eax
  100a62:	00 
  100a63:	83 c8 40             	or     $0x40,%eax
  100a66:	0f b6 c0             	movzbl %al,%eax
  100a69:	f7 d0                	not    %eax
  100a6b:	89 c2                	mov    %eax,%edx
  100a6d:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100a73:	21 d0                	and    %edx,%eax
  100a75:	89 83 00 74 00 00    	mov    %eax,0x7400(%ebx)
  100a7b:	b8 00 00 00 00       	mov    $0x0,%eax
  100a80:	e9 e7 00 00 00       	jmp    100b6c <kbd_proc_data+0x199>
  100a85:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100a8b:	83 e0 40             	and    $0x40,%eax
  100a8e:	85 c0                	test   %eax,%eax
  100a90:	74 13                	je     100aa5 <kbd_proc_data+0xd2>
  100a92:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
  100a96:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100a9c:	83 e0 bf             	and    $0xffffffbf,%eax
  100a9f:	89 83 00 74 00 00    	mov    %eax,0x7400(%ebx)
  100aa5:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100aa9:	0f b6 84 03 00 10 00 	movzbl 0x1000(%ebx,%eax,1),%eax
  100ab0:	00 
  100ab1:	0f b6 d0             	movzbl %al,%edx
  100ab4:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100aba:	09 d0                	or     %edx,%eax
  100abc:	89 83 00 74 00 00    	mov    %eax,0x7400(%ebx)
  100ac2:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100ac6:	0f b6 84 03 00 11 00 	movzbl 0x1100(%ebx,%eax,1),%eax
  100acd:	00 
  100ace:	0f b6 d0             	movzbl %al,%edx
  100ad1:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100ad7:	31 d0                	xor    %edx,%eax
  100ad9:	89 83 00 74 00 00    	mov    %eax,0x7400(%ebx)
  100adf:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100ae5:	83 e0 03             	and    $0x3,%eax
  100ae8:	8b 94 83 00 15 00 00 	mov    0x1500(%ebx,%eax,4),%edx
  100aef:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100af3:	01 d0                	add    %edx,%eax
  100af5:	0f b6 00             	movzbl (%eax),%eax
  100af8:	0f b6 c0             	movzbl %al,%eax
  100afb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100afe:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100b04:	83 e0 08             	and    $0x8,%eax
  100b07:	85 c0                	test   %eax,%eax
  100b09:	74 22                	je     100b2d <kbd_proc_data+0x15a>
  100b0b:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  100b0f:	7e 0c                	jle    100b1d <kbd_proc_data+0x14a>
  100b11:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  100b15:	7f 06                	jg     100b1d <kbd_proc_data+0x14a>
  100b17:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  100b1b:	eb 10                	jmp    100b2d <kbd_proc_data+0x15a>
  100b1d:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  100b21:	7e 0a                	jle    100b2d <kbd_proc_data+0x15a>
  100b23:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  100b27:	7f 04                	jg     100b2d <kbd_proc_data+0x15a>
  100b29:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
  100b2d:	8b 83 00 74 00 00    	mov    0x7400(%ebx),%eax
  100b33:	f7 d0                	not    %eax
  100b35:	83 e0 06             	and    $0x6,%eax
  100b38:	85 c0                	test   %eax,%eax
  100b3a:	75 2d                	jne    100b69 <kbd_proc_data+0x196>
  100b3c:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  100b43:	75 24                	jne    100b69 <kbd_proc_data+0x196>
  100b45:	83 ec 0c             	sub    $0xc,%esp
  100b48:	8d 83 ed ce ff ff    	lea    -0x3113(%ebx),%eax
  100b4e:	50                   	push   %eax
  100b4f:	e8 24 28 00 00       	call   103378 <dprintf>
  100b54:	83 c4 10             	add    $0x10,%esp
  100b57:	83 ec 08             	sub    $0x8,%esp
  100b5a:	6a 03                	push   $0x3
  100b5c:	68 92 00 00 00       	push   $0x92
  100b61:	e8 12 36 00 00       	call   104178 <outb>
  100b66:	83 c4 10             	add    $0x10,%esp
  100b69:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b6c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b6f:	c9                   	leave  
  100b70:	c3                   	ret    

00100b71 <keyboard_intr>:
  100b71:	55                   	push   %ebp
  100b72:	89 e5                	mov    %esp,%ebp
  100b74:	53                   	push   %ebx
  100b75:	83 ec 04             	sub    $0x4,%esp
  100b78:	e8 8e f8 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  100b7d:	05 83 84 00 00       	add    $0x8483,%eax
  100b82:	83 ec 0c             	sub    $0xc,%esp
  100b85:	8d 90 d3 79 ff ff    	lea    -0x862d(%eax),%edx
  100b8b:	52                   	push   %edx
  100b8c:	89 c3                	mov    %eax,%ebx
  100b8e:	e8 bf f8 ff ff       	call   100452 <cons_intr>
  100b93:	83 c4 10             	add    $0x10,%esp
  100b96:	90                   	nop
  100b97:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100b9a:	c9                   	leave  
  100b9b:	c3                   	ret    

00100b9c <devinit>:
  100b9c:	55                   	push   %ebp
  100b9d:	89 e5                	mov    %esp,%ebp
  100b9f:	53                   	push   %ebx
  100ba0:	83 ec 04             	sub    $0x4,%esp
  100ba3:	e8 6b f8 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  100ba8:	81 c3 58 84 00 00    	add    $0x8458,%ebx
  100bae:	e8 b8 2c 00 00       	call   10386b <seg_init>
  100bb3:	e8 b5 33 00 00       	call   103f6d <enable_sse>
  100bb8:	e8 5a f8 ff ff       	call   100417 <cons_init>
  100bbd:	83 ec 04             	sub    $0x4,%esp
  100bc0:	8d 83 f9 ce ff ff    	lea    -0x3107(%ebx),%eax
  100bc6:	50                   	push   %eax
  100bc7:	6a 13                	push   $0x13
  100bc9:	8d 83 0c cf ff ff    	lea    -0x30f4(%ebx),%eax
  100bcf:	50                   	push   %eax
  100bd0:	e8 d2 24 00 00       	call   1030a7 <debug_normal>
  100bd5:	83 c4 10             	add    $0x10,%esp
  100bd8:	ff 75 08             	pushl  0x8(%ebp)
  100bdb:	8d 83 1f cf ff ff    	lea    -0x30e1(%ebx),%eax
  100be1:	50                   	push   %eax
  100be2:	6a 14                	push   $0x14
  100be4:	8d 83 0c cf ff ff    	lea    -0x30f4(%ebx),%eax
  100bea:	50                   	push   %eax
  100beb:	e8 b7 24 00 00       	call   1030a7 <debug_normal>
  100bf0:	83 c4 10             	add    $0x10,%esp
  100bf3:	e8 fb 1f 00 00       	call   102bf3 <intr_init>
  100bf8:	83 ec 0c             	sub    $0xc,%esp
  100bfb:	ff 75 08             	pushl  0x8(%ebp)
  100bfe:	e8 a3 03 00 00       	call   100fa6 <pmmap_init>
  100c03:	83 c4 10             	add    $0x10,%esp
  100c06:	90                   	nop
  100c07:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100c0a:	c9                   	leave  
  100c0b:	c3                   	ret    

00100c0c <pmmap_alloc_slot>:
  100c0c:	55                   	push   %ebp
  100c0d:	89 e5                	mov    %esp,%ebp
  100c0f:	e8 fb f7 ff ff       	call   10040f <__x86.get_pc_thunk.dx>
  100c14:	81 c2 ec 83 00 00    	add    $0x83ec,%edx
  100c1a:	8b 82 20 7e 00 00    	mov    0x7e20(%edx),%eax
  100c20:	3d 80 00 00 00       	cmp    $0x80,%eax
  100c25:	0f 94 c0             	sete   %al
  100c28:	0f b6 c0             	movzbl %al,%eax
  100c2b:	85 c0                	test   %eax,%eax
  100c2d:	74 07                	je     100c36 <pmmap_alloc_slot+0x2a>
  100c2f:	b8 00 00 00 00       	mov    $0x0,%eax
  100c34:	eb 21                	jmp    100c57 <pmmap_alloc_slot+0x4b>
  100c36:	8b 8a 20 7e 00 00    	mov    0x7e20(%edx),%ecx
  100c3c:	8d 41 01             	lea    0x1(%ecx),%eax
  100c3f:	89 82 20 7e 00 00    	mov    %eax,0x7e20(%edx)
  100c45:	89 c8                	mov    %ecx,%eax
  100c47:	c1 e0 02             	shl    $0x2,%eax
  100c4a:	01 c8                	add    %ecx,%eax
  100c4c:	c1 e0 02             	shl    $0x2,%eax
  100c4f:	8d 92 20 74 00 00    	lea    0x7420(%edx),%edx
  100c55:	01 d0                	add    %edx,%eax
  100c57:	5d                   	pop    %ebp
  100c58:	c3                   	ret    

00100c59 <pmmap_insert>:
  100c59:	55                   	push   %ebp
  100c5a:	89 e5                	mov    %esp,%ebp
  100c5c:	53                   	push   %ebx
  100c5d:	83 ec 14             	sub    $0x14,%esp
  100c60:	e8 ae f7 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  100c65:	81 c3 9b 83 00 00    	add    $0x839b,%ebx
  100c6b:	e8 9c ff ff ff       	call   100c0c <pmmap_alloc_slot>
  100c70:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100c73:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  100c77:	75 1b                	jne    100c94 <pmmap_insert+0x3b>
  100c79:	83 ec 04             	sub    $0x4,%esp
  100c7c:	8d 83 34 cf ff ff    	lea    -0x30cc(%ebx),%eax
  100c82:	50                   	push   %eax
  100c83:	6a 3e                	push   $0x3e
  100c85:	8d 83 51 cf ff ff    	lea    -0x30af(%ebx),%eax
  100c8b:	50                   	push   %eax
  100c8c:	e8 d0 24 00 00       	call   103161 <debug_panic>
  100c91:	83 c4 10             	add    $0x10,%esp
  100c94:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c97:	8b 55 08             	mov    0x8(%ebp),%edx
  100c9a:	89 10                	mov    %edx,(%eax)
  100c9c:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c9f:	8b 55 0c             	mov    0xc(%ebp),%edx
  100ca2:	89 50 04             	mov    %edx,0x4(%eax)
  100ca5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100ca8:	8b 55 10             	mov    0x10(%ebp),%edx
  100cab:	89 50 08             	mov    %edx,0x8(%eax)
  100cae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  100cb5:	8b 83 24 7e 00 00    	mov    0x7e24(%ebx),%eax
  100cbb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cbe:	eb 19                	jmp    100cd9 <pmmap_insert+0x80>
  100cc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cc3:	8b 00                	mov    (%eax),%eax
  100cc5:	39 45 08             	cmp    %eax,0x8(%ebp)
  100cc8:	72 17                	jb     100ce1 <pmmap_insert+0x88>
  100cca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ccd:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100cd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cd3:	8b 40 0c             	mov    0xc(%eax),%eax
  100cd6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100cd9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100cdd:	75 e1                	jne    100cc0 <pmmap_insert+0x67>
  100cdf:	eb 01                	jmp    100ce2 <pmmap_insert+0x89>
  100ce1:	90                   	nop
  100ce2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100ce6:	75 17                	jne    100cff <pmmap_insert+0xa6>
  100ce8:	8b 93 24 7e 00 00    	mov    0x7e24(%ebx),%edx
  100cee:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100cf1:	89 50 0c             	mov    %edx,0xc(%eax)
  100cf4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100cf7:	89 83 24 7e 00 00    	mov    %eax,0x7e24(%ebx)
  100cfd:	eb 15                	jmp    100d14 <pmmap_insert+0xbb>
  100cff:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100d02:	8b 50 0c             	mov    0xc(%eax),%edx
  100d05:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100d08:	89 50 0c             	mov    %edx,0xc(%eax)
  100d0b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100d0e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100d11:	89 50 0c             	mov    %edx,0xc(%eax)
  100d14:	90                   	nop
  100d15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100d18:	c9                   	leave  
  100d19:	c3                   	ret    

00100d1a <pmmap_merge>:
  100d1a:	55                   	push   %ebp
  100d1b:	89 e5                	mov    %esp,%ebp
  100d1d:	53                   	push   %ebx
  100d1e:	83 ec 24             	sub    $0x24,%esp
  100d21:	e8 ed f6 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  100d26:	81 c3 da 82 00 00    	add    $0x82da,%ebx
  100d2c:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  100d33:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  100d3a:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100d41:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100d48:	8b 83 24 7e 00 00    	mov    0x7e24(%ebx),%eax
  100d4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d51:	eb 75                	jmp    100dc8 <pmmap_merge+0xae>
  100d53:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d56:	8b 40 0c             	mov    0xc(%eax),%eax
  100d59:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100d5c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100d60:	74 6e                	je     100dd0 <pmmap_merge+0xb6>
  100d62:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d65:	8b 10                	mov    (%eax),%edx
  100d67:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100d6a:	8b 00                	mov    (%eax),%eax
  100d6c:	39 c2                	cmp    %eax,%edx
  100d6e:	77 4f                	ja     100dbf <pmmap_merge+0xa5>
  100d70:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d73:	8b 50 04             	mov    0x4(%eax),%edx
  100d76:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100d79:	8b 00                	mov    (%eax),%eax
  100d7b:	39 c2                	cmp    %eax,%edx
  100d7d:	72 40                	jb     100dbf <pmmap_merge+0xa5>
  100d7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d82:	8b 50 08             	mov    0x8(%eax),%edx
  100d85:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100d88:	8b 40 08             	mov    0x8(%eax),%eax
  100d8b:	39 c2                	cmp    %eax,%edx
  100d8d:	75 30                	jne    100dbf <pmmap_merge+0xa5>
  100d8f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100d92:	8b 50 04             	mov    0x4(%eax),%edx
  100d95:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d98:	8b 40 04             	mov    0x4(%eax),%eax
  100d9b:	83 ec 08             	sub    $0x8,%esp
  100d9e:	52                   	push   %edx
  100d9f:	50                   	push   %eax
  100da0:	e8 8d 30 00 00       	call   103e32 <max>
  100da5:	83 c4 10             	add    $0x10,%esp
  100da8:	89 c2                	mov    %eax,%edx
  100daa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dad:	89 50 04             	mov    %edx,0x4(%eax)
  100db0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100db3:	8b 40 0c             	mov    0xc(%eax),%eax
  100db6:	8b 50 0c             	mov    0xc(%eax),%edx
  100db9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dbc:	89 50 0c             	mov    %edx,0xc(%eax)
  100dbf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100dc2:	8b 40 0c             	mov    0xc(%eax),%eax
  100dc5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100dc8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100dcc:	75 85                	jne    100d53 <pmmap_merge+0x39>
  100dce:	eb 01                	jmp    100dd1 <pmmap_merge+0xb7>
  100dd0:	90                   	nop
  100dd1:	8b 83 24 7e 00 00    	mov    0x7e24(%ebx),%eax
  100dd7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100dda:	e9 cf 00 00 00       	jmp    100eae <pmmap_merge+0x194>
  100ddf:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100de2:	8b 40 08             	mov    0x8(%eax),%eax
  100de5:	83 f8 01             	cmp    $0x1,%eax
  100de8:	74 3d                	je     100e27 <pmmap_merge+0x10d>
  100dea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ded:	8b 40 08             	mov    0x8(%eax),%eax
  100df0:	83 f8 02             	cmp    $0x2,%eax
  100df3:	74 2b                	je     100e20 <pmmap_merge+0x106>
  100df5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100df8:	8b 40 08             	mov    0x8(%eax),%eax
  100dfb:	83 f8 03             	cmp    $0x3,%eax
  100dfe:	74 19                	je     100e19 <pmmap_merge+0xff>
  100e00:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e03:	8b 40 08             	mov    0x8(%eax),%eax
  100e06:	83 f8 04             	cmp    $0x4,%eax
  100e09:	75 07                	jne    100e12 <pmmap_merge+0xf8>
  100e0b:	b8 03 00 00 00       	mov    $0x3,%eax
  100e10:	eb 1a                	jmp    100e2c <pmmap_merge+0x112>
  100e12:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100e17:	eb 13                	jmp    100e2c <pmmap_merge+0x112>
  100e19:	b8 02 00 00 00       	mov    $0x2,%eax
  100e1e:	eb 0c                	jmp    100e2c <pmmap_merge+0x112>
  100e20:	b8 01 00 00 00       	mov    $0x1,%eax
  100e25:	eb 05                	jmp    100e2c <pmmap_merge+0x112>
  100e27:	b8 00 00 00 00       	mov    $0x0,%eax
  100e2c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100e2f:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%ebp)
  100e33:	75 1f                	jne    100e54 <pmmap_merge+0x13a>
  100e35:	8d 83 62 cf ff ff    	lea    -0x309e(%ebx),%eax
  100e3b:	50                   	push   %eax
  100e3c:	8d 83 73 cf ff ff    	lea    -0x308d(%ebx),%eax
  100e42:	50                   	push   %eax
  100e43:	6a 71                	push   $0x71
  100e45:	8d 83 51 cf ff ff    	lea    -0x30af(%ebx),%eax
  100e4b:	50                   	push   %eax
  100e4c:	e8 10 23 00 00       	call   103161 <debug_panic>
  100e51:	83 c4 10             	add    $0x10,%esp
  100e54:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e57:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100e5b:	85 c0                	test   %eax,%eax
  100e5d:	74 1f                	je     100e7e <pmmap_merge+0x164>
  100e5f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e62:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100e66:	8b 50 10             	mov    0x10(%eax),%edx
  100e69:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e6c:	89 50 10             	mov    %edx,0x10(%eax)
  100e6f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e72:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
  100e76:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100e79:	89 50 10             	mov    %edx,0x10(%eax)
  100e7c:	eb 1d                	jmp    100e9b <pmmap_merge+0x181>
  100e7e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e81:	8b 94 83 28 7e 00 00 	mov    0x7e28(%ebx,%eax,4),%edx
  100e88:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100e8b:	89 50 10             	mov    %edx,0x10(%eax)
  100e8e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e91:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100e94:	89 94 83 28 7e 00 00 	mov    %edx,0x7e28(%ebx,%eax,4)
  100e9b:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100e9e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ea1:	89 54 85 dc          	mov    %edx,-0x24(%ebp,%eax,4)
  100ea5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ea8:	8b 40 0c             	mov    0xc(%eax),%eax
  100eab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100eae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100eb2:	0f 85 27 ff ff ff    	jne    100ddf <pmmap_merge+0xc5>
  100eb8:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100ebb:	85 c0                	test   %eax,%eax
  100ebd:	74 0c                	je     100ecb <pmmap_merge+0x1b1>
  100ebf:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100ec2:	8b 40 04             	mov    0x4(%eax),%eax
  100ec5:	89 83 38 7e 00 00    	mov    %eax,0x7e38(%ebx)
  100ecb:	90                   	nop
  100ecc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100ecf:	c9                   	leave  
  100ed0:	c3                   	ret    

00100ed1 <pmmap_dump>:
  100ed1:	55                   	push   %ebp
  100ed2:	89 e5                	mov    %esp,%ebp
  100ed4:	53                   	push   %ebx
  100ed5:	83 ec 14             	sub    $0x14,%esp
  100ed8:	e8 36 f5 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  100edd:	81 c3 23 81 00 00    	add    $0x8123,%ebx
  100ee3:	8b 83 24 7e 00 00    	mov    0x7e24(%ebx),%eax
  100ee9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100eec:	e9 a5 00 00 00       	jmp    100f96 <pmmap_dump+0xc5>
  100ef1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ef4:	8b 40 08             	mov    0x8(%eax),%eax
  100ef7:	83 f8 01             	cmp    $0x1,%eax
  100efa:	74 41                	je     100f3d <pmmap_dump+0x6c>
  100efc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100eff:	8b 40 08             	mov    0x8(%eax),%eax
  100f02:	83 f8 02             	cmp    $0x2,%eax
  100f05:	74 2e                	je     100f35 <pmmap_dump+0x64>
  100f07:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f0a:	8b 40 08             	mov    0x8(%eax),%eax
  100f0d:	83 f8 03             	cmp    $0x3,%eax
  100f10:	74 1b                	je     100f2d <pmmap_dump+0x5c>
  100f12:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f15:	8b 40 08             	mov    0x8(%eax),%eax
  100f18:	83 f8 04             	cmp    $0x4,%eax
  100f1b:	75 08                	jne    100f25 <pmmap_dump+0x54>
  100f1d:	8d 83 90 cf ff ff    	lea    -0x3070(%ebx),%eax
  100f23:	eb 1e                	jmp    100f43 <pmmap_dump+0x72>
  100f25:	8d 83 99 cf ff ff    	lea    -0x3067(%ebx),%eax
  100f2b:	eb 16                	jmp    100f43 <pmmap_dump+0x72>
  100f2d:	8d 83 a1 cf ff ff    	lea    -0x305f(%ebx),%eax
  100f33:	eb 0e                	jmp    100f43 <pmmap_dump+0x72>
  100f35:	8d 83 ab cf ff ff    	lea    -0x3055(%ebx),%eax
  100f3b:	eb 06                	jmp    100f43 <pmmap_dump+0x72>
  100f3d:	8d 83 b4 cf ff ff    	lea    -0x304c(%ebx),%eax
  100f43:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f46:	8b 0a                	mov    (%edx),%ecx
  100f48:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f4b:	8b 52 04             	mov    0x4(%edx),%edx
  100f4e:	39 d1                	cmp    %edx,%ecx
  100f50:	75 08                	jne    100f5a <pmmap_dump+0x89>
  100f52:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f55:	8b 52 04             	mov    0x4(%edx),%edx
  100f58:	eb 1c                	jmp    100f76 <pmmap_dump+0xa5>
  100f5a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f5d:	8b 52 04             	mov    0x4(%edx),%edx
  100f60:	83 fa ff             	cmp    $0xffffffff,%edx
  100f63:	75 08                	jne    100f6d <pmmap_dump+0x9c>
  100f65:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f68:	8b 52 04             	mov    0x4(%edx),%edx
  100f6b:	eb 09                	jmp    100f76 <pmmap_dump+0xa5>
  100f6d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f70:	8b 52 04             	mov    0x4(%edx),%edx
  100f73:	83 ea 01             	sub    $0x1,%edx
  100f76:	8b 4d f4             	mov    -0xc(%ebp),%ecx
  100f79:	8b 09                	mov    (%ecx),%ecx
  100f7b:	50                   	push   %eax
  100f7c:	52                   	push   %edx
  100f7d:	51                   	push   %ecx
  100f7e:	8d 83 bc cf ff ff    	lea    -0x3044(%ebx),%eax
  100f84:	50                   	push   %eax
  100f85:	e8 ec 20 00 00       	call   103076 <debug_info>
  100f8a:	83 c4 10             	add    $0x10,%esp
  100f8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f90:	8b 40 0c             	mov    0xc(%eax),%eax
  100f93:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100f96:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100f9a:	0f 85 51 ff ff ff    	jne    100ef1 <pmmap_dump+0x20>
  100fa0:	90                   	nop
  100fa1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  100fa4:	c9                   	leave  
  100fa5:	c3                   	ret    

00100fa6 <pmmap_init>:
  100fa6:	55                   	push   %ebp
  100fa7:	89 e5                	mov    %esp,%ebp
  100fa9:	53                   	push   %ebx
  100faa:	83 ec 24             	sub    $0x24,%esp
  100fad:	e8 61 f4 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  100fb2:	81 c3 4e 80 00 00    	add    $0x804e,%ebx
  100fb8:	83 ec 0c             	sub    $0xc,%esp
  100fbb:	8d 83 dd cf ff ff    	lea    -0x3023(%ebx),%eax
  100fc1:	50                   	push   %eax
  100fc2:	e8 af 20 00 00       	call   103076 <debug_info>
  100fc7:	83 c4 10             	add    $0x10,%esp
  100fca:	8b 45 08             	mov    0x8(%ebp),%eax
  100fcd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  100fd0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100fd3:	8b 40 30             	mov    0x30(%eax),%eax
  100fd6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100fd9:	c7 83 24 7e 00 00 00 	movl   $0x0,0x7e24(%ebx)
  100fe0:	00 00 00 
  100fe3:	c7 83 28 7e 00 00 00 	movl   $0x0,0x7e28(%ebx)
  100fea:	00 00 00 
  100fed:	c7 83 2c 7e 00 00 00 	movl   $0x0,0x7e2c(%ebx)
  100ff4:	00 00 00 
  100ff7:	c7 83 30 7e 00 00 00 	movl   $0x0,0x7e30(%ebx)
  100ffe:	00 00 00 
  101001:	c7 83 34 7e 00 00 00 	movl   $0x0,0x7e34(%ebx)
  101008:	00 00 00 
  10100b:	eb 6c                	jmp    101079 <pmmap_init+0xd3>
  10100d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101010:	8b 40 08             	mov    0x8(%eax),%eax
  101013:	85 c0                	test   %eax,%eax
  101015:	75 58                	jne    10106f <pmmap_init+0xc9>
  101017:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10101a:	8b 40 04             	mov    0x4(%eax),%eax
  10101d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  101020:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101023:	8b 40 10             	mov    0x10(%eax),%eax
  101026:	85 c0                	test   %eax,%eax
  101028:	75 0f                	jne    101039 <pmmap_init+0x93>
  10102a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10102d:	8b 40 0c             	mov    0xc(%eax),%eax
  101030:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  101033:	f7 d2                	not    %edx
  101035:	39 d0                	cmp    %edx,%eax
  101037:	72 09                	jb     101042 <pmmap_init+0x9c>
  101039:	c7 45 f0 ff ff ff ff 	movl   $0xffffffff,-0x10(%ebp)
  101040:	eb 0e                	jmp    101050 <pmmap_init+0xaa>
  101042:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101045:	8b 50 0c             	mov    0xc(%eax),%edx
  101048:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10104b:	01 d0                	add    %edx,%eax
  10104d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  101050:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101053:	8b 40 14             	mov    0x14(%eax),%eax
  101056:	89 45 e0             	mov    %eax,-0x20(%ebp)
  101059:	83 ec 04             	sub    $0x4,%esp
  10105c:	ff 75 e0             	pushl  -0x20(%ebp)
  10105f:	ff 75 f0             	pushl  -0x10(%ebp)
  101062:	ff 75 e4             	pushl  -0x1c(%ebp)
  101065:	e8 ef fb ff ff       	call   100c59 <pmmap_insert>
  10106a:	83 c4 10             	add    $0x10,%esp
  10106d:	eb 01                	jmp    101070 <pmmap_init+0xca>
  10106f:	90                   	nop
  101070:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101073:	83 c0 18             	add    $0x18,%eax
  101076:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101079:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10107c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10107f:	8b 40 30             	mov    0x30(%eax),%eax
  101082:	29 c2                	sub    %eax,%edx
  101084:	8b 45 e8             	mov    -0x18(%ebp),%eax
  101087:	8b 40 2c             	mov    0x2c(%eax),%eax
  10108a:	39 c2                	cmp    %eax,%edx
  10108c:	0f 82 7b ff ff ff    	jb     10100d <pmmap_init+0x67>
  101092:	e8 83 fc ff ff       	call   100d1a <pmmap_merge>
  101097:	e8 35 fe ff ff       	call   100ed1 <pmmap_dump>
  10109c:	8b 83 24 7e 00 00    	mov    0x7e24(%ebx),%eax
  1010a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1010a5:	eb 18                	jmp    1010bf <pmmap_init+0x119>
  1010a7:	8b 83 40 7e 00 00    	mov    0x7e40(%ebx),%eax
  1010ad:	83 c0 01             	add    $0x1,%eax
  1010b0:	89 83 40 7e 00 00    	mov    %eax,0x7e40(%ebx)
  1010b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1010b9:	8b 40 0c             	mov    0xc(%eax),%eax
  1010bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1010bf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  1010c3:	75 e2                	jne    1010a7 <pmmap_init+0x101>
  1010c5:	8b 83 38 7e 00 00    	mov    0x7e38(%ebx),%eax
  1010cb:	83 ec 08             	sub    $0x8,%esp
  1010ce:	68 00 10 00 00       	push   $0x1000
  1010d3:	50                   	push   %eax
  1010d4:	e8 8b 2d 00 00       	call   103e64 <rounddown>
  1010d9:	83 c4 10             	add    $0x10,%esp
  1010dc:	c1 e8 0c             	shr    $0xc,%eax
  1010df:	89 83 3c 7e 00 00    	mov    %eax,0x7e3c(%ebx)
  1010e5:	90                   	nop
  1010e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1010e9:	c9                   	leave  
  1010ea:	c3                   	ret    

001010eb <get_size>:
  1010eb:	55                   	push   %ebp
  1010ec:	89 e5                	mov    %esp,%ebp
  1010ee:	e8 18 f3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1010f3:	05 0d 7f 00 00       	add    $0x7f0d,%eax
  1010f8:	8b 80 40 7e 00 00    	mov    0x7e40(%eax),%eax
  1010fe:	5d                   	pop    %ebp
  1010ff:	c3                   	ret    

00101100 <get_mms>:
  101100:	55                   	push   %ebp
  101101:	89 e5                	mov    %esp,%ebp
  101103:	83 ec 10             	sub    $0x10,%esp
  101106:	e8 00 f3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  10110b:	05 f5 7e 00 00       	add    $0x7ef5,%eax
  101110:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101117:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  10111e:	8b 90 24 7e 00 00    	mov    0x7e24(%eax),%edx
  101124:	89 55 f8             	mov    %edx,-0x8(%ebp)
  101127:	eb 15                	jmp    10113e <get_mms+0x3e>
  101129:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10112c:	3b 55 08             	cmp    0x8(%ebp),%edx
  10112f:	74 15                	je     101146 <get_mms+0x46>
  101131:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101135:	8b 55 f8             	mov    -0x8(%ebp),%edx
  101138:	8b 52 0c             	mov    0xc(%edx),%edx
  10113b:	89 55 f8             	mov    %edx,-0x8(%ebp)
  10113e:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  101142:	75 e5                	jne    101129 <get_mms+0x29>
  101144:	eb 01                	jmp    101147 <get_mms+0x47>
  101146:	90                   	nop
  101147:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  10114b:	74 0b                	je     101158 <get_mms+0x58>
  10114d:	8b 80 40 7e 00 00    	mov    0x7e40(%eax),%eax
  101153:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  101156:	75 07                	jne    10115f <get_mms+0x5f>
  101158:	b8 00 00 00 00       	mov    $0x0,%eax
  10115d:	eb 05                	jmp    101164 <get_mms+0x64>
  10115f:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101162:	8b 00                	mov    (%eax),%eax
  101164:	c9                   	leave  
  101165:	c3                   	ret    

00101166 <get_mml>:
  101166:	55                   	push   %ebp
  101167:	89 e5                	mov    %esp,%ebp
  101169:	83 ec 10             	sub    $0x10,%esp
  10116c:	e8 9a f2 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  101171:	05 8f 7e 00 00       	add    $0x7e8f,%eax
  101176:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10117d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  101184:	8b 90 24 7e 00 00    	mov    0x7e24(%eax),%edx
  10118a:	89 55 f8             	mov    %edx,-0x8(%ebp)
  10118d:	eb 15                	jmp    1011a4 <get_mml+0x3e>
  10118f:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101192:	3b 55 08             	cmp    0x8(%ebp),%edx
  101195:	74 15                	je     1011ac <get_mml+0x46>
  101197:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10119b:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10119e:	8b 52 0c             	mov    0xc(%edx),%edx
  1011a1:	89 55 f8             	mov    %edx,-0x8(%ebp)
  1011a4:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  1011a8:	75 e5                	jne    10118f <get_mml+0x29>
  1011aa:	eb 01                	jmp    1011ad <get_mml+0x47>
  1011ac:	90                   	nop
  1011ad:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  1011b1:	74 0b                	je     1011be <get_mml+0x58>
  1011b3:	8b 80 40 7e 00 00    	mov    0x7e40(%eax),%eax
  1011b9:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  1011bc:	75 07                	jne    1011c5 <get_mml+0x5f>
  1011be:	b8 00 00 00 00       	mov    $0x0,%eax
  1011c3:	eb 0f                	jmp    1011d4 <get_mml+0x6e>
  1011c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1011c8:	8b 50 04             	mov    0x4(%eax),%edx
  1011cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1011ce:	8b 00                	mov    (%eax),%eax
  1011d0:	29 c2                	sub    %eax,%edx
  1011d2:	89 d0                	mov    %edx,%eax
  1011d4:	c9                   	leave  
  1011d5:	c3                   	ret    

001011d6 <is_usable>:
  1011d6:	55                   	push   %ebp
  1011d7:	89 e5                	mov    %esp,%ebp
  1011d9:	83 ec 10             	sub    $0x10,%esp
  1011dc:	e8 2a f2 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1011e1:	05 1f 7e 00 00       	add    $0x7e1f,%eax
  1011e6:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1011ed:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1011f4:	8b 90 24 7e 00 00    	mov    0x7e24(%eax),%edx
  1011fa:	89 55 f8             	mov    %edx,-0x8(%ebp)
  1011fd:	eb 15                	jmp    101214 <is_usable+0x3e>
  1011ff:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101202:	3b 55 08             	cmp    0x8(%ebp),%edx
  101205:	74 15                	je     10121c <is_usable+0x46>
  101207:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  10120b:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10120e:	8b 52 0c             	mov    0xc(%edx),%edx
  101211:	89 55 f8             	mov    %edx,-0x8(%ebp)
  101214:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  101218:	75 e5                	jne    1011ff <is_usable+0x29>
  10121a:	eb 01                	jmp    10121d <is_usable+0x47>
  10121c:	90                   	nop
  10121d:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  101221:	74 0b                	je     10122e <is_usable+0x58>
  101223:	8b 80 40 7e 00 00    	mov    0x7e40(%eax),%eax
  101229:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  10122c:	75 07                	jne    101235 <is_usable+0x5f>
  10122e:	b8 00 00 00 00       	mov    $0x0,%eax
  101233:	eb 0f                	jmp    101244 <is_usable+0x6e>
  101235:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101238:	8b 40 08             	mov    0x8(%eax),%eax
  10123b:	83 f8 01             	cmp    $0x1,%eax
  10123e:	0f 94 c0             	sete   %al
  101241:	0f b6 c0             	movzbl %al,%eax
  101244:	c9                   	leave  
  101245:	c3                   	ret    

00101246 <set_cr3>:
  101246:	55                   	push   %ebp
  101247:	89 e5                	mov    %esp,%ebp
  101249:	53                   	push   %ebx
  10124a:	83 ec 04             	sub    $0x4,%esp
  10124d:	e8 b9 f1 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  101252:	05 ae 7d 00 00       	add    $0x7dae,%eax
  101257:	8b 55 08             	mov    0x8(%ebp),%edx
  10125a:	83 ec 0c             	sub    $0xc,%esp
  10125d:	52                   	push   %edx
  10125e:	89 c3                	mov    %eax,%ebx
  101260:	e8 7d 2e 00 00       	call   1040e2 <lcr3>
  101265:	83 c4 10             	add    $0x10,%esp
  101268:	90                   	nop
  101269:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10126c:	c9                   	leave  
  10126d:	c3                   	ret    

0010126e <enable_paging>:
  10126e:	55                   	push   %ebp
  10126f:	89 e5                	mov    %esp,%ebp
  101271:	53                   	push   %ebx
  101272:	83 ec 14             	sub    $0x14,%esp
  101275:	e8 99 f1 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  10127a:	81 c3 86 7d 00 00    	add    $0x7d86,%ebx
  101280:	e8 89 2e 00 00       	call   10410e <rcr4>
  101285:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101288:	81 4d f4 80 00 00 00 	orl    $0x80,-0xc(%ebp)
  10128f:	83 ec 0c             	sub    $0xc,%esp
  101292:	ff 75 f4             	pushl  -0xc(%ebp)
  101295:	e8 5e 2e 00 00       	call   1040f8 <lcr4>
  10129a:	83 c4 10             	add    $0x10,%esp
  10129d:	e8 0a 2e 00 00       	call   1040ac <rcr0>
  1012a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1012a5:	81 4d f0 23 00 05 80 	orl    $0x80050023,-0x10(%ebp)
  1012ac:	83 65 f0 f3          	andl   $0xfffffff3,-0x10(%ebp)
  1012b0:	83 ec 0c             	sub    $0xc,%esp
  1012b3:	ff 75 f0             	pushl  -0x10(%ebp)
  1012b6:	e8 db 2d 00 00       	call   104096 <lcr0>
  1012bb:	83 c4 10             	add    $0x10,%esp
  1012be:	90                   	nop
  1012bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1012c2:	c9                   	leave  
  1012c3:	c3                   	ret    

001012c4 <intr_init_idt>:
  1012c4:	55                   	push   %ebp
  1012c5:	89 e5                	mov    %esp,%ebp
  1012c7:	53                   	push   %ebx
  1012c8:	83 ec 10             	sub    $0x10,%esp
  1012cb:	e8 3b f1 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1012d0:	05 30 7d 00 00       	add    $0x7d30,%eax
  1012d5:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  1012dc:	e9 c3 00 00 00       	jmp    1013a4 <intr_init_idt+0xe0>
  1012e1:	c7 c2 7e 2d 10 00    	mov    $0x102d7e,%edx
  1012e7:	89 d3                	mov    %edx,%ebx
  1012e9:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1012ef:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  1012f2:	66 89 1c ca          	mov    %bx,(%edx,%ecx,8)
  1012f6:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1012fc:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  1012ff:	66 c7 44 ca 02 08 00 	movw   $0x8,0x2(%edx,%ecx,8)
  101306:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10130c:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  10130f:	0f b6 5c ca 04       	movzbl 0x4(%edx,%ecx,8),%ebx
  101314:	83 e3 e0             	and    $0xffffffe0,%ebx
  101317:	88 5c ca 04          	mov    %bl,0x4(%edx,%ecx,8)
  10131b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101321:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  101324:	0f b6 5c ca 04       	movzbl 0x4(%edx,%ecx,8),%ebx
  101329:	83 e3 1f             	and    $0x1f,%ebx
  10132c:	88 5c ca 04          	mov    %bl,0x4(%edx,%ecx,8)
  101330:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101336:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  101339:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  10133e:	83 e3 f0             	and    $0xfffffff0,%ebx
  101341:	83 cb 0e             	or     $0xe,%ebx
  101344:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  101348:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10134e:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  101351:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  101356:	83 e3 ef             	and    $0xffffffef,%ebx
  101359:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  10135d:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101363:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  101366:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  10136b:	83 e3 9f             	and    $0xffffff9f,%ebx
  10136e:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  101372:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101378:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  10137b:	0f b6 5c ca 05       	movzbl 0x5(%edx,%ecx,8),%ebx
  101380:	83 cb 80             	or     $0xffffff80,%ebx
  101383:	88 5c ca 05          	mov    %bl,0x5(%edx,%ecx,8)
  101387:	c7 c2 7e 2d 10 00    	mov    $0x102d7e,%edx
  10138d:	c1 ea 10             	shr    $0x10,%edx
  101390:	89 d3                	mov    %edx,%ebx
  101392:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101398:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  10139b:	66 89 5c ca 06       	mov    %bx,0x6(%edx,%ecx,8)
  1013a0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  1013a4:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1013a7:	81 fa ff 00 00 00    	cmp    $0xff,%edx
  1013ad:	0f 86 2e ff ff ff    	jbe    1012e1 <intr_init_idt+0x1d>
  1013b3:	c7 c2 20 2c 10 00    	mov    $0x102c20,%edx
  1013b9:	89 d1                	mov    %edx,%ecx
  1013bb:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1013c1:	66 89 0a             	mov    %cx,(%edx)
  1013c4:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1013ca:	66 c7 42 02 08 00    	movw   $0x8,0x2(%edx)
  1013d0:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1013d6:	0f b6 4a 04          	movzbl 0x4(%edx),%ecx
  1013da:	83 e1 e0             	and    $0xffffffe0,%ecx
  1013dd:	88 4a 04             	mov    %cl,0x4(%edx)
  1013e0:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1013e6:	0f b6 4a 04          	movzbl 0x4(%edx),%ecx
  1013ea:	83 e1 1f             	and    $0x1f,%ecx
  1013ed:	88 4a 04             	mov    %cl,0x4(%edx)
  1013f0:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1013f6:	0f b6 4a 05          	movzbl 0x5(%edx),%ecx
  1013fa:	83 e1 f0             	and    $0xfffffff0,%ecx
  1013fd:	83 c9 0e             	or     $0xe,%ecx
  101400:	88 4a 05             	mov    %cl,0x5(%edx)
  101403:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101409:	0f b6 4a 05          	movzbl 0x5(%edx),%ecx
  10140d:	83 e1 ef             	and    $0xffffffef,%ecx
  101410:	88 4a 05             	mov    %cl,0x5(%edx)
  101413:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101419:	0f b6 4a 05          	movzbl 0x5(%edx),%ecx
  10141d:	83 e1 9f             	and    $0xffffff9f,%ecx
  101420:	88 4a 05             	mov    %cl,0x5(%edx)
  101423:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101429:	0f b6 4a 05          	movzbl 0x5(%edx),%ecx
  10142d:	83 c9 80             	or     $0xffffff80,%ecx
  101430:	88 4a 05             	mov    %cl,0x5(%edx)
  101433:	c7 c2 20 2c 10 00    	mov    $0x102c20,%edx
  101439:	c1 ea 10             	shr    $0x10,%edx
  10143c:	89 d1                	mov    %edx,%ecx
  10143e:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101444:	66 89 4a 06          	mov    %cx,0x6(%edx)
  101448:	c7 c2 2a 2c 10 00    	mov    $0x102c2a,%edx
  10144e:	89 d1                	mov    %edx,%ecx
  101450:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101456:	66 89 4a 08          	mov    %cx,0x8(%edx)
  10145a:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101460:	66 c7 42 0a 08 00    	movw   $0x8,0xa(%edx)
  101466:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10146c:	0f b6 4a 0c          	movzbl 0xc(%edx),%ecx
  101470:	83 e1 e0             	and    $0xffffffe0,%ecx
  101473:	88 4a 0c             	mov    %cl,0xc(%edx)
  101476:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10147c:	0f b6 4a 0c          	movzbl 0xc(%edx),%ecx
  101480:	83 e1 1f             	and    $0x1f,%ecx
  101483:	88 4a 0c             	mov    %cl,0xc(%edx)
  101486:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10148c:	0f b6 4a 0d          	movzbl 0xd(%edx),%ecx
  101490:	83 e1 f0             	and    $0xfffffff0,%ecx
  101493:	83 c9 0e             	or     $0xe,%ecx
  101496:	88 4a 0d             	mov    %cl,0xd(%edx)
  101499:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10149f:	0f b6 4a 0d          	movzbl 0xd(%edx),%ecx
  1014a3:	83 e1 ef             	and    $0xffffffef,%ecx
  1014a6:	88 4a 0d             	mov    %cl,0xd(%edx)
  1014a9:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1014af:	0f b6 4a 0d          	movzbl 0xd(%edx),%ecx
  1014b3:	83 e1 9f             	and    $0xffffff9f,%ecx
  1014b6:	88 4a 0d             	mov    %cl,0xd(%edx)
  1014b9:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1014bf:	0f b6 4a 0d          	movzbl 0xd(%edx),%ecx
  1014c3:	83 c9 80             	or     $0xffffff80,%ecx
  1014c6:	88 4a 0d             	mov    %cl,0xd(%edx)
  1014c9:	c7 c2 2a 2c 10 00    	mov    $0x102c2a,%edx
  1014cf:	c1 ea 10             	shr    $0x10,%edx
  1014d2:	89 d1                	mov    %edx,%ecx
  1014d4:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1014da:	66 89 4a 0e          	mov    %cx,0xe(%edx)
  1014de:	c7 c2 34 2c 10 00    	mov    $0x102c34,%edx
  1014e4:	89 d1                	mov    %edx,%ecx
  1014e6:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1014ec:	66 89 4a 10          	mov    %cx,0x10(%edx)
  1014f0:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1014f6:	66 c7 42 12 08 00    	movw   $0x8,0x12(%edx)
  1014fc:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101502:	0f b6 4a 14          	movzbl 0x14(%edx),%ecx
  101506:	83 e1 e0             	and    $0xffffffe0,%ecx
  101509:	88 4a 14             	mov    %cl,0x14(%edx)
  10150c:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101512:	0f b6 4a 14          	movzbl 0x14(%edx),%ecx
  101516:	83 e1 1f             	and    $0x1f,%ecx
  101519:	88 4a 14             	mov    %cl,0x14(%edx)
  10151c:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101522:	0f b6 4a 15          	movzbl 0x15(%edx),%ecx
  101526:	83 e1 f0             	and    $0xfffffff0,%ecx
  101529:	83 c9 0e             	or     $0xe,%ecx
  10152c:	88 4a 15             	mov    %cl,0x15(%edx)
  10152f:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101535:	0f b6 4a 15          	movzbl 0x15(%edx),%ecx
  101539:	83 e1 ef             	and    $0xffffffef,%ecx
  10153c:	88 4a 15             	mov    %cl,0x15(%edx)
  10153f:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101545:	0f b6 4a 15          	movzbl 0x15(%edx),%ecx
  101549:	83 e1 9f             	and    $0xffffff9f,%ecx
  10154c:	88 4a 15             	mov    %cl,0x15(%edx)
  10154f:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101555:	0f b6 4a 15          	movzbl 0x15(%edx),%ecx
  101559:	83 c9 80             	or     $0xffffff80,%ecx
  10155c:	88 4a 15             	mov    %cl,0x15(%edx)
  10155f:	c7 c2 34 2c 10 00    	mov    $0x102c34,%edx
  101565:	c1 ea 10             	shr    $0x10,%edx
  101568:	89 d1                	mov    %edx,%ecx
  10156a:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101570:	66 89 4a 16          	mov    %cx,0x16(%edx)
  101574:	c7 c2 3e 2c 10 00    	mov    $0x102c3e,%edx
  10157a:	89 d1                	mov    %edx,%ecx
  10157c:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101582:	66 89 4a 18          	mov    %cx,0x18(%edx)
  101586:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10158c:	66 c7 42 1a 08 00    	movw   $0x8,0x1a(%edx)
  101592:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101598:	0f b6 4a 1c          	movzbl 0x1c(%edx),%ecx
  10159c:	83 e1 e0             	and    $0xffffffe0,%ecx
  10159f:	88 4a 1c             	mov    %cl,0x1c(%edx)
  1015a2:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1015a8:	0f b6 4a 1c          	movzbl 0x1c(%edx),%ecx
  1015ac:	83 e1 1f             	and    $0x1f,%ecx
  1015af:	88 4a 1c             	mov    %cl,0x1c(%edx)
  1015b2:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1015b8:	0f b6 4a 1d          	movzbl 0x1d(%edx),%ecx
  1015bc:	83 e1 f0             	and    $0xfffffff0,%ecx
  1015bf:	83 c9 0e             	or     $0xe,%ecx
  1015c2:	88 4a 1d             	mov    %cl,0x1d(%edx)
  1015c5:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1015cb:	0f b6 4a 1d          	movzbl 0x1d(%edx),%ecx
  1015cf:	83 e1 ef             	and    $0xffffffef,%ecx
  1015d2:	88 4a 1d             	mov    %cl,0x1d(%edx)
  1015d5:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1015db:	0f b6 4a 1d          	movzbl 0x1d(%edx),%ecx
  1015df:	83 c9 60             	or     $0x60,%ecx
  1015e2:	88 4a 1d             	mov    %cl,0x1d(%edx)
  1015e5:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1015eb:	0f b6 4a 1d          	movzbl 0x1d(%edx),%ecx
  1015ef:	83 c9 80             	or     $0xffffff80,%ecx
  1015f2:	88 4a 1d             	mov    %cl,0x1d(%edx)
  1015f5:	c7 c2 3e 2c 10 00    	mov    $0x102c3e,%edx
  1015fb:	c1 ea 10             	shr    $0x10,%edx
  1015fe:	89 d1                	mov    %edx,%ecx
  101600:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101606:	66 89 4a 1e          	mov    %cx,0x1e(%edx)
  10160a:	c7 c2 48 2c 10 00    	mov    $0x102c48,%edx
  101610:	89 d1                	mov    %edx,%ecx
  101612:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101618:	66 89 4a 20          	mov    %cx,0x20(%edx)
  10161c:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101622:	66 c7 42 22 08 00    	movw   $0x8,0x22(%edx)
  101628:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10162e:	0f b6 4a 24          	movzbl 0x24(%edx),%ecx
  101632:	83 e1 e0             	and    $0xffffffe0,%ecx
  101635:	88 4a 24             	mov    %cl,0x24(%edx)
  101638:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10163e:	0f b6 4a 24          	movzbl 0x24(%edx),%ecx
  101642:	83 e1 1f             	and    $0x1f,%ecx
  101645:	88 4a 24             	mov    %cl,0x24(%edx)
  101648:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10164e:	0f b6 4a 25          	movzbl 0x25(%edx),%ecx
  101652:	83 e1 f0             	and    $0xfffffff0,%ecx
  101655:	83 c9 0e             	or     $0xe,%ecx
  101658:	88 4a 25             	mov    %cl,0x25(%edx)
  10165b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101661:	0f b6 4a 25          	movzbl 0x25(%edx),%ecx
  101665:	83 e1 ef             	and    $0xffffffef,%ecx
  101668:	88 4a 25             	mov    %cl,0x25(%edx)
  10166b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101671:	0f b6 4a 25          	movzbl 0x25(%edx),%ecx
  101675:	83 c9 60             	or     $0x60,%ecx
  101678:	88 4a 25             	mov    %cl,0x25(%edx)
  10167b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101681:	0f b6 4a 25          	movzbl 0x25(%edx),%ecx
  101685:	83 c9 80             	or     $0xffffff80,%ecx
  101688:	88 4a 25             	mov    %cl,0x25(%edx)
  10168b:	c7 c2 48 2c 10 00    	mov    $0x102c48,%edx
  101691:	c1 ea 10             	shr    $0x10,%edx
  101694:	89 d1                	mov    %edx,%ecx
  101696:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10169c:	66 89 4a 26          	mov    %cx,0x26(%edx)
  1016a0:	c7 c2 52 2c 10 00    	mov    $0x102c52,%edx
  1016a6:	89 d1                	mov    %edx,%ecx
  1016a8:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1016ae:	66 89 4a 28          	mov    %cx,0x28(%edx)
  1016b2:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1016b8:	66 c7 42 2a 08 00    	movw   $0x8,0x2a(%edx)
  1016be:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1016c4:	0f b6 4a 2c          	movzbl 0x2c(%edx),%ecx
  1016c8:	83 e1 e0             	and    $0xffffffe0,%ecx
  1016cb:	88 4a 2c             	mov    %cl,0x2c(%edx)
  1016ce:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1016d4:	0f b6 4a 2c          	movzbl 0x2c(%edx),%ecx
  1016d8:	83 e1 1f             	and    $0x1f,%ecx
  1016db:	88 4a 2c             	mov    %cl,0x2c(%edx)
  1016de:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1016e4:	0f b6 4a 2d          	movzbl 0x2d(%edx),%ecx
  1016e8:	83 e1 f0             	and    $0xfffffff0,%ecx
  1016eb:	83 c9 0e             	or     $0xe,%ecx
  1016ee:	88 4a 2d             	mov    %cl,0x2d(%edx)
  1016f1:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1016f7:	0f b6 4a 2d          	movzbl 0x2d(%edx),%ecx
  1016fb:	83 e1 ef             	and    $0xffffffef,%ecx
  1016fe:	88 4a 2d             	mov    %cl,0x2d(%edx)
  101701:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101707:	0f b6 4a 2d          	movzbl 0x2d(%edx),%ecx
  10170b:	83 e1 9f             	and    $0xffffff9f,%ecx
  10170e:	88 4a 2d             	mov    %cl,0x2d(%edx)
  101711:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101717:	0f b6 4a 2d          	movzbl 0x2d(%edx),%ecx
  10171b:	83 c9 80             	or     $0xffffff80,%ecx
  10171e:	88 4a 2d             	mov    %cl,0x2d(%edx)
  101721:	c7 c2 52 2c 10 00    	mov    $0x102c52,%edx
  101727:	c1 ea 10             	shr    $0x10,%edx
  10172a:	89 d1                	mov    %edx,%ecx
  10172c:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101732:	66 89 4a 2e          	mov    %cx,0x2e(%edx)
  101736:	c7 c2 5c 2c 10 00    	mov    $0x102c5c,%edx
  10173c:	89 d1                	mov    %edx,%ecx
  10173e:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101744:	66 89 4a 30          	mov    %cx,0x30(%edx)
  101748:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10174e:	66 c7 42 32 08 00    	movw   $0x8,0x32(%edx)
  101754:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10175a:	0f b6 4a 34          	movzbl 0x34(%edx),%ecx
  10175e:	83 e1 e0             	and    $0xffffffe0,%ecx
  101761:	88 4a 34             	mov    %cl,0x34(%edx)
  101764:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10176a:	0f b6 4a 34          	movzbl 0x34(%edx),%ecx
  10176e:	83 e1 1f             	and    $0x1f,%ecx
  101771:	88 4a 34             	mov    %cl,0x34(%edx)
  101774:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10177a:	0f b6 4a 35          	movzbl 0x35(%edx),%ecx
  10177e:	83 e1 f0             	and    $0xfffffff0,%ecx
  101781:	83 c9 0e             	or     $0xe,%ecx
  101784:	88 4a 35             	mov    %cl,0x35(%edx)
  101787:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10178d:	0f b6 4a 35          	movzbl 0x35(%edx),%ecx
  101791:	83 e1 ef             	and    $0xffffffef,%ecx
  101794:	88 4a 35             	mov    %cl,0x35(%edx)
  101797:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10179d:	0f b6 4a 35          	movzbl 0x35(%edx),%ecx
  1017a1:	83 e1 9f             	and    $0xffffff9f,%ecx
  1017a4:	88 4a 35             	mov    %cl,0x35(%edx)
  1017a7:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1017ad:	0f b6 4a 35          	movzbl 0x35(%edx),%ecx
  1017b1:	83 c9 80             	or     $0xffffff80,%ecx
  1017b4:	88 4a 35             	mov    %cl,0x35(%edx)
  1017b7:	c7 c2 5c 2c 10 00    	mov    $0x102c5c,%edx
  1017bd:	c1 ea 10             	shr    $0x10,%edx
  1017c0:	89 d1                	mov    %edx,%ecx
  1017c2:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1017c8:	66 89 4a 36          	mov    %cx,0x36(%edx)
  1017cc:	c7 c2 66 2c 10 00    	mov    $0x102c66,%edx
  1017d2:	89 d1                	mov    %edx,%ecx
  1017d4:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1017da:	66 89 4a 38          	mov    %cx,0x38(%edx)
  1017de:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1017e4:	66 c7 42 3a 08 00    	movw   $0x8,0x3a(%edx)
  1017ea:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1017f0:	0f b6 4a 3c          	movzbl 0x3c(%edx),%ecx
  1017f4:	83 e1 e0             	and    $0xffffffe0,%ecx
  1017f7:	88 4a 3c             	mov    %cl,0x3c(%edx)
  1017fa:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101800:	0f b6 4a 3c          	movzbl 0x3c(%edx),%ecx
  101804:	83 e1 1f             	and    $0x1f,%ecx
  101807:	88 4a 3c             	mov    %cl,0x3c(%edx)
  10180a:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101810:	0f b6 4a 3d          	movzbl 0x3d(%edx),%ecx
  101814:	83 e1 f0             	and    $0xfffffff0,%ecx
  101817:	83 c9 0e             	or     $0xe,%ecx
  10181a:	88 4a 3d             	mov    %cl,0x3d(%edx)
  10181d:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101823:	0f b6 4a 3d          	movzbl 0x3d(%edx),%ecx
  101827:	83 e1 ef             	and    $0xffffffef,%ecx
  10182a:	88 4a 3d             	mov    %cl,0x3d(%edx)
  10182d:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101833:	0f b6 4a 3d          	movzbl 0x3d(%edx),%ecx
  101837:	83 e1 9f             	and    $0xffffff9f,%ecx
  10183a:	88 4a 3d             	mov    %cl,0x3d(%edx)
  10183d:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101843:	0f b6 4a 3d          	movzbl 0x3d(%edx),%ecx
  101847:	83 c9 80             	or     $0xffffff80,%ecx
  10184a:	88 4a 3d             	mov    %cl,0x3d(%edx)
  10184d:	c7 c2 66 2c 10 00    	mov    $0x102c66,%edx
  101853:	c1 ea 10             	shr    $0x10,%edx
  101856:	89 d1                	mov    %edx,%ecx
  101858:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10185e:	66 89 4a 3e          	mov    %cx,0x3e(%edx)
  101862:	c7 c2 70 2c 10 00    	mov    $0x102c70,%edx
  101868:	89 d1                	mov    %edx,%ecx
  10186a:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101870:	66 89 4a 40          	mov    %cx,0x40(%edx)
  101874:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10187a:	66 c7 42 42 08 00    	movw   $0x8,0x42(%edx)
  101880:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101886:	0f b6 4a 44          	movzbl 0x44(%edx),%ecx
  10188a:	83 e1 e0             	and    $0xffffffe0,%ecx
  10188d:	88 4a 44             	mov    %cl,0x44(%edx)
  101890:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101896:	0f b6 4a 44          	movzbl 0x44(%edx),%ecx
  10189a:	83 e1 1f             	and    $0x1f,%ecx
  10189d:	88 4a 44             	mov    %cl,0x44(%edx)
  1018a0:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1018a6:	0f b6 4a 45          	movzbl 0x45(%edx),%ecx
  1018aa:	83 e1 f0             	and    $0xfffffff0,%ecx
  1018ad:	83 c9 0e             	or     $0xe,%ecx
  1018b0:	88 4a 45             	mov    %cl,0x45(%edx)
  1018b3:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1018b9:	0f b6 4a 45          	movzbl 0x45(%edx),%ecx
  1018bd:	83 e1 ef             	and    $0xffffffef,%ecx
  1018c0:	88 4a 45             	mov    %cl,0x45(%edx)
  1018c3:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1018c9:	0f b6 4a 45          	movzbl 0x45(%edx),%ecx
  1018cd:	83 e1 9f             	and    $0xffffff9f,%ecx
  1018d0:	88 4a 45             	mov    %cl,0x45(%edx)
  1018d3:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1018d9:	0f b6 4a 45          	movzbl 0x45(%edx),%ecx
  1018dd:	83 c9 80             	or     $0xffffff80,%ecx
  1018e0:	88 4a 45             	mov    %cl,0x45(%edx)
  1018e3:	c7 c2 70 2c 10 00    	mov    $0x102c70,%edx
  1018e9:	c1 ea 10             	shr    $0x10,%edx
  1018ec:	89 d1                	mov    %edx,%ecx
  1018ee:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1018f4:	66 89 4a 46          	mov    %cx,0x46(%edx)
  1018f8:	c7 c2 82 2c 10 00    	mov    $0x102c82,%edx
  1018fe:	89 d1                	mov    %edx,%ecx
  101900:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101906:	66 89 4a 50          	mov    %cx,0x50(%edx)
  10190a:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101910:	66 c7 42 52 08 00    	movw   $0x8,0x52(%edx)
  101916:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10191c:	0f b6 4a 54          	movzbl 0x54(%edx),%ecx
  101920:	83 e1 e0             	and    $0xffffffe0,%ecx
  101923:	88 4a 54             	mov    %cl,0x54(%edx)
  101926:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10192c:	0f b6 4a 54          	movzbl 0x54(%edx),%ecx
  101930:	83 e1 1f             	and    $0x1f,%ecx
  101933:	88 4a 54             	mov    %cl,0x54(%edx)
  101936:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10193c:	0f b6 4a 55          	movzbl 0x55(%edx),%ecx
  101940:	83 e1 f0             	and    $0xfffffff0,%ecx
  101943:	83 c9 0e             	or     $0xe,%ecx
  101946:	88 4a 55             	mov    %cl,0x55(%edx)
  101949:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10194f:	0f b6 4a 55          	movzbl 0x55(%edx),%ecx
  101953:	83 e1 ef             	and    $0xffffffef,%ecx
  101956:	88 4a 55             	mov    %cl,0x55(%edx)
  101959:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10195f:	0f b6 4a 55          	movzbl 0x55(%edx),%ecx
  101963:	83 e1 9f             	and    $0xffffff9f,%ecx
  101966:	88 4a 55             	mov    %cl,0x55(%edx)
  101969:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10196f:	0f b6 4a 55          	movzbl 0x55(%edx),%ecx
  101973:	83 c9 80             	or     $0xffffff80,%ecx
  101976:	88 4a 55             	mov    %cl,0x55(%edx)
  101979:	c7 c2 82 2c 10 00    	mov    $0x102c82,%edx
  10197f:	c1 ea 10             	shr    $0x10,%edx
  101982:	89 d1                	mov    %edx,%ecx
  101984:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10198a:	66 89 4a 56          	mov    %cx,0x56(%edx)
  10198e:	c7 c2 8a 2c 10 00    	mov    $0x102c8a,%edx
  101994:	89 d1                	mov    %edx,%ecx
  101996:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10199c:	66 89 4a 58          	mov    %cx,0x58(%edx)
  1019a0:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1019a6:	66 c7 42 5a 08 00    	movw   $0x8,0x5a(%edx)
  1019ac:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1019b2:	0f b6 4a 5c          	movzbl 0x5c(%edx),%ecx
  1019b6:	83 e1 e0             	and    $0xffffffe0,%ecx
  1019b9:	88 4a 5c             	mov    %cl,0x5c(%edx)
  1019bc:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1019c2:	0f b6 4a 5c          	movzbl 0x5c(%edx),%ecx
  1019c6:	83 e1 1f             	and    $0x1f,%ecx
  1019c9:	88 4a 5c             	mov    %cl,0x5c(%edx)
  1019cc:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1019d2:	0f b6 4a 5d          	movzbl 0x5d(%edx),%ecx
  1019d6:	83 e1 f0             	and    $0xfffffff0,%ecx
  1019d9:	83 c9 0e             	or     $0xe,%ecx
  1019dc:	88 4a 5d             	mov    %cl,0x5d(%edx)
  1019df:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1019e5:	0f b6 4a 5d          	movzbl 0x5d(%edx),%ecx
  1019e9:	83 e1 ef             	and    $0xffffffef,%ecx
  1019ec:	88 4a 5d             	mov    %cl,0x5d(%edx)
  1019ef:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1019f5:	0f b6 4a 5d          	movzbl 0x5d(%edx),%ecx
  1019f9:	83 e1 9f             	and    $0xffffff9f,%ecx
  1019fc:	88 4a 5d             	mov    %cl,0x5d(%edx)
  1019ff:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101a05:	0f b6 4a 5d          	movzbl 0x5d(%edx),%ecx
  101a09:	83 c9 80             	or     $0xffffff80,%ecx
  101a0c:	88 4a 5d             	mov    %cl,0x5d(%edx)
  101a0f:	c7 c2 8a 2c 10 00    	mov    $0x102c8a,%edx
  101a15:	c1 ea 10             	shr    $0x10,%edx
  101a18:	89 d1                	mov    %edx,%ecx
  101a1a:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101a20:	66 89 4a 5e          	mov    %cx,0x5e(%edx)
  101a24:	c7 c2 92 2c 10 00    	mov    $0x102c92,%edx
  101a2a:	89 d1                	mov    %edx,%ecx
  101a2c:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101a32:	66 89 4a 60          	mov    %cx,0x60(%edx)
  101a36:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101a3c:	66 c7 42 62 08 00    	movw   $0x8,0x62(%edx)
  101a42:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101a48:	0f b6 4a 64          	movzbl 0x64(%edx),%ecx
  101a4c:	83 e1 e0             	and    $0xffffffe0,%ecx
  101a4f:	88 4a 64             	mov    %cl,0x64(%edx)
  101a52:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101a58:	0f b6 4a 64          	movzbl 0x64(%edx),%ecx
  101a5c:	83 e1 1f             	and    $0x1f,%ecx
  101a5f:	88 4a 64             	mov    %cl,0x64(%edx)
  101a62:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101a68:	0f b6 4a 65          	movzbl 0x65(%edx),%ecx
  101a6c:	83 e1 f0             	and    $0xfffffff0,%ecx
  101a6f:	83 c9 0e             	or     $0xe,%ecx
  101a72:	88 4a 65             	mov    %cl,0x65(%edx)
  101a75:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101a7b:	0f b6 4a 65          	movzbl 0x65(%edx),%ecx
  101a7f:	83 e1 ef             	and    $0xffffffef,%ecx
  101a82:	88 4a 65             	mov    %cl,0x65(%edx)
  101a85:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101a8b:	0f b6 4a 65          	movzbl 0x65(%edx),%ecx
  101a8f:	83 e1 9f             	and    $0xffffff9f,%ecx
  101a92:	88 4a 65             	mov    %cl,0x65(%edx)
  101a95:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101a9b:	0f b6 4a 65          	movzbl 0x65(%edx),%ecx
  101a9f:	83 c9 80             	or     $0xffffff80,%ecx
  101aa2:	88 4a 65             	mov    %cl,0x65(%edx)
  101aa5:	c7 c2 92 2c 10 00    	mov    $0x102c92,%edx
  101aab:	c1 ea 10             	shr    $0x10,%edx
  101aae:	89 d1                	mov    %edx,%ecx
  101ab0:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101ab6:	66 89 4a 66          	mov    %cx,0x66(%edx)
  101aba:	c7 c2 9a 2c 10 00    	mov    $0x102c9a,%edx
  101ac0:	89 d1                	mov    %edx,%ecx
  101ac2:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101ac8:	66 89 4a 68          	mov    %cx,0x68(%edx)
  101acc:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101ad2:	66 c7 42 6a 08 00    	movw   $0x8,0x6a(%edx)
  101ad8:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101ade:	0f b6 4a 6c          	movzbl 0x6c(%edx),%ecx
  101ae2:	83 e1 e0             	and    $0xffffffe0,%ecx
  101ae5:	88 4a 6c             	mov    %cl,0x6c(%edx)
  101ae8:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101aee:	0f b6 4a 6c          	movzbl 0x6c(%edx),%ecx
  101af2:	83 e1 1f             	and    $0x1f,%ecx
  101af5:	88 4a 6c             	mov    %cl,0x6c(%edx)
  101af8:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101afe:	0f b6 4a 6d          	movzbl 0x6d(%edx),%ecx
  101b02:	83 e1 f0             	and    $0xfffffff0,%ecx
  101b05:	83 c9 0e             	or     $0xe,%ecx
  101b08:	88 4a 6d             	mov    %cl,0x6d(%edx)
  101b0b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101b11:	0f b6 4a 6d          	movzbl 0x6d(%edx),%ecx
  101b15:	83 e1 ef             	and    $0xffffffef,%ecx
  101b18:	88 4a 6d             	mov    %cl,0x6d(%edx)
  101b1b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101b21:	0f b6 4a 6d          	movzbl 0x6d(%edx),%ecx
  101b25:	83 e1 9f             	and    $0xffffff9f,%ecx
  101b28:	88 4a 6d             	mov    %cl,0x6d(%edx)
  101b2b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101b31:	0f b6 4a 6d          	movzbl 0x6d(%edx),%ecx
  101b35:	83 c9 80             	or     $0xffffff80,%ecx
  101b38:	88 4a 6d             	mov    %cl,0x6d(%edx)
  101b3b:	c7 c2 9a 2c 10 00    	mov    $0x102c9a,%edx
  101b41:	c1 ea 10             	shr    $0x10,%edx
  101b44:	89 d1                	mov    %edx,%ecx
  101b46:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101b4c:	66 89 4a 6e          	mov    %cx,0x6e(%edx)
  101b50:	c7 c2 a2 2c 10 00    	mov    $0x102ca2,%edx
  101b56:	89 d1                	mov    %edx,%ecx
  101b58:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101b5e:	66 89 4a 70          	mov    %cx,0x70(%edx)
  101b62:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101b68:	66 c7 42 72 08 00    	movw   $0x8,0x72(%edx)
  101b6e:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101b74:	0f b6 4a 74          	movzbl 0x74(%edx),%ecx
  101b78:	83 e1 e0             	and    $0xffffffe0,%ecx
  101b7b:	88 4a 74             	mov    %cl,0x74(%edx)
  101b7e:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101b84:	0f b6 4a 74          	movzbl 0x74(%edx),%ecx
  101b88:	83 e1 1f             	and    $0x1f,%ecx
  101b8b:	88 4a 74             	mov    %cl,0x74(%edx)
  101b8e:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101b94:	0f b6 4a 75          	movzbl 0x75(%edx),%ecx
  101b98:	83 e1 f0             	and    $0xfffffff0,%ecx
  101b9b:	83 c9 0e             	or     $0xe,%ecx
  101b9e:	88 4a 75             	mov    %cl,0x75(%edx)
  101ba1:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101ba7:	0f b6 4a 75          	movzbl 0x75(%edx),%ecx
  101bab:	83 e1 ef             	and    $0xffffffef,%ecx
  101bae:	88 4a 75             	mov    %cl,0x75(%edx)
  101bb1:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101bb7:	0f b6 4a 75          	movzbl 0x75(%edx),%ecx
  101bbb:	83 e1 9f             	and    $0xffffff9f,%ecx
  101bbe:	88 4a 75             	mov    %cl,0x75(%edx)
  101bc1:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101bc7:	0f b6 4a 75          	movzbl 0x75(%edx),%ecx
  101bcb:	83 c9 80             	or     $0xffffff80,%ecx
  101bce:	88 4a 75             	mov    %cl,0x75(%edx)
  101bd1:	c7 c2 a2 2c 10 00    	mov    $0x102ca2,%edx
  101bd7:	c1 ea 10             	shr    $0x10,%edx
  101bda:	89 d1                	mov    %edx,%ecx
  101bdc:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101be2:	66 89 4a 76          	mov    %cx,0x76(%edx)
  101be6:	c7 c2 b4 2c 10 00    	mov    $0x102cb4,%edx
  101bec:	89 d1                	mov    %edx,%ecx
  101bee:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101bf4:	66 89 8a 80 00 00 00 	mov    %cx,0x80(%edx)
  101bfb:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101c01:	66 c7 82 82 00 00 00 	movw   $0x8,0x82(%edx)
  101c08:	08 00 
  101c0a:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101c10:	0f b6 8a 84 00 00 00 	movzbl 0x84(%edx),%ecx
  101c17:	83 e1 e0             	and    $0xffffffe0,%ecx
  101c1a:	88 8a 84 00 00 00    	mov    %cl,0x84(%edx)
  101c20:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101c26:	0f b6 8a 84 00 00 00 	movzbl 0x84(%edx),%ecx
  101c2d:	83 e1 1f             	and    $0x1f,%ecx
  101c30:	88 8a 84 00 00 00    	mov    %cl,0x84(%edx)
  101c36:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101c3c:	0f b6 8a 85 00 00 00 	movzbl 0x85(%edx),%ecx
  101c43:	83 e1 f0             	and    $0xfffffff0,%ecx
  101c46:	83 c9 0e             	or     $0xe,%ecx
  101c49:	88 8a 85 00 00 00    	mov    %cl,0x85(%edx)
  101c4f:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101c55:	0f b6 8a 85 00 00 00 	movzbl 0x85(%edx),%ecx
  101c5c:	83 e1 ef             	and    $0xffffffef,%ecx
  101c5f:	88 8a 85 00 00 00    	mov    %cl,0x85(%edx)
  101c65:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101c6b:	0f b6 8a 85 00 00 00 	movzbl 0x85(%edx),%ecx
  101c72:	83 e1 9f             	and    $0xffffff9f,%ecx
  101c75:	88 8a 85 00 00 00    	mov    %cl,0x85(%edx)
  101c7b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101c81:	0f b6 8a 85 00 00 00 	movzbl 0x85(%edx),%ecx
  101c88:	83 c9 80             	or     $0xffffff80,%ecx
  101c8b:	88 8a 85 00 00 00    	mov    %cl,0x85(%edx)
  101c91:	c7 c2 b4 2c 10 00    	mov    $0x102cb4,%edx
  101c97:	c1 ea 10             	shr    $0x10,%edx
  101c9a:	89 d1                	mov    %edx,%ecx
  101c9c:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101ca2:	66 89 8a 86 00 00 00 	mov    %cx,0x86(%edx)
  101ca9:	c7 c2 be 2c 10 00    	mov    $0x102cbe,%edx
  101caf:	89 d1                	mov    %edx,%ecx
  101cb1:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101cb7:	66 89 8a 88 00 00 00 	mov    %cx,0x88(%edx)
  101cbe:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101cc4:	66 c7 82 8a 00 00 00 	movw   $0x8,0x8a(%edx)
  101ccb:	08 00 
  101ccd:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101cd3:	0f b6 8a 8c 00 00 00 	movzbl 0x8c(%edx),%ecx
  101cda:	83 e1 e0             	and    $0xffffffe0,%ecx
  101cdd:	88 8a 8c 00 00 00    	mov    %cl,0x8c(%edx)
  101ce3:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101ce9:	0f b6 8a 8c 00 00 00 	movzbl 0x8c(%edx),%ecx
  101cf0:	83 e1 1f             	and    $0x1f,%ecx
  101cf3:	88 8a 8c 00 00 00    	mov    %cl,0x8c(%edx)
  101cf9:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101cff:	0f b6 8a 8d 00 00 00 	movzbl 0x8d(%edx),%ecx
  101d06:	83 e1 f0             	and    $0xfffffff0,%ecx
  101d09:	83 c9 0e             	or     $0xe,%ecx
  101d0c:	88 8a 8d 00 00 00    	mov    %cl,0x8d(%edx)
  101d12:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101d18:	0f b6 8a 8d 00 00 00 	movzbl 0x8d(%edx),%ecx
  101d1f:	83 e1 ef             	and    $0xffffffef,%ecx
  101d22:	88 8a 8d 00 00 00    	mov    %cl,0x8d(%edx)
  101d28:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101d2e:	0f b6 8a 8d 00 00 00 	movzbl 0x8d(%edx),%ecx
  101d35:	83 e1 9f             	and    $0xffffff9f,%ecx
  101d38:	88 8a 8d 00 00 00    	mov    %cl,0x8d(%edx)
  101d3e:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101d44:	0f b6 8a 8d 00 00 00 	movzbl 0x8d(%edx),%ecx
  101d4b:	83 c9 80             	or     $0xffffff80,%ecx
  101d4e:	88 8a 8d 00 00 00    	mov    %cl,0x8d(%edx)
  101d54:	c7 c2 be 2c 10 00    	mov    $0x102cbe,%edx
  101d5a:	c1 ea 10             	shr    $0x10,%edx
  101d5d:	89 d1                	mov    %edx,%ecx
  101d5f:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101d65:	66 89 8a 8e 00 00 00 	mov    %cx,0x8e(%edx)
  101d6c:	c7 c2 c6 2c 10 00    	mov    $0x102cc6,%edx
  101d72:	89 d1                	mov    %edx,%ecx
  101d74:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101d7a:	66 89 8a 90 00 00 00 	mov    %cx,0x90(%edx)
  101d81:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101d87:	66 c7 82 92 00 00 00 	movw   $0x8,0x92(%edx)
  101d8e:	08 00 
  101d90:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101d96:	0f b6 8a 94 00 00 00 	movzbl 0x94(%edx),%ecx
  101d9d:	83 e1 e0             	and    $0xffffffe0,%ecx
  101da0:	88 8a 94 00 00 00    	mov    %cl,0x94(%edx)
  101da6:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101dac:	0f b6 8a 94 00 00 00 	movzbl 0x94(%edx),%ecx
  101db3:	83 e1 1f             	and    $0x1f,%ecx
  101db6:	88 8a 94 00 00 00    	mov    %cl,0x94(%edx)
  101dbc:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101dc2:	0f b6 8a 95 00 00 00 	movzbl 0x95(%edx),%ecx
  101dc9:	83 e1 f0             	and    $0xfffffff0,%ecx
  101dcc:	83 c9 0e             	or     $0xe,%ecx
  101dcf:	88 8a 95 00 00 00    	mov    %cl,0x95(%edx)
  101dd5:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101ddb:	0f b6 8a 95 00 00 00 	movzbl 0x95(%edx),%ecx
  101de2:	83 e1 ef             	and    $0xffffffef,%ecx
  101de5:	88 8a 95 00 00 00    	mov    %cl,0x95(%edx)
  101deb:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101df1:	0f b6 8a 95 00 00 00 	movzbl 0x95(%edx),%ecx
  101df8:	83 e1 9f             	and    $0xffffff9f,%ecx
  101dfb:	88 8a 95 00 00 00    	mov    %cl,0x95(%edx)
  101e01:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101e07:	0f b6 8a 95 00 00 00 	movzbl 0x95(%edx),%ecx
  101e0e:	83 c9 80             	or     $0xffffff80,%ecx
  101e11:	88 8a 95 00 00 00    	mov    %cl,0x95(%edx)
  101e17:	c7 c2 c6 2c 10 00    	mov    $0x102cc6,%edx
  101e1d:	c1 ea 10             	shr    $0x10,%edx
  101e20:	89 d1                	mov    %edx,%ecx
  101e22:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101e28:	66 89 8a 96 00 00 00 	mov    %cx,0x96(%edx)
  101e2f:	c7 c2 d0 2c 10 00    	mov    $0x102cd0,%edx
  101e35:	89 d1                	mov    %edx,%ecx
  101e37:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101e3d:	66 89 8a 00 01 00 00 	mov    %cx,0x100(%edx)
  101e44:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101e4a:	66 c7 82 02 01 00 00 	movw   $0x8,0x102(%edx)
  101e51:	08 00 
  101e53:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101e59:	0f b6 8a 04 01 00 00 	movzbl 0x104(%edx),%ecx
  101e60:	83 e1 e0             	and    $0xffffffe0,%ecx
  101e63:	88 8a 04 01 00 00    	mov    %cl,0x104(%edx)
  101e69:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101e6f:	0f b6 8a 04 01 00 00 	movzbl 0x104(%edx),%ecx
  101e76:	83 e1 1f             	and    $0x1f,%ecx
  101e79:	88 8a 04 01 00 00    	mov    %cl,0x104(%edx)
  101e7f:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101e85:	0f b6 8a 05 01 00 00 	movzbl 0x105(%edx),%ecx
  101e8c:	83 e1 f0             	and    $0xfffffff0,%ecx
  101e8f:	83 c9 0e             	or     $0xe,%ecx
  101e92:	88 8a 05 01 00 00    	mov    %cl,0x105(%edx)
  101e98:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101e9e:	0f b6 8a 05 01 00 00 	movzbl 0x105(%edx),%ecx
  101ea5:	83 e1 ef             	and    $0xffffffef,%ecx
  101ea8:	88 8a 05 01 00 00    	mov    %cl,0x105(%edx)
  101eae:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101eb4:	0f b6 8a 05 01 00 00 	movzbl 0x105(%edx),%ecx
  101ebb:	83 e1 9f             	and    $0xffffff9f,%ecx
  101ebe:	88 8a 05 01 00 00    	mov    %cl,0x105(%edx)
  101ec4:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101eca:	0f b6 8a 05 01 00 00 	movzbl 0x105(%edx),%ecx
  101ed1:	83 c9 80             	or     $0xffffff80,%ecx
  101ed4:	88 8a 05 01 00 00    	mov    %cl,0x105(%edx)
  101eda:	c7 c2 d0 2c 10 00    	mov    $0x102cd0,%edx
  101ee0:	c1 ea 10             	shr    $0x10,%edx
  101ee3:	89 d1                	mov    %edx,%ecx
  101ee5:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101eeb:	66 89 8a 06 01 00 00 	mov    %cx,0x106(%edx)
  101ef2:	c7 c2 da 2c 10 00    	mov    $0x102cda,%edx
  101ef8:	89 d1                	mov    %edx,%ecx
  101efa:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101f00:	66 89 8a 08 01 00 00 	mov    %cx,0x108(%edx)
  101f07:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101f0d:	66 c7 82 0a 01 00 00 	movw   $0x8,0x10a(%edx)
  101f14:	08 00 
  101f16:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101f1c:	0f b6 8a 0c 01 00 00 	movzbl 0x10c(%edx),%ecx
  101f23:	83 e1 e0             	and    $0xffffffe0,%ecx
  101f26:	88 8a 0c 01 00 00    	mov    %cl,0x10c(%edx)
  101f2c:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101f32:	0f b6 8a 0c 01 00 00 	movzbl 0x10c(%edx),%ecx
  101f39:	83 e1 1f             	and    $0x1f,%ecx
  101f3c:	88 8a 0c 01 00 00    	mov    %cl,0x10c(%edx)
  101f42:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101f48:	0f b6 8a 0d 01 00 00 	movzbl 0x10d(%edx),%ecx
  101f4f:	83 e1 f0             	and    $0xfffffff0,%ecx
  101f52:	83 c9 0e             	or     $0xe,%ecx
  101f55:	88 8a 0d 01 00 00    	mov    %cl,0x10d(%edx)
  101f5b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101f61:	0f b6 8a 0d 01 00 00 	movzbl 0x10d(%edx),%ecx
  101f68:	83 e1 ef             	and    $0xffffffef,%ecx
  101f6b:	88 8a 0d 01 00 00    	mov    %cl,0x10d(%edx)
  101f71:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101f77:	0f b6 8a 0d 01 00 00 	movzbl 0x10d(%edx),%ecx
  101f7e:	83 e1 9f             	and    $0xffffff9f,%ecx
  101f81:	88 8a 0d 01 00 00    	mov    %cl,0x10d(%edx)
  101f87:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101f8d:	0f b6 8a 0d 01 00 00 	movzbl 0x10d(%edx),%ecx
  101f94:	83 c9 80             	or     $0xffffff80,%ecx
  101f97:	88 8a 0d 01 00 00    	mov    %cl,0x10d(%edx)
  101f9d:	c7 c2 da 2c 10 00    	mov    $0x102cda,%edx
  101fa3:	c1 ea 10             	shr    $0x10,%edx
  101fa6:	89 d1                	mov    %edx,%ecx
  101fa8:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101fae:	66 89 8a 0e 01 00 00 	mov    %cx,0x10e(%edx)
  101fb5:	c7 c2 e4 2c 10 00    	mov    $0x102ce4,%edx
  101fbb:	89 d1                	mov    %edx,%ecx
  101fbd:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101fc3:	66 89 8a 10 01 00 00 	mov    %cx,0x110(%edx)
  101fca:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101fd0:	66 c7 82 12 01 00 00 	movw   $0x8,0x112(%edx)
  101fd7:	08 00 
  101fd9:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101fdf:	0f b6 8a 14 01 00 00 	movzbl 0x114(%edx),%ecx
  101fe6:	83 e1 e0             	and    $0xffffffe0,%ecx
  101fe9:	88 8a 14 01 00 00    	mov    %cl,0x114(%edx)
  101fef:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  101ff5:	0f b6 8a 14 01 00 00 	movzbl 0x114(%edx),%ecx
  101ffc:	83 e1 1f             	and    $0x1f,%ecx
  101fff:	88 8a 14 01 00 00    	mov    %cl,0x114(%edx)
  102005:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10200b:	0f b6 8a 15 01 00 00 	movzbl 0x115(%edx),%ecx
  102012:	83 e1 f0             	and    $0xfffffff0,%ecx
  102015:	83 c9 0e             	or     $0xe,%ecx
  102018:	88 8a 15 01 00 00    	mov    %cl,0x115(%edx)
  10201e:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102024:	0f b6 8a 15 01 00 00 	movzbl 0x115(%edx),%ecx
  10202b:	83 e1 ef             	and    $0xffffffef,%ecx
  10202e:	88 8a 15 01 00 00    	mov    %cl,0x115(%edx)
  102034:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10203a:	0f b6 8a 15 01 00 00 	movzbl 0x115(%edx),%ecx
  102041:	83 e1 9f             	and    $0xffffff9f,%ecx
  102044:	88 8a 15 01 00 00    	mov    %cl,0x115(%edx)
  10204a:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102050:	0f b6 8a 15 01 00 00 	movzbl 0x115(%edx),%ecx
  102057:	83 c9 80             	or     $0xffffff80,%ecx
  10205a:	88 8a 15 01 00 00    	mov    %cl,0x115(%edx)
  102060:	c7 c2 e4 2c 10 00    	mov    $0x102ce4,%edx
  102066:	c1 ea 10             	shr    $0x10,%edx
  102069:	89 d1                	mov    %edx,%ecx
  10206b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102071:	66 89 8a 16 01 00 00 	mov    %cx,0x116(%edx)
  102078:	c7 c2 ee 2c 10 00    	mov    $0x102cee,%edx
  10207e:	89 d1                	mov    %edx,%ecx
  102080:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102086:	66 89 8a 18 01 00 00 	mov    %cx,0x118(%edx)
  10208d:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102093:	66 c7 82 1a 01 00 00 	movw   $0x8,0x11a(%edx)
  10209a:	08 00 
  10209c:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1020a2:	0f b6 8a 1c 01 00 00 	movzbl 0x11c(%edx),%ecx
  1020a9:	83 e1 e0             	and    $0xffffffe0,%ecx
  1020ac:	88 8a 1c 01 00 00    	mov    %cl,0x11c(%edx)
  1020b2:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1020b8:	0f b6 8a 1c 01 00 00 	movzbl 0x11c(%edx),%ecx
  1020bf:	83 e1 1f             	and    $0x1f,%ecx
  1020c2:	88 8a 1c 01 00 00    	mov    %cl,0x11c(%edx)
  1020c8:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1020ce:	0f b6 8a 1d 01 00 00 	movzbl 0x11d(%edx),%ecx
  1020d5:	83 e1 f0             	and    $0xfffffff0,%ecx
  1020d8:	83 c9 0e             	or     $0xe,%ecx
  1020db:	88 8a 1d 01 00 00    	mov    %cl,0x11d(%edx)
  1020e1:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1020e7:	0f b6 8a 1d 01 00 00 	movzbl 0x11d(%edx),%ecx
  1020ee:	83 e1 ef             	and    $0xffffffef,%ecx
  1020f1:	88 8a 1d 01 00 00    	mov    %cl,0x11d(%edx)
  1020f7:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1020fd:	0f b6 8a 1d 01 00 00 	movzbl 0x11d(%edx),%ecx
  102104:	83 e1 9f             	and    $0xffffff9f,%ecx
  102107:	88 8a 1d 01 00 00    	mov    %cl,0x11d(%edx)
  10210d:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102113:	0f b6 8a 1d 01 00 00 	movzbl 0x11d(%edx),%ecx
  10211a:	83 c9 80             	or     $0xffffff80,%ecx
  10211d:	88 8a 1d 01 00 00    	mov    %cl,0x11d(%edx)
  102123:	c7 c2 ee 2c 10 00    	mov    $0x102cee,%edx
  102129:	c1 ea 10             	shr    $0x10,%edx
  10212c:	89 d1                	mov    %edx,%ecx
  10212e:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102134:	66 89 8a 1e 01 00 00 	mov    %cx,0x11e(%edx)
  10213b:	c7 c2 f8 2c 10 00    	mov    $0x102cf8,%edx
  102141:	89 d1                	mov    %edx,%ecx
  102143:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102149:	66 89 8a 20 01 00 00 	mov    %cx,0x120(%edx)
  102150:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102156:	66 c7 82 22 01 00 00 	movw   $0x8,0x122(%edx)
  10215d:	08 00 
  10215f:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102165:	0f b6 8a 24 01 00 00 	movzbl 0x124(%edx),%ecx
  10216c:	83 e1 e0             	and    $0xffffffe0,%ecx
  10216f:	88 8a 24 01 00 00    	mov    %cl,0x124(%edx)
  102175:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10217b:	0f b6 8a 24 01 00 00 	movzbl 0x124(%edx),%ecx
  102182:	83 e1 1f             	and    $0x1f,%ecx
  102185:	88 8a 24 01 00 00    	mov    %cl,0x124(%edx)
  10218b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102191:	0f b6 8a 25 01 00 00 	movzbl 0x125(%edx),%ecx
  102198:	83 e1 f0             	and    $0xfffffff0,%ecx
  10219b:	83 c9 0e             	or     $0xe,%ecx
  10219e:	88 8a 25 01 00 00    	mov    %cl,0x125(%edx)
  1021a4:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1021aa:	0f b6 8a 25 01 00 00 	movzbl 0x125(%edx),%ecx
  1021b1:	83 e1 ef             	and    $0xffffffef,%ecx
  1021b4:	88 8a 25 01 00 00    	mov    %cl,0x125(%edx)
  1021ba:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1021c0:	0f b6 8a 25 01 00 00 	movzbl 0x125(%edx),%ecx
  1021c7:	83 e1 9f             	and    $0xffffff9f,%ecx
  1021ca:	88 8a 25 01 00 00    	mov    %cl,0x125(%edx)
  1021d0:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1021d6:	0f b6 8a 25 01 00 00 	movzbl 0x125(%edx),%ecx
  1021dd:	83 c9 80             	or     $0xffffff80,%ecx
  1021e0:	88 8a 25 01 00 00    	mov    %cl,0x125(%edx)
  1021e6:	c7 c2 f8 2c 10 00    	mov    $0x102cf8,%edx
  1021ec:	c1 ea 10             	shr    $0x10,%edx
  1021ef:	89 d1                	mov    %edx,%ecx
  1021f1:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1021f7:	66 89 8a 26 01 00 00 	mov    %cx,0x126(%edx)
  1021fe:	c7 c2 02 2d 10 00    	mov    $0x102d02,%edx
  102204:	89 d1                	mov    %edx,%ecx
  102206:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10220c:	66 89 8a 28 01 00 00 	mov    %cx,0x128(%edx)
  102213:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102219:	66 c7 82 2a 01 00 00 	movw   $0x8,0x12a(%edx)
  102220:	08 00 
  102222:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102228:	0f b6 8a 2c 01 00 00 	movzbl 0x12c(%edx),%ecx
  10222f:	83 e1 e0             	and    $0xffffffe0,%ecx
  102232:	88 8a 2c 01 00 00    	mov    %cl,0x12c(%edx)
  102238:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10223e:	0f b6 8a 2c 01 00 00 	movzbl 0x12c(%edx),%ecx
  102245:	83 e1 1f             	and    $0x1f,%ecx
  102248:	88 8a 2c 01 00 00    	mov    %cl,0x12c(%edx)
  10224e:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102254:	0f b6 8a 2d 01 00 00 	movzbl 0x12d(%edx),%ecx
  10225b:	83 e1 f0             	and    $0xfffffff0,%ecx
  10225e:	83 c9 0e             	or     $0xe,%ecx
  102261:	88 8a 2d 01 00 00    	mov    %cl,0x12d(%edx)
  102267:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10226d:	0f b6 8a 2d 01 00 00 	movzbl 0x12d(%edx),%ecx
  102274:	83 e1 ef             	and    $0xffffffef,%ecx
  102277:	88 8a 2d 01 00 00    	mov    %cl,0x12d(%edx)
  10227d:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102283:	0f b6 8a 2d 01 00 00 	movzbl 0x12d(%edx),%ecx
  10228a:	83 e1 9f             	and    $0xffffff9f,%ecx
  10228d:	88 8a 2d 01 00 00    	mov    %cl,0x12d(%edx)
  102293:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102299:	0f b6 8a 2d 01 00 00 	movzbl 0x12d(%edx),%ecx
  1022a0:	83 c9 80             	or     $0xffffff80,%ecx
  1022a3:	88 8a 2d 01 00 00    	mov    %cl,0x12d(%edx)
  1022a9:	c7 c2 02 2d 10 00    	mov    $0x102d02,%edx
  1022af:	c1 ea 10             	shr    $0x10,%edx
  1022b2:	89 d1                	mov    %edx,%ecx
  1022b4:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1022ba:	66 89 8a 2e 01 00 00 	mov    %cx,0x12e(%edx)
  1022c1:	c7 c2 0c 2d 10 00    	mov    $0x102d0c,%edx
  1022c7:	89 d1                	mov    %edx,%ecx
  1022c9:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1022cf:	66 89 8a 30 01 00 00 	mov    %cx,0x130(%edx)
  1022d6:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1022dc:	66 c7 82 32 01 00 00 	movw   $0x8,0x132(%edx)
  1022e3:	08 00 
  1022e5:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1022eb:	0f b6 8a 34 01 00 00 	movzbl 0x134(%edx),%ecx
  1022f2:	83 e1 e0             	and    $0xffffffe0,%ecx
  1022f5:	88 8a 34 01 00 00    	mov    %cl,0x134(%edx)
  1022fb:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102301:	0f b6 8a 34 01 00 00 	movzbl 0x134(%edx),%ecx
  102308:	83 e1 1f             	and    $0x1f,%ecx
  10230b:	88 8a 34 01 00 00    	mov    %cl,0x134(%edx)
  102311:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102317:	0f b6 8a 35 01 00 00 	movzbl 0x135(%edx),%ecx
  10231e:	83 e1 f0             	and    $0xfffffff0,%ecx
  102321:	83 c9 0e             	or     $0xe,%ecx
  102324:	88 8a 35 01 00 00    	mov    %cl,0x135(%edx)
  10232a:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102330:	0f b6 8a 35 01 00 00 	movzbl 0x135(%edx),%ecx
  102337:	83 e1 ef             	and    $0xffffffef,%ecx
  10233a:	88 8a 35 01 00 00    	mov    %cl,0x135(%edx)
  102340:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102346:	0f b6 8a 35 01 00 00 	movzbl 0x135(%edx),%ecx
  10234d:	83 e1 9f             	and    $0xffffff9f,%ecx
  102350:	88 8a 35 01 00 00    	mov    %cl,0x135(%edx)
  102356:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10235c:	0f b6 8a 35 01 00 00 	movzbl 0x135(%edx),%ecx
  102363:	83 c9 80             	or     $0xffffff80,%ecx
  102366:	88 8a 35 01 00 00    	mov    %cl,0x135(%edx)
  10236c:	c7 c2 0c 2d 10 00    	mov    $0x102d0c,%edx
  102372:	c1 ea 10             	shr    $0x10,%edx
  102375:	89 d1                	mov    %edx,%ecx
  102377:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10237d:	66 89 8a 36 01 00 00 	mov    %cx,0x136(%edx)
  102384:	c7 c2 12 2d 10 00    	mov    $0x102d12,%edx
  10238a:	89 d1                	mov    %edx,%ecx
  10238c:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102392:	66 89 8a 38 01 00 00 	mov    %cx,0x138(%edx)
  102399:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10239f:	66 c7 82 3a 01 00 00 	movw   $0x8,0x13a(%edx)
  1023a6:	08 00 
  1023a8:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1023ae:	0f b6 8a 3c 01 00 00 	movzbl 0x13c(%edx),%ecx
  1023b5:	83 e1 e0             	and    $0xffffffe0,%ecx
  1023b8:	88 8a 3c 01 00 00    	mov    %cl,0x13c(%edx)
  1023be:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1023c4:	0f b6 8a 3c 01 00 00 	movzbl 0x13c(%edx),%ecx
  1023cb:	83 e1 1f             	and    $0x1f,%ecx
  1023ce:	88 8a 3c 01 00 00    	mov    %cl,0x13c(%edx)
  1023d4:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1023da:	0f b6 8a 3d 01 00 00 	movzbl 0x13d(%edx),%ecx
  1023e1:	83 e1 f0             	and    $0xfffffff0,%ecx
  1023e4:	83 c9 0e             	or     $0xe,%ecx
  1023e7:	88 8a 3d 01 00 00    	mov    %cl,0x13d(%edx)
  1023ed:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1023f3:	0f b6 8a 3d 01 00 00 	movzbl 0x13d(%edx),%ecx
  1023fa:	83 e1 ef             	and    $0xffffffef,%ecx
  1023fd:	88 8a 3d 01 00 00    	mov    %cl,0x13d(%edx)
  102403:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102409:	0f b6 8a 3d 01 00 00 	movzbl 0x13d(%edx),%ecx
  102410:	83 e1 9f             	and    $0xffffff9f,%ecx
  102413:	88 8a 3d 01 00 00    	mov    %cl,0x13d(%edx)
  102419:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10241f:	0f b6 8a 3d 01 00 00 	movzbl 0x13d(%edx),%ecx
  102426:	83 c9 80             	or     $0xffffff80,%ecx
  102429:	88 8a 3d 01 00 00    	mov    %cl,0x13d(%edx)
  10242f:	c7 c2 12 2d 10 00    	mov    $0x102d12,%edx
  102435:	c1 ea 10             	shr    $0x10,%edx
  102438:	89 d1                	mov    %edx,%ecx
  10243a:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102440:	66 89 8a 3e 01 00 00 	mov    %cx,0x13e(%edx)
  102447:	c7 c2 18 2d 10 00    	mov    $0x102d18,%edx
  10244d:	89 d1                	mov    %edx,%ecx
  10244f:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102455:	66 89 8a 40 01 00 00 	mov    %cx,0x140(%edx)
  10245c:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102462:	66 c7 82 42 01 00 00 	movw   $0x8,0x142(%edx)
  102469:	08 00 
  10246b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102471:	0f b6 8a 44 01 00 00 	movzbl 0x144(%edx),%ecx
  102478:	83 e1 e0             	and    $0xffffffe0,%ecx
  10247b:	88 8a 44 01 00 00    	mov    %cl,0x144(%edx)
  102481:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102487:	0f b6 8a 44 01 00 00 	movzbl 0x144(%edx),%ecx
  10248e:	83 e1 1f             	and    $0x1f,%ecx
  102491:	88 8a 44 01 00 00    	mov    %cl,0x144(%edx)
  102497:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10249d:	0f b6 8a 45 01 00 00 	movzbl 0x145(%edx),%ecx
  1024a4:	83 e1 f0             	and    $0xfffffff0,%ecx
  1024a7:	83 c9 0e             	or     $0xe,%ecx
  1024aa:	88 8a 45 01 00 00    	mov    %cl,0x145(%edx)
  1024b0:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1024b6:	0f b6 8a 45 01 00 00 	movzbl 0x145(%edx),%ecx
  1024bd:	83 e1 ef             	and    $0xffffffef,%ecx
  1024c0:	88 8a 45 01 00 00    	mov    %cl,0x145(%edx)
  1024c6:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1024cc:	0f b6 8a 45 01 00 00 	movzbl 0x145(%edx),%ecx
  1024d3:	83 e1 9f             	and    $0xffffff9f,%ecx
  1024d6:	88 8a 45 01 00 00    	mov    %cl,0x145(%edx)
  1024dc:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1024e2:	0f b6 8a 45 01 00 00 	movzbl 0x145(%edx),%ecx
  1024e9:	83 c9 80             	or     $0xffffff80,%ecx
  1024ec:	88 8a 45 01 00 00    	mov    %cl,0x145(%edx)
  1024f2:	c7 c2 18 2d 10 00    	mov    $0x102d18,%edx
  1024f8:	c1 ea 10             	shr    $0x10,%edx
  1024fb:	89 d1                	mov    %edx,%ecx
  1024fd:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102503:	66 89 8a 46 01 00 00 	mov    %cx,0x146(%edx)
  10250a:	c7 c2 1e 2d 10 00    	mov    $0x102d1e,%edx
  102510:	89 d1                	mov    %edx,%ecx
  102512:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102518:	66 89 8a 48 01 00 00 	mov    %cx,0x148(%edx)
  10251f:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102525:	66 c7 82 4a 01 00 00 	movw   $0x8,0x14a(%edx)
  10252c:	08 00 
  10252e:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102534:	0f b6 8a 4c 01 00 00 	movzbl 0x14c(%edx),%ecx
  10253b:	83 e1 e0             	and    $0xffffffe0,%ecx
  10253e:	88 8a 4c 01 00 00    	mov    %cl,0x14c(%edx)
  102544:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10254a:	0f b6 8a 4c 01 00 00 	movzbl 0x14c(%edx),%ecx
  102551:	83 e1 1f             	and    $0x1f,%ecx
  102554:	88 8a 4c 01 00 00    	mov    %cl,0x14c(%edx)
  10255a:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102560:	0f b6 8a 4d 01 00 00 	movzbl 0x14d(%edx),%ecx
  102567:	83 e1 f0             	and    $0xfffffff0,%ecx
  10256a:	83 c9 0e             	or     $0xe,%ecx
  10256d:	88 8a 4d 01 00 00    	mov    %cl,0x14d(%edx)
  102573:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102579:	0f b6 8a 4d 01 00 00 	movzbl 0x14d(%edx),%ecx
  102580:	83 e1 ef             	and    $0xffffffef,%ecx
  102583:	88 8a 4d 01 00 00    	mov    %cl,0x14d(%edx)
  102589:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10258f:	0f b6 8a 4d 01 00 00 	movzbl 0x14d(%edx),%ecx
  102596:	83 e1 9f             	and    $0xffffff9f,%ecx
  102599:	88 8a 4d 01 00 00    	mov    %cl,0x14d(%edx)
  10259f:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1025a5:	0f b6 8a 4d 01 00 00 	movzbl 0x14d(%edx),%ecx
  1025ac:	83 c9 80             	or     $0xffffff80,%ecx
  1025af:	88 8a 4d 01 00 00    	mov    %cl,0x14d(%edx)
  1025b5:	c7 c2 1e 2d 10 00    	mov    $0x102d1e,%edx
  1025bb:	c1 ea 10             	shr    $0x10,%edx
  1025be:	89 d1                	mov    %edx,%ecx
  1025c0:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1025c6:	66 89 8a 4e 01 00 00 	mov    %cx,0x14e(%edx)
  1025cd:	c7 c2 24 2d 10 00    	mov    $0x102d24,%edx
  1025d3:	89 d1                	mov    %edx,%ecx
  1025d5:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1025db:	66 89 8a 50 01 00 00 	mov    %cx,0x150(%edx)
  1025e2:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1025e8:	66 c7 82 52 01 00 00 	movw   $0x8,0x152(%edx)
  1025ef:	08 00 
  1025f1:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1025f7:	0f b6 8a 54 01 00 00 	movzbl 0x154(%edx),%ecx
  1025fe:	83 e1 e0             	and    $0xffffffe0,%ecx
  102601:	88 8a 54 01 00 00    	mov    %cl,0x154(%edx)
  102607:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10260d:	0f b6 8a 54 01 00 00 	movzbl 0x154(%edx),%ecx
  102614:	83 e1 1f             	and    $0x1f,%ecx
  102617:	88 8a 54 01 00 00    	mov    %cl,0x154(%edx)
  10261d:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102623:	0f b6 8a 55 01 00 00 	movzbl 0x155(%edx),%ecx
  10262a:	83 e1 f0             	and    $0xfffffff0,%ecx
  10262d:	83 c9 0e             	or     $0xe,%ecx
  102630:	88 8a 55 01 00 00    	mov    %cl,0x155(%edx)
  102636:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10263c:	0f b6 8a 55 01 00 00 	movzbl 0x155(%edx),%ecx
  102643:	83 e1 ef             	and    $0xffffffef,%ecx
  102646:	88 8a 55 01 00 00    	mov    %cl,0x155(%edx)
  10264c:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102652:	0f b6 8a 55 01 00 00 	movzbl 0x155(%edx),%ecx
  102659:	83 e1 9f             	and    $0xffffff9f,%ecx
  10265c:	88 8a 55 01 00 00    	mov    %cl,0x155(%edx)
  102662:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102668:	0f b6 8a 55 01 00 00 	movzbl 0x155(%edx),%ecx
  10266f:	83 c9 80             	or     $0xffffff80,%ecx
  102672:	88 8a 55 01 00 00    	mov    %cl,0x155(%edx)
  102678:	c7 c2 24 2d 10 00    	mov    $0x102d24,%edx
  10267e:	c1 ea 10             	shr    $0x10,%edx
  102681:	89 d1                	mov    %edx,%ecx
  102683:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102689:	66 89 8a 56 01 00 00 	mov    %cx,0x156(%edx)
  102690:	c7 c2 2a 2d 10 00    	mov    $0x102d2a,%edx
  102696:	89 d1                	mov    %edx,%ecx
  102698:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10269e:	66 89 8a 58 01 00 00 	mov    %cx,0x158(%edx)
  1026a5:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1026ab:	66 c7 82 5a 01 00 00 	movw   $0x8,0x15a(%edx)
  1026b2:	08 00 
  1026b4:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1026ba:	0f b6 8a 5c 01 00 00 	movzbl 0x15c(%edx),%ecx
  1026c1:	83 e1 e0             	and    $0xffffffe0,%ecx
  1026c4:	88 8a 5c 01 00 00    	mov    %cl,0x15c(%edx)
  1026ca:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1026d0:	0f b6 8a 5c 01 00 00 	movzbl 0x15c(%edx),%ecx
  1026d7:	83 e1 1f             	and    $0x1f,%ecx
  1026da:	88 8a 5c 01 00 00    	mov    %cl,0x15c(%edx)
  1026e0:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1026e6:	0f b6 8a 5d 01 00 00 	movzbl 0x15d(%edx),%ecx
  1026ed:	83 e1 f0             	and    $0xfffffff0,%ecx
  1026f0:	83 c9 0e             	or     $0xe,%ecx
  1026f3:	88 8a 5d 01 00 00    	mov    %cl,0x15d(%edx)
  1026f9:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1026ff:	0f b6 8a 5d 01 00 00 	movzbl 0x15d(%edx),%ecx
  102706:	83 e1 ef             	and    $0xffffffef,%ecx
  102709:	88 8a 5d 01 00 00    	mov    %cl,0x15d(%edx)
  10270f:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102715:	0f b6 8a 5d 01 00 00 	movzbl 0x15d(%edx),%ecx
  10271c:	83 e1 9f             	and    $0xffffff9f,%ecx
  10271f:	88 8a 5d 01 00 00    	mov    %cl,0x15d(%edx)
  102725:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10272b:	0f b6 8a 5d 01 00 00 	movzbl 0x15d(%edx),%ecx
  102732:	83 c9 80             	or     $0xffffff80,%ecx
  102735:	88 8a 5d 01 00 00    	mov    %cl,0x15d(%edx)
  10273b:	c7 c2 2a 2d 10 00    	mov    $0x102d2a,%edx
  102741:	c1 ea 10             	shr    $0x10,%edx
  102744:	89 d1                	mov    %edx,%ecx
  102746:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10274c:	66 89 8a 5e 01 00 00 	mov    %cx,0x15e(%edx)
  102753:	c7 c2 30 2d 10 00    	mov    $0x102d30,%edx
  102759:	89 d1                	mov    %edx,%ecx
  10275b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102761:	66 89 8a 60 01 00 00 	mov    %cx,0x160(%edx)
  102768:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10276e:	66 c7 82 62 01 00 00 	movw   $0x8,0x162(%edx)
  102775:	08 00 
  102777:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10277d:	0f b6 8a 64 01 00 00 	movzbl 0x164(%edx),%ecx
  102784:	83 e1 e0             	and    $0xffffffe0,%ecx
  102787:	88 8a 64 01 00 00    	mov    %cl,0x164(%edx)
  10278d:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102793:	0f b6 8a 64 01 00 00 	movzbl 0x164(%edx),%ecx
  10279a:	83 e1 1f             	and    $0x1f,%ecx
  10279d:	88 8a 64 01 00 00    	mov    %cl,0x164(%edx)
  1027a3:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1027a9:	0f b6 8a 65 01 00 00 	movzbl 0x165(%edx),%ecx
  1027b0:	83 e1 f0             	and    $0xfffffff0,%ecx
  1027b3:	83 c9 0e             	or     $0xe,%ecx
  1027b6:	88 8a 65 01 00 00    	mov    %cl,0x165(%edx)
  1027bc:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1027c2:	0f b6 8a 65 01 00 00 	movzbl 0x165(%edx),%ecx
  1027c9:	83 e1 ef             	and    $0xffffffef,%ecx
  1027cc:	88 8a 65 01 00 00    	mov    %cl,0x165(%edx)
  1027d2:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1027d8:	0f b6 8a 65 01 00 00 	movzbl 0x165(%edx),%ecx
  1027df:	83 e1 9f             	and    $0xffffff9f,%ecx
  1027e2:	88 8a 65 01 00 00    	mov    %cl,0x165(%edx)
  1027e8:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1027ee:	0f b6 8a 65 01 00 00 	movzbl 0x165(%edx),%ecx
  1027f5:	83 c9 80             	or     $0xffffff80,%ecx
  1027f8:	88 8a 65 01 00 00    	mov    %cl,0x165(%edx)
  1027fe:	c7 c2 30 2d 10 00    	mov    $0x102d30,%edx
  102804:	c1 ea 10             	shr    $0x10,%edx
  102807:	89 d1                	mov    %edx,%ecx
  102809:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10280f:	66 89 8a 66 01 00 00 	mov    %cx,0x166(%edx)
  102816:	c7 c2 36 2d 10 00    	mov    $0x102d36,%edx
  10281c:	89 d1                	mov    %edx,%ecx
  10281e:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102824:	66 89 8a 68 01 00 00 	mov    %cx,0x168(%edx)
  10282b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102831:	66 c7 82 6a 01 00 00 	movw   $0x8,0x16a(%edx)
  102838:	08 00 
  10283a:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102840:	0f b6 8a 6c 01 00 00 	movzbl 0x16c(%edx),%ecx
  102847:	83 e1 e0             	and    $0xffffffe0,%ecx
  10284a:	88 8a 6c 01 00 00    	mov    %cl,0x16c(%edx)
  102850:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102856:	0f b6 8a 6c 01 00 00 	movzbl 0x16c(%edx),%ecx
  10285d:	83 e1 1f             	and    $0x1f,%ecx
  102860:	88 8a 6c 01 00 00    	mov    %cl,0x16c(%edx)
  102866:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10286c:	0f b6 8a 6d 01 00 00 	movzbl 0x16d(%edx),%ecx
  102873:	83 e1 f0             	and    $0xfffffff0,%ecx
  102876:	83 c9 0e             	or     $0xe,%ecx
  102879:	88 8a 6d 01 00 00    	mov    %cl,0x16d(%edx)
  10287f:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102885:	0f b6 8a 6d 01 00 00 	movzbl 0x16d(%edx),%ecx
  10288c:	83 e1 ef             	and    $0xffffffef,%ecx
  10288f:	88 8a 6d 01 00 00    	mov    %cl,0x16d(%edx)
  102895:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10289b:	0f b6 8a 6d 01 00 00 	movzbl 0x16d(%edx),%ecx
  1028a2:	83 e1 9f             	and    $0xffffff9f,%ecx
  1028a5:	88 8a 6d 01 00 00    	mov    %cl,0x16d(%edx)
  1028ab:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1028b1:	0f b6 8a 6d 01 00 00 	movzbl 0x16d(%edx),%ecx
  1028b8:	83 c9 80             	or     $0xffffff80,%ecx
  1028bb:	88 8a 6d 01 00 00    	mov    %cl,0x16d(%edx)
  1028c1:	c7 c2 36 2d 10 00    	mov    $0x102d36,%edx
  1028c7:	c1 ea 10             	shr    $0x10,%edx
  1028ca:	89 d1                	mov    %edx,%ecx
  1028cc:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1028d2:	66 89 8a 6e 01 00 00 	mov    %cx,0x16e(%edx)
  1028d9:	c7 c2 3c 2d 10 00    	mov    $0x102d3c,%edx
  1028df:	89 d1                	mov    %edx,%ecx
  1028e1:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1028e7:	66 89 8a 70 01 00 00 	mov    %cx,0x170(%edx)
  1028ee:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1028f4:	66 c7 82 72 01 00 00 	movw   $0x8,0x172(%edx)
  1028fb:	08 00 
  1028fd:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102903:	0f b6 8a 74 01 00 00 	movzbl 0x174(%edx),%ecx
  10290a:	83 e1 e0             	and    $0xffffffe0,%ecx
  10290d:	88 8a 74 01 00 00    	mov    %cl,0x174(%edx)
  102913:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102919:	0f b6 8a 74 01 00 00 	movzbl 0x174(%edx),%ecx
  102920:	83 e1 1f             	and    $0x1f,%ecx
  102923:	88 8a 74 01 00 00    	mov    %cl,0x174(%edx)
  102929:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10292f:	0f b6 8a 75 01 00 00 	movzbl 0x175(%edx),%ecx
  102936:	83 e1 f0             	and    $0xfffffff0,%ecx
  102939:	83 c9 0e             	or     $0xe,%ecx
  10293c:	88 8a 75 01 00 00    	mov    %cl,0x175(%edx)
  102942:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102948:	0f b6 8a 75 01 00 00 	movzbl 0x175(%edx),%ecx
  10294f:	83 e1 ef             	and    $0xffffffef,%ecx
  102952:	88 8a 75 01 00 00    	mov    %cl,0x175(%edx)
  102958:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  10295e:	0f b6 8a 75 01 00 00 	movzbl 0x175(%edx),%ecx
  102965:	83 e1 9f             	and    $0xffffff9f,%ecx
  102968:	88 8a 75 01 00 00    	mov    %cl,0x175(%edx)
  10296e:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102974:	0f b6 8a 75 01 00 00 	movzbl 0x175(%edx),%ecx
  10297b:	83 c9 80             	or     $0xffffff80,%ecx
  10297e:	88 8a 75 01 00 00    	mov    %cl,0x175(%edx)
  102984:	c7 c2 3c 2d 10 00    	mov    $0x102d3c,%edx
  10298a:	c1 ea 10             	shr    $0x10,%edx
  10298d:	89 d1                	mov    %edx,%ecx
  10298f:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102995:	66 89 8a 76 01 00 00 	mov    %cx,0x176(%edx)
  10299c:	c7 c2 42 2d 10 00    	mov    $0x102d42,%edx
  1029a2:	89 d1                	mov    %edx,%ecx
  1029a4:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1029aa:	66 89 8a 78 01 00 00 	mov    %cx,0x178(%edx)
  1029b1:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1029b7:	66 c7 82 7a 01 00 00 	movw   $0x8,0x17a(%edx)
  1029be:	08 00 
  1029c0:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1029c6:	0f b6 8a 7c 01 00 00 	movzbl 0x17c(%edx),%ecx
  1029cd:	83 e1 e0             	and    $0xffffffe0,%ecx
  1029d0:	88 8a 7c 01 00 00    	mov    %cl,0x17c(%edx)
  1029d6:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1029dc:	0f b6 8a 7c 01 00 00 	movzbl 0x17c(%edx),%ecx
  1029e3:	83 e1 1f             	and    $0x1f,%ecx
  1029e6:	88 8a 7c 01 00 00    	mov    %cl,0x17c(%edx)
  1029ec:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  1029f2:	0f b6 8a 7d 01 00 00 	movzbl 0x17d(%edx),%ecx
  1029f9:	83 e1 f0             	and    $0xfffffff0,%ecx
  1029fc:	83 c9 0e             	or     $0xe,%ecx
  1029ff:	88 8a 7d 01 00 00    	mov    %cl,0x17d(%edx)
  102a05:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102a0b:	0f b6 8a 7d 01 00 00 	movzbl 0x17d(%edx),%ecx
  102a12:	83 e1 ef             	and    $0xffffffef,%ecx
  102a15:	88 8a 7d 01 00 00    	mov    %cl,0x17d(%edx)
  102a1b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102a21:	0f b6 8a 7d 01 00 00 	movzbl 0x17d(%edx),%ecx
  102a28:	83 e1 9f             	and    $0xffffff9f,%ecx
  102a2b:	88 8a 7d 01 00 00    	mov    %cl,0x17d(%edx)
  102a31:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102a37:	0f b6 8a 7d 01 00 00 	movzbl 0x17d(%edx),%ecx
  102a3e:	83 c9 80             	or     $0xffffff80,%ecx
  102a41:	88 8a 7d 01 00 00    	mov    %cl,0x17d(%edx)
  102a47:	c7 c2 42 2d 10 00    	mov    $0x102d42,%edx
  102a4d:	c1 ea 10             	shr    $0x10,%edx
  102a50:	89 d1                	mov    %edx,%ecx
  102a52:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102a58:	66 89 8a 7e 01 00 00 	mov    %cx,0x17e(%edx)
  102a5f:	c7 c2 78 2d 10 00    	mov    $0x102d78,%edx
  102a65:	89 d1                	mov    %edx,%ecx
  102a67:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102a6d:	66 89 8a 80 01 00 00 	mov    %cx,0x180(%edx)
  102a74:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102a7a:	66 c7 82 82 01 00 00 	movw   $0x8,0x182(%edx)
  102a81:	08 00 
  102a83:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102a89:	0f b6 8a 84 01 00 00 	movzbl 0x184(%edx),%ecx
  102a90:	83 e1 e0             	and    $0xffffffe0,%ecx
  102a93:	88 8a 84 01 00 00    	mov    %cl,0x184(%edx)
  102a99:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102a9f:	0f b6 8a 84 01 00 00 	movzbl 0x184(%edx),%ecx
  102aa6:	83 e1 1f             	and    $0x1f,%ecx
  102aa9:	88 8a 84 01 00 00    	mov    %cl,0x184(%edx)
  102aaf:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102ab5:	0f b6 8a 85 01 00 00 	movzbl 0x185(%edx),%ecx
  102abc:	83 e1 f0             	and    $0xfffffff0,%ecx
  102abf:	83 c9 0e             	or     $0xe,%ecx
  102ac2:	88 8a 85 01 00 00    	mov    %cl,0x185(%edx)
  102ac8:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102ace:	0f b6 8a 85 01 00 00 	movzbl 0x185(%edx),%ecx
  102ad5:	83 e1 ef             	and    $0xffffffef,%ecx
  102ad8:	88 8a 85 01 00 00    	mov    %cl,0x185(%edx)
  102ade:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102ae4:	0f b6 8a 85 01 00 00 	movzbl 0x185(%edx),%ecx
  102aeb:	83 c9 60             	or     $0x60,%ecx
  102aee:	88 8a 85 01 00 00    	mov    %cl,0x185(%edx)
  102af4:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102afa:	0f b6 8a 85 01 00 00 	movzbl 0x185(%edx),%ecx
  102b01:	83 c9 80             	or     $0xffffff80,%ecx
  102b04:	88 8a 85 01 00 00    	mov    %cl,0x185(%edx)
  102b0a:	c7 c2 78 2d 10 00    	mov    $0x102d78,%edx
  102b10:	c1 ea 10             	shr    $0x10,%edx
  102b13:	89 d1                	mov    %edx,%ecx
  102b15:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102b1b:	66 89 8a 86 01 00 00 	mov    %cx,0x186(%edx)
  102b22:	c7 c2 7e 2d 10 00    	mov    $0x102d7e,%edx
  102b28:	89 d1                	mov    %edx,%ecx
  102b2a:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102b30:	66 89 8a f0 07 00 00 	mov    %cx,0x7f0(%edx)
  102b37:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102b3d:	66 c7 82 f2 07 00 00 	movw   $0x8,0x7f2(%edx)
  102b44:	08 00 
  102b46:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102b4c:	0f b6 8a f4 07 00 00 	movzbl 0x7f4(%edx),%ecx
  102b53:	83 e1 e0             	and    $0xffffffe0,%ecx
  102b56:	88 8a f4 07 00 00    	mov    %cl,0x7f4(%edx)
  102b5c:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102b62:	0f b6 8a f4 07 00 00 	movzbl 0x7f4(%edx),%ecx
  102b69:	83 e1 1f             	and    $0x1f,%ecx
  102b6c:	88 8a f4 07 00 00    	mov    %cl,0x7f4(%edx)
  102b72:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102b78:	0f b6 8a f5 07 00 00 	movzbl 0x7f5(%edx),%ecx
  102b7f:	83 e1 f0             	and    $0xfffffff0,%ecx
  102b82:	83 c9 0e             	or     $0xe,%ecx
  102b85:	88 8a f5 07 00 00    	mov    %cl,0x7f5(%edx)
  102b8b:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102b91:	0f b6 8a f5 07 00 00 	movzbl 0x7f5(%edx),%ecx
  102b98:	83 e1 ef             	and    $0xffffffef,%ecx
  102b9b:	88 8a f5 07 00 00    	mov    %cl,0x7f5(%edx)
  102ba1:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102ba7:	0f b6 8a f5 07 00 00 	movzbl 0x7f5(%edx),%ecx
  102bae:	83 e1 9f             	and    $0xffffff9f,%ecx
  102bb1:	88 8a f5 07 00 00    	mov    %cl,0x7f5(%edx)
  102bb7:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102bbd:	0f b6 8a f5 07 00 00 	movzbl 0x7f5(%edx),%ecx
  102bc4:	83 c9 80             	or     $0xffffff80,%ecx
  102bc7:	88 8a f5 07 00 00    	mov    %cl,0x7f5(%edx)
  102bcd:	c7 c2 7e 2d 10 00    	mov    $0x102d7e,%edx
  102bd3:	c1 ea 10             	shr    $0x10,%edx
  102bd6:	89 d1                	mov    %edx,%ecx
  102bd8:	c7 c2 c0 16 91 00    	mov    $0x9116c0,%edx
  102bde:	66 89 8a f6 07 00 00 	mov    %cx,0x7f6(%edx)
  102be5:	0f 01 98 10 15 00 00 	lidtl  0x1510(%eax)
  102bec:	90                   	nop
  102bed:	83 c4 10             	add    $0x10,%esp
  102bf0:	5b                   	pop    %ebx
  102bf1:	5d                   	pop    %ebp
  102bf2:	c3                   	ret    

00102bf3 <intr_init>:
  102bf3:	55                   	push   %ebp
  102bf4:	89 e5                	mov    %esp,%ebp
  102bf6:	53                   	push   %ebx
  102bf7:	e8 17 d8 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  102bfc:	81 c3 04 64 00 00    	add    $0x6404,%ebx
  102c02:	0f b6 83 44 7e 00 00 	movzbl 0x7e44(%ebx),%eax
  102c09:	3c 01                	cmp    $0x1,%al
  102c0b:	74 0e                	je     102c1b <intr_init+0x28>
  102c0d:	e8 b2 e6 ff ff       	call   1012c4 <intr_init_idt>
  102c12:	c6 83 44 7e 00 00 01 	movb   $0x1,0x7e44(%ebx)
  102c19:	eb 01                	jmp    102c1c <intr_init+0x29>
  102c1b:	90                   	nop
  102c1c:	5b                   	pop    %ebx
  102c1d:	5d                   	pop    %ebp
  102c1e:	c3                   	ret    
  102c1f:	90                   	nop

00102c20 <Xdivide>:
  102c20:	6a 00                	push   $0x0
  102c22:	6a 00                	push   $0x0
  102c24:	e9 67 01 00 00       	jmp    102d90 <_alltraps>
  102c29:	90                   	nop

00102c2a <Xdebug>:
  102c2a:	6a 00                	push   $0x0
  102c2c:	6a 01                	push   $0x1
  102c2e:	e9 5d 01 00 00       	jmp    102d90 <_alltraps>
  102c33:	90                   	nop

00102c34 <Xnmi>:
  102c34:	6a 00                	push   $0x0
  102c36:	6a 02                	push   $0x2
  102c38:	e9 53 01 00 00       	jmp    102d90 <_alltraps>
  102c3d:	90                   	nop

00102c3e <Xbrkpt>:
  102c3e:	6a 00                	push   $0x0
  102c40:	6a 03                	push   $0x3
  102c42:	e9 49 01 00 00       	jmp    102d90 <_alltraps>
  102c47:	90                   	nop

00102c48 <Xoflow>:
  102c48:	6a 00                	push   $0x0
  102c4a:	6a 04                	push   $0x4
  102c4c:	e9 3f 01 00 00       	jmp    102d90 <_alltraps>
  102c51:	90                   	nop

00102c52 <Xbound>:
  102c52:	6a 00                	push   $0x0
  102c54:	6a 05                	push   $0x5
  102c56:	e9 35 01 00 00       	jmp    102d90 <_alltraps>
  102c5b:	90                   	nop

00102c5c <Xillop>:
  102c5c:	6a 00                	push   $0x0
  102c5e:	6a 06                	push   $0x6
  102c60:	e9 2b 01 00 00       	jmp    102d90 <_alltraps>
  102c65:	90                   	nop

00102c66 <Xdevice>:
  102c66:	6a 00                	push   $0x0
  102c68:	6a 07                	push   $0x7
  102c6a:	e9 21 01 00 00       	jmp    102d90 <_alltraps>
  102c6f:	90                   	nop

00102c70 <Xdblflt>:
  102c70:	6a 08                	push   $0x8
  102c72:	e9 19 01 00 00       	jmp    102d90 <_alltraps>
  102c77:	90                   	nop

00102c78 <Xcoproc>:
  102c78:	6a 00                	push   $0x0
  102c7a:	6a 09                	push   $0x9
  102c7c:	e9 0f 01 00 00       	jmp    102d90 <_alltraps>
  102c81:	90                   	nop

00102c82 <Xtss>:
  102c82:	6a 0a                	push   $0xa
  102c84:	e9 07 01 00 00       	jmp    102d90 <_alltraps>
  102c89:	90                   	nop

00102c8a <Xsegnp>:
  102c8a:	6a 0b                	push   $0xb
  102c8c:	e9 ff 00 00 00       	jmp    102d90 <_alltraps>
  102c91:	90                   	nop

00102c92 <Xstack>:
  102c92:	6a 0c                	push   $0xc
  102c94:	e9 f7 00 00 00       	jmp    102d90 <_alltraps>
  102c99:	90                   	nop

00102c9a <Xgpflt>:
  102c9a:	6a 0d                	push   $0xd
  102c9c:	e9 ef 00 00 00       	jmp    102d90 <_alltraps>
  102ca1:	90                   	nop

00102ca2 <Xpgflt>:
  102ca2:	6a 0e                	push   $0xe
  102ca4:	e9 e7 00 00 00       	jmp    102d90 <_alltraps>
  102ca9:	90                   	nop

00102caa <Xres>:
  102caa:	6a 00                	push   $0x0
  102cac:	6a 0f                	push   $0xf
  102cae:	e9 dd 00 00 00       	jmp    102d90 <_alltraps>
  102cb3:	90                   	nop

00102cb4 <Xfperr>:
  102cb4:	6a 00                	push   $0x0
  102cb6:	6a 10                	push   $0x10
  102cb8:	e9 d3 00 00 00       	jmp    102d90 <_alltraps>
  102cbd:	90                   	nop

00102cbe <Xalign>:
  102cbe:	6a 11                	push   $0x11
  102cc0:	e9 cb 00 00 00       	jmp    102d90 <_alltraps>
  102cc5:	90                   	nop

00102cc6 <Xmchk>:
  102cc6:	6a 00                	push   $0x0
  102cc8:	6a 12                	push   $0x12
  102cca:	e9 c1 00 00 00       	jmp    102d90 <_alltraps>
  102ccf:	90                   	nop

00102cd0 <Xirq_timer>:
  102cd0:	6a 00                	push   $0x0
  102cd2:	6a 20                	push   $0x20
  102cd4:	e9 b7 00 00 00       	jmp    102d90 <_alltraps>
  102cd9:	90                   	nop

00102cda <Xirq_kbd>:
  102cda:	6a 00                	push   $0x0
  102cdc:	6a 21                	push   $0x21
  102cde:	e9 ad 00 00 00       	jmp    102d90 <_alltraps>
  102ce3:	90                   	nop

00102ce4 <Xirq_slave>:
  102ce4:	6a 00                	push   $0x0
  102ce6:	6a 22                	push   $0x22
  102ce8:	e9 a3 00 00 00       	jmp    102d90 <_alltraps>
  102ced:	90                   	nop

00102cee <Xirq_serial2>:
  102cee:	6a 00                	push   $0x0
  102cf0:	6a 23                	push   $0x23
  102cf2:	e9 99 00 00 00       	jmp    102d90 <_alltraps>
  102cf7:	90                   	nop

00102cf8 <Xirq_serial1>:
  102cf8:	6a 00                	push   $0x0
  102cfa:	6a 24                	push   $0x24
  102cfc:	e9 8f 00 00 00       	jmp    102d90 <_alltraps>
  102d01:	90                   	nop

00102d02 <Xirq_lpt>:
  102d02:	6a 00                	push   $0x0
  102d04:	6a 25                	push   $0x25
  102d06:	e9 85 00 00 00       	jmp    102d90 <_alltraps>
  102d0b:	90                   	nop

00102d0c <Xirq_floppy>:
  102d0c:	6a 00                	push   $0x0
  102d0e:	6a 26                	push   $0x26
  102d10:	eb 7e                	jmp    102d90 <_alltraps>

00102d12 <Xirq_spurious>:
  102d12:	6a 00                	push   $0x0
  102d14:	6a 27                	push   $0x27
  102d16:	eb 78                	jmp    102d90 <_alltraps>

00102d18 <Xirq_rtc>:
  102d18:	6a 00                	push   $0x0
  102d1a:	6a 28                	push   $0x28
  102d1c:	eb 72                	jmp    102d90 <_alltraps>

00102d1e <Xirq9>:
  102d1e:	6a 00                	push   $0x0
  102d20:	6a 29                	push   $0x29
  102d22:	eb 6c                	jmp    102d90 <_alltraps>

00102d24 <Xirq10>:
  102d24:	6a 00                	push   $0x0
  102d26:	6a 2a                	push   $0x2a
  102d28:	eb 66                	jmp    102d90 <_alltraps>

00102d2a <Xirq11>:
  102d2a:	6a 00                	push   $0x0
  102d2c:	6a 2b                	push   $0x2b
  102d2e:	eb 60                	jmp    102d90 <_alltraps>

00102d30 <Xirq_mouse>:
  102d30:	6a 00                	push   $0x0
  102d32:	6a 2c                	push   $0x2c
  102d34:	eb 5a                	jmp    102d90 <_alltraps>

00102d36 <Xirq_coproc>:
  102d36:	6a 00                	push   $0x0
  102d38:	6a 2d                	push   $0x2d
  102d3a:	eb 54                	jmp    102d90 <_alltraps>

00102d3c <Xirq_ide1>:
  102d3c:	6a 00                	push   $0x0
  102d3e:	6a 2e                	push   $0x2e
  102d40:	eb 4e                	jmp    102d90 <_alltraps>

00102d42 <Xirq_ide2>:
  102d42:	6a 00                	push   $0x0
  102d44:	6a 2f                	push   $0x2f
  102d46:	eb 48                	jmp    102d90 <_alltraps>

00102d48 <Xirq_ehci1>:
  102d48:	6a 00                	push   $0x0
  102d4a:	6a 30                	push   $0x30
  102d4c:	eb 42                	jmp    102d90 <_alltraps>

00102d4e <Xirq17>:
  102d4e:	6a 00                	push   $0x0
  102d50:	6a 31                	push   $0x31
  102d52:	eb 3c                	jmp    102d90 <_alltraps>

00102d54 <Xirq18>:
  102d54:	6a 00                	push   $0x0
  102d56:	6a 32                	push   $0x32
  102d58:	eb 36                	jmp    102d90 <_alltraps>

00102d5a <Xirq19>:
  102d5a:	6a 00                	push   $0x0
  102d5c:	6a 33                	push   $0x33
  102d5e:	eb 30                	jmp    102d90 <_alltraps>

00102d60 <Xirq20>:
  102d60:	6a 00                	push   $0x0
  102d62:	6a 34                	push   $0x34
  102d64:	eb 2a                	jmp    102d90 <_alltraps>

00102d66 <Xirq21>:
  102d66:	6a 00                	push   $0x0
  102d68:	6a 35                	push   $0x35
  102d6a:	eb 24                	jmp    102d90 <_alltraps>

00102d6c <Xirq22>:
  102d6c:	6a 00                	push   $0x0
  102d6e:	6a 36                	push   $0x36
  102d70:	eb 1e                	jmp    102d90 <_alltraps>

00102d72 <Xirq_ehci2>:
  102d72:	6a 00                	push   $0x0
  102d74:	6a 37                	push   $0x37
  102d76:	eb 18                	jmp    102d90 <_alltraps>

00102d78 <Xsyscall>:
  102d78:	6a 00                	push   $0x0
  102d7a:	6a 30                	push   $0x30
  102d7c:	eb 12                	jmp    102d90 <_alltraps>

00102d7e <Xdefault>:
  102d7e:	68 fe 00 00 00       	push   $0xfe
  102d83:	eb 0b                	jmp    102d90 <_alltraps>
  102d85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  102d89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00102d90 <_alltraps>:
  102d90:	fa                   	cli    
  102d91:	1e                   	push   %ds
  102d92:	06                   	push   %es
  102d93:	60                   	pusha  
  102d94:	b8 10 00 00 00       	mov    $0x10,%eax
  102d99:	8e d8                	mov    %eax,%ds
  102d9b:	8e c0                	mov    %eax,%es
  102d9d:	54                   	push   %esp
  102d9e:	e8 ae 21 00 00       	call   104f51 <trap>
  102da3:	f4                   	hlt    
  102da4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  102daa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00102db0 <trap_return>:
  102db0:	8b 64 24 04          	mov    0x4(%esp),%esp
  102db4:	61                   	popa   
  102db5:	07                   	pop    %es
  102db6:	1f                   	pop    %ds
  102db7:	83 c4 08             	add    $0x8,%esp
  102dba:	c3                   	ret    

00102dbb <memset>:
  102dbb:	55                   	push   %ebp
  102dbc:	89 e5                	mov    %esp,%ebp
  102dbe:	57                   	push   %edi
  102dbf:	e8 47 d6 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  102dc4:	05 3c 62 00 00       	add    $0x623c,%eax
  102dc9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102dcd:	75 05                	jne    102dd4 <memset+0x19>
  102dcf:	8b 45 08             	mov    0x8(%ebp),%eax
  102dd2:	eb 5c                	jmp    102e30 <memset+0x75>
  102dd4:	8b 45 08             	mov    0x8(%ebp),%eax
  102dd7:	83 e0 03             	and    $0x3,%eax
  102dda:	85 c0                	test   %eax,%eax
  102ddc:	75 41                	jne    102e1f <memset+0x64>
  102dde:	8b 45 10             	mov    0x10(%ebp),%eax
  102de1:	83 e0 03             	and    $0x3,%eax
  102de4:	85 c0                	test   %eax,%eax
  102de6:	75 37                	jne    102e1f <memset+0x64>
  102de8:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
  102def:	8b 45 0c             	mov    0xc(%ebp),%eax
  102df2:	c1 e0 18             	shl    $0x18,%eax
  102df5:	89 c2                	mov    %eax,%edx
  102df7:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dfa:	c1 e0 10             	shl    $0x10,%eax
  102dfd:	09 c2                	or     %eax,%edx
  102dff:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e02:	c1 e0 08             	shl    $0x8,%eax
  102e05:	09 d0                	or     %edx,%eax
  102e07:	09 45 0c             	or     %eax,0xc(%ebp)
  102e0a:	8b 45 10             	mov    0x10(%ebp),%eax
  102e0d:	c1 e8 02             	shr    $0x2,%eax
  102e10:	89 c1                	mov    %eax,%ecx
  102e12:	8b 55 08             	mov    0x8(%ebp),%edx
  102e15:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e18:	89 d7                	mov    %edx,%edi
  102e1a:	fc                   	cld    
  102e1b:	f3 ab                	rep stos %eax,%es:(%edi)
  102e1d:	eb 0e                	jmp    102e2d <memset+0x72>
  102e1f:	8b 55 08             	mov    0x8(%ebp),%edx
  102e22:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e25:	8b 4d 10             	mov    0x10(%ebp),%ecx
  102e28:	89 d7                	mov    %edx,%edi
  102e2a:	fc                   	cld    
  102e2b:	f3 aa                	rep stos %al,%es:(%edi)
  102e2d:	8b 45 08             	mov    0x8(%ebp),%eax
  102e30:	5f                   	pop    %edi
  102e31:	5d                   	pop    %ebp
  102e32:	c3                   	ret    

00102e33 <memmove>:
  102e33:	55                   	push   %ebp
  102e34:	89 e5                	mov    %esp,%ebp
  102e36:	57                   	push   %edi
  102e37:	56                   	push   %esi
  102e38:	53                   	push   %ebx
  102e39:	83 ec 10             	sub    $0x10,%esp
  102e3c:	e8 ca d5 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  102e41:	05 bf 61 00 00       	add    $0x61bf,%eax
  102e46:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e49:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e4c:	8b 45 08             	mov    0x8(%ebp),%eax
  102e4f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e52:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e55:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e58:	73 6d                	jae    102ec7 <memmove+0x94>
  102e5a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102e5d:	8b 45 10             	mov    0x10(%ebp),%eax
  102e60:	01 d0                	add    %edx,%eax
  102e62:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  102e65:	73 60                	jae    102ec7 <memmove+0x94>
  102e67:	8b 45 10             	mov    0x10(%ebp),%eax
  102e6a:	01 45 f0             	add    %eax,-0x10(%ebp)
  102e6d:	8b 45 10             	mov    0x10(%ebp),%eax
  102e70:	01 45 ec             	add    %eax,-0x14(%ebp)
  102e73:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e76:	83 e0 03             	and    $0x3,%eax
  102e79:	85 c0                	test   %eax,%eax
  102e7b:	75 2f                	jne    102eac <memmove+0x79>
  102e7d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e80:	83 e0 03             	and    $0x3,%eax
  102e83:	85 c0                	test   %eax,%eax
  102e85:	75 25                	jne    102eac <memmove+0x79>
  102e87:	8b 45 10             	mov    0x10(%ebp),%eax
  102e8a:	83 e0 03             	and    $0x3,%eax
  102e8d:	85 c0                	test   %eax,%eax
  102e8f:	75 1b                	jne    102eac <memmove+0x79>
  102e91:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e94:	83 e8 04             	sub    $0x4,%eax
  102e97:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102e9a:	83 ea 04             	sub    $0x4,%edx
  102e9d:	8b 4d 10             	mov    0x10(%ebp),%ecx
  102ea0:	c1 e9 02             	shr    $0x2,%ecx
  102ea3:	89 c7                	mov    %eax,%edi
  102ea5:	89 d6                	mov    %edx,%esi
  102ea7:	fd                   	std    
  102ea8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102eaa:	eb 18                	jmp    102ec4 <memmove+0x91>
  102eac:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102eaf:	8d 50 ff             	lea    -0x1(%eax),%edx
  102eb2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102eb5:	8d 58 ff             	lea    -0x1(%eax),%ebx
  102eb8:	8b 45 10             	mov    0x10(%ebp),%eax
  102ebb:	89 d7                	mov    %edx,%edi
  102ebd:	89 de                	mov    %ebx,%esi
  102ebf:	89 c1                	mov    %eax,%ecx
  102ec1:	fd                   	std    
  102ec2:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ec4:	fc                   	cld    
  102ec5:	eb 45                	jmp    102f0c <memmove+0xd9>
  102ec7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102eca:	83 e0 03             	and    $0x3,%eax
  102ecd:	85 c0                	test   %eax,%eax
  102ecf:	75 2b                	jne    102efc <memmove+0xc9>
  102ed1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ed4:	83 e0 03             	and    $0x3,%eax
  102ed7:	85 c0                	test   %eax,%eax
  102ed9:	75 21                	jne    102efc <memmove+0xc9>
  102edb:	8b 45 10             	mov    0x10(%ebp),%eax
  102ede:	83 e0 03             	and    $0x3,%eax
  102ee1:	85 c0                	test   %eax,%eax
  102ee3:	75 17                	jne    102efc <memmove+0xc9>
  102ee5:	8b 45 10             	mov    0x10(%ebp),%eax
  102ee8:	c1 e8 02             	shr    $0x2,%eax
  102eeb:	89 c1                	mov    %eax,%ecx
  102eed:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ef0:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102ef3:	89 c7                	mov    %eax,%edi
  102ef5:	89 d6                	mov    %edx,%esi
  102ef7:	fc                   	cld    
  102ef8:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102efa:	eb 10                	jmp    102f0c <memmove+0xd9>
  102efc:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102eff:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102f02:	8b 4d 10             	mov    0x10(%ebp),%ecx
  102f05:	89 c7                	mov    %eax,%edi
  102f07:	89 d6                	mov    %edx,%esi
  102f09:	fc                   	cld    
  102f0a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102f0c:	8b 45 08             	mov    0x8(%ebp),%eax
  102f0f:	83 c4 10             	add    $0x10,%esp
  102f12:	5b                   	pop    %ebx
  102f13:	5e                   	pop    %esi
  102f14:	5f                   	pop    %edi
  102f15:	5d                   	pop    %ebp
  102f16:	c3                   	ret    

00102f17 <memcpy>:
  102f17:	55                   	push   %ebp
  102f18:	89 e5                	mov    %esp,%ebp
  102f1a:	e8 ec d4 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  102f1f:	05 e1 60 00 00       	add    $0x60e1,%eax
  102f24:	ff 75 10             	pushl  0x10(%ebp)
  102f27:	ff 75 0c             	pushl  0xc(%ebp)
  102f2a:	ff 75 08             	pushl  0x8(%ebp)
  102f2d:	e8 01 ff ff ff       	call   102e33 <memmove>
  102f32:	83 c4 0c             	add    $0xc,%esp
  102f35:	c9                   	leave  
  102f36:	c3                   	ret    

00102f37 <strncmp>:
  102f37:	55                   	push   %ebp
  102f38:	89 e5                	mov    %esp,%ebp
  102f3a:	e8 cc d4 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  102f3f:	05 c1 60 00 00       	add    $0x60c1,%eax
  102f44:	eb 0c                	jmp    102f52 <strncmp+0x1b>
  102f46:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  102f4a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102f4e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  102f52:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f56:	74 1a                	je     102f72 <strncmp+0x3b>
  102f58:	8b 45 08             	mov    0x8(%ebp),%eax
  102f5b:	0f b6 00             	movzbl (%eax),%eax
  102f5e:	84 c0                	test   %al,%al
  102f60:	74 10                	je     102f72 <strncmp+0x3b>
  102f62:	8b 45 08             	mov    0x8(%ebp),%eax
  102f65:	0f b6 10             	movzbl (%eax),%edx
  102f68:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f6b:	0f b6 00             	movzbl (%eax),%eax
  102f6e:	38 c2                	cmp    %al,%dl
  102f70:	74 d4                	je     102f46 <strncmp+0xf>
  102f72:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102f76:	75 07                	jne    102f7f <strncmp+0x48>
  102f78:	b8 00 00 00 00       	mov    $0x0,%eax
  102f7d:	eb 16                	jmp    102f95 <strncmp+0x5e>
  102f7f:	8b 45 08             	mov    0x8(%ebp),%eax
  102f82:	0f b6 00             	movzbl (%eax),%eax
  102f85:	0f b6 d0             	movzbl %al,%edx
  102f88:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f8b:	0f b6 00             	movzbl (%eax),%eax
  102f8e:	0f b6 c0             	movzbl %al,%eax
  102f91:	29 c2                	sub    %eax,%edx
  102f93:	89 d0                	mov    %edx,%eax
  102f95:	5d                   	pop    %ebp
  102f96:	c3                   	ret    

00102f97 <strnlen>:
  102f97:	55                   	push   %ebp
  102f98:	89 e5                	mov    %esp,%ebp
  102f9a:	83 ec 10             	sub    $0x10,%esp
  102f9d:	e8 69 d4 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  102fa2:	05 5e 60 00 00       	add    $0x605e,%eax
  102fa7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  102fae:	eb 0c                	jmp    102fbc <strnlen+0x25>
  102fb0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  102fb4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102fb8:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
  102fbc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102fc0:	74 0a                	je     102fcc <strnlen+0x35>
  102fc2:	8b 45 08             	mov    0x8(%ebp),%eax
  102fc5:	0f b6 00             	movzbl (%eax),%eax
  102fc8:	84 c0                	test   %al,%al
  102fca:	75 e4                	jne    102fb0 <strnlen+0x19>
  102fcc:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102fcf:	c9                   	leave  
  102fd0:	c3                   	ret    

00102fd1 <strcmp>:
  102fd1:	55                   	push   %ebp
  102fd2:	89 e5                	mov    %esp,%ebp
  102fd4:	e8 32 d4 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  102fd9:	05 27 60 00 00       	add    $0x6027,%eax
  102fde:	eb 08                	jmp    102fe8 <strcmp+0x17>
  102fe0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  102fe4:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  102fe8:	8b 45 08             	mov    0x8(%ebp),%eax
  102feb:	0f b6 00             	movzbl (%eax),%eax
  102fee:	84 c0                	test   %al,%al
  102ff0:	74 10                	je     103002 <strcmp+0x31>
  102ff2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ff5:	0f b6 10             	movzbl (%eax),%edx
  102ff8:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ffb:	0f b6 00             	movzbl (%eax),%eax
  102ffe:	38 c2                	cmp    %al,%dl
  103000:	74 de                	je     102fe0 <strcmp+0xf>
  103002:	8b 45 08             	mov    0x8(%ebp),%eax
  103005:	0f b6 00             	movzbl (%eax),%eax
  103008:	0f b6 d0             	movzbl %al,%edx
  10300b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10300e:	0f b6 00             	movzbl (%eax),%eax
  103011:	0f b6 c0             	movzbl %al,%eax
  103014:	29 c2                	sub    %eax,%edx
  103016:	89 d0                	mov    %edx,%eax
  103018:	5d                   	pop    %ebp
  103019:	c3                   	ret    

0010301a <strchr>:
  10301a:	55                   	push   %ebp
  10301b:	89 e5                	mov    %esp,%ebp
  10301d:	83 ec 04             	sub    $0x4,%esp
  103020:	e8 e6 d3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103025:	05 db 5f 00 00       	add    $0x5fdb,%eax
  10302a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10302d:	88 45 fc             	mov    %al,-0x4(%ebp)
  103030:	eb 14                	jmp    103046 <strchr+0x2c>
  103032:	8b 45 08             	mov    0x8(%ebp),%eax
  103035:	0f b6 00             	movzbl (%eax),%eax
  103038:	38 45 fc             	cmp    %al,-0x4(%ebp)
  10303b:	75 05                	jne    103042 <strchr+0x28>
  10303d:	8b 45 08             	mov    0x8(%ebp),%eax
  103040:	eb 13                	jmp    103055 <strchr+0x3b>
  103042:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103046:	8b 45 08             	mov    0x8(%ebp),%eax
  103049:	0f b6 00             	movzbl (%eax),%eax
  10304c:	84 c0                	test   %al,%al
  10304e:	75 e2                	jne    103032 <strchr+0x18>
  103050:	b8 00 00 00 00       	mov    $0x0,%eax
  103055:	c9                   	leave  
  103056:	c3                   	ret    

00103057 <memzero>:
  103057:	55                   	push   %ebp
  103058:	89 e5                	mov    %esp,%ebp
  10305a:	e8 ac d3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  10305f:	05 a1 5f 00 00       	add    $0x5fa1,%eax
  103064:	ff 75 0c             	pushl  0xc(%ebp)
  103067:	6a 00                	push   $0x0
  103069:	ff 75 08             	pushl  0x8(%ebp)
  10306c:	e8 4a fd ff ff       	call   102dbb <memset>
  103071:	83 c4 0c             	add    $0xc,%esp
  103074:	c9                   	leave  
  103075:	c3                   	ret    

00103076 <debug_info>:
  103076:	55                   	push   %ebp
  103077:	89 e5                	mov    %esp,%ebp
  103079:	53                   	push   %ebx
  10307a:	83 ec 14             	sub    $0x14,%esp
  10307d:	e8 89 d3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103082:	05 7e 5f 00 00       	add    $0x5f7e,%eax
  103087:	8d 55 0c             	lea    0xc(%ebp),%edx
  10308a:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10308d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103090:	83 ec 08             	sub    $0x8,%esp
  103093:	52                   	push   %edx
  103094:	ff 75 08             	pushl  0x8(%ebp)
  103097:	89 c3                	mov    %eax,%ebx
  103099:	e8 66 02 00 00       	call   103304 <vdprintf>
  10309e:	83 c4 10             	add    $0x10,%esp
  1030a1:	90                   	nop
  1030a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1030a5:	c9                   	leave  
  1030a6:	c3                   	ret    

001030a7 <debug_normal>:
  1030a7:	55                   	push   %ebp
  1030a8:	89 e5                	mov    %esp,%ebp
  1030aa:	53                   	push   %ebx
  1030ab:	83 ec 14             	sub    $0x14,%esp
  1030ae:	e8 60 d3 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1030b3:	81 c3 4d 5f 00 00    	add    $0x5f4d,%ebx
  1030b9:	83 ec 04             	sub    $0x4,%esp
  1030bc:	ff 75 0c             	pushl  0xc(%ebp)
  1030bf:	ff 75 08             	pushl  0x8(%ebp)
  1030c2:	8d 83 df cf ff ff    	lea    -0x3021(%ebx),%eax
  1030c8:	50                   	push   %eax
  1030c9:	e8 aa 02 00 00       	call   103378 <dprintf>
  1030ce:	83 c4 10             	add    $0x10,%esp
  1030d1:	8d 45 14             	lea    0x14(%ebp),%eax
  1030d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1030d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1030da:	83 ec 08             	sub    $0x8,%esp
  1030dd:	50                   	push   %eax
  1030de:	ff 75 10             	pushl  0x10(%ebp)
  1030e1:	e8 1e 02 00 00       	call   103304 <vdprintf>
  1030e6:	83 c4 10             	add    $0x10,%esp
  1030e9:	90                   	nop
  1030ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1030ed:	c9                   	leave  
  1030ee:	c3                   	ret    

001030ef <debug_trace>:
  1030ef:	55                   	push   %ebp
  1030f0:	89 e5                	mov    %esp,%ebp
  1030f2:	83 ec 10             	sub    $0x10,%esp
  1030f5:	e8 11 d3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1030fa:	05 06 5f 00 00       	add    $0x5f06,%eax
  1030ff:	8b 45 08             	mov    0x8(%ebp),%eax
  103102:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103105:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10310c:	eb 23                	jmp    103131 <debug_trace+0x42>
  10310e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103111:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  103118:	8b 45 0c             	mov    0xc(%ebp),%eax
  10311b:	01 c2                	add    %eax,%edx
  10311d:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103120:	8b 40 04             	mov    0x4(%eax),%eax
  103123:	89 02                	mov    %eax,(%edx)
  103125:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103128:	8b 00                	mov    (%eax),%eax
  10312a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10312d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103131:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
  103135:	7f 21                	jg     103158 <debug_trace+0x69>
  103137:	83 7d f8 00          	cmpl   $0x0,-0x8(%ebp)
  10313b:	75 d1                	jne    10310e <debug_trace+0x1f>
  10313d:	eb 19                	jmp    103158 <debug_trace+0x69>
  10313f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103142:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  103149:	8b 45 0c             	mov    0xc(%ebp),%eax
  10314c:	01 d0                	add    %edx,%eax
  10314e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  103154:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  103158:	83 7d fc 09          	cmpl   $0x9,-0x4(%ebp)
  10315c:	7e e1                	jle    10313f <debug_trace+0x50>
  10315e:	90                   	nop
  10315f:	c9                   	leave  
  103160:	c3                   	ret    

00103161 <debug_panic>:
  103161:	55                   	push   %ebp
  103162:	89 e5                	mov    %esp,%ebp
  103164:	53                   	push   %ebx
  103165:	83 ec 44             	sub    $0x44,%esp
  103168:	e8 a6 d2 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  10316d:	81 c3 93 5e 00 00    	add    $0x5e93,%ebx
  103173:	83 ec 04             	sub    $0x4,%esp
  103176:	ff 75 0c             	pushl  0xc(%ebp)
  103179:	ff 75 08             	pushl  0x8(%ebp)
  10317c:	8d 83 eb cf ff ff    	lea    -0x3015(%ebx),%eax
  103182:	50                   	push   %eax
  103183:	e8 f0 01 00 00       	call   103378 <dprintf>
  103188:	83 c4 10             	add    $0x10,%esp
  10318b:	8d 45 14             	lea    0x14(%ebp),%eax
  10318e:	89 45 c4             	mov    %eax,-0x3c(%ebp)
  103191:	8b 45 c4             	mov    -0x3c(%ebp),%eax
  103194:	83 ec 08             	sub    $0x8,%esp
  103197:	50                   	push   %eax
  103198:	ff 75 10             	pushl  0x10(%ebp)
  10319b:	e8 64 01 00 00       	call   103304 <vdprintf>
  1031a0:	83 c4 10             	add    $0x10,%esp
  1031a3:	89 e8                	mov    %ebp,%eax
  1031a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1031a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1031ab:	83 ec 08             	sub    $0x8,%esp
  1031ae:	8d 55 c8             	lea    -0x38(%ebp),%edx
  1031b1:	52                   	push   %edx
  1031b2:	50                   	push   %eax
  1031b3:	e8 37 ff ff ff       	call   1030ef <debug_trace>
  1031b8:	83 c4 10             	add    $0x10,%esp
  1031bb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1031c2:	eb 1e                	jmp    1031e2 <debug_panic+0x81>
  1031c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1031c7:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
  1031cb:	83 ec 08             	sub    $0x8,%esp
  1031ce:	50                   	push   %eax
  1031cf:	8d 83 f7 cf ff ff    	lea    -0x3009(%ebx),%eax
  1031d5:	50                   	push   %eax
  1031d6:	e8 9d 01 00 00       	call   103378 <dprintf>
  1031db:	83 c4 10             	add    $0x10,%esp
  1031de:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1031e2:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
  1031e6:	7f 0b                	jg     1031f3 <debug_panic+0x92>
  1031e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1031eb:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
  1031ef:	85 c0                	test   %eax,%eax
  1031f1:	75 d1                	jne    1031c4 <debug_panic+0x63>
  1031f3:	83 ec 0c             	sub    $0xc,%esp
  1031f6:	8d 83 05 d0 ff ff    	lea    -0x2ffb(%ebx),%eax
  1031fc:	50                   	push   %eax
  1031fd:	e8 76 01 00 00       	call   103378 <dprintf>
  103202:	83 c4 10             	add    $0x10,%esp
  103205:	e8 32 0d 00 00       	call   103f3c <halt>
  10320a:	90                   	nop
  10320b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10320e:	c9                   	leave  
  10320f:	c3                   	ret    

00103210 <debug_warn>:
  103210:	55                   	push   %ebp
  103211:	89 e5                	mov    %esp,%ebp
  103213:	53                   	push   %ebx
  103214:	83 ec 14             	sub    $0x14,%esp
  103217:	e8 f7 d1 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  10321c:	81 c3 e4 5d 00 00    	add    $0x5de4,%ebx
  103222:	83 ec 04             	sub    $0x4,%esp
  103225:	ff 75 0c             	pushl  0xc(%ebp)
  103228:	ff 75 08             	pushl  0x8(%ebp)
  10322b:	8d 83 17 d0 ff ff    	lea    -0x2fe9(%ebx),%eax
  103231:	50                   	push   %eax
  103232:	e8 41 01 00 00       	call   103378 <dprintf>
  103237:	83 c4 10             	add    $0x10,%esp
  10323a:	8d 45 14             	lea    0x14(%ebp),%eax
  10323d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103240:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103243:	83 ec 08             	sub    $0x8,%esp
  103246:	50                   	push   %eax
  103247:	ff 75 10             	pushl  0x10(%ebp)
  10324a:	e8 b5 00 00 00       	call   103304 <vdprintf>
  10324f:	83 c4 10             	add    $0x10,%esp
  103252:	90                   	nop
  103253:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103256:	c9                   	leave  
  103257:	c3                   	ret    

00103258 <cputs>:
  103258:	55                   	push   %ebp
  103259:	89 e5                	mov    %esp,%ebp
  10325b:	53                   	push   %ebx
  10325c:	83 ec 04             	sub    $0x4,%esp
  10325f:	e8 af d1 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  103264:	81 c3 9c 5d 00 00    	add    $0x5d9c,%ebx
  10326a:	eb 19                	jmp    103285 <cputs+0x2d>
  10326c:	8b 45 08             	mov    0x8(%ebp),%eax
  10326f:	0f b6 00             	movzbl (%eax),%eax
  103272:	0f be c0             	movsbl %al,%eax
  103275:	83 ec 0c             	sub    $0xc,%esp
  103278:	50                   	push   %eax
  103279:	e8 e7 d2 ff ff       	call   100565 <cons_putc>
  10327e:	83 c4 10             	add    $0x10,%esp
  103281:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  103285:	8b 45 08             	mov    0x8(%ebp),%eax
  103288:	0f b6 00             	movzbl (%eax),%eax
  10328b:	84 c0                	test   %al,%al
  10328d:	75 dd                	jne    10326c <cputs+0x14>
  10328f:	90                   	nop
  103290:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103293:	c9                   	leave  
  103294:	c3                   	ret    

00103295 <putch>:
  103295:	55                   	push   %ebp
  103296:	89 e5                	mov    %esp,%ebp
  103298:	83 ec 08             	sub    $0x8,%esp
  10329b:	e8 6b d1 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1032a0:	05 60 5d 00 00       	add    $0x5d60,%eax
  1032a5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032a8:	8b 00                	mov    (%eax),%eax
  1032aa:	8d 48 01             	lea    0x1(%eax),%ecx
  1032ad:	8b 55 0c             	mov    0xc(%ebp),%edx
  1032b0:	89 0a                	mov    %ecx,(%edx)
  1032b2:	8b 55 08             	mov    0x8(%ebp),%edx
  1032b5:	89 d1                	mov    %edx,%ecx
  1032b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  1032ba:	88 4c 02 08          	mov    %cl,0x8(%edx,%eax,1)
  1032be:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032c1:	8b 00                	mov    (%eax),%eax
  1032c3:	3d ff 01 00 00       	cmp    $0x1ff,%eax
  1032c8:	75 28                	jne    1032f2 <putch+0x5d>
  1032ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032cd:	8b 00                	mov    (%eax),%eax
  1032cf:	8b 55 0c             	mov    0xc(%ebp),%edx
  1032d2:	c6 44 02 08 00       	movb   $0x0,0x8(%edx,%eax,1)
  1032d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032da:	83 c0 08             	add    $0x8,%eax
  1032dd:	83 ec 0c             	sub    $0xc,%esp
  1032e0:	50                   	push   %eax
  1032e1:	e8 72 ff ff ff       	call   103258 <cputs>
  1032e6:	83 c4 10             	add    $0x10,%esp
  1032e9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032ec:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1032f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032f5:	8b 40 04             	mov    0x4(%eax),%eax
  1032f8:	8d 50 01             	lea    0x1(%eax),%edx
  1032fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032fe:	89 50 04             	mov    %edx,0x4(%eax)
  103301:	90                   	nop
  103302:	c9                   	leave  
  103303:	c3                   	ret    

00103304 <vdprintf>:
  103304:	55                   	push   %ebp
  103305:	89 e5                	mov    %esp,%ebp
  103307:	53                   	push   %ebx
  103308:	81 ec 14 02 00 00    	sub    $0x214,%esp
  10330e:	e8 f8 d0 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103313:	05 ed 5c 00 00       	add    $0x5ced,%eax
  103318:	c7 85 f0 fd ff ff 00 	movl   $0x0,-0x210(%ebp)
  10331f:	00 00 00 
  103322:	c7 85 f4 fd ff ff 00 	movl   $0x0,-0x20c(%ebp)
  103329:	00 00 00 
  10332c:	ff 75 0c             	pushl  0xc(%ebp)
  10332f:	ff 75 08             	pushl  0x8(%ebp)
  103332:	8d 95 f0 fd ff ff    	lea    -0x210(%ebp),%edx
  103338:	52                   	push   %edx
  103339:	8d 90 95 a2 ff ff    	lea    -0x5d6b(%eax),%edx
  10333f:	52                   	push   %edx
  103340:	89 c3                	mov    %eax,%ebx
  103342:	e8 db 01 00 00       	call   103522 <vprintfmt>
  103347:	83 c4 10             	add    $0x10,%esp
  10334a:	8b 85 f0 fd ff ff    	mov    -0x210(%ebp),%eax
  103350:	c6 84 05 f8 fd ff ff 	movb   $0x0,-0x208(%ebp,%eax,1)
  103357:	00 
  103358:	83 ec 0c             	sub    $0xc,%esp
  10335b:	8d 85 f0 fd ff ff    	lea    -0x210(%ebp),%eax
  103361:	83 c0 08             	add    $0x8,%eax
  103364:	50                   	push   %eax
  103365:	e8 ee fe ff ff       	call   103258 <cputs>
  10336a:	83 c4 10             	add    $0x10,%esp
  10336d:	8b 85 f4 fd ff ff    	mov    -0x20c(%ebp),%eax
  103373:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103376:	c9                   	leave  
  103377:	c3                   	ret    

00103378 <dprintf>:
  103378:	55                   	push   %ebp
  103379:	89 e5                	mov    %esp,%ebp
  10337b:	83 ec 18             	sub    $0x18,%esp
  10337e:	e8 88 d0 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103383:	05 7d 5c 00 00       	add    $0x5c7d,%eax
  103388:	8d 45 0c             	lea    0xc(%ebp),%eax
  10338b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10338e:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103391:	83 ec 08             	sub    $0x8,%esp
  103394:	50                   	push   %eax
  103395:	ff 75 08             	pushl  0x8(%ebp)
  103398:	e8 67 ff ff ff       	call   103304 <vdprintf>
  10339d:	83 c4 10             	add    $0x10,%esp
  1033a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1033a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1033a6:	c9                   	leave  
  1033a7:	c3                   	ret    

001033a8 <printnum>:
  1033a8:	55                   	push   %ebp
  1033a9:	89 e5                	mov    %esp,%ebp
  1033ab:	57                   	push   %edi
  1033ac:	56                   	push   %esi
  1033ad:	53                   	push   %ebx
  1033ae:	83 ec 1c             	sub    $0x1c,%esp
  1033b1:	e8 ad 04 00 00       	call   103863 <__x86.get_pc_thunk.si>
  1033b6:	81 c6 4a 5c 00 00    	add    $0x5c4a,%esi
  1033bc:	8b 45 10             	mov    0x10(%ebp),%eax
  1033bf:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1033c2:	8b 45 14             	mov    0x14(%ebp),%eax
  1033c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  1033c8:	8b 45 18             	mov    0x18(%ebp),%eax
  1033cb:	ba 00 00 00 00       	mov    $0x0,%edx
  1033d0:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
  1033d3:	72 57                	jb     10342c <printnum+0x84>
  1033d5:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
  1033d8:	77 05                	ja     1033df <printnum+0x37>
  1033da:	39 45 e0             	cmp    %eax,-0x20(%ebp)
  1033dd:	72 4d                	jb     10342c <printnum+0x84>
  1033df:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1033e2:	8d 78 ff             	lea    -0x1(%eax),%edi
  1033e5:	8b 45 18             	mov    0x18(%ebp),%eax
  1033e8:	ba 00 00 00 00       	mov    $0x0,%edx
  1033ed:	52                   	push   %edx
  1033ee:	50                   	push   %eax
  1033ef:	ff 75 e4             	pushl  -0x1c(%ebp)
  1033f2:	ff 75 e0             	pushl  -0x20(%ebp)
  1033f5:	89 f3                	mov    %esi,%ebx
  1033f7:	e8 94 28 00 00       	call   105c90 <__udivdi3>
  1033fc:	83 c4 10             	add    $0x10,%esp
  1033ff:	83 ec 04             	sub    $0x4,%esp
  103402:	ff 75 20             	pushl  0x20(%ebp)
  103405:	57                   	push   %edi
  103406:	ff 75 18             	pushl  0x18(%ebp)
  103409:	52                   	push   %edx
  10340a:	50                   	push   %eax
  10340b:	ff 75 0c             	pushl  0xc(%ebp)
  10340e:	ff 75 08             	pushl  0x8(%ebp)
  103411:	e8 92 ff ff ff       	call   1033a8 <printnum>
  103416:	83 c4 20             	add    $0x20,%esp
  103419:	eb 1b                	jmp    103436 <printnum+0x8e>
  10341b:	83 ec 08             	sub    $0x8,%esp
  10341e:	ff 75 0c             	pushl  0xc(%ebp)
  103421:	ff 75 20             	pushl  0x20(%ebp)
  103424:	8b 45 08             	mov    0x8(%ebp),%eax
  103427:	ff d0                	call   *%eax
  103429:	83 c4 10             	add    $0x10,%esp
  10342c:	83 6d 1c 01          	subl   $0x1,0x1c(%ebp)
  103430:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  103434:	7f e5                	jg     10341b <printnum+0x73>
  103436:	8b 4d 18             	mov    0x18(%ebp),%ecx
  103439:	bb 00 00 00 00       	mov    $0x0,%ebx
  10343e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103441:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103444:	53                   	push   %ebx
  103445:	51                   	push   %ecx
  103446:	52                   	push   %edx
  103447:	50                   	push   %eax
  103448:	89 f3                	mov    %esi,%ebx
  10344a:	e8 61 29 00 00       	call   105db0 <__umoddi3>
  10344f:	83 c4 10             	add    $0x10,%esp
  103452:	8d 8e 24 d0 ff ff    	lea    -0x2fdc(%esi),%ecx
  103458:	01 c8                	add    %ecx,%eax
  10345a:	0f b6 00             	movzbl (%eax),%eax
  10345d:	0f be c0             	movsbl %al,%eax
  103460:	83 ec 08             	sub    $0x8,%esp
  103463:	ff 75 0c             	pushl  0xc(%ebp)
  103466:	50                   	push   %eax
  103467:	8b 45 08             	mov    0x8(%ebp),%eax
  10346a:	ff d0                	call   *%eax
  10346c:	83 c4 10             	add    $0x10,%esp
  10346f:	90                   	nop
  103470:	8d 65 f4             	lea    -0xc(%ebp),%esp
  103473:	5b                   	pop    %ebx
  103474:	5e                   	pop    %esi
  103475:	5f                   	pop    %edi
  103476:	5d                   	pop    %ebp
  103477:	c3                   	ret    

00103478 <getuint>:
  103478:	55                   	push   %ebp
  103479:	89 e5                	mov    %esp,%ebp
  10347b:	e8 8b cf ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103480:	05 80 5b 00 00       	add    $0x5b80,%eax
  103485:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103489:	7e 14                	jle    10349f <getuint+0x27>
  10348b:	8b 45 08             	mov    0x8(%ebp),%eax
  10348e:	8b 00                	mov    (%eax),%eax
  103490:	8d 48 08             	lea    0x8(%eax),%ecx
  103493:	8b 55 08             	mov    0x8(%ebp),%edx
  103496:	89 0a                	mov    %ecx,(%edx)
  103498:	8b 50 04             	mov    0x4(%eax),%edx
  10349b:	8b 00                	mov    (%eax),%eax
  10349d:	eb 30                	jmp    1034cf <getuint+0x57>
  10349f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1034a3:	74 16                	je     1034bb <getuint+0x43>
  1034a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1034a8:	8b 00                	mov    (%eax),%eax
  1034aa:	8d 48 04             	lea    0x4(%eax),%ecx
  1034ad:	8b 55 08             	mov    0x8(%ebp),%edx
  1034b0:	89 0a                	mov    %ecx,(%edx)
  1034b2:	8b 00                	mov    (%eax),%eax
  1034b4:	ba 00 00 00 00       	mov    $0x0,%edx
  1034b9:	eb 14                	jmp    1034cf <getuint+0x57>
  1034bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1034be:	8b 00                	mov    (%eax),%eax
  1034c0:	8d 48 04             	lea    0x4(%eax),%ecx
  1034c3:	8b 55 08             	mov    0x8(%ebp),%edx
  1034c6:	89 0a                	mov    %ecx,(%edx)
  1034c8:	8b 00                	mov    (%eax),%eax
  1034ca:	ba 00 00 00 00       	mov    $0x0,%edx
  1034cf:	5d                   	pop    %ebp
  1034d0:	c3                   	ret    

001034d1 <getint>:
  1034d1:	55                   	push   %ebp
  1034d2:	89 e5                	mov    %esp,%ebp
  1034d4:	e8 32 cf ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1034d9:	05 27 5b 00 00       	add    $0x5b27,%eax
  1034de:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1034e2:	7e 14                	jle    1034f8 <getint+0x27>
  1034e4:	8b 45 08             	mov    0x8(%ebp),%eax
  1034e7:	8b 00                	mov    (%eax),%eax
  1034e9:	8d 48 08             	lea    0x8(%eax),%ecx
  1034ec:	8b 55 08             	mov    0x8(%ebp),%edx
  1034ef:	89 0a                	mov    %ecx,(%edx)
  1034f1:	8b 50 04             	mov    0x4(%eax),%edx
  1034f4:	8b 00                	mov    (%eax),%eax
  1034f6:	eb 28                	jmp    103520 <getint+0x4f>
  1034f8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1034fc:	74 12                	je     103510 <getint+0x3f>
  1034fe:	8b 45 08             	mov    0x8(%ebp),%eax
  103501:	8b 00                	mov    (%eax),%eax
  103503:	8d 48 04             	lea    0x4(%eax),%ecx
  103506:	8b 55 08             	mov    0x8(%ebp),%edx
  103509:	89 0a                	mov    %ecx,(%edx)
  10350b:	8b 00                	mov    (%eax),%eax
  10350d:	99                   	cltd   
  10350e:	eb 10                	jmp    103520 <getint+0x4f>
  103510:	8b 45 08             	mov    0x8(%ebp),%eax
  103513:	8b 00                	mov    (%eax),%eax
  103515:	8d 48 04             	lea    0x4(%eax),%ecx
  103518:	8b 55 08             	mov    0x8(%ebp),%edx
  10351b:	89 0a                	mov    %ecx,(%edx)
  10351d:	8b 00                	mov    (%eax),%eax
  10351f:	99                   	cltd   
  103520:	5d                   	pop    %ebp
  103521:	c3                   	ret    

00103522 <vprintfmt>:
  103522:	55                   	push   %ebp
  103523:	89 e5                	mov    %esp,%ebp
  103525:	57                   	push   %edi
  103526:	56                   	push   %esi
  103527:	53                   	push   %ebx
  103528:	83 ec 2c             	sub    $0x2c,%esp
  10352b:	e8 37 03 00 00       	call   103867 <__x86.get_pc_thunk.di>
  103530:	81 c7 d0 5a 00 00    	add    $0x5ad0,%edi
  103536:	eb 17                	jmp    10354f <vprintfmt+0x2d>
  103538:	85 db                	test   %ebx,%ebx
  10353a:	0f 84 1a 03 00 00    	je     10385a <.L22+0x2d>
  103540:	83 ec 08             	sub    $0x8,%esp
  103543:	ff 75 0c             	pushl  0xc(%ebp)
  103546:	53                   	push   %ebx
  103547:	8b 45 08             	mov    0x8(%ebp),%eax
  10354a:	ff d0                	call   *%eax
  10354c:	83 c4 10             	add    $0x10,%esp
  10354f:	8b 45 10             	mov    0x10(%ebp),%eax
  103552:	8d 50 01             	lea    0x1(%eax),%edx
  103555:	89 55 10             	mov    %edx,0x10(%ebp)
  103558:	0f b6 00             	movzbl (%eax),%eax
  10355b:	0f b6 d8             	movzbl %al,%ebx
  10355e:	83 fb 25             	cmp    $0x25,%ebx
  103561:	75 d5                	jne    103538 <vprintfmt+0x16>
  103563:	c6 45 cb 20          	movb   $0x20,-0x35(%ebp)
  103567:	c7 45 d4 ff ff ff ff 	movl   $0xffffffff,-0x2c(%ebp)
  10356e:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  103575:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  10357c:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
  103583:	8b 45 10             	mov    0x10(%ebp),%eax
  103586:	8d 50 01             	lea    0x1(%eax),%edx
  103589:	89 55 10             	mov    %edx,0x10(%ebp)
  10358c:	0f b6 00             	movzbl (%eax),%eax
  10358f:	0f b6 d8             	movzbl %al,%ebx
  103592:	8d 43 dd             	lea    -0x23(%ebx),%eax
  103595:	83 f8 55             	cmp    $0x55,%eax
  103598:	0f 87 8f 02 00 00    	ja     10382d <.L22>
  10359e:	c1 e0 02             	shl    $0x2,%eax
  1035a1:	8b 84 38 3c d0 ff ff 	mov    -0x2fc4(%eax,%edi,1),%eax
  1035a8:	01 f8                	add    %edi,%eax
  1035aa:	ff e0                	jmp    *%eax

001035ac <.L27>:
  1035ac:	c6 45 cb 2d          	movb   $0x2d,-0x35(%ebp)
  1035b0:	eb d1                	jmp    103583 <vprintfmt+0x61>

001035b2 <.L29>:
  1035b2:	c6 45 cb 30          	movb   $0x30,-0x35(%ebp)
  1035b6:	eb cb                	jmp    103583 <vprintfmt+0x61>

001035b8 <.L30>:
  1035b8:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
  1035bf:	8b 55 d0             	mov    -0x30(%ebp),%edx
  1035c2:	89 d0                	mov    %edx,%eax
  1035c4:	c1 e0 02             	shl    $0x2,%eax
  1035c7:	01 d0                	add    %edx,%eax
  1035c9:	01 c0                	add    %eax,%eax
  1035cb:	01 d8                	add    %ebx,%eax
  1035cd:	83 e8 30             	sub    $0x30,%eax
  1035d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1035d3:	8b 45 10             	mov    0x10(%ebp),%eax
  1035d6:	0f b6 00             	movzbl (%eax),%eax
  1035d9:	0f be d8             	movsbl %al,%ebx
  1035dc:	83 fb 2f             	cmp    $0x2f,%ebx
  1035df:	7e 39                	jle    10361a <.L23+0xc>
  1035e1:	83 fb 39             	cmp    $0x39,%ebx
  1035e4:	7f 34                	jg     10361a <.L23+0xc>
  1035e6:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  1035ea:	eb d3                	jmp    1035bf <.L30+0x7>

001035ec <.L26>:
  1035ec:	8b 45 14             	mov    0x14(%ebp),%eax
  1035ef:	8d 50 04             	lea    0x4(%eax),%edx
  1035f2:	89 55 14             	mov    %edx,0x14(%ebp)
  1035f5:	8b 00                	mov    (%eax),%eax
  1035f7:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1035fa:	eb 1f                	jmp    10361b <.L23+0xd>

001035fc <.L28>:
  1035fc:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103600:	79 81                	jns    103583 <vprintfmt+0x61>
  103602:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  103609:	e9 75 ff ff ff       	jmp    103583 <vprintfmt+0x61>

0010360e <.L23>:
  10360e:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
  103615:	e9 69 ff ff ff       	jmp    103583 <vprintfmt+0x61>
  10361a:	90                   	nop
  10361b:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  10361f:	0f 89 5e ff ff ff    	jns    103583 <vprintfmt+0x61>
  103625:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103628:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  10362b:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  103632:	e9 4c ff ff ff       	jmp    103583 <vprintfmt+0x61>

00103637 <.L33>:
  103637:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
  10363b:	e9 43 ff ff ff       	jmp    103583 <vprintfmt+0x61>

00103640 <.L31>:
  103640:	8b 45 14             	mov    0x14(%ebp),%eax
  103643:	8d 50 04             	lea    0x4(%eax),%edx
  103646:	89 55 14             	mov    %edx,0x14(%ebp)
  103649:	8b 00                	mov    (%eax),%eax
  10364b:	83 ec 08             	sub    $0x8,%esp
  10364e:	ff 75 0c             	pushl  0xc(%ebp)
  103651:	50                   	push   %eax
  103652:	8b 45 08             	mov    0x8(%ebp),%eax
  103655:	ff d0                	call   *%eax
  103657:	83 c4 10             	add    $0x10,%esp
  10365a:	e9 f6 01 00 00       	jmp    103855 <.L22+0x28>

0010365f <.L35>:
  10365f:	8b 45 14             	mov    0x14(%ebp),%eax
  103662:	8d 50 04             	lea    0x4(%eax),%edx
  103665:	89 55 14             	mov    %edx,0x14(%ebp)
  103668:	8b 30                	mov    (%eax),%esi
  10366a:	85 f6                	test   %esi,%esi
  10366c:	75 06                	jne    103674 <.L35+0x15>
  10366e:	8d b7 35 d0 ff ff    	lea    -0x2fcb(%edi),%esi
  103674:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103678:	7e 71                	jle    1036eb <.L35+0x8c>
  10367a:	80 7d cb 2d          	cmpb   $0x2d,-0x35(%ebp)
  10367e:	74 6b                	je     1036eb <.L35+0x8c>
  103680:	8b 45 d0             	mov    -0x30(%ebp),%eax
  103683:	83 ec 08             	sub    $0x8,%esp
  103686:	50                   	push   %eax
  103687:	56                   	push   %esi
  103688:	89 fb                	mov    %edi,%ebx
  10368a:	e8 08 f9 ff ff       	call   102f97 <strnlen>
  10368f:	83 c4 10             	add    $0x10,%esp
  103692:	29 45 d4             	sub    %eax,-0x2c(%ebp)
  103695:	eb 17                	jmp    1036ae <.L35+0x4f>
  103697:	0f be 45 cb          	movsbl -0x35(%ebp),%eax
  10369b:	83 ec 08             	sub    $0x8,%esp
  10369e:	ff 75 0c             	pushl  0xc(%ebp)
  1036a1:	50                   	push   %eax
  1036a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1036a5:	ff d0                	call   *%eax
  1036a7:	83 c4 10             	add    $0x10,%esp
  1036aa:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  1036ae:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  1036b2:	7f e3                	jg     103697 <.L35+0x38>
  1036b4:	eb 35                	jmp    1036eb <.L35+0x8c>
  1036b6:	83 7d cc 00          	cmpl   $0x0,-0x34(%ebp)
  1036ba:	74 1c                	je     1036d8 <.L35+0x79>
  1036bc:	83 fb 1f             	cmp    $0x1f,%ebx
  1036bf:	7e 05                	jle    1036c6 <.L35+0x67>
  1036c1:	83 fb 7e             	cmp    $0x7e,%ebx
  1036c4:	7e 12                	jle    1036d8 <.L35+0x79>
  1036c6:	83 ec 08             	sub    $0x8,%esp
  1036c9:	ff 75 0c             	pushl  0xc(%ebp)
  1036cc:	6a 3f                	push   $0x3f
  1036ce:	8b 45 08             	mov    0x8(%ebp),%eax
  1036d1:	ff d0                	call   *%eax
  1036d3:	83 c4 10             	add    $0x10,%esp
  1036d6:	eb 0f                	jmp    1036e7 <.L35+0x88>
  1036d8:	83 ec 08             	sub    $0x8,%esp
  1036db:	ff 75 0c             	pushl  0xc(%ebp)
  1036de:	53                   	push   %ebx
  1036df:	8b 45 08             	mov    0x8(%ebp),%eax
  1036e2:	ff d0                	call   *%eax
  1036e4:	83 c4 10             	add    $0x10,%esp
  1036e7:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  1036eb:	89 f0                	mov    %esi,%eax
  1036ed:	8d 70 01             	lea    0x1(%eax),%esi
  1036f0:	0f b6 00             	movzbl (%eax),%eax
  1036f3:	0f be d8             	movsbl %al,%ebx
  1036f6:	85 db                	test   %ebx,%ebx
  1036f8:	74 26                	je     103720 <.L35+0xc1>
  1036fa:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  1036fe:	78 b6                	js     1036b6 <.L35+0x57>
  103700:	83 6d d0 01          	subl   $0x1,-0x30(%ebp)
  103704:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
  103708:	79 ac                	jns    1036b6 <.L35+0x57>
  10370a:	eb 14                	jmp    103720 <.L35+0xc1>
  10370c:	83 ec 08             	sub    $0x8,%esp
  10370f:	ff 75 0c             	pushl  0xc(%ebp)
  103712:	6a 20                	push   $0x20
  103714:	8b 45 08             	mov    0x8(%ebp),%eax
  103717:	ff d0                	call   *%eax
  103719:	83 c4 10             	add    $0x10,%esp
  10371c:	83 6d d4 01          	subl   $0x1,-0x2c(%ebp)
  103720:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
  103724:	7f e6                	jg     10370c <.L35+0xad>
  103726:	e9 2a 01 00 00       	jmp    103855 <.L22+0x28>

0010372b <.L32>:
  10372b:	83 ec 08             	sub    $0x8,%esp
  10372e:	ff 75 d8             	pushl  -0x28(%ebp)
  103731:	8d 45 14             	lea    0x14(%ebp),%eax
  103734:	50                   	push   %eax
  103735:	e8 97 fd ff ff       	call   1034d1 <getint>
  10373a:	83 c4 10             	add    $0x10,%esp
  10373d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103740:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103743:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103746:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103749:	85 d2                	test   %edx,%edx
  10374b:	79 23                	jns    103770 <.L32+0x45>
  10374d:	83 ec 08             	sub    $0x8,%esp
  103750:	ff 75 0c             	pushl  0xc(%ebp)
  103753:	6a 2d                	push   $0x2d
  103755:	8b 45 08             	mov    0x8(%ebp),%eax
  103758:	ff d0                	call   *%eax
  10375a:	83 c4 10             	add    $0x10,%esp
  10375d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103760:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103763:	f7 d8                	neg    %eax
  103765:	83 d2 00             	adc    $0x0,%edx
  103768:	f7 da                	neg    %edx
  10376a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10376d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103770:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
  103777:	eb 7e                	jmp    1037f7 <.L37+0x1f>

00103779 <.L36>:
  103779:	83 ec 08             	sub    $0x8,%esp
  10377c:	ff 75 d8             	pushl  -0x28(%ebp)
  10377f:	8d 45 14             	lea    0x14(%ebp),%eax
  103782:	50                   	push   %eax
  103783:	e8 f0 fc ff ff       	call   103478 <getuint>
  103788:	83 c4 10             	add    $0x10,%esp
  10378b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10378e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  103791:	c7 45 dc 0a 00 00 00 	movl   $0xa,-0x24(%ebp)
  103798:	eb 5d                	jmp    1037f7 <.L37+0x1f>

0010379a <.L34>:
  10379a:	83 ec 08             	sub    $0x8,%esp
  10379d:	ff 75 0c             	pushl  0xc(%ebp)
  1037a0:	6a 30                	push   $0x30
  1037a2:	8b 45 08             	mov    0x8(%ebp),%eax
  1037a5:	ff d0                	call   *%eax
  1037a7:	83 c4 10             	add    $0x10,%esp
  1037aa:	83 ec 08             	sub    $0x8,%esp
  1037ad:	ff 75 0c             	pushl  0xc(%ebp)
  1037b0:	6a 78                	push   $0x78
  1037b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1037b5:	ff d0                	call   *%eax
  1037b7:	83 c4 10             	add    $0x10,%esp
  1037ba:	8b 45 14             	mov    0x14(%ebp),%eax
  1037bd:	8d 50 04             	lea    0x4(%eax),%edx
  1037c0:	89 55 14             	mov    %edx,0x14(%ebp)
  1037c3:	8b 00                	mov    (%eax),%eax
  1037c5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1037c8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1037cf:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
  1037d6:	eb 1f                	jmp    1037f7 <.L37+0x1f>

001037d8 <.L37>:
  1037d8:	83 ec 08             	sub    $0x8,%esp
  1037db:	ff 75 d8             	pushl  -0x28(%ebp)
  1037de:	8d 45 14             	lea    0x14(%ebp),%eax
  1037e1:	50                   	push   %eax
  1037e2:	e8 91 fc ff ff       	call   103478 <getuint>
  1037e7:	83 c4 10             	add    $0x10,%esp
  1037ea:	89 45 e0             	mov    %eax,-0x20(%ebp)
  1037ed:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1037f0:	c7 45 dc 10 00 00 00 	movl   $0x10,-0x24(%ebp)
  1037f7:	0f be 55 cb          	movsbl -0x35(%ebp),%edx
  1037fb:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1037fe:	83 ec 04             	sub    $0x4,%esp
  103801:	52                   	push   %edx
  103802:	ff 75 d4             	pushl  -0x2c(%ebp)
  103805:	50                   	push   %eax
  103806:	ff 75 e4             	pushl  -0x1c(%ebp)
  103809:	ff 75 e0             	pushl  -0x20(%ebp)
  10380c:	ff 75 0c             	pushl  0xc(%ebp)
  10380f:	ff 75 08             	pushl  0x8(%ebp)
  103812:	e8 91 fb ff ff       	call   1033a8 <printnum>
  103817:	83 c4 20             	add    $0x20,%esp
  10381a:	eb 39                	jmp    103855 <.L22+0x28>

0010381c <.L25>:
  10381c:	83 ec 08             	sub    $0x8,%esp
  10381f:	ff 75 0c             	pushl  0xc(%ebp)
  103822:	53                   	push   %ebx
  103823:	8b 45 08             	mov    0x8(%ebp),%eax
  103826:	ff d0                	call   *%eax
  103828:	83 c4 10             	add    $0x10,%esp
  10382b:	eb 28                	jmp    103855 <.L22+0x28>

0010382d <.L22>:
  10382d:	83 ec 08             	sub    $0x8,%esp
  103830:	ff 75 0c             	pushl  0xc(%ebp)
  103833:	6a 25                	push   $0x25
  103835:	8b 45 08             	mov    0x8(%ebp),%eax
  103838:	ff d0                	call   *%eax
  10383a:	83 c4 10             	add    $0x10,%esp
  10383d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103841:	eb 04                	jmp    103847 <.L22+0x1a>
  103843:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  103847:	8b 45 10             	mov    0x10(%ebp),%eax
  10384a:	83 e8 01             	sub    $0x1,%eax
  10384d:	0f b6 00             	movzbl (%eax),%eax
  103850:	3c 25                	cmp    $0x25,%al
  103852:	75 ef                	jne    103843 <.L22+0x16>
  103854:	90                   	nop
  103855:	e9 f5 fc ff ff       	jmp    10354f <vprintfmt+0x2d>
  10385a:	90                   	nop
  10385b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  10385e:	5b                   	pop    %ebx
  10385f:	5e                   	pop    %esi
  103860:	5f                   	pop    %edi
  103861:	5d                   	pop    %ebp
  103862:	c3                   	ret    

00103863 <__x86.get_pc_thunk.si>:
  103863:	8b 34 24             	mov    (%esp),%esi
  103866:	c3                   	ret    

00103867 <__x86.get_pc_thunk.di>:
  103867:	8b 3c 24             	mov    (%esp),%edi
  10386a:	c3                   	ret    

0010386b <seg_init>:
  10386b:	55                   	push   %ebp
  10386c:	89 e5                	mov    %esp,%ebp
  10386e:	53                   	push   %ebx
  10386f:	83 ec 14             	sub    $0x14,%esp
  103872:	e8 9c cb ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  103877:	81 c3 89 57 00 00    	add    $0x5789,%ebx
  10387d:	c7 c0 00 20 91 00    	mov    $0x912000,%eax
  103883:	89 c2                	mov    %eax,%edx
  103885:	c7 c0 68 f9 10 00    	mov    $0x10f968,%eax
  10388b:	29 c2                	sub    %eax,%edx
  10388d:	89 d0                	mov    %edx,%eax
  10388f:	83 ec 08             	sub    $0x8,%esp
  103892:	50                   	push   %eax
  103893:	c7 c0 68 f9 10 00    	mov    $0x10f968,%eax
  103899:	50                   	push   %eax
  10389a:	e8 b8 f7 ff ff       	call   103057 <memzero>
  10389f:	83 c4 10             	add    $0x10,%esp
  1038a2:	c7 c0 00 70 d9 00    	mov    $0xd97000,%eax
  1038a8:	8d 90 00 f0 ff ff    	lea    -0x1000(%eax),%edx
  1038ae:	c7 c0 00 20 91 00    	mov    $0x912000,%eax
  1038b4:	29 c2                	sub    %eax,%edx
  1038b6:	89 d0                	mov    %edx,%eax
  1038b8:	89 c2                	mov    %eax,%edx
  1038ba:	c7 c0 00 20 91 00    	mov    $0x912000,%eax
  1038c0:	8d 80 00 10 00 00    	lea    0x1000(%eax),%eax
  1038c6:	83 ec 08             	sub    $0x8,%esp
  1038c9:	52                   	push   %edx
  1038ca:	50                   	push   %eax
  1038cb:	e8 87 f7 ff ff       	call   103057 <memzero>
  1038d0:	83 c4 10             	add    $0x10,%esp
  1038d3:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  1038d9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
  1038df:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  1038e6:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  1038ec:	66 c7 40 08 ff ff    	movw   $0xffff,0x8(%eax)
  1038f2:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  1038f8:	66 c7 40 0a 00 00    	movw   $0x0,0xa(%eax)
  1038fe:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103904:	c6 40 0c 00          	movb   $0x0,0xc(%eax)
  103908:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  10390e:	0f b6 50 0d          	movzbl 0xd(%eax),%edx
  103912:	83 e2 f0             	and    $0xfffffff0,%edx
  103915:	83 ca 0a             	or     $0xa,%edx
  103918:	88 50 0d             	mov    %dl,0xd(%eax)
  10391b:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103921:	0f b6 50 0d          	movzbl 0xd(%eax),%edx
  103925:	83 ca 10             	or     $0x10,%edx
  103928:	88 50 0d             	mov    %dl,0xd(%eax)
  10392b:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103931:	0f b6 50 0d          	movzbl 0xd(%eax),%edx
  103935:	83 e2 9f             	and    $0xffffff9f,%edx
  103938:	88 50 0d             	mov    %dl,0xd(%eax)
  10393b:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103941:	0f b6 50 0d          	movzbl 0xd(%eax),%edx
  103945:	83 ca 80             	or     $0xffffff80,%edx
  103948:	88 50 0d             	mov    %dl,0xd(%eax)
  10394b:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103951:	0f b6 50 0e          	movzbl 0xe(%eax),%edx
  103955:	83 ca 0f             	or     $0xf,%edx
  103958:	88 50 0e             	mov    %dl,0xe(%eax)
  10395b:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103961:	0f b6 50 0e          	movzbl 0xe(%eax),%edx
  103965:	83 e2 ef             	and    $0xffffffef,%edx
  103968:	88 50 0e             	mov    %dl,0xe(%eax)
  10396b:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103971:	0f b6 50 0e          	movzbl 0xe(%eax),%edx
  103975:	83 e2 df             	and    $0xffffffdf,%edx
  103978:	88 50 0e             	mov    %dl,0xe(%eax)
  10397b:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103981:	0f b6 50 0e          	movzbl 0xe(%eax),%edx
  103985:	83 ca 40             	or     $0x40,%edx
  103988:	88 50 0e             	mov    %dl,0xe(%eax)
  10398b:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103991:	0f b6 50 0e          	movzbl 0xe(%eax),%edx
  103995:	83 ca 80             	or     $0xffffff80,%edx
  103998:	88 50 0e             	mov    %dl,0xe(%eax)
  10399b:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  1039a1:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
  1039a5:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  1039ab:	66 c7 40 10 ff ff    	movw   $0xffff,0x10(%eax)
  1039b1:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  1039b7:	66 c7 40 12 00 00    	movw   $0x0,0x12(%eax)
  1039bd:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  1039c3:	c6 40 14 00          	movb   $0x0,0x14(%eax)
  1039c7:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  1039cd:	0f b6 50 15          	movzbl 0x15(%eax),%edx
  1039d1:	83 e2 f0             	and    $0xfffffff0,%edx
  1039d4:	83 ca 02             	or     $0x2,%edx
  1039d7:	88 50 15             	mov    %dl,0x15(%eax)
  1039da:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  1039e0:	0f b6 50 15          	movzbl 0x15(%eax),%edx
  1039e4:	83 ca 10             	or     $0x10,%edx
  1039e7:	88 50 15             	mov    %dl,0x15(%eax)
  1039ea:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  1039f0:	0f b6 50 15          	movzbl 0x15(%eax),%edx
  1039f4:	83 e2 9f             	and    $0xffffff9f,%edx
  1039f7:	88 50 15             	mov    %dl,0x15(%eax)
  1039fa:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103a00:	0f b6 50 15          	movzbl 0x15(%eax),%edx
  103a04:	83 ca 80             	or     $0xffffff80,%edx
  103a07:	88 50 15             	mov    %dl,0x15(%eax)
  103a0a:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103a10:	0f b6 50 16          	movzbl 0x16(%eax),%edx
  103a14:	83 ca 0f             	or     $0xf,%edx
  103a17:	88 50 16             	mov    %dl,0x16(%eax)
  103a1a:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103a20:	0f b6 50 16          	movzbl 0x16(%eax),%edx
  103a24:	83 e2 ef             	and    $0xffffffef,%edx
  103a27:	88 50 16             	mov    %dl,0x16(%eax)
  103a2a:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103a30:	0f b6 50 16          	movzbl 0x16(%eax),%edx
  103a34:	83 e2 df             	and    $0xffffffdf,%edx
  103a37:	88 50 16             	mov    %dl,0x16(%eax)
  103a3a:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103a40:	0f b6 50 16          	movzbl 0x16(%eax),%edx
  103a44:	83 ca 40             	or     $0x40,%edx
  103a47:	88 50 16             	mov    %dl,0x16(%eax)
  103a4a:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103a50:	0f b6 50 16          	movzbl 0x16(%eax),%edx
  103a54:	83 ca 80             	or     $0xffffff80,%edx
  103a57:	88 50 16             	mov    %dl,0x16(%eax)
  103a5a:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103a60:	c6 40 17 00          	movb   $0x0,0x17(%eax)
  103a64:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103a6a:	66 c7 40 18 ff ff    	movw   $0xffff,0x18(%eax)
  103a70:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103a76:	66 c7 40 1a 00 00    	movw   $0x0,0x1a(%eax)
  103a7c:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103a82:	c6 40 1c 00          	movb   $0x0,0x1c(%eax)
  103a86:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103a8c:	0f b6 50 1d          	movzbl 0x1d(%eax),%edx
  103a90:	83 e2 f0             	and    $0xfffffff0,%edx
  103a93:	83 ca 0a             	or     $0xa,%edx
  103a96:	88 50 1d             	mov    %dl,0x1d(%eax)
  103a99:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103a9f:	0f b6 50 1d          	movzbl 0x1d(%eax),%edx
  103aa3:	83 ca 10             	or     $0x10,%edx
  103aa6:	88 50 1d             	mov    %dl,0x1d(%eax)
  103aa9:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103aaf:	0f b6 50 1d          	movzbl 0x1d(%eax),%edx
  103ab3:	83 ca 60             	or     $0x60,%edx
  103ab6:	88 50 1d             	mov    %dl,0x1d(%eax)
  103ab9:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103abf:	0f b6 50 1d          	movzbl 0x1d(%eax),%edx
  103ac3:	83 ca 80             	or     $0xffffff80,%edx
  103ac6:	88 50 1d             	mov    %dl,0x1d(%eax)
  103ac9:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103acf:	0f b6 50 1e          	movzbl 0x1e(%eax),%edx
  103ad3:	83 ca 0f             	or     $0xf,%edx
  103ad6:	88 50 1e             	mov    %dl,0x1e(%eax)
  103ad9:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103adf:	0f b6 50 1e          	movzbl 0x1e(%eax),%edx
  103ae3:	83 e2 ef             	and    $0xffffffef,%edx
  103ae6:	88 50 1e             	mov    %dl,0x1e(%eax)
  103ae9:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103aef:	0f b6 50 1e          	movzbl 0x1e(%eax),%edx
  103af3:	83 e2 df             	and    $0xffffffdf,%edx
  103af6:	88 50 1e             	mov    %dl,0x1e(%eax)
  103af9:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103aff:	0f b6 50 1e          	movzbl 0x1e(%eax),%edx
  103b03:	83 ca 40             	or     $0x40,%edx
  103b06:	88 50 1e             	mov    %dl,0x1e(%eax)
  103b09:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103b0f:	0f b6 50 1e          	movzbl 0x1e(%eax),%edx
  103b13:	83 ca 80             	or     $0xffffff80,%edx
  103b16:	88 50 1e             	mov    %dl,0x1e(%eax)
  103b19:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103b1f:	c6 40 1f 00          	movb   $0x0,0x1f(%eax)
  103b23:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103b29:	66 c7 40 20 ff ff    	movw   $0xffff,0x20(%eax)
  103b2f:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103b35:	66 c7 40 22 00 00    	movw   $0x0,0x22(%eax)
  103b3b:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103b41:	c6 40 24 00          	movb   $0x0,0x24(%eax)
  103b45:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103b4b:	0f b6 50 25          	movzbl 0x25(%eax),%edx
  103b4f:	83 e2 f0             	and    $0xfffffff0,%edx
  103b52:	83 ca 02             	or     $0x2,%edx
  103b55:	88 50 25             	mov    %dl,0x25(%eax)
  103b58:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103b5e:	0f b6 50 25          	movzbl 0x25(%eax),%edx
  103b62:	83 ca 10             	or     $0x10,%edx
  103b65:	88 50 25             	mov    %dl,0x25(%eax)
  103b68:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103b6e:	0f b6 50 25          	movzbl 0x25(%eax),%edx
  103b72:	83 ca 60             	or     $0x60,%edx
  103b75:	88 50 25             	mov    %dl,0x25(%eax)
  103b78:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103b7e:	0f b6 50 25          	movzbl 0x25(%eax),%edx
  103b82:	83 ca 80             	or     $0xffffff80,%edx
  103b85:	88 50 25             	mov    %dl,0x25(%eax)
  103b88:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103b8e:	0f b6 50 26          	movzbl 0x26(%eax),%edx
  103b92:	83 ca 0f             	or     $0xf,%edx
  103b95:	88 50 26             	mov    %dl,0x26(%eax)
  103b98:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103b9e:	0f b6 50 26          	movzbl 0x26(%eax),%edx
  103ba2:	83 e2 ef             	and    $0xffffffef,%edx
  103ba5:	88 50 26             	mov    %dl,0x26(%eax)
  103ba8:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103bae:	0f b6 50 26          	movzbl 0x26(%eax),%edx
  103bb2:	83 e2 df             	and    $0xffffffdf,%edx
  103bb5:	88 50 26             	mov    %dl,0x26(%eax)
  103bb8:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103bbe:	0f b6 50 26          	movzbl 0x26(%eax),%edx
  103bc2:	83 ca 40             	or     $0x40,%edx
  103bc5:	88 50 26             	mov    %dl,0x26(%eax)
  103bc8:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103bce:	0f b6 50 26          	movzbl 0x26(%eax),%edx
  103bd2:	83 ca 80             	or     $0xffffff80,%edx
  103bd5:	88 50 26             	mov    %dl,0x26(%eax)
  103bd8:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103bde:	c6 40 27 00          	movb   $0x0,0x27(%eax)
  103be2:	c7 c0 00 20 91 00    	mov    $0x912000,%eax
  103be8:	05 00 10 00 00       	add    $0x1000,%eax
  103bed:	89 83 64 7e 00 00    	mov    %eax,0x7e64(%ebx)
  103bf3:	66 c7 83 68 7e 00 00 	movw   $0x10,0x7e68(%ebx)
  103bfa:	10 00 
  103bfc:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103c02:	66 c7 40 28 eb 00    	movw   $0xeb,0x28(%eax)
  103c08:	8d 83 60 7e 00 00    	lea    0x7e60(%ebx),%eax
  103c0e:	89 c2                	mov    %eax,%edx
  103c10:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103c16:	66 89 50 2a          	mov    %dx,0x2a(%eax)
  103c1a:	8d 83 60 7e 00 00    	lea    0x7e60(%ebx),%eax
  103c20:	c1 e8 10             	shr    $0x10,%eax
  103c23:	89 c2                	mov    %eax,%edx
  103c25:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103c2b:	88 50 2c             	mov    %dl,0x2c(%eax)
  103c2e:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103c34:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  103c38:	83 e2 f0             	and    $0xfffffff0,%edx
  103c3b:	83 ca 09             	or     $0x9,%edx
  103c3e:	88 50 2d             	mov    %dl,0x2d(%eax)
  103c41:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103c47:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  103c4b:	83 ca 10             	or     $0x10,%edx
  103c4e:	88 50 2d             	mov    %dl,0x2d(%eax)
  103c51:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103c57:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  103c5b:	83 e2 9f             	and    $0xffffff9f,%edx
  103c5e:	88 50 2d             	mov    %dl,0x2d(%eax)
  103c61:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103c67:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  103c6b:	83 ca 80             	or     $0xffffff80,%edx
  103c6e:	88 50 2d             	mov    %dl,0x2d(%eax)
  103c71:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103c77:	0f b6 50 2e          	movzbl 0x2e(%eax),%edx
  103c7b:	83 e2 f0             	and    $0xfffffff0,%edx
  103c7e:	88 50 2e             	mov    %dl,0x2e(%eax)
  103c81:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103c87:	0f b6 50 2e          	movzbl 0x2e(%eax),%edx
  103c8b:	83 e2 ef             	and    $0xffffffef,%edx
  103c8e:	88 50 2e             	mov    %dl,0x2e(%eax)
  103c91:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103c97:	0f b6 50 2e          	movzbl 0x2e(%eax),%edx
  103c9b:	83 e2 df             	and    $0xffffffdf,%edx
  103c9e:	88 50 2e             	mov    %dl,0x2e(%eax)
  103ca1:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103ca7:	0f b6 50 2e          	movzbl 0x2e(%eax),%edx
  103cab:	83 ca 40             	or     $0x40,%edx
  103cae:	88 50 2e             	mov    %dl,0x2e(%eax)
  103cb1:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103cb7:	0f b6 50 2e          	movzbl 0x2e(%eax),%edx
  103cbb:	83 e2 7f             	and    $0x7f,%edx
  103cbe:	88 50 2e             	mov    %dl,0x2e(%eax)
  103cc1:	8d 83 60 7e 00 00    	lea    0x7e60(%ebx),%eax
  103cc7:	c1 e8 18             	shr    $0x18,%eax
  103cca:	89 c2                	mov    %eax,%edx
  103ccc:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103cd2:	88 50 2f             	mov    %dl,0x2f(%eax)
  103cd5:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103cdb:	0f b6 50 2d          	movzbl 0x2d(%eax),%edx
  103cdf:	83 e2 ef             	and    $0xffffffef,%edx
  103ce2:	88 50 2d             	mov    %dl,0x2d(%eax)
  103ce5:	66 c7 45 ee 2f 00    	movw   $0x2f,-0x12(%ebp)
  103ceb:	c7 c0 00 30 95 00    	mov    $0x953000,%eax
  103cf1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103cf4:	0f 01 55 ee          	lgdtl  -0x12(%ebp)
  103cf8:	b8 10 00 00 00       	mov    $0x10,%eax
  103cfd:	8e e8                	mov    %eax,%gs
  103cff:	b8 10 00 00 00       	mov    $0x10,%eax
  103d04:	8e e0                	mov    %eax,%fs
  103d06:	b8 10 00 00 00       	mov    $0x10,%eax
  103d0b:	8e c0                	mov    %eax,%es
  103d0d:	b8 10 00 00 00       	mov    $0x10,%eax
  103d12:	8e d8                	mov    %eax,%ds
  103d14:	b8 10 00 00 00       	mov    $0x10,%eax
  103d19:	8e d0                	mov    %eax,%ss
  103d1b:	ea 22 3d 10 00 08 00 	ljmp   $0x8,$0x103d22
  103d22:	83 ec 0c             	sub    $0xc,%esp
  103d25:	6a 00                	push   $0x0
  103d27:	e8 7d 01 00 00       	call   103ea9 <lldt>
  103d2c:	83 c4 10             	add    $0x10,%esp
  103d2f:	83 ec 0c             	sub    $0xc,%esp
  103d32:	6a 28                	push   $0x28
  103d34:	e8 3c 03 00 00       	call   104075 <ltr>
  103d39:	83 c4 10             	add    $0x10,%esp
  103d3c:	c7 c0 10 a5 10 00    	mov    $0x10a510,%eax
  103d42:	0f 01 18             	lidtl  (%eax)
  103d45:	83 ec 08             	sub    $0x8,%esp
  103d48:	68 00 3b 00 00       	push   $0x3b00
  103d4d:	c7 c0 40 30 95 00    	mov    $0x953040,%eax
  103d53:	50                   	push   %eax
  103d54:	e8 fe f2 ff ff       	call   103057 <memzero>
  103d59:	83 c4 10             	add    $0x10,%esp
  103d5c:	83 ec 08             	sub    $0x8,%esp
  103d5f:	68 00 00 04 00       	push   $0x40000
  103d64:	c7 c0 00 30 91 00    	mov    $0x913000,%eax
  103d6a:	50                   	push   %eax
  103d6b:	e8 e7 f2 ff ff       	call   103057 <memzero>
  103d70:	83 c4 10             	add    $0x10,%esp
  103d73:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  103d7a:	e9 a3 00 00 00       	jmp    103e22 <seg_init+0x5b7>
  103d7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103d82:	c1 e0 0c             	shl    $0xc,%eax
  103d85:	89 c2                	mov    %eax,%edx
  103d87:	c7 c0 00 30 91 00    	mov    $0x913000,%eax
  103d8d:	01 d0                	add    %edx,%eax
  103d8f:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
  103d95:	c7 c1 40 30 95 00    	mov    $0x953040,%ecx
  103d9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103d9e:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103da4:	01 c8                	add    %ecx,%eax
  103da6:	83 c0 04             	add    $0x4,%eax
  103da9:	89 10                	mov    %edx,(%eax)
  103dab:	c7 c2 40 30 95 00    	mov    $0x953040,%edx
  103db1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103db4:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103dba:	01 d0                	add    %edx,%eax
  103dbc:	83 c0 08             	add    $0x8,%eax
  103dbf:	66 c7 00 10 00       	movw   $0x10,(%eax)
  103dc4:	c7 c2 40 30 95 00    	mov    $0x953040,%edx
  103dca:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103dcd:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103dd3:	01 d0                	add    %edx,%eax
  103dd5:	83 c0 66             	add    $0x66,%eax
  103dd8:	66 c7 00 68 00       	movw   $0x68,(%eax)
  103ddd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103de0:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103de6:	8d 50 60             	lea    0x60(%eax),%edx
  103de9:	c7 c0 40 30 95 00    	mov    $0x953040,%eax
  103def:	01 d0                	add    %edx,%eax
  103df1:	83 c0 08             	add    $0x8,%eax
  103df4:	83 ec 08             	sub    $0x8,%esp
  103df7:	68 80 00 00 00       	push   $0x80
  103dfc:	50                   	push   %eax
  103dfd:	e8 55 f2 ff ff       	call   103057 <memzero>
  103e02:	83 c4 10             	add    $0x10,%esp
  103e05:	c7 c2 40 30 95 00    	mov    $0x953040,%edx
  103e0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103e0e:	69 c0 ec 00 00 00    	imul   $0xec,%eax,%eax
  103e14:	01 d0                	add    %edx,%eax
  103e16:	05 e8 00 00 00       	add    $0xe8,%eax
  103e1b:	c6 00 ff             	movb   $0xff,(%eax)
  103e1e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  103e22:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
  103e26:	0f 86 53 ff ff ff    	jbe    103d7f <seg_init+0x514>
  103e2c:	90                   	nop
  103e2d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  103e30:	c9                   	leave  
  103e31:	c3                   	ret    

00103e32 <max>:
  103e32:	55                   	push   %ebp
  103e33:	89 e5                	mov    %esp,%ebp
  103e35:	e8 d1 c5 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103e3a:	05 c6 51 00 00       	add    $0x51c6,%eax
  103e3f:	8b 45 08             	mov    0x8(%ebp),%eax
  103e42:	39 45 0c             	cmp    %eax,0xc(%ebp)
  103e45:	0f 43 45 0c          	cmovae 0xc(%ebp),%eax
  103e49:	5d                   	pop    %ebp
  103e4a:	c3                   	ret    

00103e4b <min>:
  103e4b:	55                   	push   %ebp
  103e4c:	89 e5                	mov    %esp,%ebp
  103e4e:	e8 b8 c5 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103e53:	05 ad 51 00 00       	add    $0x51ad,%eax
  103e58:	8b 45 08             	mov    0x8(%ebp),%eax
  103e5b:	39 45 0c             	cmp    %eax,0xc(%ebp)
  103e5e:	0f 46 45 0c          	cmovbe 0xc(%ebp),%eax
  103e62:	5d                   	pop    %ebp
  103e63:	c3                   	ret    

00103e64 <rounddown>:
  103e64:	55                   	push   %ebp
  103e65:	89 e5                	mov    %esp,%ebp
  103e67:	e8 9f c5 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103e6c:	05 94 51 00 00       	add    $0x5194,%eax
  103e71:	8b 45 08             	mov    0x8(%ebp),%eax
  103e74:	ba 00 00 00 00       	mov    $0x0,%edx
  103e79:	f7 75 0c             	divl   0xc(%ebp)
  103e7c:	8b 45 08             	mov    0x8(%ebp),%eax
  103e7f:	29 d0                	sub    %edx,%eax
  103e81:	5d                   	pop    %ebp
  103e82:	c3                   	ret    

00103e83 <roundup>:
  103e83:	55                   	push   %ebp
  103e84:	89 e5                	mov    %esp,%ebp
  103e86:	e8 80 c5 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103e8b:	05 75 51 00 00       	add    $0x5175,%eax
  103e90:	8b 55 08             	mov    0x8(%ebp),%edx
  103e93:	8b 45 0c             	mov    0xc(%ebp),%eax
  103e96:	01 d0                	add    %edx,%eax
  103e98:	83 e8 01             	sub    $0x1,%eax
  103e9b:	ff 75 0c             	pushl  0xc(%ebp)
  103e9e:	50                   	push   %eax
  103e9f:	e8 c0 ff ff ff       	call   103e64 <rounddown>
  103ea4:	83 c4 08             	add    $0x8,%esp
  103ea7:	c9                   	leave  
  103ea8:	c3                   	ret    

00103ea9 <lldt>:
  103ea9:	55                   	push   %ebp
  103eaa:	89 e5                	mov    %esp,%ebp
  103eac:	83 ec 04             	sub    $0x4,%esp
  103eaf:	e8 57 c5 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103eb4:	05 4c 51 00 00       	add    $0x514c,%eax
  103eb9:	8b 45 08             	mov    0x8(%ebp),%eax
  103ebc:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  103ec0:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  103ec4:	0f 00 d0             	lldt   %ax
  103ec7:	90                   	nop
  103ec8:	c9                   	leave  
  103ec9:	c3                   	ret    

00103eca <cli>:
  103eca:	55                   	push   %ebp
  103ecb:	89 e5                	mov    %esp,%ebp
  103ecd:	e8 39 c5 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103ed2:	05 2e 51 00 00       	add    $0x512e,%eax
  103ed7:	fa                   	cli    
  103ed8:	90                   	nop
  103ed9:	5d                   	pop    %ebp
  103eda:	c3                   	ret    

00103edb <sti>:
  103edb:	55                   	push   %ebp
  103edc:	89 e5                	mov    %esp,%ebp
  103ede:	e8 28 c5 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103ee3:	05 1d 51 00 00       	add    $0x511d,%eax
  103ee8:	fb                   	sti    
  103ee9:	90                   	nop
  103eea:	90                   	nop
  103eeb:	5d                   	pop    %ebp
  103eec:	c3                   	ret    

00103eed <rdmsr>:
  103eed:	55                   	push   %ebp
  103eee:	89 e5                	mov    %esp,%ebp
  103ef0:	83 ec 10             	sub    $0x10,%esp
  103ef3:	e8 13 c5 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103ef8:	05 08 51 00 00       	add    $0x5108,%eax
  103efd:	8b 45 08             	mov    0x8(%ebp),%eax
  103f00:	89 c1                	mov    %eax,%ecx
  103f02:	0f 32                	rdmsr  
  103f04:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103f07:	89 55 fc             	mov    %edx,-0x4(%ebp)
  103f0a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103f0d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  103f10:	c9                   	leave  
  103f11:	c3                   	ret    

00103f12 <wrmsr>:
  103f12:	55                   	push   %ebp
  103f13:	89 e5                	mov    %esp,%ebp
  103f15:	83 ec 08             	sub    $0x8,%esp
  103f18:	e8 ee c4 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103f1d:	05 e3 50 00 00       	add    $0x50e3,%eax
  103f22:	8b 45 0c             	mov    0xc(%ebp),%eax
  103f25:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103f28:	8b 45 10             	mov    0x10(%ebp),%eax
  103f2b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103f2e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103f31:	8b 55 fc             	mov    -0x4(%ebp),%edx
  103f34:	8b 4d 08             	mov    0x8(%ebp),%ecx
  103f37:	0f 30                	wrmsr  
  103f39:	90                   	nop
  103f3a:	c9                   	leave  
  103f3b:	c3                   	ret    

00103f3c <halt>:
  103f3c:	55                   	push   %ebp
  103f3d:	89 e5                	mov    %esp,%ebp
  103f3f:	e8 c7 c4 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103f44:	05 bc 50 00 00       	add    $0x50bc,%eax
  103f49:	f4                   	hlt    
  103f4a:	90                   	nop
  103f4b:	5d                   	pop    %ebp
  103f4c:	c3                   	ret    

00103f4d <rdtsc>:
  103f4d:	55                   	push   %ebp
  103f4e:	89 e5                	mov    %esp,%ebp
  103f50:	83 ec 10             	sub    $0x10,%esp
  103f53:	e8 b3 c4 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103f58:	05 a8 50 00 00       	add    $0x50a8,%eax
  103f5d:	0f 31                	rdtsc  
  103f5f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103f62:	89 55 fc             	mov    %edx,-0x4(%ebp)
  103f65:	8b 45 f8             	mov    -0x8(%ebp),%eax
  103f68:	8b 55 fc             	mov    -0x4(%ebp),%edx
  103f6b:	c9                   	leave  
  103f6c:	c3                   	ret    

00103f6d <enable_sse>:
  103f6d:	55                   	push   %ebp
  103f6e:	89 e5                	mov    %esp,%ebp
  103f70:	83 ec 20             	sub    $0x20,%esp
  103f73:	e8 93 c4 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103f78:	05 88 50 00 00       	add    $0x5088,%eax
  103f7d:	0f 20 e0             	mov    %cr4,%eax
  103f80:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103f83:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103f86:	80 cc 06             	or     $0x6,%ah
  103f89:	89 45 fc             	mov    %eax,-0x4(%ebp)
  103f8c:	0f ae f0             	mfence 
  103f8f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  103f92:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103f95:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103f98:	0f 22 e0             	mov    %eax,%cr4
  103f9b:	0f 20 c0             	mov    %cr0,%eax
  103f9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103fa1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  103fa4:	83 c8 02             	or     $0x2,%eax
  103fa7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103faa:	0f ae f0             	mfence 
  103fad:	83 65 f8 f3          	andl   $0xfffffff3,-0x8(%ebp)
  103fb1:	90                   	nop
  103fb2:	c9                   	leave  
  103fb3:	c3                   	ret    

00103fb4 <cpuid>:
  103fb4:	55                   	push   %ebp
  103fb5:	89 e5                	mov    %esp,%ebp
  103fb7:	53                   	push   %ebx
  103fb8:	83 ec 10             	sub    $0x10,%esp
  103fbb:	e8 4b c4 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  103fc0:	05 40 50 00 00       	add    $0x5040,%eax
  103fc5:	8b 45 08             	mov    0x8(%ebp),%eax
  103fc8:	0f a2                	cpuid  
  103fca:	89 45 f8             	mov    %eax,-0x8(%ebp)
  103fcd:	89 5d f4             	mov    %ebx,-0xc(%ebp)
  103fd0:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  103fd3:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103fd6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103fda:	74 08                	je     103fe4 <cpuid+0x30>
  103fdc:	8b 45 0c             	mov    0xc(%ebp),%eax
  103fdf:	8b 55 f8             	mov    -0x8(%ebp),%edx
  103fe2:	89 10                	mov    %edx,(%eax)
  103fe4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  103fe8:	74 08                	je     103ff2 <cpuid+0x3e>
  103fea:	8b 45 10             	mov    0x10(%ebp),%eax
  103fed:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103ff0:	89 10                	mov    %edx,(%eax)
  103ff2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  103ff6:	74 08                	je     104000 <cpuid+0x4c>
  103ff8:	8b 45 14             	mov    0x14(%ebp),%eax
  103ffb:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103ffe:	89 10                	mov    %edx,(%eax)
  104000:	83 7d 18 00          	cmpl   $0x0,0x18(%ebp)
  104004:	74 08                	je     10400e <cpuid+0x5a>
  104006:	8b 45 18             	mov    0x18(%ebp),%eax
  104009:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10400c:	89 10                	mov    %edx,(%eax)
  10400e:	90                   	nop
  10400f:	83 c4 10             	add    $0x10,%esp
  104012:	5b                   	pop    %ebx
  104013:	5d                   	pop    %ebp
  104014:	c3                   	ret    

00104015 <rcr3>:
  104015:	55                   	push   %ebp
  104016:	89 e5                	mov    %esp,%ebp
  104018:	83 ec 10             	sub    $0x10,%esp
  10401b:	e8 eb c3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  104020:	05 e0 4f 00 00       	add    $0x4fe0,%eax
  104025:	0f 20 d8             	mov    %cr3,%eax
  104028:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10402b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10402e:	c9                   	leave  
  10402f:	c3                   	ret    

00104030 <outl>:
  104030:	55                   	push   %ebp
  104031:	89 e5                	mov    %esp,%ebp
  104033:	e8 d3 c3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  104038:	05 c8 4f 00 00       	add    $0x4fc8,%eax
  10403d:	8b 45 0c             	mov    0xc(%ebp),%eax
  104040:	8b 55 08             	mov    0x8(%ebp),%edx
  104043:	ef                   	out    %eax,(%dx)
  104044:	90                   	nop
  104045:	5d                   	pop    %ebp
  104046:	c3                   	ret    

00104047 <inl>:
  104047:	55                   	push   %ebp
  104048:	89 e5                	mov    %esp,%ebp
  10404a:	83 ec 10             	sub    $0x10,%esp
  10404d:	e8 b9 c3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  104052:	05 ae 4f 00 00       	add    $0x4fae,%eax
  104057:	8b 45 08             	mov    0x8(%ebp),%eax
  10405a:	89 c2                	mov    %eax,%edx
  10405c:	ed                   	in     (%dx),%eax
  10405d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104060:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104063:	c9                   	leave  
  104064:	c3                   	ret    

00104065 <smp_wmb>:
  104065:	55                   	push   %ebp
  104066:	89 e5                	mov    %esp,%ebp
  104068:	e8 9e c3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  10406d:	05 93 4f 00 00       	add    $0x4f93,%eax
  104072:	90                   	nop
  104073:	5d                   	pop    %ebp
  104074:	c3                   	ret    

00104075 <ltr>:
  104075:	55                   	push   %ebp
  104076:	89 e5                	mov    %esp,%ebp
  104078:	83 ec 04             	sub    $0x4,%esp
  10407b:	e8 8b c3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  104080:	05 80 4f 00 00       	add    $0x4f80,%eax
  104085:	8b 45 08             	mov    0x8(%ebp),%eax
  104088:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
  10408c:	0f b7 45 fc          	movzwl -0x4(%ebp),%eax
  104090:	0f 00 d8             	ltr    %ax
  104093:	90                   	nop
  104094:	c9                   	leave  
  104095:	c3                   	ret    

00104096 <lcr0>:
  104096:	55                   	push   %ebp
  104097:	89 e5                	mov    %esp,%ebp
  104099:	e8 6d c3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  10409e:	05 62 4f 00 00       	add    $0x4f62,%eax
  1040a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1040a6:	0f 22 c0             	mov    %eax,%cr0
  1040a9:	90                   	nop
  1040aa:	5d                   	pop    %ebp
  1040ab:	c3                   	ret    

001040ac <rcr0>:
  1040ac:	55                   	push   %ebp
  1040ad:	89 e5                	mov    %esp,%ebp
  1040af:	83 ec 10             	sub    $0x10,%esp
  1040b2:	e8 54 c3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1040b7:	05 49 4f 00 00       	add    $0x4f49,%eax
  1040bc:	0f 20 c0             	mov    %cr0,%eax
  1040bf:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1040c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1040c5:	c9                   	leave  
  1040c6:	c3                   	ret    

001040c7 <rcr2>:
  1040c7:	55                   	push   %ebp
  1040c8:	89 e5                	mov    %esp,%ebp
  1040ca:	83 ec 10             	sub    $0x10,%esp
  1040cd:	e8 39 c3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1040d2:	05 2e 4f 00 00       	add    $0x4f2e,%eax
  1040d7:	0f 20 d0             	mov    %cr2,%eax
  1040da:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1040dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1040e0:	c9                   	leave  
  1040e1:	c3                   	ret    

001040e2 <lcr3>:
  1040e2:	55                   	push   %ebp
  1040e3:	89 e5                	mov    %esp,%ebp
  1040e5:	e8 21 c3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1040ea:	05 16 4f 00 00       	add    $0x4f16,%eax
  1040ef:	8b 45 08             	mov    0x8(%ebp),%eax
  1040f2:	0f 22 d8             	mov    %eax,%cr3
  1040f5:	90                   	nop
  1040f6:	5d                   	pop    %ebp
  1040f7:	c3                   	ret    

001040f8 <lcr4>:
  1040f8:	55                   	push   %ebp
  1040f9:	89 e5                	mov    %esp,%ebp
  1040fb:	e8 0b c3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  104100:	05 00 4f 00 00       	add    $0x4f00,%eax
  104105:	8b 45 08             	mov    0x8(%ebp),%eax
  104108:	0f 22 e0             	mov    %eax,%cr4
  10410b:	90                   	nop
  10410c:	5d                   	pop    %ebp
  10410d:	c3                   	ret    

0010410e <rcr4>:
  10410e:	55                   	push   %ebp
  10410f:	89 e5                	mov    %esp,%ebp
  104111:	83 ec 10             	sub    $0x10,%esp
  104114:	e8 f2 c2 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  104119:	05 e7 4e 00 00       	add    $0x4ee7,%eax
  10411e:	0f 20 e0             	mov    %cr4,%eax
  104121:	89 45 fc             	mov    %eax,-0x4(%ebp)
  104124:	8b 45 fc             	mov    -0x4(%ebp),%eax
  104127:	c9                   	leave  
  104128:	c3                   	ret    

00104129 <inb>:
  104129:	55                   	push   %ebp
  10412a:	89 e5                	mov    %esp,%ebp
  10412c:	83 ec 10             	sub    $0x10,%esp
  10412f:	e8 d7 c2 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  104134:	05 cc 4e 00 00       	add    $0x4ecc,%eax
  104139:	8b 45 08             	mov    0x8(%ebp),%eax
  10413c:	89 c2                	mov    %eax,%edx
  10413e:	ec                   	in     (%dx),%al
  10413f:	88 45 ff             	mov    %al,-0x1(%ebp)
  104142:	0f b6 45 ff          	movzbl -0x1(%ebp),%eax
  104146:	c9                   	leave  
  104147:	c3                   	ret    

00104148 <insl>:
  104148:	55                   	push   %ebp
  104149:	89 e5                	mov    %esp,%ebp
  10414b:	57                   	push   %edi
  10414c:	53                   	push   %ebx
  10414d:	e8 b9 c2 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  104152:	05 ae 4e 00 00       	add    $0x4eae,%eax
  104157:	8b 55 08             	mov    0x8(%ebp),%edx
  10415a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  10415d:	8b 45 10             	mov    0x10(%ebp),%eax
  104160:	89 cb                	mov    %ecx,%ebx
  104162:	89 df                	mov    %ebx,%edi
  104164:	89 c1                	mov    %eax,%ecx
  104166:	fc                   	cld    
  104167:	f2 6d                	repnz insl (%dx),%es:(%edi)
  104169:	89 c8                	mov    %ecx,%eax
  10416b:	89 fb                	mov    %edi,%ebx
  10416d:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  104170:	89 45 10             	mov    %eax,0x10(%ebp)
  104173:	90                   	nop
  104174:	5b                   	pop    %ebx
  104175:	5f                   	pop    %edi
  104176:	5d                   	pop    %ebp
  104177:	c3                   	ret    

00104178 <outb>:
  104178:	55                   	push   %ebp
  104179:	89 e5                	mov    %esp,%ebp
  10417b:	83 ec 04             	sub    $0x4,%esp
  10417e:	e8 88 c2 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  104183:	05 7d 4e 00 00       	add    $0x4e7d,%eax
  104188:	8b 45 0c             	mov    0xc(%ebp),%eax
  10418b:	88 45 fc             	mov    %al,-0x4(%ebp)
  10418e:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
  104192:	8b 55 08             	mov    0x8(%ebp),%edx
  104195:	ee                   	out    %al,(%dx)
  104196:	90                   	nop
  104197:	c9                   	leave  
  104198:	c3                   	ret    

00104199 <outsw>:
  104199:	55                   	push   %ebp
  10419a:	89 e5                	mov    %esp,%ebp
  10419c:	56                   	push   %esi
  10419d:	53                   	push   %ebx
  10419e:	e8 68 c2 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1041a3:	05 5d 4e 00 00       	add    $0x4e5d,%eax
  1041a8:	8b 55 08             	mov    0x8(%ebp),%edx
  1041ab:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  1041ae:	8b 45 10             	mov    0x10(%ebp),%eax
  1041b1:	89 cb                	mov    %ecx,%ebx
  1041b3:	89 de                	mov    %ebx,%esi
  1041b5:	89 c1                	mov    %eax,%ecx
  1041b7:	fc                   	cld    
  1041b8:	f2 66 6f             	repnz outsw %ds:(%esi),(%dx)
  1041bb:	89 c8                	mov    %ecx,%eax
  1041bd:	89 f3                	mov    %esi,%ebx
  1041bf:	89 5d 0c             	mov    %ebx,0xc(%ebp)
  1041c2:	89 45 10             	mov    %eax,0x10(%ebp)
  1041c5:	90                   	nop
  1041c6:	5b                   	pop    %ebx
  1041c7:	5e                   	pop    %esi
  1041c8:	5d                   	pop    %ebp
  1041c9:	c3                   	ret    

001041ca <mon_start_user>:
  1041ca:	55                   	push   %ebp
  1041cb:	89 e5                	mov    %esp,%ebp
  1041cd:	53                   	push   %ebx
  1041ce:	83 ec 14             	sub    $0x14,%esp
  1041d1:	e8 3d c2 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1041d6:	81 c3 2a 4e 00 00    	add    $0x4e2a,%ebx
  1041dc:	8b 83 4c 7f 00 00    	mov    0x7f4c(%ebx),%eax
  1041e2:	85 c0                	test   %eax,%eax
  1041e4:	74 19                	je     1041ff <mon_start_user+0x35>
  1041e6:	83 ec 0c             	sub    $0xc,%esp
  1041e9:	8d 83 08 d2 ff ff    	lea    -0x2df8(%ebx),%eax
  1041ef:	50                   	push   %eax
  1041f0:	e8 83 f1 ff ff       	call   103378 <dprintf>
  1041f5:	83 c4 10             	add    $0x10,%esp
  1041f8:	b8 00 00 00 00       	mov    $0x0,%eax
  1041fd:	eb 78                	jmp    104277 <mon_start_user+0xad>
  1041ff:	c7 c0 04 c0 10 00    	mov    $0x10c004,%eax
  104205:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104208:	83 ec 08             	sub    $0x8,%esp
  10420b:	68 00 00 10 00       	push   $0x100000
  104210:	6a 00                	push   $0x0
  104212:	e8 49 1a 00 00       	call   105c60 <alloc_mem_quota>
  104217:	83 c4 10             	add    $0x10,%esp
  10421a:	89 83 4c 7f 00 00    	mov    %eax,0x7f4c(%ebx)
  104220:	8b 83 4c 7f 00 00    	mov    0x7f4c(%ebx),%eax
  104226:	83 ec 08             	sub    $0x8,%esp
  104229:	50                   	push   %eax
  10422a:	ff 75 f4             	pushl  -0xc(%ebp)
  10422d:	e8 c0 06 00 00       	call   1048f2 <elf_load>
  104232:	83 c4 10             	add    $0x10,%esp
  104235:	83 ec 08             	sub    $0x8,%esp
  104238:	ff 75 f4             	pushl  -0xc(%ebp)
  10423b:	8d 83 64 d2 ff ff    	lea    -0x2d9c(%ebx),%eax
  104241:	50                   	push   %eax
  104242:	e8 31 f1 ff ff       	call   103378 <dprintf>
  104247:	83 c4 10             	add    $0x10,%esp
  10424a:	8b 83 4c 7f 00 00    	mov    0x7f4c(%ebx),%eax
  104250:	83 ec 0c             	sub    $0xc,%esp
  104253:	50                   	push   %eax
  104254:	e8 77 13 00 00       	call   1055d0 <set_pdir_base>
  104259:	83 c4 10             	add    $0x10,%esp
  10425c:	83 ec 0c             	sub    $0xc,%esp
  10425f:	ff 75 f4             	pushl  -0xc(%ebp)
  104262:	e8 4c 09 00 00       	call   104bb3 <elf_entry>
  104267:	83 c4 10             	add    $0x10,%esp
  10426a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10426d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104270:	ff d0                	call   *%eax
  104272:	b8 00 00 00 00       	mov    $0x0,%eax
  104277:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10427a:	c9                   	leave  
  10427b:	c3                   	ret    

0010427c <mon_help>:
  10427c:	55                   	push   %ebp
  10427d:	89 e5                	mov    %esp,%ebp
  10427f:	56                   	push   %esi
  104280:	53                   	push   %ebx
  104281:	83 ec 10             	sub    $0x10,%esp
  104284:	e8 8a c1 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  104289:	81 c3 77 4d 00 00    	add    $0x4d77,%ebx
  10428f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  104296:	eb 44                	jmp    1042dc <mon_help+0x60>
  104298:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10429b:	8d 8b 24 15 00 00    	lea    0x1524(%ebx),%ecx
  1042a1:	89 d0                	mov    %edx,%eax
  1042a3:	01 c0                	add    %eax,%eax
  1042a5:	01 d0                	add    %edx,%eax
  1042a7:	c1 e0 02             	shl    $0x2,%eax
  1042aa:	01 c8                	add    %ecx,%eax
  1042ac:	8b 08                	mov    (%eax),%ecx
  1042ae:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1042b1:	8d b3 20 15 00 00    	lea    0x1520(%ebx),%esi
  1042b7:	89 d0                	mov    %edx,%eax
  1042b9:	01 c0                	add    %eax,%eax
  1042bb:	01 d0                	add    %edx,%eax
  1042bd:	c1 e0 02             	shl    $0x2,%eax
  1042c0:	01 f0                	add    %esi,%eax
  1042c2:	8b 00                	mov    (%eax),%eax
  1042c4:	83 ec 04             	sub    $0x4,%esp
  1042c7:	51                   	push   %ecx
  1042c8:	50                   	push   %eax
  1042c9:	8d 83 7f d2 ff ff    	lea    -0x2d81(%ebx),%eax
  1042cf:	50                   	push   %eax
  1042d0:	e8 a3 f0 ff ff       	call   103378 <dprintf>
  1042d5:	83 c4 10             	add    $0x10,%esp
  1042d8:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1042dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1042df:	83 f8 02             	cmp    $0x2,%eax
  1042e2:	76 b4                	jbe    104298 <mon_help+0x1c>
  1042e4:	b8 00 00 00 00       	mov    $0x0,%eax
  1042e9:	8d 65 f8             	lea    -0x8(%ebp),%esp
  1042ec:	5b                   	pop    %ebx
  1042ed:	5e                   	pop    %esi
  1042ee:	5d                   	pop    %ebp
  1042ef:	c3                   	ret    

001042f0 <mon_kerninfo>:
  1042f0:	55                   	push   %ebp
  1042f1:	89 e5                	mov    %esp,%ebp
  1042f3:	53                   	push   %ebx
  1042f4:	83 ec 14             	sub    $0x14,%esp
  1042f7:	e8 17 c1 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1042fc:	81 c3 04 4d 00 00    	add    $0x4d04,%ebx
  104302:	83 ec 0c             	sub    $0xc,%esp
  104305:	8d 83 88 d2 ff ff    	lea    -0x2d78(%ebx),%eax
  10430b:	50                   	push   %eax
  10430c:	e8 67 f0 ff ff       	call   103378 <dprintf>
  104311:	83 c4 10             	add    $0x10,%esp
  104314:	83 ec 08             	sub    $0x8,%esp
  104317:	c7 c0 64 50 10 00    	mov    $0x105064,%eax
  10431d:	50                   	push   %eax
  10431e:	8d 83 a1 d2 ff ff    	lea    -0x2d5f(%ebx),%eax
  104324:	50                   	push   %eax
  104325:	e8 4e f0 ff ff       	call   103378 <dprintf>
  10432a:	83 c4 10             	add    $0x10,%esp
  10432d:	83 ec 08             	sub    $0x8,%esp
  104330:	c7 c0 c9 5e 10 00    	mov    $0x105ec9,%eax
  104336:	50                   	push   %eax
  104337:	8d 83 b0 d2 ff ff    	lea    -0x2d50(%ebx),%eax
  10433d:	50                   	push   %eax
  10433e:	e8 35 f0 ff ff       	call   103378 <dprintf>
  104343:	83 c4 10             	add    $0x10,%esp
  104346:	83 ec 08             	sub    $0x8,%esp
  104349:	c7 c0 68 f9 10 00    	mov    $0x10f968,%eax
  10434f:	50                   	push   %eax
  104350:	8d 83 bf d2 ff ff    	lea    -0x2d41(%ebx),%eax
  104356:	50                   	push   %eax
  104357:	e8 1c f0 ff ff       	call   103378 <dprintf>
  10435c:	83 c4 10             	add    $0x10,%esp
  10435f:	83 ec 08             	sub    $0x8,%esp
  104362:	c7 c0 00 70 d9 00    	mov    $0xd97000,%eax
  104368:	50                   	push   %eax
  104369:	8d 83 ce d2 ff ff    	lea    -0x2d32(%ebx),%eax
  10436f:	50                   	push   %eax
  104370:	e8 03 f0 ff ff       	call   103378 <dprintf>
  104375:	83 c4 10             	add    $0x10,%esp
  104378:	c7 c0 00 70 d9 00    	mov    $0xd97000,%eax
  10437e:	89 c2                	mov    %eax,%edx
  104380:	c7 c0 64 50 10 00    	mov    $0x105064,%eax
  104386:	29 c2                	sub    %eax,%edx
  104388:	89 d0                	mov    %edx,%eax
  10438a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10438d:	c7 45 f0 00 04 00 00 	movl   $0x400,-0x10(%ebp)
  104394:	8b 55 f4             	mov    -0xc(%ebp),%edx
  104397:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10439a:	01 d0                	add    %edx,%eax
  10439c:	83 e8 01             	sub    $0x1,%eax
  10439f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1043a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1043a5:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1043a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1043ab:	99                   	cltd   
  1043ac:	f7 7d e8             	idivl  -0x18(%ebp)
  1043af:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1043b2:	29 d0                	sub    %edx,%eax
  1043b4:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1043ba:	85 c0                	test   %eax,%eax
  1043bc:	0f 48 c2             	cmovs  %edx,%eax
  1043bf:	c1 f8 0a             	sar    $0xa,%eax
  1043c2:	83 ec 08             	sub    $0x8,%esp
  1043c5:	50                   	push   %eax
  1043c6:	8d 83 e0 d2 ff ff    	lea    -0x2d20(%ebx),%eax
  1043cc:	50                   	push   %eax
  1043cd:	e8 a6 ef ff ff       	call   103378 <dprintf>
  1043d2:	83 c4 10             	add    $0x10,%esp
  1043d5:	b8 00 00 00 00       	mov    $0x0,%eax
  1043da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1043dd:	c9                   	leave  
  1043de:	c3                   	ret    

001043df <mon_backtrace>:
  1043df:	55                   	push   %ebp
  1043e0:	89 e5                	mov    %esp,%ebp
  1043e2:	e8 24 c0 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1043e7:	05 19 4c 00 00       	add    $0x4c19,%eax
  1043ec:	b8 00 00 00 00       	mov    $0x0,%eax
  1043f1:	5d                   	pop    %ebp
  1043f2:	c3                   	ret    

001043f3 <runcmd>:
  1043f3:	55                   	push   %ebp
  1043f4:	89 e5                	mov    %esp,%ebp
  1043f6:	53                   	push   %ebx
  1043f7:	83 ec 54             	sub    $0x54,%esp
  1043fa:	e8 14 c0 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1043ff:	81 c3 01 4c 00 00    	add    $0x4c01,%ebx
  104405:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10440c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10440f:	c7 44 85 b0 00 00 00 	movl   $0x0,-0x50(%ebp,%eax,4)
  104416:	00 
  104417:	eb 0c                	jmp    104425 <runcmd+0x32>
  104419:	8b 45 08             	mov    0x8(%ebp),%eax
  10441c:	8d 50 01             	lea    0x1(%eax),%edx
  10441f:	89 55 08             	mov    %edx,0x8(%ebp)
  104422:	c6 00 00             	movb   $0x0,(%eax)
  104425:	8b 45 08             	mov    0x8(%ebp),%eax
  104428:	0f b6 00             	movzbl (%eax),%eax
  10442b:	84 c0                	test   %al,%al
  10442d:	74 20                	je     10444f <runcmd+0x5c>
  10442f:	8b 45 08             	mov    0x8(%ebp),%eax
  104432:	0f b6 00             	movzbl (%eax),%eax
  104435:	0f be c0             	movsbl %al,%eax
  104438:	83 ec 08             	sub    $0x8,%esp
  10443b:	50                   	push   %eax
  10443c:	8d 83 0a d3 ff ff    	lea    -0x2cf6(%ebx),%eax
  104442:	50                   	push   %eax
  104443:	e8 d2 eb ff ff       	call   10301a <strchr>
  104448:	83 c4 10             	add    $0x10,%esp
  10444b:	85 c0                	test   %eax,%eax
  10444d:	75 ca                	jne    104419 <runcmd+0x26>
  10444f:	8b 45 08             	mov    0x8(%ebp),%eax
  104452:	0f b6 00             	movzbl (%eax),%eax
  104455:	84 c0                	test   %al,%al
  104457:	74 6d                	je     1044c6 <runcmd+0xd3>
  104459:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  10445d:	75 1e                	jne    10447d <runcmd+0x8a>
  10445f:	83 ec 08             	sub    $0x8,%esp
  104462:	6a 10                	push   $0x10
  104464:	8d 83 0f d3 ff ff    	lea    -0x2cf1(%ebx),%eax
  10446a:	50                   	push   %eax
  10446b:	e8 08 ef ff ff       	call   103378 <dprintf>
  104470:	83 c4 10             	add    $0x10,%esp
  104473:	b8 00 00 00 00       	mov    $0x0,%eax
  104478:	e9 e9 00 00 00       	jmp    104566 <runcmd+0x173>
  10447d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104480:	8d 50 01             	lea    0x1(%eax),%edx
  104483:	89 55 f4             	mov    %edx,-0xc(%ebp)
  104486:	8b 55 08             	mov    0x8(%ebp),%edx
  104489:	89 54 85 b0          	mov    %edx,-0x50(%ebp,%eax,4)
  10448d:	eb 04                	jmp    104493 <runcmd+0xa0>
  10448f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  104493:	8b 45 08             	mov    0x8(%ebp),%eax
  104496:	0f b6 00             	movzbl (%eax),%eax
  104499:	84 c0                	test   %al,%al
  10449b:	0f 84 76 ff ff ff    	je     104417 <runcmd+0x24>
  1044a1:	8b 45 08             	mov    0x8(%ebp),%eax
  1044a4:	0f b6 00             	movzbl (%eax),%eax
  1044a7:	0f be c0             	movsbl %al,%eax
  1044aa:	83 ec 08             	sub    $0x8,%esp
  1044ad:	50                   	push   %eax
  1044ae:	8d 83 0a d3 ff ff    	lea    -0x2cf6(%ebx),%eax
  1044b4:	50                   	push   %eax
  1044b5:	e8 60 eb ff ff       	call   10301a <strchr>
  1044ba:	83 c4 10             	add    $0x10,%esp
  1044bd:	85 c0                	test   %eax,%eax
  1044bf:	74 ce                	je     10448f <runcmd+0x9c>
  1044c1:	e9 51 ff ff ff       	jmp    104417 <runcmd+0x24>
  1044c6:	90                   	nop
  1044c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1044ca:	c7 44 85 b0 00 00 00 	movl   $0x0,-0x50(%ebp,%eax,4)
  1044d1:	00 
  1044d2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1044d6:	75 0a                	jne    1044e2 <runcmd+0xef>
  1044d8:	b8 00 00 00 00       	mov    $0x0,%eax
  1044dd:	e9 84 00 00 00       	jmp    104566 <runcmd+0x173>
  1044e2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  1044e9:	eb 58                	jmp    104543 <runcmd+0x150>
  1044eb:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1044ee:	8d 8b 20 15 00 00    	lea    0x1520(%ebx),%ecx
  1044f4:	89 d0                	mov    %edx,%eax
  1044f6:	01 c0                	add    %eax,%eax
  1044f8:	01 d0                	add    %edx,%eax
  1044fa:	c1 e0 02             	shl    $0x2,%eax
  1044fd:	01 c8                	add    %ecx,%eax
  1044ff:	8b 10                	mov    (%eax),%edx
  104501:	8b 45 b0             	mov    -0x50(%ebp),%eax
  104504:	83 ec 08             	sub    $0x8,%esp
  104507:	52                   	push   %edx
  104508:	50                   	push   %eax
  104509:	e8 c3 ea ff ff       	call   102fd1 <strcmp>
  10450e:	83 c4 10             	add    $0x10,%esp
  104511:	85 c0                	test   %eax,%eax
  104513:	75 2a                	jne    10453f <runcmd+0x14c>
  104515:	8b 55 f0             	mov    -0x10(%ebp),%edx
  104518:	8d 8b 28 15 00 00    	lea    0x1528(%ebx),%ecx
  10451e:	89 d0                	mov    %edx,%eax
  104520:	01 c0                	add    %eax,%eax
  104522:	01 d0                	add    %edx,%eax
  104524:	c1 e0 02             	shl    $0x2,%eax
  104527:	01 c8                	add    %ecx,%eax
  104529:	8b 00                	mov    (%eax),%eax
  10452b:	83 ec 04             	sub    $0x4,%esp
  10452e:	ff 75 0c             	pushl  0xc(%ebp)
  104531:	8d 55 b0             	lea    -0x50(%ebp),%edx
  104534:	52                   	push   %edx
  104535:	ff 75 f4             	pushl  -0xc(%ebp)
  104538:	ff d0                	call   *%eax
  10453a:	83 c4 10             	add    $0x10,%esp
  10453d:	eb 27                	jmp    104566 <runcmd+0x173>
  10453f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  104543:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104546:	83 f8 02             	cmp    $0x2,%eax
  104549:	76 a0                	jbe    1044eb <runcmd+0xf8>
  10454b:	8b 45 b0             	mov    -0x50(%ebp),%eax
  10454e:	83 ec 08             	sub    $0x8,%esp
  104551:	50                   	push   %eax
  104552:	8d 83 2c d3 ff ff    	lea    -0x2cd4(%ebx),%eax
  104558:	50                   	push   %eax
  104559:	e8 1a ee ff ff       	call   103378 <dprintf>
  10455e:	83 c4 10             	add    $0x10,%esp
  104561:	b8 00 00 00 00       	mov    $0x0,%eax
  104566:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104569:	c9                   	leave  
  10456a:	c3                   	ret    

0010456b <monitor>:
  10456b:	55                   	push   %ebp
  10456c:	89 e5                	mov    %esp,%ebp
  10456e:	53                   	push   %ebx
  10456f:	83 ec 14             	sub    $0x14,%esp
  104572:	e8 9c be ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  104577:	81 c3 89 4a 00 00    	add    $0x4a89,%ebx
  10457d:	83 ec 0c             	sub    $0xc,%esp
  104580:	8d 83 44 d3 ff ff    	lea    -0x2cbc(%ebx),%eax
  104586:	50                   	push   %eax
  104587:	e8 ec ed ff ff       	call   103378 <dprintf>
  10458c:	83 c4 10             	add    $0x10,%esp
  10458f:	83 ec 0c             	sub    $0xc,%esp
  104592:	8d 83 70 d3 ff ff    	lea    -0x2c90(%ebx),%eax
  104598:	50                   	push   %eax
  104599:	e8 da ed ff ff       	call   103378 <dprintf>
  10459e:	83 c4 10             	add    $0x10,%esp
  1045a1:	83 ec 0c             	sub    $0xc,%esp
  1045a4:	8d 83 44 d3 ff ff    	lea    -0x2cbc(%ebx),%eax
  1045aa:	50                   	push   %eax
  1045ab:	e8 c8 ed ff ff       	call   103378 <dprintf>
  1045b0:	83 c4 10             	add    $0x10,%esp
  1045b3:	83 ec 0c             	sub    $0xc,%esp
  1045b6:	8d 83 9c d3 ff ff    	lea    -0x2c64(%ebx),%eax
  1045bc:	50                   	push   %eax
  1045bd:	e8 b6 ed ff ff       	call   103378 <dprintf>
  1045c2:	83 c4 10             	add    $0x10,%esp
  1045c5:	83 ec 0c             	sub    $0xc,%esp
  1045c8:	8d 83 c1 d3 ff ff    	lea    -0x2c3f(%ebx),%eax
  1045ce:	50                   	push   %eax
  1045cf:	e8 1c c0 ff ff       	call   1005f0 <readline>
  1045d4:	83 c4 10             	add    $0x10,%esp
  1045d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1045da:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1045de:	74 e5                	je     1045c5 <monitor+0x5a>
  1045e0:	83 ec 08             	sub    $0x8,%esp
  1045e3:	ff 75 08             	pushl  0x8(%ebp)
  1045e6:	ff 75 f4             	pushl  -0xc(%ebp)
  1045e9:	e8 05 fe ff ff       	call   1043f3 <runcmd>
  1045ee:	83 c4 10             	add    $0x10,%esp
  1045f1:	85 c0                	test   %eax,%eax
  1045f3:	78 02                	js     1045f7 <monitor+0x8c>
  1045f5:	eb ce                	jmp    1045c5 <monitor+0x5a>
  1045f7:	90                   	nop
  1045f8:	90                   	nop
  1045f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1045fc:	c9                   	leave  
  1045fd:	c3                   	ret    

001045fe <pt_copyin>:
  1045fe:	55                   	push   %ebp
  1045ff:	89 e5                	mov    %esp,%ebp
  104601:	53                   	push   %ebx
  104602:	83 ec 14             	sub    $0x14,%esp
  104605:	e8 09 be ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  10460a:	81 c3 f6 49 00 00    	add    $0x49f6,%ebx
  104610:	81 7d 0c ff ff ff 3f 	cmpl   $0x3fffffff,0xc(%ebp)
  104617:	76 0f                	jbe    104628 <pt_copyin+0x2a>
  104619:	8b 55 0c             	mov    0xc(%ebp),%edx
  10461c:	8b 45 14             	mov    0x14(%ebp),%eax
  10461f:	01 d0                	add    %edx,%eax
  104621:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  104626:	76 0a                	jbe    104632 <pt_copyin+0x34>
  104628:	b8 00 00 00 00       	mov    $0x0,%eax
  10462d:	e9 d6 00 00 00       	jmp    104708 <pt_copyin+0x10a>
  104632:	8b 55 10             	mov    0x10(%ebp),%edx
  104635:	8b 45 14             	mov    0x14(%ebp),%eax
  104638:	01 d0                	add    %edx,%eax
  10463a:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  10463f:	76 0a                	jbe    10464b <pt_copyin+0x4d>
  104641:	b8 00 00 00 00       	mov    $0x0,%eax
  104646:	e9 bd 00 00 00       	jmp    104708 <pt_copyin+0x10a>
  10464b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  104652:	e9 a4 00 00 00       	jmp    1046fb <pt_copyin+0xfd>
  104657:	83 ec 08             	sub    $0x8,%esp
  10465a:	ff 75 0c             	pushl  0xc(%ebp)
  10465d:	ff 75 08             	pushl  0x8(%ebp)
  104660:	e8 4b 11 00 00       	call   1057b0 <get_ptbl_entry_by_va>
  104665:	83 c4 10             	add    $0x10,%esp
  104668:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10466b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10466e:	83 e0 01             	and    $0x1,%eax
  104671:	85 c0                	test   %eax,%eax
  104673:	75 27                	jne    10469c <pt_copyin+0x9e>
  104675:	83 ec 04             	sub    $0x4,%esp
  104678:	6a 07                	push   $0x7
  10467a:	ff 75 0c             	pushl  0xc(%ebp)
  10467d:	ff 75 08             	pushl  0x8(%ebp)
  104680:	e8 8b 15 00 00       	call   105c10 <alloc_page>
  104685:	83 c4 10             	add    $0x10,%esp
  104688:	83 ec 08             	sub    $0x8,%esp
  10468b:	ff 75 0c             	pushl  0xc(%ebp)
  10468e:	ff 75 08             	pushl  0x8(%ebp)
  104691:	e8 1a 11 00 00       	call   1057b0 <get_ptbl_entry_by_va>
  104696:	83 c4 10             	add    $0x10,%esp
  104699:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10469c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10469f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  1046a4:	89 c2                	mov    %eax,%edx
  1046a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1046a9:	25 ff 0f 00 00       	and    $0xfff,%eax
  1046ae:	09 d0                	or     %edx,%eax
  1046b0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1046b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1046b6:	25 ff 0f 00 00       	and    $0xfff,%eax
  1046bb:	ba 00 10 00 00       	mov    $0x1000,%edx
  1046c0:	29 c2                	sub    %eax,%edx
  1046c2:	89 d0                	mov    %edx,%eax
  1046c4:	39 45 14             	cmp    %eax,0x14(%ebp)
  1046c7:	0f 46 45 14          	cmovbe 0x14(%ebp),%eax
  1046cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1046ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1046d1:	83 ec 04             	sub    $0x4,%esp
  1046d4:	ff 75 ec             	pushl  -0x14(%ebp)
  1046d7:	50                   	push   %eax
  1046d8:	ff 75 10             	pushl  0x10(%ebp)
  1046db:	e8 37 e8 ff ff       	call   102f17 <memcpy>
  1046e0:	83 c4 10             	add    $0x10,%esp
  1046e3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1046e6:	29 45 14             	sub    %eax,0x14(%ebp)
  1046e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1046ec:	01 45 0c             	add    %eax,0xc(%ebp)
  1046ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1046f2:	01 45 10             	add    %eax,0x10(%ebp)
  1046f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1046f8:	01 45 f4             	add    %eax,-0xc(%ebp)
  1046fb:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  1046ff:	0f 85 52 ff ff ff    	jne    104657 <pt_copyin+0x59>
  104705:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104708:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10470b:	c9                   	leave  
  10470c:	c3                   	ret    

0010470d <pt_copyout>:
  10470d:	55                   	push   %ebp
  10470e:	89 e5                	mov    %esp,%ebp
  104710:	53                   	push   %ebx
  104711:	83 ec 14             	sub    $0x14,%esp
  104714:	e8 fa bc ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  104719:	81 c3 e7 48 00 00    	add    $0x48e7,%ebx
  10471f:	81 7d 10 ff ff ff 3f 	cmpl   $0x3fffffff,0x10(%ebp)
  104726:	76 0f                	jbe    104737 <pt_copyout+0x2a>
  104728:	8b 55 10             	mov    0x10(%ebp),%edx
  10472b:	8b 45 14             	mov    0x14(%ebp),%eax
  10472e:	01 d0                	add    %edx,%eax
  104730:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  104735:	76 0a                	jbe    104741 <pt_copyout+0x34>
  104737:	b8 00 00 00 00       	mov    $0x0,%eax
  10473c:	e9 d6 00 00 00       	jmp    104817 <pt_copyout+0x10a>
  104741:	8b 55 08             	mov    0x8(%ebp),%edx
  104744:	8b 45 14             	mov    0x14(%ebp),%eax
  104747:	01 d0                	add    %edx,%eax
  104749:	3d 00 00 00 f0       	cmp    $0xf0000000,%eax
  10474e:	76 0a                	jbe    10475a <pt_copyout+0x4d>
  104750:	b8 00 00 00 00       	mov    $0x0,%eax
  104755:	e9 bd 00 00 00       	jmp    104817 <pt_copyout+0x10a>
  10475a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  104761:	e9 a4 00 00 00       	jmp    10480a <pt_copyout+0xfd>
  104766:	83 ec 08             	sub    $0x8,%esp
  104769:	ff 75 10             	pushl  0x10(%ebp)
  10476c:	ff 75 0c             	pushl  0xc(%ebp)
  10476f:	e8 3c 10 00 00       	call   1057b0 <get_ptbl_entry_by_va>
  104774:	83 c4 10             	add    $0x10,%esp
  104777:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10477a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10477d:	83 e0 01             	and    $0x1,%eax
  104780:	85 c0                	test   %eax,%eax
  104782:	75 27                	jne    1047ab <pt_copyout+0x9e>
  104784:	83 ec 04             	sub    $0x4,%esp
  104787:	6a 07                	push   $0x7
  104789:	ff 75 10             	pushl  0x10(%ebp)
  10478c:	ff 75 0c             	pushl  0xc(%ebp)
  10478f:	e8 7c 14 00 00       	call   105c10 <alloc_page>
  104794:	83 c4 10             	add    $0x10,%esp
  104797:	83 ec 08             	sub    $0x8,%esp
  10479a:	ff 75 10             	pushl  0x10(%ebp)
  10479d:	ff 75 0c             	pushl  0xc(%ebp)
  1047a0:	e8 0b 10 00 00       	call   1057b0 <get_ptbl_entry_by_va>
  1047a5:	83 c4 10             	add    $0x10,%esp
  1047a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1047ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1047ae:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  1047b3:	89 c2                	mov    %eax,%edx
  1047b5:	8b 45 10             	mov    0x10(%ebp),%eax
  1047b8:	25 ff 0f 00 00       	and    $0xfff,%eax
  1047bd:	09 d0                	or     %edx,%eax
  1047bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1047c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1047c5:	25 ff 0f 00 00       	and    $0xfff,%eax
  1047ca:	ba 00 10 00 00       	mov    $0x1000,%edx
  1047cf:	29 c2                	sub    %eax,%edx
  1047d1:	89 d0                	mov    %edx,%eax
  1047d3:	39 45 14             	cmp    %eax,0x14(%ebp)
  1047d6:	0f 46 45 14          	cmovbe 0x14(%ebp),%eax
  1047da:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1047dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1047e0:	83 ec 04             	sub    $0x4,%esp
  1047e3:	ff 75 ec             	pushl  -0x14(%ebp)
  1047e6:	ff 75 08             	pushl  0x8(%ebp)
  1047e9:	50                   	push   %eax
  1047ea:	e8 28 e7 ff ff       	call   102f17 <memcpy>
  1047ef:	83 c4 10             	add    $0x10,%esp
  1047f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1047f5:	29 45 14             	sub    %eax,0x14(%ebp)
  1047f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1047fb:	01 45 10             	add    %eax,0x10(%ebp)
  1047fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104801:	01 45 08             	add    %eax,0x8(%ebp)
  104804:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104807:	01 45 f4             	add    %eax,-0xc(%ebp)
  10480a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  10480e:	0f 85 52 ff ff ff    	jne    104766 <pt_copyout+0x59>
  104814:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104817:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  10481a:	c9                   	leave  
  10481b:	c3                   	ret    

0010481c <pt_memset>:
  10481c:	55                   	push   %ebp
  10481d:	89 e5                	mov    %esp,%ebp
  10481f:	53                   	push   %ebx
  104820:	83 ec 24             	sub    $0x24,%esp
  104823:	e8 eb bb ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  104828:	81 c3 d8 47 00 00    	add    $0x47d8,%ebx
  10482e:	8b 45 10             	mov    0x10(%ebp),%eax
  104831:	88 45 e4             	mov    %al,-0x1c(%ebp)
  104834:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  10483b:	e9 a0 00 00 00       	jmp    1048e0 <pt_memset+0xc4>
  104840:	83 ec 08             	sub    $0x8,%esp
  104843:	ff 75 0c             	pushl  0xc(%ebp)
  104846:	ff 75 08             	pushl  0x8(%ebp)
  104849:	e8 62 0f 00 00       	call   1057b0 <get_ptbl_entry_by_va>
  10484e:	83 c4 10             	add    $0x10,%esp
  104851:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104854:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104857:	83 e0 01             	and    $0x1,%eax
  10485a:	85 c0                	test   %eax,%eax
  10485c:	75 27                	jne    104885 <pt_memset+0x69>
  10485e:	83 ec 04             	sub    $0x4,%esp
  104861:	6a 07                	push   $0x7
  104863:	ff 75 0c             	pushl  0xc(%ebp)
  104866:	ff 75 08             	pushl  0x8(%ebp)
  104869:	e8 a2 13 00 00       	call   105c10 <alloc_page>
  10486e:	83 c4 10             	add    $0x10,%esp
  104871:	83 ec 08             	sub    $0x8,%esp
  104874:	ff 75 0c             	pushl  0xc(%ebp)
  104877:	ff 75 08             	pushl  0x8(%ebp)
  10487a:	e8 31 0f 00 00       	call   1057b0 <get_ptbl_entry_by_va>
  10487f:	83 c4 10             	add    $0x10,%esp
  104882:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104885:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104888:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  10488d:	89 c2                	mov    %eax,%edx
  10488f:	8b 45 0c             	mov    0xc(%ebp),%eax
  104892:	25 ff 0f 00 00       	and    $0xfff,%eax
  104897:	09 d0                	or     %edx,%eax
  104899:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10489c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10489f:	25 ff 0f 00 00       	and    $0xfff,%eax
  1048a4:	ba 00 10 00 00       	mov    $0x1000,%edx
  1048a9:	29 c2                	sub    %eax,%edx
  1048ab:	89 d0                	mov    %edx,%eax
  1048ad:	39 45 14             	cmp    %eax,0x14(%ebp)
  1048b0:	0f 46 45 14          	cmovbe 0x14(%ebp),%eax
  1048b4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1048b7:	0f be 55 e4          	movsbl -0x1c(%ebp),%edx
  1048bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1048be:	83 ec 04             	sub    $0x4,%esp
  1048c1:	ff 75 ec             	pushl  -0x14(%ebp)
  1048c4:	52                   	push   %edx
  1048c5:	50                   	push   %eax
  1048c6:	e8 f0 e4 ff ff       	call   102dbb <memset>
  1048cb:	83 c4 10             	add    $0x10,%esp
  1048ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1048d1:	29 45 14             	sub    %eax,0x14(%ebp)
  1048d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1048d7:	01 45 0c             	add    %eax,0xc(%ebp)
  1048da:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1048dd:	01 45 f4             	add    %eax,-0xc(%ebp)
  1048e0:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
  1048e4:	0f 85 56 ff ff ff    	jne    104840 <pt_memset+0x24>
  1048ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1048ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  1048f0:	c9                   	leave  
  1048f1:	c3                   	ret    

001048f2 <elf_load>:
  1048f2:	55                   	push   %ebp
  1048f3:	89 e5                	mov    %esp,%ebp
  1048f5:	53                   	push   %ebx
  1048f6:	83 ec 34             	sub    $0x34,%esp
  1048f9:	e8 15 bb ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1048fe:	81 c3 02 47 00 00    	add    $0x4702,%ebx
  104904:	8b 45 08             	mov    0x8(%ebp),%eax
  104907:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10490a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10490d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  104910:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104913:	8b 00                	mov    (%eax),%eax
  104915:	3d 7f 45 4c 46       	cmp    $0x464c457f,%eax
  10491a:	74 1f                	je     10493b <elf_load+0x49>
  10491c:	8d 83 c8 d3 ff ff    	lea    -0x2c38(%ebx),%eax
  104922:	50                   	push   %eax
  104923:	8d 83 e1 d3 ff ff    	lea    -0x2c1f(%ebx),%eax
  104929:	50                   	push   %eax
  10492a:	6a 25                	push   $0x25
  10492c:	8d 83 fe d3 ff ff    	lea    -0x2c02(%ebx),%eax
  104932:	50                   	push   %eax
  104933:	e8 29 e8 ff ff       	call   103161 <debug_panic>
  104938:	83 c4 10             	add    $0x10,%esp
  10493b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10493e:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  104942:	66 85 c0             	test   %ax,%ax
  104945:	75 1f                	jne    104966 <elf_load+0x74>
  104947:	8d 83 10 d4 ff ff    	lea    -0x2bf0(%ebx),%eax
  10494d:	50                   	push   %eax
  10494e:	8d 83 e1 d3 ff ff    	lea    -0x2c1f(%ebx),%eax
  104954:	50                   	push   %eax
  104955:	6a 26                	push   $0x26
  104957:	8d 83 fe d3 ff ff    	lea    -0x2c02(%ebx),%eax
  10495d:	50                   	push   %eax
  10495e:	e8 fe e7 ff ff       	call   103161 <debug_panic>
  104963:	83 c4 10             	add    $0x10,%esp
  104966:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104969:	8b 50 20             	mov    0x20(%eax),%edx
  10496c:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10496f:	01 d0                	add    %edx,%eax
  104971:	89 45 dc             	mov    %eax,-0x24(%ebp)
  104974:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104977:	0f b7 40 30          	movzwl 0x30(%eax),%eax
  10497b:	0f b7 d0             	movzwl %ax,%edx
  10497e:	89 d0                	mov    %edx,%eax
  104980:	c1 e0 02             	shl    $0x2,%eax
  104983:	01 d0                	add    %edx,%eax
  104985:	c1 e0 03             	shl    $0x3,%eax
  104988:	89 c2                	mov    %eax,%edx
  10498a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10498d:	01 d0                	add    %edx,%eax
  10498f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  104992:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104995:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  104999:	0f b7 d0             	movzwl %ax,%edx
  10499c:	89 d0                	mov    %edx,%eax
  10499e:	c1 e0 02             	shl    $0x2,%eax
  1049a1:	01 d0                	add    %edx,%eax
  1049a3:	c1 e0 03             	shl    $0x3,%eax
  1049a6:	89 c2                	mov    %eax,%edx
  1049a8:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1049ab:	01 d0                	add    %edx,%eax
  1049ad:	8b 50 10             	mov    0x10(%eax),%edx
  1049b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1049b3:	01 d0                	add    %edx,%eax
  1049b5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1049b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1049bb:	0f b7 40 32          	movzwl 0x32(%eax),%eax
  1049bf:	0f b7 d0             	movzwl %ax,%edx
  1049c2:	89 d0                	mov    %edx,%eax
  1049c4:	c1 e0 02             	shl    $0x2,%eax
  1049c7:	01 d0                	add    %edx,%eax
  1049c9:	c1 e0 03             	shl    $0x3,%eax
  1049cc:	89 c2                	mov    %eax,%edx
  1049ce:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1049d1:	01 d0                	add    %edx,%eax
  1049d3:	8b 40 04             	mov    0x4(%eax),%eax
  1049d6:	83 f8 03             	cmp    $0x3,%eax
  1049d9:	74 1f                	je     1049fa <elf_load+0x108>
  1049db:	8d 83 30 d4 ff ff    	lea    -0x2bd0(%ebx),%eax
  1049e1:	50                   	push   %eax
  1049e2:	8d 83 e1 d3 ff ff    	lea    -0x2c1f(%ebx),%eax
  1049e8:	50                   	push   %eax
  1049e9:	6a 2c                	push   $0x2c
  1049eb:	8d 83 fe d3 ff ff    	lea    -0x2c02(%ebx),%eax
  1049f1:	50                   	push   %eax
  1049f2:	e8 6a e7 ff ff       	call   103161 <debug_panic>
  1049f7:	83 c4 10             	add    $0x10,%esp
  1049fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1049fd:	8b 50 1c             	mov    0x1c(%eax),%edx
  104a00:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104a03:	01 d0                	add    %edx,%eax
  104a05:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104a08:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104a0b:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  104a0f:	0f b7 c0             	movzwl %ax,%eax
  104a12:	c1 e0 05             	shl    $0x5,%eax
  104a15:	89 c2                	mov    %eax,%edx
  104a17:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a1a:	01 d0                	add    %edx,%eax
  104a1c:	89 45 d0             	mov    %eax,-0x30(%ebp)
  104a1f:	e9 60 01 00 00       	jmp    104b84 <elf_load+0x292>
  104a24:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a27:	8b 00                	mov    (%eax),%eax
  104a29:	83 f8 01             	cmp    $0x1,%eax
  104a2c:	0f 85 4d 01 00 00    	jne    104b7f <elf_load+0x28d>
  104a32:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a35:	8b 40 04             	mov    0x4(%eax),%eax
  104a38:	83 ec 08             	sub    $0x8,%esp
  104a3b:	68 00 10 00 00       	push   $0x1000
  104a40:	50                   	push   %eax
  104a41:	e8 1e f4 ff ff       	call   103e64 <rounddown>
  104a46:	83 c4 10             	add    $0x10,%esp
  104a49:	89 c2                	mov    %eax,%edx
  104a4b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  104a4e:	01 d0                	add    %edx,%eax
  104a50:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104a53:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a56:	8b 40 08             	mov    0x8(%eax),%eax
  104a59:	83 ec 08             	sub    $0x8,%esp
  104a5c:	68 00 10 00 00       	push   $0x1000
  104a61:	50                   	push   %eax
  104a62:	e8 fd f3 ff ff       	call   103e64 <rounddown>
  104a67:	83 c4 10             	add    $0x10,%esp
  104a6a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  104a6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a70:	8b 50 08             	mov    0x8(%eax),%edx
  104a73:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a76:	8b 40 10             	mov    0x10(%eax),%eax
  104a79:	01 d0                	add    %edx,%eax
  104a7b:	89 45 cc             	mov    %eax,-0x34(%ebp)
  104a7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a81:	8b 50 08             	mov    0x8(%eax),%edx
  104a84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104a87:	8b 40 14             	mov    0x14(%eax),%eax
  104a8a:	01 d0                	add    %edx,%eax
  104a8c:	83 ec 08             	sub    $0x8,%esp
  104a8f:	68 00 10 00 00       	push   $0x1000
  104a94:	50                   	push   %eax
  104a95:	e8 e9 f3 ff ff       	call   103e83 <roundup>
  104a9a:	83 c4 10             	add    $0x10,%esp
  104a9d:	89 45 c8             	mov    %eax,-0x38(%ebp)
  104aa0:	c7 45 e8 05 00 00 00 	movl   $0x5,-0x18(%ebp)
  104aa7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104aaa:	8b 40 18             	mov    0x18(%eax),%eax
  104aad:	83 e0 02             	and    $0x2,%eax
  104ab0:	85 c0                	test   %eax,%eax
  104ab2:	0f 84 b9 00 00 00    	je     104b71 <elf_load+0x27f>
  104ab8:	83 4d e8 02          	orl    $0x2,-0x18(%ebp)
  104abc:	e9 b0 00 00 00       	jmp    104b71 <elf_load+0x27f>
  104ac1:	83 ec 04             	sub    $0x4,%esp
  104ac4:	ff 75 e8             	pushl  -0x18(%ebp)
  104ac7:	ff 75 ec             	pushl  -0x14(%ebp)
  104aca:	ff 75 0c             	pushl  0xc(%ebp)
  104acd:	e8 3e 11 00 00       	call   105c10 <alloc_page>
  104ad2:	83 c4 10             	add    $0x10,%esp
  104ad5:	83 ec 08             	sub    $0x8,%esp
  104ad8:	68 00 10 00 00       	push   $0x1000
  104add:	ff 75 cc             	pushl  -0x34(%ebp)
  104ae0:	e8 7f f3 ff ff       	call   103e64 <rounddown>
  104ae5:	83 c4 10             	add    $0x10,%esp
  104ae8:	39 45 ec             	cmp    %eax,-0x14(%ebp)
  104aeb:	73 1a                	jae    104b07 <elf_load+0x215>
  104aed:	8b 55 0c             	mov    0xc(%ebp),%edx
  104af0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104af3:	68 00 10 00 00       	push   $0x1000
  104af8:	ff 75 ec             	pushl  -0x14(%ebp)
  104afb:	52                   	push   %edx
  104afc:	50                   	push   %eax
  104afd:	e8 0b fc ff ff       	call   10470d <pt_copyout>
  104b02:	83 c4 10             	add    $0x10,%esp
  104b05:	eb 5c                	jmp    104b63 <elf_load+0x271>
  104b07:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104b0a:	3b 45 cc             	cmp    -0x34(%ebp),%eax
  104b0d:	73 3e                	jae    104b4d <elf_load+0x25b>
  104b0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104b12:	8b 40 10             	mov    0x10(%eax),%eax
  104b15:	85 c0                	test   %eax,%eax
  104b17:	74 34                	je     104b4d <elf_load+0x25b>
  104b19:	8b 45 0c             	mov    0xc(%ebp),%eax
  104b1c:	68 00 10 00 00       	push   $0x1000
  104b21:	6a 00                	push   $0x0
  104b23:	ff 75 ec             	pushl  -0x14(%ebp)
  104b26:	50                   	push   %eax
  104b27:	e8 f0 fc ff ff       	call   10481c <pt_memset>
  104b2c:	83 c4 10             	add    $0x10,%esp
  104b2f:	8b 45 cc             	mov    -0x34(%ebp),%eax
  104b32:	2b 45 ec             	sub    -0x14(%ebp),%eax
  104b35:	89 c1                	mov    %eax,%ecx
  104b37:	8b 55 0c             	mov    0xc(%ebp),%edx
  104b3a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104b3d:	51                   	push   %ecx
  104b3e:	ff 75 ec             	pushl  -0x14(%ebp)
  104b41:	52                   	push   %edx
  104b42:	50                   	push   %eax
  104b43:	e8 c5 fb ff ff       	call   10470d <pt_copyout>
  104b48:	83 c4 10             	add    $0x10,%esp
  104b4b:	eb 16                	jmp    104b63 <elf_load+0x271>
  104b4d:	8b 45 0c             	mov    0xc(%ebp),%eax
  104b50:	68 00 10 00 00       	push   $0x1000
  104b55:	6a 00                	push   $0x0
  104b57:	ff 75 ec             	pushl  -0x14(%ebp)
  104b5a:	50                   	push   %eax
  104b5b:	e8 bc fc ff ff       	call   10481c <pt_memset>
  104b60:	83 c4 10             	add    $0x10,%esp
  104b63:	81 45 ec 00 10 00 00 	addl   $0x1000,-0x14(%ebp)
  104b6a:	81 45 f0 00 10 00 00 	addl   $0x1000,-0x10(%ebp)
  104b71:	8b 45 ec             	mov    -0x14(%ebp),%eax
  104b74:	3b 45 c8             	cmp    -0x38(%ebp),%eax
  104b77:	0f 82 44 ff ff ff    	jb     104ac1 <elf_load+0x1cf>
  104b7d:	eb 01                	jmp    104b80 <elf_load+0x28e>
  104b7f:	90                   	nop
  104b80:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
  104b84:	8b 45 f4             	mov    -0xc(%ebp),%eax
  104b87:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  104b8a:	0f 82 94 fe ff ff    	jb     104a24 <elf_load+0x132>
  104b90:	8b 45 0c             	mov    0xc(%ebp),%eax
  104b93:	68 00 10 00 00       	push   $0x1000
  104b98:	68 00 00 00 e0       	push   $0xe0000000
  104b9d:	50                   	push   %eax
  104b9e:	8d 83 00 20 00 00    	lea    0x2000(%ebx),%eax
  104ba4:	50                   	push   %eax
  104ba5:	e8 63 fb ff ff       	call   10470d <pt_copyout>
  104baa:	83 c4 10             	add    $0x10,%esp
  104bad:	90                   	nop
  104bae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104bb1:	c9                   	leave  
  104bb2:	c3                   	ret    

00104bb3 <elf_entry>:
  104bb3:	55                   	push   %ebp
  104bb4:	89 e5                	mov    %esp,%ebp
  104bb6:	53                   	push   %ebx
  104bb7:	83 ec 14             	sub    $0x14,%esp
  104bba:	e8 4c b8 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  104bbf:	05 41 44 00 00       	add    $0x4441,%eax
  104bc4:	8b 55 08             	mov    0x8(%ebp),%edx
  104bc7:	89 55 f4             	mov    %edx,-0xc(%ebp)
  104bca:	8b 55 f4             	mov    -0xc(%ebp),%edx
  104bcd:	89 55 f0             	mov    %edx,-0x10(%ebp)
  104bd0:	8b 55 f0             	mov    -0x10(%ebp),%edx
  104bd3:	8b 12                	mov    (%edx),%edx
  104bd5:	81 fa 7f 45 4c 46    	cmp    $0x464c457f,%edx
  104bdb:	74 21                	je     104bfe <elf_entry+0x4b>
  104bdd:	8d 90 c8 d3 ff ff    	lea    -0x2c38(%eax),%edx
  104be3:	52                   	push   %edx
  104be4:	8d 90 e1 d3 ff ff    	lea    -0x2c1f(%eax),%edx
  104bea:	52                   	push   %edx
  104beb:	6a 62                	push   $0x62
  104bed:	8d 90 fe d3 ff ff    	lea    -0x2c02(%eax),%edx
  104bf3:	52                   	push   %edx
  104bf4:	89 c3                	mov    %eax,%ebx
  104bf6:	e8 66 e5 ff ff       	call   103161 <debug_panic>
  104bfb:	83 c4 10             	add    $0x10,%esp
  104bfe:	8b 45 f0             	mov    -0x10(%ebp),%eax
  104c01:	8b 40 18             	mov    0x18(%eax),%eax
  104c04:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104c07:	c9                   	leave  
  104c08:	c3                   	ret    

00104c09 <trap_dump>:
  104c09:	55                   	push   %ebp
  104c0a:	89 e5                	mov    %esp,%ebp
  104c0c:	53                   	push   %ebx
  104c0d:	83 ec 14             	sub    $0x14,%esp
  104c10:	e8 fe b7 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  104c15:	81 c3 eb 43 00 00    	add    $0x43eb,%ebx
  104c1b:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  104c1f:	0f 84 4f 02 00 00    	je     104e74 <trap_dump+0x26b>
  104c25:	8b 45 08             	mov    0x8(%ebp),%eax
  104c28:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104c2b:	ff 75 f4             	pushl  -0xc(%ebp)
  104c2e:	8d 83 60 d4 ff ff    	lea    -0x2ba0(%ebx),%eax
  104c34:	50                   	push   %eax
  104c35:	6a 11                	push   $0x11
  104c37:	8d 83 71 d4 ff ff    	lea    -0x2b8f(%ebx),%eax
  104c3d:	50                   	push   %eax
  104c3e:	e8 64 e4 ff ff       	call   1030a7 <debug_normal>
  104c43:	83 c4 10             	add    $0x10,%esp
  104c46:	8b 45 08             	mov    0x8(%ebp),%eax
  104c49:	8b 10                	mov    (%eax),%edx
  104c4b:	8b 45 08             	mov    0x8(%ebp),%eax
  104c4e:	83 ec 04             	sub    $0x4,%esp
  104c51:	52                   	push   %edx
  104c52:	50                   	push   %eax
  104c53:	8d 83 81 d4 ff ff    	lea    -0x2b7f(%ebx),%eax
  104c59:	50                   	push   %eax
  104c5a:	e8 17 e4 ff ff       	call   103076 <debug_info>
  104c5f:	83 c4 10             	add    $0x10,%esp
  104c62:	8b 45 08             	mov    0x8(%ebp),%eax
  104c65:	8b 40 04             	mov    0x4(%eax),%eax
  104c68:	8b 55 08             	mov    0x8(%ebp),%edx
  104c6b:	83 c2 04             	add    $0x4,%edx
  104c6e:	83 ec 04             	sub    $0x4,%esp
  104c71:	50                   	push   %eax
  104c72:	52                   	push   %edx
  104c73:	8d 83 97 d4 ff ff    	lea    -0x2b69(%ebx),%eax
  104c79:	50                   	push   %eax
  104c7a:	e8 f7 e3 ff ff       	call   103076 <debug_info>
  104c7f:	83 c4 10             	add    $0x10,%esp
  104c82:	8b 45 08             	mov    0x8(%ebp),%eax
  104c85:	8b 40 08             	mov    0x8(%eax),%eax
  104c88:	8b 55 08             	mov    0x8(%ebp),%edx
  104c8b:	83 c2 08             	add    $0x8,%edx
  104c8e:	83 ec 04             	sub    $0x4,%esp
  104c91:	50                   	push   %eax
  104c92:	52                   	push   %edx
  104c93:	8d 83 ad d4 ff ff    	lea    -0x2b53(%ebx),%eax
  104c99:	50                   	push   %eax
  104c9a:	e8 d7 e3 ff ff       	call   103076 <debug_info>
  104c9f:	83 c4 10             	add    $0x10,%esp
  104ca2:	8b 45 08             	mov    0x8(%ebp),%eax
  104ca5:	8b 40 0c             	mov    0xc(%eax),%eax
  104ca8:	8b 55 08             	mov    0x8(%ebp),%edx
  104cab:	83 c2 0c             	add    $0xc,%edx
  104cae:	83 ec 04             	sub    $0x4,%esp
  104cb1:	50                   	push   %eax
  104cb2:	52                   	push   %edx
  104cb3:	8d 83 c3 d4 ff ff    	lea    -0x2b3d(%ebx),%eax
  104cb9:	50                   	push   %eax
  104cba:	e8 b7 e3 ff ff       	call   103076 <debug_info>
  104cbf:	83 c4 10             	add    $0x10,%esp
  104cc2:	8b 45 08             	mov    0x8(%ebp),%eax
  104cc5:	8b 40 10             	mov    0x10(%eax),%eax
  104cc8:	8b 55 08             	mov    0x8(%ebp),%edx
  104ccb:	83 c2 10             	add    $0x10,%edx
  104cce:	83 ec 04             	sub    $0x4,%esp
  104cd1:	50                   	push   %eax
  104cd2:	52                   	push   %edx
  104cd3:	8d 83 d9 d4 ff ff    	lea    -0x2b27(%ebx),%eax
  104cd9:	50                   	push   %eax
  104cda:	e8 97 e3 ff ff       	call   103076 <debug_info>
  104cdf:	83 c4 10             	add    $0x10,%esp
  104ce2:	8b 45 08             	mov    0x8(%ebp),%eax
  104ce5:	8b 40 14             	mov    0x14(%eax),%eax
  104ce8:	8b 55 08             	mov    0x8(%ebp),%edx
  104ceb:	83 c2 14             	add    $0x14,%edx
  104cee:	83 ec 04             	sub    $0x4,%esp
  104cf1:	50                   	push   %eax
  104cf2:	52                   	push   %edx
  104cf3:	8d 83 ef d4 ff ff    	lea    -0x2b11(%ebx),%eax
  104cf9:	50                   	push   %eax
  104cfa:	e8 77 e3 ff ff       	call   103076 <debug_info>
  104cff:	83 c4 10             	add    $0x10,%esp
  104d02:	8b 45 08             	mov    0x8(%ebp),%eax
  104d05:	8b 40 18             	mov    0x18(%eax),%eax
  104d08:	8b 55 08             	mov    0x8(%ebp),%edx
  104d0b:	83 c2 18             	add    $0x18,%edx
  104d0e:	83 ec 04             	sub    $0x4,%esp
  104d11:	50                   	push   %eax
  104d12:	52                   	push   %edx
  104d13:	8d 83 05 d5 ff ff    	lea    -0x2afb(%ebx),%eax
  104d19:	50                   	push   %eax
  104d1a:	e8 57 e3 ff ff       	call   103076 <debug_info>
  104d1f:	83 c4 10             	add    $0x10,%esp
  104d22:	8b 45 08             	mov    0x8(%ebp),%eax
  104d25:	8b 40 1c             	mov    0x1c(%eax),%eax
  104d28:	8b 55 08             	mov    0x8(%ebp),%edx
  104d2b:	83 c2 1c             	add    $0x1c,%edx
  104d2e:	83 ec 04             	sub    $0x4,%esp
  104d31:	50                   	push   %eax
  104d32:	52                   	push   %edx
  104d33:	8d 83 1b d5 ff ff    	lea    -0x2ae5(%ebx),%eax
  104d39:	50                   	push   %eax
  104d3a:	e8 37 e3 ff ff       	call   103076 <debug_info>
  104d3f:	83 c4 10             	add    $0x10,%esp
  104d42:	8b 45 08             	mov    0x8(%ebp),%eax
  104d45:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  104d49:	0f b7 c0             	movzwl %ax,%eax
  104d4c:	8b 55 08             	mov    0x8(%ebp),%edx
  104d4f:	83 c2 20             	add    $0x20,%edx
  104d52:	83 ec 04             	sub    $0x4,%esp
  104d55:	50                   	push   %eax
  104d56:	52                   	push   %edx
  104d57:	8d 83 31 d5 ff ff    	lea    -0x2acf(%ebx),%eax
  104d5d:	50                   	push   %eax
  104d5e:	e8 13 e3 ff ff       	call   103076 <debug_info>
  104d63:	83 c4 10             	add    $0x10,%esp
  104d66:	8b 45 08             	mov    0x8(%ebp),%eax
  104d69:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  104d6d:	0f b7 c0             	movzwl %ax,%eax
  104d70:	8b 55 08             	mov    0x8(%ebp),%edx
  104d73:	83 c2 24             	add    $0x24,%edx
  104d76:	83 ec 04             	sub    $0x4,%esp
  104d79:	50                   	push   %eax
  104d7a:	52                   	push   %edx
  104d7b:	8d 83 47 d5 ff ff    	lea    -0x2ab9(%ebx),%eax
  104d81:	50                   	push   %eax
  104d82:	e8 ef e2 ff ff       	call   103076 <debug_info>
  104d87:	83 c4 10             	add    $0x10,%esp
  104d8a:	8b 45 08             	mov    0x8(%ebp),%eax
  104d8d:	8b 40 28             	mov    0x28(%eax),%eax
  104d90:	8b 55 08             	mov    0x8(%ebp),%edx
  104d93:	83 c2 28             	add    $0x28,%edx
  104d96:	83 ec 04             	sub    $0x4,%esp
  104d99:	50                   	push   %eax
  104d9a:	52                   	push   %edx
  104d9b:	8d 83 5d d5 ff ff    	lea    -0x2aa3(%ebx),%eax
  104da1:	50                   	push   %eax
  104da2:	e8 cf e2 ff ff       	call   103076 <debug_info>
  104da7:	83 c4 10             	add    $0x10,%esp
  104daa:	8b 45 08             	mov    0x8(%ebp),%eax
  104dad:	8b 40 2c             	mov    0x2c(%eax),%eax
  104db0:	8b 55 08             	mov    0x8(%ebp),%edx
  104db3:	83 c2 2c             	add    $0x2c,%edx
  104db6:	83 ec 04             	sub    $0x4,%esp
  104db9:	50                   	push   %eax
  104dba:	52                   	push   %edx
  104dbb:	8d 83 73 d5 ff ff    	lea    -0x2a8d(%ebx),%eax
  104dc1:	50                   	push   %eax
  104dc2:	e8 af e2 ff ff       	call   103076 <debug_info>
  104dc7:	83 c4 10             	add    $0x10,%esp
  104dca:	8b 45 08             	mov    0x8(%ebp),%eax
  104dcd:	8b 40 30             	mov    0x30(%eax),%eax
  104dd0:	8b 55 08             	mov    0x8(%ebp),%edx
  104dd3:	83 c2 30             	add    $0x30,%edx
  104dd6:	83 ec 04             	sub    $0x4,%esp
  104dd9:	50                   	push   %eax
  104dda:	52                   	push   %edx
  104ddb:	8d 83 89 d5 ff ff    	lea    -0x2a77(%ebx),%eax
  104de1:	50                   	push   %eax
  104de2:	e8 8f e2 ff ff       	call   103076 <debug_info>
  104de7:	83 c4 10             	add    $0x10,%esp
  104dea:	8b 45 08             	mov    0x8(%ebp),%eax
  104ded:	0f b7 40 34          	movzwl 0x34(%eax),%eax
  104df1:	0f b7 c0             	movzwl %ax,%eax
  104df4:	8b 55 08             	mov    0x8(%ebp),%edx
  104df7:	83 c2 34             	add    $0x34,%edx
  104dfa:	83 ec 04             	sub    $0x4,%esp
  104dfd:	50                   	push   %eax
  104dfe:	52                   	push   %edx
  104dff:	8d 83 9f d5 ff ff    	lea    -0x2a61(%ebx),%eax
  104e05:	50                   	push   %eax
  104e06:	e8 6b e2 ff ff       	call   103076 <debug_info>
  104e0b:	83 c4 10             	add    $0x10,%esp
  104e0e:	8b 45 08             	mov    0x8(%ebp),%eax
  104e11:	8b 40 38             	mov    0x38(%eax),%eax
  104e14:	8b 55 08             	mov    0x8(%ebp),%edx
  104e17:	83 c2 38             	add    $0x38,%edx
  104e1a:	83 ec 04             	sub    $0x4,%esp
  104e1d:	50                   	push   %eax
  104e1e:	52                   	push   %edx
  104e1f:	8d 83 b5 d5 ff ff    	lea    -0x2a4b(%ebx),%eax
  104e25:	50                   	push   %eax
  104e26:	e8 4b e2 ff ff       	call   103076 <debug_info>
  104e2b:	83 c4 10             	add    $0x10,%esp
  104e2e:	8b 45 08             	mov    0x8(%ebp),%eax
  104e31:	8b 40 3c             	mov    0x3c(%eax),%eax
  104e34:	8b 55 08             	mov    0x8(%ebp),%edx
  104e37:	83 c2 3c             	add    $0x3c,%edx
  104e3a:	83 ec 04             	sub    $0x4,%esp
  104e3d:	50                   	push   %eax
  104e3e:	52                   	push   %edx
  104e3f:	8d 83 c3 d4 ff ff    	lea    -0x2b3d(%ebx),%eax
  104e45:	50                   	push   %eax
  104e46:	e8 2b e2 ff ff       	call   103076 <debug_info>
  104e4b:	83 c4 10             	add    $0x10,%esp
  104e4e:	8b 45 08             	mov    0x8(%ebp),%eax
  104e51:	0f b7 40 40          	movzwl 0x40(%eax),%eax
  104e55:	0f b7 c0             	movzwl %ax,%eax
  104e58:	8b 55 08             	mov    0x8(%ebp),%edx
  104e5b:	83 c2 40             	add    $0x40,%edx
  104e5e:	83 ec 04             	sub    $0x4,%esp
  104e61:	50                   	push   %eax
  104e62:	52                   	push   %edx
  104e63:	8d 83 cb d5 ff ff    	lea    -0x2a35(%ebx),%eax
  104e69:	50                   	push   %eax
  104e6a:	e8 07 e2 ff ff       	call   103076 <debug_info>
  104e6f:	83 c4 10             	add    $0x10,%esp
  104e72:	eb 01                	jmp    104e75 <trap_dump+0x26c>
  104e74:	90                   	nop
  104e75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104e78:	c9                   	leave  
  104e79:	c3                   	ret    

00104e7a <pgflt_handler>:
  104e7a:	55                   	push   %ebp
  104e7b:	89 e5                	mov    %esp,%ebp
  104e7d:	53                   	push   %ebx
  104e7e:	83 ec 14             	sub    $0x14,%esp
  104e81:	e8 8d b5 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  104e86:	81 c3 7a 41 00 00    	add    $0x417a,%ebx
  104e8c:	8b 45 08             	mov    0x8(%ebp),%eax
  104e8f:	8b 40 2c             	mov    0x2c(%eax),%eax
  104e92:	89 45 f4             	mov    %eax,-0xc(%ebp)
  104e95:	e8 2d f2 ff ff       	call   1040c7 <rcr2>
  104e9a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  104e9d:	8b 45 08             	mov    0x8(%ebp),%eax
  104ea0:	8b 50 30             	mov    0x30(%eax),%edx
  104ea3:	c7 c0 4c 0f 11 00    	mov    $0x110f4c,%eax
  104ea9:	8b 00                	mov    (%eax),%eax
  104eab:	83 ec 0c             	sub    $0xc,%esp
  104eae:	52                   	push   %edx
  104eaf:	50                   	push   %eax
  104eb0:	ff 75 f4             	pushl  -0xc(%ebp)
  104eb3:	ff 75 f0             	pushl  -0x10(%ebp)
  104eb6:	8d 83 e4 d5 ff ff    	lea    -0x2a1c(%ebx),%eax
  104ebc:	50                   	push   %eax
  104ebd:	e8 b6 e4 ff ff       	call   103378 <dprintf>
  104ec2:	83 c4 20             	add    $0x20,%esp
  104ec5:	8b 45 08             	mov    0x8(%ebp),%eax
  104ec8:	8b 40 2c             	mov    0x2c(%eax),%eax
  104ecb:	83 e0 01             	and    $0x1,%eax
  104ece:	85 c0                	test   %eax,%eax
  104ed0:	74 23                	je     104ef5 <pgflt_handler+0x7b>
  104ed2:	83 ec 0c             	sub    $0xc,%esp
  104ed5:	ff 75 f4             	pushl  -0xc(%ebp)
  104ed8:	ff 75 f0             	pushl  -0x10(%ebp)
  104edb:	8d 83 28 d6 ff ff    	lea    -0x29d8(%ebx),%eax
  104ee1:	50                   	push   %eax
  104ee2:	6a 35                	push   $0x35
  104ee4:	8d 83 71 d4 ff ff    	lea    -0x2b8f(%ebx),%eax
  104eea:	50                   	push   %eax
  104eeb:	e8 71 e2 ff ff       	call   103161 <debug_panic>
  104ef0:	83 c4 20             	add    $0x20,%esp
  104ef3:	eb 2c                	jmp    104f21 <pgflt_handler+0xa7>
  104ef5:	83 ec 08             	sub    $0x8,%esp
  104ef8:	68 00 10 00 00       	push   $0x1000
  104efd:	ff 75 f0             	pushl  -0x10(%ebp)
  104f00:	e8 5f ef ff ff       	call   103e64 <rounddown>
  104f05:	83 c4 10             	add    $0x10,%esp
  104f08:	89 c2                	mov    %eax,%edx
  104f0a:	c7 c0 4c 0f 11 00    	mov    $0x110f4c,%eax
  104f10:	8b 00                	mov    (%eax),%eax
  104f12:	83 ec 04             	sub    $0x4,%esp
  104f15:	6a 07                	push   $0x7
  104f17:	52                   	push   %edx
  104f18:	50                   	push   %eax
  104f19:	e8 f2 0c 00 00       	call   105c10 <alloc_page>
  104f1e:	83 c4 10             	add    $0x10,%esp
  104f21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104f24:	c9                   	leave  
  104f25:	c3                   	ret    

00104f26 <checkpoint>:
  104f26:	55                   	push   %ebp
  104f27:	89 e5                	mov    %esp,%ebp
  104f29:	53                   	push   %ebx
  104f2a:	83 ec 04             	sub    $0x4,%esp
  104f2d:	e8 d9 b4 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  104f32:	05 ce 40 00 00       	add    $0x40ce,%eax
  104f37:	83 ec 0c             	sub    $0xc,%esp
  104f3a:	8d 90 59 d6 ff ff    	lea    -0x29a7(%eax),%edx
  104f40:	52                   	push   %edx
  104f41:	89 c3                	mov    %eax,%ebx
  104f43:	e8 2e e1 ff ff       	call   103076 <debug_info>
  104f48:	83 c4 10             	add    $0x10,%esp
  104f4b:	90                   	nop
  104f4c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104f4f:	c9                   	leave  
  104f50:	c3                   	ret    

00104f51 <trap>:
  104f51:	55                   	push   %ebp
  104f52:	89 e5                	mov    %esp,%ebp
  104f54:	53                   	push   %ebx
  104f55:	83 ec 04             	sub    $0x4,%esp
  104f58:	e8 b6 b4 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  104f5d:	81 c3 a3 40 00 00    	add    $0x40a3,%ebx
  104f63:	8b 45 08             	mov    0x8(%ebp),%eax
  104f66:	8b 40 28             	mov    0x28(%eax),%eax
  104f69:	83 f8 0e             	cmp    $0xe,%eax
  104f6c:	75 1d                	jne    104f8b <trap+0x3a>
  104f6e:	83 ec 0c             	sub    $0xc,%esp
  104f71:	6a 00                	push   $0x0
  104f73:	e8 58 06 00 00       	call   1055d0 <set_pdir_base>
  104f78:	83 c4 10             	add    $0x10,%esp
  104f7b:	83 ec 0c             	sub    $0xc,%esp
  104f7e:	ff 75 08             	pushl  0x8(%ebp)
  104f81:	e8 f4 fe ff ff       	call   104e7a <pgflt_handler>
  104f86:	83 c4 10             	add    $0x10,%esp
  104f89:	eb 48                	jmp    104fd3 <trap+0x82>
  104f8b:	8b 45 08             	mov    0x8(%ebp),%eax
  104f8e:	8b 40 28             	mov    0x28(%eax),%eax
  104f91:	50                   	push   %eax
  104f92:	8d 83 66 d6 ff ff    	lea    -0x299a(%ebx),%eax
  104f98:	50                   	push   %eax
  104f99:	6a 4e                	push   $0x4e
  104f9b:	8d 83 71 d4 ff ff    	lea    -0x2b8f(%ebx),%eax
  104fa1:	50                   	push   %eax
  104fa2:	e8 00 e1 ff ff       	call   1030a7 <debug_normal>
  104fa7:	83 c4 10             	add    $0x10,%esp
  104faa:	83 ec 0c             	sub    $0xc,%esp
  104fad:	ff 75 08             	pushl  0x8(%ebp)
  104fb0:	e8 54 fc ff ff       	call   104c09 <trap_dump>
  104fb5:	83 c4 10             	add    $0x10,%esp
  104fb8:	83 ec 04             	sub    $0x4,%esp
  104fbb:	8d 83 7a d6 ff ff    	lea    -0x2986(%ebx),%eax
  104fc1:	50                   	push   %eax
  104fc2:	6a 50                	push   $0x50
  104fc4:	8d 83 71 d4 ff ff    	lea    -0x2b8f(%ebx),%eax
  104fca:	50                   	push   %eax
  104fcb:	e8 91 e1 ff ff       	call   103161 <debug_panic>
  104fd0:	83 c4 10             	add    $0x10,%esp
  104fd3:	c7 c0 4c 0f 11 00    	mov    $0x110f4c,%eax
  104fd9:	8b 00                	mov    (%eax),%eax
  104fdb:	83 ec 0c             	sub    $0xc,%esp
  104fde:	50                   	push   %eax
  104fdf:	e8 ec 05 00 00       	call   1055d0 <set_pdir_base>
  104fe4:	83 c4 10             	add    $0x10,%esp
  104fe7:	83 ec 0c             	sub    $0xc,%esp
  104fea:	ff 75 08             	pushl  0x8(%ebp)
  104fed:	e8 be dd ff ff       	call   102db0 <trap_return>
  104ff2:	83 c4 10             	add    $0x10,%esp
  104ff5:	90                   	nop
  104ff6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  104ff9:	c9                   	leave  
  104ffa:	c3                   	ret    
  104ffb:	66 90                	xchg   %ax,%ax
  104ffd:	66 90                	xchg   %ax,%ax
  104fff:	90                   	nop

00105000 <kern_init>:
    #endif
}

void
kern_init (uintptr_t mbi_addr)
{
  105000:	56                   	push   %esi
  105001:	53                   	push   %ebx
  105002:	e8 0c b4 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105007:	81 c3 f9 3f 00 00    	add    $0x3ff9,%ebx
  10500d:	83 ec 10             	sub    $0x10,%esp
    #ifdef TEST
    pdir_init_kern(mbi_addr);
    #else
    paging_init (mbi_addr);
  105010:	ff 74 24 1c          	pushl  0x1c(%esp)
    #endif

    KERN_DEBUG("Kernel initialized.\n");
  105014:	8d b3 96 d6 ff ff    	lea    -0x296a(%ebx),%esi
    paging_init (mbi_addr);
  10501a:	e8 c1 0b 00 00       	call   105be0 <paging_init>
    KERN_DEBUG("Kernel initialized.\n");
  10501f:	8d 83 81 d6 ff ff    	lea    -0x297f(%ebx),%eax
  105025:	83 c4 0c             	add    $0xc,%esp
  105028:	50                   	push   %eax
  105029:	6a 69                	push   $0x69
  10502b:	56                   	push   %esi
  10502c:	e8 76 e0 ff ff       	call   1030a7 <debug_normal>
    KERN_DEBUG("In kernel main.\n\n");
  105031:	8d 83 a7 d6 ff ff    	lea    -0x2959(%ebx),%eax
  105037:	83 c4 0c             	add    $0xc,%esp
  10503a:	50                   	push   %eax
  10503b:	6a 19                	push   $0x19
  10503d:	56                   	push   %esi
  10503e:	e8 64 e0 ff ff       	call   1030a7 <debug_normal>
      monitor(NULL);
  105043:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10504a:	e8 1c f5 ff ff       	call   10456b <monitor>

    kern_main ();
}
  10504f:	83 c4 14             	add    $0x14,%esp
  105052:	5b                   	pop    %ebx
  105053:	5e                   	pop    %esi
  105054:	c3                   	ret    
  105055:	66 90                	xchg   %ax,%ax
  105057:	90                   	nop
  105058:	02 b0 ad 1b 03 00    	add    0x31bad(%eax),%dh
  10505e:	00 00                	add    %al,(%eax)
  105060:	fb                   	sti    
  105061:	4f                   	dec    %edi
  105062:	52                   	push   %edx
  105063:	e4                   	.byte 0xe4

00105064 <start>:
  105064:	fa                   	cli    
  105065:	3d 02 b0 ad 2b       	cmp    $0x2badb002,%eax
  10506a:	75 27                	jne    105093 <spin>
  10506c:	89 1d 94 50 10 00    	mov    %ebx,0x105094
  105072:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
  105079:	34 12 
  10507b:	6a 02                	push   $0x2
  10507d:	9d                   	popf   
  10507e:	bd 00 00 00 00       	mov    $0x0,%ebp
  105083:	bc 00 30 91 00       	mov    $0x913000,%esp
  105088:	ff 35 94 50 10 00    	pushl  0x105094
  10508e:	e8 6d ff ff ff       	call   105000 <kern_init>

00105093 <spin>:
  105093:	f4                   	hlt    

00105094 <multiboot_ptr>:
  105094:	00 00                	add    %al,(%eax)
  105096:	00 00                	add    %al,(%eax)
  105098:	66 90                	xchg   %ax,%ax
  10509a:	66 90                	xchg   %ax,%ax
  10509c:	66 90                	xchg   %ax,%ax
  10509e:	66 90                	xchg   %ax,%ax

001050a0 <get_nps>:
static struct ATStruct AT[1 << 20];  

//The getter function for NUM_PAGES.
unsigned int
get_nps(void)
{
  1050a0:	e8 66 b3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1050a5:	05 5b 3f 00 00       	add    $0x3f5b,%eax
	return NUM_PAGES;
  1050aa:	8b 80 60 7f 80 00    	mov    0x807f60(%eax),%eax
}
  1050b0:	c3                   	ret    
  1050b1:	eb 0d                	jmp    1050c0 <set_nps>
  1050b3:	90                   	nop
  1050b4:	90                   	nop
  1050b5:	90                   	nop
  1050b6:	90                   	nop
  1050b7:	90                   	nop
  1050b8:	90                   	nop
  1050b9:	90                   	nop
  1050ba:	90                   	nop
  1050bb:	90                   	nop
  1050bc:	90                   	nop
  1050bd:	90                   	nop
  1050be:	90                   	nop
  1050bf:	90                   	nop

001050c0 <set_nps>:

//The setter function for NUM_PAGES.
void
set_nps(unsigned int nps)
{
	NUM_PAGES = nps;
  1050c0:	8b 54 24 04          	mov    0x4(%esp),%edx
  1050c4:	e8 42 b3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1050c9:	05 37 3f 00 00       	add    $0x3f37,%eax
  1050ce:	89 90 60 7f 80 00    	mov    %edx,0x807f60(%eax)
}
  1050d4:	c3                   	ret    
  1050d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1050d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001050e0 <at_is_norm>:
  */
unsigned int
at_is_norm(unsigned int page_index)
{
  //TODO
  if(AT[page_index].perm > 1)
  1050e0:	8b 54 24 04          	mov    0x4(%esp),%edx
  1050e4:	e8 22 b3 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1050e9:	05 17 3f 00 00       	add    $0x3f17,%eax
  1050ee:	83 bc d0 60 7f 00 00 	cmpl   $0x1,0x7f60(%eax,%edx,8)
  1050f5:	01 
  1050f6:	0f 97 c0             	seta   %al
  1050f9:	0f b6 c0             	movzbl %al,%eax
    return 1;
  return 0;
}
  1050fc:	c3                   	ret    
  1050fd:	8d 76 00             	lea    0x0(%esi),%esi

00105100 <at_set_perm>:
  *  - It also marks the page as unallocated.
  * Hint: See the definition of ATStruct for allocated.
  */
void
at_set_perm(unsigned int page_index, unsigned int norm_val)
{
  105100:	8b 54 24 04          	mov    0x4(%esp),%edx
  //TODO
  AT[page_index].perm = norm_val;
  105104:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  105108:	e8 fe b2 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  10510d:	05 f3 3e 00 00       	add    $0x3ef3,%eax
  105112:	89 8c d0 60 7f 00 00 	mov    %ecx,0x7f60(%eax,%edx,8)
  AT[page_index].allocated = 0;
  105119:	c7 84 d0 64 7f 00 00 	movl   $0x0,0x7f64(%eax,%edx,8)
  105120:	00 00 00 00 
}
  105124:	c3                   	ret    
  105125:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105130 <at_is_allocated>:
  */
unsigned int
at_is_allocated(unsigned int page_index)
{
  //TODO
  if(AT[page_index].allocated == 0)
  105130:	8b 54 24 04          	mov    0x4(%esp),%edx
  105134:	e8 d2 b2 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  105139:	05 c7 3e 00 00       	add    $0x3ec7,%eax
  10513e:	8b 84 d0 64 7f 00 00 	mov    0x7f64(%eax,%edx,8),%eax
  105145:	85 c0                	test   %eax,%eax
  105147:	0f 95 c0             	setne  %al
  10514a:	0f b6 c0             	movzbl %al,%eax
    return 0;
  return 1;
}
  10514d:	c3                   	ret    
  10514e:	66 90                	xchg   %ax,%ax

00105150 <at_set_allocated>:
  */
void
at_set_allocated(unsigned int page_index, unsigned int allocated)
{
  //TODO
  AT[page_index].allocated = allocated;
  105150:	8b 54 24 04          	mov    0x4(%esp),%edx
  105154:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  105158:	e8 ae b2 ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  10515d:	05 a3 3e 00 00       	add    $0x3ea3,%eax
  105162:	89 8c d0 64 7f 00 00 	mov    %ecx,0x7f64(%eax,%edx,8)
}
  105169:	c3                   	ret    
  10516a:	66 90                	xchg   %ax,%ax
  10516c:	66 90                	xchg   %ax,%ax
  10516e:	66 90                	xchg   %ax,%ax

00105170 <pmem_init>:
  *
  *  - Review import.h in the current directory for the list of available getter and setter functions.
  */
void
pmem_init(unsigned int mbi_addr)
{
  105170:	55                   	push   %ebp
  105171:	57                   	push   %edi
  105172:	56                   	push   %esi
  105173:	53                   	push   %ebx
  105174:	e8 9a b2 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105179:	81 c3 87 3e 00 00    	add    $0x3e87,%ebx
  10517f:	83 ec 28             	sub    $0x28,%esp
  unsigned int numRows, lastAddr, i, row, start, stop, addrStart, addrStop;
  char found;

  //Calls the lower layer initializatin primitives.
  //The parameter mbi_addr shell not be used in the further code.
	devinit(mbi_addr);
  105182:	ff 74 24 3c          	pushl  0x3c(%esp)
  105186:	e8 11 ba ff ff       	call   100b9c <devinit>
    * Hint 1: Review the import.h file for available functions.
    * Hint 2: Think of it as the highest address possible in the ranges of the memory map table,
    *         divided by the page size plus 1.
    */
  // TODO
  numRows = get_size();
  10518b:	e8 5b bf ff ff       	call   1010eb <get_size>
  lastAddr = get_mms(numRows - 1) + get_mml(numRows - 1);
  105190:	8d 78 ff             	lea    -0x1(%eax),%edi
  numRows = get_size();
  105193:	89 44 24 10          	mov    %eax,0x10(%esp)
  lastAddr = get_mms(numRows - 1) + get_mml(numRows - 1);
  105197:	89 3c 24             	mov    %edi,(%esp)
  10519a:	e8 61 bf ff ff       	call   101100 <get_mms>
  10519f:	89 c6                	mov    %eax,%esi
  1051a1:	89 3c 24             	mov    %edi,(%esp)
  1051a4:	e8 bd bf ff ff       	call   101166 <get_mml>
  1051a9:	01 c6                	add    %eax,%esi
  nps = lastAddr / PAGESIZE + 1;
  1051ab:	c1 ee 0c             	shr    $0xc,%esi
  1051ae:	8d 6e 01             	lea    0x1(%esi),%ebp
  //   stop = start + get_mml(row);
  //   dprintf("\nrow = %u, start = %u, range = %u, stop = %u\n", row, start, get_mml(row), stop);
  // }
  // dprintf("\nTRUE = %d, FALSE = %d\n", TRUE, FALSE);

  for(i = 0; i < nps; i++){
  1051b1:	31 f6                	xor    %esi,%esi
	set_nps(nps); // Setting the value computed above to NUM_PAGES.
  1051b3:	89 2c 24             	mov    %ebp,(%esp)
  1051b6:	e8 05 ff ff ff       	call   1050c0 <set_nps>
  1051bb:	83 c4 10             	add    $0x10,%esp
  1051be:	66 90                	xchg   %ax,%ax
    // Kernel pages
    if(i < VM_USERLO_PI || i >= VM_USERHI_PI)
  1051c0:	8d 86 00 00 fc ff    	lea    -0x40000(%esi),%eax
  1051c6:	3d ff ff 0a 00       	cmp    $0xaffff,%eax
  1051cb:	76 23                	jbe    1051f0 <pmem_init+0x80>
      at_set_perm(i, 1);
  1051cd:	83 ec 08             	sub    $0x8,%esp
  1051d0:	6a 01                	push   $0x1
  1051d2:	56                   	push   %esi
  1051d3:	e8 28 ff ff ff       	call   105100 <at_set_perm>
  1051d8:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < nps; i++){
  1051db:	83 c6 01             	add    $0x1,%esi
  1051de:	39 f5                	cmp    %esi,%ebp
  1051e0:	75 de                	jne    1051c0 <pmem_init+0x50>
      if(found == FALSE)
        at_set_perm(i, 0);
    }
  }

  1051e2:	83 c4 1c             	add    $0x1c,%esp
  1051e5:	5b                   	pop    %ebx
  1051e6:	5e                   	pop    %esi
  1051e7:	5f                   	pop    %edi
  1051e8:	5d                   	pop    %ebp
  1051e9:	c3                   	ret    
  1051ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      addrStart = i*PAGESIZE;
  1051f0:	89 f0                	mov    %esi,%eax
  1051f2:	c1 e0 0c             	shl    $0xc,%eax
  1051f5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1051f9:	8d 90 ff 0f 00 00    	lea    0xfff(%eax),%edx
      for(row = 0; row < numRows; row++){
  1051ff:	8b 04 24             	mov    (%esp),%eax
  105202:	85 c0                	test   %eax,%eax
  105204:	74 79                	je     10527f <pmem_init+0x10f>
  105206:	31 ff                	xor    %edi,%edi
  105208:	89 6c 24 08          	mov    %ebp,0x8(%esp)
  10520c:	89 74 24 0c          	mov    %esi,0xc(%esp)
  105210:	89 fd                	mov    %edi,%ebp
  105212:	89 d7                	mov    %edx,%edi
  105214:	eb 12                	jmp    105228 <pmem_init+0xb8>
  105216:	8d 76 00             	lea    0x0(%esi),%esi
  105219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  105220:	83 c5 01             	add    $0x1,%ebp
  105223:	39 2c 24             	cmp    %ebp,(%esp)
  105226:	74 4f                	je     105277 <pmem_init+0x107>
        start = get_mms(row);
  105228:	83 ec 0c             	sub    $0xc,%esp
  10522b:	55                   	push   %ebp
  10522c:	e8 cf be ff ff       	call   101100 <get_mms>
  105231:	89 c6                	mov    %eax,%esi
        stop = start + get_mml(row);
  105233:	89 2c 24             	mov    %ebp,(%esp)
  105236:	e8 2b bf ff ff       	call   101166 <get_mml>
  10523b:	01 f0                	add    %esi,%eax
        if(addrStart >= start && addrStop < stop){
  10523d:	83 c4 10             	add    $0x10,%esp
  105240:	39 f8                	cmp    %edi,%eax
  105242:	76 dc                	jbe    105220 <pmem_init+0xb0>
  105244:	39 74 24 04          	cmp    %esi,0x4(%esp)
  105248:	72 d6                	jb     105220 <pmem_init+0xb0>
  10524a:	8b 74 24 0c          	mov    0xc(%esp),%esi
  10524e:	89 ef                	mov    %ebp,%edi
          if(is_usable(row))
  105250:	83 ec 0c             	sub    $0xc,%esp
  105253:	8b 6c 24 14          	mov    0x14(%esp),%ebp
  105257:	57                   	push   %edi
  105258:	e8 79 bf ff ff       	call   1011d6 <is_usable>
  10525d:	83 c4 10             	add    $0x10,%esp
  105260:	85 c0                	test   %eax,%eax
  105262:	74 1b                	je     10527f <pmem_init+0x10f>
            at_set_perm(i, 2);
  105264:	83 ec 08             	sub    $0x8,%esp
  105267:	6a 02                	push   $0x2
  105269:	56                   	push   %esi
  10526a:	e8 91 fe ff ff       	call   105100 <at_set_perm>
  10526f:	83 c4 10             	add    $0x10,%esp
  105272:	e9 64 ff ff ff       	jmp    1051db <pmem_init+0x6b>
  105277:	8b 6c 24 08          	mov    0x8(%esp),%ebp
  10527b:	8b 74 24 0c          	mov    0xc(%esp),%esi
        at_set_perm(i, 0);
  10527f:	83 ec 08             	sub    $0x8,%esp
  105282:	6a 00                	push   $0x0
  105284:	56                   	push   %esi
  105285:	e8 76 fe ff ff       	call   105100 <at_set_perm>
  10528a:	83 c4 10             	add    $0x10,%esp
  10528d:	e9 49 ff ff ff       	jmp    1051db <pmem_init+0x6b>
  105292:	66 90                	xchg   %ax,%ax
  105294:	66 90                	xchg   %ax,%ax
  105296:	66 90                	xchg   %ax,%ax
  105298:	66 90                	xchg   %ax,%ax
  10529a:	66 90                	xchg   %ax,%ax
  10529c:	66 90                	xchg   %ax,%ax
  10529e:	66 90                	xchg   %ax,%ax

001052a0 <palloc>:
  */
static unsigned int START = VM_USERLO_PI;

unsigned int
palloc()
{
  1052a0:	56                   	push   %esi
  1052a1:	53                   	push   %ebx
  1052a2:	e8 6c b1 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1052a7:	81 c3 59 3d 00 00    	add    $0x3d59,%ebx
  1052ad:	83 ec 04             	sub    $0x4,%esp
  // TODO
  // dprintf("\nSTART = %u\n", START);
  unsigned int i;
  for(i = START; i < VM_USERHI_PI; i++){
  1052b0:	8b b3 00 30 00 00    	mov    0x3000(%ebx),%esi
  1052b6:	81 fe ff ff 0e 00    	cmp    $0xeffff,%esi
  1052bc:	76 0d                	jbe    1052cb <palloc+0x2b>
  1052be:	eb 50                	jmp    105310 <palloc+0x70>
  1052c0:	83 c6 01             	add    $0x1,%esi
  1052c3:	81 fe 00 00 0f 00    	cmp    $0xf0000,%esi
  1052c9:	74 45                	je     105310 <palloc+0x70>
    if(at_is_norm(i) && !at_is_allocated(i)){
  1052cb:	83 ec 0c             	sub    $0xc,%esp
  1052ce:	56                   	push   %esi
  1052cf:	e8 0c fe ff ff       	call   1050e0 <at_is_norm>
  1052d4:	83 c4 10             	add    $0x10,%esp
  1052d7:	85 c0                	test   %eax,%eax
  1052d9:	74 e5                	je     1052c0 <palloc+0x20>
  1052db:	83 ec 0c             	sub    $0xc,%esp
  1052de:	56                   	push   %esi
  1052df:	e8 4c fe ff ff       	call   105130 <at_is_allocated>
  1052e4:	83 c4 10             	add    $0x10,%esp
  1052e7:	85 c0                	test   %eax,%eax
  1052e9:	75 d5                	jne    1052c0 <palloc+0x20>
      START = i+1;
      at_set_allocated(i, 1);
  1052eb:	83 ec 08             	sub    $0x8,%esp
      START = i+1;
  1052ee:	8d 46 01             	lea    0x1(%esi),%eax
      at_set_allocated(i, 1);
  1052f1:	6a 01                	push   $0x1
  1052f3:	56                   	push   %esi
      START = i+1;
  1052f4:	89 83 00 30 00 00    	mov    %eax,0x3000(%ebx)
      at_set_allocated(i, 1);
  1052fa:	e8 51 fe ff ff       	call   105150 <at_set_allocated>
      return i;
  1052ff:	83 c4 10             	add    $0x10,%esp
    }
  }

  return 0;
} 
  105302:	89 f0                	mov    %esi,%eax
  105304:	83 c4 04             	add    $0x4,%esp
  105307:	5b                   	pop    %ebx
  105308:	5e                   	pop    %esi
  105309:	c3                   	ret    
  10530a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  return 0;
  105310:	31 f6                	xor    %esi,%esi
} 
  105312:	83 c4 04             	add    $0x4,%esp
  105315:	89 f0                	mov    %esi,%eax
  105317:	5b                   	pop    %ebx
  105318:	5e                   	pop    %esi
  105319:	c3                   	ret    
  10531a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105320 <pfree>:
  * Hint: Simple. You have already implemented the functions required to check if a page
  * 	  is allocated and to set the allocation status of a page index. (See import.h)
  */
void
pfree(unsigned int pfree_index)
{
  105320:	56                   	push   %esi
  105321:	53                   	push   %ebx
  105322:	e8 ec b0 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105327:	81 c3 d9 3c 00 00    	add    $0x3cd9,%ebx
  10532d:	83 ec 10             	sub    $0x10,%esp
  105330:	8b 74 24 1c          	mov    0x1c(%esp),%esi
  // TODO
  if(at_is_allocated(pfree_index)){
  105334:	56                   	push   %esi
  105335:	e8 f6 fd ff ff       	call   105130 <at_is_allocated>
  10533a:	83 c4 10             	add    $0x10,%esp
  10533d:	85 c0                	test   %eax,%eax
  10533f:	75 0f                	jne    105350 <pfree+0x30>
    at_set_allocated(pfree_index, 0);
    if(pfree_index < START)
      START = pfree_index;
  }
}
  105341:	83 c4 04             	add    $0x4,%esp
  105344:	5b                   	pop    %ebx
  105345:	5e                   	pop    %esi
  105346:	c3                   	ret    
  105347:	89 f6                	mov    %esi,%esi
  105349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    at_set_allocated(pfree_index, 0);
  105350:	83 ec 08             	sub    $0x8,%esp
  105353:	6a 00                	push   $0x0
  105355:	56                   	push   %esi
  105356:	e8 f5 fd ff ff       	call   105150 <at_set_allocated>
    if(pfree_index < START)
  10535b:	83 c4 10             	add    $0x10,%esp
  10535e:	39 b3 00 30 00 00    	cmp    %esi,0x3000(%ebx)
  105364:	76 db                	jbe    105341 <pfree+0x21>
      START = pfree_index;
  105366:	89 b3 00 30 00 00    	mov    %esi,0x3000(%ebx)
}
  10536c:	83 c4 04             	add    $0x4,%esp
  10536f:	5b                   	pop    %ebx
  105370:	5e                   	pop    %esi
  105371:	c3                   	ret    
  105372:	66 90                	xchg   %ax,%ax
  105374:	66 90                	xchg   %ax,%ax
  105376:	66 90                	xchg   %ax,%ax
  105378:	66 90                	xchg   %ax,%ax
  10537a:	66 90                	xchg   %ax,%ax
  10537c:	66 90                	xchg   %ax,%ax
  10537e:	66 90                	xchg   %ax,%ax

00105380 <container_init>:
/**
  * Initializes the container data for the root process (the one with index 0).
  * The root process is the one that gets spawned first by the kernel.
  */
void container_init(unsigned int mbi_addr)
{
  105380:	55                   	push   %ebp
  105381:	57                   	push   %edi
  105382:	56                   	push   %esi
  105383:	53                   	push   %ebx
  105384:	e8 8a b0 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105389:	81 c3 77 3c 00 00    	add    $0x3c77,%ebx
  10538f:	83 ec 18             	sub    $0x18,%esp
  unsigned int real_quota;
  // TODO: define your local variables here.
  unsigned int i, nps;

  pmem_init(mbi_addr);
  105392:	ff 74 24 2c          	pushl  0x2c(%esp)
  105396:	e8 d5 fd ff ff       	call   105170 <pmem_init>
    *  - It should be the number of the unallocated pages with the normal permission
    *    in the physical memory allocation table (AT).
    *  - We have already implemented functions that deal with AT data-structure in MATIntro layer.
    *    (see import.h for available functions)
    */
  nps = get_nps();
  10539b:	e8 00 fd ff ff       	call   1050a0 <get_nps>
  for(i = 0; i < nps; i++)
  1053a0:	83 c4 10             	add    $0x10,%esp
  1053a3:	85 c0                	test   %eax,%eax
  1053a5:	0f 84 95 00 00 00    	je     105440 <container_init+0xc0>
  1053ab:	89 c7                	mov    %eax,%edi
  1053ad:	31 f6                	xor    %esi,%esi
  real_quota = 0;
  1053af:	31 ed                	xor    %ebp,%ebp
  1053b1:	eb 0c                	jmp    1053bf <container_init+0x3f>
  1053b3:	90                   	nop
  1053b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < nps; i++)
  1053b8:	83 c6 01             	add    $0x1,%esi
  1053bb:	39 f7                	cmp    %esi,%edi
  1053bd:	74 29                	je     1053e8 <container_init+0x68>
    if(at_is_norm(i) && !at_is_allocated(i))
  1053bf:	83 ec 0c             	sub    $0xc,%esp
  1053c2:	56                   	push   %esi
  1053c3:	e8 18 fd ff ff       	call   1050e0 <at_is_norm>
  1053c8:	83 c4 10             	add    $0x10,%esp
  1053cb:	85 c0                	test   %eax,%eax
  1053cd:	74 e9                	je     1053b8 <container_init+0x38>
  1053cf:	83 ec 0c             	sub    $0xc,%esp
  1053d2:	56                   	push   %esi
  1053d3:	e8 58 fd ff ff       	call   105130 <at_is_allocated>
  1053d8:	83 c4 10             	add    $0x10,%esp
      real_quota++;
  1053db:	83 f8 01             	cmp    $0x1,%eax
  1053de:	83 d5 00             	adc    $0x0,%ebp
  for(i = 0; i < nps; i++)
  1053e1:	83 c6 01             	add    $0x1,%esi
  1053e4:	39 f7                	cmp    %esi,%edi
  1053e6:	75 d7                	jne    1053bf <container_init+0x3f>
  1053e8:	89 ee                	mov    %ebp,%esi

  KERN_DEBUG("\nreal quota: %d\n\n", real_quota);
  1053ea:	8d 83 b9 d6 ff ff    	lea    -0x2947(%ebx),%eax
  1053f0:	55                   	push   %ebp
  1053f1:	50                   	push   %eax
  1053f2:	8d 83 cc d6 ff ff    	lea    -0x2934(%ebx),%eax
  1053f8:	6a 3a                	push   $0x3a
  1053fa:	50                   	push   %eax
  1053fb:	e8 a7 dc ff ff       	call   1030a7 <debug_normal>

  CONTAINER[0].quota = real_quota;
  105400:	89 b3 80 7f 80 00    	mov    %esi,0x807f80(%ebx)
  CONTAINER[0].usage = 0;
  105406:	c7 83 84 7f 80 00 00 	movl   $0x0,0x807f84(%ebx)
  10540d:	00 00 00 
  CONTAINER[0].parent = 0;
  105410:	c7 83 88 7f 80 00 00 	movl   $0x0,0x807f88(%ebx)
  105417:	00 00 00 
  CONTAINER[0].nchildren = 0;
  10541a:	c7 83 8c 7f 80 00 00 	movl   $0x0,0x807f8c(%ebx)
  105421:	00 00 00 
  CONTAINER[0].used = 1;
  105424:	c7 83 90 7f 80 00 01 	movl   $0x1,0x807f90(%ebx)
  10542b:	00 00 00 
}
  10542e:	83 c4 1c             	add    $0x1c,%esp
  105431:	5b                   	pop    %ebx
  105432:	5e                   	pop    %esi
  105433:	5f                   	pop    %edi
  105434:	5d                   	pop    %ebp
  105435:	c3                   	ret    
  105436:	8d 76 00             	lea    0x0(%esi),%esi
  105439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  real_quota = 0;
  105440:	31 ed                	xor    %ebp,%ebp
  for(i = 0; i < nps; i++)
  105442:	31 f6                	xor    %esi,%esi
  105444:	eb a4                	jmp    1053ea <container_init+0x6a>
  105446:	8d 76 00             	lea    0x0(%esi),%esi
  105449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105450 <container_get_parent>:
/** TASK 2:
  * * Get the id of parent process of process # [id]
  * Hint: Simply return the parent field from CONTAINER for process id.
  */
unsigned int container_get_parent(unsigned int id)
{
  105450:	8b 44 24 04          	mov    0x4(%esp),%eax
  105454:	e8 b6 af ff ff       	call   10040f <__x86.get_pc_thunk.dx>
  105459:	81 c2 a7 3b 00 00    	add    $0x3ba7,%edx
  // TODO
  return CONTAINER[id].parent;
  10545f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  105462:	8b 84 82 88 7f 80 00 	mov    0x807f88(%edx,%eax,4),%eax
}
  105469:	c3                   	ret    
  10546a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105470 <container_get_nchildren>:

/** TASK 3:
  * * Get the number of children of process # [id]
  */
unsigned int container_get_nchildren(unsigned int id)
{
  105470:	8b 44 24 04          	mov    0x4(%esp),%eax
  105474:	e8 96 af ff ff       	call   10040f <__x86.get_pc_thunk.dx>
  105479:	81 c2 87 3b 00 00    	add    $0x3b87,%edx
  // TODO
  return CONTAINER[id].nchildren;
  10547f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  105482:	8b 84 82 8c 7f 80 00 	mov    0x807f8c(%edx,%eax,4),%eax
}
  105489:	c3                   	ret    
  10548a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00105490 <container_get_quota>:

/** TASK 4:
  * * Get the maximum memory quota of process # [id]
  */
unsigned int container_get_quota(unsigned int id)
{
  105490:	8b 44 24 04          	mov    0x4(%esp),%eax
  105494:	e8 76 af ff ff       	call   10040f <__x86.get_pc_thunk.dx>
  105499:	81 c2 67 3b 00 00    	add    $0x3b67,%edx
  // TODO
  return CONTAINER[id].quota;
  10549f:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1054a2:	8b 84 82 80 7f 80 00 	mov    0x807f80(%edx,%eax,4),%eax
}
  1054a9:	c3                   	ret    
  1054aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001054b0 <container_get_usage>:

/** TASK 5:
  * * Get the current memory usage of process # [id]
  */
unsigned int container_get_usage(unsigned int id)
{
  1054b0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1054b4:	e8 56 af ff ff       	call   10040f <__x86.get_pc_thunk.dx>
  1054b9:	81 c2 47 3b 00 00    	add    $0x3b47,%edx
  // TODO
  return CONTAINER[id].usage;
  1054bf:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1054c2:	8b 84 82 84 7f 80 00 	mov    0x807f84(%edx,%eax,4),%eax
}
  1054c9:	c3                   	ret    
  1054ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

001054d0 <container_can_consume>:
  * * Determine whether the process # [id] can consume extra
  *   [n] pages of memory. If so, return 1, otherwise, return 0.
  * Hint 1: Check the definition of available fields in SContainer data-structure.
  */
unsigned int container_can_consume(unsigned int id, unsigned int n)
{
  1054d0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1054d4:	e8 36 af ff ff       	call   10040f <__x86.get_pc_thunk.dx>
  1054d9:	81 c2 27 3b 00 00    	add    $0x3b27,%edx
  // TODO
  if(CONTAINER[id].quota - CONTAINER[id].usage >= n)
  1054df:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  1054e2:	8b 84 8a 80 7f 80 00 	mov    0x807f80(%edx,%ecx,4),%eax
  1054e9:	2b 84 8a 84 7f 80 00 	sub    0x807f84(%edx,%ecx,4),%eax
  1054f0:	3b 44 24 08          	cmp    0x8(%esp),%eax
  1054f4:	0f 93 c0             	setae  %al
  1054f7:	0f b6 c0             	movzbl %al,%eax
    return 1;
  return 0;
}
  1054fa:	c3                   	ret    
  1054fb:	90                   	nop
  1054fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105500 <container_split>:
/**
 * Dedicates [quota] pages of memory for a new child process.
 * returns the container index for the new child process.
 */
unsigned int container_split(unsigned int id, unsigned int quota)
{
  105500:	57                   	push   %edi
  105501:	56                   	push   %esi
  105502:	53                   	push   %ebx
  105503:	8b 54 24 10          	mov    0x10(%esp),%edx
  105507:	e8 07 af ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  10550c:	81 c3 f4 3a 00 00    	add    $0x3af4,%ebx
  105512:	8b 74 24 14          	mov    0x14(%esp),%esi
  unsigned int child, nc;

  nc = CONTAINER[id].nchildren;
  105516:	8d 04 92             	lea    (%edx,%edx,4),%eax
  105519:	8d 8c 83 80 7f 80 00 	lea    0x807f80(%ebx,%eax,4),%ecx
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process
  105520:	8d 44 52 01          	lea    0x1(%edx,%edx,2),%eax
  nc = CONTAINER[id].nchildren;
  105524:	8b 79 0c             	mov    0xc(%ecx),%edi
    * Hint 1: Read about the parent/child relationship maintained in you kernel 
    *         (available at the top of this page and handout)
    */
  // Updates parent
  CONTAINER[id].nchildren++;
  CONTAINER[id].usage += quota;
  105527:	01 71 04             	add    %esi,0x4(%ecx)
  child = id * MAX_CHILDREN + 1 + nc; //container index for the child process
  10552a:	01 f8                	add    %edi,%eax
  CONTAINER[id].nchildren++;
  10552c:	83 c7 01             	add    $0x1,%edi
  10552f:	89 79 0c             	mov    %edi,0xc(%ecx)

  // Updates child
  CONTAINER[child].quota = quota;
  105532:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
  105535:	c1 e1 02             	shl    $0x2,%ecx
  105538:	8d bc 0b 80 7f 80 00 	lea    0x807f80(%ebx,%ecx,1),%edi
  10553f:	89 37                	mov    %esi,(%edi)
  CONTAINER[child].parent = id;
  105541:	89 57 08             	mov    %edx,0x8(%edi)
  CONTAINER[child].usage = 0;
  105544:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%edi)
  CONTAINER[child].nchildren = 0;
  10554b:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
  CONTAINER[child].used = 1;
  105552:	c7 47 10 01 00 00 00 	movl   $0x1,0x10(%edi)

  return child;
}
  105559:	5b                   	pop    %ebx
  10555a:	5e                   	pop    %esi
  10555b:	5f                   	pop    %edi
  10555c:	c3                   	ret    
  10555d:	8d 76 00             	lea    0x0(%esi),%esi

00105560 <container_alloc>:
  * * 1. Allocates one more page for process # [id], given that its usage would not exceed the quota.
  * * 2. Update the contained structure to reflect the container structure should be updated accordingly after the allocation.
  * returns the page index of the allocated page, or 0 in the case of failure.
  */
unsigned int container_alloc(unsigned int id)
{
  105560:	56                   	push   %esi
  105561:	53                   	push   %ebx
  105562:	e8 ac ae ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105567:	81 c3 99 3a 00 00    	add    $0x3a99,%ebx
  10556d:	83 ec 04             	sub    $0x4,%esp
  105570:	8b 44 24 10          	mov    0x10(%esp),%eax
  /*
   * TODO: implement the function here.
   */
  if(CONTAINER[id].usage + 1 <= CONTAINER[id].quota){
  105574:	8d 14 80             	lea    (%eax,%eax,4),%edx
  105577:	31 c0                	xor    %eax,%eax
  105579:	c1 e2 02             	shl    $0x2,%edx
  10557c:	8d b4 13 80 7f 80 00 	lea    0x807f80(%ebx,%edx,1),%esi
  105583:	8b 4e 04             	mov    0x4(%esi),%ecx
  105586:	3b 8c 13 80 7f 80 00 	cmp    0x807f80(%ebx,%edx,1),%ecx
  10558d:	7d 0b                	jge    10559a <container_alloc+0x3a>
    CONTAINER[id].usage++;
  10558f:	83 c1 01             	add    $0x1,%ecx
  105592:	89 4e 04             	mov    %ecx,0x4(%esi)
    return palloc();
  105595:	e8 06 fd ff ff       	call   1052a0 <palloc>
  }
  return 0;
}
  10559a:	83 c4 04             	add    $0x4,%esp
  10559d:	5b                   	pop    %ebx
  10559e:	5e                   	pop    %esi
  10559f:	c3                   	ret    

001055a0 <container_free>:
  * Hint: You have already implemented functions:
  *  - to check if a page_index is allocated
  *  - to free a page_index in MATOp layer.
  */
void container_free(unsigned int id, unsigned int page_index)
{
  1055a0:	53                   	push   %ebx
  1055a1:	e8 6d ae ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1055a6:	81 c3 5a 3a 00 00    	add    $0x3a5a,%ebx
  1055ac:	83 ec 14             	sub    $0x14,%esp
  1055af:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  // TODO
  CONTAINER[id].usage--;
  pfree(page_index);
  1055b3:	ff 74 24 20          	pushl  0x20(%esp)
  CONTAINER[id].usage--;
  1055b7:	8d 04 80             	lea    (%eax,%eax,4),%eax
  1055ba:	83 ac 83 84 7f 80 00 	subl   $0x1,0x807f84(%ebx,%eax,4)
  1055c1:	01 
  pfree(page_index);
  1055c2:	e8 59 fd ff ff       	call   105320 <pfree>
}
  1055c7:	83 c4 18             	add    $0x18,%esp
  1055ca:	5b                   	pop    %ebx
  1055cb:	c3                   	ret    
  1055cc:	66 90                	xchg   %ax,%ax
  1055ce:	66 90                	xchg   %ax,%ax

001055d0 <set_pdir_base>:

/** TASK 1:
  * * Set the CR3 register with the start address of the page structure for process # [index]
  */
void set_pdir_base(unsigned int index)
{
  1055d0:	53                   	push   %ebx
  1055d1:	e8 3d ae ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1055d6:	81 c3 2a 3a 00 00    	add    $0x3a2a,%ebx
  1055dc:	83 ec 14             	sub    $0x14,%esp
    // TODO
    // dprintf("\nPDirPool[index][0] = %d\n", PDirPool[index]);
    set_cr3((unsigned int)PDirPool[index]);
  1055df:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  1055e3:	c1 e0 0c             	shl    $0xc,%eax
  1055e6:	81 c0 00 70 d5 00    	add    $0xd57000,%eax
  1055ec:	50                   	push   %eax
  1055ed:	e8 54 bc ff ff       	call   101246 <set_cr3>
    // int i;
    // for(i = 0; i < NUM_IDS; i++){
    //   dprintf("i = %d, pde = %u\n", i, (unsigned int)PDirPool[i][300]);
    // }

}
  1055f2:	83 c4 18             	add    $0x18,%esp
  1055f5:	5b                   	pop    %ebx
  1055f6:	c3                   	ret    
  1055f7:	89 f6                	mov    %esi,%esi
  1055f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105600 <get_pdir_entry>:
/** TASK 2:
  * * Return the page directory entry # [pde_index] of the process # [proc_index]
  * - This can be used to test whether the page directory entry is mapped
  */
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
  105600:	e8 06 ae ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  105605:	05 fb 39 00 00       	add    $0x39fb,%eax
    // TODO
    return (unsigned int)PDirPool[proc_index][pde_index];
  10560a:	c7 c2 00 70 d5 00    	mov    $0xd57000,%edx
  105610:	8b 44 24 04          	mov    0x4(%esp),%eax
  105614:	c1 e0 0a             	shl    $0xa,%eax
  105617:	03 44 24 08          	add    0x8(%esp),%eax
  10561b:	8b 04 82             	mov    (%edx,%eax,4),%eax
}   
  10561e:	c3                   	ret    
  10561f:	90                   	nop

00105620 <set_pdir_entry>:
  * - You should also set the permissions PTE_P, PTE_W, and PTE_U
  * Hint 1: PT_PERM_PTU is defined for you.
  * Hint 2: 
  */
void set_pdir_entry(unsigned int proc_index, unsigned int pde_index, unsigned int page_index)
{
  105620:	e8 e6 ad ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  105625:	05 db 39 00 00       	add    $0x39db,%eax
    // TODO
    // PDirPool[page_index] = IDPTbl[proc_index][pde_index];
    PDirPool[proc_index][pde_index] = (char*)((page_index<<12) | PT_PERM_PTU);
  10562a:	8b 54 24 0c          	mov    0xc(%esp),%edx
  10562e:	c7 c1 00 70 d5 00    	mov    $0xd57000,%ecx
  105634:	8b 44 24 04          	mov    0x4(%esp),%eax
  105638:	c1 e2 0c             	shl    $0xc,%edx
  10563b:	c1 e0 0a             	shl    $0xa,%eax
  10563e:	03 44 24 08          	add    0x8(%esp),%eax
  105642:	83 ca 07             	or     $0x7,%edx
  105645:	89 14 81             	mov    %edx,(%ecx,%eax,4)
    // dprintf("\nPDirPool[proc][pde] = %u\n", PDirPool[proc_index][pde_index]);
}   
  105648:	c3                   	ret    
  105649:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105650 <set_pdir_entry_identity>:
  * - You should also set the permissions PTE_P, PTE_W, and PTE_U
  * - This will be used to map the page directory entry to identity page table.
  * Hint 1: Cast the first entry of IDPTbl[pde_index] to char *.
  */
void set_pdir_entry_identity(unsigned int proc_index, unsigned int pde_index)
{   
  105650:	53                   	push   %ebx
    // TODO
    PDirPool[proc_index][pde_index] = (char*)((unsigned int)IDPTbl[pde_index] | PT_PERM_PTU);
  105651:	8b 54 24 08          	mov    0x8(%esp),%edx
{   
  105655:	8b 44 24 0c          	mov    0xc(%esp),%eax
  105659:	e8 b5 ad ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  10565e:	81 c3 a2 39 00 00    	add    $0x39a2,%ebx
    PDirPool[proc_index][pde_index] = (char*)((unsigned int)IDPTbl[pde_index] | PT_PERM_PTU);
  105664:	c1 e2 0a             	shl    $0xa,%edx
  105667:	01 c2                	add    %eax,%edx
  105669:	c1 e0 0c             	shl    $0xc,%eax
  10566c:	81 c0 00 70 95 00    	add    $0x957000,%eax
  105672:	c7 c1 00 70 d5 00    	mov    $0xd57000,%ecx
  105678:	83 c8 07             	or     $0x7,%eax
  10567b:	89 04 91             	mov    %eax,(%ecx,%edx,4)
    // dprintf("\nIDPTbl[pde_index] = %u\n", (unsigned int)IDPTbl[pde_index] + 7);
    // dprintf("\nval = %u\n", ((unsigned int)IDPTbl[pde_index] | PT_PERM_PTU));
}   
  10567e:	5b                   	pop    %ebx
  10567f:	c3                   	ret    

00105680 <rmv_pdir_entry>:
  * * Remove specified page directory entry 
  * Hint 1: Set the page directory entry to PT_PERM_UP.
  * Hint 2: Don't forget to cast the value to (char *).
  */
void rmv_pdir_entry(unsigned int proc_index, unsigned int pde_index)
{
  105680:	e8 86 ad ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  105685:	05 7b 39 00 00       	add    $0x397b,%eax
    // TODO
    PDirPool[proc_index][pde_index] = (char*)PT_PERM_UP;
  10568a:	c7 c2 00 70 d5 00    	mov    $0xd57000,%edx
  105690:	8b 44 24 04          	mov    0x4(%esp),%eax
  105694:	c1 e0 0a             	shl    $0xa,%eax
  105697:	03 44 24 08          	add    0x8(%esp),%eax
  10569b:	c7 04 82 00 00 00 00 	movl   $0x0,(%edx,%eax,4)
}   
  1056a2:	c3                   	ret    
  1056a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  1056a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001056b0 <get_ptbl_entry>:
  * Hint 2: Do not forget that the permission info is also stored in the page directory entries.
  *         (You will have to mask out the permission info.)
  * Hint 3: Remember to cast to a pointer before de-referencing an address.
  */
unsigned int get_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{   
  1056b0:	e8 56 ad ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1056b5:	05 4b 39 00 00       	add    $0x394b,%eax
    // unsigned int* frame = (unsigned int*)PDirPool[proc_index][pde_index];
    // frame = frame>>12;
    // frame = frame<<12;
    // return frame[pte_index];
    unsigned int* frame;
    unsigned int frameNum = (unsigned int)PDirPool[proc_index][pde_index];
  1056ba:	c7 c2 00 70 d5 00    	mov    $0xd57000,%edx
  1056c0:	8b 44 24 04          	mov    0x4(%esp),%eax
  1056c4:	c1 e0 0a             	shl    $0xa,%eax
  1056c7:	03 44 24 08          	add    0x8(%esp),%eax
  1056cb:	8b 04 82             	mov    (%edx,%eax,4),%eax
    frameNum = frameNum>>12;
    frameNum = frameNum<<12;
    frame = (unsigned int*)frameNum;
    return frame[pte_index];
  1056ce:	8b 54 24 0c          	mov    0xc(%esp),%edx
    frameNum = frameNum<<12;
  1056d2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    return frame[pte_index];
  1056d7:	8b 04 90             	mov    (%eax,%edx,4),%eax
}
  1056da:	c3                   	ret    
  1056db:	90                   	nop
  1056dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

001056e0 <set_ptbl_entry>:
  * * Sets specified page table entry with the start address of physical page # [page_index]
  * - You should also set the given permission
  * Hint 1: Same as TASK 6
  */
void set_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index, unsigned int page_index, unsigned int perm)
{   
  1056e0:	e8 26 ad ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  1056e5:	05 1b 39 00 00       	add    $0x391b,%eax
    unsigned int* frame;
    unsigned int frameNum = (unsigned int)PDirPool[proc_index][pde_index];
    frameNum = frameNum>>12;
    frameNum = frameNum<<12;
    frame = (unsigned int*)frameNum;
    frame[pte_index] = (page_index<<12) | perm;
  1056ea:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
    unsigned int frameNum = (unsigned int)PDirPool[proc_index][pde_index];
  1056ee:	c7 c2 00 70 d5 00    	mov    $0xd57000,%edx
  1056f4:	8b 44 24 04          	mov    0x4(%esp),%eax
  1056f8:	c1 e0 0a             	shl    $0xa,%eax
  1056fb:	03 44 24 08          	add    0x8(%esp),%eax
  1056ff:	8b 14 82             	mov    (%edx,%eax,4),%edx
    frame[pte_index] = (page_index<<12) | perm;
  105702:	8b 44 24 10          	mov    0x10(%esp),%eax
  105706:	c1 e0 0c             	shl    $0xc,%eax
  105709:	0b 44 24 14          	or     0x14(%esp),%eax
    frameNum = frameNum<<12;
  10570d:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
    frame[pte_index] = (page_index<<12) | perm;
  105713:	89 04 8a             	mov    %eax,(%edx,%ecx,4)
}   
  105716:	c3                   	ret    
  105717:	89 f6                	mov    %esi,%esi
  105719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105720 <set_ptbl_entry_identity>:
  * | 4       |    A[1][1]   |
  * | 5       |    A[1][2]   |
  * |---------|--------------|
  */
void set_ptbl_entry_identity(unsigned int pde_index, unsigned int pte_index, unsigned int perm)
{
  105720:	e8 e6 ac ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  105725:	05 db 38 00 00       	add    $0x38db,%eax
    // IDPTbl[pde_index][pte_index] = ((pde_index*1024 + pte_index)*4096) | perm;
    // IDPTbl[pde_index][pte_index] = pde_index*1024*4096 | perm;
    // dprintf("perm = %u\n", perm);
    // IDPTbl[pde_index][pte_index] = pde_index*1024*4096 + perm;
    // dprintf("\nidptbl[0] addr = %u\n", (unsigned int)IDPTbl[0]);
    IDPTbl[pde_index][pte_index] = (pde_index*1024 + pte_index)*4096 | perm;
  10572a:	c7 c1 00 70 95 00    	mov    $0x957000,%ecx
  105730:	8b 44 24 04          	mov    0x4(%esp),%eax
  105734:	c1 e0 0a             	shl    $0xa,%eax
  105737:	03 44 24 08          	add    0x8(%esp),%eax
  10573b:	89 c2                	mov    %eax,%edx
  10573d:	c1 e2 0c             	shl    $0xc,%edx
  105740:	0b 54 24 0c          	or     0xc(%esp),%edx
  105744:	89 14 81             	mov    %edx,(%ecx,%eax,4)
}
  105747:	c3                   	ret    
  105748:	90                   	nop
  105749:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00105750 <rmv_ptbl_entry>:
  * * Set the specified page table entry to 0
  * Hint 1: Remember that page directory entries also have permissions stored. Mask them out.
  * Hint 2: Remember to cast to a pointer before de-referencing an address.
  */
void rmv_ptbl_entry(unsigned int proc_index, unsigned int pde_index, unsigned int pte_index)
{
  105750:	e8 b6 ac ff ff       	call   10040b <__x86.get_pc_thunk.ax>
  105755:	05 ab 38 00 00       	add    $0x38ab,%eax
    // frame += 4*pte_index;
    // frame = frame<<12;
    // val = (unsigned int*)frame;
    // *val = 0;
    unsigned int* frame;
    unsigned int frameNum = (unsigned int)PDirPool[proc_index][pde_index];
  10575a:	c7 c2 00 70 d5 00    	mov    $0xd57000,%edx
  105760:	8b 44 24 04          	mov    0x4(%esp),%eax
  105764:	c1 e0 0a             	shl    $0xa,%eax
  105767:	03 44 24 08          	add    0x8(%esp),%eax
  10576b:	8b 04 82             	mov    (%edx,%eax,4),%eax
    frameNum = frameNum>>12;
    frameNum = frameNum<<12;
    frame = (unsigned int*)frameNum;
    frame[pte_index] = 0;
  10576e:	8b 54 24 0c          	mov    0xc(%esp),%edx
    frameNum = frameNum<<12;
  105772:	25 00 f0 ff ff       	and    $0xfffff000,%eax
    frame[pte_index] = 0;
  105777:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
}
  10577e:	c3                   	ret    
  10577f:	90                   	nop

00105780 <get_pdir_entry_by_va>:
  *         Use the masks defined above. (Do think of what the values are.)
  * Hint 2: Use the appropriate functions in MATIntro layer to 
  *         read the pdir_entry
  */
unsigned int get_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  105780:	53                   	push   %ebx
  105781:	e8 8d ac ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105786:	81 c3 7a 38 00 00    	add    $0x387a,%ebx
  10578c:	83 ec 10             	sub    $0x10,%esp
    // TODO
    unsigned int pde_index = vaddr & DIR_MASK, pde;
    pde_index = pde_index>>DIR_SHIFT;
    // pde_index = pde_index / 4096;
    pde = get_pdir_entry(proc_index, pde_index);
  10578f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  105793:	c1 e8 16             	shr    $0x16,%eax
  105796:	50                   	push   %eax
  105797:	ff 74 24 1c          	pushl  0x1c(%esp)
  10579b:	e8 60 fe ff ff       	call   105600 <get_pdir_entry>
    // dprintf("\nvaddr = %u, pde_index = %u, pde = %u\n", vaddr, pde_index, pde);
    return pde;
}
  1057a0:	83 c4 18             	add    $0x18,%esp
  1057a3:	5b                   	pop    %ebx
  1057a4:	c3                   	ret    
  1057a5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  1057a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

001057b0 <get_ptbl_entry_by_va>:
  * - Return 0 if the mapping does not exist in page directory entry (i.e. pde = 0).
  *
  * Hint 1: Same as TASK 1.
  */
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  1057b0:	55                   	push   %ebp
  1057b1:	57                   	push   %edi
  1057b2:	56                   	push   %esi
  1057b3:	53                   	push   %ebx
  1057b4:	e8 5a ac ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1057b9:	81 c3 47 38 00 00    	add    $0x3847,%ebx
  1057bf:	83 ec 14             	sub    $0x14,%esp
  1057c2:	8b 74 24 2c          	mov    0x2c(%esp),%esi
  1057c6:	89 f7                	mov    %esi,%edi
    // TODO
    unsigned int pde_index = vaddr & DIR_MASK, pte_index = vaddr & PAGE_MASK, pte, pde, i;
    pde_index = pde_index>>DIR_SHIFT;
    pte_index = pte_index>>PAGE_SHIFT;
  1057c8:	c1 ee 0c             	shr    $0xc,%esi
  1057cb:	c1 ef 16             	shr    $0x16,%edi
  1057ce:	81 e6 ff 03 00 00    	and    $0x3ff,%esi
    pde = get_pdir_entry(proc_index, pde_index);
  1057d4:	57                   	push   %edi
  1057d5:	ff 74 24 2c          	pushl  0x2c(%esp)
  1057d9:	e8 22 fe ff ff       	call   105600 <get_pdir_entry>
    pde = get_pdir_entry_by_va(proc_index, vaddr);
    // pde = get_pdir_entry(proc_index, pde_index);
    pte = get_ptbl_entry(proc_index, pde_index, pte_index);
  1057de:	83 c4 0c             	add    $0xc,%esp
    pde = get_pdir_entry(proc_index, pde_index);
  1057e1:	89 c5                	mov    %eax,%ebp
    pte = get_ptbl_entry(proc_index, pde_index, pte_index);
  1057e3:	56                   	push   %esi
  1057e4:	57                   	push   %edi
  1057e5:	ff 74 24 2c          	pushl  0x2c(%esp)
  1057e9:	e8 c2 fe ff ff       	call   1056b0 <get_ptbl_entry>

    if(pde == 0)
      return 0;
    return pte;
  1057ee:	85 ed                	test   %ebp,%ebp
  1057f0:	0f 45 e8             	cmovne %eax,%ebp
}         
  1057f3:	83 c4 1c             	add    $0x1c,%esp
  1057f6:	5b                   	pop    %ebx
  1057f7:	89 e8                	mov    %ebp,%eax
  1057f9:	5e                   	pop    %esi
  1057fa:	5f                   	pop    %edi
  1057fb:	5d                   	pop    %ebp
  1057fc:	c3                   	ret    
  1057fd:	8d 76 00             	lea    0x0(%esi),%esi

00105800 <rmv_pdir_entry_by_va>:
  * * Remove the page directory entry for the given virtual address
  * Hint 1: Calculate the arguments required by the function(rmv_pdir_entry) in MPTIntro layer
  *         and simply call it.
  */
void rmv_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  105800:	53                   	push   %ebx
  105801:	e8 0d ac ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105806:	81 c3 fa 37 00 00    	add    $0x37fa,%ebx
  10580c:	83 ec 10             	sub    $0x10,%esp
    // TODO
    unsigned int pde_index = vaddr & DIR_MASK, pde;
    pde_index = pde_index>>DIR_SHIFT;
    rmv_pdir_entry(proc_index, pde_index);
  10580f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  105813:	c1 e8 16             	shr    $0x16,%eax
  105816:	50                   	push   %eax
  105817:	ff 74 24 1c          	pushl  0x1c(%esp)
  10581b:	e8 60 fe ff ff       	call   105680 <rmv_pdir_entry>
}
  105820:	83 c4 18             	add    $0x18,%esp
  105823:	5b                   	pop    %ebx
  105824:	c3                   	ret    
  105825:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105830 <rmv_ptbl_entry_by_va>:
/** TASK 4:
  * * Remove the page table entry for the given virtual address
  * Hint 1: Same as TASK 3. Use the correct function.
  */
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr)
{
  105830:	53                   	push   %ebx
  105831:	e8 dd ab ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105836:	81 c3 ca 37 00 00    	add    $0x37ca,%ebx
  10583c:	83 ec 0c             	sub    $0xc,%esp
  10583f:	8b 44 24 18          	mov    0x18(%esp),%eax
    // TODO
    unsigned int pde_index = vaddr & DIR_MASK, pte_index = vaddr & PAGE_MASK, pte, pde;
    pde_index = pde_index>>DIR_SHIFT;
    pte_index = pte_index>>PAGE_SHIFT;
  105843:	89 c2                	mov    %eax,%edx
    rmv_ptbl_entry(proc_index, pde_index, pte_index);
  105845:	c1 e8 16             	shr    $0x16,%eax
    pte_index = pte_index>>PAGE_SHIFT;
  105848:	c1 ea 0c             	shr    $0xc,%edx
  10584b:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
    rmv_ptbl_entry(proc_index, pde_index, pte_index);
  105851:	52                   	push   %edx
  105852:	50                   	push   %eax
  105853:	ff 74 24 1c          	pushl  0x1c(%esp)
  105857:	e8 f4 fe ff ff       	call   105750 <rmv_ptbl_entry>
}
  10585c:	83 c4 18             	add    $0x18,%esp
  10585f:	5b                   	pop    %ebx
  105860:	c3                   	ret    
  105861:	eb 0d                	jmp    105870 <set_pdir_entry_by_va>
  105863:	90                   	nop
  105864:	90                   	nop
  105865:	90                   	nop
  105866:	90                   	nop
  105867:	90                   	nop
  105868:	90                   	nop
  105869:	90                   	nop
  10586a:	90                   	nop
  10586b:	90                   	nop
  10586c:	90                   	nop
  10586d:	90                   	nop
  10586e:	90                   	nop
  10586f:	90                   	nop

00105870 <set_pdir_entry_by_va>:
/** TASK 5:
  * * Register the mapping from the virtual address [vaddr] to physical page # [page_index] in the page directory.
  * Hint: Same as TASK 3. Use the correct function.
  */
void set_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index)
{
  105870:	53                   	push   %ebx
  105871:	e8 9d ab ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105876:	81 c3 8a 37 00 00    	add    $0x378a,%ebx
  10587c:	83 ec 0c             	sub    $0xc,%esp
    // TODO
    unsigned int pde_index = vaddr & DIR_MASK, pde;
    pde_index = pde_index>>DIR_SHIFT;
    set_pdir_entry(proc_index, pde_index, page_index);
  10587f:	ff 74 24 1c          	pushl  0x1c(%esp)
  105883:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  105887:	c1 e8 16             	shr    $0x16,%eax
  10588a:	50                   	push   %eax
  10588b:	ff 74 24 1c          	pushl  0x1c(%esp)
  10588f:	e8 8c fd ff ff       	call   105620 <set_pdir_entry>
}   
  105894:	83 c4 18             	add    $0x18,%esp
  105897:	5b                   	pop    %ebx
  105898:	c3                   	ret    
  105899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001058a0 <set_ptbl_entry_by_va>:
  * * Register the mapping from the virtual address [vaddr] to the physical page # [page_index] with permission [perm]
  * - You do not need to worry about the page directory entry. just map the page table entry.
  * Hint: Same as TASK 3. Use the correct function.
  */
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr, unsigned int page_index, unsigned int perm)
{
  1058a0:	53                   	push   %ebx
  1058a1:	e8 6d ab ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1058a6:	81 c3 5a 37 00 00    	add    $0x375a,%ebx
  1058ac:	83 ec 14             	sub    $0x14,%esp
  1058af:	8b 44 24 20          	mov    0x20(%esp),%eax
    // TODO
    unsigned int pde_index = vaddr & DIR_MASK, pte_index = vaddr & PAGE_MASK, pte, pde;
    pde_index = pde_index>>DIR_SHIFT;
    pte_index = pte_index>>PAGE_SHIFT;
    // pte = get_ptbl_entry(proc_index, pde_index, pte_index);
    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  1058b3:	ff 74 24 28          	pushl  0x28(%esp)
  1058b7:	ff 74 24 28          	pushl  0x28(%esp)
    pte_index = pte_index>>PAGE_SHIFT;
  1058bb:	89 c2                	mov    %eax,%edx
    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  1058bd:	c1 e8 16             	shr    $0x16,%eax
    pte_index = pte_index>>PAGE_SHIFT;
  1058c0:	c1 ea 0c             	shr    $0xc,%edx
  1058c3:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
    set_ptbl_entry(proc_index, pde_index, pte_index, page_index, perm);
  1058c9:	52                   	push   %edx
  1058ca:	50                   	push   %eax
  1058cb:	ff 74 24 2c          	pushl  0x2c(%esp)
  1058cf:	e8 0c fe ff ff       	call   1056e0 <set_ptbl_entry>
}
  1058d4:	83 c4 28             	add    $0x28,%esp
  1058d7:	5b                   	pop    %ebx
  1058d8:	c3                   	ret    
  1058d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

001058e0 <idptbl_init>:
  * Hint 2: You have already created the functions that deal with IDPTbl. 
  *         Calculate the appropriate permission values as mentioned above 
  *         and call set_ptbl_entry_identity from MATIntro layer.
  */
void idptbl_init(unsigned int mbi_adr)
{
  1058e0:	55                   	push   %ebp
  1058e1:	57                   	push   %edi
    // TODO: define your local variables here.
    container_init(mbi_adr);
  1058e2:	bf 00 ff ff ff       	mov    $0xffffff00,%edi
{
  1058e7:	56                   	push   %esi
  1058e8:	53                   	push   %ebx
  1058e9:	e8 25 ab ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1058ee:	81 c3 12 37 00 00    	add    $0x3712,%ebx
  1058f4:	83 ec 18             	sub    $0x18,%esp
    container_init(mbi_adr);
  1058f7:	ff 74 24 2c          	pushl  0x2c(%esp)
  1058fb:	e8 80 fa ff ff       	call   105380 <container_init>
  105900:	83 c4 10             	add    $0x10,%esp
  105903:	90                   	nop
  105904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105908:	8d af 00 01 00 00    	lea    0x100(%edi),%ebp
    // TODO
    unsigned int i, j, addr, size = 1024, hi, lo;
    lo = VM_USERLO / 4096 / 1024;
    hi = VM_USERHI / 4096 / 1024;
    for(i = 0; i < size; i++){
      for(j = 0; j < size; j++){
  10590e:	31 f6                	xor    %esi,%esi
  105910:	eb 23                	jmp    105935 <idptbl_init+0x55>
  105912:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        // addr = j*size*4096;
        // if(addr < VM_USERLO || addr >= VM_USERHI)
        if(i < lo || i >= hi)
          set_ptbl_entry_identity(i, j, PTE_P | PTE_W | PTE_G);
  105918:	83 ec 04             	sub    $0x4,%esp
  10591b:	68 03 01 00 00       	push   $0x103
  105920:	56                   	push   %esi
      for(j = 0; j < size; j++){
  105921:	83 c6 01             	add    $0x1,%esi
          set_ptbl_entry_identity(i, j, PTE_P | PTE_W | PTE_G);
  105924:	55                   	push   %ebp
  105925:	e8 f6 fd ff ff       	call   105720 <set_ptbl_entry_identity>
  10592a:	83 c4 10             	add    $0x10,%esp
      for(j = 0; j < size; j++){
  10592d:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  105933:	74 22                	je     105957 <idptbl_init+0x77>
        if(i < lo || i >= hi)
  105935:	81 ff bf 02 00 00    	cmp    $0x2bf,%edi
  10593b:	77 db                	ja     105918 <idptbl_init+0x38>
        else
          set_ptbl_entry_identity(i, j, PTE_P | PTE_W);
  10593d:	83 ec 04             	sub    $0x4,%esp
  105940:	6a 03                	push   $0x3
  105942:	56                   	push   %esi
      for(j = 0; j < size; j++){
  105943:	83 c6 01             	add    $0x1,%esi
          set_ptbl_entry_identity(i, j, PTE_P | PTE_W);
  105946:	55                   	push   %ebp
  105947:	e8 d4 fd ff ff       	call   105720 <set_ptbl_entry_identity>
  10594c:	83 c4 10             	add    $0x10,%esp
      for(j = 0; j < size; j++){
  10594f:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  105955:	75 de                	jne    105935 <idptbl_init+0x55>
  105957:	83 c7 01             	add    $0x1,%edi
    for(i = 0; i < size; i++){
  10595a:	81 ff 00 03 00 00    	cmp    $0x300,%edi
  105960:	75 a6                	jne    105908 <idptbl_init+0x28>
      }
    }
}
  105962:	83 c4 0c             	add    $0xc,%esp
  105965:	5b                   	pop    %ebx
  105966:	5e                   	pop    %esi
  105967:	5f                   	pop    %edi
  105968:	5d                   	pop    %ebp
  105969:	c3                   	ret    
  10596a:	66 90                	xchg   %ax,%ax
  10596c:	66 90                	xchg   %ax,%ax
  10596e:	66 90                	xchg   %ax,%ax

00105970 <pdir_init>:
  * Hint 1: Recall which portions are reserved for the kernel and calculate the pde_index.       
  * Hint 2: Recall which function in MPTIntro layer is used to set identity map. (See import.h) 
  * Hint 3: Remove the page directory entry to unmap it.
  */
void pdir_init(unsigned int mbi_adr)
{
  105970:	57                   	push   %edi
  105971:	56                   	push   %esi
    idptbl_init(mbi_adr);

    // // // TODO
    lo = VM_USERLO / 4096 / 1024;
    hi = VM_USERHI / 4096 / 1024;
    for(i = 0; i < NUM_IDS; i++){
  105972:	31 ff                	xor    %edi,%edi
{
  105974:	53                   	push   %ebx
  105975:	e8 99 aa ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  10597a:	81 c3 86 36 00 00    	add    $0x3686,%ebx
    idptbl_init(mbi_adr);
  105980:	83 ec 0c             	sub    $0xc,%esp
  105983:	ff 74 24 1c          	pushl  0x1c(%esp)
  105987:	e8 54 ff ff ff       	call   1058e0 <idptbl_init>
  10598c:	83 c4 10             	add    $0x10,%esp
  10598f:	90                   	nop
      for(j = 0; j < size; j++){
  105990:	31 f6                	xor    %esi,%esi
  105992:	eb 1c                	jmp    1059b0 <pdir_init+0x40>
  105994:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        if(j < lo || j >= hi)
          set_pdir_entry_identity(i,j);
  105998:	83 ec 08             	sub    $0x8,%esp
  10599b:	56                   	push   %esi
  10599c:	57                   	push   %edi
      for(j = 0; j < size; j++){
  10599d:	83 c6 01             	add    $0x1,%esi
          set_pdir_entry_identity(i,j);
  1059a0:	e8 ab fc ff ff       	call   105650 <set_pdir_entry_identity>
  1059a5:	83 c4 10             	add    $0x10,%esp
      for(j = 0; j < size; j++){
  1059a8:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  1059ae:	74 25                	je     1059d5 <pdir_init+0x65>
        if(j < lo || j >= hi)
  1059b0:	8d 86 00 ff ff ff    	lea    -0x100(%esi),%eax
  1059b6:	3d bf 02 00 00       	cmp    $0x2bf,%eax
  1059bb:	77 db                	ja     105998 <pdir_init+0x28>
        else
          rmv_pdir_entry(i,j);
  1059bd:	83 ec 08             	sub    $0x8,%esp
  1059c0:	56                   	push   %esi
  1059c1:	57                   	push   %edi
      for(j = 0; j < size; j++){
  1059c2:	83 c6 01             	add    $0x1,%esi
          rmv_pdir_entry(i,j);
  1059c5:	e8 b6 fc ff ff       	call   105680 <rmv_pdir_entry>
  1059ca:	83 c4 10             	add    $0x10,%esp
      for(j = 0; j < size; j++){
  1059cd:	81 fe 00 04 00 00    	cmp    $0x400,%esi
  1059d3:	75 db                	jne    1059b0 <pdir_init+0x40>
    for(i = 0; i < NUM_IDS; i++){
  1059d5:	83 c7 01             	add    $0x1,%edi
  1059d8:	83 ff 40             	cmp    $0x40,%edi
  1059db:	75 b3                	jne    105990 <pdir_init+0x20>
      }
    }
}
  1059dd:	5b                   	pop    %ebx
  1059de:	5e                   	pop    %esi
  1059df:	5f                   	pop    %edi
  1059e0:	c3                   	ret    
  1059e1:	eb 0d                	jmp    1059f0 <alloc_ptbl>
  1059e3:	90                   	nop
  1059e4:	90                   	nop
  1059e5:	90                   	nop
  1059e6:	90                   	nop
  1059e7:	90                   	nop
  1059e8:	90                   	nop
  1059e9:	90                   	nop
  1059ea:	90                   	nop
  1059eb:	90                   	nop
  1059ec:	90                   	nop
  1059ed:	90                   	nop
  1059ee:	90                   	nop
  1059ef:	90                   	nop

001059f0 <alloc_ptbl>:
  * * 3. Clear (set to 0) all the page table entries for this newly mapped page table.
  * * 4. Return the page index of the newly allocated physical page.
  * 	 In the case when there's no physical page available, it returns 0.
  */
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vadr)
{
  1059f0:	55                   	push   %ebp
  1059f1:	57                   	push   %edi
  1059f2:	56                   	push   %esi
  1059f3:	53                   	push   %ebx
  1059f4:	e8 1a aa ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  1059f9:	81 c3 07 36 00 00    	add    $0x3607,%ebx
  1059ff:	83 ec 28             	sub    $0x28,%esp
  105a02:	8b 74 24 3c          	mov    0x3c(%esp),%esi
  // TODO
  unsigned int addr, pde_index, i, size = 1024;
  addr = container_alloc(proc_index);
  105a06:	56                   	push   %esi
  105a07:	e8 54 fb ff ff       	call   105560 <container_alloc>
  105a0c:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  pde_index = (vadr & DIR_MASK)>>DIR_SHIFT;
  if(addr > 0){
  105a10:	83 c4 10             	add    $0x10,%esp
  105a13:	85 c0                	test   %eax,%eax
  105a15:	75 11                	jne    105a28 <alloc_ptbl+0x38>
    }
    return addr;
  }

  return 0;
}
  105a17:	8b 44 24 0c          	mov    0xc(%esp),%eax
  105a1b:	83 c4 1c             	add    $0x1c,%esp
  105a1e:	5b                   	pop    %ebx
  105a1f:	5e                   	pop    %esi
  105a20:	5f                   	pop    %edi
  105a21:	5d                   	pop    %ebp
  105a22:	c3                   	ret    
  105a23:	90                   	nop
  105a24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    set_pdir_entry_by_va(proc_index, vadr, addr);
  105a28:	83 ec 04             	sub    $0x4,%esp
    for(i = 0; i < size; i++){
  105a2b:	31 ed                	xor    %ebp,%ebp
    set_pdir_entry_by_va(proc_index, vadr, addr);
  105a2d:	ff 74 24 10          	pushl  0x10(%esp)
  105a31:	ff 74 24 3c          	pushl  0x3c(%esp)
  105a35:	56                   	push   %esi
  105a36:	e8 35 fe ff ff       	call   105870 <set_pdir_entry_by_va>
  pde_index = (vadr & DIR_MASK)>>DIR_SHIFT;
  105a3b:	8b 7c 24 44          	mov    0x44(%esp),%edi
  105a3f:	83 c4 10             	add    $0x10,%esp
  105a42:	c1 ef 16             	shr    $0x16,%edi
  105a45:	8d 76 00             	lea    0x0(%esi),%esi
      rmv_ptbl_entry(proc_index, pde_index, i);
  105a48:	83 ec 04             	sub    $0x4,%esp
  105a4b:	55                   	push   %ebp
  105a4c:	57                   	push   %edi
    for(i = 0; i < size; i++){
  105a4d:	83 c5 01             	add    $0x1,%ebp
      rmv_ptbl_entry(proc_index, pde_index, i);
  105a50:	56                   	push   %esi
  105a51:	e8 fa fc ff ff       	call   105750 <rmv_ptbl_entry>
    for(i = 0; i < size; i++){
  105a56:	83 c4 10             	add    $0x10,%esp
  105a59:	81 fd 00 04 00 00    	cmp    $0x400,%ebp
  105a5f:	75 e7                	jne    105a48 <alloc_ptbl+0x58>
}
  105a61:	8b 44 24 0c          	mov    0xc(%esp),%eax
  105a65:	83 c4 1c             	add    $0x1c,%esp
  105a68:	5b                   	pop    %ebx
  105a69:	5e                   	pop    %esi
  105a6a:	5f                   	pop    %edi
  105a6b:	5d                   	pop    %ebp
  105a6c:	c3                   	ret    
  105a6d:	8d 76 00             	lea    0x0(%esi),%esi

00105a70 <free_ptbl>:
  * Hint 1: Find the pde corresponding to vadr (MPTOp layer)
  * Hint 2: Remove the pde (MPTOp layer)
  * Hint 3: Use container free
  */
void free_ptbl(unsigned int proc_index, unsigned int vadr)
{
  105a70:	55                   	push   %ebp
  105a71:	57                   	push   %edi
  105a72:	56                   	push   %esi
  105a73:	53                   	push   %ebx
  105a74:	e8 9a a9 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105a79:	81 c3 87 35 00 00    	add    $0x3587,%ebx
  105a7f:	83 ec 14             	sub    $0x14,%esp
  105a82:	8b 74 24 28          	mov    0x28(%esp),%esi
  105a86:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  // TODO
  unsigned int addr, i, pde;
  pde = get_pdir_entry_by_va(proc_index, vadr);
  105a8a:	57                   	push   %edi
  105a8b:	56                   	push   %esi
  105a8c:	e8 ef fc ff ff       	call   105780 <get_pdir_entry_by_va>
  105a91:	89 c5                	mov    %eax,%ebp
  rmv_pdir_entry_by_va(proc_index, vadr);
  105a93:	58                   	pop    %eax
  105a94:	5a                   	pop    %edx
  105a95:	57                   	push   %edi
  105a96:	56                   	push   %esi
  addr = pde & DIR_MASK;
  105a97:	81 e5 00 00 c0 ff    	and    $0xffc00000,%ebp
  rmv_pdir_entry_by_va(proc_index, vadr);
  105a9d:	e8 5e fd ff ff       	call   105800 <rmv_pdir_entry_by_va>
  container_free(proc_index, addr);
  105aa2:	59                   	pop    %ecx
  105aa3:	5f                   	pop    %edi
  105aa4:	55                   	push   %ebp
  105aa5:	56                   	push   %esi
  105aa6:	e8 f5 fa ff ff       	call   1055a0 <container_free>
  105aab:	83 c4 1c             	add    $0x1c,%esp
  105aae:	5b                   	pop    %ebx
  105aaf:	5e                   	pop    %esi
  105ab0:	5f                   	pop    %edi
  105ab1:	5d                   	pop    %ebp
  105ab2:	c3                   	ret    
  105ab3:	66 90                	xchg   %ax,%ax
  105ab5:	66 90                	xchg   %ax,%ax
  105ab7:	66 90                	xchg   %ax,%ax
  105ab9:	66 90                	xchg   %ax,%ax
  105abb:	66 90                	xchg   %ax,%ax
  105abd:	66 90                	xchg   %ax,%ax
  105abf:	90                   	nop

00105ac0 <pdir_init_kern>:
  *  
  * Hint 1: Note that part of the task is already completed by pdir_init.
  * Hint 2: Here just set the remaining portion of process 0's page directory entry as identity map.
  */
void pdir_init_kern(unsigned int mbi_adr)
{
  105ac0:	56                   	push   %esi
  105ac1:	53                   	push   %ebx
    pdir_init(mbi_adr);
    
    //TODO
    lo = VM_USERLO / 4096 / 1024;
    hi = VM_USERHI / 4096 / 1024;
    for(i = lo; i < hi; i++){
  105ac2:	be 00 01 00 00       	mov    $0x100,%esi
  105ac7:	e8 47 a9 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105acc:	81 c3 34 35 00 00    	add    $0x3534,%ebx
{
  105ad2:	83 ec 10             	sub    $0x10,%esp
    pdir_init(mbi_adr);
  105ad5:	ff 74 24 1c          	pushl  0x1c(%esp)
  105ad9:	e8 92 fe ff ff       	call   105970 <pdir_init>
  105ade:	83 c4 10             	add    $0x10,%esp
  105ae1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      set_pdir_entry_identity(0,i);
  105ae8:	83 ec 08             	sub    $0x8,%esp
  105aeb:	56                   	push   %esi
  105aec:	6a 00                	push   $0x0
    for(i = lo; i < hi; i++){
  105aee:	83 c6 01             	add    $0x1,%esi
      set_pdir_entry_identity(0,i);
  105af1:	e8 5a fb ff ff       	call   105650 <set_pdir_entry_identity>
    for(i = lo; i < hi; i++){
  105af6:	83 c4 10             	add    $0x10,%esp
  105af9:	81 fe c0 03 00 00    	cmp    $0x3c0,%esi
  105aff:	75 e7                	jne    105ae8 <pdir_init_kern+0x28>
    }
}
  105b01:	83 c4 04             	add    $0x4,%esp
  105b04:	5b                   	pop    %ebx
  105b05:	5e                   	pop    %esi
  105b06:	c3                   	ret    
  105b07:	89 f6                	mov    %esi,%esi
  105b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105b10 <map_page>:
  *         - If there is an error during allocation, return MagicNumber.
  * Hint 3: If you have a valid pde, set the page table entry to new physical page (page_index) and perm.
  * Hint 4: Return the pde index or MagicNumber.
  */
unsigned int map_page(unsigned int proc_index, unsigned int vadr, unsigned int page_index, unsigned int perm)
{   
  105b10:	55                   	push   %ebp
  105b11:	57                   	push   %edi
  105b12:	56                   	push   %esi
  105b13:	53                   	push   %ebx
  105b14:	e8 fa a8 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105b19:	81 c3 e7 34 00 00    	add    $0x34e7,%ebx
  105b1f:	83 ec 14             	sub    $0x14,%esp
  105b22:	8b 74 24 28          	mov    0x28(%esp),%esi
  105b26:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  // TODO
  unsigned int pde_index=0, pde=0, addr=0;
  pde = get_pdir_entry_by_va(proc_index, vadr);
  105b2a:	57                   	push   %edi
  105b2b:	56                   	push   %esi
  105b2c:	e8 4f fc ff ff       	call   105780 <get_pdir_entry_by_va>
  if(pde > 0){
  105b31:	83 c4 10             	add    $0x10,%esp
  105b34:	85 c0                	test   %eax,%eax
  105b36:	74 28                	je     105b60 <map_page+0x50>
    pde_index = pde>>12;
  105b38:	c1 e8 0c             	shr    $0xc,%eax
  105b3b:	89 c5                	mov    %eax,%ebp
    addr = alloc_ptbl(proc_index, vadr);
    if(addr == 0){
      return MagicNumber;
    }
  }
  set_ptbl_entry_by_va(proc_index, vadr, page_index, perm);
  105b3d:	ff 74 24 2c          	pushl  0x2c(%esp)
  105b41:	ff 74 24 2c          	pushl  0x2c(%esp)
  105b45:	57                   	push   %edi
  105b46:	56                   	push   %esi
  105b47:	e8 54 fd ff ff       	call   1058a0 <set_ptbl_entry_by_va>
  105b4c:	83 c4 10             	add    $0x10,%esp
  // dprintf("\npde, pde_index, addr = %u, %u, %u\n", pde, pde_index, addr);
  if(addr != 0)
    return addr;
  else
    return pde_index;
}
  105b4f:	89 e8                	mov    %ebp,%eax
  105b51:	83 c4 0c             	add    $0xc,%esp
  105b54:	5b                   	pop    %ebx
  105b55:	5e                   	pop    %esi
  105b56:	5f                   	pop    %edi
  105b57:	5d                   	pop    %ebp
  105b58:	c3                   	ret    
  105b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    addr = alloc_ptbl(proc_index, vadr);
  105b60:	83 ec 08             	sub    $0x8,%esp
  105b63:	57                   	push   %edi
  105b64:	56                   	push   %esi
  105b65:	e8 86 fe ff ff       	call   1059f0 <alloc_ptbl>
    if(addr == 0){
  105b6a:	83 c4 10             	add    $0x10,%esp
  105b6d:	85 c0                	test   %eax,%eax
    addr = alloc_ptbl(proc_index, vadr);
  105b6f:	89 c5                	mov    %eax,%ebp
    if(addr == 0){
  105b71:	75 ca                	jne    105b3d <map_page+0x2d>
}
  105b73:	83 c4 0c             	add    $0xc,%esp
      return MagicNumber;
  105b76:	bd 01 00 10 00       	mov    $0x100001,%ebp
}
  105b7b:	5b                   	pop    %ebx
  105b7c:	89 e8                	mov    %ebp,%eax
  105b7e:	5e                   	pop    %esi
  105b7f:	5f                   	pop    %edi
  105b80:	5d                   	pop    %ebp
  105b81:	c3                   	ret    
  105b82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00105b90 <unmap_page>:
  *         - Nothing should be done if the mapping no longer exists.
  * Hint 2: If pte is valid, remove page table entry for vadr.
  * Hint 3: Return the corresponding page table entry.
  */
unsigned int unmap_page(unsigned int proc_index, unsigned int vadr)
{
  105b90:	57                   	push   %edi
  105b91:	56                   	push   %esi
  105b92:	53                   	push   %ebx
  105b93:	e8 7b a8 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105b98:	81 c3 68 34 00 00    	add    $0x3468,%ebx
  105b9e:	83 ec 18             	sub    $0x18,%esp
  105ba1:	8b 74 24 28          	mov    0x28(%esp),%esi
  105ba5:	8b 7c 24 2c          	mov    0x2c(%esp),%edi
  // TODO
  unsigned int pte=0;
  pte = get_ptbl_entry_by_va(proc_index, vadr);
  105ba9:	57                   	push   %edi
  105baa:	56                   	push   %esi
  105bab:	e8 00 fc ff ff       	call   1057b0 <get_ptbl_entry_by_va>
  // dprintf("pte = %u\n", pte);
  if(pte != 0){
  105bb0:	83 c4 10             	add    $0x10,%esp
  105bb3:	85 c0                	test   %eax,%eax
  105bb5:	74 15                	je     105bcc <unmap_page+0x3c>
  105bb7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    rmv_ptbl_entry_by_va(proc_index, vadr);
  105bbb:	83 ec 08             	sub    $0x8,%esp
  105bbe:	57                   	push   %edi
  105bbf:	56                   	push   %esi
  105bc0:	e8 6b fc ff ff       	call   105830 <rmv_ptbl_entry_by_va>
  105bc5:	83 c4 10             	add    $0x10,%esp
  105bc8:	8b 44 24 0c          	mov    0xc(%esp),%eax
  }

  return pte;
}   
  105bcc:	83 c4 10             	add    $0x10,%esp
  105bcf:	5b                   	pop    %ebx
  105bd0:	5e                   	pop    %esi
  105bd1:	5f                   	pop    %edi
  105bd2:	c3                   	ret    
  105bd3:	66 90                	xchg   %ax,%ax
  105bd5:	66 90                	xchg   %ax,%ax
  105bd7:	66 90                	xchg   %ax,%ax
  105bd9:	66 90                	xchg   %ax,%ax
  105bdb:	66 90                	xchg   %ax,%ax
  105bdd:	66 90                	xchg   %ax,%ax
  105bdf:	90                   	nop

00105be0 <paging_init>:
 * Initializes the page structures,
 * move to the page structure # 0 (kernel).
 * and turn on the paging.
 */
void paging_init(unsigned int mbi_addr)
{
  105be0:	53                   	push   %ebx
  105be1:	e8 2d a8 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105be6:	81 c3 1a 34 00 00    	add    $0x341a,%ebx
  105bec:	83 ec 14             	sub    $0x14,%esp
	pdir_init_kern(mbi_addr);
  105bef:	ff 74 24 1c          	pushl  0x1c(%esp)
  105bf3:	e8 c8 fe ff ff       	call   105ac0 <pdir_init_kern>
	set_pdir_base(0);
  105bf8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  105bff:	e8 cc f9 ff ff       	call   1055d0 <set_pdir_base>
	enable_paging();
  105c04:	e8 65 b6 ff ff       	call   10126e <enable_paging>
}
  105c09:	83 c4 18             	add    $0x18,%esp
  105c0c:	5b                   	pop    %ebx
  105c0d:	c3                   	ret    
  105c0e:	66 90                	xchg   %ax,%ax

00105c10 <alloc_page>:
  *   - It should return the physical page index registered in the page directory, i.e., the
  *     return value from map_page.
  *   - In the case of error, it should return the MagicNumber.
  */
unsigned int alloc_page(unsigned int proc_index, unsigned int vaddr, unsigned int perm)
{
  105c10:	56                   	push   %esi
  105c11:	53                   	push   %ebx
  105c12:	e8 fc a7 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105c17:	81 c3 e9 33 00 00    	add    $0x33e9,%ebx
  105c1d:	83 ec 10             	sub    $0x10,%esp
  105c20:	8b 74 24 1c          	mov    0x1c(%esp),%esi
	// TODO
  unsigned int addr, retaddr;
  addr = container_alloc(proc_index);
  105c24:	56                   	push   %esi
  105c25:	e8 36 f9 ff ff       	call   105560 <container_alloc>
  if(addr == 0)
  105c2a:	83 c4 10             	add    $0x10,%esp
  105c2d:	85 c0                	test   %eax,%eax
  105c2f:	74 1f                	je     105c50 <alloc_page+0x40>
    return MagicNumber;
  retaddr = map_page(proc_index, vaddr, addr, perm);
  105c31:	ff 74 24 18          	pushl  0x18(%esp)
  105c35:	50                   	push   %eax
  105c36:	ff 74 24 1c          	pushl  0x1c(%esp)
  105c3a:	56                   	push   %esi
  105c3b:	e8 d0 fe ff ff       	call   105b10 <map_page>
  if(retaddr == 0)
  105c40:	83 c4 10             	add    $0x10,%esp
  105c43:	85 c0                	test   %eax,%eax
  105c45:	74 09                	je     105c50 <alloc_page+0x40>
    return MagicNumber;
  // dprintf("addr = %u, retaddr = %u\n", addr, retaddr);
	return retaddr;
}
  105c47:	83 c4 04             	add    $0x4,%esp
  105c4a:	5b                   	pop    %ebx
  105c4b:	5e                   	pop    %esi
  105c4c:	c3                   	ret    
  105c4d:	8d 76 00             	lea    0x0(%esi),%esi
  105c50:	83 c4 04             	add    $0x4,%esp
    return MagicNumber;
  105c53:	b8 01 00 10 00       	mov    $0x100001,%eax
}
  105c58:	5b                   	pop    %ebx
  105c59:	5e                   	pop    %esi
  105c5a:	c3                   	ret    
  105c5b:	90                   	nop
  105c5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00105c60 <alloc_mem_quota>:

/**
 * Designate some memory quota for the next child process.
 */
unsigned int alloc_mem_quota(unsigned int id, unsigned int quota)
{
  105c60:	53                   	push   %ebx
  105c61:	e8 ad a7 ff ff       	call   100413 <__x86.get_pc_thunk.bx>
  105c66:	81 c3 9a 33 00 00    	add    $0x339a,%ebx
  105c6c:	83 ec 10             	sub    $0x10,%esp
	unsigned int child;
	child = container_split(id, quota);
  105c6f:	ff 74 24 1c          	pushl  0x1c(%esp)
  105c73:	ff 74 24 1c          	pushl  0x1c(%esp)
  105c77:	e8 84 f8 ff ff       	call   105500 <container_split>
	return child;
}
  105c7c:	83 c4 18             	add    $0x18,%esp
  105c7f:	5b                   	pop    %ebx
  105c80:	c3                   	ret    
  105c81:	66 90                	xchg   %ax,%ax
  105c83:	66 90                	xchg   %ax,%ax
  105c85:	66 90                	xchg   %ax,%ax
  105c87:	66 90                	xchg   %ax,%ax
  105c89:	66 90                	xchg   %ax,%ax
  105c8b:	66 90                	xchg   %ax,%ax
  105c8d:	66 90                	xchg   %ax,%ax
  105c8f:	90                   	nop

00105c90 <__udivdi3>:
  105c90:	55                   	push   %ebp
  105c91:	57                   	push   %edi
  105c92:	56                   	push   %esi
  105c93:	53                   	push   %ebx
  105c94:	83 ec 1c             	sub    $0x1c,%esp
  105c97:	8b 54 24 3c          	mov    0x3c(%esp),%edx
  105c9b:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  105c9f:	8b 74 24 34          	mov    0x34(%esp),%esi
  105ca3:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  105ca7:	85 d2                	test   %edx,%edx
  105ca9:	75 35                	jne    105ce0 <__udivdi3+0x50>
  105cab:	39 f3                	cmp    %esi,%ebx
  105cad:	0f 87 bd 00 00 00    	ja     105d70 <__udivdi3+0xe0>
  105cb3:	85 db                	test   %ebx,%ebx
  105cb5:	89 d9                	mov    %ebx,%ecx
  105cb7:	75 0b                	jne    105cc4 <__udivdi3+0x34>
  105cb9:	b8 01 00 00 00       	mov    $0x1,%eax
  105cbe:	31 d2                	xor    %edx,%edx
  105cc0:	f7 f3                	div    %ebx
  105cc2:	89 c1                	mov    %eax,%ecx
  105cc4:	31 d2                	xor    %edx,%edx
  105cc6:	89 f0                	mov    %esi,%eax
  105cc8:	f7 f1                	div    %ecx
  105cca:	89 c6                	mov    %eax,%esi
  105ccc:	89 e8                	mov    %ebp,%eax
  105cce:	89 f7                	mov    %esi,%edi
  105cd0:	f7 f1                	div    %ecx
  105cd2:	89 fa                	mov    %edi,%edx
  105cd4:	83 c4 1c             	add    $0x1c,%esp
  105cd7:	5b                   	pop    %ebx
  105cd8:	5e                   	pop    %esi
  105cd9:	5f                   	pop    %edi
  105cda:	5d                   	pop    %ebp
  105cdb:	c3                   	ret    
  105cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105ce0:	39 f2                	cmp    %esi,%edx
  105ce2:	77 7c                	ja     105d60 <__udivdi3+0xd0>
  105ce4:	0f bd fa             	bsr    %edx,%edi
  105ce7:	83 f7 1f             	xor    $0x1f,%edi
  105cea:	0f 84 98 00 00 00    	je     105d88 <__udivdi3+0xf8>
  105cf0:	89 f9                	mov    %edi,%ecx
  105cf2:	b8 20 00 00 00       	mov    $0x20,%eax
  105cf7:	29 f8                	sub    %edi,%eax
  105cf9:	d3 e2                	shl    %cl,%edx
  105cfb:	89 54 24 08          	mov    %edx,0x8(%esp)
  105cff:	89 c1                	mov    %eax,%ecx
  105d01:	89 da                	mov    %ebx,%edx
  105d03:	d3 ea                	shr    %cl,%edx
  105d05:	8b 4c 24 08          	mov    0x8(%esp),%ecx
  105d09:	09 d1                	or     %edx,%ecx
  105d0b:	89 f2                	mov    %esi,%edx
  105d0d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  105d11:	89 f9                	mov    %edi,%ecx
  105d13:	d3 e3                	shl    %cl,%ebx
  105d15:	89 c1                	mov    %eax,%ecx
  105d17:	d3 ea                	shr    %cl,%edx
  105d19:	89 f9                	mov    %edi,%ecx
  105d1b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  105d1f:	d3 e6                	shl    %cl,%esi
  105d21:	89 eb                	mov    %ebp,%ebx
  105d23:	89 c1                	mov    %eax,%ecx
  105d25:	d3 eb                	shr    %cl,%ebx
  105d27:	09 de                	or     %ebx,%esi
  105d29:	89 f0                	mov    %esi,%eax
  105d2b:	f7 74 24 08          	divl   0x8(%esp)
  105d2f:	89 d6                	mov    %edx,%esi
  105d31:	89 c3                	mov    %eax,%ebx
  105d33:	f7 64 24 0c          	mull   0xc(%esp)
  105d37:	39 d6                	cmp    %edx,%esi
  105d39:	72 0c                	jb     105d47 <__udivdi3+0xb7>
  105d3b:	89 f9                	mov    %edi,%ecx
  105d3d:	d3 e5                	shl    %cl,%ebp
  105d3f:	39 c5                	cmp    %eax,%ebp
  105d41:	73 5d                	jae    105da0 <__udivdi3+0x110>
  105d43:	39 d6                	cmp    %edx,%esi
  105d45:	75 59                	jne    105da0 <__udivdi3+0x110>
  105d47:	8d 43 ff             	lea    -0x1(%ebx),%eax
  105d4a:	31 ff                	xor    %edi,%edi
  105d4c:	89 fa                	mov    %edi,%edx
  105d4e:	83 c4 1c             	add    $0x1c,%esp
  105d51:	5b                   	pop    %ebx
  105d52:	5e                   	pop    %esi
  105d53:	5f                   	pop    %edi
  105d54:	5d                   	pop    %ebp
  105d55:	c3                   	ret    
  105d56:	8d 76 00             	lea    0x0(%esi),%esi
  105d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  105d60:	31 ff                	xor    %edi,%edi
  105d62:	31 c0                	xor    %eax,%eax
  105d64:	89 fa                	mov    %edi,%edx
  105d66:	83 c4 1c             	add    $0x1c,%esp
  105d69:	5b                   	pop    %ebx
  105d6a:	5e                   	pop    %esi
  105d6b:	5f                   	pop    %edi
  105d6c:	5d                   	pop    %ebp
  105d6d:	c3                   	ret    
  105d6e:	66 90                	xchg   %ax,%ax
  105d70:	31 ff                	xor    %edi,%edi
  105d72:	89 e8                	mov    %ebp,%eax
  105d74:	89 f2                	mov    %esi,%edx
  105d76:	f7 f3                	div    %ebx
  105d78:	89 fa                	mov    %edi,%edx
  105d7a:	83 c4 1c             	add    $0x1c,%esp
  105d7d:	5b                   	pop    %ebx
  105d7e:	5e                   	pop    %esi
  105d7f:	5f                   	pop    %edi
  105d80:	5d                   	pop    %ebp
  105d81:	c3                   	ret    
  105d82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  105d88:	39 f2                	cmp    %esi,%edx
  105d8a:	72 06                	jb     105d92 <__udivdi3+0x102>
  105d8c:	31 c0                	xor    %eax,%eax
  105d8e:	39 eb                	cmp    %ebp,%ebx
  105d90:	77 d2                	ja     105d64 <__udivdi3+0xd4>
  105d92:	b8 01 00 00 00       	mov    $0x1,%eax
  105d97:	eb cb                	jmp    105d64 <__udivdi3+0xd4>
  105d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105da0:	89 d8                	mov    %ebx,%eax
  105da2:	31 ff                	xor    %edi,%edi
  105da4:	eb be                	jmp    105d64 <__udivdi3+0xd4>
  105da6:	66 90                	xchg   %ax,%ax
  105da8:	66 90                	xchg   %ax,%ax
  105daa:	66 90                	xchg   %ax,%ax
  105dac:	66 90                	xchg   %ax,%ax
  105dae:	66 90                	xchg   %ax,%ax

00105db0 <__umoddi3>:
  105db0:	55                   	push   %ebp
  105db1:	57                   	push   %edi
  105db2:	56                   	push   %esi
  105db3:	53                   	push   %ebx
  105db4:	83 ec 1c             	sub    $0x1c,%esp
  105db7:	8b 6c 24 3c          	mov    0x3c(%esp),%ebp
  105dbb:	8b 74 24 30          	mov    0x30(%esp),%esi
  105dbf:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  105dc3:	8b 7c 24 38          	mov    0x38(%esp),%edi
  105dc7:	85 ed                	test   %ebp,%ebp
  105dc9:	89 f0                	mov    %esi,%eax
  105dcb:	89 da                	mov    %ebx,%edx
  105dcd:	75 19                	jne    105de8 <__umoddi3+0x38>
  105dcf:	39 df                	cmp    %ebx,%edi
  105dd1:	0f 86 b1 00 00 00    	jbe    105e88 <__umoddi3+0xd8>
  105dd7:	f7 f7                	div    %edi
  105dd9:	89 d0                	mov    %edx,%eax
  105ddb:	31 d2                	xor    %edx,%edx
  105ddd:	83 c4 1c             	add    $0x1c,%esp
  105de0:	5b                   	pop    %ebx
  105de1:	5e                   	pop    %esi
  105de2:	5f                   	pop    %edi
  105de3:	5d                   	pop    %ebp
  105de4:	c3                   	ret    
  105de5:	8d 76 00             	lea    0x0(%esi),%esi
  105de8:	39 dd                	cmp    %ebx,%ebp
  105dea:	77 f1                	ja     105ddd <__umoddi3+0x2d>
  105dec:	0f bd cd             	bsr    %ebp,%ecx
  105def:	83 f1 1f             	xor    $0x1f,%ecx
  105df2:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  105df6:	0f 84 b4 00 00 00    	je     105eb0 <__umoddi3+0x100>
  105dfc:	b8 20 00 00 00       	mov    $0x20,%eax
  105e01:	89 c2                	mov    %eax,%edx
  105e03:	8b 44 24 04          	mov    0x4(%esp),%eax
  105e07:	29 c2                	sub    %eax,%edx
  105e09:	89 c1                	mov    %eax,%ecx
  105e0b:	89 f8                	mov    %edi,%eax
  105e0d:	d3 e5                	shl    %cl,%ebp
  105e0f:	89 d1                	mov    %edx,%ecx
  105e11:	89 54 24 0c          	mov    %edx,0xc(%esp)
  105e15:	d3 e8                	shr    %cl,%eax
  105e17:	09 c5                	or     %eax,%ebp
  105e19:	8b 44 24 04          	mov    0x4(%esp),%eax
  105e1d:	89 c1                	mov    %eax,%ecx
  105e1f:	d3 e7                	shl    %cl,%edi
  105e21:	89 d1                	mov    %edx,%ecx
  105e23:	89 7c 24 08          	mov    %edi,0x8(%esp)
  105e27:	89 df                	mov    %ebx,%edi
  105e29:	d3 ef                	shr    %cl,%edi
  105e2b:	89 c1                	mov    %eax,%ecx
  105e2d:	89 f0                	mov    %esi,%eax
  105e2f:	d3 e3                	shl    %cl,%ebx
  105e31:	89 d1                	mov    %edx,%ecx
  105e33:	89 fa                	mov    %edi,%edx
  105e35:	d3 e8                	shr    %cl,%eax
  105e37:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  105e3c:	09 d8                	or     %ebx,%eax
  105e3e:	f7 f5                	div    %ebp
  105e40:	d3 e6                	shl    %cl,%esi
  105e42:	89 d1                	mov    %edx,%ecx
  105e44:	f7 64 24 08          	mull   0x8(%esp)
  105e48:	39 d1                	cmp    %edx,%ecx
  105e4a:	89 c3                	mov    %eax,%ebx
  105e4c:	89 d7                	mov    %edx,%edi
  105e4e:	72 06                	jb     105e56 <__umoddi3+0xa6>
  105e50:	75 0e                	jne    105e60 <__umoddi3+0xb0>
  105e52:	39 c6                	cmp    %eax,%esi
  105e54:	73 0a                	jae    105e60 <__umoddi3+0xb0>
  105e56:	2b 44 24 08          	sub    0x8(%esp),%eax
  105e5a:	19 ea                	sbb    %ebp,%edx
  105e5c:	89 d7                	mov    %edx,%edi
  105e5e:	89 c3                	mov    %eax,%ebx
  105e60:	89 ca                	mov    %ecx,%edx
  105e62:	0f b6 4c 24 0c       	movzbl 0xc(%esp),%ecx
  105e67:	29 de                	sub    %ebx,%esi
  105e69:	19 fa                	sbb    %edi,%edx
  105e6b:	8b 5c 24 04          	mov    0x4(%esp),%ebx
  105e6f:	89 d0                	mov    %edx,%eax
  105e71:	d3 e0                	shl    %cl,%eax
  105e73:	89 d9                	mov    %ebx,%ecx
  105e75:	d3 ee                	shr    %cl,%esi
  105e77:	d3 ea                	shr    %cl,%edx
  105e79:	09 f0                	or     %esi,%eax
  105e7b:	83 c4 1c             	add    $0x1c,%esp
  105e7e:	5b                   	pop    %ebx
  105e7f:	5e                   	pop    %esi
  105e80:	5f                   	pop    %edi
  105e81:	5d                   	pop    %ebp
  105e82:	c3                   	ret    
  105e83:	90                   	nop
  105e84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  105e88:	85 ff                	test   %edi,%edi
  105e8a:	89 f9                	mov    %edi,%ecx
  105e8c:	75 0b                	jne    105e99 <__umoddi3+0xe9>
  105e8e:	b8 01 00 00 00       	mov    $0x1,%eax
  105e93:	31 d2                	xor    %edx,%edx
  105e95:	f7 f7                	div    %edi
  105e97:	89 c1                	mov    %eax,%ecx
  105e99:	89 d8                	mov    %ebx,%eax
  105e9b:	31 d2                	xor    %edx,%edx
  105e9d:	f7 f1                	div    %ecx
  105e9f:	89 f0                	mov    %esi,%eax
  105ea1:	f7 f1                	div    %ecx
  105ea3:	e9 31 ff ff ff       	jmp    105dd9 <__umoddi3+0x29>
  105ea8:	90                   	nop
  105ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  105eb0:	39 dd                	cmp    %ebx,%ebp
  105eb2:	72 08                	jb     105ebc <__umoddi3+0x10c>
  105eb4:	39 f7                	cmp    %esi,%edi
  105eb6:	0f 87 21 ff ff ff    	ja     105ddd <__umoddi3+0x2d>
  105ebc:	89 da                	mov    %ebx,%edx
  105ebe:	89 f0                	mov    %esi,%eax
  105ec0:	29 f8                	sub    %edi,%eax
  105ec2:	19 ea                	sbb    %ebp,%edx
  105ec4:	e9 14 ff ff ff       	jmp    105ddd <__umoddi3+0x2d>
