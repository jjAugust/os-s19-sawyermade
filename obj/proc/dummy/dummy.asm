
obj/proc/dummy/dummy:     file format elf32-i386


Disassembly of section .text:

400000a0 <main>:
400000a0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
400000a4:	83 e4 f0             	and    $0xfffffff0,%esp
400000a7:	ff 71 fc             	pushl  -0x4(%ecx)
400000aa:	55                   	push   %ebp
400000ab:	89 e5                	mov    %esp,%ebp
400000ad:	57                   	push   %edi
400000ae:	56                   	push   %esi
400000af:	53                   	push   %ebx
400000b0:	51                   	push   %ecx
400000b1:	31 f6                	xor    %esi,%esi
400000b3:	e8 af 02 00 00       	call   40000367 <__x86.get_pc_thunk.bx>
400000b8:	81 c3 48 3f 00 00    	add    $0x3f48,%ebx
400000be:	83 ec 24             	sub    $0x24,%esp
400000c1:	8d 83 c4 d6 ff ff    	lea    -0x293c(%ebx),%eax
400000c7:	50                   	push   %eax
400000c8:	e8 b3 04 00 00       	call   40000580 <printf>
400000cd:	8d 83 f8 d6 ff ff    	lea    -0x2908(%ebx),%eax
400000d3:	89 04 24             	mov    %eax,(%esp)
400000d6:	e8 a5 04 00 00       	call   40000580 <printf>
400000db:	8d 83 a0 d8 ff ff    	lea    -0x2760(%ebx),%eax
400000e1:	89 04 24             	mov    %eax,(%esp)
400000e4:	89 45 d8             	mov    %eax,-0x28(%ebp)
400000e7:	e8 94 04 00 00       	call   40000580 <printf>
400000ec:	8d 83 cd d8 ff ff    	lea    -0x2733(%ebx),%eax
400000f2:	83 c4 10             	add    $0x10,%esp
400000f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
400000f8:	90                   	nop
400000f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000100:	e8 6b 11 00 00       	call   40001270 <sys_getc>
40000105:	85 c0                	test   %eax,%eax
40000107:	74 f7                	je     40000100 <main+0x60>
40000109:	83 f8 1a             	cmp    $0x1a,%eax
4000010c:	74 42                	je     40000150 <main+0xb0>
4000010e:	83 f8 0a             	cmp    $0xa,%eax
40000111:	74 7f                	je     40000192 <main+0xf2>
40000113:	83 f8 0d             	cmp    $0xd,%eax
40000116:	74 7a                	je     40000192 <main+0xf2>
40000118:	8d 50 d0             	lea    -0x30(%eax),%edx
4000011b:	83 fa 09             	cmp    $0x9,%edx
4000011e:	77 e0                	ja     40000100 <main+0x60>
40000120:	81 fe 98 99 99 19    	cmp    $0x19999998,%esi
40000126:	77 48                	ja     40000170 <main+0xd0>
40000128:	8d 14 b6             	lea    (%esi,%esi,4),%edx
4000012b:	83 ec 08             	sub    $0x8,%esp
4000012e:	50                   	push   %eax
4000012f:	8d 74 50 d0          	lea    -0x30(%eax,%edx,2),%esi
40000133:	8d 83 f7 d8 ff ff    	lea    -0x2709(%ebx),%eax
40000139:	50                   	push   %eax
4000013a:	e8 41 04 00 00       	call   40000580 <printf>
4000013f:	83 c4 10             	add    $0x10,%esp
40000142:	e8 29 11 00 00       	call   40001270 <sys_getc>
40000147:	85 c0                	test   %eax,%eax
40000149:	74 b5                	je     40000100 <main+0x60>
4000014b:	83 f8 1a             	cmp    $0x1a,%eax
4000014e:	75 be                	jne    4000010e <main+0x6e>
40000150:	8d 83 30 d7 ff ff    	lea    -0x28d0(%ebx),%eax
40000156:	83 ec 0c             	sub    $0xc,%esp
40000159:	50                   	push   %eax
4000015a:	e8 21 04 00 00       	call   40000580 <printf>
4000015f:	83 c4 10             	add    $0x10,%esp
40000162:	8d 65 f0             	lea    -0x10(%ebp),%esp
40000165:	31 c0                	xor    %eax,%eax
40000167:	59                   	pop    %ecx
40000168:	5b                   	pop    %ebx
40000169:	5e                   	pop    %esi
4000016a:	5f                   	pop    %edi
4000016b:	5d                   	pop    %ebp
4000016c:	8d 61 fc             	lea    -0x4(%ecx),%esp
4000016f:	c3                   	ret    
40000170:	8d 83 df d8 ff ff    	lea    -0x2721(%ebx),%eax
40000176:	83 ec 0c             	sub    $0xc,%esp
40000179:	50                   	push   %eax
4000017a:	31 f6                	xor    %esi,%esi
4000017c:	e8 ff 03 00 00       	call   40000580 <printf>
40000181:	58                   	pop    %eax
40000182:	ff 75 d8             	pushl  -0x28(%ebp)
40000185:	e8 f6 03 00 00       	call   40000580 <printf>
4000018a:	83 c4 10             	add    $0x10,%esp
4000018d:	e9 6e ff ff ff       	jmp    40000100 <main+0x60>
40000192:	8d 83 f5 d8 ff ff    	lea    -0x270b(%ebx),%eax
40000198:	83 ec 0c             	sub    $0xc,%esp
4000019b:	8d bb c9 d8 ff ff    	lea    -0x2737(%ebx),%edi
400001a1:	50                   	push   %eax
400001a2:	e8 d9 03 00 00       	call   40000580 <printf>
400001a7:	58                   	pop    %eax
400001a8:	8d 83 b4 d8 ff ff    	lea    -0x274c(%ebx),%eax
400001ae:	5a                   	pop    %edx
400001af:	56                   	push   %esi
400001b0:	50                   	push   %eax
400001b1:	e8 ca 03 00 00       	call   40000580 <printf>
400001b6:	8d 83 54 d7 ff ff    	lea    -0x28ac(%ebx),%eax
400001bc:	89 04 24             	mov    %eax,(%esp)
400001bf:	89 45 dc             	mov    %eax,-0x24(%ebp)
400001c2:	e8 b9 03 00 00       	call   40000580 <printf>
400001c7:	83 c4 10             	add    $0x10,%esp
400001ca:	e8 a1 10 00 00       	call   40001270 <sys_getc>
400001cf:	84 c0                	test   %al,%al
400001d1:	89 c2                	mov    %eax,%edx
400001d3:	74 f5                	je     400001ca <main+0x12a>
400001d5:	83 ec 08             	sub    $0x8,%esp
400001d8:	0f be c0             	movsbl %al,%eax
400001db:	88 55 e4             	mov    %dl,-0x1c(%ebp)
400001de:	50                   	push   %eax
400001df:	57                   	push   %edi
400001e0:	e8 9b 03 00 00       	call   40000580 <printf>
400001e5:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
400001e9:	83 c4 10             	add    $0x10,%esp
400001ec:	80 fa 72             	cmp    $0x72,%dl
400001ef:	74 29                	je     4000021a <main+0x17a>
400001f1:	80 fa 77             	cmp    $0x77,%dl
400001f4:	74 45                	je     4000023b <main+0x19b>
400001f6:	83 ec 0c             	sub    $0xc,%esp
400001f9:	ff 75 e0             	pushl  -0x20(%ebp)
400001fc:	e8 7f 03 00 00       	call   40000580 <printf>
40000201:	5a                   	pop    %edx
40000202:	ff 75 dc             	pushl  -0x24(%ebp)
40000205:	e8 76 03 00 00       	call   40000580 <printf>
4000020a:	83 c4 10             	add    $0x10,%esp
4000020d:	e8 5e 10 00 00       	call   40001270 <sys_getc>
40000212:	84 c0                	test   %al,%al
40000214:	89 c2                	mov    %eax,%edx
40000216:	75 bd                	jne    400001d5 <main+0x135>
40000218:	eb b0                	jmp    400001ca <main+0x12a>
4000021a:	8d 83 84 d7 ff ff    	lea    -0x287c(%ebx),%eax
40000220:	57                   	push   %edi
40000221:	ff 36                	pushl  (%esi)
40000223:	56                   	push   %esi
40000224:	50                   	push   %eax
40000225:	e8 56 03 00 00       	call   40000580 <printf>
4000022a:	83 c4 10             	add    $0x10,%esp
4000022d:	83 ec 0c             	sub    $0xc,%esp
40000230:	8d 83 68 d8 ff ff    	lea    -0x2798(%ebx),%eax
40000236:	e9 3e ff ff ff       	jmp    40000179 <main+0xd9>
4000023b:	8d 83 ac d7 ff ff    	lea    -0x2854(%ebx),%eax
40000241:	83 ec 0c             	sub    $0xc,%esp
40000244:	50                   	push   %eax
40000245:	e8 36 03 00 00       	call   40000580 <printf>
4000024a:	8d 83 e0 d7 ff ff    	lea    -0x2820(%ebx),%eax
40000250:	89 04 24             	mov    %eax,(%esp)
40000253:	e8 28 03 00 00       	call   40000580 <printf>
40000258:	83 c4 10             	add    $0x10,%esp
4000025b:	e8 10 10 00 00       	call   40001270 <sys_getc>
40000260:	8d 50 d0             	lea    -0x30(%eax),%edx
40000263:	83 fa 09             	cmp    $0x9,%edx
40000266:	77 f3                	ja     4000025b <main+0x1bb>
40000268:	51                   	push   %ecx
40000269:	51                   	push   %ecx
4000026a:	50                   	push   %eax
4000026b:	57                   	push   %edi
4000026c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
4000026f:	e8 0c 03 00 00       	call   40000580 <printf>
40000274:	8b 55 e4             	mov    -0x1c(%ebp),%edx
40000277:	8d 83 00 d8 ff ff    	lea    -0x2800(%ebx),%eax
4000027d:	89 16                	mov    %edx,(%esi)
4000027f:	89 04 24             	mov    %eax,(%esp)
40000282:	e8 f9 02 00 00       	call   40000580 <printf>
40000287:	83 c4 10             	add    $0x10,%esp
4000028a:	eb a1                	jmp    4000022d <main+0x18d>

4000028c <_start>:
4000028c:	60                   	pusha  
4000028d:	e8 9e 0f 00 00       	call   40001230 <init>
40000292:	e8 09 fe ff ff       	call   400000a0 <main>
40000297:	61                   	popa   
40000298:	c3                   	ret    
40000299:	66 90                	xchg   %ax,%ax
4000029b:	66 90                	xchg   %ax,%ax
4000029d:	66 90                	xchg   %ax,%ax
4000029f:	90                   	nop

400002a0 <debug>:
400002a0:	53                   	push   %ebx
400002a1:	e8 c1 00 00 00       	call   40000367 <__x86.get_pc_thunk.bx>
400002a6:	81 c3 5a 3d 00 00    	add    $0x3d5a,%ebx
400002ac:	83 ec 0c             	sub    $0xc,%esp
400002af:	8d 83 2c d5 ff ff    	lea    -0x2ad4(%ebx),%eax
400002b5:	ff 74 24 18          	pushl  0x18(%esp)
400002b9:	ff 74 24 18          	pushl  0x18(%esp)
400002bd:	50                   	push   %eax
400002be:	e8 bd 02 00 00       	call   40000580 <printf>
400002c3:	58                   	pop    %eax
400002c4:	5a                   	pop    %edx
400002c5:	8d 44 24 24          	lea    0x24(%esp),%eax
400002c9:	50                   	push   %eax
400002ca:	ff 74 24 24          	pushl  0x24(%esp)
400002ce:	e8 3d 02 00 00       	call   40000510 <vcprintf>
400002d3:	83 c4 18             	add    $0x18,%esp
400002d6:	5b                   	pop    %ebx
400002d7:	c3                   	ret    
400002d8:	90                   	nop
400002d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

400002e0 <warn>:
400002e0:	53                   	push   %ebx
400002e1:	e8 81 00 00 00       	call   40000367 <__x86.get_pc_thunk.bx>
400002e6:	81 c3 1a 3d 00 00    	add    $0x3d1a,%ebx
400002ec:	83 ec 0c             	sub    $0xc,%esp
400002ef:	8d 83 38 d5 ff ff    	lea    -0x2ac8(%ebx),%eax
400002f5:	ff 74 24 18          	pushl  0x18(%esp)
400002f9:	ff 74 24 18          	pushl  0x18(%esp)
400002fd:	50                   	push   %eax
400002fe:	e8 7d 02 00 00       	call   40000580 <printf>
40000303:	58                   	pop    %eax
40000304:	5a                   	pop    %edx
40000305:	8d 44 24 24          	lea    0x24(%esp),%eax
40000309:	50                   	push   %eax
4000030a:	ff 74 24 24          	pushl  0x24(%esp)
4000030e:	e8 fd 01 00 00       	call   40000510 <vcprintf>
40000313:	83 c4 18             	add    $0x18,%esp
40000316:	5b                   	pop    %ebx
40000317:	c3                   	ret    
40000318:	90                   	nop
40000319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000320 <panic>:
40000320:	53                   	push   %ebx
40000321:	e8 41 00 00 00       	call   40000367 <__x86.get_pc_thunk.bx>
40000326:	81 c3 da 3c 00 00    	add    $0x3cda,%ebx
4000032c:	83 ec 0c             	sub    $0xc,%esp
4000032f:	8d 83 44 d5 ff ff    	lea    -0x2abc(%ebx),%eax
40000335:	ff 74 24 18          	pushl  0x18(%esp)
40000339:	ff 74 24 18          	pushl  0x18(%esp)
4000033d:	50                   	push   %eax
4000033e:	e8 3d 02 00 00       	call   40000580 <printf>
40000343:	58                   	pop    %eax
40000344:	5a                   	pop    %edx
40000345:	8d 44 24 24          	lea    0x24(%esp),%eax
40000349:	50                   	push   %eax
4000034a:	ff 74 24 24          	pushl  0x24(%esp)
4000034e:	e8 bd 01 00 00       	call   40000510 <vcprintf>
40000353:	83 c4 10             	add    $0x10,%esp
40000356:	8d 76 00             	lea    0x0(%esi),%esi
40000359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000360:	e8 fb 0e 00 00       	call   40001260 <yield>
40000365:	eb f9                	jmp    40000360 <panic+0x40>

40000367 <__x86.get_pc_thunk.bx>:
40000367:	8b 1c 24             	mov    (%esp),%ebx
4000036a:	c3                   	ret    
4000036b:	66 90                	xchg   %ax,%ax
4000036d:	66 90                	xchg   %ax,%ax
4000036f:	90                   	nop

40000370 <atoi>:
40000370:	55                   	push   %ebp
40000371:	57                   	push   %edi
40000372:	56                   	push   %esi
40000373:	53                   	push   %ebx
40000374:	8b 74 24 14          	mov    0x14(%esp),%esi
40000378:	0f be 16             	movsbl (%esi),%edx
4000037b:	80 fa 2b             	cmp    $0x2b,%dl
4000037e:	74 70                	je     400003f0 <atoi+0x80>
40000380:	31 ed                	xor    %ebp,%ebp
40000382:	31 ff                	xor    %edi,%edi
40000384:	80 fa 2d             	cmp    $0x2d,%dl
40000387:	74 47                	je     400003d0 <atoi+0x60>
40000389:	8d 42 d0             	lea    -0x30(%edx),%eax
4000038c:	3c 09                	cmp    $0x9,%al
4000038e:	77 55                	ja     400003e5 <atoi+0x75>
40000390:	89 f8                	mov    %edi,%eax
40000392:	31 c9                	xor    %ecx,%ecx
40000394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000398:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
4000039b:	83 c0 01             	add    $0x1,%eax
4000039e:	8d 4c 4a d0          	lea    -0x30(%edx,%ecx,2),%ecx
400003a2:	0f be 14 06          	movsbl (%esi,%eax,1),%edx
400003a6:	8d 5a d0             	lea    -0x30(%edx),%ebx
400003a9:	80 fb 09             	cmp    $0x9,%bl
400003ac:	76 ea                	jbe    40000398 <atoi+0x28>
400003ae:	39 c7                	cmp    %eax,%edi
400003b0:	74 33                	je     400003e5 <atoi+0x75>
400003b2:	89 ca                	mov    %ecx,%edx
400003b4:	f7 da                	neg    %edx
400003b6:	85 ed                	test   %ebp,%ebp
400003b8:	0f 45 ca             	cmovne %edx,%ecx
400003bb:	8b 54 24 18          	mov    0x18(%esp),%edx
400003bf:	89 0a                	mov    %ecx,(%edx)
400003c1:	5b                   	pop    %ebx
400003c2:	5e                   	pop    %esi
400003c3:	5f                   	pop    %edi
400003c4:	5d                   	pop    %ebp
400003c5:	c3                   	ret    
400003c6:	8d 76 00             	lea    0x0(%esi),%esi
400003c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
400003d0:	0f be 56 01          	movsbl 0x1(%esi),%edx
400003d4:	bd 01 00 00 00       	mov    $0x1,%ebp
400003d9:	bf 01 00 00 00       	mov    $0x1,%edi
400003de:	8d 42 d0             	lea    -0x30(%edx),%eax
400003e1:	3c 09                	cmp    $0x9,%al
400003e3:	76 ab                	jbe    40000390 <atoi+0x20>
400003e5:	5b                   	pop    %ebx
400003e6:	31 c0                	xor    %eax,%eax
400003e8:	5e                   	pop    %esi
400003e9:	5f                   	pop    %edi
400003ea:	5d                   	pop    %ebp
400003eb:	c3                   	ret    
400003ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
400003f0:	0f be 56 01          	movsbl 0x1(%esi),%edx
400003f4:	31 ed                	xor    %ebp,%ebp
400003f6:	bf 01 00 00 00       	mov    $0x1,%edi
400003fb:	eb 8c                	jmp    40000389 <atoi+0x19>
400003fd:	66 90                	xchg   %ax,%ax
400003ff:	90                   	nop

40000400 <putch>:
40000400:	56                   	push   %esi
40000401:	53                   	push   %ebx
40000402:	e8 60 ff ff ff       	call   40000367 <__x86.get_pc_thunk.bx>
40000407:	81 c3 f9 3b 00 00    	add    $0x3bf9,%ebx
4000040d:	83 ec 04             	sub    $0x4,%esp
40000410:	8b 74 24 14          	mov    0x14(%esp),%esi
40000414:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000418:	8b 16                	mov    (%esi),%edx
4000041a:	8d 42 01             	lea    0x1(%edx),%eax
4000041d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
40000422:	89 06                	mov    %eax,(%esi)
40000424:	88 4c 16 08          	mov    %cl,0x8(%esi,%edx,1)
40000428:	74 0e                	je     40000438 <putch+0x38>
4000042a:	83 46 04 01          	addl   $0x1,0x4(%esi)
4000042e:	83 c4 04             	add    $0x4,%esp
40000431:	5b                   	pop    %ebx
40000432:	5e                   	pop    %esi
40000433:	c3                   	ret    
40000434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000438:	8d 46 08             	lea    0x8(%esi),%eax
4000043b:	83 ec 08             	sub    $0x8,%esp
4000043e:	c6 86 07 10 00 00 00 	movb   $0x0,0x1007(%esi)
40000445:	68 ff 0f 00 00       	push   $0xfff
4000044a:	50                   	push   %eax
4000044b:	e8 40 0e 00 00       	call   40001290 <sys_puts>
40000450:	83 c4 10             	add    $0x10,%esp
40000453:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
40000459:	83 46 04 01          	addl   $0x1,0x4(%esi)
4000045d:	83 c4 04             	add    $0x4,%esp
40000460:	5b                   	pop    %ebx
40000461:	5e                   	pop    %esi
40000462:	c3                   	ret    
40000463:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000470 <gets>:
40000470:	55                   	push   %ebp
40000471:	57                   	push   %edi
40000472:	56                   	push   %esi
40000473:	53                   	push   %ebx
40000474:	e8 ee fe ff ff       	call   40000367 <__x86.get_pc_thunk.bx>
40000479:	81 c3 87 3b 00 00    	add    $0x3b87,%ebx
4000047f:	83 ec 2c             	sub    $0x2c,%esp
40000482:	83 7c 24 44 01       	cmpl   $0x1,0x44(%esp)
40000487:	c6 44 24 1f 00       	movb   $0x0,0x1f(%esp)
4000048c:	7e 54                	jle    400004e2 <gets+0x72>
4000048e:	8b 74 24 40          	mov    0x40(%esp),%esi
40000492:	8b 54 24 44          	mov    0x44(%esp),%edx
40000496:	8d 7c 24 1e          	lea    0x1e(%esp),%edi
4000049a:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
4000049e:	89 44 24 0c          	mov    %eax,0xc(%esp)
400004a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400004a8:	e8 c3 0d 00 00       	call   40001270 <sys_getc>
400004ad:	84 c0                	test   %al,%al
400004af:	89 c5                	mov    %eax,%ebp
400004b1:	74 f5                	je     400004a8 <gets+0x38>
400004b3:	88 44 24 1e          	mov    %al,0x1e(%esp)
400004b7:	89 44 24 08          	mov    %eax,0x8(%esp)
400004bb:	83 ec 08             	sub    $0x8,%esp
400004be:	6a 02                	push   $0x2
400004c0:	57                   	push   %edi
400004c1:	e8 ca 0d 00 00       	call   40001290 <sys_puts>
400004c6:	89 e8                	mov    %ebp,%eax
400004c8:	83 c4 10             	add    $0x10,%esp
400004cb:	3c 0a                	cmp    $0xa,%al
400004cd:	74 31                	je     40000500 <gets+0x90>
400004cf:	3c 0d                	cmp    $0xd,%al
400004d1:	8b 44 24 08          	mov    0x8(%esp),%eax
400004d5:	74 29                	je     40000500 <gets+0x90>
400004d7:	88 06                	mov    %al,(%esi)
400004d9:	83 c6 01             	add    $0x1,%esi
400004dc:	3b 74 24 0c          	cmp    0xc(%esp),%esi
400004e0:	75 c6                	jne    400004a8 <gets+0x38>
400004e2:	8b 44 24 40          	mov    0x40(%esp),%eax
400004e6:	8b 4c 24 44          	mov    0x44(%esp),%ecx
400004ea:	c6 44 08 ff 00       	movb   $0x0,-0x1(%eax,%ecx,1)
400004ef:	83 c4 2c             	add    $0x2c,%esp
400004f2:	5b                   	pop    %ebx
400004f3:	5e                   	pop    %esi
400004f4:	5f                   	pop    %edi
400004f5:	5d                   	pop    %ebp
400004f6:	c3                   	ret    
400004f7:	89 f6                	mov    %esi,%esi
400004f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000500:	c6 06 00             	movb   $0x0,(%esi)
40000503:	83 c4 2c             	add    $0x2c,%esp
40000506:	5b                   	pop    %ebx
40000507:	5e                   	pop    %esi
40000508:	5f                   	pop    %edi
40000509:	5d                   	pop    %ebp
4000050a:	c3                   	ret    
4000050b:	90                   	nop
4000050c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40000510 <vcprintf>:
40000510:	53                   	push   %ebx
40000511:	e8 51 fe ff ff       	call   40000367 <__x86.get_pc_thunk.bx>
40000516:	81 c3 ea 3a 00 00    	add    $0x3aea,%ebx
4000051c:	81 ec 18 10 00 00    	sub    $0x1018,%esp
40000522:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
40000529:	00 
4000052a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000531:	00 
40000532:	ff b4 24 24 10 00 00 	pushl  0x1024(%esp)
40000539:	ff b4 24 24 10 00 00 	pushl  0x1024(%esp)
40000540:	8d 44 24 10          	lea    0x10(%esp),%eax
40000544:	50                   	push   %eax
40000545:	8d 83 00 c4 ff ff    	lea    -0x3c00(%ebx),%eax
4000054b:	50                   	push   %eax
4000054c:	e8 8f 01 00 00       	call   400006e0 <vprintfmt>
40000551:	8b 44 24 18          	mov    0x18(%esp),%eax
40000555:	c6 44 04 20 00       	movb   $0x0,0x20(%esp,%eax,1)
4000055a:	5a                   	pop    %edx
4000055b:	59                   	pop    %ecx
4000055c:	50                   	push   %eax
4000055d:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000561:	50                   	push   %eax
40000562:	e8 29 0d 00 00       	call   40001290 <sys_puts>
40000567:	8b 44 24 1c          	mov    0x1c(%esp),%eax
4000056b:	81 c4 28 10 00 00    	add    $0x1028,%esp
40000571:	5b                   	pop    %ebx
40000572:	c3                   	ret    
40000573:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000580 <printf>:
40000580:	83 ec 14             	sub    $0x14,%esp
40000583:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000587:	50                   	push   %eax
40000588:	ff 74 24 1c          	pushl  0x1c(%esp)
4000058c:	e8 7f ff ff ff       	call   40000510 <vcprintf>
40000591:	83 c4 1c             	add    $0x1c,%esp
40000594:	c3                   	ret    
40000595:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

400005a0 <printf2>:
400005a0:	83 ec 14             	sub    $0x14,%esp
400005a3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
400005a7:	50                   	push   %eax
400005a8:	ff 74 24 1c          	pushl  0x1c(%esp)
400005ac:	e8 5f ff ff ff       	call   40000510 <vcprintf>
400005b1:	83 c4 1c             	add    $0x1c,%esp
400005b4:	c3                   	ret    
400005b5:	66 90                	xchg   %ax,%ax
400005b7:	66 90                	xchg   %ax,%ax
400005b9:	66 90                	xchg   %ax,%ax
400005bb:	66 90                	xchg   %ax,%ax
400005bd:	66 90                	xchg   %ax,%ax
400005bf:	90                   	nop

400005c0 <printnum>:
400005c0:	55                   	push   %ebp
400005c1:	57                   	push   %edi
400005c2:	89 d7                	mov    %edx,%edi
400005c4:	56                   	push   %esi
400005c5:	53                   	push   %ebx
400005c6:	89 c6                	mov    %eax,%esi
400005c8:	e8 6e 07 00 00       	call   40000d3b <__x86.get_pc_thunk.cx>
400005cd:	81 c1 33 3a 00 00    	add    $0x3a33,%ecx
400005d3:	83 ec 2c             	sub    $0x2c,%esp
400005d6:	8b 5c 24 50          	mov    0x50(%esp),%ebx
400005da:	89 4c 24 18          	mov    %ecx,0x18(%esp)
400005de:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
400005e5:	00 
400005e6:	8b 4c 24 44          	mov    0x44(%esp),%ecx
400005ea:	8b 54 24 40          	mov    0x40(%esp),%edx
400005ee:	8b 44 24 48          	mov    0x48(%esp),%eax
400005f2:	89 5c 24 1c          	mov    %ebx,0x1c(%esp)
400005f6:	8b 5c 24 4c          	mov    0x4c(%esp),%ebx
400005fa:	89 4c 24 14          	mov    %ecx,0x14(%esp)
400005fe:	89 54 24 10          	mov    %edx,0x10(%esp)
40000602:	89 44 24 08          	mov    %eax,0x8(%esp)
40000606:	83 eb 01             	sub    $0x1,%ebx
40000609:	39 4c 24 0c          	cmp    %ecx,0xc(%esp)
4000060d:	73 71                	jae    40000680 <printnum+0xc0>
4000060f:	83 ec 0c             	sub    $0xc,%esp
40000612:	ff 74 24 28          	pushl  0x28(%esp)
40000616:	53                   	push   %ebx
40000617:	50                   	push   %eax
40000618:	83 ec 08             	sub    $0x8,%esp
4000061b:	ff 74 24 2c          	pushl  0x2c(%esp)
4000061f:	ff 74 24 2c          	pushl  0x2c(%esp)
40000623:	ff 74 24 3c          	pushl  0x3c(%esp)
40000627:	ff 74 24 3c          	pushl  0x3c(%esp)
4000062b:	8b 5c 24 48          	mov    0x48(%esp),%ebx
4000062f:	e8 bc 0c 00 00       	call   400012f0 <__udivdi3>
40000634:	83 c4 18             	add    $0x18,%esp
40000637:	52                   	push   %edx
40000638:	50                   	push   %eax
40000639:	89 fa                	mov    %edi,%edx
4000063b:	89 f0                	mov    %esi,%eax
4000063d:	e8 7e ff ff ff       	call   400005c0 <printnum>
40000642:	83 c4 20             	add    $0x20,%esp
40000645:	89 7c 24 44          	mov    %edi,0x44(%esp)
40000649:	ff 74 24 0c          	pushl  0xc(%esp)
4000064d:	ff 74 24 0c          	pushl  0xc(%esp)
40000651:	ff 74 24 1c          	pushl  0x1c(%esp)
40000655:	ff 74 24 1c          	pushl  0x1c(%esp)
40000659:	8b 7c 24 28          	mov    0x28(%esp),%edi
4000065d:	89 fb                	mov    %edi,%ebx
4000065f:	e8 ac 0d 00 00       	call   40001410 <__umoddi3>
40000664:	0f be 84 07 50 d5 ff 	movsbl -0x2ab0(%edi,%eax,1),%eax
4000066b:	ff 
4000066c:	89 44 24 50          	mov    %eax,0x50(%esp)
40000670:	83 c4 3c             	add    $0x3c,%esp
40000673:	89 f0                	mov    %esi,%eax
40000675:	5b                   	pop    %ebx
40000676:	5e                   	pop    %esi
40000677:	5f                   	pop    %edi
40000678:	5d                   	pop    %ebp
40000679:	ff e0                	jmp    *%eax
4000067b:	90                   	nop
4000067c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000680:	76 26                	jbe    400006a8 <printnum+0xe8>
40000682:	85 db                	test   %ebx,%ebx
40000684:	8b 6c 24 1c          	mov    0x1c(%esp),%ebp
40000688:	7e bb                	jle    40000645 <printnum+0x85>
4000068a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000690:	83 ec 08             	sub    $0x8,%esp
40000693:	57                   	push   %edi
40000694:	55                   	push   %ebp
40000695:	ff d6                	call   *%esi
40000697:	83 c4 10             	add    $0x10,%esp
4000069a:	83 eb 01             	sub    $0x1,%ebx
4000069d:	75 f1                	jne    40000690 <printnum+0xd0>
4000069f:	eb a4                	jmp    40000645 <printnum+0x85>
400006a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400006a8:	39 d0                	cmp    %edx,%eax
400006aa:	0f 86 5f ff ff ff    	jbe    4000060f <printnum+0x4f>
400006b0:	eb d0                	jmp    40000682 <printnum+0xc2>
400006b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400006b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

400006c0 <sprintputch>:
400006c0:	8b 44 24 08          	mov    0x8(%esp),%eax
400006c4:	83 40 08 01          	addl   $0x1,0x8(%eax)
400006c8:	8b 10                	mov    (%eax),%edx
400006ca:	3b 50 04             	cmp    0x4(%eax),%edx
400006cd:	73 0b                	jae    400006da <sprintputch+0x1a>
400006cf:	8d 4a 01             	lea    0x1(%edx),%ecx
400006d2:	89 08                	mov    %ecx,(%eax)
400006d4:	8b 44 24 04          	mov    0x4(%esp),%eax
400006d8:	88 02                	mov    %al,(%edx)
400006da:	f3 c3                	repz ret 
400006dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

400006e0 <vprintfmt>:
400006e0:	55                   	push   %ebp
400006e1:	57                   	push   %edi
400006e2:	56                   	push   %esi
400006e3:	53                   	push   %ebx
400006e4:	e8 4a 06 00 00       	call   40000d33 <__x86.get_pc_thunk.ax>
400006e9:	05 17 39 00 00       	add    $0x3917,%eax
400006ee:	83 ec 3c             	sub    $0x3c,%esp
400006f1:	8b 74 24 50          	mov    0x50(%esp),%esi
400006f5:	8b 7c 24 54          	mov    0x54(%esp),%edi
400006f9:	8b 6c 24 58          	mov    0x58(%esp),%ebp
400006fd:	89 44 24 0c          	mov    %eax,0xc(%esp)
40000701:	0f b6 45 00          	movzbl 0x0(%ebp),%eax
40000705:	8d 5d 01             	lea    0x1(%ebp),%ebx
40000708:	83 f8 25             	cmp    $0x25,%eax
4000070b:	75 19                	jne    40000726 <vprintfmt+0x46>
4000070d:	eb 29                	jmp    40000738 <vprintfmt+0x58>
4000070f:	90                   	nop
40000710:	83 ec 08             	sub    $0x8,%esp
40000713:	83 c3 01             	add    $0x1,%ebx
40000716:	57                   	push   %edi
40000717:	50                   	push   %eax
40000718:	ff d6                	call   *%esi
4000071a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
4000071e:	83 c4 10             	add    $0x10,%esp
40000721:	83 f8 25             	cmp    $0x25,%eax
40000724:	74 12                	je     40000738 <vprintfmt+0x58>
40000726:	85 c0                	test   %eax,%eax
40000728:	75 e6                	jne    40000710 <vprintfmt+0x30>
4000072a:	83 c4 3c             	add    $0x3c,%esp
4000072d:	5b                   	pop    %ebx
4000072e:	5e                   	pop    %esi
4000072f:	5f                   	pop    %edi
40000730:	5d                   	pop    %ebp
40000731:	c3                   	ret    
40000732:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000738:	ba ff ff ff ff       	mov    $0xffffffff,%edx
4000073d:	c6 44 24 1c 20       	movb   $0x20,0x1c(%esp)
40000742:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
40000749:	00 
4000074a:	c7 44 24 18 ff ff ff 	movl   $0xffffffff,0x18(%esp)
40000751:	ff 
40000752:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
40000759:	00 
4000075a:	89 54 24 20          	mov    %edx,0x20(%esp)
4000075e:	89 74 24 50          	mov    %esi,0x50(%esp)
40000762:	0f b6 0b             	movzbl (%ebx),%ecx
40000765:	8d 6b 01             	lea    0x1(%ebx),%ebp
40000768:	8d 41 dd             	lea    -0x23(%ecx),%eax
4000076b:	3c 55                	cmp    $0x55,%al
4000076d:	0f 87 df 02 00 00    	ja     40000a52 <.L25>
40000773:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000777:	0f b6 c0             	movzbl %al,%eax
4000077a:	8b b4 82 68 d5 ff ff 	mov    -0x2a98(%edx,%eax,4),%esi
40000781:	01 d6                	add    %edx,%esi
40000783:	ff e6                	jmp    *%esi

40000785 <.L65>:
40000785:	89 eb                	mov    %ebp,%ebx
40000787:	c6 44 24 1c 30       	movb   $0x30,0x1c(%esp)
4000078c:	eb d4                	jmp    40000762 <vprintfmt+0x82>

4000078e <.L32>:
4000078e:	0f be 43 01          	movsbl 0x1(%ebx),%eax
40000792:	0f b6 d1             	movzbl %cl,%edx
40000795:	89 eb                	mov    %ebp,%ebx
40000797:	83 ea 30             	sub    $0x30,%edx
4000079a:	89 54 24 20          	mov    %edx,0x20(%esp)
4000079e:	8d 48 d0             	lea    -0x30(%eax),%ecx
400007a1:	83 f9 09             	cmp    $0x9,%ecx
400007a4:	0f 87 62 02 00 00    	ja     40000a0c <.L29+0x17>
400007aa:	8b 74 24 50          	mov    0x50(%esp),%esi
400007ae:	66 90                	xchg   %ax,%ax
400007b0:	8d 14 92             	lea    (%edx,%edx,4),%edx
400007b3:	83 c3 01             	add    $0x1,%ebx
400007b6:	8d 54 50 d0          	lea    -0x30(%eax,%edx,2),%edx
400007ba:	0f be 03             	movsbl (%ebx),%eax
400007bd:	8d 48 d0             	lea    -0x30(%eax),%ecx
400007c0:	83 f9 09             	cmp    $0x9,%ecx
400007c3:	76 eb                	jbe    400007b0 <.L32+0x22>
400007c5:	89 54 24 20          	mov    %edx,0x20(%esp)
400007c9:	89 74 24 50          	mov    %esi,0x50(%esp)
400007cd:	e9 3a 02 00 00       	jmp    40000a0c <.L29+0x17>

400007d2 <.L33>:
400007d2:	8b 44 24 5c          	mov    0x5c(%esp),%eax
400007d6:	8b 74 24 50          	mov    0x50(%esp),%esi
400007da:	83 ec 08             	sub    $0x8,%esp
400007dd:	57                   	push   %edi
400007de:	8d 58 04             	lea    0x4(%eax),%ebx
400007e1:	8b 44 24 68          	mov    0x68(%esp),%eax
400007e5:	ff 30                	pushl  (%eax)
400007e7:	ff d6                	call   *%esi
400007e9:	83 c4 10             	add    $0x10,%esp
400007ec:	89 5c 24 5c          	mov    %ebx,0x5c(%esp)
400007f0:	e9 0c ff ff ff       	jmp    40000701 <vprintfmt+0x21>

400007f5 <.L34>:
400007f5:	83 7c 24 24 01       	cmpl   $0x1,0x24(%esp)
400007fa:	8b 74 24 50          	mov    0x50(%esp),%esi
400007fe:	8b 44 24 5c          	mov    0x5c(%esp),%eax
40000802:	0f 8e 66 03 00 00    	jle    40000b6e <.L25+0x11c>
40000808:	8b 08                	mov    (%eax),%ecx
4000080a:	8b 58 04             	mov    0x4(%eax),%ebx
4000080d:	83 c0 08             	add    $0x8,%eax
40000810:	89 44 24 5c          	mov    %eax,0x5c(%esp)
40000814:	85 db                	test   %ebx,%ebx
40000816:	0f 89 83 01 00 00    	jns    4000099f <.L39+0x1f>
4000081c:	89 4c 24 10          	mov    %ecx,0x10(%esp)
40000820:	89 5c 24 14          	mov    %ebx,0x14(%esp)
40000824:	83 ec 08             	sub    $0x8,%esp
40000827:	57                   	push   %edi
40000828:	6a 2d                	push   $0x2d
4000082a:	ff d6                	call   *%esi
4000082c:	8b 4c 24 20          	mov    0x20(%esp),%ecx
40000830:	8b 5c 24 24          	mov    0x24(%esp),%ebx
40000834:	ba 0a 00 00 00       	mov    $0xa,%edx
40000839:	f7 d9                	neg    %ecx
4000083b:	83 d3 00             	adc    $0x0,%ebx
4000083e:	83 c4 10             	add    $0x10,%esp
40000841:	f7 db                	neg    %ebx
40000843:	90                   	nop
40000844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000848:	83 ec 0c             	sub    $0xc,%esp
4000084b:	0f be 44 24 28       	movsbl 0x28(%esp),%eax
40000850:	50                   	push   %eax
40000851:	ff 74 24 28          	pushl  0x28(%esp)
40000855:	89 f0                	mov    %esi,%eax
40000857:	52                   	push   %edx
40000858:	53                   	push   %ebx
40000859:	89 fa                	mov    %edi,%edx
4000085b:	51                   	push   %ecx
4000085c:	e8 5f fd ff ff       	call   400005c0 <printnum>
40000861:	83 c4 20             	add    $0x20,%esp
40000864:	e9 98 fe ff ff       	jmp    40000701 <vprintfmt+0x21>

40000869 <.L35>:
40000869:	83 44 24 24 01       	addl   $0x1,0x24(%esp)
4000086e:	89 eb                	mov    %ebp,%ebx
40000870:	e9 ed fe ff ff       	jmp    40000762 <vprintfmt+0x82>

40000875 <.L36>:
40000875:	8b 74 24 50          	mov    0x50(%esp),%esi
40000879:	83 ec 08             	sub    $0x8,%esp
4000087c:	57                   	push   %edi
4000087d:	6a 58                	push   $0x58
4000087f:	ff d6                	call   *%esi
40000881:	59                   	pop    %ecx
40000882:	5b                   	pop    %ebx
40000883:	57                   	push   %edi
40000884:	6a 58                	push   $0x58
40000886:	ff d6                	call   *%esi
40000888:	58                   	pop    %eax
40000889:	5a                   	pop    %edx
4000088a:	57                   	push   %edi
4000088b:	6a 58                	push   $0x58
4000088d:	ff d6                	call   *%esi
4000088f:	83 c4 10             	add    $0x10,%esp
40000892:	e9 6a fe ff ff       	jmp    40000701 <vprintfmt+0x21>

40000897 <.L37>:
40000897:	8b 74 24 50          	mov    0x50(%esp),%esi
4000089b:	83 ec 08             	sub    $0x8,%esp
4000089e:	31 db                	xor    %ebx,%ebx
400008a0:	57                   	push   %edi
400008a1:	6a 30                	push   $0x30
400008a3:	ff d6                	call   *%esi
400008a5:	58                   	pop    %eax
400008a6:	5a                   	pop    %edx
400008a7:	57                   	push   %edi
400008a8:	6a 78                	push   $0x78
400008aa:	ff d6                	call   *%esi
400008ac:	8b 44 24 6c          	mov    0x6c(%esp),%eax
400008b0:	ba 10 00 00 00       	mov    $0x10,%edx
400008b5:	83 c4 10             	add    $0x10,%esp
400008b8:	8b 08                	mov    (%eax),%ecx
400008ba:	8b 44 24 5c          	mov    0x5c(%esp),%eax
400008be:	83 c0 04             	add    $0x4,%eax
400008c1:	89 44 24 5c          	mov    %eax,0x5c(%esp)
400008c5:	eb 81                	jmp    40000848 <.L34+0x53>

400008c7 <.L38>:
400008c7:	8b 44 24 5c          	mov    0x5c(%esp),%eax
400008cb:	8b 54 24 20          	mov    0x20(%esp),%edx
400008cf:	8b 74 24 50          	mov    0x50(%esp),%esi
400008d3:	83 c0 04             	add    $0x4,%eax
400008d6:	89 44 24 20          	mov    %eax,0x20(%esp)
400008da:	8b 44 24 5c          	mov    0x5c(%esp),%eax
400008de:	8b 00                	mov    (%eax),%eax
400008e0:	85 c0                	test   %eax,%eax
400008e2:	89 44 24 24          	mov    %eax,0x24(%esp)
400008e6:	0f 84 99 02 00 00    	je     40000b85 <.L25+0x133>
400008ec:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400008f0:	8d 48 01             	lea    0x1(%eax),%ecx
400008f3:	85 db                	test   %ebx,%ebx
400008f5:	7e 0b                	jle    40000902 <.L38+0x3b>
400008f7:	80 7c 24 1c 2d       	cmpb   $0x2d,0x1c(%esp)
400008fc:	0f 85 c5 01 00 00    	jne    40000ac7 <.L25+0x75>
40000902:	8b 44 24 24          	mov    0x24(%esp),%eax
40000906:	0f be 00             	movsbl (%eax),%eax
40000909:	85 c0                	test   %eax,%eax
4000090b:	89 c3                	mov    %eax,%ebx
4000090d:	0f 84 77 01 00 00    	je     40000a8a <.L25+0x38>
40000913:	89 74 24 50          	mov    %esi,0x50(%esp)
40000917:	89 6c 24 58          	mov    %ebp,0x58(%esp)
4000091b:	89 ce                	mov    %ecx,%esi
4000091d:	89 d5                	mov    %edx,%ebp
4000091f:	0f be d3             	movsbl %bl,%edx
40000922:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40000926:	eb 29                	jmp    40000951 <.L38+0x8a>
40000928:	90                   	nop
40000929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000930:	83 ec 08             	sub    $0x8,%esp
40000933:	57                   	push   %edi
40000934:	50                   	push   %eax
40000935:	ff 54 24 60          	call   *0x60(%esp)
40000939:	83 c4 10             	add    $0x10,%esp
4000093c:	83 c6 01             	add    $0x1,%esi
4000093f:	0f be 56 ff          	movsbl -0x1(%esi),%edx
40000943:	83 eb 01             	sub    $0x1,%ebx
40000946:	0f be c2             	movsbl %dl,%eax
40000949:	85 c0                	test   %eax,%eax
4000094b:	0f 84 2d 01 00 00    	je     40000a7e <.L25+0x2c>
40000951:	85 ed                	test   %ebp,%ebp
40000953:	78 0c                	js     40000961 <.L38+0x9a>
40000955:	83 ed 01             	sub    $0x1,%ebp
40000958:	83 fd ff             	cmp    $0xffffffff,%ebp
4000095b:	0f 84 1d 01 00 00    	je     40000a7e <.L25+0x2c>
40000961:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000965:	85 c9                	test   %ecx,%ecx
40000967:	74 c7                	je     40000930 <.L38+0x69>
40000969:	83 ea 20             	sub    $0x20,%edx
4000096c:	83 fa 5e             	cmp    $0x5e,%edx
4000096f:	76 bf                	jbe    40000930 <.L38+0x69>
40000971:	83 ec 08             	sub    $0x8,%esp
40000974:	57                   	push   %edi
40000975:	6a 3f                	push   $0x3f
40000977:	ff 54 24 60          	call   *0x60(%esp)
4000097b:	83 c4 10             	add    $0x10,%esp
4000097e:	eb bc                	jmp    4000093c <.L38+0x75>

40000980 <.L39>:
40000980:	83 7c 24 24 01       	cmpl   $0x1,0x24(%esp)
40000985:	8b 44 24 5c          	mov    0x5c(%esp),%eax
40000989:	8b 74 24 50          	mov    0x50(%esp),%esi
4000098d:	8b 08                	mov    (%eax),%ecx
4000098f:	0f 8e c6 01 00 00    	jle    40000b5b <.L25+0x109>
40000995:	8b 58 04             	mov    0x4(%eax),%ebx
40000998:	83 c0 08             	add    $0x8,%eax
4000099b:	89 44 24 5c          	mov    %eax,0x5c(%esp)
4000099f:	ba 0a 00 00 00       	mov    $0xa,%edx
400009a4:	e9 9f fe ff ff       	jmp    40000848 <.L34+0x53>

400009a9 <.L40>:
400009a9:	83 7c 24 24 01       	cmpl   $0x1,0x24(%esp)
400009ae:	8b 44 24 5c          	mov    0x5c(%esp),%eax
400009b2:	8b 74 24 50          	mov    0x50(%esp),%esi
400009b6:	8b 08                	mov    (%eax),%ecx
400009b8:	0f 8e 8a 01 00 00    	jle    40000b48 <.L25+0xf6>
400009be:	8b 58 04             	mov    0x4(%eax),%ebx
400009c1:	83 c0 08             	add    $0x8,%eax
400009c4:	ba 10 00 00 00       	mov    $0x10,%edx
400009c9:	89 44 24 5c          	mov    %eax,0x5c(%esp)
400009cd:	e9 76 fe ff ff       	jmp    40000848 <.L34+0x53>

400009d2 <.L26>:
400009d2:	89 eb                	mov    %ebp,%ebx
400009d4:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
400009db:	00 
400009dc:	e9 81 fd ff ff       	jmp    40000762 <vprintfmt+0x82>

400009e1 <.L28>:
400009e1:	8b 74 24 50          	mov    0x50(%esp),%esi
400009e5:	83 ec 08             	sub    $0x8,%esp
400009e8:	57                   	push   %edi
400009e9:	6a 25                	push   $0x25
400009eb:	ff d6                	call   *%esi
400009ed:	83 c4 10             	add    $0x10,%esp
400009f0:	e9 0c fd ff ff       	jmp    40000701 <vprintfmt+0x21>

400009f5 <.L29>:
400009f5:	8b 44 24 5c          	mov    0x5c(%esp),%eax
400009f9:	89 eb                	mov    %ebp,%ebx
400009fb:	8b 00                	mov    (%eax),%eax
400009fd:	89 44 24 20          	mov    %eax,0x20(%esp)
40000a01:	8b 44 24 5c          	mov    0x5c(%esp),%eax
40000a05:	83 c0 04             	add    $0x4,%eax
40000a08:	89 44 24 5c          	mov    %eax,0x5c(%esp)
40000a0c:	8b 74 24 18          	mov    0x18(%esp),%esi
40000a10:	85 f6                	test   %esi,%esi
40000a12:	0f 89 4a fd ff ff    	jns    40000762 <vprintfmt+0x82>
40000a18:	8b 44 24 20          	mov    0x20(%esp),%eax
40000a1c:	c7 44 24 20 ff ff ff 	movl   $0xffffffff,0x20(%esp)
40000a23:	ff 
40000a24:	89 44 24 18          	mov    %eax,0x18(%esp)
40000a28:	e9 35 fd ff ff       	jmp    40000762 <vprintfmt+0x82>

40000a2d <.L30>:
40000a2d:	89 eb                	mov    %ebp,%ebx
40000a2f:	c6 44 24 1c 2d       	movb   $0x2d,0x1c(%esp)
40000a34:	e9 29 fd ff ff       	jmp    40000762 <vprintfmt+0x82>

40000a39 <.L31>:
40000a39:	8b 44 24 18          	mov    0x18(%esp),%eax
40000a3d:	b9 00 00 00 00       	mov    $0x0,%ecx
40000a42:	89 eb                	mov    %ebp,%ebx
40000a44:	85 c0                	test   %eax,%eax
40000a46:	0f 49 c8             	cmovns %eax,%ecx
40000a49:	89 4c 24 18          	mov    %ecx,0x18(%esp)
40000a4d:	e9 10 fd ff ff       	jmp    40000762 <vprintfmt+0x82>

40000a52 <.L25>:
40000a52:	8b 74 24 50          	mov    0x50(%esp),%esi
40000a56:	83 ec 08             	sub    $0x8,%esp
40000a59:	89 dd                	mov    %ebx,%ebp
40000a5b:	57                   	push   %edi
40000a5c:	6a 25                	push   $0x25
40000a5e:	ff d6                	call   *%esi
40000a60:	83 c4 10             	add    $0x10,%esp
40000a63:	80 7b ff 25          	cmpb   $0x25,-0x1(%ebx)
40000a67:	0f 84 94 fc ff ff    	je     40000701 <vprintfmt+0x21>
40000a6d:	8d 76 00             	lea    0x0(%esi),%esi
40000a70:	83 ed 01             	sub    $0x1,%ebp
40000a73:	80 7d ff 25          	cmpb   $0x25,-0x1(%ebp)
40000a77:	75 f7                	jne    40000a70 <.L25+0x1e>
40000a79:	e9 83 fc ff ff       	jmp    40000701 <vprintfmt+0x21>
40000a7e:	8b 74 24 50          	mov    0x50(%esp),%esi
40000a82:	8b 6c 24 58          	mov    0x58(%esp),%ebp
40000a86:	89 5c 24 18          	mov    %ebx,0x18(%esp)
40000a8a:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000a8e:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40000a92:	85 c9                	test   %ecx,%ecx
40000a94:	7e 1a                	jle    40000ab0 <.L25+0x5e>
40000a96:	8d 76 00             	lea    0x0(%esi),%esi
40000a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000aa0:	83 ec 08             	sub    $0x8,%esp
40000aa3:	57                   	push   %edi
40000aa4:	6a 20                	push   $0x20
40000aa6:	ff d6                	call   *%esi
40000aa8:	83 c4 10             	add    $0x10,%esp
40000aab:	83 eb 01             	sub    $0x1,%ebx
40000aae:	75 f0                	jne    40000aa0 <.L25+0x4e>
40000ab0:	8b 44 24 20          	mov    0x20(%esp),%eax
40000ab4:	89 44 24 5c          	mov    %eax,0x5c(%esp)
40000ab8:	e9 44 fc ff ff       	jmp    40000701 <vprintfmt+0x21>
40000abd:	8d 80 61 d5 ff ff    	lea    -0x2a9f(%eax),%eax
40000ac3:	89 44 24 24          	mov    %eax,0x24(%esp)
40000ac7:	89 4c 24 2c          	mov    %ecx,0x2c(%esp)
40000acb:	83 ec 08             	sub    $0x8,%esp
40000ace:	52                   	push   %edx
40000acf:	89 54 24 34          	mov    %edx,0x34(%esp)
40000ad3:	ff 74 24 30          	pushl  0x30(%esp)
40000ad7:	8b 5c 24 1c          	mov    0x1c(%esp),%ebx
40000adb:	e8 90 02 00 00       	call   40000d70 <strnlen>
40000ae0:	29 44 24 28          	sub    %eax,0x28(%esp)
40000ae4:	8b 4c 24 28          	mov    0x28(%esp),%ecx
40000ae8:	83 c4 10             	add    $0x10,%esp
40000aeb:	8b 54 24 28          	mov    0x28(%esp),%edx
40000aef:	85 c9                	test   %ecx,%ecx
40000af1:	89 4c 24 18          	mov    %ecx,0x18(%esp)
40000af5:	8b 4c 24 2c          	mov    0x2c(%esp),%ecx
40000af9:	7e 34                	jle    40000b2f <.L25+0xdd>
40000afb:	89 6c 24 58          	mov    %ebp,0x58(%esp)
40000aff:	8b 6c 24 18          	mov    0x18(%esp),%ebp
40000b03:	0f be 5c 24 1c       	movsbl 0x1c(%esp),%ebx
40000b08:	89 4c 24 1c          	mov    %ecx,0x1c(%esp)
40000b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000b10:	83 ec 08             	sub    $0x8,%esp
40000b13:	57                   	push   %edi
40000b14:	53                   	push   %ebx
40000b15:	ff d6                	call   *%esi
40000b17:	83 c4 10             	add    $0x10,%esp
40000b1a:	83 ed 01             	sub    $0x1,%ebp
40000b1d:	75 f1                	jne    40000b10 <.L25+0xbe>
40000b1f:	89 6c 24 18          	mov    %ebp,0x18(%esp)
40000b23:	8b 4c 24 1c          	mov    0x1c(%esp),%ecx
40000b27:	8b 54 24 28          	mov    0x28(%esp),%edx
40000b2b:	8b 6c 24 58          	mov    0x58(%esp),%ebp
40000b2f:	8b 44 24 24          	mov    0x24(%esp),%eax
40000b33:	0f be 00             	movsbl (%eax),%eax
40000b36:	85 c0                	test   %eax,%eax
40000b38:	89 c3                	mov    %eax,%ebx
40000b3a:	0f 85 d3 fd ff ff    	jne    40000913 <.L38+0x4c>
40000b40:	e9 6b ff ff ff       	jmp    40000ab0 <.L25+0x5e>
40000b45:	8d 76 00             	lea    0x0(%esi),%esi
40000b48:	83 c0 04             	add    $0x4,%eax
40000b4b:	31 db                	xor    %ebx,%ebx
40000b4d:	ba 10 00 00 00       	mov    $0x10,%edx
40000b52:	89 44 24 5c          	mov    %eax,0x5c(%esp)
40000b56:	e9 ed fc ff ff       	jmp    40000848 <.L34+0x53>
40000b5b:	83 c0 04             	add    $0x4,%eax
40000b5e:	31 db                	xor    %ebx,%ebx
40000b60:	ba 0a 00 00 00       	mov    $0xa,%edx
40000b65:	89 44 24 5c          	mov    %eax,0x5c(%esp)
40000b69:	e9 da fc ff ff       	jmp    40000848 <.L34+0x53>
40000b6e:	8b 4c 24 5c          	mov    0x5c(%esp),%ecx
40000b72:	83 c0 04             	add    $0x4,%eax
40000b75:	8b 09                	mov    (%ecx),%ecx
40000b77:	89 44 24 5c          	mov    %eax,0x5c(%esp)
40000b7b:	89 cb                	mov    %ecx,%ebx
40000b7d:	c1 fb 1f             	sar    $0x1f,%ebx
40000b80:	e9 8f fc ff ff       	jmp    40000814 <.L34+0x1f>
40000b85:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40000b89:	8b 44 24 0c          	mov    0xc(%esp),%eax
40000b8d:	85 db                	test   %ebx,%ebx
40000b8f:	8d 88 62 d5 ff ff    	lea    -0x2a9e(%eax),%ecx
40000b95:	7e 0b                	jle    40000ba2 <.L25+0x150>
40000b97:	80 7c 24 1c 2d       	cmpb   $0x2d,0x1c(%esp)
40000b9c:	0f 85 1b ff ff ff    	jne    40000abd <.L25+0x6b>
40000ba2:	b8 28 00 00 00       	mov    $0x28,%eax
40000ba7:	bb 28 00 00 00       	mov    $0x28,%ebx
40000bac:	e9 62 fd ff ff       	jmp    40000913 <.L38+0x4c>
40000bb1:	eb 0d                	jmp    40000bc0 <printfmt>
40000bb3:	90                   	nop
40000bb4:	90                   	nop
40000bb5:	90                   	nop
40000bb6:	90                   	nop
40000bb7:	90                   	nop
40000bb8:	90                   	nop
40000bb9:	90                   	nop
40000bba:	90                   	nop
40000bbb:	90                   	nop
40000bbc:	90                   	nop
40000bbd:	90                   	nop
40000bbe:	90                   	nop
40000bbf:	90                   	nop

40000bc0 <printfmt>:
40000bc0:	83 ec 0c             	sub    $0xc,%esp
40000bc3:	8d 44 24 1c          	lea    0x1c(%esp),%eax
40000bc7:	50                   	push   %eax
40000bc8:	ff 74 24 1c          	pushl  0x1c(%esp)
40000bcc:	ff 74 24 1c          	pushl  0x1c(%esp)
40000bd0:	ff 74 24 1c          	pushl  0x1c(%esp)
40000bd4:	e8 07 fb ff ff       	call   400006e0 <vprintfmt>
40000bd9:	83 c4 1c             	add    $0x1c,%esp
40000bdc:	c3                   	ret    
40000bdd:	8d 76 00             	lea    0x0(%esi),%esi

40000be0 <vsprintf>:
40000be0:	83 ec 1c             	sub    $0x1c,%esp
40000be3:	8b 54 24 20          	mov    0x20(%esp),%edx
40000be7:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000bee:	ff 
40000bef:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000bf6:	00 
40000bf7:	e8 37 01 00 00       	call   40000d33 <__x86.get_pc_thunk.ax>
40000bfc:	05 04 34 00 00       	add    $0x3404,%eax
40000c01:	89 54 24 04          	mov    %edx,0x4(%esp)
40000c05:	ff 74 24 28          	pushl  0x28(%esp)
40000c09:	ff 74 24 28          	pushl  0x28(%esp)
40000c0d:	8d 80 c0 c6 ff ff    	lea    -0x3940(%eax),%eax
40000c13:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000c17:	52                   	push   %edx
40000c18:	50                   	push   %eax
40000c19:	e8 c2 fa ff ff       	call   400006e0 <vprintfmt>
40000c1e:	8b 44 24 14          	mov    0x14(%esp),%eax
40000c22:	c6 00 00             	movb   $0x0,(%eax)
40000c25:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000c29:	83 c4 2c             	add    $0x2c,%esp
40000c2c:	c3                   	ret    
40000c2d:	8d 76 00             	lea    0x0(%esi),%esi

40000c30 <sprintf>:
40000c30:	83 ec 1c             	sub    $0x1c,%esp
40000c33:	8b 54 24 20          	mov    0x20(%esp),%edx
40000c37:	c7 44 24 08 ff ff ff 	movl   $0xffffffff,0x8(%esp)
40000c3e:	ff 
40000c3f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000c46:	00 
40000c47:	e8 e7 00 00 00       	call   40000d33 <__x86.get_pc_thunk.ax>
40000c4c:	05 b4 33 00 00       	add    $0x33b4,%eax
40000c51:	89 54 24 04          	mov    %edx,0x4(%esp)
40000c55:	8d 54 24 28          	lea    0x28(%esp),%edx
40000c59:	8d 80 c0 c6 ff ff    	lea    -0x3940(%eax),%eax
40000c5f:	52                   	push   %edx
40000c60:	ff 74 24 28          	pushl  0x28(%esp)
40000c64:	8d 54 24 0c          	lea    0xc(%esp),%edx
40000c68:	52                   	push   %edx
40000c69:	50                   	push   %eax
40000c6a:	e8 71 fa ff ff       	call   400006e0 <vprintfmt>
40000c6f:	8b 44 24 14          	mov    0x14(%esp),%eax
40000c73:	c6 00 00             	movb   $0x0,(%eax)
40000c76:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000c7a:	83 c4 2c             	add    $0x2c,%esp
40000c7d:	c3                   	ret    
40000c7e:	66 90                	xchg   %ax,%ax

40000c80 <vsnprintf>:
40000c80:	83 ec 1c             	sub    $0x1c,%esp
40000c83:	8b 44 24 20          	mov    0x20(%esp),%eax
40000c87:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000c8b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000c92:	00 
40000c93:	e8 9f 00 00 00       	call   40000d37 <__x86.get_pc_thunk.dx>
40000c98:	81 c2 68 33 00 00    	add    $0x3368,%edx
40000c9e:	89 44 24 04          	mov    %eax,0x4(%esp)
40000ca2:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000ca6:	89 44 24 08          	mov    %eax,0x8(%esp)
40000caa:	ff 74 24 2c          	pushl  0x2c(%esp)
40000cae:	ff 74 24 2c          	pushl  0x2c(%esp)
40000cb2:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000cb6:	50                   	push   %eax
40000cb7:	8d 82 c0 c6 ff ff    	lea    -0x3940(%edx),%eax
40000cbd:	50                   	push   %eax
40000cbe:	e8 1d fa ff ff       	call   400006e0 <vprintfmt>
40000cc3:	8b 44 24 14          	mov    0x14(%esp),%eax
40000cc7:	c6 00 00             	movb   $0x0,(%eax)
40000cca:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000cce:	83 c4 2c             	add    $0x2c,%esp
40000cd1:	c3                   	ret    
40000cd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000ce0 <snprintf>:
40000ce0:	83 ec 1c             	sub    $0x1c,%esp
40000ce3:	8b 44 24 20          	mov    0x20(%esp),%eax
40000ce7:	8b 4c 24 24          	mov    0x24(%esp),%ecx
40000ceb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
40000cf2:	00 
40000cf3:	e8 3f 00 00 00       	call   40000d37 <__x86.get_pc_thunk.dx>
40000cf8:	81 c2 08 33 00 00    	add    $0x3308,%edx
40000cfe:	89 44 24 04          	mov    %eax,0x4(%esp)
40000d02:	8d 44 08 ff          	lea    -0x1(%eax,%ecx,1),%eax
40000d06:	89 44 24 08          	mov    %eax,0x8(%esp)
40000d0a:	8d 44 24 2c          	lea    0x2c(%esp),%eax
40000d0e:	50                   	push   %eax
40000d0f:	ff 74 24 2c          	pushl  0x2c(%esp)
40000d13:	8d 44 24 0c          	lea    0xc(%esp),%eax
40000d17:	50                   	push   %eax
40000d18:	8d 82 c0 c6 ff ff    	lea    -0x3940(%edx),%eax
40000d1e:	50                   	push   %eax
40000d1f:	e8 bc f9 ff ff       	call   400006e0 <vprintfmt>
40000d24:	8b 44 24 14          	mov    0x14(%esp),%eax
40000d28:	c6 00 00             	movb   $0x0,(%eax)
40000d2b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
40000d2f:	83 c4 2c             	add    $0x2c,%esp
40000d32:	c3                   	ret    

40000d33 <__x86.get_pc_thunk.ax>:
40000d33:	8b 04 24             	mov    (%esp),%eax
40000d36:	c3                   	ret    

40000d37 <__x86.get_pc_thunk.dx>:
40000d37:	8b 14 24             	mov    (%esp),%edx
40000d3a:	c3                   	ret    

40000d3b <__x86.get_pc_thunk.cx>:
40000d3b:	8b 0c 24             	mov    (%esp),%ecx
40000d3e:	c3                   	ret    
40000d3f:	90                   	nop

40000d40 <strlen>:
40000d40:	8b 54 24 04          	mov    0x4(%esp),%edx
40000d44:	31 c0                	xor    %eax,%eax
40000d46:	80 3a 00             	cmpb   $0x0,(%edx)
40000d49:	74 15                	je     40000d60 <strlen+0x20>
40000d4b:	90                   	nop
40000d4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000d50:	83 c0 01             	add    $0x1,%eax
40000d53:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
40000d57:	75 f7                	jne    40000d50 <strlen+0x10>
40000d59:	f3 c3                	repz ret 
40000d5b:	90                   	nop
40000d5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000d60:	f3 c3                	repz ret 
40000d62:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000d70 <strnlen>:
40000d70:	8b 54 24 08          	mov    0x8(%esp),%edx
40000d74:	31 c0                	xor    %eax,%eax
40000d76:	8b 4c 24 04          	mov    0x4(%esp),%ecx
40000d7a:	85 d2                	test   %edx,%edx
40000d7c:	74 2a                	je     40000da8 <strnlen+0x38>
40000d7e:	80 39 00             	cmpb   $0x0,(%ecx)
40000d81:	75 0b                	jne    40000d8e <strnlen+0x1e>
40000d83:	eb 10                	jmp    40000d95 <strnlen+0x25>
40000d85:	8d 76 00             	lea    0x0(%esi),%esi
40000d88:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
40000d8c:	74 12                	je     40000da0 <strnlen+0x30>
40000d8e:	83 c0 01             	add    $0x1,%eax
40000d91:	39 c2                	cmp    %eax,%edx
40000d93:	75 f3                	jne    40000d88 <strnlen+0x18>
40000d95:	f3 c3                	repz ret 
40000d97:	89 f6                	mov    %esi,%esi
40000d99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000da0:	f3 c3                	repz ret 
40000da2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000da8:	f3 c3                	repz ret 
40000daa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000db0 <strcpy>:
40000db0:	53                   	push   %ebx
40000db1:	8b 44 24 08          	mov    0x8(%esp),%eax
40000db5:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000db9:	89 c2                	mov    %eax,%edx
40000dbb:	90                   	nop
40000dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000dc0:	83 c1 01             	add    $0x1,%ecx
40000dc3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
40000dc7:	83 c2 01             	add    $0x1,%edx
40000dca:	84 db                	test   %bl,%bl
40000dcc:	88 5a ff             	mov    %bl,-0x1(%edx)
40000dcf:	75 ef                	jne    40000dc0 <strcpy+0x10>
40000dd1:	5b                   	pop    %ebx
40000dd2:	c3                   	ret    
40000dd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40000dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000de0 <strncpy>:
40000de0:	56                   	push   %esi
40000de1:	53                   	push   %ebx
40000de2:	8b 5c 24 14          	mov    0x14(%esp),%ebx
40000de6:	8b 74 24 0c          	mov    0xc(%esp),%esi
40000dea:	8b 54 24 10          	mov    0x10(%esp),%edx
40000dee:	85 db                	test   %ebx,%ebx
40000df0:	74 21                	je     40000e13 <strncpy+0x33>
40000df2:	01 f3                	add    %esi,%ebx
40000df4:	89 f1                	mov    %esi,%ecx
40000df6:	8d 76 00             	lea    0x0(%esi),%esi
40000df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000e00:	0f b6 02             	movzbl (%edx),%eax
40000e03:	83 c1 01             	add    $0x1,%ecx
40000e06:	88 41 ff             	mov    %al,-0x1(%ecx)
40000e09:	80 3a 01             	cmpb   $0x1,(%edx)
40000e0c:	83 da ff             	sbb    $0xffffffff,%edx
40000e0f:	39 d9                	cmp    %ebx,%ecx
40000e11:	75 ed                	jne    40000e00 <strncpy+0x20>
40000e13:	89 f0                	mov    %esi,%eax
40000e15:	5b                   	pop    %ebx
40000e16:	5e                   	pop    %esi
40000e17:	c3                   	ret    
40000e18:	90                   	nop
40000e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

40000e20 <strlcpy>:
40000e20:	57                   	push   %edi
40000e21:	56                   	push   %esi
40000e22:	31 c0                	xor    %eax,%eax
40000e24:	53                   	push   %ebx
40000e25:	8b 5c 24 18          	mov    0x18(%esp),%ebx
40000e29:	8b 54 24 10          	mov    0x10(%esp),%edx
40000e2d:	8b 7c 24 14          	mov    0x14(%esp),%edi
40000e31:	85 db                	test   %ebx,%ebx
40000e33:	74 37                	je     40000e6c <strlcpy+0x4c>
40000e35:	83 fb 01             	cmp    $0x1,%ebx
40000e38:	89 d6                	mov    %edx,%esi
40000e3a:	74 2d                	je     40000e69 <strlcpy+0x49>
40000e3c:	0f b6 0f             	movzbl (%edi),%ecx
40000e3f:	84 c9                	test   %cl,%cl
40000e41:	74 26                	je     40000e69 <strlcpy+0x49>
40000e43:	8d 47 01             	lea    0x1(%edi),%eax
40000e46:	8d 5c 1f ff          	lea    -0x1(%edi,%ebx,1),%ebx
40000e4a:	eb 0f                	jmp    40000e5b <strlcpy+0x3b>
40000e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40000e50:	83 c0 01             	add    $0x1,%eax
40000e53:	0f b6 48 ff          	movzbl -0x1(%eax),%ecx
40000e57:	84 c9                	test   %cl,%cl
40000e59:	74 0a                	je     40000e65 <strlcpy+0x45>
40000e5b:	83 c2 01             	add    $0x1,%edx
40000e5e:	39 c3                	cmp    %eax,%ebx
40000e60:	88 4a ff             	mov    %cl,-0x1(%edx)
40000e63:	75 eb                	jne    40000e50 <strlcpy+0x30>
40000e65:	89 d0                	mov    %edx,%eax
40000e67:	29 f0                	sub    %esi,%eax
40000e69:	c6 02 00             	movb   $0x0,(%edx)
40000e6c:	5b                   	pop    %ebx
40000e6d:	5e                   	pop    %esi
40000e6e:	5f                   	pop    %edi
40000e6f:	c3                   	ret    

40000e70 <strcmp>:
40000e70:	53                   	push   %ebx
40000e71:	8b 54 24 08          	mov    0x8(%esp),%edx
40000e75:	8b 4c 24 0c          	mov    0xc(%esp),%ecx
40000e79:	0f b6 02             	movzbl (%edx),%eax
40000e7c:	0f b6 19             	movzbl (%ecx),%ebx
40000e7f:	84 c0                	test   %al,%al
40000e81:	75 15                	jne    40000e98 <strcmp+0x28>
40000e83:	eb 1b                	jmp    40000ea0 <strcmp+0x30>
40000e85:	8d 76 00             	lea    0x0(%esi),%esi
40000e88:	83 c2 01             	add    $0x1,%edx
40000e8b:	0f b6 02             	movzbl (%edx),%eax
40000e8e:	83 c1 01             	add    $0x1,%ecx
40000e91:	0f b6 19             	movzbl (%ecx),%ebx
40000e94:	84 c0                	test   %al,%al
40000e96:	74 08                	je     40000ea0 <strcmp+0x30>
40000e98:	38 d8                	cmp    %bl,%al
40000e9a:	74 ec                	je     40000e88 <strcmp+0x18>
40000e9c:	29 d8                	sub    %ebx,%eax
40000e9e:	5b                   	pop    %ebx
40000e9f:	c3                   	ret    
40000ea0:	31 c0                	xor    %eax,%eax
40000ea2:	29 d8                	sub    %ebx,%eax
40000ea4:	5b                   	pop    %ebx
40000ea5:	c3                   	ret    
40000ea6:	8d 76 00             	lea    0x0(%esi),%esi
40000ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000eb0 <strncmp>:
40000eb0:	57                   	push   %edi
40000eb1:	56                   	push   %esi
40000eb2:	53                   	push   %ebx
40000eb3:	8b 7c 24 18          	mov    0x18(%esp),%edi
40000eb7:	8b 4c 24 10          	mov    0x10(%esp),%ecx
40000ebb:	8b 74 24 14          	mov    0x14(%esp),%esi
40000ebf:	85 ff                	test   %edi,%edi
40000ec1:	74 2f                	je     40000ef2 <strncmp+0x42>
40000ec3:	0f b6 01             	movzbl (%ecx),%eax
40000ec6:	0f b6 1e             	movzbl (%esi),%ebx
40000ec9:	84 c0                	test   %al,%al
40000ecb:	74 37                	je     40000f04 <strncmp+0x54>
40000ecd:	38 c3                	cmp    %al,%bl
40000ecf:	75 33                	jne    40000f04 <strncmp+0x54>
40000ed1:	01 f7                	add    %esi,%edi
40000ed3:	eb 13                	jmp    40000ee8 <strncmp+0x38>
40000ed5:	8d 76 00             	lea    0x0(%esi),%esi
40000ed8:	0f b6 01             	movzbl (%ecx),%eax
40000edb:	84 c0                	test   %al,%al
40000edd:	74 21                	je     40000f00 <strncmp+0x50>
40000edf:	0f b6 1a             	movzbl (%edx),%ebx
40000ee2:	89 d6                	mov    %edx,%esi
40000ee4:	38 d8                	cmp    %bl,%al
40000ee6:	75 1c                	jne    40000f04 <strncmp+0x54>
40000ee8:	8d 56 01             	lea    0x1(%esi),%edx
40000eeb:	83 c1 01             	add    $0x1,%ecx
40000eee:	39 fa                	cmp    %edi,%edx
40000ef0:	75 e6                	jne    40000ed8 <strncmp+0x28>
40000ef2:	5b                   	pop    %ebx
40000ef3:	31 c0                	xor    %eax,%eax
40000ef5:	5e                   	pop    %esi
40000ef6:	5f                   	pop    %edi
40000ef7:	c3                   	ret    
40000ef8:	90                   	nop
40000ef9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000f00:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
40000f04:	29 d8                	sub    %ebx,%eax
40000f06:	5b                   	pop    %ebx
40000f07:	5e                   	pop    %esi
40000f08:	5f                   	pop    %edi
40000f09:	c3                   	ret    
40000f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

40000f10 <strchr>:
40000f10:	53                   	push   %ebx
40000f11:	8b 44 24 08          	mov    0x8(%esp),%eax
40000f15:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
40000f19:	0f b6 10             	movzbl (%eax),%edx
40000f1c:	84 d2                	test   %dl,%dl
40000f1e:	74 1e                	je     40000f3e <strchr+0x2e>
40000f20:	38 d3                	cmp    %dl,%bl
40000f22:	89 d9                	mov    %ebx,%ecx
40000f24:	75 0e                	jne    40000f34 <strchr+0x24>
40000f26:	eb 18                	jmp    40000f40 <strchr+0x30>
40000f28:	90                   	nop
40000f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000f30:	38 ca                	cmp    %cl,%dl
40000f32:	74 0c                	je     40000f40 <strchr+0x30>
40000f34:	83 c0 01             	add    $0x1,%eax
40000f37:	0f b6 10             	movzbl (%eax),%edx
40000f3a:	84 d2                	test   %dl,%dl
40000f3c:	75 f2                	jne    40000f30 <strchr+0x20>
40000f3e:	31 c0                	xor    %eax,%eax
40000f40:	5b                   	pop    %ebx
40000f41:	c3                   	ret    
40000f42:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40000f50 <strfind>:
40000f50:	53                   	push   %ebx
40000f51:	8b 44 24 08          	mov    0x8(%esp),%eax
40000f55:	8b 54 24 0c          	mov    0xc(%esp),%edx
40000f59:	0f b6 18             	movzbl (%eax),%ebx
40000f5c:	38 d3                	cmp    %dl,%bl
40000f5e:	74 1e                	je     40000f7e <strfind+0x2e>
40000f60:	84 db                	test   %bl,%bl
40000f62:	89 d1                	mov    %edx,%ecx
40000f64:	75 0e                	jne    40000f74 <strfind+0x24>
40000f66:	eb 16                	jmp    40000f7e <strfind+0x2e>
40000f68:	90                   	nop
40000f69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40000f70:	84 d2                	test   %dl,%dl
40000f72:	74 0a                	je     40000f7e <strfind+0x2e>
40000f74:	83 c0 01             	add    $0x1,%eax
40000f77:	0f b6 10             	movzbl (%eax),%edx
40000f7a:	38 ca                	cmp    %cl,%dl
40000f7c:	75 f2                	jne    40000f70 <strfind+0x20>
40000f7e:	5b                   	pop    %ebx
40000f7f:	c3                   	ret    

40000f80 <strtol>:
40000f80:	55                   	push   %ebp
40000f81:	57                   	push   %edi
40000f82:	56                   	push   %esi
40000f83:	53                   	push   %ebx
40000f84:	83 ec 04             	sub    $0x4,%esp
40000f87:	8b 44 24 20          	mov    0x20(%esp),%eax
40000f8b:	8b 4c 24 18          	mov    0x18(%esp),%ecx
40000f8f:	8b 74 24 1c          	mov    0x1c(%esp),%esi
40000f93:	89 04 24             	mov    %eax,(%esp)
40000f96:	0f b6 01             	movzbl (%ecx),%eax
40000f99:	3c 20                	cmp    $0x20,%al
40000f9b:	75 0d                	jne    40000faa <strtol+0x2a>
40000f9d:	8d 76 00             	lea    0x0(%esi),%esi
40000fa0:	83 c1 01             	add    $0x1,%ecx
40000fa3:	0f b6 01             	movzbl (%ecx),%eax
40000fa6:	3c 20                	cmp    $0x20,%al
40000fa8:	74 f6                	je     40000fa0 <strtol+0x20>
40000faa:	3c 09                	cmp    $0x9,%al
40000fac:	74 f2                	je     40000fa0 <strtol+0x20>
40000fae:	3c 2b                	cmp    $0x2b,%al
40000fb0:	0f 84 aa 00 00 00    	je     40001060 <strtol+0xe0>
40000fb6:	31 ff                	xor    %edi,%edi
40000fb8:	3c 2d                	cmp    $0x2d,%al
40000fba:	0f 84 90 00 00 00    	je     40001050 <strtol+0xd0>
40000fc0:	f7 04 24 ef ff ff ff 	testl  $0xffffffef,(%esp)
40000fc7:	0f be 11             	movsbl (%ecx),%edx
40000fca:	75 17                	jne    40000fe3 <strtol+0x63>
40000fcc:	80 fa 30             	cmp    $0x30,%dl
40000fcf:	0f 84 9b 00 00 00    	je     40001070 <strtol+0xf0>
40000fd5:	8b 2c 24             	mov    (%esp),%ebp
40000fd8:	85 ed                	test   %ebp,%ebp
40000fda:	75 07                	jne    40000fe3 <strtol+0x63>
40000fdc:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
40000fe3:	31 c0                	xor    %eax,%eax
40000fe5:	eb 1e                	jmp    40001005 <strtol+0x85>
40000fe7:	89 f6                	mov    %esi,%esi
40000fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
40000ff0:	83 ea 30             	sub    $0x30,%edx
40000ff3:	8b 1c 24             	mov    (%esp),%ebx
40000ff6:	39 da                	cmp    %ebx,%edx
40000ff8:	7d 29                	jge    40001023 <strtol+0xa3>
40000ffa:	0f af c3             	imul   %ebx,%eax
40000ffd:	83 c1 01             	add    $0x1,%ecx
40001000:	01 d0                	add    %edx,%eax
40001002:	0f be 11             	movsbl (%ecx),%edx
40001005:	8d 6a d0             	lea    -0x30(%edx),%ebp
40001008:	89 eb                	mov    %ebp,%ebx
4000100a:	80 fb 09             	cmp    $0x9,%bl
4000100d:	76 e1                	jbe    40000ff0 <strtol+0x70>
4000100f:	8d 6a 9f             	lea    -0x61(%edx),%ebp
40001012:	89 eb                	mov    %ebp,%ebx
40001014:	80 fb 19             	cmp    $0x19,%bl
40001017:	77 27                	ja     40001040 <strtol+0xc0>
40001019:	8b 1c 24             	mov    (%esp),%ebx
4000101c:	83 ea 57             	sub    $0x57,%edx
4000101f:	39 da                	cmp    %ebx,%edx
40001021:	7c d7                	jl     40000ffa <strtol+0x7a>
40001023:	85 f6                	test   %esi,%esi
40001025:	74 02                	je     40001029 <strtol+0xa9>
40001027:	89 0e                	mov    %ecx,(%esi)
40001029:	89 c2                	mov    %eax,%edx
4000102b:	f7 da                	neg    %edx
4000102d:	85 ff                	test   %edi,%edi
4000102f:	0f 45 c2             	cmovne %edx,%eax
40001032:	83 c4 04             	add    $0x4,%esp
40001035:	5b                   	pop    %ebx
40001036:	5e                   	pop    %esi
40001037:	5f                   	pop    %edi
40001038:	5d                   	pop    %ebp
40001039:	c3                   	ret    
4000103a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001040:	8d 6a bf             	lea    -0x41(%edx),%ebp
40001043:	89 eb                	mov    %ebp,%ebx
40001045:	80 fb 19             	cmp    $0x19,%bl
40001048:	77 d9                	ja     40001023 <strtol+0xa3>
4000104a:	83 ea 37             	sub    $0x37,%edx
4000104d:	eb a4                	jmp    40000ff3 <strtol+0x73>
4000104f:	90                   	nop
40001050:	83 c1 01             	add    $0x1,%ecx
40001053:	bf 01 00 00 00       	mov    $0x1,%edi
40001058:	e9 63 ff ff ff       	jmp    40000fc0 <strtol+0x40>
4000105d:	8d 76 00             	lea    0x0(%esi),%esi
40001060:	83 c1 01             	add    $0x1,%ecx
40001063:	31 ff                	xor    %edi,%edi
40001065:	e9 56 ff ff ff       	jmp    40000fc0 <strtol+0x40>
4000106a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001070:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
40001074:	3c 78                	cmp    $0x78,%al
40001076:	74 1d                	je     40001095 <strtol+0x115>
40001078:	8b 1c 24             	mov    (%esp),%ebx
4000107b:	85 db                	test   %ebx,%ebx
4000107d:	0f 85 60 ff ff ff    	jne    40000fe3 <strtol+0x63>
40001083:	83 c1 01             	add    $0x1,%ecx
40001086:	0f be d0             	movsbl %al,%edx
40001089:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
40001090:	e9 4e ff ff ff       	jmp    40000fe3 <strtol+0x63>
40001095:	0f be 51 02          	movsbl 0x2(%ecx),%edx
40001099:	c7 04 24 10 00 00 00 	movl   $0x10,(%esp)
400010a0:	83 c1 02             	add    $0x2,%ecx
400010a3:	e9 3b ff ff ff       	jmp    40000fe3 <strtol+0x63>
400010a8:	90                   	nop
400010a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

400010b0 <memset>:
400010b0:	57                   	push   %edi
400010b1:	56                   	push   %esi
400010b2:	53                   	push   %ebx
400010b3:	8b 4c 24 18          	mov    0x18(%esp),%ecx
400010b7:	8b 7c 24 10          	mov    0x10(%esp),%edi
400010bb:	85 c9                	test   %ecx,%ecx
400010bd:	74 14                	je     400010d3 <memset+0x23>
400010bf:	f7 c7 03 00 00 00    	test   $0x3,%edi
400010c5:	75 05                	jne    400010cc <memset+0x1c>
400010c7:	f6 c1 03             	test   $0x3,%cl
400010ca:	74 14                	je     400010e0 <memset+0x30>
400010cc:	8b 44 24 14          	mov    0x14(%esp),%eax
400010d0:	fc                   	cld    
400010d1:	f3 aa                	rep stos %al,%es:(%edi)
400010d3:	89 f8                	mov    %edi,%eax
400010d5:	5b                   	pop    %ebx
400010d6:	5e                   	pop    %esi
400010d7:	5f                   	pop    %edi
400010d8:	c3                   	ret    
400010d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
400010e0:	0f b6 54 24 14       	movzbl 0x14(%esp),%edx
400010e5:	c1 e9 02             	shr    $0x2,%ecx
400010e8:	89 d0                	mov    %edx,%eax
400010ea:	89 d6                	mov    %edx,%esi
400010ec:	89 d3                	mov    %edx,%ebx
400010ee:	c1 e0 18             	shl    $0x18,%eax
400010f1:	c1 e6 10             	shl    $0x10,%esi
400010f4:	c1 e3 08             	shl    $0x8,%ebx
400010f7:	09 f0                	or     %esi,%eax
400010f9:	09 d0                	or     %edx,%eax
400010fb:	09 d8                	or     %ebx,%eax
400010fd:	fc                   	cld    
400010fe:	f3 ab                	rep stos %eax,%es:(%edi)
40001100:	89 f8                	mov    %edi,%eax
40001102:	5b                   	pop    %ebx
40001103:	5e                   	pop    %esi
40001104:	5f                   	pop    %edi
40001105:	c3                   	ret    
40001106:	8d 76 00             	lea    0x0(%esi),%esi
40001109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40001110 <memmove>:
40001110:	57                   	push   %edi
40001111:	56                   	push   %esi
40001112:	8b 44 24 0c          	mov    0xc(%esp),%eax
40001116:	8b 74 24 10          	mov    0x10(%esp),%esi
4000111a:	8b 4c 24 14          	mov    0x14(%esp),%ecx
4000111e:	39 c6                	cmp    %eax,%esi
40001120:	73 07                	jae    40001129 <memmove+0x19>
40001122:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
40001125:	39 c2                	cmp    %eax,%edx
40001127:	77 17                	ja     40001140 <memmove+0x30>
40001129:	89 f2                	mov    %esi,%edx
4000112b:	09 c2                	or     %eax,%edx
4000112d:	83 e2 03             	and    $0x3,%edx
40001130:	74 46                	je     40001178 <memmove+0x68>
40001132:	89 c7                	mov    %eax,%edi
40001134:	fc                   	cld    
40001135:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
40001137:	5e                   	pop    %esi
40001138:	5f                   	pop    %edi
40001139:	c3                   	ret    
4000113a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
40001140:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
40001143:	89 d6                	mov    %edx,%esi
40001145:	09 fe                	or     %edi,%esi
40001147:	83 e6 03             	and    $0x3,%esi
4000114a:	74 14                	je     40001160 <memmove+0x50>
4000114c:	83 ef 01             	sub    $0x1,%edi
4000114f:	8d 72 ff             	lea    -0x1(%edx),%esi
40001152:	fd                   	std    
40001153:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
40001155:	fc                   	cld    
40001156:	5e                   	pop    %esi
40001157:	5f                   	pop    %edi
40001158:	c3                   	ret    
40001159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001160:	f6 c1 03             	test   $0x3,%cl
40001163:	75 e7                	jne    4000114c <memmove+0x3c>
40001165:	83 ef 04             	sub    $0x4,%edi
40001168:	8d 72 fc             	lea    -0x4(%edx),%esi
4000116b:	c1 e9 02             	shr    $0x2,%ecx
4000116e:	fd                   	std    
4000116f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40001171:	eb e2                	jmp    40001155 <memmove+0x45>
40001173:	90                   	nop
40001174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001178:	f6 c1 03             	test   $0x3,%cl
4000117b:	75 b5                	jne    40001132 <memmove+0x22>
4000117d:	c1 e9 02             	shr    $0x2,%ecx
40001180:	89 c7                	mov    %eax,%edi
40001182:	fc                   	cld    
40001183:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
40001185:	eb b0                	jmp    40001137 <memmove+0x27>
40001187:	89 f6                	mov    %esi,%esi
40001189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40001190 <memcpy>:
40001190:	e9 7b ff ff ff       	jmp    40001110 <memmove>
40001195:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

400011a0 <memcmp>:
400011a0:	57                   	push   %edi
400011a1:	56                   	push   %esi
400011a2:	53                   	push   %ebx
400011a3:	8b 5c 24 18          	mov    0x18(%esp),%ebx
400011a7:	8b 74 24 10          	mov    0x10(%esp),%esi
400011ab:	8b 7c 24 14          	mov    0x14(%esp),%edi
400011af:	85 db                	test   %ebx,%ebx
400011b1:	74 29                	je     400011dc <memcmp+0x3c>
400011b3:	0f b6 16             	movzbl (%esi),%edx
400011b6:	0f b6 0f             	movzbl (%edi),%ecx
400011b9:	38 d1                	cmp    %dl,%cl
400011bb:	75 2b                	jne    400011e8 <memcmp+0x48>
400011bd:	b8 01 00 00 00       	mov    $0x1,%eax
400011c2:	eb 14                	jmp    400011d8 <memcmp+0x38>
400011c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
400011c8:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
400011cc:	83 c0 01             	add    $0x1,%eax
400011cf:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
400011d4:	38 ca                	cmp    %cl,%dl
400011d6:	75 10                	jne    400011e8 <memcmp+0x48>
400011d8:	39 d8                	cmp    %ebx,%eax
400011da:	75 ec                	jne    400011c8 <memcmp+0x28>
400011dc:	5b                   	pop    %ebx
400011dd:	31 c0                	xor    %eax,%eax
400011df:	5e                   	pop    %esi
400011e0:	5f                   	pop    %edi
400011e1:	c3                   	ret    
400011e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400011e8:	0f b6 c2             	movzbl %dl,%eax
400011eb:	5b                   	pop    %ebx
400011ec:	29 c8                	sub    %ecx,%eax
400011ee:	5e                   	pop    %esi
400011ef:	5f                   	pop    %edi
400011f0:	c3                   	ret    
400011f1:	eb 0d                	jmp    40001200 <memchr>
400011f3:	90                   	nop
400011f4:	90                   	nop
400011f5:	90                   	nop
400011f6:	90                   	nop
400011f7:	90                   	nop
400011f8:	90                   	nop
400011f9:	90                   	nop
400011fa:	90                   	nop
400011fb:	90                   	nop
400011fc:	90                   	nop
400011fd:	90                   	nop
400011fe:	90                   	nop
400011ff:	90                   	nop

40001200 <memchr>:
40001200:	53                   	push   %ebx
40001201:	8b 44 24 08          	mov    0x8(%esp),%eax
40001205:	8b 54 24 10          	mov    0x10(%esp),%edx
40001209:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
4000120d:	01 c2                	add    %eax,%edx
4000120f:	39 d0                	cmp    %edx,%eax
40001211:	73 18                	jae    4000122b <memchr+0x2b>
40001213:	3a 18                	cmp    (%eax),%bl
40001215:	89 d9                	mov    %ebx,%ecx
40001217:	75 0b                	jne    40001224 <memchr+0x24>
40001219:	eb 12                	jmp    4000122d <memchr+0x2d>
4000121b:	90                   	nop
4000121c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001220:	38 08                	cmp    %cl,(%eax)
40001222:	74 09                	je     4000122d <memchr+0x2d>
40001224:	83 c0 01             	add    $0x1,%eax
40001227:	39 c2                	cmp    %eax,%edx
40001229:	75 f5                	jne    40001220 <memchr+0x20>
4000122b:	31 c0                	xor    %eax,%eax
4000122d:	5b                   	pop    %ebx
4000122e:	c3                   	ret    
4000122f:	90                   	nop

40001230 <init>:
40001230:	e8 fe fa ff ff       	call   40000d33 <__x86.get_pc_thunk.ax>
40001235:	05 cb 2d 00 00       	add    $0x2dcb,%eax
4000123a:	8b 0d 00 00 00 e0    	mov    0xe0000000,%ecx
40001240:	c7 c2 40 44 00 40    	mov    $0x40004440,%edx
40001246:	c7 c0 20 40 00 40    	mov    $0x40004020,%eax
4000124c:	89 0a                	mov    %ecx,(%edx)
4000124e:	8b 15 04 00 00 e0    	mov    0xe0000004,%edx
40001254:	89 10                	mov    %edx,(%eax)
40001256:	c3                   	ret    
40001257:	89 f6                	mov    %esi,%esi
40001259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40001260 <yield>:
40001260:	f3 c3                	repz ret 
40001262:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

40001270 <sys_getc>:
40001270:	e8 be fa ff ff       	call   40000d33 <__x86.get_pc_thunk.ax>
40001275:	05 8b 2d 00 00       	add    $0x2d8b,%eax
4000127a:	83 ec 0c             	sub    $0xc,%esp
4000127d:	c7 c0 20 40 00 40    	mov    $0x40004020,%eax
40001283:	ff 10                	call   *(%eax)
40001285:	83 c4 0c             	add    $0xc,%esp
40001288:	0f be c0             	movsbl %al,%eax
4000128b:	c3                   	ret    
4000128c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

40001290 <sys_puts>:
40001290:	55                   	push   %ebp
40001291:	57                   	push   %edi
40001292:	b8 ff 03 00 00       	mov    $0x3ff,%eax
40001297:	56                   	push   %esi
40001298:	53                   	push   %ebx
40001299:	e8 c9 f0 ff ff       	call   40000367 <__x86.get_pc_thunk.bx>
4000129e:	81 c3 62 2d 00 00    	add    $0x2d62,%ebx
400012a4:	83 ec 10             	sub    $0x10,%esp
400012a7:	8b 74 24 28          	mov    0x28(%esp),%esi
400012ab:	8b 7c 24 24          	mov    0x24(%esp),%edi
400012af:	c7 c5 40 40 00 40    	mov    $0x40004040,%ebp
400012b5:	81 fe ff 03 00 00    	cmp    $0x3ff,%esi
400012bb:	0f 47 f0             	cmova  %eax,%esi
400012be:	56                   	push   %esi
400012bf:	57                   	push   %edi
400012c0:	55                   	push   %ebp
400012c1:	e8 1a fb ff ff       	call   40000de0 <strncpy>
400012c6:	c7 c0 40 44 00 40    	mov    $0x40004440,%eax
400012cc:	8d 93 c0 d6 ff ff    	lea    -0x2940(%ebx),%edx
400012d2:	c6 44 35 00 00       	movb   $0x0,0x0(%ebp,%esi,1)
400012d7:	89 7c 24 34          	mov    %edi,0x34(%esp)
400012db:	89 54 24 30          	mov    %edx,0x30(%esp)
400012df:	8b 00                	mov    (%eax),%eax
400012e1:	83 c4 1c             	add    $0x1c,%esp
400012e4:	5b                   	pop    %ebx
400012e5:	5e                   	pop    %esi
400012e6:	5f                   	pop    %edi
400012e7:	5d                   	pop    %ebp
400012e8:	ff e0                	jmp    *%eax
400012ea:	66 90                	xchg   %ax,%ax
400012ec:	66 90                	xchg   %ax,%ax
400012ee:	66 90                	xchg   %ax,%ax

400012f0 <__udivdi3>:
400012f0:	55                   	push   %ebp
400012f1:	57                   	push   %edi
400012f2:	56                   	push   %esi
400012f3:	53                   	push   %ebx
400012f4:	83 ec 1c             	sub    $0x1c,%esp
400012f7:	8b 54 24 3c          	mov    0x3c(%esp),%edx
400012fb:	8b 6c 24 30          	mov    0x30(%esp),%ebp
400012ff:	8b 74 24 34          	mov    0x34(%esp),%esi
40001303:	8b 5c 24 38          	mov    0x38(%esp),%ebx
40001307:	85 d2                	test   %edx,%edx
40001309:	75 35                	jne    40001340 <__udivdi3+0x50>
4000130b:	39 f3                	cmp    %esi,%ebx
4000130d:	0f 87 bd 00 00 00    	ja     400013d0 <__udivdi3+0xe0>
40001313:	85 db                	test   %ebx,%ebx
40001315:	89 d9                	mov    %ebx,%ecx
40001317:	75 0b                	jne    40001324 <__udivdi3+0x34>
40001319:	b8 01 00 00 00       	mov    $0x1,%eax
4000131e:	31 d2                	xor    %edx,%edx
40001320:	f7 f3                	div    %ebx
40001322:	89 c1                	mov    %eax,%ecx
40001324:	31 d2                	xor    %edx,%edx
40001326:	89 f0                	mov    %esi,%eax
40001328:	f7 f1                	div    %ecx
4000132a:	89 c6                	mov    %eax,%esi
4000132c:	89 e8                	mov    %ebp,%eax
4000132e:	89 f7                	mov    %esi,%edi
40001330:	f7 f1                	div    %ecx
40001332:	89 fa                	mov    %edi,%edx
40001334:	83 c4 1c             	add    $0x1c,%esp
40001337:	5b                   	pop    %ebx
40001338:	5e                   	pop    %esi
40001339:	5f                   	pop    %edi
4000133a:	5d                   	pop    %ebp
4000133b:	c3                   	ret    
4000133c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
40001340:	39 f2                	cmp    %esi,%edx
40001342:	77 7c                	ja     400013c0 <__udivdi3+0xd0>
40001344:	0f bd fa             	bsr    %edx,%edi
40001347:	83 f7 1f             	xor    $0x1f,%edi
4000134a:	0f 84 98 00 00 00    	je     400013e8 <__udivdi3+0xf8>
40001350:	89 f9                	mov    %edi,%ecx
40001352:	b8 20 00 00 00       	mov    $0x20,%eax
40001357:	29 f8                	sub    %edi,%eax
40001359:	d3 e2                	shl    %cl,%edx
4000135b:	89 54 24 08          	mov    %edx,0x8(%esp)
4000135f:	89 c1                	mov    %eax,%ecx
40001361:	89 da                	mov    %ebx,%edx
40001363:	d3 ea                	shr    %cl,%edx
40001365:	8b 4c 24 08          	mov    0x8(%esp),%ecx
40001369:	09 d1                	or     %edx,%ecx
4000136b:	89 f2                	mov    %esi,%edx
4000136d:	89 4c 24 08          	mov    %ecx,0x8(%esp)
40001371:	89 f9                	mov    %edi,%ecx
40001373:	d3 e3                	shl    %cl,%ebx
40001375:	89 c1                	mov    %eax,%ecx
40001377:	d3 ea                	shr    %cl,%edx
40001379:	89 f9                	mov    %edi,%ecx
4000137b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
4000137f:	d3 e6                	shl    %cl,%esi
40001381:	89 eb                	mov    %ebp,%ebx
40001383:	89 c1                	mov    %eax,%ecx
40001385:	d3 eb                	shr    %cl,%ebx
40001387:	09 de                	or     %ebx,%esi
40001389:	89 f0                	mov    %esi,%eax
4000138b:	f7 74 24 08          	divl   0x8(%esp)
4000138f:	89 d6                	mov    %edx,%esi
40001391:	89 c3                	mov    %eax,%ebx
40001393:	f7 64 24 0c          	mull   0xc(%esp)
40001397:	39 d6                	cmp    %edx,%esi
40001399:	72 0c                	jb     400013a7 <__udivdi3+0xb7>
4000139b:	89 f9                	mov    %edi,%ecx
4000139d:	d3 e5                	shl    %cl,%ebp
4000139f:	39 c5                	cmp    %eax,%ebp
400013a1:	73 5d                	jae    40001400 <__udivdi3+0x110>
400013a3:	39 d6                	cmp    %edx,%esi
400013a5:	75 59                	jne    40001400 <__udivdi3+0x110>
400013a7:	8d 43 ff             	lea    -0x1(%ebx),%eax
400013aa:	31 ff                	xor    %edi,%edi
400013ac:	89 fa                	mov    %edi,%edx
400013ae:	83 c4 1c             	add    $0x1c,%esp
400013b1:	5b                   	pop    %ebx
400013b2:	5e                   	pop    %esi
400013b3:	5f                   	pop    %edi
400013b4:	5d                   	pop    %ebp
400013b5:	c3                   	ret    
400013b6:	8d 76 00             	lea    0x0(%esi),%esi
400013b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
400013c0:	31 ff                	xor    %edi,%edi
400013c2:	31 c0                	xor    %eax,%eax
400013c4:	89 fa                	mov    %edi,%edx
400013c6:	83 c4 1c             	add    $0x1c,%esp
400013c9:	5b                   	pop    %ebx
400013ca:	5e                   	pop    %esi
400013cb:	5f                   	pop    %edi
400013cc:	5d                   	pop    %ebp
400013cd:	c3                   	ret    
400013ce:	66 90                	xchg   %ax,%ax
400013d0:	31 ff                	xor    %edi,%edi
400013d2:	89 e8                	mov    %ebp,%eax
400013d4:	89 f2                	mov    %esi,%edx
400013d6:	f7 f3                	div    %ebx
400013d8:	89 fa                	mov    %edi,%edx
400013da:	83 c4 1c             	add    $0x1c,%esp
400013dd:	5b                   	pop    %ebx
400013de:	5e                   	pop    %esi
400013df:	5f                   	pop    %edi
400013e0:	5d                   	pop    %ebp
400013e1:	c3                   	ret    
400013e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
400013e8:	39 f2                	cmp    %esi,%edx
400013ea:	72 06                	jb     400013f2 <__udivdi3+0x102>
400013ec:	31 c0                	xor    %eax,%eax
400013ee:	39 eb                	cmp    %ebp,%ebx
400013f0:	77 d2                	ja     400013c4 <__udivdi3+0xd4>
400013f2:	b8 01 00 00 00       	mov    $0x1,%eax
400013f7:	eb cb                	jmp    400013c4 <__udivdi3+0xd4>
400013f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001400:	89 d8                	mov    %ebx,%eax
40001402:	31 ff                	xor    %edi,%edi
40001404:	eb be                	jmp    400013c4 <__udivdi3+0xd4>
40001406:	66 90                	xchg   %ax,%ax
40001408:	66 90                	xchg   %ax,%ax
4000140a:	66 90                	xchg   %ax,%ax
4000140c:	66 90                	xchg   %ax,%ax
4000140e:	66 90                	xchg   %ax,%ax

40001410 <__umoddi3>:
40001410:	55                   	push   %ebp
40001411:	57                   	push   %edi
40001412:	56                   	push   %esi
40001413:	53                   	push   %ebx
40001414:	83 ec 1c             	sub    $0x1c,%esp
40001417:	8b 6c 24 3c          	mov    0x3c(%esp),%ebp
4000141b:	8b 74 24 30          	mov    0x30(%esp),%esi
4000141f:	8b 5c 24 34          	mov    0x34(%esp),%ebx
40001423:	8b 7c 24 38          	mov    0x38(%esp),%edi
40001427:	85 ed                	test   %ebp,%ebp
40001429:	89 f0                	mov    %esi,%eax
4000142b:	89 da                	mov    %ebx,%edx
4000142d:	75 19                	jne    40001448 <__umoddi3+0x38>
4000142f:	39 df                	cmp    %ebx,%edi
40001431:	0f 86 b1 00 00 00    	jbe    400014e8 <__umoddi3+0xd8>
40001437:	f7 f7                	div    %edi
40001439:	89 d0                	mov    %edx,%eax
4000143b:	31 d2                	xor    %edx,%edx
4000143d:	83 c4 1c             	add    $0x1c,%esp
40001440:	5b                   	pop    %ebx
40001441:	5e                   	pop    %esi
40001442:	5f                   	pop    %edi
40001443:	5d                   	pop    %ebp
40001444:	c3                   	ret    
40001445:	8d 76 00             	lea    0x0(%esi),%esi
40001448:	39 dd                	cmp    %ebx,%ebp
4000144a:	77 f1                	ja     4000143d <__umoddi3+0x2d>
4000144c:	0f bd cd             	bsr    %ebp,%ecx
4000144f:	83 f1 1f             	xor    $0x1f,%ecx
40001452:	89 4c 24 04          	mov    %ecx,0x4(%esp)
40001456:	0f 84 b4 00 00 00    	je     40001510 <__umoddi3+0x100>
4000145c:	b8 20 00 00 00       	mov    $0x20,%eax
40001461:	89 c2                	mov    %eax,%edx
40001463:	8b 44 24 04          	mov    0x4(%esp),%eax
40001467:	29 c2                	sub    %eax,%edx
40001469:	89 c1                	mov    %eax,%ecx
4000146b:	89 f8                	mov    %edi,%eax
4000146d:	d3 e5                	shl    %cl,%ebp
4000146f:	89 d1                	mov    %edx,%ecx
40001471:	89 54 24 0c          	mov    %edx,0xc(%esp)
40001475:	d3 e8                	shr    %cl,%eax
40001477:	09 c5                	or     %eax,%ebp
40001479:	8b 44 24 04          	mov    0x4(%esp),%eax
4000147d:	89 c1                	mov    %eax,%ecx
4000147f:	d3 e7                	shl    %cl,%edi
40001481:	89 d1                	mov    %edx,%ecx
40001483:	89 7c 24 08          	mov    %edi,0x8(%esp)
40001487:	89 df                	mov    %ebx,%edi
40001489:	d3 ef                	shr    %cl,%edi
4000148b:	89 c1                	mov    %eax,%ecx
4000148d:	89 f0                	mov    %esi,%eax
4000148f:	d3 e3                	shl    %cl,%ebx
40001491:	89 d1                	mov    %edx,%ecx
40001493:	89 fa                	mov    %edi,%edx
40001495:	d3 e8                	shr    %cl,%eax
40001497:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
4000149c:	09 d8                	or     %ebx,%eax
4000149e:	f7 f5                	div    %ebp
400014a0:	d3 e6                	shl    %cl,%esi
400014a2:	89 d1                	mov    %edx,%ecx
400014a4:	f7 64 24 08          	mull   0x8(%esp)
400014a8:	39 d1                	cmp    %edx,%ecx
400014aa:	89 c3                	mov    %eax,%ebx
400014ac:	89 d7                	mov    %edx,%edi
400014ae:	72 06                	jb     400014b6 <__umoddi3+0xa6>
400014b0:	75 0e                	jne    400014c0 <__umoddi3+0xb0>
400014b2:	39 c6                	cmp    %eax,%esi
400014b4:	73 0a                	jae    400014c0 <__umoddi3+0xb0>
400014b6:	2b 44 24 08          	sub    0x8(%esp),%eax
400014ba:	19 ea                	sbb    %ebp,%edx
400014bc:	89 d7                	mov    %edx,%edi
400014be:	89 c3                	mov    %eax,%ebx
400014c0:	89 ca                	mov    %ecx,%edx
400014c2:	0f b6 4c 24 0c       	movzbl 0xc(%esp),%ecx
400014c7:	29 de                	sub    %ebx,%esi
400014c9:	19 fa                	sbb    %edi,%edx
400014cb:	8b 5c 24 04          	mov    0x4(%esp),%ebx
400014cf:	89 d0                	mov    %edx,%eax
400014d1:	d3 e0                	shl    %cl,%eax
400014d3:	89 d9                	mov    %ebx,%ecx
400014d5:	d3 ee                	shr    %cl,%esi
400014d7:	d3 ea                	shr    %cl,%edx
400014d9:	09 f0                	or     %esi,%eax
400014db:	83 c4 1c             	add    $0x1c,%esp
400014de:	5b                   	pop    %ebx
400014df:	5e                   	pop    %esi
400014e0:	5f                   	pop    %edi
400014e1:	5d                   	pop    %ebp
400014e2:	c3                   	ret    
400014e3:	90                   	nop
400014e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
400014e8:	85 ff                	test   %edi,%edi
400014ea:	89 f9                	mov    %edi,%ecx
400014ec:	75 0b                	jne    400014f9 <__umoddi3+0xe9>
400014ee:	b8 01 00 00 00       	mov    $0x1,%eax
400014f3:	31 d2                	xor    %edx,%edx
400014f5:	f7 f7                	div    %edi
400014f7:	89 c1                	mov    %eax,%ecx
400014f9:	89 d8                	mov    %ebx,%eax
400014fb:	31 d2                	xor    %edx,%edx
400014fd:	f7 f1                	div    %ecx
400014ff:	89 f0                	mov    %esi,%eax
40001501:	f7 f1                	div    %ecx
40001503:	e9 31 ff ff ff       	jmp    40001439 <__umoddi3+0x29>
40001508:	90                   	nop
40001509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
40001510:	39 dd                	cmp    %ebx,%ebp
40001512:	72 08                	jb     4000151c <__umoddi3+0x10c>
40001514:	39 f7                	cmp    %esi,%edi
40001516:	0f 87 21 ff ff ff    	ja     4000143d <__umoddi3+0x2d>
4000151c:	89 da                	mov    %ebx,%edx
4000151e:	89 f0                	mov    %esi,%eax
40001520:	29 f8                	sub    %edi,%eax
40001522:	19 ea                	sbb    %ebp,%edx
40001524:	e9 14 ff ff ff       	jmp    4000143d <__umoddi3+0x2d>
