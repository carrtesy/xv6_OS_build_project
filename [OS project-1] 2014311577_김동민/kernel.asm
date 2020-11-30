
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 90 10 00       	mov    $0x109000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc c0 b5 10 80       	mov    $0x8010b5c0,%esp
8010002d:	b8 c0 2f 10 80       	mov    $0x80102fc0,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb f4 b5 10 80       	mov    $0x8010b5f4,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 80 73 10 80       	push   $0x80107380
80100051:	68 c0 b5 10 80       	push   $0x8010b5c0
80100056:	e8 e5 44 00 00       	call   80104540 <initlock>
8010005b:	c7 05 0c fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd0c
80100062:	fc 10 80 
80100065:	c7 05 10 fd 10 80 bc 	movl   $0x8010fcbc,0x8010fd10
8010006c:	fc 10 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba bc fc 10 80       	mov    $0x8010fcbc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
80100092:	68 87 73 10 80       	push   $0x80107387
80100097:	50                   	push   %eax
80100098:	e8 73 43 00 00       	call   80104410 <initsleeplock>
8010009d:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
801000b6:	3d bc fc 10 80       	cmp    $0x8010fcbc,%eax
801000bb:	72 c3                	jb     80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 c0 b5 10 80       	push   $0x8010b5c0
801000e4:	e8 97 45 00 00       	call   80104680 <acquire>
801000e9:	8b 1d 10 fd 10 80    	mov    0x8010fd10,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 0c fd 10 80    	mov    0x8010fd0c,%ebx
80100126:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc fc 10 80    	cmp    $0x8010fcbc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 b5 10 80       	push   $0x8010b5c0
80100162:	e8 d9 45 00 00       	call   80104740 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 de 42 00 00       	call   80104450 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 bd 20 00 00       	call   80102240 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 8e 73 10 80       	push   $0x8010738e
80100198:	e8 f3 01 00 00       	call   80100390 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 3d 43 00 00       	call   801044f0 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 77 20 00 00       	jmp    80102240 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 9f 73 10 80       	push   $0x8010739f
801001d1:	e8 ba 01 00 00       	call   80100390 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 fc 42 00 00       	call   801044f0 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 ac 42 00 00       	call   801044b0 <releasesleep>
80100204:	c7 04 24 c0 b5 10 80 	movl   $0x8010b5c0,(%esp)
8010020b:	e8 70 44 00 00       	call   80104680 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100237:	c7 43 50 bc fc 10 80 	movl   $0x8010fcbc,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 10 fd 10 80       	mov    0x8010fd10,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d 10 fd 10 80    	mov    %ebx,0x8010fd10
8010024f:	c7 45 08 c0 b5 10 80 	movl   $0x8010b5c0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 df 44 00 00       	jmp    80104740 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 a6 73 10 80       	push   $0x801073a6
80100269:	e8 22 01 00 00       	call   80100390 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 eb 14 00 00       	call   80101770 <iunlock>
80100285:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010028c:	e8 ef 43 00 00       	call   80104680 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e a1 00 00 00    	jle    80100342 <consoleread+0xd2>
801002a1:	8b 15 a0 ff 10 80    	mov    0x8010ffa0,%edx
801002a7:	39 15 a4 ff 10 80    	cmp    %edx,0x8010ffa4
801002ad:	74 2c                	je     801002db <consoleread+0x6b>
801002af:	eb 5f                	jmp    80100310 <consoleread+0xa0>
801002b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801002b8:	83 ec 08             	sub    $0x8,%esp
801002bb:	68 20 a5 10 80       	push   $0x8010a520
801002c0:	68 a0 ff 10 80       	push   $0x8010ffa0
801002c5:	e8 06 3c 00 00       	call   80103ed0 <sleep>
801002ca:	8b 15 a0 ff 10 80    	mov    0x8010ffa0,%edx
801002d0:	83 c4 10             	add    $0x10,%esp
801002d3:	3b 15 a4 ff 10 80    	cmp    0x8010ffa4,%edx
801002d9:	75 35                	jne    80100310 <consoleread+0xa0>
801002db:	e8 30 36 00 00       	call   80103910 <myproc>
801002e0:	8b 40 24             	mov    0x24(%eax),%eax
801002e3:	85 c0                	test   %eax,%eax
801002e5:	74 d1                	je     801002b8 <consoleread+0x48>
801002e7:	83 ec 0c             	sub    $0xc,%esp
801002ea:	68 20 a5 10 80       	push   $0x8010a520
801002ef:	e8 4c 44 00 00       	call   80104740 <release>
801002f4:	89 3c 24             	mov    %edi,(%esp)
801002f7:	e8 94 13 00 00       	call   80101690 <ilock>
801002fc:	83 c4 10             	add    $0x10,%esp
801002ff:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100302:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100307:	5b                   	pop    %ebx
80100308:	5e                   	pop    %esi
80100309:	5f                   	pop    %edi
8010030a:	5d                   	pop    %ebp
8010030b:	c3                   	ret    
8010030c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100310:	8d 42 01             	lea    0x1(%edx),%eax
80100313:	a3 a0 ff 10 80       	mov    %eax,0x8010ffa0
80100318:	89 d0                	mov    %edx,%eax
8010031a:	83 e0 7f             	and    $0x7f,%eax
8010031d:	0f be 80 20 ff 10 80 	movsbl -0x7fef00e0(%eax),%eax
80100324:	83 f8 04             	cmp    $0x4,%eax
80100327:	74 3f                	je     80100368 <consoleread+0xf8>
80100329:	83 c6 01             	add    $0x1,%esi
8010032c:	83 eb 01             	sub    $0x1,%ebx
8010032f:	83 f8 0a             	cmp    $0xa,%eax
80100332:	88 46 ff             	mov    %al,-0x1(%esi)
80100335:	74 43                	je     8010037a <consoleread+0x10a>
80100337:	85 db                	test   %ebx,%ebx
80100339:	0f 85 62 ff ff ff    	jne    801002a1 <consoleread+0x31>
8010033f:	8b 45 10             	mov    0x10(%ebp),%eax
80100342:	83 ec 0c             	sub    $0xc,%esp
80100345:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100348:	68 20 a5 10 80       	push   $0x8010a520
8010034d:	e8 ee 43 00 00       	call   80104740 <release>
80100352:	89 3c 24             	mov    %edi,(%esp)
80100355:	e8 36 13 00 00       	call   80101690 <ilock>
8010035a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010035d:	83 c4 10             	add    $0x10,%esp
80100360:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100363:	5b                   	pop    %ebx
80100364:	5e                   	pop    %esi
80100365:	5f                   	pop    %edi
80100366:	5d                   	pop    %ebp
80100367:	c3                   	ret    
80100368:	8b 45 10             	mov    0x10(%ebp),%eax
8010036b:	29 d8                	sub    %ebx,%eax
8010036d:	3b 5d 10             	cmp    0x10(%ebp),%ebx
80100370:	73 d0                	jae    80100342 <consoleread+0xd2>
80100372:	89 15 a0 ff 10 80    	mov    %edx,0x8010ffa0
80100378:	eb c8                	jmp    80100342 <consoleread+0xd2>
8010037a:	8b 45 10             	mov    0x10(%ebp),%eax
8010037d:	29 d8                	sub    %ebx,%eax
8010037f:	eb c1                	jmp    80100342 <consoleread+0xd2>
80100381:	eb 0d                	jmp    80100390 <panic>
80100383:	90                   	nop
80100384:	90                   	nop
80100385:	90                   	nop
80100386:	90                   	nop
80100387:	90                   	nop
80100388:	90                   	nop
80100389:	90                   	nop
8010038a:	90                   	nop
8010038b:	90                   	nop
8010038c:	90                   	nop
8010038d:	90                   	nop
8010038e:	90                   	nop
8010038f:	90                   	nop

80100390 <panic>:
80100390:	55                   	push   %ebp
80100391:	89 e5                	mov    %esp,%ebp
80100393:	56                   	push   %esi
80100394:	53                   	push   %ebx
80100395:	83 ec 30             	sub    $0x30,%esp
80100398:	fa                   	cli    
80100399:	c7 05 54 a5 10 80 00 	movl   $0x0,0x8010a554
801003a0:	00 00 00 
801003a3:	8d 5d d0             	lea    -0x30(%ebp),%ebx
801003a6:	8d 75 f8             	lea    -0x8(%ebp),%esi
801003a9:	e8 a2 24 00 00       	call   80102850 <lapicid>
801003ae:	83 ec 08             	sub    $0x8,%esp
801003b1:	50                   	push   %eax
801003b2:	68 ad 73 10 80       	push   $0x801073ad
801003b7:	e8 a4 02 00 00       	call   80100660 <cprintf>
801003bc:	58                   	pop    %eax
801003bd:	ff 75 08             	pushl  0x8(%ebp)
801003c0:	e8 9b 02 00 00       	call   80100660 <cprintf>
801003c5:	c7 04 24 f3 79 10 80 	movl   $0x801079f3,(%esp)
801003cc:	e8 8f 02 00 00       	call   80100660 <cprintf>
801003d1:	5a                   	pop    %edx
801003d2:	8d 45 08             	lea    0x8(%ebp),%eax
801003d5:	59                   	pop    %ecx
801003d6:	53                   	push   %ebx
801003d7:	50                   	push   %eax
801003d8:	e8 83 41 00 00       	call   80104560 <getcallerpcs>
801003dd:	83 c4 10             	add    $0x10,%esp
801003e0:	83 ec 08             	sub    $0x8,%esp
801003e3:	ff 33                	pushl  (%ebx)
801003e5:	83 c3 04             	add    $0x4,%ebx
801003e8:	68 c1 73 10 80       	push   $0x801073c1
801003ed:	e8 6e 02 00 00       	call   80100660 <cprintf>
801003f2:	83 c4 10             	add    $0x10,%esp
801003f5:	39 f3                	cmp    %esi,%ebx
801003f7:	75 e7                	jne    801003e0 <panic+0x50>
801003f9:	c7 05 58 a5 10 80 01 	movl   $0x1,0x8010a558
80100400:	00 00 00 
80100403:	eb fe                	jmp    80100403 <panic+0x73>
80100405:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100410 <consputc>:
80100410:	8b 0d 58 a5 10 80    	mov    0x8010a558,%ecx
80100416:	85 c9                	test   %ecx,%ecx
80100418:	74 06                	je     80100420 <consputc+0x10>
8010041a:	fa                   	cli    
8010041b:	eb fe                	jmp    8010041b <consputc+0xb>
8010041d:	8d 76 00             	lea    0x0(%esi),%esi
80100420:	55                   	push   %ebp
80100421:	89 e5                	mov    %esp,%ebp
80100423:	57                   	push   %edi
80100424:	56                   	push   %esi
80100425:	53                   	push   %ebx
80100426:	89 c6                	mov    %eax,%esi
80100428:	83 ec 0c             	sub    $0xc,%esp
8010042b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100430:	0f 84 b1 00 00 00    	je     801004e7 <consputc+0xd7>
80100436:	83 ec 0c             	sub    $0xc,%esp
80100439:	50                   	push   %eax
8010043a:	e8 51 5b 00 00       	call   80105f90 <uartputc>
8010043f:	83 c4 10             	add    $0x10,%esp
80100442:	bb d4 03 00 00       	mov    $0x3d4,%ebx
80100447:	b8 0e 00 00 00       	mov    $0xe,%eax
8010044c:	89 da                	mov    %ebx,%edx
8010044e:	ee                   	out    %al,(%dx)
8010044f:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
80100454:	89 ca                	mov    %ecx,%edx
80100456:	ec                   	in     (%dx),%al
80100457:	0f b6 c0             	movzbl %al,%eax
8010045a:	89 da                	mov    %ebx,%edx
8010045c:	c1 e0 08             	shl    $0x8,%eax
8010045f:	89 c7                	mov    %eax,%edi
80100461:	b8 0f 00 00 00       	mov    $0xf,%eax
80100466:	ee                   	out    %al,(%dx)
80100467:	89 ca                	mov    %ecx,%edx
80100469:	ec                   	in     (%dx),%al
8010046a:	0f b6 d8             	movzbl %al,%ebx
8010046d:	09 fb                	or     %edi,%ebx
8010046f:	83 fe 0a             	cmp    $0xa,%esi
80100472:	0f 84 f3 00 00 00    	je     8010056b <consputc+0x15b>
80100478:	81 fe 00 01 00 00    	cmp    $0x100,%esi
8010047e:	0f 84 d7 00 00 00    	je     8010055b <consputc+0x14b>
80100484:	89 f0                	mov    %esi,%eax
80100486:	0f b6 c0             	movzbl %al,%eax
80100489:	80 cc 07             	or     $0x7,%ah
8010048c:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
80100493:	80 
80100494:	83 c3 01             	add    $0x1,%ebx
80100497:	81 fb d0 07 00 00    	cmp    $0x7d0,%ebx
8010049d:	0f 8f ab 00 00 00    	jg     8010054e <consputc+0x13e>
801004a3:	81 fb 7f 07 00 00    	cmp    $0x77f,%ebx
801004a9:	7f 66                	jg     80100511 <consputc+0x101>
801004ab:	be d4 03 00 00       	mov    $0x3d4,%esi
801004b0:	b8 0e 00 00 00       	mov    $0xe,%eax
801004b5:	89 f2                	mov    %esi,%edx
801004b7:	ee                   	out    %al,(%dx)
801004b8:	b9 d5 03 00 00       	mov    $0x3d5,%ecx
801004bd:	89 d8                	mov    %ebx,%eax
801004bf:	c1 f8 08             	sar    $0x8,%eax
801004c2:	89 ca                	mov    %ecx,%edx
801004c4:	ee                   	out    %al,(%dx)
801004c5:	b8 0f 00 00 00       	mov    $0xf,%eax
801004ca:	89 f2                	mov    %esi,%edx
801004cc:	ee                   	out    %al,(%dx)
801004cd:	89 d8                	mov    %ebx,%eax
801004cf:	89 ca                	mov    %ecx,%edx
801004d1:	ee                   	out    %al,(%dx)
801004d2:	b8 20 07 00 00       	mov    $0x720,%eax
801004d7:	66 89 84 1b 00 80 0b 	mov    %ax,-0x7ff48000(%ebx,%ebx,1)
801004de:	80 
801004df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004e2:	5b                   	pop    %ebx
801004e3:	5e                   	pop    %esi
801004e4:	5f                   	pop    %edi
801004e5:	5d                   	pop    %ebp
801004e6:	c3                   	ret    
801004e7:	83 ec 0c             	sub    $0xc,%esp
801004ea:	6a 08                	push   $0x8
801004ec:	e8 9f 5a 00 00       	call   80105f90 <uartputc>
801004f1:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004f8:	e8 93 5a 00 00       	call   80105f90 <uartputc>
801004fd:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
80100504:	e8 87 5a 00 00       	call   80105f90 <uartputc>
80100509:	83 c4 10             	add    $0x10,%esp
8010050c:	e9 31 ff ff ff       	jmp    80100442 <consputc+0x32>
80100511:	52                   	push   %edx
80100512:	68 60 0e 00 00       	push   $0xe60
80100517:	83 eb 50             	sub    $0x50,%ebx
8010051a:	68 a0 80 0b 80       	push   $0x800b80a0
8010051f:	68 00 80 0b 80       	push   $0x800b8000
80100524:	e8 17 43 00 00       	call   80104840 <memmove>
80100529:	b8 80 07 00 00       	mov    $0x780,%eax
8010052e:	83 c4 0c             	add    $0xc,%esp
80100531:	29 d8                	sub    %ebx,%eax
80100533:	01 c0                	add    %eax,%eax
80100535:	50                   	push   %eax
80100536:	8d 04 1b             	lea    (%ebx,%ebx,1),%eax
80100539:	6a 00                	push   $0x0
8010053b:	2d 00 80 f4 7f       	sub    $0x7ff48000,%eax
80100540:	50                   	push   %eax
80100541:	e8 4a 42 00 00       	call   80104790 <memset>
80100546:	83 c4 10             	add    $0x10,%esp
80100549:	e9 5d ff ff ff       	jmp    801004ab <consputc+0x9b>
8010054e:	83 ec 0c             	sub    $0xc,%esp
80100551:	68 c5 73 10 80       	push   $0x801073c5
80100556:	e8 35 fe ff ff       	call   80100390 <panic>
8010055b:	85 db                	test   %ebx,%ebx
8010055d:	0f 84 48 ff ff ff    	je     801004ab <consputc+0x9b>
80100563:	83 eb 01             	sub    $0x1,%ebx
80100566:	e9 2c ff ff ff       	jmp    80100497 <consputc+0x87>
8010056b:	89 d8                	mov    %ebx,%eax
8010056d:	b9 50 00 00 00       	mov    $0x50,%ecx
80100572:	99                   	cltd   
80100573:	f7 f9                	idiv   %ecx
80100575:	29 d1                	sub    %edx,%ecx
80100577:	01 cb                	add    %ecx,%ebx
80100579:	e9 19 ff ff ff       	jmp    80100497 <consputc+0x87>
8010057e:	66 90                	xchg   %ax,%ax

80100580 <printint>:
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d3                	mov    %edx,%ebx
80100588:	83 ec 2c             	sub    $0x2c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100590:	74 04                	je     80100596 <printint+0x16>
80100592:	85 c0                	test   %eax,%eax
80100594:	78 5a                	js     801005f0 <printint+0x70>
80100596:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
8010059d:	31 c9                	xor    %ecx,%ecx
8010059f:	8d 75 d7             	lea    -0x29(%ebp),%esi
801005a2:	eb 06                	jmp    801005aa <printint+0x2a>
801005a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801005a8:	89 f9                	mov    %edi,%ecx
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 79 01             	lea    0x1(%ecx),%edi
801005af:	f7 f3                	div    %ebx
801005b1:	0f b6 92 f0 73 10 80 	movzbl -0x7fef8c10(%edx),%edx
801005b8:	85 c0                	test   %eax,%eax
801005ba:	88 14 3e             	mov    %dl,(%esi,%edi,1)
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
801005c6:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
801005cb:	8d 79 02             	lea    0x2(%ecx),%edi
801005ce:	8d 5c 3d d7          	lea    -0x29(%ebp,%edi,1),%ebx
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005d8:	0f be 03             	movsbl (%ebx),%eax
801005db:	83 eb 01             	sub    $0x1,%ebx
801005de:	e8 2d fe ff ff       	call   80100410 <consputc>
801005e3:	39 f3                	cmp    %esi,%ebx
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	90                   	nop
801005f0:	f7 d8                	neg    %eax
801005f2:	eb a9                	jmp    8010059d <printint+0x1d>
801005f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	8b 75 10             	mov    0x10(%ebp),%esi
8010060c:	ff 75 08             	pushl  0x8(%ebp)
8010060f:	e8 5c 11 00 00       	call   80101770 <iunlock>
80100614:	c7 04 24 20 a5 10 80 	movl   $0x8010a520,(%esp)
8010061b:	e8 60 40 00 00       	call   80104680 <acquire>
80100620:	83 c4 10             	add    $0x10,%esp
80100623:	85 f6                	test   %esi,%esi
80100625:	7e 18                	jle    8010063f <consolewrite+0x3f>
80100627:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010062a:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 d5 fd ff ff       	call   80100410 <consputc>
8010063b:	39 fb                	cmp    %edi,%ebx
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 a5 10 80       	push   $0x8010a520
80100647:	e8 f4 40 00 00       	call   80104740 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 3b 10 00 00       	call   80101690 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 a5 10 80       	mov    0x8010a554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 dc             	mov    %eax,-0x24(%ebp)
80100673:	0f 85 6f 01 00 00    	jne    801007e8 <cprintf+0x188>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c7                	mov    %eax,%edi
80100680:	0f 84 77 01 00 00    	je     801007fd <cprintf+0x19d>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	8d 4d 0c             	lea    0xc(%ebp),%ecx
8010068c:	31 db                	xor    %ebx,%ebx
8010068e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80100691:	85 c0                	test   %eax,%eax
80100693:	75 56                	jne    801006eb <cprintf+0x8b>
80100695:	eb 79                	jmp    80100710 <cprintf+0xb0>
80100697:	89 f6                	mov    %esi,%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	0f b6 16             	movzbl (%esi),%edx
801006a3:	85 d2                	test   %edx,%edx
801006a5:	74 69                	je     80100710 <cprintf+0xb0>
801006a7:	83 c3 02             	add    $0x2,%ebx
801006aa:	83 fa 70             	cmp    $0x70,%edx
801006ad:	8d 34 1f             	lea    (%edi,%ebx,1),%esi
801006b0:	0f 84 84 00 00 00    	je     8010073a <cprintf+0xda>
801006b6:	7f 78                	jg     80100730 <cprintf+0xd0>
801006b8:	83 fa 25             	cmp    $0x25,%edx
801006bb:	0f 84 ff 00 00 00    	je     801007c0 <cprintf+0x160>
801006c1:	83 fa 64             	cmp    $0x64,%edx
801006c4:	0f 85 8e 00 00 00    	jne    80100758 <cprintf+0xf8>
801006ca:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801006cd:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d2:	8d 48 04             	lea    0x4(%eax),%ecx
801006d5:	8b 00                	mov    (%eax),%eax
801006d7:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801006da:	b9 01 00 00 00       	mov    $0x1,%ecx
801006df:	e8 9c fe ff ff       	call   80100580 <printint>
801006e4:	0f b6 06             	movzbl (%esi),%eax
801006e7:	85 c0                	test   %eax,%eax
801006e9:	74 25                	je     80100710 <cprintf+0xb0>
801006eb:	8d 53 01             	lea    0x1(%ebx),%edx
801006ee:	83 f8 25             	cmp    $0x25,%eax
801006f1:	8d 34 17             	lea    (%edi,%edx,1),%esi
801006f4:	74 aa                	je     801006a0 <cprintf+0x40>
801006f6:	89 55 e0             	mov    %edx,-0x20(%ebp)
801006f9:	e8 12 fd ff ff       	call   80100410 <consputc>
801006fe:	0f b6 06             	movzbl (%esi),%eax
80100701:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100704:	89 d3                	mov    %edx,%ebx
80100706:	85 c0                	test   %eax,%eax
80100708:	75 e1                	jne    801006eb <cprintf+0x8b>
8010070a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100710:	8b 45 dc             	mov    -0x24(%ebp),%eax
80100713:	85 c0                	test   %eax,%eax
80100715:	74 10                	je     80100727 <cprintf+0xc7>
80100717:	83 ec 0c             	sub    $0xc,%esp
8010071a:	68 20 a5 10 80       	push   $0x8010a520
8010071f:	e8 1c 40 00 00       	call   80104740 <release>
80100724:	83 c4 10             	add    $0x10,%esp
80100727:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010072a:	5b                   	pop    %ebx
8010072b:	5e                   	pop    %esi
8010072c:	5f                   	pop    %edi
8010072d:	5d                   	pop    %ebp
8010072e:	c3                   	ret    
8010072f:	90                   	nop
80100730:	83 fa 73             	cmp    $0x73,%edx
80100733:	74 43                	je     80100778 <cprintf+0x118>
80100735:	83 fa 78             	cmp    $0x78,%edx
80100738:	75 1e                	jne    80100758 <cprintf+0xf8>
8010073a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010073d:	ba 10 00 00 00       	mov    $0x10,%edx
80100742:	8d 48 04             	lea    0x4(%eax),%ecx
80100745:	8b 00                	mov    (%eax),%eax
80100747:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010074a:	31 c9                	xor    %ecx,%ecx
8010074c:	e8 2f fe ff ff       	call   80100580 <printint>
80100751:	eb 91                	jmp    801006e4 <cprintf+0x84>
80100753:	90                   	nop
80100754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100758:	b8 25 00 00 00       	mov    $0x25,%eax
8010075d:	89 55 e0             	mov    %edx,-0x20(%ebp)
80100760:	e8 ab fc ff ff       	call   80100410 <consputc>
80100765:	8b 55 e0             	mov    -0x20(%ebp),%edx
80100768:	89 d0                	mov    %edx,%eax
8010076a:	e8 a1 fc ff ff       	call   80100410 <consputc>
8010076f:	e9 70 ff ff ff       	jmp    801006e4 <cprintf+0x84>
80100774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100778:	8b 45 e4             	mov    -0x1c(%ebp),%eax
8010077b:	8b 10                	mov    (%eax),%edx
8010077d:	8d 48 04             	lea    0x4(%eax),%ecx
80100780:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80100783:	85 d2                	test   %edx,%edx
80100785:	74 49                	je     801007d0 <cprintf+0x170>
80100787:	0f be 02             	movsbl (%edx),%eax
8010078a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010078d:	84 c0                	test   %al,%al
8010078f:	0f 84 4f ff ff ff    	je     801006e4 <cprintf+0x84>
80100795:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
80100798:	89 d3                	mov    %edx,%ebx
8010079a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801007a0:	83 c3 01             	add    $0x1,%ebx
801007a3:	e8 68 fc ff ff       	call   80100410 <consputc>
801007a8:	0f be 03             	movsbl (%ebx),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
801007af:	8b 45 e0             	mov    -0x20(%ebp),%eax
801007b2:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801007b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801007b8:	e9 27 ff ff ff       	jmp    801006e4 <cprintf+0x84>
801007bd:	8d 76 00             	lea    0x0(%esi),%esi
801007c0:	b8 25 00 00 00       	mov    $0x25,%eax
801007c5:	e8 46 fc ff ff       	call   80100410 <consputc>
801007ca:	e9 15 ff ff ff       	jmp    801006e4 <cprintf+0x84>
801007cf:	90                   	nop
801007d0:	ba d8 73 10 80       	mov    $0x801073d8,%edx
801007d5:	89 5d e4             	mov    %ebx,-0x1c(%ebp)
801007d8:	b8 28 00 00 00       	mov    $0x28,%eax
801007dd:	89 d3                	mov    %edx,%ebx
801007df:	eb bf                	jmp    801007a0 <cprintf+0x140>
801007e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e8:	83 ec 0c             	sub    $0xc,%esp
801007eb:	68 20 a5 10 80       	push   $0x8010a520
801007f0:	e8 8b 3e 00 00       	call   80104680 <acquire>
801007f5:	83 c4 10             	add    $0x10,%esp
801007f8:	e9 7c fe ff ff       	jmp    80100679 <cprintf+0x19>
801007fd:	83 ec 0c             	sub    $0xc,%esp
80100800:	68 df 73 10 80       	push   $0x801073df
80100805:	e8 86 fb ff ff       	call   80100390 <panic>
8010080a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100810 <consoleintr>:
80100810:	55                   	push   %ebp
80100811:	89 e5                	mov    %esp,%ebp
80100813:	57                   	push   %edi
80100814:	56                   	push   %esi
80100815:	53                   	push   %ebx
80100816:	31 f6                	xor    %esi,%esi
80100818:	83 ec 18             	sub    $0x18,%esp
8010081b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010081e:	68 20 a5 10 80       	push   $0x8010a520
80100823:	e8 58 3e 00 00       	call   80104680 <acquire>
80100828:	83 c4 10             	add    $0x10,%esp
8010082b:	90                   	nop
8010082c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100830:	ff d3                	call   *%ebx
80100832:	85 c0                	test   %eax,%eax
80100834:	89 c7                	mov    %eax,%edi
80100836:	78 48                	js     80100880 <consoleintr+0x70>
80100838:	83 ff 10             	cmp    $0x10,%edi
8010083b:	0f 84 e7 00 00 00    	je     80100928 <consoleintr+0x118>
80100841:	7e 5d                	jle    801008a0 <consoleintr+0x90>
80100843:	83 ff 15             	cmp    $0x15,%edi
80100846:	0f 84 ec 00 00 00    	je     80100938 <consoleintr+0x128>
8010084c:	83 ff 7f             	cmp    $0x7f,%edi
8010084f:	75 54                	jne    801008a5 <consoleintr+0x95>
80100851:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100856:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010085c:	74 d2                	je     80100830 <consoleintr+0x20>
8010085e:	83 e8 01             	sub    $0x1,%eax
80100861:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100866:	b8 00 01 00 00       	mov    $0x100,%eax
8010086b:	e8 a0 fb ff ff       	call   80100410 <consputc>
80100870:	ff d3                	call   *%ebx
80100872:	85 c0                	test   %eax,%eax
80100874:	89 c7                	mov    %eax,%edi
80100876:	79 c0                	jns    80100838 <consoleintr+0x28>
80100878:	90                   	nop
80100879:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100880:	83 ec 0c             	sub    $0xc,%esp
80100883:	68 20 a5 10 80       	push   $0x8010a520
80100888:	e8 b3 3e 00 00       	call   80104740 <release>
8010088d:	83 c4 10             	add    $0x10,%esp
80100890:	85 f6                	test   %esi,%esi
80100892:	0f 85 f8 00 00 00    	jne    80100990 <consoleintr+0x180>
80100898:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010089b:	5b                   	pop    %ebx
8010089c:	5e                   	pop    %esi
8010089d:	5f                   	pop    %edi
8010089e:	5d                   	pop    %ebp
8010089f:	c3                   	ret    
801008a0:	83 ff 08             	cmp    $0x8,%edi
801008a3:	74 ac                	je     80100851 <consoleintr+0x41>
801008a5:	85 ff                	test   %edi,%edi
801008a7:	74 87                	je     80100830 <consoleintr+0x20>
801008a9:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801008ae:	89 c2                	mov    %eax,%edx
801008b0:	2b 15 a0 ff 10 80    	sub    0x8010ffa0,%edx
801008b6:	83 fa 7f             	cmp    $0x7f,%edx
801008b9:	0f 87 71 ff ff ff    	ja     80100830 <consoleintr+0x20>
801008bf:	8d 50 01             	lea    0x1(%eax),%edx
801008c2:	83 e0 7f             	and    $0x7f,%eax
801008c5:	83 ff 0d             	cmp    $0xd,%edi
801008c8:	89 15 a8 ff 10 80    	mov    %edx,0x8010ffa8
801008ce:	0f 84 cc 00 00 00    	je     801009a0 <consoleintr+0x190>
801008d4:	89 f9                	mov    %edi,%ecx
801008d6:	88 88 20 ff 10 80    	mov    %cl,-0x7fef00e0(%eax)
801008dc:	89 f8                	mov    %edi,%eax
801008de:	e8 2d fb ff ff       	call   80100410 <consputc>
801008e3:	83 ff 0a             	cmp    $0xa,%edi
801008e6:	0f 84 c5 00 00 00    	je     801009b1 <consoleintr+0x1a1>
801008ec:	83 ff 04             	cmp    $0x4,%edi
801008ef:	0f 84 bc 00 00 00    	je     801009b1 <consoleintr+0x1a1>
801008f5:	a1 a0 ff 10 80       	mov    0x8010ffa0,%eax
801008fa:	83 e8 80             	sub    $0xffffff80,%eax
801008fd:	39 05 a8 ff 10 80    	cmp    %eax,0x8010ffa8
80100903:	0f 85 27 ff ff ff    	jne    80100830 <consoleintr+0x20>
80100909:	83 ec 0c             	sub    $0xc,%esp
8010090c:	a3 a4 ff 10 80       	mov    %eax,0x8010ffa4
80100911:	68 a0 ff 10 80       	push   $0x8010ffa0
80100916:	e8 65 37 00 00       	call   80104080 <wakeup>
8010091b:	83 c4 10             	add    $0x10,%esp
8010091e:	e9 0d ff ff ff       	jmp    80100830 <consoleintr+0x20>
80100923:	90                   	nop
80100924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100928:	be 01 00 00 00       	mov    $0x1,%esi
8010092d:	e9 fe fe ff ff       	jmp    80100830 <consoleintr+0x20>
80100932:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100938:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
8010093d:	39 05 a4 ff 10 80    	cmp    %eax,0x8010ffa4
80100943:	75 2b                	jne    80100970 <consoleintr+0x160>
80100945:	e9 e6 fe ff ff       	jmp    80100830 <consoleintr+0x20>
8010094a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100950:	a3 a8 ff 10 80       	mov    %eax,0x8010ffa8
80100955:	b8 00 01 00 00       	mov    $0x100,%eax
8010095a:	e8 b1 fa ff ff       	call   80100410 <consputc>
8010095f:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
80100964:	3b 05 a4 ff 10 80    	cmp    0x8010ffa4,%eax
8010096a:	0f 84 c0 fe ff ff    	je     80100830 <consoleintr+0x20>
80100970:	83 e8 01             	sub    $0x1,%eax
80100973:	89 c2                	mov    %eax,%edx
80100975:	83 e2 7f             	and    $0x7f,%edx
80100978:	80 ba 20 ff 10 80 0a 	cmpb   $0xa,-0x7fef00e0(%edx)
8010097f:	75 cf                	jne    80100950 <consoleintr+0x140>
80100981:	e9 aa fe ff ff       	jmp    80100830 <consoleintr+0x20>
80100986:	8d 76 00             	lea    0x0(%esi),%esi
80100989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100990:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100993:	5b                   	pop    %ebx
80100994:	5e                   	pop    %esi
80100995:	5f                   	pop    %edi
80100996:	5d                   	pop    %ebp
80100997:	e9 c4 37 00 00       	jmp    80104160 <procdump>
8010099c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801009a0:	c6 80 20 ff 10 80 0a 	movb   $0xa,-0x7fef00e0(%eax)
801009a7:	b8 0a 00 00 00       	mov    $0xa,%eax
801009ac:	e8 5f fa ff ff       	call   80100410 <consputc>
801009b1:	a1 a8 ff 10 80       	mov    0x8010ffa8,%eax
801009b6:	e9 4e ff ff ff       	jmp    80100909 <consoleintr+0xf9>
801009bb:	90                   	nop
801009bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801009c0 <consoleinit>:
801009c0:	55                   	push   %ebp
801009c1:	89 e5                	mov    %esp,%ebp
801009c3:	83 ec 10             	sub    $0x10,%esp
801009c6:	68 e8 73 10 80       	push   $0x801073e8
801009cb:	68 20 a5 10 80       	push   $0x8010a520
801009d0:	e8 6b 3b 00 00       	call   80104540 <initlock>
801009d5:	58                   	pop    %eax
801009d6:	5a                   	pop    %edx
801009d7:	6a 00                	push   $0x0
801009d9:	6a 01                	push   $0x1
801009db:	c7 05 6c 09 11 80 00 	movl   $0x80100600,0x8011096c
801009e2:	06 10 80 
801009e5:	c7 05 68 09 11 80 70 	movl   $0x80100270,0x80110968
801009ec:	02 10 80 
801009ef:	c7 05 54 a5 10 80 01 	movl   $0x1,0x8010a554
801009f6:	00 00 00 
801009f9:	e8 f2 19 00 00       	call   801023f0 <ioapicenable>
801009fe:	83 c4 10             	add    $0x10,%esp
80100a01:	c9                   	leave  
80100a02:	c3                   	ret    
80100a03:	66 90                	xchg   %ax,%ax
80100a05:	66 90                	xchg   %ax,%ax
80100a07:	66 90                	xchg   %ax,%ax
80100a09:	66 90                	xchg   %ax,%ax
80100a0b:	66 90                	xchg   %ax,%ax
80100a0d:	66 90                	xchg   %ax,%ax
80100a0f:	90                   	nop

80100a10 <exec>:
80100a10:	55                   	push   %ebp
80100a11:	89 e5                	mov    %esp,%ebp
80100a13:	57                   	push   %edi
80100a14:	56                   	push   %esi
80100a15:	53                   	push   %ebx
80100a16:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
80100a1c:	e8 ef 2e 00 00       	call   80103910 <myproc>
80100a21:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a27:	e8 94 22 00 00       	call   80102cc0 <begin_op>
80100a2c:	83 ec 0c             	sub    $0xc,%esp
80100a2f:	ff 75 08             	pushl  0x8(%ebp)
80100a32:	e8 b9 14 00 00       	call   80101ef0 <namei>
80100a37:	83 c4 10             	add    $0x10,%esp
80100a3a:	85 c0                	test   %eax,%eax
80100a3c:	0f 84 91 01 00 00    	je     80100bd3 <exec+0x1c3>
80100a42:	83 ec 0c             	sub    $0xc,%esp
80100a45:	89 c3                	mov    %eax,%ebx
80100a47:	50                   	push   %eax
80100a48:	e8 43 0c 00 00       	call   80101690 <ilock>
80100a4d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a53:	6a 34                	push   $0x34
80100a55:	6a 00                	push   $0x0
80100a57:	50                   	push   %eax
80100a58:	53                   	push   %ebx
80100a59:	e8 12 0f 00 00       	call   80101970 <readi>
80100a5e:	83 c4 20             	add    $0x20,%esp
80100a61:	83 f8 34             	cmp    $0x34,%eax
80100a64:	74 22                	je     80100a88 <exec+0x78>
80100a66:	83 ec 0c             	sub    $0xc,%esp
80100a69:	53                   	push   %ebx
80100a6a:	e8 b1 0e 00 00       	call   80101920 <iunlockput>
80100a6f:	e8 bc 22 00 00       	call   80102d30 <end_op>
80100a74:	83 c4 10             	add    $0x10,%esp
80100a77:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100a7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a7f:	5b                   	pop    %ebx
80100a80:	5e                   	pop    %esi
80100a81:	5f                   	pop    %edi
80100a82:	5d                   	pop    %ebp
80100a83:	c3                   	ret    
80100a84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100a88:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a8f:	45 4c 46 
80100a92:	75 d2                	jne    80100a66 <exec+0x56>
80100a94:	e8 47 66 00 00       	call   801070e0 <setupkvm>
80100a99:	85 c0                	test   %eax,%eax
80100a9b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100aa1:	74 c3                	je     80100a66 <exec+0x56>
80100aa3:	31 ff                	xor    %edi,%edi
80100aa5:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100aac:	00 
80100aad:	8b 85 40 ff ff ff    	mov    -0xc0(%ebp),%eax
80100ab3:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100ab9:	0f 84 8c 02 00 00    	je     80100d4b <exec+0x33b>
80100abf:	31 f6                	xor    %esi,%esi
80100ac1:	eb 7f                	jmp    80100b42 <exec+0x132>
80100ac3:	90                   	nop
80100ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ac8:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100acf:	75 63                	jne    80100b34 <exec+0x124>
80100ad1:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ad7:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100add:	0f 82 86 00 00 00    	jb     80100b69 <exec+0x159>
80100ae3:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100ae9:	72 7e                	jb     80100b69 <exec+0x159>
80100aeb:	83 ec 04             	sub    $0x4,%esp
80100aee:	50                   	push   %eax
80100aef:	57                   	push   %edi
80100af0:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100af6:	e8 05 64 00 00       	call   80106f00 <allocuvm>
80100afb:	83 c4 10             	add    $0x10,%esp
80100afe:	85 c0                	test   %eax,%eax
80100b00:	89 c7                	mov    %eax,%edi
80100b02:	74 65                	je     80100b69 <exec+0x159>
80100b04:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b0a:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b0f:	75 58                	jne    80100b69 <exec+0x159>
80100b11:	83 ec 0c             	sub    $0xc,%esp
80100b14:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b1a:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b20:	53                   	push   %ebx
80100b21:	50                   	push   %eax
80100b22:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b28:	e8 13 63 00 00       	call   80106e40 <loaduvm>
80100b2d:	83 c4 20             	add    $0x20,%esp
80100b30:	85 c0                	test   %eax,%eax
80100b32:	78 35                	js     80100b69 <exec+0x159>
80100b34:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100b3b:	83 c6 01             	add    $0x1,%esi
80100b3e:	39 f0                	cmp    %esi,%eax
80100b40:	7e 3d                	jle    80100b7f <exec+0x16f>
80100b42:	89 f0                	mov    %esi,%eax
80100b44:	6a 20                	push   $0x20
80100b46:	c1 e0 05             	shl    $0x5,%eax
80100b49:	03 85 ec fe ff ff    	add    -0x114(%ebp),%eax
80100b4f:	50                   	push   %eax
80100b50:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100b56:	50                   	push   %eax
80100b57:	53                   	push   %ebx
80100b58:	e8 13 0e 00 00       	call   80101970 <readi>
80100b5d:	83 c4 10             	add    $0x10,%esp
80100b60:	83 f8 20             	cmp    $0x20,%eax
80100b63:	0f 84 5f ff ff ff    	je     80100ac8 <exec+0xb8>
80100b69:	83 ec 0c             	sub    $0xc,%esp
80100b6c:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b72:	e8 e9 64 00 00       	call   80107060 <freevm>
80100b77:	83 c4 10             	add    $0x10,%esp
80100b7a:	e9 e7 fe ff ff       	jmp    80100a66 <exec+0x56>
80100b7f:	81 c7 ff 0f 00 00    	add    $0xfff,%edi
80100b85:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
80100b8b:	8d b7 00 20 00 00    	lea    0x2000(%edi),%esi
80100b91:	83 ec 0c             	sub    $0xc,%esp
80100b94:	53                   	push   %ebx
80100b95:	e8 86 0d 00 00       	call   80101920 <iunlockput>
80100b9a:	e8 91 21 00 00       	call   80102d30 <end_op>
80100b9f:	83 c4 0c             	add    $0xc,%esp
80100ba2:	56                   	push   %esi
80100ba3:	57                   	push   %edi
80100ba4:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100baa:	e8 51 63 00 00       	call   80106f00 <allocuvm>
80100baf:	83 c4 10             	add    $0x10,%esp
80100bb2:	85 c0                	test   %eax,%eax
80100bb4:	89 c6                	mov    %eax,%esi
80100bb6:	75 3a                	jne    80100bf2 <exec+0x1e2>
80100bb8:	83 ec 0c             	sub    $0xc,%esp
80100bbb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bc1:	e8 9a 64 00 00       	call   80107060 <freevm>
80100bc6:	83 c4 10             	add    $0x10,%esp
80100bc9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bce:	e9 a9 fe ff ff       	jmp    80100a7c <exec+0x6c>
80100bd3:	e8 58 21 00 00       	call   80102d30 <end_op>
80100bd8:	83 ec 0c             	sub    $0xc,%esp
80100bdb:	68 01 74 10 80       	push   $0x80107401
80100be0:	e8 7b fa ff ff       	call   80100660 <cprintf>
80100be5:	83 c4 10             	add    $0x10,%esp
80100be8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bed:	e9 8a fe ff ff       	jmp    80100a7c <exec+0x6c>
80100bf2:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bf8:	83 ec 08             	sub    $0x8,%esp
80100bfb:	31 ff                	xor    %edi,%edi
80100bfd:	89 f3                	mov    %esi,%ebx
80100bff:	50                   	push   %eax
80100c00:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100c06:	e8 75 65 00 00       	call   80107180 <clearpteu>
80100c0b:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c0e:	83 c4 10             	add    $0x10,%esp
80100c11:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c17:	8b 00                	mov    (%eax),%eax
80100c19:	85 c0                	test   %eax,%eax
80100c1b:	74 70                	je     80100c8d <exec+0x27d>
80100c1d:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c23:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c29:	eb 0a                	jmp    80100c35 <exec+0x225>
80100c2b:	90                   	nop
80100c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100c30:	83 ff 20             	cmp    $0x20,%edi
80100c33:	74 83                	je     80100bb8 <exec+0x1a8>
80100c35:	83 ec 0c             	sub    $0xc,%esp
80100c38:	50                   	push   %eax
80100c39:	e8 72 3d 00 00       	call   801049b0 <strlen>
80100c3e:	f7 d0                	not    %eax
80100c40:	01 c3                	add    %eax,%ebx
80100c42:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c45:	5a                   	pop    %edx
80100c46:	83 e3 fc             	and    $0xfffffffc,%ebx
80100c49:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c4c:	e8 5f 3d 00 00       	call   801049b0 <strlen>
80100c51:	83 c0 01             	add    $0x1,%eax
80100c54:	50                   	push   %eax
80100c55:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c58:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c5b:	53                   	push   %ebx
80100c5c:	56                   	push   %esi
80100c5d:	e8 7e 66 00 00       	call   801072e0 <copyout>
80100c62:	83 c4 20             	add    $0x20,%esp
80100c65:	85 c0                	test   %eax,%eax
80100c67:	0f 88 4b ff ff ff    	js     80100bb8 <exec+0x1a8>
80100c6d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c70:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100c77:	83 c7 01             	add    $0x1,%edi
80100c7a:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c80:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c83:	85 c0                	test   %eax,%eax
80100c85:	75 a9                	jne    80100c30 <exec+0x220>
80100c87:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100c8d:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c94:	89 d9                	mov    %ebx,%ecx
80100c96:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c9d:	00 00 00 00 
80100ca1:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100ca8:	ff ff ff 
80100cab:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100cb1:	29 c1                	sub    %eax,%ecx
80100cb3:	83 c0 0c             	add    $0xc,%eax
80100cb6:	29 c3                	sub    %eax,%ebx
80100cb8:	50                   	push   %eax
80100cb9:	52                   	push   %edx
80100cba:	53                   	push   %ebx
80100cbb:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100cc1:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100cc7:	e8 14 66 00 00       	call   801072e0 <copyout>
80100ccc:	83 c4 10             	add    $0x10,%esp
80100ccf:	85 c0                	test   %eax,%eax
80100cd1:	0f 88 e1 fe ff ff    	js     80100bb8 <exec+0x1a8>
80100cd7:	8b 45 08             	mov    0x8(%ebp),%eax
80100cda:	0f b6 00             	movzbl (%eax),%eax
80100cdd:	84 c0                	test   %al,%al
80100cdf:	74 17                	je     80100cf8 <exec+0x2e8>
80100ce1:	8b 55 08             	mov    0x8(%ebp),%edx
80100ce4:	89 d1                	mov    %edx,%ecx
80100ce6:	83 c1 01             	add    $0x1,%ecx
80100ce9:	3c 2f                	cmp    $0x2f,%al
80100ceb:	0f b6 01             	movzbl (%ecx),%eax
80100cee:	0f 44 d1             	cmove  %ecx,%edx
80100cf1:	84 c0                	test   %al,%al
80100cf3:	75 f1                	jne    80100ce6 <exec+0x2d6>
80100cf5:	89 55 08             	mov    %edx,0x8(%ebp)
80100cf8:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cfe:	50                   	push   %eax
80100cff:	6a 10                	push   $0x10
80100d01:	ff 75 08             	pushl  0x8(%ebp)
80100d04:	89 f8                	mov    %edi,%eax
80100d06:	83 c0 6c             	add    $0x6c,%eax
80100d09:	50                   	push   %eax
80100d0a:	e8 61 3c 00 00       	call   80104970 <safestrcpy>
80100d0f:	8b 95 f0 fe ff ff    	mov    -0x110(%ebp),%edx
80100d15:	89 f9                	mov    %edi,%ecx
80100d17:	8b 7f 04             	mov    0x4(%edi),%edi
80100d1a:	8b 41 18             	mov    0x18(%ecx),%eax
80100d1d:	89 31                	mov    %esi,(%ecx)
80100d1f:	89 51 04             	mov    %edx,0x4(%ecx)
80100d22:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d28:	89 50 38             	mov    %edx,0x38(%eax)
80100d2b:	8b 41 18             	mov    0x18(%ecx),%eax
80100d2e:	89 58 44             	mov    %ebx,0x44(%eax)
80100d31:	89 0c 24             	mov    %ecx,(%esp)
80100d34:	e8 77 5f 00 00       	call   80106cb0 <switchuvm>
80100d39:	89 3c 24             	mov    %edi,(%esp)
80100d3c:	e8 1f 63 00 00       	call   80107060 <freevm>
80100d41:	83 c4 10             	add    $0x10,%esp
80100d44:	31 c0                	xor    %eax,%eax
80100d46:	e9 31 fd ff ff       	jmp    80100a7c <exec+0x6c>
80100d4b:	be 00 20 00 00       	mov    $0x2000,%esi
80100d50:	e9 3c fe ff ff       	jmp    80100b91 <exec+0x181>
80100d55:	66 90                	xchg   %ax,%ax
80100d57:	66 90                	xchg   %ax,%ax
80100d59:	66 90                	xchg   %ax,%ax
80100d5b:	66 90                	xchg   %ax,%ax
80100d5d:	66 90                	xchg   %ax,%ax
80100d5f:	90                   	nop

80100d60 <fileinit>:
80100d60:	55                   	push   %ebp
80100d61:	89 e5                	mov    %esp,%ebp
80100d63:	83 ec 10             	sub    $0x10,%esp
80100d66:	68 0d 74 10 80       	push   $0x8010740d
80100d6b:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d70:	e8 cb 37 00 00       	call   80104540 <initlock>
80100d75:	83 c4 10             	add    $0x10,%esp
80100d78:	c9                   	leave  
80100d79:	c3                   	ret    
80100d7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100d80 <filealloc>:
80100d80:	55                   	push   %ebp
80100d81:	89 e5                	mov    %esp,%ebp
80100d83:	53                   	push   %ebx
80100d84:	bb f4 ff 10 80       	mov    $0x8010fff4,%ebx
80100d89:	83 ec 10             	sub    $0x10,%esp
80100d8c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100d91:	e8 ea 38 00 00       	call   80104680 <acquire>
80100d96:	83 c4 10             	add    $0x10,%esp
80100d99:	eb 10                	jmp    80100dab <filealloc+0x2b>
80100d9b:	90                   	nop
80100d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100da0:	83 c3 18             	add    $0x18,%ebx
80100da3:	81 fb 54 09 11 80    	cmp    $0x80110954,%ebx
80100da9:	73 25                	jae    80100dd0 <filealloc+0x50>
80100dab:	8b 43 04             	mov    0x4(%ebx),%eax
80100dae:	85 c0                	test   %eax,%eax
80100db0:	75 ee                	jne    80100da0 <filealloc+0x20>
80100db2:	83 ec 0c             	sub    $0xc,%esp
80100db5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100dbc:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dc1:	e8 7a 39 00 00       	call   80104740 <release>
80100dc6:	89 d8                	mov    %ebx,%eax
80100dc8:	83 c4 10             	add    $0x10,%esp
80100dcb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dce:	c9                   	leave  
80100dcf:	c3                   	ret    
80100dd0:	83 ec 0c             	sub    $0xc,%esp
80100dd3:	31 db                	xor    %ebx,%ebx
80100dd5:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dda:	e8 61 39 00 00       	call   80104740 <release>
80100ddf:	89 d8                	mov    %ebx,%eax
80100de1:	83 c4 10             	add    $0x10,%esp
80100de4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100de7:	c9                   	leave  
80100de8:	c3                   	ret    
80100de9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80100df0 <filedup>:
80100df0:	55                   	push   %ebp
80100df1:	89 e5                	mov    %esp,%ebp
80100df3:	53                   	push   %ebx
80100df4:	83 ec 10             	sub    $0x10,%esp
80100df7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100dfa:	68 c0 ff 10 80       	push   $0x8010ffc0
80100dff:	e8 7c 38 00 00       	call   80104680 <acquire>
80100e04:	8b 43 04             	mov    0x4(%ebx),%eax
80100e07:	83 c4 10             	add    $0x10,%esp
80100e0a:	85 c0                	test   %eax,%eax
80100e0c:	7e 1a                	jle    80100e28 <filedup+0x38>
80100e0e:	83 c0 01             	add    $0x1,%eax
80100e11:	83 ec 0c             	sub    $0xc,%esp
80100e14:	89 43 04             	mov    %eax,0x4(%ebx)
80100e17:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e1c:	e8 1f 39 00 00       	call   80104740 <release>
80100e21:	89 d8                	mov    %ebx,%eax
80100e23:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e26:	c9                   	leave  
80100e27:	c3                   	ret    
80100e28:	83 ec 0c             	sub    $0xc,%esp
80100e2b:	68 14 74 10 80       	push   $0x80107414
80100e30:	e8 5b f5 ff ff       	call   80100390 <panic>
80100e35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e40 <fileclose>:
80100e40:	55                   	push   %ebp
80100e41:	89 e5                	mov    %esp,%ebp
80100e43:	57                   	push   %edi
80100e44:	56                   	push   %esi
80100e45:	53                   	push   %ebx
80100e46:	83 ec 28             	sub    $0x28,%esp
80100e49:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e4c:	68 c0 ff 10 80       	push   $0x8010ffc0
80100e51:	e8 2a 38 00 00       	call   80104680 <acquire>
80100e56:	8b 43 04             	mov    0x4(%ebx),%eax
80100e59:	83 c4 10             	add    $0x10,%esp
80100e5c:	85 c0                	test   %eax,%eax
80100e5e:	0f 8e 9b 00 00 00    	jle    80100eff <fileclose+0xbf>
80100e64:	83 e8 01             	sub    $0x1,%eax
80100e67:	85 c0                	test   %eax,%eax
80100e69:	89 43 04             	mov    %eax,0x4(%ebx)
80100e6c:	74 1a                	je     80100e88 <fileclose+0x48>
80100e6e:	c7 45 08 c0 ff 10 80 	movl   $0x8010ffc0,0x8(%ebp)
80100e75:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100e78:	5b                   	pop    %ebx
80100e79:	5e                   	pop    %esi
80100e7a:	5f                   	pop    %edi
80100e7b:	5d                   	pop    %ebp
80100e7c:	e9 bf 38 00 00       	jmp    80104740 <release>
80100e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100e88:	0f b6 43 09          	movzbl 0x9(%ebx),%eax
80100e8c:	8b 3b                	mov    (%ebx),%edi
80100e8e:	83 ec 0c             	sub    $0xc,%esp
80100e91:	8b 73 0c             	mov    0xc(%ebx),%esi
80100e94:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100e9a:	88 45 e7             	mov    %al,-0x19(%ebp)
80100e9d:	8b 43 10             	mov    0x10(%ebx),%eax
80100ea0:	68 c0 ff 10 80       	push   $0x8010ffc0
80100ea5:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100ea8:	e8 93 38 00 00       	call   80104740 <release>
80100ead:	83 c4 10             	add    $0x10,%esp
80100eb0:	83 ff 01             	cmp    $0x1,%edi
80100eb3:	74 13                	je     80100ec8 <fileclose+0x88>
80100eb5:	83 ff 02             	cmp    $0x2,%edi
80100eb8:	74 26                	je     80100ee0 <fileclose+0xa0>
80100eba:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ebd:	5b                   	pop    %ebx
80100ebe:	5e                   	pop    %esi
80100ebf:	5f                   	pop    %edi
80100ec0:	5d                   	pop    %ebp
80100ec1:	c3                   	ret    
80100ec2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100ec8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100ecc:	83 ec 08             	sub    $0x8,%esp
80100ecf:	53                   	push   %ebx
80100ed0:	56                   	push   %esi
80100ed1:	e8 9a 25 00 00       	call   80103470 <pipeclose>
80100ed6:	83 c4 10             	add    $0x10,%esp
80100ed9:	eb df                	jmp    80100eba <fileclose+0x7a>
80100edb:	90                   	nop
80100edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100ee0:	e8 db 1d 00 00       	call   80102cc0 <begin_op>
80100ee5:	83 ec 0c             	sub    $0xc,%esp
80100ee8:	ff 75 e0             	pushl  -0x20(%ebp)
80100eeb:	e8 d0 08 00 00       	call   801017c0 <iput>
80100ef0:	83 c4 10             	add    $0x10,%esp
80100ef3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ef6:	5b                   	pop    %ebx
80100ef7:	5e                   	pop    %esi
80100ef8:	5f                   	pop    %edi
80100ef9:	5d                   	pop    %ebp
80100efa:	e9 31 1e 00 00       	jmp    80102d30 <end_op>
80100eff:	83 ec 0c             	sub    $0xc,%esp
80100f02:	68 1c 74 10 80       	push   $0x8010741c
80100f07:	e8 84 f4 ff ff       	call   80100390 <panic>
80100f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f10 <filestat>:
80100f10:	55                   	push   %ebp
80100f11:	89 e5                	mov    %esp,%ebp
80100f13:	53                   	push   %ebx
80100f14:	83 ec 04             	sub    $0x4,%esp
80100f17:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f1a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f1d:	75 31                	jne    80100f50 <filestat+0x40>
80100f1f:	83 ec 0c             	sub    $0xc,%esp
80100f22:	ff 73 10             	pushl  0x10(%ebx)
80100f25:	e8 66 07 00 00       	call   80101690 <ilock>
80100f2a:	58                   	pop    %eax
80100f2b:	5a                   	pop    %edx
80100f2c:	ff 75 0c             	pushl  0xc(%ebp)
80100f2f:	ff 73 10             	pushl  0x10(%ebx)
80100f32:	e8 09 0a 00 00       	call   80101940 <stati>
80100f37:	59                   	pop    %ecx
80100f38:	ff 73 10             	pushl  0x10(%ebx)
80100f3b:	e8 30 08 00 00       	call   80101770 <iunlock>
80100f40:	83 c4 10             	add    $0x10,%esp
80100f43:	31 c0                	xor    %eax,%eax
80100f45:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f48:	c9                   	leave  
80100f49:	c3                   	ret    
80100f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f55:	eb ee                	jmp    80100f45 <filestat+0x35>
80100f57:	89 f6                	mov    %esi,%esi
80100f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100f60 <fileread>:
80100f60:	55                   	push   %ebp
80100f61:	89 e5                	mov    %esp,%ebp
80100f63:	57                   	push   %edi
80100f64:	56                   	push   %esi
80100f65:	53                   	push   %ebx
80100f66:	83 ec 0c             	sub    $0xc,%esp
80100f69:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f6c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f6f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100f72:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100f76:	74 60                	je     80100fd8 <fileread+0x78>
80100f78:	8b 03                	mov    (%ebx),%eax
80100f7a:	83 f8 01             	cmp    $0x1,%eax
80100f7d:	74 41                	je     80100fc0 <fileread+0x60>
80100f7f:	83 f8 02             	cmp    $0x2,%eax
80100f82:	75 5b                	jne    80100fdf <fileread+0x7f>
80100f84:	83 ec 0c             	sub    $0xc,%esp
80100f87:	ff 73 10             	pushl  0x10(%ebx)
80100f8a:	e8 01 07 00 00       	call   80101690 <ilock>
80100f8f:	57                   	push   %edi
80100f90:	ff 73 14             	pushl  0x14(%ebx)
80100f93:	56                   	push   %esi
80100f94:	ff 73 10             	pushl  0x10(%ebx)
80100f97:	e8 d4 09 00 00       	call   80101970 <readi>
80100f9c:	83 c4 20             	add    $0x20,%esp
80100f9f:	85 c0                	test   %eax,%eax
80100fa1:	89 c6                	mov    %eax,%esi
80100fa3:	7e 03                	jle    80100fa8 <fileread+0x48>
80100fa5:	01 43 14             	add    %eax,0x14(%ebx)
80100fa8:	83 ec 0c             	sub    $0xc,%esp
80100fab:	ff 73 10             	pushl  0x10(%ebx)
80100fae:	e8 bd 07 00 00       	call   80101770 <iunlock>
80100fb3:	83 c4 10             	add    $0x10,%esp
80100fb6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fb9:	89 f0                	mov    %esi,%eax
80100fbb:	5b                   	pop    %ebx
80100fbc:	5e                   	pop    %esi
80100fbd:	5f                   	pop    %edi
80100fbe:	5d                   	pop    %ebp
80100fbf:	c3                   	ret    
80100fc0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100fc3:	89 45 08             	mov    %eax,0x8(%ebp)
80100fc6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100fc9:	5b                   	pop    %ebx
80100fca:	5e                   	pop    %esi
80100fcb:	5f                   	pop    %edi
80100fcc:	5d                   	pop    %ebp
80100fcd:	e9 4e 26 00 00       	jmp    80103620 <piperead>
80100fd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100fd8:	be ff ff ff ff       	mov    $0xffffffff,%esi
80100fdd:	eb d7                	jmp    80100fb6 <fileread+0x56>
80100fdf:	83 ec 0c             	sub    $0xc,%esp
80100fe2:	68 26 74 10 80       	push   $0x80107426
80100fe7:	e8 a4 f3 ff ff       	call   80100390 <panic>
80100fec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100ff0 <filewrite>:
80100ff0:	55                   	push   %ebp
80100ff1:	89 e5                	mov    %esp,%ebp
80100ff3:	57                   	push   %edi
80100ff4:	56                   	push   %esi
80100ff5:	53                   	push   %ebx
80100ff6:	83 ec 1c             	sub    $0x1c,%esp
80100ff9:	8b 75 08             	mov    0x8(%ebp),%esi
80100ffc:	8b 45 0c             	mov    0xc(%ebp),%eax
80100fff:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80101003:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101006:	8b 45 10             	mov    0x10(%ebp),%eax
80101009:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010100c:	0f 84 aa 00 00 00    	je     801010bc <filewrite+0xcc>
80101012:	8b 06                	mov    (%esi),%eax
80101014:	83 f8 01             	cmp    $0x1,%eax
80101017:	0f 84 c3 00 00 00    	je     801010e0 <filewrite+0xf0>
8010101d:	83 f8 02             	cmp    $0x2,%eax
80101020:	0f 85 d9 00 00 00    	jne    801010ff <filewrite+0x10f>
80101026:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101029:	31 ff                	xor    %edi,%edi
8010102b:	85 c0                	test   %eax,%eax
8010102d:	7f 34                	jg     80101063 <filewrite+0x73>
8010102f:	e9 9c 00 00 00       	jmp    801010d0 <filewrite+0xe0>
80101034:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101038:	01 46 14             	add    %eax,0x14(%esi)
8010103b:	83 ec 0c             	sub    $0xc,%esp
8010103e:	ff 76 10             	pushl  0x10(%esi)
80101041:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101044:	e8 27 07 00 00       	call   80101770 <iunlock>
80101049:	e8 e2 1c 00 00       	call   80102d30 <end_op>
8010104e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101051:	83 c4 10             	add    $0x10,%esp
80101054:	39 c3                	cmp    %eax,%ebx
80101056:	0f 85 96 00 00 00    	jne    801010f2 <filewrite+0x102>
8010105c:	01 df                	add    %ebx,%edi
8010105e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101061:	7e 6d                	jle    801010d0 <filewrite+0xe0>
80101063:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101066:	b8 00 06 00 00       	mov    $0x600,%eax
8010106b:	29 fb                	sub    %edi,%ebx
8010106d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
80101073:	0f 4f d8             	cmovg  %eax,%ebx
80101076:	e8 45 1c 00 00       	call   80102cc0 <begin_op>
8010107b:	83 ec 0c             	sub    $0xc,%esp
8010107e:	ff 76 10             	pushl  0x10(%esi)
80101081:	e8 0a 06 00 00       	call   80101690 <ilock>
80101086:	8b 45 dc             	mov    -0x24(%ebp),%eax
80101089:	53                   	push   %ebx
8010108a:	ff 76 14             	pushl  0x14(%esi)
8010108d:	01 f8                	add    %edi,%eax
8010108f:	50                   	push   %eax
80101090:	ff 76 10             	pushl  0x10(%esi)
80101093:	e8 d8 09 00 00       	call   80101a70 <writei>
80101098:	83 c4 20             	add    $0x20,%esp
8010109b:	85 c0                	test   %eax,%eax
8010109d:	7f 99                	jg     80101038 <filewrite+0x48>
8010109f:	83 ec 0c             	sub    $0xc,%esp
801010a2:	ff 76 10             	pushl  0x10(%esi)
801010a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010a8:	e8 c3 06 00 00       	call   80101770 <iunlock>
801010ad:	e8 7e 1c 00 00       	call   80102d30 <end_op>
801010b2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010b5:	83 c4 10             	add    $0x10,%esp
801010b8:	85 c0                	test   %eax,%eax
801010ba:	74 98                	je     80101054 <filewrite+0x64>
801010bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010bf:	bf ff ff ff ff       	mov    $0xffffffff,%edi
801010c4:	89 f8                	mov    %edi,%eax
801010c6:	5b                   	pop    %ebx
801010c7:	5e                   	pop    %esi
801010c8:	5f                   	pop    %edi
801010c9:	5d                   	pop    %ebp
801010ca:	c3                   	ret    
801010cb:	90                   	nop
801010cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801010d0:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
801010d3:	75 e7                	jne    801010bc <filewrite+0xcc>
801010d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010d8:	89 f8                	mov    %edi,%eax
801010da:	5b                   	pop    %ebx
801010db:	5e                   	pop    %esi
801010dc:	5f                   	pop    %edi
801010dd:	5d                   	pop    %ebp
801010de:	c3                   	ret    
801010df:	90                   	nop
801010e0:	8b 46 0c             	mov    0xc(%esi),%eax
801010e3:	89 45 08             	mov    %eax,0x8(%ebp)
801010e6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010e9:	5b                   	pop    %ebx
801010ea:	5e                   	pop    %esi
801010eb:	5f                   	pop    %edi
801010ec:	5d                   	pop    %ebp
801010ed:	e9 1e 24 00 00       	jmp    80103510 <pipewrite>
801010f2:	83 ec 0c             	sub    $0xc,%esp
801010f5:	68 2f 74 10 80       	push   $0x8010742f
801010fa:	e8 91 f2 ff ff       	call   80100390 <panic>
801010ff:	83 ec 0c             	sub    $0xc,%esp
80101102:	68 35 74 10 80       	push   $0x80107435
80101107:	e8 84 f2 ff ff       	call   80100390 <panic>
8010110c:	66 90                	xchg   %ax,%ax
8010110e:	66 90                	xchg   %ax,%ax

80101110 <balloc>:
80101110:	55                   	push   %ebp
80101111:	89 e5                	mov    %esp,%ebp
80101113:	57                   	push   %edi
80101114:	56                   	push   %esi
80101115:	53                   	push   %ebx
80101116:	83 ec 1c             	sub    $0x1c,%esp
80101119:	8b 0d c0 09 11 80    	mov    0x801109c0,%ecx
8010111f:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101122:	85 c9                	test   %ecx,%ecx
80101124:	0f 84 87 00 00 00    	je     801011b1 <balloc+0xa1>
8010112a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101131:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101134:	83 ec 08             	sub    $0x8,%esp
80101137:	89 f0                	mov    %esi,%eax
80101139:	c1 f8 0c             	sar    $0xc,%eax
8010113c:	03 05 d8 09 11 80    	add    0x801109d8,%eax
80101142:	50                   	push   %eax
80101143:	ff 75 d8             	pushl  -0x28(%ebp)
80101146:	e8 85 ef ff ff       	call   801000d0 <bread>
8010114b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010114e:	a1 c0 09 11 80       	mov    0x801109c0,%eax
80101153:	83 c4 10             	add    $0x10,%esp
80101156:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101159:	31 c0                	xor    %eax,%eax
8010115b:	eb 2f                	jmp    8010118c <balloc+0x7c>
8010115d:	8d 76 00             	lea    0x0(%esi),%esi
80101160:	89 c1                	mov    %eax,%ecx
80101162:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101165:	bb 01 00 00 00       	mov    $0x1,%ebx
8010116a:	83 e1 07             	and    $0x7,%ecx
8010116d:	d3 e3                	shl    %cl,%ebx
8010116f:	89 c1                	mov    %eax,%ecx
80101171:	c1 f9 03             	sar    $0x3,%ecx
80101174:	0f b6 7c 0a 5c       	movzbl 0x5c(%edx,%ecx,1),%edi
80101179:	85 df                	test   %ebx,%edi
8010117b:	89 fa                	mov    %edi,%edx
8010117d:	74 41                	je     801011c0 <balloc+0xb0>
8010117f:	83 c0 01             	add    $0x1,%eax
80101182:	83 c6 01             	add    $0x1,%esi
80101185:	3d 00 10 00 00       	cmp    $0x1000,%eax
8010118a:	74 05                	je     80101191 <balloc+0x81>
8010118c:	39 75 e0             	cmp    %esi,-0x20(%ebp)
8010118f:	77 cf                	ja     80101160 <balloc+0x50>
80101191:	83 ec 0c             	sub    $0xc,%esp
80101194:	ff 75 e4             	pushl  -0x1c(%ebp)
80101197:	e8 44 f0 ff ff       	call   801001e0 <brelse>
8010119c:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801011a3:	83 c4 10             	add    $0x10,%esp
801011a6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801011a9:	39 05 c0 09 11 80    	cmp    %eax,0x801109c0
801011af:	77 80                	ja     80101131 <balloc+0x21>
801011b1:	83 ec 0c             	sub    $0xc,%esp
801011b4:	68 3f 74 10 80       	push   $0x8010743f
801011b9:	e8 d2 f1 ff ff       	call   80100390 <panic>
801011be:	66 90                	xchg   %ax,%ax
801011c0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801011c3:	83 ec 0c             	sub    $0xc,%esp
801011c6:	09 da                	or     %ebx,%edx
801011c8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
801011cc:	57                   	push   %edi
801011cd:	e8 be 1c 00 00       	call   80102e90 <log_write>
801011d2:	89 3c 24             	mov    %edi,(%esp)
801011d5:	e8 06 f0 ff ff       	call   801001e0 <brelse>
801011da:	58                   	pop    %eax
801011db:	5a                   	pop    %edx
801011dc:	56                   	push   %esi
801011dd:	ff 75 d8             	pushl  -0x28(%ebp)
801011e0:	e8 eb ee ff ff       	call   801000d0 <bread>
801011e5:	89 c3                	mov    %eax,%ebx
801011e7:	8d 40 5c             	lea    0x5c(%eax),%eax
801011ea:	83 c4 0c             	add    $0xc,%esp
801011ed:	68 00 02 00 00       	push   $0x200
801011f2:	6a 00                	push   $0x0
801011f4:	50                   	push   %eax
801011f5:	e8 96 35 00 00       	call   80104790 <memset>
801011fa:	89 1c 24             	mov    %ebx,(%esp)
801011fd:	e8 8e 1c 00 00       	call   80102e90 <log_write>
80101202:	89 1c 24             	mov    %ebx,(%esp)
80101205:	e8 d6 ef ff ff       	call   801001e0 <brelse>
8010120a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010120d:	89 f0                	mov    %esi,%eax
8010120f:	5b                   	pop    %ebx
80101210:	5e                   	pop    %esi
80101211:	5f                   	pop    %edi
80101212:	5d                   	pop    %ebp
80101213:	c3                   	ret    
80101214:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010121a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101220 <iget>:
80101220:	55                   	push   %ebp
80101221:	89 e5                	mov    %esp,%ebp
80101223:	57                   	push   %edi
80101224:	56                   	push   %esi
80101225:	53                   	push   %ebx
80101226:	89 c7                	mov    %eax,%edi
80101228:	31 f6                	xor    %esi,%esi
8010122a:	bb 14 0a 11 80       	mov    $0x80110a14,%ebx
8010122f:	83 ec 28             	sub    $0x28,%esp
80101232:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101235:	68 e0 09 11 80       	push   $0x801109e0
8010123a:	e8 41 34 00 00       	call   80104680 <acquire>
8010123f:	83 c4 10             	add    $0x10,%esp
80101242:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101245:	eb 17                	jmp    8010125e <iget+0x3e>
80101247:	89 f6                	mov    %esi,%esi
80101249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101250:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101256:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
8010125c:	73 22                	jae    80101280 <iget+0x60>
8010125e:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101261:	85 c9                	test   %ecx,%ecx
80101263:	7e 04                	jle    80101269 <iget+0x49>
80101265:	39 3b                	cmp    %edi,(%ebx)
80101267:	74 4f                	je     801012b8 <iget+0x98>
80101269:	85 f6                	test   %esi,%esi
8010126b:	75 e3                	jne    80101250 <iget+0x30>
8010126d:	85 c9                	test   %ecx,%ecx
8010126f:	0f 44 f3             	cmove  %ebx,%esi
80101272:	81 c3 90 00 00 00    	add    $0x90,%ebx
80101278:	81 fb 34 26 11 80    	cmp    $0x80112634,%ebx
8010127e:	72 de                	jb     8010125e <iget+0x3e>
80101280:	85 f6                	test   %esi,%esi
80101282:	74 5b                	je     801012df <iget+0xbf>
80101284:	83 ec 0c             	sub    $0xc,%esp
80101287:	89 3e                	mov    %edi,(%esi)
80101289:	89 56 04             	mov    %edx,0x4(%esi)
8010128c:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
80101293:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
8010129a:	68 e0 09 11 80       	push   $0x801109e0
8010129f:	e8 9c 34 00 00       	call   80104740 <release>
801012a4:	83 c4 10             	add    $0x10,%esp
801012a7:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012aa:	89 f0                	mov    %esi,%eax
801012ac:	5b                   	pop    %ebx
801012ad:	5e                   	pop    %esi
801012ae:	5f                   	pop    %edi
801012af:	5d                   	pop    %ebp
801012b0:	c3                   	ret    
801012b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801012b8:	39 53 04             	cmp    %edx,0x4(%ebx)
801012bb:	75 ac                	jne    80101269 <iget+0x49>
801012bd:	83 ec 0c             	sub    $0xc,%esp
801012c0:	83 c1 01             	add    $0x1,%ecx
801012c3:	89 de                	mov    %ebx,%esi
801012c5:	68 e0 09 11 80       	push   $0x801109e0
801012ca:	89 4b 08             	mov    %ecx,0x8(%ebx)
801012cd:	e8 6e 34 00 00       	call   80104740 <release>
801012d2:	83 c4 10             	add    $0x10,%esp
801012d5:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012d8:	89 f0                	mov    %esi,%eax
801012da:	5b                   	pop    %ebx
801012db:	5e                   	pop    %esi
801012dc:	5f                   	pop    %edi
801012dd:	5d                   	pop    %ebp
801012de:	c3                   	ret    
801012df:	83 ec 0c             	sub    $0xc,%esp
801012e2:	68 55 74 10 80       	push   $0x80107455
801012e7:	e8 a4 f0 ff ff       	call   80100390 <panic>
801012ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801012f0 <bmap>:
801012f0:	55                   	push   %ebp
801012f1:	89 e5                	mov    %esp,%ebp
801012f3:	57                   	push   %edi
801012f4:	56                   	push   %esi
801012f5:	53                   	push   %ebx
801012f6:	89 c6                	mov    %eax,%esi
801012f8:	83 ec 1c             	sub    $0x1c,%esp
801012fb:	83 fa 0b             	cmp    $0xb,%edx
801012fe:	77 18                	ja     80101318 <bmap+0x28>
80101300:	8d 3c 90             	lea    (%eax,%edx,4),%edi
80101303:	8b 5f 5c             	mov    0x5c(%edi),%ebx
80101306:	85 db                	test   %ebx,%ebx
80101308:	74 76                	je     80101380 <bmap+0x90>
8010130a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010130d:	89 d8                	mov    %ebx,%eax
8010130f:	5b                   	pop    %ebx
80101310:	5e                   	pop    %esi
80101311:	5f                   	pop    %edi
80101312:	5d                   	pop    %ebp
80101313:	c3                   	ret    
80101314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101318:	8d 5a f4             	lea    -0xc(%edx),%ebx
8010131b:	83 fb 7f             	cmp    $0x7f,%ebx
8010131e:	0f 87 90 00 00 00    	ja     801013b4 <bmap+0xc4>
80101324:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
8010132a:	8b 00                	mov    (%eax),%eax
8010132c:	85 d2                	test   %edx,%edx
8010132e:	74 70                	je     801013a0 <bmap+0xb0>
80101330:	83 ec 08             	sub    $0x8,%esp
80101333:	52                   	push   %edx
80101334:	50                   	push   %eax
80101335:	e8 96 ed ff ff       	call   801000d0 <bread>
8010133a:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010133e:	83 c4 10             	add    $0x10,%esp
80101341:	89 c7                	mov    %eax,%edi
80101343:	8b 1a                	mov    (%edx),%ebx
80101345:	85 db                	test   %ebx,%ebx
80101347:	75 1d                	jne    80101366 <bmap+0x76>
80101349:	8b 06                	mov    (%esi),%eax
8010134b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010134e:	e8 bd fd ff ff       	call   80101110 <balloc>
80101353:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101356:	83 ec 0c             	sub    $0xc,%esp
80101359:	89 c3                	mov    %eax,%ebx
8010135b:	89 02                	mov    %eax,(%edx)
8010135d:	57                   	push   %edi
8010135e:	e8 2d 1b 00 00       	call   80102e90 <log_write>
80101363:	83 c4 10             	add    $0x10,%esp
80101366:	83 ec 0c             	sub    $0xc,%esp
80101369:	57                   	push   %edi
8010136a:	e8 71 ee ff ff       	call   801001e0 <brelse>
8010136f:	83 c4 10             	add    $0x10,%esp
80101372:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101375:	89 d8                	mov    %ebx,%eax
80101377:	5b                   	pop    %ebx
80101378:	5e                   	pop    %esi
80101379:	5f                   	pop    %edi
8010137a:	5d                   	pop    %ebp
8010137b:	c3                   	ret    
8010137c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101380:	8b 00                	mov    (%eax),%eax
80101382:	e8 89 fd ff ff       	call   80101110 <balloc>
80101387:	89 47 5c             	mov    %eax,0x5c(%edi)
8010138a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010138d:	89 c3                	mov    %eax,%ebx
8010138f:	89 d8                	mov    %ebx,%eax
80101391:	5b                   	pop    %ebx
80101392:	5e                   	pop    %esi
80101393:	5f                   	pop    %edi
80101394:	5d                   	pop    %ebp
80101395:	c3                   	ret    
80101396:	8d 76 00             	lea    0x0(%esi),%esi
80101399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801013a0:	e8 6b fd ff ff       	call   80101110 <balloc>
801013a5:	89 c2                	mov    %eax,%edx
801013a7:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801013ad:	8b 06                	mov    (%esi),%eax
801013af:	e9 7c ff ff ff       	jmp    80101330 <bmap+0x40>
801013b4:	83 ec 0c             	sub    $0xc,%esp
801013b7:	68 65 74 10 80       	push   $0x80107465
801013bc:	e8 cf ef ff ff       	call   80100390 <panic>
801013c1:	eb 0d                	jmp    801013d0 <readsb>
801013c3:	90                   	nop
801013c4:	90                   	nop
801013c5:	90                   	nop
801013c6:	90                   	nop
801013c7:	90                   	nop
801013c8:	90                   	nop
801013c9:	90                   	nop
801013ca:	90                   	nop
801013cb:	90                   	nop
801013cc:	90                   	nop
801013cd:	90                   	nop
801013ce:	90                   	nop
801013cf:	90                   	nop

801013d0 <readsb>:
801013d0:	55                   	push   %ebp
801013d1:	89 e5                	mov    %esp,%ebp
801013d3:	56                   	push   %esi
801013d4:	53                   	push   %ebx
801013d5:	8b 75 0c             	mov    0xc(%ebp),%esi
801013d8:	83 ec 08             	sub    $0x8,%esp
801013db:	6a 01                	push   $0x1
801013dd:	ff 75 08             	pushl  0x8(%ebp)
801013e0:	e8 eb ec ff ff       	call   801000d0 <bread>
801013e5:	89 c3                	mov    %eax,%ebx
801013e7:	8d 40 5c             	lea    0x5c(%eax),%eax
801013ea:	83 c4 0c             	add    $0xc,%esp
801013ed:	6a 1c                	push   $0x1c
801013ef:	50                   	push   %eax
801013f0:	56                   	push   %esi
801013f1:	e8 4a 34 00 00       	call   80104840 <memmove>
801013f6:	89 5d 08             	mov    %ebx,0x8(%ebp)
801013f9:	83 c4 10             	add    $0x10,%esp
801013fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801013ff:	5b                   	pop    %ebx
80101400:	5e                   	pop    %esi
80101401:	5d                   	pop    %ebp
80101402:	e9 d9 ed ff ff       	jmp    801001e0 <brelse>
80101407:	89 f6                	mov    %esi,%esi
80101409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101410 <bfree>:
80101410:	55                   	push   %ebp
80101411:	89 e5                	mov    %esp,%ebp
80101413:	56                   	push   %esi
80101414:	53                   	push   %ebx
80101415:	89 d3                	mov    %edx,%ebx
80101417:	89 c6                	mov    %eax,%esi
80101419:	83 ec 08             	sub    $0x8,%esp
8010141c:	68 c0 09 11 80       	push   $0x801109c0
80101421:	50                   	push   %eax
80101422:	e8 a9 ff ff ff       	call   801013d0 <readsb>
80101427:	58                   	pop    %eax
80101428:	5a                   	pop    %edx
80101429:	89 da                	mov    %ebx,%edx
8010142b:	c1 ea 0c             	shr    $0xc,%edx
8010142e:	03 15 d8 09 11 80    	add    0x801109d8,%edx
80101434:	52                   	push   %edx
80101435:	56                   	push   %esi
80101436:	e8 95 ec ff ff       	call   801000d0 <bread>
8010143b:	89 d9                	mov    %ebx,%ecx
8010143d:	c1 fb 03             	sar    $0x3,%ebx
80101440:	ba 01 00 00 00       	mov    $0x1,%edx
80101445:	83 e1 07             	and    $0x7,%ecx
80101448:	81 e3 ff 01 00 00    	and    $0x1ff,%ebx
8010144e:	83 c4 10             	add    $0x10,%esp
80101451:	d3 e2                	shl    %cl,%edx
80101453:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101458:	85 d1                	test   %edx,%ecx
8010145a:	74 25                	je     80101481 <bfree+0x71>
8010145c:	f7 d2                	not    %edx
8010145e:	89 c6                	mov    %eax,%esi
80101460:	83 ec 0c             	sub    $0xc,%esp
80101463:	21 ca                	and    %ecx,%edx
80101465:	88 54 1e 5c          	mov    %dl,0x5c(%esi,%ebx,1)
80101469:	56                   	push   %esi
8010146a:	e8 21 1a 00 00       	call   80102e90 <log_write>
8010146f:	89 34 24             	mov    %esi,(%esp)
80101472:	e8 69 ed ff ff       	call   801001e0 <brelse>
80101477:	83 c4 10             	add    $0x10,%esp
8010147a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010147d:	5b                   	pop    %ebx
8010147e:	5e                   	pop    %esi
8010147f:	5d                   	pop    %ebp
80101480:	c3                   	ret    
80101481:	83 ec 0c             	sub    $0xc,%esp
80101484:	68 78 74 10 80       	push   $0x80107478
80101489:	e8 02 ef ff ff       	call   80100390 <panic>
8010148e:	66 90                	xchg   %ax,%ax

80101490 <iinit>:
80101490:	55                   	push   %ebp
80101491:	89 e5                	mov    %esp,%ebp
80101493:	53                   	push   %ebx
80101494:	bb 20 0a 11 80       	mov    $0x80110a20,%ebx
80101499:	83 ec 0c             	sub    $0xc,%esp
8010149c:	68 8b 74 10 80       	push   $0x8010748b
801014a1:	68 e0 09 11 80       	push   $0x801109e0
801014a6:	e8 95 30 00 00       	call   80104540 <initlock>
801014ab:	83 c4 10             	add    $0x10,%esp
801014ae:	66 90                	xchg   %ax,%ax
801014b0:	83 ec 08             	sub    $0x8,%esp
801014b3:	68 92 74 10 80       	push   $0x80107492
801014b8:	53                   	push   %ebx
801014b9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014bf:	e8 4c 2f 00 00       	call   80104410 <initsleeplock>
801014c4:	83 c4 10             	add    $0x10,%esp
801014c7:	81 fb 40 26 11 80    	cmp    $0x80112640,%ebx
801014cd:	75 e1                	jne    801014b0 <iinit+0x20>
801014cf:	83 ec 08             	sub    $0x8,%esp
801014d2:	68 c0 09 11 80       	push   $0x801109c0
801014d7:	ff 75 08             	pushl  0x8(%ebp)
801014da:	e8 f1 fe ff ff       	call   801013d0 <readsb>
801014df:	ff 35 d8 09 11 80    	pushl  0x801109d8
801014e5:	ff 35 d4 09 11 80    	pushl  0x801109d4
801014eb:	ff 35 d0 09 11 80    	pushl  0x801109d0
801014f1:	ff 35 cc 09 11 80    	pushl  0x801109cc
801014f7:	ff 35 c8 09 11 80    	pushl  0x801109c8
801014fd:	ff 35 c4 09 11 80    	pushl  0x801109c4
80101503:	ff 35 c0 09 11 80    	pushl  0x801109c0
80101509:	68 14 75 10 80       	push   $0x80107514
8010150e:	e8 4d f1 ff ff       	call   80100660 <cprintf>
80101513:	83 c4 30             	add    $0x30,%esp
80101516:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101519:	c9                   	leave  
8010151a:	c3                   	ret    
8010151b:	90                   	nop
8010151c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101520 <ialloc>:
80101520:	55                   	push   %ebp
80101521:	89 e5                	mov    %esp,%ebp
80101523:	57                   	push   %edi
80101524:	56                   	push   %esi
80101525:	53                   	push   %ebx
80101526:	83 ec 1c             	sub    $0x1c,%esp
80101529:	83 3d c8 09 11 80 01 	cmpl   $0x1,0x801109c8
80101530:	8b 45 0c             	mov    0xc(%ebp),%eax
80101533:	8b 75 08             	mov    0x8(%ebp),%esi
80101536:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101539:	0f 86 91 00 00 00    	jbe    801015d0 <ialloc+0xb0>
8010153f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101544:	eb 21                	jmp    80101567 <ialloc+0x47>
80101546:	8d 76 00             	lea    0x0(%esi),%esi
80101549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101550:	83 ec 0c             	sub    $0xc,%esp
80101553:	83 c3 01             	add    $0x1,%ebx
80101556:	57                   	push   %edi
80101557:	e8 84 ec ff ff       	call   801001e0 <brelse>
8010155c:	83 c4 10             	add    $0x10,%esp
8010155f:	39 1d c8 09 11 80    	cmp    %ebx,0x801109c8
80101565:	76 69                	jbe    801015d0 <ialloc+0xb0>
80101567:	89 d8                	mov    %ebx,%eax
80101569:	83 ec 08             	sub    $0x8,%esp
8010156c:	c1 e8 03             	shr    $0x3,%eax
8010156f:	03 05 d4 09 11 80    	add    0x801109d4,%eax
80101575:	50                   	push   %eax
80101576:	56                   	push   %esi
80101577:	e8 54 eb ff ff       	call   801000d0 <bread>
8010157c:	89 c7                	mov    %eax,%edi
8010157e:	89 d8                	mov    %ebx,%eax
80101580:	83 c4 10             	add    $0x10,%esp
80101583:	83 e0 07             	and    $0x7,%eax
80101586:	c1 e0 06             	shl    $0x6,%eax
80101589:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
8010158d:	66 83 39 00          	cmpw   $0x0,(%ecx)
80101591:	75 bd                	jne    80101550 <ialloc+0x30>
80101593:	83 ec 04             	sub    $0x4,%esp
80101596:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80101599:	6a 40                	push   $0x40
8010159b:	6a 00                	push   $0x0
8010159d:	51                   	push   %ecx
8010159e:	e8 ed 31 00 00       	call   80104790 <memset>
801015a3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801015a7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801015aa:	66 89 01             	mov    %ax,(%ecx)
801015ad:	89 3c 24             	mov    %edi,(%esp)
801015b0:	e8 db 18 00 00       	call   80102e90 <log_write>
801015b5:	89 3c 24             	mov    %edi,(%esp)
801015b8:	e8 23 ec ff ff       	call   801001e0 <brelse>
801015bd:	83 c4 10             	add    $0x10,%esp
801015c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801015c3:	89 da                	mov    %ebx,%edx
801015c5:	89 f0                	mov    %esi,%eax
801015c7:	5b                   	pop    %ebx
801015c8:	5e                   	pop    %esi
801015c9:	5f                   	pop    %edi
801015ca:	5d                   	pop    %ebp
801015cb:	e9 50 fc ff ff       	jmp    80101220 <iget>
801015d0:	83 ec 0c             	sub    $0xc,%esp
801015d3:	68 98 74 10 80       	push   $0x80107498
801015d8:	e8 b3 ed ff ff       	call   80100390 <panic>
801015dd:	8d 76 00             	lea    0x0(%esi),%esi

801015e0 <iupdate>:
801015e0:	55                   	push   %ebp
801015e1:	89 e5                	mov    %esp,%ebp
801015e3:	56                   	push   %esi
801015e4:	53                   	push   %ebx
801015e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801015e8:	83 ec 08             	sub    $0x8,%esp
801015eb:	8b 43 04             	mov    0x4(%ebx),%eax
801015ee:	83 c3 5c             	add    $0x5c,%ebx
801015f1:	c1 e8 03             	shr    $0x3,%eax
801015f4:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801015fa:	50                   	push   %eax
801015fb:	ff 73 a4             	pushl  -0x5c(%ebx)
801015fe:	e8 cd ea ff ff       	call   801000d0 <bread>
80101603:	89 c6                	mov    %eax,%esi
80101605:	8b 43 a8             	mov    -0x58(%ebx),%eax
80101608:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
8010160c:	83 c4 0c             	add    $0xc,%esp
8010160f:	83 e0 07             	and    $0x7,%eax
80101612:	c1 e0 06             	shl    $0x6,%eax
80101615:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101619:	66 89 10             	mov    %dx,(%eax)
8010161c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
80101620:	83 c0 0c             	add    $0xc,%eax
80101623:	66 89 50 f6          	mov    %dx,-0xa(%eax)
80101627:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010162b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
8010162f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101633:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101637:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010163a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010163d:	6a 34                	push   $0x34
8010163f:	53                   	push   %ebx
80101640:	50                   	push   %eax
80101641:	e8 fa 31 00 00       	call   80104840 <memmove>
80101646:	89 34 24             	mov    %esi,(%esp)
80101649:	e8 42 18 00 00       	call   80102e90 <log_write>
8010164e:	89 75 08             	mov    %esi,0x8(%ebp)
80101651:	83 c4 10             	add    $0x10,%esp
80101654:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101657:	5b                   	pop    %ebx
80101658:	5e                   	pop    %esi
80101659:	5d                   	pop    %ebp
8010165a:	e9 81 eb ff ff       	jmp    801001e0 <brelse>
8010165f:	90                   	nop

80101660 <idup>:
80101660:	55                   	push   %ebp
80101661:	89 e5                	mov    %esp,%ebp
80101663:	53                   	push   %ebx
80101664:	83 ec 10             	sub    $0x10,%esp
80101667:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010166a:	68 e0 09 11 80       	push   $0x801109e0
8010166f:	e8 0c 30 00 00       	call   80104680 <acquire>
80101674:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101678:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010167f:	e8 bc 30 00 00       	call   80104740 <release>
80101684:	89 d8                	mov    %ebx,%eax
80101686:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101689:	c9                   	leave  
8010168a:	c3                   	ret    
8010168b:	90                   	nop
8010168c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101690 <ilock>:
80101690:	55                   	push   %ebp
80101691:	89 e5                	mov    %esp,%ebp
80101693:	56                   	push   %esi
80101694:	53                   	push   %ebx
80101695:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101698:	85 db                	test   %ebx,%ebx
8010169a:	0f 84 b7 00 00 00    	je     80101757 <ilock+0xc7>
801016a0:	8b 53 08             	mov    0x8(%ebx),%edx
801016a3:	85 d2                	test   %edx,%edx
801016a5:	0f 8e ac 00 00 00    	jle    80101757 <ilock+0xc7>
801016ab:	8d 43 0c             	lea    0xc(%ebx),%eax
801016ae:	83 ec 0c             	sub    $0xc,%esp
801016b1:	50                   	push   %eax
801016b2:	e8 99 2d 00 00       	call   80104450 <acquiresleep>
801016b7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801016ba:	83 c4 10             	add    $0x10,%esp
801016bd:	85 c0                	test   %eax,%eax
801016bf:	74 0f                	je     801016d0 <ilock+0x40>
801016c1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016c4:	5b                   	pop    %ebx
801016c5:	5e                   	pop    %esi
801016c6:	5d                   	pop    %ebp
801016c7:	c3                   	ret    
801016c8:	90                   	nop
801016c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801016d0:	8b 43 04             	mov    0x4(%ebx),%eax
801016d3:	83 ec 08             	sub    $0x8,%esp
801016d6:	c1 e8 03             	shr    $0x3,%eax
801016d9:	03 05 d4 09 11 80    	add    0x801109d4,%eax
801016df:	50                   	push   %eax
801016e0:	ff 33                	pushl  (%ebx)
801016e2:	e8 e9 e9 ff ff       	call   801000d0 <bread>
801016e7:	89 c6                	mov    %eax,%esi
801016e9:	8b 43 04             	mov    0x4(%ebx),%eax
801016ec:	83 c4 0c             	add    $0xc,%esp
801016ef:	83 e0 07             	and    $0x7,%eax
801016f2:	c1 e0 06             	shl    $0x6,%eax
801016f5:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
801016f9:	0f b7 10             	movzwl (%eax),%edx
801016fc:	83 c0 0c             	add    $0xc,%eax
801016ff:	66 89 53 50          	mov    %dx,0x50(%ebx)
80101703:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101707:	66 89 53 52          	mov    %dx,0x52(%ebx)
8010170b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010170f:	66 89 53 54          	mov    %dx,0x54(%ebx)
80101713:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101717:	66 89 53 56          	mov    %dx,0x56(%ebx)
8010171b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010171e:	89 53 58             	mov    %edx,0x58(%ebx)
80101721:	6a 34                	push   $0x34
80101723:	50                   	push   %eax
80101724:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101727:	50                   	push   %eax
80101728:	e8 13 31 00 00       	call   80104840 <memmove>
8010172d:	89 34 24             	mov    %esi,(%esp)
80101730:	e8 ab ea ff ff       	call   801001e0 <brelse>
80101735:	83 c4 10             	add    $0x10,%esp
80101738:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010173d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101744:	0f 85 77 ff ff ff    	jne    801016c1 <ilock+0x31>
8010174a:	83 ec 0c             	sub    $0xc,%esp
8010174d:	68 b0 74 10 80       	push   $0x801074b0
80101752:	e8 39 ec ff ff       	call   80100390 <panic>
80101757:	83 ec 0c             	sub    $0xc,%esp
8010175a:	68 aa 74 10 80       	push   $0x801074aa
8010175f:	e8 2c ec ff ff       	call   80100390 <panic>
80101764:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010176a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101770 <iunlock>:
80101770:	55                   	push   %ebp
80101771:	89 e5                	mov    %esp,%ebp
80101773:	56                   	push   %esi
80101774:	53                   	push   %ebx
80101775:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101778:	85 db                	test   %ebx,%ebx
8010177a:	74 28                	je     801017a4 <iunlock+0x34>
8010177c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010177f:	83 ec 0c             	sub    $0xc,%esp
80101782:	56                   	push   %esi
80101783:	e8 68 2d 00 00       	call   801044f0 <holdingsleep>
80101788:	83 c4 10             	add    $0x10,%esp
8010178b:	85 c0                	test   %eax,%eax
8010178d:	74 15                	je     801017a4 <iunlock+0x34>
8010178f:	8b 43 08             	mov    0x8(%ebx),%eax
80101792:	85 c0                	test   %eax,%eax
80101794:	7e 0e                	jle    801017a4 <iunlock+0x34>
80101796:	89 75 08             	mov    %esi,0x8(%ebp)
80101799:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010179c:	5b                   	pop    %ebx
8010179d:	5e                   	pop    %esi
8010179e:	5d                   	pop    %ebp
8010179f:	e9 0c 2d 00 00       	jmp    801044b0 <releasesleep>
801017a4:	83 ec 0c             	sub    $0xc,%esp
801017a7:	68 bf 74 10 80       	push   $0x801074bf
801017ac:	e8 df eb ff ff       	call   80100390 <panic>
801017b1:	eb 0d                	jmp    801017c0 <iput>
801017b3:	90                   	nop
801017b4:	90                   	nop
801017b5:	90                   	nop
801017b6:	90                   	nop
801017b7:	90                   	nop
801017b8:	90                   	nop
801017b9:	90                   	nop
801017ba:	90                   	nop
801017bb:	90                   	nop
801017bc:	90                   	nop
801017bd:	90                   	nop
801017be:	90                   	nop
801017bf:	90                   	nop

801017c0 <iput>:
801017c0:	55                   	push   %ebp
801017c1:	89 e5                	mov    %esp,%ebp
801017c3:	57                   	push   %edi
801017c4:	56                   	push   %esi
801017c5:	53                   	push   %ebx
801017c6:	83 ec 28             	sub    $0x28,%esp
801017c9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801017cc:	8d 7b 0c             	lea    0xc(%ebx),%edi
801017cf:	57                   	push   %edi
801017d0:	e8 7b 2c 00 00       	call   80104450 <acquiresleep>
801017d5:	8b 53 4c             	mov    0x4c(%ebx),%edx
801017d8:	83 c4 10             	add    $0x10,%esp
801017db:	85 d2                	test   %edx,%edx
801017dd:	74 07                	je     801017e6 <iput+0x26>
801017df:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801017e4:	74 32                	je     80101818 <iput+0x58>
801017e6:	83 ec 0c             	sub    $0xc,%esp
801017e9:	57                   	push   %edi
801017ea:	e8 c1 2c 00 00       	call   801044b0 <releasesleep>
801017ef:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
801017f6:	e8 85 2e 00 00       	call   80104680 <acquire>
801017fb:	83 6b 08 01          	subl   $0x1,0x8(%ebx)
801017ff:	83 c4 10             	add    $0x10,%esp
80101802:	c7 45 08 e0 09 11 80 	movl   $0x801109e0,0x8(%ebp)
80101809:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010180c:	5b                   	pop    %ebx
8010180d:	5e                   	pop    %esi
8010180e:	5f                   	pop    %edi
8010180f:	5d                   	pop    %ebp
80101810:	e9 2b 2f 00 00       	jmp    80104740 <release>
80101815:	8d 76 00             	lea    0x0(%esi),%esi
80101818:	83 ec 0c             	sub    $0xc,%esp
8010181b:	68 e0 09 11 80       	push   $0x801109e0
80101820:	e8 5b 2e 00 00       	call   80104680 <acquire>
80101825:	8b 73 08             	mov    0x8(%ebx),%esi
80101828:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
8010182f:	e8 0c 2f 00 00       	call   80104740 <release>
80101834:	83 c4 10             	add    $0x10,%esp
80101837:	83 fe 01             	cmp    $0x1,%esi
8010183a:	75 aa                	jne    801017e6 <iput+0x26>
8010183c:	8d 8b 8c 00 00 00    	lea    0x8c(%ebx),%ecx
80101842:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101845:	8d 73 5c             	lea    0x5c(%ebx),%esi
80101848:	89 cf                	mov    %ecx,%edi
8010184a:	eb 0b                	jmp    80101857 <iput+0x97>
8010184c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101850:	83 c6 04             	add    $0x4,%esi
80101853:	39 fe                	cmp    %edi,%esi
80101855:	74 19                	je     80101870 <iput+0xb0>
80101857:	8b 16                	mov    (%esi),%edx
80101859:	85 d2                	test   %edx,%edx
8010185b:	74 f3                	je     80101850 <iput+0x90>
8010185d:	8b 03                	mov    (%ebx),%eax
8010185f:	e8 ac fb ff ff       	call   80101410 <bfree>
80101864:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010186a:	eb e4                	jmp    80101850 <iput+0x90>
8010186c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101870:	8b 83 8c 00 00 00    	mov    0x8c(%ebx),%eax
80101876:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101879:	85 c0                	test   %eax,%eax
8010187b:	75 33                	jne    801018b0 <iput+0xf0>
8010187d:	83 ec 0c             	sub    $0xc,%esp
80101880:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
80101887:	53                   	push   %ebx
80101888:	e8 53 fd ff ff       	call   801015e0 <iupdate>
8010188d:	31 c0                	xor    %eax,%eax
8010188f:	66 89 43 50          	mov    %ax,0x50(%ebx)
80101893:	89 1c 24             	mov    %ebx,(%esp)
80101896:	e8 45 fd ff ff       	call   801015e0 <iupdate>
8010189b:	c7 43 4c 00 00 00 00 	movl   $0x0,0x4c(%ebx)
801018a2:	83 c4 10             	add    $0x10,%esp
801018a5:	e9 3c ff ff ff       	jmp    801017e6 <iput+0x26>
801018aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801018b0:	83 ec 08             	sub    $0x8,%esp
801018b3:	50                   	push   %eax
801018b4:	ff 33                	pushl  (%ebx)
801018b6:	e8 15 e8 ff ff       	call   801000d0 <bread>
801018bb:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018c1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018c4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801018c7:	8d 70 5c             	lea    0x5c(%eax),%esi
801018ca:	83 c4 10             	add    $0x10,%esp
801018cd:	89 cf                	mov    %ecx,%edi
801018cf:	eb 0e                	jmp    801018df <iput+0x11f>
801018d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018d8:	83 c6 04             	add    $0x4,%esi
801018db:	39 fe                	cmp    %edi,%esi
801018dd:	74 0f                	je     801018ee <iput+0x12e>
801018df:	8b 16                	mov    (%esi),%edx
801018e1:	85 d2                	test   %edx,%edx
801018e3:	74 f3                	je     801018d8 <iput+0x118>
801018e5:	8b 03                	mov    (%ebx),%eax
801018e7:	e8 24 fb ff ff       	call   80101410 <bfree>
801018ec:	eb ea                	jmp    801018d8 <iput+0x118>
801018ee:	83 ec 0c             	sub    $0xc,%esp
801018f1:	ff 75 e4             	pushl  -0x1c(%ebp)
801018f4:	8b 7d e0             	mov    -0x20(%ebp),%edi
801018f7:	e8 e4 e8 ff ff       	call   801001e0 <brelse>
801018fc:	8b 93 8c 00 00 00    	mov    0x8c(%ebx),%edx
80101902:	8b 03                	mov    (%ebx),%eax
80101904:	e8 07 fb ff ff       	call   80101410 <bfree>
80101909:	c7 83 8c 00 00 00 00 	movl   $0x0,0x8c(%ebx)
80101910:	00 00 00 
80101913:	83 c4 10             	add    $0x10,%esp
80101916:	e9 62 ff ff ff       	jmp    8010187d <iput+0xbd>
8010191b:	90                   	nop
8010191c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101920 <iunlockput>:
80101920:	55                   	push   %ebp
80101921:	89 e5                	mov    %esp,%ebp
80101923:	53                   	push   %ebx
80101924:	83 ec 10             	sub    $0x10,%esp
80101927:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010192a:	53                   	push   %ebx
8010192b:	e8 40 fe ff ff       	call   80101770 <iunlock>
80101930:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101933:	83 c4 10             	add    $0x10,%esp
80101936:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101939:	c9                   	leave  
8010193a:	e9 81 fe ff ff       	jmp    801017c0 <iput>
8010193f:	90                   	nop

80101940 <stati>:
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	8b 55 08             	mov    0x8(%ebp),%edx
80101946:	8b 45 0c             	mov    0xc(%ebp),%eax
80101949:	8b 0a                	mov    (%edx),%ecx
8010194b:	89 48 04             	mov    %ecx,0x4(%eax)
8010194e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101951:	89 48 08             	mov    %ecx,0x8(%eax)
80101954:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101958:	66 89 08             	mov    %cx,(%eax)
8010195b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010195f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101963:	8b 52 58             	mov    0x58(%edx),%edx
80101966:	89 50 10             	mov    %edx,0x10(%eax)
80101969:	5d                   	pop    %ebp
8010196a:	c3                   	ret    
8010196b:	90                   	nop
8010196c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101970 <readi>:
80101970:	55                   	push   %ebp
80101971:	89 e5                	mov    %esp,%ebp
80101973:	57                   	push   %edi
80101974:	56                   	push   %esi
80101975:	53                   	push   %ebx
80101976:	83 ec 1c             	sub    $0x1c,%esp
80101979:	8b 45 08             	mov    0x8(%ebp),%eax
8010197c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010197f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101982:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101987:	89 75 e0             	mov    %esi,-0x20(%ebp)
8010198a:	89 45 d8             	mov    %eax,-0x28(%ebp)
8010198d:	8b 75 10             	mov    0x10(%ebp),%esi
80101990:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101993:	0f 84 a7 00 00 00    	je     80101a40 <readi+0xd0>
80101999:	8b 45 d8             	mov    -0x28(%ebp),%eax
8010199c:	8b 40 58             	mov    0x58(%eax),%eax
8010199f:	39 c6                	cmp    %eax,%esi
801019a1:	0f 87 ba 00 00 00    	ja     80101a61 <readi+0xf1>
801019a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801019aa:	89 f9                	mov    %edi,%ecx
801019ac:	01 f1                	add    %esi,%ecx
801019ae:	0f 82 ad 00 00 00    	jb     80101a61 <readi+0xf1>
801019b4:	89 c2                	mov    %eax,%edx
801019b6:	29 f2                	sub    %esi,%edx
801019b8:	39 c8                	cmp    %ecx,%eax
801019ba:	0f 43 d7             	cmovae %edi,%edx
801019bd:	31 ff                	xor    %edi,%edi
801019bf:	85 d2                	test   %edx,%edx
801019c1:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801019c4:	74 6c                	je     80101a32 <readi+0xc2>
801019c6:	8d 76 00             	lea    0x0(%esi),%esi
801019c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801019d0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019d3:	89 f2                	mov    %esi,%edx
801019d5:	c1 ea 09             	shr    $0x9,%edx
801019d8:	89 d8                	mov    %ebx,%eax
801019da:	e8 11 f9 ff ff       	call   801012f0 <bmap>
801019df:	83 ec 08             	sub    $0x8,%esp
801019e2:	50                   	push   %eax
801019e3:	ff 33                	pushl  (%ebx)
801019e5:	e8 e6 e6 ff ff       	call   801000d0 <bread>
801019ea:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
801019ed:	89 c2                	mov    %eax,%edx
801019ef:	89 f0                	mov    %esi,%eax
801019f1:	25 ff 01 00 00       	and    $0x1ff,%eax
801019f6:	b9 00 02 00 00       	mov    $0x200,%ecx
801019fb:	83 c4 0c             	add    $0xc,%esp
801019fe:	29 c1                	sub    %eax,%ecx
80101a00:	8d 44 02 5c          	lea    0x5c(%edx,%eax,1),%eax
80101a04:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101a07:	29 fb                	sub    %edi,%ebx
80101a09:	39 d9                	cmp    %ebx,%ecx
80101a0b:	0f 46 d9             	cmovbe %ecx,%ebx
80101a0e:	53                   	push   %ebx
80101a0f:	50                   	push   %eax
80101a10:	01 df                	add    %ebx,%edi
80101a12:	ff 75 e0             	pushl  -0x20(%ebp)
80101a15:	01 de                	add    %ebx,%esi
80101a17:	e8 24 2e 00 00       	call   80104840 <memmove>
80101a1c:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a1f:	89 14 24             	mov    %edx,(%esp)
80101a22:	e8 b9 e7 ff ff       	call   801001e0 <brelse>
80101a27:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a2a:	83 c4 10             	add    $0x10,%esp
80101a2d:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a30:	77 9e                	ja     801019d0 <readi+0x60>
80101a32:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101a35:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a38:	5b                   	pop    %ebx
80101a39:	5e                   	pop    %esi
80101a3a:	5f                   	pop    %edi
80101a3b:	5d                   	pop    %ebp
80101a3c:	c3                   	ret    
80101a3d:	8d 76 00             	lea    0x0(%esi),%esi
80101a40:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a44:	66 83 f8 09          	cmp    $0x9,%ax
80101a48:	77 17                	ja     80101a61 <readi+0xf1>
80101a4a:	8b 04 c5 60 09 11 80 	mov    -0x7feef6a0(,%eax,8),%eax
80101a51:	85 c0                	test   %eax,%eax
80101a53:	74 0c                	je     80101a61 <readi+0xf1>
80101a55:	89 7d 10             	mov    %edi,0x10(%ebp)
80101a58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a5b:	5b                   	pop    %ebx
80101a5c:	5e                   	pop    %esi
80101a5d:	5f                   	pop    %edi
80101a5e:	5d                   	pop    %ebp
80101a5f:	ff e0                	jmp    *%eax
80101a61:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a66:	eb cd                	jmp    80101a35 <readi+0xc5>
80101a68:	90                   	nop
80101a69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101a70 <writei>:
80101a70:	55                   	push   %ebp
80101a71:	89 e5                	mov    %esp,%ebp
80101a73:	57                   	push   %edi
80101a74:	56                   	push   %esi
80101a75:	53                   	push   %ebx
80101a76:	83 ec 1c             	sub    $0x1c,%esp
80101a79:	8b 45 08             	mov    0x8(%ebp),%eax
80101a7c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a7f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101a82:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101a87:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101a8a:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101a8d:	8b 75 10             	mov    0x10(%ebp),%esi
80101a90:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101a93:	0f 84 b7 00 00 00    	je     80101b50 <writei+0xe0>
80101a99:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101a9c:	39 70 58             	cmp    %esi,0x58(%eax)
80101a9f:	0f 82 eb 00 00 00    	jb     80101b90 <writei+0x120>
80101aa5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101aa8:	31 d2                	xor    %edx,%edx
80101aaa:	89 f8                	mov    %edi,%eax
80101aac:	01 f0                	add    %esi,%eax
80101aae:	0f 92 c2             	setb   %dl
80101ab1:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101ab6:	0f 87 d4 00 00 00    	ja     80101b90 <writei+0x120>
80101abc:	85 d2                	test   %edx,%edx
80101abe:	0f 85 cc 00 00 00    	jne    80101b90 <writei+0x120>
80101ac4:	85 ff                	test   %edi,%edi
80101ac6:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101acd:	74 72                	je     80101b41 <writei+0xd1>
80101acf:	90                   	nop
80101ad0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101ad3:	89 f2                	mov    %esi,%edx
80101ad5:	c1 ea 09             	shr    $0x9,%edx
80101ad8:	89 f8                	mov    %edi,%eax
80101ada:	e8 11 f8 ff ff       	call   801012f0 <bmap>
80101adf:	83 ec 08             	sub    $0x8,%esp
80101ae2:	50                   	push   %eax
80101ae3:	ff 37                	pushl  (%edi)
80101ae5:	e8 e6 e5 ff ff       	call   801000d0 <bread>
80101aea:	8b 5d e0             	mov    -0x20(%ebp),%ebx
80101aed:	2b 5d e4             	sub    -0x1c(%ebp),%ebx
80101af0:	89 c7                	mov    %eax,%edi
80101af2:	89 f0                	mov    %esi,%eax
80101af4:	b9 00 02 00 00       	mov    $0x200,%ecx
80101af9:	83 c4 0c             	add    $0xc,%esp
80101afc:	25 ff 01 00 00       	and    $0x1ff,%eax
80101b01:	29 c1                	sub    %eax,%ecx
80101b03:	8d 44 07 5c          	lea    0x5c(%edi,%eax,1),%eax
80101b07:	39 d9                	cmp    %ebx,%ecx
80101b09:	0f 46 d9             	cmovbe %ecx,%ebx
80101b0c:	53                   	push   %ebx
80101b0d:	ff 75 dc             	pushl  -0x24(%ebp)
80101b10:	01 de                	add    %ebx,%esi
80101b12:	50                   	push   %eax
80101b13:	e8 28 2d 00 00       	call   80104840 <memmove>
80101b18:	89 3c 24             	mov    %edi,(%esp)
80101b1b:	e8 70 13 00 00       	call   80102e90 <log_write>
80101b20:	89 3c 24             	mov    %edi,(%esp)
80101b23:	e8 b8 e6 ff ff       	call   801001e0 <brelse>
80101b28:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b2b:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b2e:	83 c4 10             	add    $0x10,%esp
80101b31:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101b34:	39 45 e0             	cmp    %eax,-0x20(%ebp)
80101b37:	77 97                	ja     80101ad0 <writei+0x60>
80101b39:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b3c:	3b 70 58             	cmp    0x58(%eax),%esi
80101b3f:	77 37                	ja     80101b78 <writei+0x108>
80101b41:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b44:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b47:	5b                   	pop    %ebx
80101b48:	5e                   	pop    %esi
80101b49:	5f                   	pop    %edi
80101b4a:	5d                   	pop    %ebp
80101b4b:	c3                   	ret    
80101b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b50:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b54:	66 83 f8 09          	cmp    $0x9,%ax
80101b58:	77 36                	ja     80101b90 <writei+0x120>
80101b5a:	8b 04 c5 64 09 11 80 	mov    -0x7feef69c(,%eax,8),%eax
80101b61:	85 c0                	test   %eax,%eax
80101b63:	74 2b                	je     80101b90 <writei+0x120>
80101b65:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b68:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b6b:	5b                   	pop    %ebx
80101b6c:	5e                   	pop    %esi
80101b6d:	5f                   	pop    %edi
80101b6e:	5d                   	pop    %ebp
80101b6f:	ff e0                	jmp    *%eax
80101b71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b78:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b7b:	83 ec 0c             	sub    $0xc,%esp
80101b7e:	89 70 58             	mov    %esi,0x58(%eax)
80101b81:	50                   	push   %eax
80101b82:	e8 59 fa ff ff       	call   801015e0 <iupdate>
80101b87:	83 c4 10             	add    $0x10,%esp
80101b8a:	eb b5                	jmp    80101b41 <writei+0xd1>
80101b8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101b95:	eb ad                	jmp    80101b44 <writei+0xd4>
80101b97:	89 f6                	mov    %esi,%esi
80101b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ba0 <namecmp>:
80101ba0:	55                   	push   %ebp
80101ba1:	89 e5                	mov    %esp,%ebp
80101ba3:	83 ec 0c             	sub    $0xc,%esp
80101ba6:	6a 0e                	push   $0xe
80101ba8:	ff 75 0c             	pushl  0xc(%ebp)
80101bab:	ff 75 08             	pushl  0x8(%ebp)
80101bae:	e8 fd 2c 00 00       	call   801048b0 <strncmp>
80101bb3:	c9                   	leave  
80101bb4:	c3                   	ret    
80101bb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bc0 <dirlookup>:
80101bc0:	55                   	push   %ebp
80101bc1:	89 e5                	mov    %esp,%ebp
80101bc3:	57                   	push   %edi
80101bc4:	56                   	push   %esi
80101bc5:	53                   	push   %ebx
80101bc6:	83 ec 1c             	sub    $0x1c,%esp
80101bc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101bcc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bd1:	0f 85 85 00 00 00    	jne    80101c5c <dirlookup+0x9c>
80101bd7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bda:	31 ff                	xor    %edi,%edi
80101bdc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bdf:	85 d2                	test   %edx,%edx
80101be1:	74 3e                	je     80101c21 <dirlookup+0x61>
80101be3:	90                   	nop
80101be4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101be8:	6a 10                	push   $0x10
80101bea:	57                   	push   %edi
80101beb:	56                   	push   %esi
80101bec:	53                   	push   %ebx
80101bed:	e8 7e fd ff ff       	call   80101970 <readi>
80101bf2:	83 c4 10             	add    $0x10,%esp
80101bf5:	83 f8 10             	cmp    $0x10,%eax
80101bf8:	75 55                	jne    80101c4f <dirlookup+0x8f>
80101bfa:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101bff:	74 18                	je     80101c19 <dirlookup+0x59>
80101c01:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c04:	83 ec 04             	sub    $0x4,%esp
80101c07:	6a 0e                	push   $0xe
80101c09:	50                   	push   %eax
80101c0a:	ff 75 0c             	pushl  0xc(%ebp)
80101c0d:	e8 9e 2c 00 00       	call   801048b0 <strncmp>
80101c12:	83 c4 10             	add    $0x10,%esp
80101c15:	85 c0                	test   %eax,%eax
80101c17:	74 17                	je     80101c30 <dirlookup+0x70>
80101c19:	83 c7 10             	add    $0x10,%edi
80101c1c:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101c1f:	72 c7                	jb     80101be8 <dirlookup+0x28>
80101c21:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c24:	31 c0                	xor    %eax,%eax
80101c26:	5b                   	pop    %ebx
80101c27:	5e                   	pop    %esi
80101c28:	5f                   	pop    %edi
80101c29:	5d                   	pop    %ebp
80101c2a:	c3                   	ret    
80101c2b:	90                   	nop
80101c2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101c30:	8b 45 10             	mov    0x10(%ebp),%eax
80101c33:	85 c0                	test   %eax,%eax
80101c35:	74 05                	je     80101c3c <dirlookup+0x7c>
80101c37:	8b 45 10             	mov    0x10(%ebp),%eax
80101c3a:	89 38                	mov    %edi,(%eax)
80101c3c:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c40:	8b 03                	mov    (%ebx),%eax
80101c42:	e8 d9 f5 ff ff       	call   80101220 <iget>
80101c47:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c4a:	5b                   	pop    %ebx
80101c4b:	5e                   	pop    %esi
80101c4c:	5f                   	pop    %edi
80101c4d:	5d                   	pop    %ebp
80101c4e:	c3                   	ret    
80101c4f:	83 ec 0c             	sub    $0xc,%esp
80101c52:	68 d9 74 10 80       	push   $0x801074d9
80101c57:	e8 34 e7 ff ff       	call   80100390 <panic>
80101c5c:	83 ec 0c             	sub    $0xc,%esp
80101c5f:	68 c7 74 10 80       	push   $0x801074c7
80101c64:	e8 27 e7 ff ff       	call   80100390 <panic>
80101c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101c70 <namex>:
80101c70:	55                   	push   %ebp
80101c71:	89 e5                	mov    %esp,%ebp
80101c73:	57                   	push   %edi
80101c74:	56                   	push   %esi
80101c75:	53                   	push   %ebx
80101c76:	89 cf                	mov    %ecx,%edi
80101c78:	89 c3                	mov    %eax,%ebx
80101c7a:	83 ec 1c             	sub    $0x1c,%esp
80101c7d:	80 38 2f             	cmpb   $0x2f,(%eax)
80101c80:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101c83:	0f 84 67 01 00 00    	je     80101df0 <namex+0x180>
80101c89:	e8 82 1c 00 00       	call   80103910 <myproc>
80101c8e:	83 ec 0c             	sub    $0xc,%esp
80101c91:	8b 70 68             	mov    0x68(%eax),%esi
80101c94:	68 e0 09 11 80       	push   $0x801109e0
80101c99:	e8 e2 29 00 00       	call   80104680 <acquire>
80101c9e:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101ca2:	c7 04 24 e0 09 11 80 	movl   $0x801109e0,(%esp)
80101ca9:	e8 92 2a 00 00       	call   80104740 <release>
80101cae:	83 c4 10             	add    $0x10,%esp
80101cb1:	eb 08                	jmp    80101cbb <namex+0x4b>
80101cb3:	90                   	nop
80101cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101cb8:	83 c3 01             	add    $0x1,%ebx
80101cbb:	0f b6 03             	movzbl (%ebx),%eax
80101cbe:	3c 2f                	cmp    $0x2f,%al
80101cc0:	74 f6                	je     80101cb8 <namex+0x48>
80101cc2:	84 c0                	test   %al,%al
80101cc4:	0f 84 ee 00 00 00    	je     80101db8 <namex+0x148>
80101cca:	0f b6 03             	movzbl (%ebx),%eax
80101ccd:	3c 2f                	cmp    $0x2f,%al
80101ccf:	0f 84 b3 00 00 00    	je     80101d88 <namex+0x118>
80101cd5:	84 c0                	test   %al,%al
80101cd7:	89 da                	mov    %ebx,%edx
80101cd9:	75 09                	jne    80101ce4 <namex+0x74>
80101cdb:	e9 a8 00 00 00       	jmp    80101d88 <namex+0x118>
80101ce0:	84 c0                	test   %al,%al
80101ce2:	74 0a                	je     80101cee <namex+0x7e>
80101ce4:	83 c2 01             	add    $0x1,%edx
80101ce7:	0f b6 02             	movzbl (%edx),%eax
80101cea:	3c 2f                	cmp    $0x2f,%al
80101cec:	75 f2                	jne    80101ce0 <namex+0x70>
80101cee:	89 d1                	mov    %edx,%ecx
80101cf0:	29 d9                	sub    %ebx,%ecx
80101cf2:	83 f9 0d             	cmp    $0xd,%ecx
80101cf5:	0f 8e 91 00 00 00    	jle    80101d8c <namex+0x11c>
80101cfb:	83 ec 04             	sub    $0x4,%esp
80101cfe:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d01:	6a 0e                	push   $0xe
80101d03:	53                   	push   %ebx
80101d04:	57                   	push   %edi
80101d05:	e8 36 2b 00 00       	call   80104840 <memmove>
80101d0a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d0d:	83 c4 10             	add    $0x10,%esp
80101d10:	89 d3                	mov    %edx,%ebx
80101d12:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d15:	75 11                	jne    80101d28 <namex+0xb8>
80101d17:	89 f6                	mov    %esi,%esi
80101d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101d20:	83 c3 01             	add    $0x1,%ebx
80101d23:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d26:	74 f8                	je     80101d20 <namex+0xb0>
80101d28:	83 ec 0c             	sub    $0xc,%esp
80101d2b:	56                   	push   %esi
80101d2c:	e8 5f f9 ff ff       	call   80101690 <ilock>
80101d31:	83 c4 10             	add    $0x10,%esp
80101d34:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d39:	0f 85 91 00 00 00    	jne    80101dd0 <namex+0x160>
80101d3f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d42:	85 d2                	test   %edx,%edx
80101d44:	74 09                	je     80101d4f <namex+0xdf>
80101d46:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d49:	0f 84 b7 00 00 00    	je     80101e06 <namex+0x196>
80101d4f:	83 ec 04             	sub    $0x4,%esp
80101d52:	6a 00                	push   $0x0
80101d54:	57                   	push   %edi
80101d55:	56                   	push   %esi
80101d56:	e8 65 fe ff ff       	call   80101bc0 <dirlookup>
80101d5b:	83 c4 10             	add    $0x10,%esp
80101d5e:	85 c0                	test   %eax,%eax
80101d60:	74 6e                	je     80101dd0 <namex+0x160>
80101d62:	83 ec 0c             	sub    $0xc,%esp
80101d65:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d68:	56                   	push   %esi
80101d69:	e8 02 fa ff ff       	call   80101770 <iunlock>
80101d6e:	89 34 24             	mov    %esi,(%esp)
80101d71:	e8 4a fa ff ff       	call   801017c0 <iput>
80101d76:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d79:	83 c4 10             	add    $0x10,%esp
80101d7c:	89 c6                	mov    %eax,%esi
80101d7e:	e9 38 ff ff ff       	jmp    80101cbb <namex+0x4b>
80101d83:	90                   	nop
80101d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101d88:	89 da                	mov    %ebx,%edx
80101d8a:	31 c9                	xor    %ecx,%ecx
80101d8c:	83 ec 04             	sub    $0x4,%esp
80101d8f:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101d92:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101d95:	51                   	push   %ecx
80101d96:	53                   	push   %ebx
80101d97:	57                   	push   %edi
80101d98:	e8 a3 2a 00 00       	call   80104840 <memmove>
80101d9d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101da0:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101da3:	83 c4 10             	add    $0x10,%esp
80101da6:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101daa:	89 d3                	mov    %edx,%ebx
80101dac:	e9 61 ff ff ff       	jmp    80101d12 <namex+0xa2>
80101db1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101db8:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101dbb:	85 c0                	test   %eax,%eax
80101dbd:	75 5d                	jne    80101e1c <namex+0x1ac>
80101dbf:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dc2:	89 f0                	mov    %esi,%eax
80101dc4:	5b                   	pop    %ebx
80101dc5:	5e                   	pop    %esi
80101dc6:	5f                   	pop    %edi
80101dc7:	5d                   	pop    %ebp
80101dc8:	c3                   	ret    
80101dc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101dd0:	83 ec 0c             	sub    $0xc,%esp
80101dd3:	56                   	push   %esi
80101dd4:	e8 97 f9 ff ff       	call   80101770 <iunlock>
80101dd9:	89 34 24             	mov    %esi,(%esp)
80101ddc:	31 f6                	xor    %esi,%esi
80101dde:	e8 dd f9 ff ff       	call   801017c0 <iput>
80101de3:	83 c4 10             	add    $0x10,%esp
80101de6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101de9:	89 f0                	mov    %esi,%eax
80101deb:	5b                   	pop    %ebx
80101dec:	5e                   	pop    %esi
80101ded:	5f                   	pop    %edi
80101dee:	5d                   	pop    %ebp
80101def:	c3                   	ret    
80101df0:	ba 01 00 00 00       	mov    $0x1,%edx
80101df5:	b8 01 00 00 00       	mov    $0x1,%eax
80101dfa:	e8 21 f4 ff ff       	call   80101220 <iget>
80101dff:	89 c6                	mov    %eax,%esi
80101e01:	e9 b5 fe ff ff       	jmp    80101cbb <namex+0x4b>
80101e06:	83 ec 0c             	sub    $0xc,%esp
80101e09:	56                   	push   %esi
80101e0a:	e8 61 f9 ff ff       	call   80101770 <iunlock>
80101e0f:	83 c4 10             	add    $0x10,%esp
80101e12:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e15:	89 f0                	mov    %esi,%eax
80101e17:	5b                   	pop    %ebx
80101e18:	5e                   	pop    %esi
80101e19:	5f                   	pop    %edi
80101e1a:	5d                   	pop    %ebp
80101e1b:	c3                   	ret    
80101e1c:	83 ec 0c             	sub    $0xc,%esp
80101e1f:	56                   	push   %esi
80101e20:	31 f6                	xor    %esi,%esi
80101e22:	e8 99 f9 ff ff       	call   801017c0 <iput>
80101e27:	83 c4 10             	add    $0x10,%esp
80101e2a:	eb 93                	jmp    80101dbf <namex+0x14f>
80101e2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101e30 <dirlink>:
80101e30:	55                   	push   %ebp
80101e31:	89 e5                	mov    %esp,%ebp
80101e33:	57                   	push   %edi
80101e34:	56                   	push   %esi
80101e35:	53                   	push   %ebx
80101e36:	83 ec 20             	sub    $0x20,%esp
80101e39:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101e3c:	6a 00                	push   $0x0
80101e3e:	ff 75 0c             	pushl  0xc(%ebp)
80101e41:	53                   	push   %ebx
80101e42:	e8 79 fd ff ff       	call   80101bc0 <dirlookup>
80101e47:	83 c4 10             	add    $0x10,%esp
80101e4a:	85 c0                	test   %eax,%eax
80101e4c:	75 67                	jne    80101eb5 <dirlink+0x85>
80101e4e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e51:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e54:	85 ff                	test   %edi,%edi
80101e56:	74 29                	je     80101e81 <dirlink+0x51>
80101e58:	31 ff                	xor    %edi,%edi
80101e5a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e5d:	eb 09                	jmp    80101e68 <dirlink+0x38>
80101e5f:	90                   	nop
80101e60:	83 c7 10             	add    $0x10,%edi
80101e63:	3b 7b 58             	cmp    0x58(%ebx),%edi
80101e66:	73 19                	jae    80101e81 <dirlink+0x51>
80101e68:	6a 10                	push   $0x10
80101e6a:	57                   	push   %edi
80101e6b:	56                   	push   %esi
80101e6c:	53                   	push   %ebx
80101e6d:	e8 fe fa ff ff       	call   80101970 <readi>
80101e72:	83 c4 10             	add    $0x10,%esp
80101e75:	83 f8 10             	cmp    $0x10,%eax
80101e78:	75 4e                	jne    80101ec8 <dirlink+0x98>
80101e7a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e7f:	75 df                	jne    80101e60 <dirlink+0x30>
80101e81:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e84:	83 ec 04             	sub    $0x4,%esp
80101e87:	6a 0e                	push   $0xe
80101e89:	ff 75 0c             	pushl  0xc(%ebp)
80101e8c:	50                   	push   %eax
80101e8d:	e8 7e 2a 00 00       	call   80104910 <strncpy>
80101e92:	8b 45 10             	mov    0x10(%ebp),%eax
80101e95:	6a 10                	push   $0x10
80101e97:	57                   	push   %edi
80101e98:	56                   	push   %esi
80101e99:	53                   	push   %ebx
80101e9a:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101e9e:	e8 cd fb ff ff       	call   80101a70 <writei>
80101ea3:	83 c4 20             	add    $0x20,%esp
80101ea6:	83 f8 10             	cmp    $0x10,%eax
80101ea9:	75 2a                	jne    80101ed5 <dirlink+0xa5>
80101eab:	31 c0                	xor    %eax,%eax
80101ead:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101eb0:	5b                   	pop    %ebx
80101eb1:	5e                   	pop    %esi
80101eb2:	5f                   	pop    %edi
80101eb3:	5d                   	pop    %ebp
80101eb4:	c3                   	ret    
80101eb5:	83 ec 0c             	sub    $0xc,%esp
80101eb8:	50                   	push   %eax
80101eb9:	e8 02 f9 ff ff       	call   801017c0 <iput>
80101ebe:	83 c4 10             	add    $0x10,%esp
80101ec1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ec6:	eb e5                	jmp    80101ead <dirlink+0x7d>
80101ec8:	83 ec 0c             	sub    $0xc,%esp
80101ecb:	68 e8 74 10 80       	push   $0x801074e8
80101ed0:	e8 bb e4 ff ff       	call   80100390 <panic>
80101ed5:	83 ec 0c             	sub    $0xc,%esp
80101ed8:	68 92 7b 10 80       	push   $0x80107b92
80101edd:	e8 ae e4 ff ff       	call   80100390 <panic>
80101ee2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101ef0 <namei>:
80101ef0:	55                   	push   %ebp
80101ef1:	31 d2                	xor    %edx,%edx
80101ef3:	89 e5                	mov    %esp,%ebp
80101ef5:	83 ec 18             	sub    $0x18,%esp
80101ef8:	8b 45 08             	mov    0x8(%ebp),%eax
80101efb:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101efe:	e8 6d fd ff ff       	call   80101c70 <namex>
80101f03:	c9                   	leave  
80101f04:	c3                   	ret    
80101f05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f10 <nameiparent>:
80101f10:	55                   	push   %ebp
80101f11:	ba 01 00 00 00       	mov    $0x1,%edx
80101f16:	89 e5                	mov    %esp,%ebp
80101f18:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f1b:	8b 45 08             	mov    0x8(%ebp),%eax
80101f1e:	5d                   	pop    %ebp
80101f1f:	e9 4c fd ff ff       	jmp    80101c70 <namex>
80101f24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101f2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101f30 <swapread>:
80101f30:	55                   	push   %ebp
80101f31:	89 e5                	mov    %esp,%ebp
80101f33:	57                   	push   %edi
80101f34:	56                   	push   %esi
80101f35:	53                   	push   %ebx
80101f36:	83 ec 1c             	sub    $0x1c,%esp
80101f39:	8b 7d 0c             	mov    0xc(%ebp),%edi
80101f3c:	81 ff ab 84 01 00    	cmp    $0x184ab,%edi
80101f42:	77 5c                	ja     80101fa0 <swapread+0x70>
80101f44:	8d 87 fc 01 00 00    	lea    0x1fc(%edi),%eax
80101f4a:	8b 75 08             	mov    0x8(%ebp),%esi
80101f4d:	8d 9f f4 01 00 00    	lea    0x1f4(%edi),%ebx
80101f53:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101f56:	8d 76 00             	lea    0x0(%esi),%esi
80101f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101f60:	83 ec 08             	sub    $0x8,%esp
80101f63:	53                   	push   %ebx
80101f64:	6a 00                	push   $0x0
80101f66:	83 c3 01             	add    $0x1,%ebx
80101f69:	e8 62 e1 ff ff       	call   801000d0 <bread>
80101f6e:	89 c7                	mov    %eax,%edi
80101f70:	8d 40 5c             	lea    0x5c(%eax),%eax
80101f73:	83 c4 0c             	add    $0xc,%esp
80101f76:	68 00 02 00 00       	push   $0x200
80101f7b:	50                   	push   %eax
80101f7c:	56                   	push   %esi
80101f7d:	81 c6 00 02 00 00    	add    $0x200,%esi
80101f83:	e8 b8 28 00 00       	call   80104840 <memmove>
80101f88:	89 3c 24             	mov    %edi,(%esp)
80101f8b:	e8 50 e2 ff ff       	call   801001e0 <brelse>
80101f90:	83 c4 10             	add    $0x10,%esp
80101f93:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
80101f96:	75 c8                	jne    80101f60 <swapread+0x30>
80101f98:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101f9b:	5b                   	pop    %ebx
80101f9c:	5e                   	pop    %esi
80101f9d:	5f                   	pop    %edi
80101f9e:	5d                   	pop    %ebp
80101f9f:	c3                   	ret    
80101fa0:	83 ec 0c             	sub    $0xc,%esp
80101fa3:	68 f5 74 10 80       	push   $0x801074f5
80101fa8:	e8 e3 e3 ff ff       	call   80100390 <panic>
80101fad:	8d 76 00             	lea    0x0(%esi),%esi

80101fb0 <swapwrite>:
80101fb0:	55                   	push   %ebp
80101fb1:	89 e5                	mov    %esp,%ebp
80101fb3:	57                   	push   %edi
80101fb4:	56                   	push   %esi
80101fb5:	53                   	push   %ebx
80101fb6:	83 ec 1c             	sub    $0x1c,%esp
80101fb9:	8b 7d 0c             	mov    0xc(%ebp),%edi
80101fbc:	81 ff ab 84 01 00    	cmp    $0x184ab,%edi
80101fc2:	77 64                	ja     80102028 <swapwrite+0x78>
80101fc4:	8d 87 fc 01 00 00    	lea    0x1fc(%edi),%eax
80101fca:	8b 75 08             	mov    0x8(%ebp),%esi
80101fcd:	8d 9f f4 01 00 00    	lea    0x1f4(%edi),%ebx
80101fd3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101fd6:	8d 76 00             	lea    0x0(%esi),%esi
80101fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101fe0:	83 ec 08             	sub    $0x8,%esp
80101fe3:	53                   	push   %ebx
80101fe4:	6a 00                	push   $0x0
80101fe6:	83 c3 01             	add    $0x1,%ebx
80101fe9:	e8 e2 e0 ff ff       	call   801000d0 <bread>
80101fee:	89 c7                	mov    %eax,%edi
80101ff0:	8d 40 5c             	lea    0x5c(%eax),%eax
80101ff3:	83 c4 0c             	add    $0xc,%esp
80101ff6:	68 00 02 00 00       	push   $0x200
80101ffb:	56                   	push   %esi
80101ffc:	81 c6 00 02 00 00    	add    $0x200,%esi
80102002:	50                   	push   %eax
80102003:	e8 38 28 00 00       	call   80104840 <memmove>
80102008:	89 3c 24             	mov    %edi,(%esp)
8010200b:	e8 90 e1 ff ff       	call   801001a0 <bwrite>
80102010:	89 3c 24             	mov    %edi,(%esp)
80102013:	e8 c8 e1 ff ff       	call   801001e0 <brelse>
80102018:	83 c4 10             	add    $0x10,%esp
8010201b:	3b 5d e4             	cmp    -0x1c(%ebp),%ebx
8010201e:	75 c0                	jne    80101fe0 <swapwrite+0x30>
80102020:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102023:	5b                   	pop    %ebx
80102024:	5e                   	pop    %esi
80102025:	5f                   	pop    %edi
80102026:	5d                   	pop    %ebp
80102027:	c3                   	ret    
80102028:	83 ec 0c             	sub    $0xc,%esp
8010202b:	68 f5 74 10 80       	push   $0x801074f5
80102030:	e8 5b e3 ff ff       	call   80100390 <panic>
80102035:	66 90                	xchg   %ax,%ax
80102037:	66 90                	xchg   %ax,%ax
80102039:	66 90                	xchg   %ax,%ax
8010203b:	66 90                	xchg   %ax,%ax
8010203d:	66 90                	xchg   %ax,%ax
8010203f:	90                   	nop

80102040 <idestart>:
80102040:	55                   	push   %ebp
80102041:	89 e5                	mov    %esp,%ebp
80102043:	57                   	push   %edi
80102044:	56                   	push   %esi
80102045:	53                   	push   %ebx
80102046:	83 ec 0c             	sub    $0xc,%esp
80102049:	85 c0                	test   %eax,%eax
8010204b:	0f 84 b4 00 00 00    	je     80102105 <idestart+0xc5>
80102051:	8b 58 08             	mov    0x8(%eax),%ebx
80102054:	89 c6                	mov    %eax,%esi
80102056:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
8010205c:	0f 87 96 00 00 00    	ja     801020f8 <idestart+0xb8>
80102062:	b9 f7 01 00 00       	mov    $0x1f7,%ecx
80102067:	89 f6                	mov    %esi,%esi
80102069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102070:	89 ca                	mov    %ecx,%edx
80102072:	ec                   	in     (%dx),%al
80102073:	83 e0 c0             	and    $0xffffffc0,%eax
80102076:	3c 40                	cmp    $0x40,%al
80102078:	75 f6                	jne    80102070 <idestart+0x30>
8010207a:	31 ff                	xor    %edi,%edi
8010207c:	ba f6 03 00 00       	mov    $0x3f6,%edx
80102081:	89 f8                	mov    %edi,%eax
80102083:	ee                   	out    %al,(%dx)
80102084:	b8 01 00 00 00       	mov    $0x1,%eax
80102089:	ba f2 01 00 00       	mov    $0x1f2,%edx
8010208e:	ee                   	out    %al,(%dx)
8010208f:	ba f3 01 00 00       	mov    $0x1f3,%edx
80102094:	89 d8                	mov    %ebx,%eax
80102096:	ee                   	out    %al,(%dx)
80102097:	89 d8                	mov    %ebx,%eax
80102099:	ba f4 01 00 00       	mov    $0x1f4,%edx
8010209e:	c1 f8 08             	sar    $0x8,%eax
801020a1:	ee                   	out    %al,(%dx)
801020a2:	ba f5 01 00 00       	mov    $0x1f5,%edx
801020a7:	89 f8                	mov    %edi,%eax
801020a9:	ee                   	out    %al,(%dx)
801020aa:	0f b6 46 04          	movzbl 0x4(%esi),%eax
801020ae:	ba f6 01 00 00       	mov    $0x1f6,%edx
801020b3:	c1 e0 04             	shl    $0x4,%eax
801020b6:	83 e0 10             	and    $0x10,%eax
801020b9:	83 c8 e0             	or     $0xffffffe0,%eax
801020bc:	ee                   	out    %al,(%dx)
801020bd:	f6 06 04             	testb  $0x4,(%esi)
801020c0:	75 16                	jne    801020d8 <idestart+0x98>
801020c2:	b8 20 00 00 00       	mov    $0x20,%eax
801020c7:	89 ca                	mov    %ecx,%edx
801020c9:	ee                   	out    %al,(%dx)
801020ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020cd:	5b                   	pop    %ebx
801020ce:	5e                   	pop    %esi
801020cf:	5f                   	pop    %edi
801020d0:	5d                   	pop    %ebp
801020d1:	c3                   	ret    
801020d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801020d8:	b8 30 00 00 00       	mov    $0x30,%eax
801020dd:	89 ca                	mov    %ecx,%edx
801020df:	ee                   	out    %al,(%dx)
801020e0:	b9 80 00 00 00       	mov    $0x80,%ecx
801020e5:	83 c6 5c             	add    $0x5c,%esi
801020e8:	ba f0 01 00 00       	mov    $0x1f0,%edx
801020ed:	fc                   	cld    
801020ee:	f3 6f                	rep outsl %ds:(%esi),(%dx)
801020f0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020f3:	5b                   	pop    %ebx
801020f4:	5e                   	pop    %esi
801020f5:	5f                   	pop    %edi
801020f6:	5d                   	pop    %ebp
801020f7:	c3                   	ret    
801020f8:	83 ec 0c             	sub    $0xc,%esp
801020fb:	68 70 75 10 80       	push   $0x80107570
80102100:	e8 8b e2 ff ff       	call   80100390 <panic>
80102105:	83 ec 0c             	sub    $0xc,%esp
80102108:	68 67 75 10 80       	push   $0x80107567
8010210d:	e8 7e e2 ff ff       	call   80100390 <panic>
80102112:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102120 <ideinit>:
80102120:	55                   	push   %ebp
80102121:	89 e5                	mov    %esp,%ebp
80102123:	83 ec 10             	sub    $0x10,%esp
80102126:	68 82 75 10 80       	push   $0x80107582
8010212b:	68 80 a5 10 80       	push   $0x8010a580
80102130:	e8 0b 24 00 00       	call   80104540 <initlock>
80102135:	58                   	pop    %eax
80102136:	a1 00 2d 11 80       	mov    0x80112d00,%eax
8010213b:	5a                   	pop    %edx
8010213c:	83 e8 01             	sub    $0x1,%eax
8010213f:	50                   	push   %eax
80102140:	6a 0e                	push   $0xe
80102142:	e8 a9 02 00 00       	call   801023f0 <ioapicenable>
80102147:	83 c4 10             	add    $0x10,%esp
8010214a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010214f:	90                   	nop
80102150:	ec                   	in     (%dx),%al
80102151:	83 e0 c0             	and    $0xffffffc0,%eax
80102154:	3c 40                	cmp    $0x40,%al
80102156:	75 f8                	jne    80102150 <ideinit+0x30>
80102158:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
8010215d:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102162:	ee                   	out    %al,(%dx)
80102163:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102168:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010216d:	eb 06                	jmp    80102175 <ideinit+0x55>
8010216f:	90                   	nop
80102170:	83 e9 01             	sub    $0x1,%ecx
80102173:	74 0f                	je     80102184 <ideinit+0x64>
80102175:	ec                   	in     (%dx),%al
80102176:	84 c0                	test   %al,%al
80102178:	74 f6                	je     80102170 <ideinit+0x50>
8010217a:	c7 05 60 a5 10 80 01 	movl   $0x1,0x8010a560
80102181:	00 00 00 
80102184:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
80102189:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010218e:	ee                   	out    %al,(%dx)
8010218f:	c9                   	leave  
80102190:	c3                   	ret    
80102191:	eb 0d                	jmp    801021a0 <ideintr>
80102193:	90                   	nop
80102194:	90                   	nop
80102195:	90                   	nop
80102196:	90                   	nop
80102197:	90                   	nop
80102198:	90                   	nop
80102199:	90                   	nop
8010219a:	90                   	nop
8010219b:	90                   	nop
8010219c:	90                   	nop
8010219d:	90                   	nop
8010219e:	90                   	nop
8010219f:	90                   	nop

801021a0 <ideintr>:
801021a0:	55                   	push   %ebp
801021a1:	89 e5                	mov    %esp,%ebp
801021a3:	57                   	push   %edi
801021a4:	56                   	push   %esi
801021a5:	53                   	push   %ebx
801021a6:	83 ec 18             	sub    $0x18,%esp
801021a9:	68 80 a5 10 80       	push   $0x8010a580
801021ae:	e8 cd 24 00 00       	call   80104680 <acquire>
801021b3:	8b 1d 64 a5 10 80    	mov    0x8010a564,%ebx
801021b9:	83 c4 10             	add    $0x10,%esp
801021bc:	85 db                	test   %ebx,%ebx
801021be:	74 67                	je     80102227 <ideintr+0x87>
801021c0:	8b 43 58             	mov    0x58(%ebx),%eax
801021c3:	a3 64 a5 10 80       	mov    %eax,0x8010a564
801021c8:	8b 3b                	mov    (%ebx),%edi
801021ca:	f7 c7 04 00 00 00    	test   $0x4,%edi
801021d0:	75 31                	jne    80102203 <ideintr+0x63>
801021d2:	ba f7 01 00 00       	mov    $0x1f7,%edx
801021d7:	89 f6                	mov    %esi,%esi
801021d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801021e0:	ec                   	in     (%dx),%al
801021e1:	89 c6                	mov    %eax,%esi
801021e3:	83 e6 c0             	and    $0xffffffc0,%esi
801021e6:	89 f1                	mov    %esi,%ecx
801021e8:	80 f9 40             	cmp    $0x40,%cl
801021eb:	75 f3                	jne    801021e0 <ideintr+0x40>
801021ed:	a8 21                	test   $0x21,%al
801021ef:	75 12                	jne    80102203 <ideintr+0x63>
801021f1:	8d 7b 5c             	lea    0x5c(%ebx),%edi
801021f4:	b9 80 00 00 00       	mov    $0x80,%ecx
801021f9:	ba f0 01 00 00       	mov    $0x1f0,%edx
801021fe:	fc                   	cld    
801021ff:	f3 6d                	rep insl (%dx),%es:(%edi)
80102201:	8b 3b                	mov    (%ebx),%edi
80102203:	83 e7 fb             	and    $0xfffffffb,%edi
80102206:	83 ec 0c             	sub    $0xc,%esp
80102209:	89 f9                	mov    %edi,%ecx
8010220b:	83 c9 02             	or     $0x2,%ecx
8010220e:	89 0b                	mov    %ecx,(%ebx)
80102210:	53                   	push   %ebx
80102211:	e8 6a 1e 00 00       	call   80104080 <wakeup>
80102216:	a1 64 a5 10 80       	mov    0x8010a564,%eax
8010221b:	83 c4 10             	add    $0x10,%esp
8010221e:	85 c0                	test   %eax,%eax
80102220:	74 05                	je     80102227 <ideintr+0x87>
80102222:	e8 19 fe ff ff       	call   80102040 <idestart>
80102227:	83 ec 0c             	sub    $0xc,%esp
8010222a:	68 80 a5 10 80       	push   $0x8010a580
8010222f:	e8 0c 25 00 00       	call   80104740 <release>
80102234:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102237:	5b                   	pop    %ebx
80102238:	5e                   	pop    %esi
80102239:	5f                   	pop    %edi
8010223a:	5d                   	pop    %ebp
8010223b:	c3                   	ret    
8010223c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102240 <iderw>:
80102240:	55                   	push   %ebp
80102241:	89 e5                	mov    %esp,%ebp
80102243:	53                   	push   %ebx
80102244:	83 ec 10             	sub    $0x10,%esp
80102247:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010224a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010224d:	50                   	push   %eax
8010224e:	e8 9d 22 00 00       	call   801044f0 <holdingsleep>
80102253:	83 c4 10             	add    $0x10,%esp
80102256:	85 c0                	test   %eax,%eax
80102258:	0f 84 c6 00 00 00    	je     80102324 <iderw+0xe4>
8010225e:	8b 03                	mov    (%ebx),%eax
80102260:	83 e0 06             	and    $0x6,%eax
80102263:	83 f8 02             	cmp    $0x2,%eax
80102266:	0f 84 ab 00 00 00    	je     80102317 <iderw+0xd7>
8010226c:	8b 53 04             	mov    0x4(%ebx),%edx
8010226f:	85 d2                	test   %edx,%edx
80102271:	74 0d                	je     80102280 <iderw+0x40>
80102273:	a1 60 a5 10 80       	mov    0x8010a560,%eax
80102278:	85 c0                	test   %eax,%eax
8010227a:	0f 84 b1 00 00 00    	je     80102331 <iderw+0xf1>
80102280:	83 ec 0c             	sub    $0xc,%esp
80102283:	68 80 a5 10 80       	push   $0x8010a580
80102288:	e8 f3 23 00 00       	call   80104680 <acquire>
8010228d:	8b 15 64 a5 10 80    	mov    0x8010a564,%edx
80102293:	83 c4 10             	add    $0x10,%esp
80102296:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
8010229d:	85 d2                	test   %edx,%edx
8010229f:	75 09                	jne    801022aa <iderw+0x6a>
801022a1:	eb 6d                	jmp    80102310 <iderw+0xd0>
801022a3:	90                   	nop
801022a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801022a8:	89 c2                	mov    %eax,%edx
801022aa:	8b 42 58             	mov    0x58(%edx),%eax
801022ad:	85 c0                	test   %eax,%eax
801022af:	75 f7                	jne    801022a8 <iderw+0x68>
801022b1:	83 c2 58             	add    $0x58,%edx
801022b4:	89 1a                	mov    %ebx,(%edx)
801022b6:	39 1d 64 a5 10 80    	cmp    %ebx,0x8010a564
801022bc:	74 42                	je     80102300 <iderw+0xc0>
801022be:	8b 03                	mov    (%ebx),%eax
801022c0:	83 e0 06             	and    $0x6,%eax
801022c3:	83 f8 02             	cmp    $0x2,%eax
801022c6:	74 23                	je     801022eb <iderw+0xab>
801022c8:	90                   	nop
801022c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801022d0:	83 ec 08             	sub    $0x8,%esp
801022d3:	68 80 a5 10 80       	push   $0x8010a580
801022d8:	53                   	push   %ebx
801022d9:	e8 f2 1b 00 00       	call   80103ed0 <sleep>
801022de:	8b 03                	mov    (%ebx),%eax
801022e0:	83 c4 10             	add    $0x10,%esp
801022e3:	83 e0 06             	and    $0x6,%eax
801022e6:	83 f8 02             	cmp    $0x2,%eax
801022e9:	75 e5                	jne    801022d0 <iderw+0x90>
801022eb:	c7 45 08 80 a5 10 80 	movl   $0x8010a580,0x8(%ebp)
801022f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801022f5:	c9                   	leave  
801022f6:	e9 45 24 00 00       	jmp    80104740 <release>
801022fb:	90                   	nop
801022fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102300:	89 d8                	mov    %ebx,%eax
80102302:	e8 39 fd ff ff       	call   80102040 <idestart>
80102307:	eb b5                	jmp    801022be <iderw+0x7e>
80102309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102310:	ba 64 a5 10 80       	mov    $0x8010a564,%edx
80102315:	eb 9d                	jmp    801022b4 <iderw+0x74>
80102317:	83 ec 0c             	sub    $0xc,%esp
8010231a:	68 9c 75 10 80       	push   $0x8010759c
8010231f:	e8 6c e0 ff ff       	call   80100390 <panic>
80102324:	83 ec 0c             	sub    $0xc,%esp
80102327:	68 86 75 10 80       	push   $0x80107586
8010232c:	e8 5f e0 ff ff       	call   80100390 <panic>
80102331:	83 ec 0c             	sub    $0xc,%esp
80102334:	68 b1 75 10 80       	push   $0x801075b1
80102339:	e8 52 e0 ff ff       	call   80100390 <panic>
8010233e:	66 90                	xchg   %ax,%ax

80102340 <ioapicinit>:
80102340:	55                   	push   %ebp
80102341:	c7 05 34 26 11 80 00 	movl   $0xfec00000,0x80112634
80102348:	00 c0 fe 
8010234b:	89 e5                	mov    %esp,%ebp
8010234d:	56                   	push   %esi
8010234e:	53                   	push   %ebx
8010234f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102356:	00 00 00 
80102359:	a1 34 26 11 80       	mov    0x80112634,%eax
8010235e:	8b 58 10             	mov    0x10(%eax),%ebx
80102361:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80102367:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010236d:	0f b6 15 60 27 11 80 	movzbl 0x80112760,%edx
80102374:	c1 eb 10             	shr    $0x10,%ebx
80102377:	8b 41 10             	mov    0x10(%ecx),%eax
8010237a:	0f b6 db             	movzbl %bl,%ebx
8010237d:	c1 e8 18             	shr    $0x18,%eax
80102380:	39 c2                	cmp    %eax,%edx
80102382:	74 16                	je     8010239a <ioapicinit+0x5a>
80102384:	83 ec 0c             	sub    $0xc,%esp
80102387:	68 d0 75 10 80       	push   $0x801075d0
8010238c:	e8 cf e2 ff ff       	call   80100660 <cprintf>
80102391:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
80102397:	83 c4 10             	add    $0x10,%esp
8010239a:	83 c3 21             	add    $0x21,%ebx
8010239d:	ba 10 00 00 00       	mov    $0x10,%edx
801023a2:	b8 20 00 00 00       	mov    $0x20,%eax
801023a7:	89 f6                	mov    %esi,%esi
801023a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801023b0:	89 11                	mov    %edx,(%ecx)
801023b2:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801023b8:	89 c6                	mov    %eax,%esi
801023ba:	81 ce 00 00 01 00    	or     $0x10000,%esi
801023c0:	83 c0 01             	add    $0x1,%eax
801023c3:	89 71 10             	mov    %esi,0x10(%ecx)
801023c6:	8d 72 01             	lea    0x1(%edx),%esi
801023c9:	83 c2 02             	add    $0x2,%edx
801023cc:	39 d8                	cmp    %ebx,%eax
801023ce:	89 31                	mov    %esi,(%ecx)
801023d0:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801023d6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
801023dd:	75 d1                	jne    801023b0 <ioapicinit+0x70>
801023df:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023e2:	5b                   	pop    %ebx
801023e3:	5e                   	pop    %esi
801023e4:	5d                   	pop    %ebp
801023e5:	c3                   	ret    
801023e6:	8d 76 00             	lea    0x0(%esi),%esi
801023e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801023f0 <ioapicenable>:
801023f0:	55                   	push   %ebp
801023f1:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
801023f7:	89 e5                	mov    %esp,%ebp
801023f9:	8b 45 08             	mov    0x8(%ebp),%eax
801023fc:	8d 50 20             	lea    0x20(%eax),%edx
801023ff:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
80102403:	89 01                	mov    %eax,(%ecx)
80102405:	8b 0d 34 26 11 80    	mov    0x80112634,%ecx
8010240b:	83 c0 01             	add    $0x1,%eax
8010240e:	89 51 10             	mov    %edx,0x10(%ecx)
80102411:	8b 55 0c             	mov    0xc(%ebp),%edx
80102414:	89 01                	mov    %eax,(%ecx)
80102416:	a1 34 26 11 80       	mov    0x80112634,%eax
8010241b:	c1 e2 18             	shl    $0x18,%edx
8010241e:	89 50 10             	mov    %edx,0x10(%eax)
80102421:	5d                   	pop    %ebp
80102422:	c3                   	ret    
80102423:	66 90                	xchg   %ax,%ax
80102425:	66 90                	xchg   %ax,%ax
80102427:	66 90                	xchg   %ax,%ax
80102429:	66 90                	xchg   %ax,%ax
8010242b:	66 90                	xchg   %ax,%ax
8010242d:	66 90                	xchg   %ax,%ax
8010242f:	90                   	nop

80102430 <kfree>:
80102430:	55                   	push   %ebp
80102431:	89 e5                	mov    %esp,%ebp
80102433:	53                   	push   %ebx
80102434:	83 ec 04             	sub    $0x4,%esp
80102437:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010243a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102440:	75 70                	jne    801024b2 <kfree+0x82>
80102442:	81 fb a8 55 11 80    	cmp    $0x801155a8,%ebx
80102448:	72 68                	jb     801024b2 <kfree+0x82>
8010244a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102450:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102455:	77 5b                	ja     801024b2 <kfree+0x82>
80102457:	83 ec 04             	sub    $0x4,%esp
8010245a:	68 00 10 00 00       	push   $0x1000
8010245f:	6a 01                	push   $0x1
80102461:	53                   	push   %ebx
80102462:	e8 29 23 00 00       	call   80104790 <memset>
80102467:	8b 15 74 26 11 80    	mov    0x80112674,%edx
8010246d:	83 c4 10             	add    $0x10,%esp
80102470:	85 d2                	test   %edx,%edx
80102472:	75 2c                	jne    801024a0 <kfree+0x70>
80102474:	a1 78 26 11 80       	mov    0x80112678,%eax
80102479:	89 03                	mov    %eax,(%ebx)
8010247b:	a1 74 26 11 80       	mov    0x80112674,%eax
80102480:	89 1d 78 26 11 80    	mov    %ebx,0x80112678
80102486:	85 c0                	test   %eax,%eax
80102488:	75 06                	jne    80102490 <kfree+0x60>
8010248a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010248d:	c9                   	leave  
8010248e:	c3                   	ret    
8010248f:	90                   	nop
80102490:	c7 45 08 40 26 11 80 	movl   $0x80112640,0x8(%ebp)
80102497:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010249a:	c9                   	leave  
8010249b:	e9 a0 22 00 00       	jmp    80104740 <release>
801024a0:	83 ec 0c             	sub    $0xc,%esp
801024a3:	68 40 26 11 80       	push   $0x80112640
801024a8:	e8 d3 21 00 00       	call   80104680 <acquire>
801024ad:	83 c4 10             	add    $0x10,%esp
801024b0:	eb c2                	jmp    80102474 <kfree+0x44>
801024b2:	83 ec 0c             	sub    $0xc,%esp
801024b5:	68 02 76 10 80       	push   $0x80107602
801024ba:	e8 d1 de ff ff       	call   80100390 <panic>
801024bf:	90                   	nop

801024c0 <freerange>:
801024c0:	55                   	push   %ebp
801024c1:	89 e5                	mov    %esp,%ebp
801024c3:	56                   	push   %esi
801024c4:	53                   	push   %ebx
801024c5:	8b 45 08             	mov    0x8(%ebp),%eax
801024c8:	8b 75 0c             	mov    0xc(%ebp),%esi
801024cb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801024d1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801024d7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024dd:	39 de                	cmp    %ebx,%esi
801024df:	72 23                	jb     80102504 <freerange+0x44>
801024e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801024e8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801024ee:	83 ec 0c             	sub    $0xc,%esp
801024f1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024f7:	50                   	push   %eax
801024f8:	e8 33 ff ff ff       	call   80102430 <kfree>
801024fd:	83 c4 10             	add    $0x10,%esp
80102500:	39 f3                	cmp    %esi,%ebx
80102502:	76 e4                	jbe    801024e8 <freerange+0x28>
80102504:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102507:	5b                   	pop    %ebx
80102508:	5e                   	pop    %esi
80102509:	5d                   	pop    %ebp
8010250a:	c3                   	ret    
8010250b:	90                   	nop
8010250c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102510 <kinit1>:
80102510:	55                   	push   %ebp
80102511:	89 e5                	mov    %esp,%ebp
80102513:	56                   	push   %esi
80102514:	53                   	push   %ebx
80102515:	8b 75 0c             	mov    0xc(%ebp),%esi
80102518:	83 ec 08             	sub    $0x8,%esp
8010251b:	68 08 76 10 80       	push   $0x80107608
80102520:	68 40 26 11 80       	push   $0x80112640
80102525:	e8 16 20 00 00       	call   80104540 <initlock>
8010252a:	8b 45 08             	mov    0x8(%ebp),%eax
8010252d:	83 c4 10             	add    $0x10,%esp
80102530:	c7 05 74 26 11 80 00 	movl   $0x0,0x80112674
80102537:	00 00 00 
8010253a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102540:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102546:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010254c:	39 de                	cmp    %ebx,%esi
8010254e:	72 1c                	jb     8010256c <kinit1+0x5c>
80102550:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102556:	83 ec 0c             	sub    $0xc,%esp
80102559:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010255f:	50                   	push   %eax
80102560:	e8 cb fe ff ff       	call   80102430 <kfree>
80102565:	83 c4 10             	add    $0x10,%esp
80102568:	39 de                	cmp    %ebx,%esi
8010256a:	73 e4                	jae    80102550 <kinit1+0x40>
8010256c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010256f:	5b                   	pop    %ebx
80102570:	5e                   	pop    %esi
80102571:	5d                   	pop    %ebp
80102572:	c3                   	ret    
80102573:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102580 <kinit2>:
80102580:	55                   	push   %ebp
80102581:	89 e5                	mov    %esp,%ebp
80102583:	56                   	push   %esi
80102584:	53                   	push   %ebx
80102585:	8b 45 08             	mov    0x8(%ebp),%eax
80102588:	8b 75 0c             	mov    0xc(%ebp),%esi
8010258b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102591:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102597:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010259d:	39 de                	cmp    %ebx,%esi
8010259f:	72 23                	jb     801025c4 <kinit2+0x44>
801025a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801025a8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801025ae:	83 ec 0c             	sub    $0xc,%esp
801025b1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801025b7:	50                   	push   %eax
801025b8:	e8 73 fe ff ff       	call   80102430 <kfree>
801025bd:	83 c4 10             	add    $0x10,%esp
801025c0:	39 de                	cmp    %ebx,%esi
801025c2:	73 e4                	jae    801025a8 <kinit2+0x28>
801025c4:	c7 05 74 26 11 80 01 	movl   $0x1,0x80112674
801025cb:	00 00 00 
801025ce:	8d 65 f8             	lea    -0x8(%ebp),%esp
801025d1:	5b                   	pop    %ebx
801025d2:	5e                   	pop    %esi
801025d3:	5d                   	pop    %ebp
801025d4:	c3                   	ret    
801025d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801025e0 <kalloc>:
801025e0:	a1 74 26 11 80       	mov    0x80112674,%eax
801025e5:	85 c0                	test   %eax,%eax
801025e7:	75 1f                	jne    80102608 <kalloc+0x28>
801025e9:	a1 78 26 11 80       	mov    0x80112678,%eax
801025ee:	85 c0                	test   %eax,%eax
801025f0:	74 0e                	je     80102600 <kalloc+0x20>
801025f2:	8b 10                	mov    (%eax),%edx
801025f4:	89 15 78 26 11 80    	mov    %edx,0x80112678
801025fa:	c3                   	ret    
801025fb:	90                   	nop
801025fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102600:	f3 c3                	repz ret 
80102602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102608:	55                   	push   %ebp
80102609:	89 e5                	mov    %esp,%ebp
8010260b:	83 ec 24             	sub    $0x24,%esp
8010260e:	68 40 26 11 80       	push   $0x80112640
80102613:	e8 68 20 00 00       	call   80104680 <acquire>
80102618:	a1 78 26 11 80       	mov    0x80112678,%eax
8010261d:	83 c4 10             	add    $0x10,%esp
80102620:	8b 15 74 26 11 80    	mov    0x80112674,%edx
80102626:	85 c0                	test   %eax,%eax
80102628:	74 08                	je     80102632 <kalloc+0x52>
8010262a:	8b 08                	mov    (%eax),%ecx
8010262c:	89 0d 78 26 11 80    	mov    %ecx,0x80112678
80102632:	85 d2                	test   %edx,%edx
80102634:	74 16                	je     8010264c <kalloc+0x6c>
80102636:	83 ec 0c             	sub    $0xc,%esp
80102639:	89 45 f4             	mov    %eax,-0xc(%ebp)
8010263c:	68 40 26 11 80       	push   $0x80112640
80102641:	e8 fa 20 00 00       	call   80104740 <release>
80102646:	8b 45 f4             	mov    -0xc(%ebp),%eax
80102649:	83 c4 10             	add    $0x10,%esp
8010264c:	c9                   	leave  
8010264d:	c3                   	ret    
8010264e:	66 90                	xchg   %ax,%ax

80102650 <kbdgetc>:
80102650:	ba 64 00 00 00       	mov    $0x64,%edx
80102655:	ec                   	in     (%dx),%al
80102656:	a8 01                	test   $0x1,%al
80102658:	0f 84 c2 00 00 00    	je     80102720 <kbdgetc+0xd0>
8010265e:	ba 60 00 00 00       	mov    $0x60,%edx
80102663:	ec                   	in     (%dx),%al
80102664:	0f b6 d0             	movzbl %al,%edx
80102667:	8b 0d b4 a5 10 80    	mov    0x8010a5b4,%ecx
8010266d:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102673:	0f 84 7f 00 00 00    	je     801026f8 <kbdgetc+0xa8>
80102679:	55                   	push   %ebp
8010267a:	89 e5                	mov    %esp,%ebp
8010267c:	53                   	push   %ebx
8010267d:	89 cb                	mov    %ecx,%ebx
8010267f:	83 e3 40             	and    $0x40,%ebx
80102682:	84 c0                	test   %al,%al
80102684:	78 4a                	js     801026d0 <kbdgetc+0x80>
80102686:	85 db                	test   %ebx,%ebx
80102688:	74 09                	je     80102693 <kbdgetc+0x43>
8010268a:	83 c8 80             	or     $0xffffff80,%eax
8010268d:	83 e1 bf             	and    $0xffffffbf,%ecx
80102690:	0f b6 d0             	movzbl %al,%edx
80102693:	0f b6 82 40 77 10 80 	movzbl -0x7fef88c0(%edx),%eax
8010269a:	09 c1                	or     %eax,%ecx
8010269c:	0f b6 82 40 76 10 80 	movzbl -0x7fef89c0(%edx),%eax
801026a3:	31 c1                	xor    %eax,%ecx
801026a5:	89 c8                	mov    %ecx,%eax
801026a7:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
801026ad:	83 e0 03             	and    $0x3,%eax
801026b0:	83 e1 08             	and    $0x8,%ecx
801026b3:	8b 04 85 20 76 10 80 	mov    -0x7fef89e0(,%eax,4),%eax
801026ba:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
801026be:	74 31                	je     801026f1 <kbdgetc+0xa1>
801026c0:	8d 50 9f             	lea    -0x61(%eax),%edx
801026c3:	83 fa 19             	cmp    $0x19,%edx
801026c6:	77 40                	ja     80102708 <kbdgetc+0xb8>
801026c8:	83 e8 20             	sub    $0x20,%eax
801026cb:	5b                   	pop    %ebx
801026cc:	5d                   	pop    %ebp
801026cd:	c3                   	ret    
801026ce:	66 90                	xchg   %ax,%ax
801026d0:	83 e0 7f             	and    $0x7f,%eax
801026d3:	85 db                	test   %ebx,%ebx
801026d5:	0f 44 d0             	cmove  %eax,%edx
801026d8:	0f b6 82 40 77 10 80 	movzbl -0x7fef88c0(%edx),%eax
801026df:	83 c8 40             	or     $0x40,%eax
801026e2:	0f b6 c0             	movzbl %al,%eax
801026e5:	f7 d0                	not    %eax
801026e7:	21 c1                	and    %eax,%ecx
801026e9:	31 c0                	xor    %eax,%eax
801026eb:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
801026f1:	5b                   	pop    %ebx
801026f2:	5d                   	pop    %ebp
801026f3:	c3                   	ret    
801026f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801026f8:	83 c9 40             	or     $0x40,%ecx
801026fb:	31 c0                	xor    %eax,%eax
801026fd:	89 0d b4 a5 10 80    	mov    %ecx,0x8010a5b4
80102703:	c3                   	ret    
80102704:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102708:	8d 48 bf             	lea    -0x41(%eax),%ecx
8010270b:	8d 50 20             	lea    0x20(%eax),%edx
8010270e:	5b                   	pop    %ebx
8010270f:	83 f9 1a             	cmp    $0x1a,%ecx
80102712:	0f 42 c2             	cmovb  %edx,%eax
80102715:	5d                   	pop    %ebp
80102716:	c3                   	ret    
80102717:	89 f6                	mov    %esi,%esi
80102719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102720:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102725:	c3                   	ret    
80102726:	8d 76 00             	lea    0x0(%esi),%esi
80102729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102730 <kbdintr>:
80102730:	55                   	push   %ebp
80102731:	89 e5                	mov    %esp,%ebp
80102733:	83 ec 14             	sub    $0x14,%esp
80102736:	68 50 26 10 80       	push   $0x80102650
8010273b:	e8 d0 e0 ff ff       	call   80100810 <consoleintr>
80102740:	83 c4 10             	add    $0x10,%esp
80102743:	c9                   	leave  
80102744:	c3                   	ret    
80102745:	66 90                	xchg   %ax,%ax
80102747:	66 90                	xchg   %ax,%ax
80102749:	66 90                	xchg   %ax,%ax
8010274b:	66 90                	xchg   %ax,%ax
8010274d:	66 90                	xchg   %ax,%ax
8010274f:	90                   	nop

80102750 <lapicinit>:
80102750:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102755:	55                   	push   %ebp
80102756:	89 e5                	mov    %esp,%ebp
80102758:	85 c0                	test   %eax,%eax
8010275a:	0f 84 c8 00 00 00    	je     80102828 <lapicinit+0xd8>
80102760:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102767:	01 00 00 
8010276a:	8b 50 20             	mov    0x20(%eax),%edx
8010276d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102774:	00 00 00 
80102777:	8b 50 20             	mov    0x20(%eax),%edx
8010277a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102781:	00 02 00 
80102784:	8b 50 20             	mov    0x20(%eax),%edx
80102787:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010278e:	96 98 00 
80102791:	8b 50 20             	mov    0x20(%eax),%edx
80102794:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010279b:	00 01 00 
8010279e:	8b 50 20             	mov    0x20(%eax),%edx
801027a1:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
801027a8:	00 01 00 
801027ab:	8b 50 20             	mov    0x20(%eax),%edx
801027ae:	8b 50 30             	mov    0x30(%eax),%edx
801027b1:	c1 ea 10             	shr    $0x10,%edx
801027b4:	80 fa 03             	cmp    $0x3,%dl
801027b7:	77 77                	ja     80102830 <lapicinit+0xe0>
801027b9:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801027c0:	00 00 00 
801027c3:	8b 50 20             	mov    0x20(%eax),%edx
801027c6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801027cd:	00 00 00 
801027d0:	8b 50 20             	mov    0x20(%eax),%edx
801027d3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801027da:	00 00 00 
801027dd:	8b 50 20             	mov    0x20(%eax),%edx
801027e0:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801027e7:	00 00 00 
801027ea:	8b 50 20             	mov    0x20(%eax),%edx
801027ed:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801027f4:	00 00 00 
801027f7:	8b 50 20             	mov    0x20(%eax),%edx
801027fa:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
80102801:	85 08 00 
80102804:	8b 50 20             	mov    0x20(%eax),%edx
80102807:	89 f6                	mov    %esi,%esi
80102809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102810:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
80102816:	80 e6 10             	and    $0x10,%dh
80102819:	75 f5                	jne    80102810 <lapicinit+0xc0>
8010281b:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102822:	00 00 00 
80102825:	8b 40 20             	mov    0x20(%eax),%eax
80102828:	5d                   	pop    %ebp
80102829:	c3                   	ret    
8010282a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102830:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102837:	00 01 00 
8010283a:	8b 50 20             	mov    0x20(%eax),%edx
8010283d:	e9 77 ff ff ff       	jmp    801027b9 <lapicinit+0x69>
80102842:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102850 <lapicid>:
80102850:	8b 15 7c 26 11 80    	mov    0x8011267c,%edx
80102856:	55                   	push   %ebp
80102857:	31 c0                	xor    %eax,%eax
80102859:	89 e5                	mov    %esp,%ebp
8010285b:	85 d2                	test   %edx,%edx
8010285d:	74 06                	je     80102865 <lapicid+0x15>
8010285f:	8b 42 20             	mov    0x20(%edx),%eax
80102862:	c1 e8 18             	shr    $0x18,%eax
80102865:	5d                   	pop    %ebp
80102866:	c3                   	ret    
80102867:	89 f6                	mov    %esi,%esi
80102869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102870 <lapiceoi>:
80102870:	a1 7c 26 11 80       	mov    0x8011267c,%eax
80102875:	55                   	push   %ebp
80102876:	89 e5                	mov    %esp,%ebp
80102878:	85 c0                	test   %eax,%eax
8010287a:	74 0d                	je     80102889 <lapiceoi+0x19>
8010287c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102883:	00 00 00 
80102886:	8b 40 20             	mov    0x20(%eax),%eax
80102889:	5d                   	pop    %ebp
8010288a:	c3                   	ret    
8010288b:	90                   	nop
8010288c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102890 <microdelay>:
80102890:	55                   	push   %ebp
80102891:	89 e5                	mov    %esp,%ebp
80102893:	5d                   	pop    %ebp
80102894:	c3                   	ret    
80102895:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801028a0 <lapicstartap>:
801028a0:	55                   	push   %ebp
801028a1:	b8 0f 00 00 00       	mov    $0xf,%eax
801028a6:	ba 70 00 00 00       	mov    $0x70,%edx
801028ab:	89 e5                	mov    %esp,%ebp
801028ad:	53                   	push   %ebx
801028ae:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801028b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801028b4:	ee                   	out    %al,(%dx)
801028b5:	b8 0a 00 00 00       	mov    $0xa,%eax
801028ba:	ba 71 00 00 00       	mov    $0x71,%edx
801028bf:	ee                   	out    %al,(%dx)
801028c0:	31 c0                	xor    %eax,%eax
801028c2:	c1 e3 18             	shl    $0x18,%ebx
801028c5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
801028cb:	89 c8                	mov    %ecx,%eax
801028cd:	c1 e9 0c             	shr    $0xc,%ecx
801028d0:	c1 e8 04             	shr    $0x4,%eax
801028d3:	89 da                	mov    %ebx,%edx
801028d5:	80 cd 06             	or     $0x6,%ch
801028d8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
801028de:	a1 7c 26 11 80       	mov    0x8011267c,%eax
801028e3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
801028e9:	8b 58 20             	mov    0x20(%eax),%ebx
801028ec:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801028f3:	c5 00 00 
801028f6:	8b 58 20             	mov    0x20(%eax),%ebx
801028f9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
80102900:	85 00 00 
80102903:	8b 58 20             	mov    0x20(%eax),%ebx
80102906:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010290c:	8b 58 20             	mov    0x20(%eax),%ebx
8010290f:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102915:	8b 58 20             	mov    0x20(%eax),%ebx
80102918:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
8010291e:	8b 50 20             	mov    0x20(%eax),%edx
80102921:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102927:	8b 40 20             	mov    0x20(%eax),%eax
8010292a:	5b                   	pop    %ebx
8010292b:	5d                   	pop    %ebp
8010292c:	c3                   	ret    
8010292d:	8d 76 00             	lea    0x0(%esi),%esi

80102930 <cmostime>:
80102930:	55                   	push   %ebp
80102931:	b8 0b 00 00 00       	mov    $0xb,%eax
80102936:	ba 70 00 00 00       	mov    $0x70,%edx
8010293b:	89 e5                	mov    %esp,%ebp
8010293d:	57                   	push   %edi
8010293e:	56                   	push   %esi
8010293f:	53                   	push   %ebx
80102940:	83 ec 4c             	sub    $0x4c,%esp
80102943:	ee                   	out    %al,(%dx)
80102944:	ba 71 00 00 00       	mov    $0x71,%edx
80102949:	ec                   	in     (%dx),%al
8010294a:	83 e0 04             	and    $0x4,%eax
8010294d:	bb 70 00 00 00       	mov    $0x70,%ebx
80102952:	88 45 b3             	mov    %al,-0x4d(%ebp)
80102955:	8d 76 00             	lea    0x0(%esi),%esi
80102958:	31 c0                	xor    %eax,%eax
8010295a:	89 da                	mov    %ebx,%edx
8010295c:	ee                   	out    %al,(%dx)
8010295d:	b9 71 00 00 00       	mov    $0x71,%ecx
80102962:	89 ca                	mov    %ecx,%edx
80102964:	ec                   	in     (%dx),%al
80102965:	88 45 b7             	mov    %al,-0x49(%ebp)
80102968:	89 da                	mov    %ebx,%edx
8010296a:	b8 02 00 00 00       	mov    $0x2,%eax
8010296f:	ee                   	out    %al,(%dx)
80102970:	89 ca                	mov    %ecx,%edx
80102972:	ec                   	in     (%dx),%al
80102973:	88 45 b6             	mov    %al,-0x4a(%ebp)
80102976:	89 da                	mov    %ebx,%edx
80102978:	b8 04 00 00 00       	mov    $0x4,%eax
8010297d:	ee                   	out    %al,(%dx)
8010297e:	89 ca                	mov    %ecx,%edx
80102980:	ec                   	in     (%dx),%al
80102981:	88 45 b5             	mov    %al,-0x4b(%ebp)
80102984:	89 da                	mov    %ebx,%edx
80102986:	b8 07 00 00 00       	mov    $0x7,%eax
8010298b:	ee                   	out    %al,(%dx)
8010298c:	89 ca                	mov    %ecx,%edx
8010298e:	ec                   	in     (%dx),%al
8010298f:	88 45 b4             	mov    %al,-0x4c(%ebp)
80102992:	89 da                	mov    %ebx,%edx
80102994:	b8 08 00 00 00       	mov    $0x8,%eax
80102999:	ee                   	out    %al,(%dx)
8010299a:	89 ca                	mov    %ecx,%edx
8010299c:	ec                   	in     (%dx),%al
8010299d:	89 c7                	mov    %eax,%edi
8010299f:	89 da                	mov    %ebx,%edx
801029a1:	b8 09 00 00 00       	mov    $0x9,%eax
801029a6:	ee                   	out    %al,(%dx)
801029a7:	89 ca                	mov    %ecx,%edx
801029a9:	ec                   	in     (%dx),%al
801029aa:	89 c6                	mov    %eax,%esi
801029ac:	89 da                	mov    %ebx,%edx
801029ae:	b8 0a 00 00 00       	mov    $0xa,%eax
801029b3:	ee                   	out    %al,(%dx)
801029b4:	89 ca                	mov    %ecx,%edx
801029b6:	ec                   	in     (%dx),%al
801029b7:	84 c0                	test   %al,%al
801029b9:	78 9d                	js     80102958 <cmostime+0x28>
801029bb:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
801029bf:	89 fa                	mov    %edi,%edx
801029c1:	0f b6 fa             	movzbl %dl,%edi
801029c4:	89 f2                	mov    %esi,%edx
801029c6:	0f b6 f2             	movzbl %dl,%esi
801029c9:	89 7d c8             	mov    %edi,-0x38(%ebp)
801029cc:	89 da                	mov    %ebx,%edx
801029ce:	89 75 cc             	mov    %esi,-0x34(%ebp)
801029d1:	89 45 b8             	mov    %eax,-0x48(%ebp)
801029d4:	0f b6 45 b6          	movzbl -0x4a(%ebp),%eax
801029d8:	89 45 bc             	mov    %eax,-0x44(%ebp)
801029db:	0f b6 45 b5          	movzbl -0x4b(%ebp),%eax
801029df:	89 45 c0             	mov    %eax,-0x40(%ebp)
801029e2:	0f b6 45 b4          	movzbl -0x4c(%ebp),%eax
801029e6:	89 45 c4             	mov    %eax,-0x3c(%ebp)
801029e9:	31 c0                	xor    %eax,%eax
801029eb:	ee                   	out    %al,(%dx)
801029ec:	89 ca                	mov    %ecx,%edx
801029ee:	ec                   	in     (%dx),%al
801029ef:	0f b6 c0             	movzbl %al,%eax
801029f2:	89 da                	mov    %ebx,%edx
801029f4:	89 45 d0             	mov    %eax,-0x30(%ebp)
801029f7:	b8 02 00 00 00       	mov    $0x2,%eax
801029fc:	ee                   	out    %al,(%dx)
801029fd:	89 ca                	mov    %ecx,%edx
801029ff:	ec                   	in     (%dx),%al
80102a00:	0f b6 c0             	movzbl %al,%eax
80102a03:	89 da                	mov    %ebx,%edx
80102a05:	89 45 d4             	mov    %eax,-0x2c(%ebp)
80102a08:	b8 04 00 00 00       	mov    $0x4,%eax
80102a0d:	ee                   	out    %al,(%dx)
80102a0e:	89 ca                	mov    %ecx,%edx
80102a10:	ec                   	in     (%dx),%al
80102a11:	0f b6 c0             	movzbl %al,%eax
80102a14:	89 da                	mov    %ebx,%edx
80102a16:	89 45 d8             	mov    %eax,-0x28(%ebp)
80102a19:	b8 07 00 00 00       	mov    $0x7,%eax
80102a1e:	ee                   	out    %al,(%dx)
80102a1f:	89 ca                	mov    %ecx,%edx
80102a21:	ec                   	in     (%dx),%al
80102a22:	0f b6 c0             	movzbl %al,%eax
80102a25:	89 da                	mov    %ebx,%edx
80102a27:	89 45 dc             	mov    %eax,-0x24(%ebp)
80102a2a:	b8 08 00 00 00       	mov    $0x8,%eax
80102a2f:	ee                   	out    %al,(%dx)
80102a30:	89 ca                	mov    %ecx,%edx
80102a32:	ec                   	in     (%dx),%al
80102a33:	0f b6 c0             	movzbl %al,%eax
80102a36:	89 da                	mov    %ebx,%edx
80102a38:	89 45 e0             	mov    %eax,-0x20(%ebp)
80102a3b:	b8 09 00 00 00       	mov    $0x9,%eax
80102a40:	ee                   	out    %al,(%dx)
80102a41:	89 ca                	mov    %ecx,%edx
80102a43:	ec                   	in     (%dx),%al
80102a44:	0f b6 c0             	movzbl %al,%eax
80102a47:	83 ec 04             	sub    $0x4,%esp
80102a4a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80102a4d:	8d 45 d0             	lea    -0x30(%ebp),%eax
80102a50:	6a 18                	push   $0x18
80102a52:	50                   	push   %eax
80102a53:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102a56:	50                   	push   %eax
80102a57:	e8 84 1d 00 00       	call   801047e0 <memcmp>
80102a5c:	83 c4 10             	add    $0x10,%esp
80102a5f:	85 c0                	test   %eax,%eax
80102a61:	0f 85 f1 fe ff ff    	jne    80102958 <cmostime+0x28>
80102a67:	80 7d b3 00          	cmpb   $0x0,-0x4d(%ebp)
80102a6b:	75 78                	jne    80102ae5 <cmostime+0x1b5>
80102a6d:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102a70:	89 c2                	mov    %eax,%edx
80102a72:	83 e0 0f             	and    $0xf,%eax
80102a75:	c1 ea 04             	shr    $0x4,%edx
80102a78:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a7b:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a7e:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102a81:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102a84:	89 c2                	mov    %eax,%edx
80102a86:	83 e0 0f             	and    $0xf,%eax
80102a89:	c1 ea 04             	shr    $0x4,%edx
80102a8c:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102a8f:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102a92:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102a95:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102a98:	89 c2                	mov    %eax,%edx
80102a9a:	83 e0 0f             	and    $0xf,%eax
80102a9d:	c1 ea 04             	shr    $0x4,%edx
80102aa0:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102aa3:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102aa6:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102aa9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102aac:	89 c2                	mov    %eax,%edx
80102aae:	83 e0 0f             	and    $0xf,%eax
80102ab1:	c1 ea 04             	shr    $0x4,%edx
80102ab4:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102ab7:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102aba:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102abd:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102ac0:	89 c2                	mov    %eax,%edx
80102ac2:	83 e0 0f             	and    $0xf,%eax
80102ac5:	c1 ea 04             	shr    $0x4,%edx
80102ac8:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102acb:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102ace:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102ad1:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102ad4:	89 c2                	mov    %eax,%edx
80102ad6:	83 e0 0f             	and    $0xf,%eax
80102ad9:	c1 ea 04             	shr    $0x4,%edx
80102adc:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102adf:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102ae2:	89 45 cc             	mov    %eax,-0x34(%ebp)
80102ae5:	8b 75 08             	mov    0x8(%ebp),%esi
80102ae8:	8b 45 b8             	mov    -0x48(%ebp),%eax
80102aeb:	89 06                	mov    %eax,(%esi)
80102aed:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102af0:	89 46 04             	mov    %eax,0x4(%esi)
80102af3:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102af6:	89 46 08             	mov    %eax,0x8(%esi)
80102af9:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102afc:	89 46 0c             	mov    %eax,0xc(%esi)
80102aff:	8b 45 c8             	mov    -0x38(%ebp),%eax
80102b02:	89 46 10             	mov    %eax,0x10(%esi)
80102b05:	8b 45 cc             	mov    -0x34(%ebp),%eax
80102b08:	89 46 14             	mov    %eax,0x14(%esi)
80102b0b:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
80102b12:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102b15:	5b                   	pop    %ebx
80102b16:	5e                   	pop    %esi
80102b17:	5f                   	pop    %edi
80102b18:	5d                   	pop    %ebp
80102b19:	c3                   	ret    
80102b1a:	66 90                	xchg   %ax,%ax
80102b1c:	66 90                	xchg   %ax,%ax
80102b1e:	66 90                	xchg   %ax,%ax

80102b20 <install_trans>:
80102b20:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102b26:	85 c9                	test   %ecx,%ecx
80102b28:	0f 8e 8a 00 00 00    	jle    80102bb8 <install_trans+0x98>
80102b2e:	55                   	push   %ebp
80102b2f:	89 e5                	mov    %esp,%ebp
80102b31:	57                   	push   %edi
80102b32:	56                   	push   %esi
80102b33:	53                   	push   %ebx
80102b34:	31 db                	xor    %ebx,%ebx
80102b36:	83 ec 0c             	sub    $0xc,%esp
80102b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102b40:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102b45:	83 ec 08             	sub    $0x8,%esp
80102b48:	01 d8                	add    %ebx,%eax
80102b4a:	83 c0 01             	add    $0x1,%eax
80102b4d:	50                   	push   %eax
80102b4e:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102b54:	e8 77 d5 ff ff       	call   801000d0 <bread>
80102b59:	89 c7                	mov    %eax,%edi
80102b5b:	58                   	pop    %eax
80102b5c:	5a                   	pop    %edx
80102b5d:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102b64:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102b6a:	83 c3 01             	add    $0x1,%ebx
80102b6d:	e8 5e d5 ff ff       	call   801000d0 <bread>
80102b72:	89 c6                	mov    %eax,%esi
80102b74:	8d 47 5c             	lea    0x5c(%edi),%eax
80102b77:	83 c4 0c             	add    $0xc,%esp
80102b7a:	68 00 02 00 00       	push   $0x200
80102b7f:	50                   	push   %eax
80102b80:	8d 46 5c             	lea    0x5c(%esi),%eax
80102b83:	50                   	push   %eax
80102b84:	e8 b7 1c 00 00       	call   80104840 <memmove>
80102b89:	89 34 24             	mov    %esi,(%esp)
80102b8c:	e8 0f d6 ff ff       	call   801001a0 <bwrite>
80102b91:	89 3c 24             	mov    %edi,(%esp)
80102b94:	e8 47 d6 ff ff       	call   801001e0 <brelse>
80102b99:	89 34 24             	mov    %esi,(%esp)
80102b9c:	e8 3f d6 ff ff       	call   801001e0 <brelse>
80102ba1:	83 c4 10             	add    $0x10,%esp
80102ba4:	39 1d c8 26 11 80    	cmp    %ebx,0x801126c8
80102baa:	7f 94                	jg     80102b40 <install_trans+0x20>
80102bac:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102baf:	5b                   	pop    %ebx
80102bb0:	5e                   	pop    %esi
80102bb1:	5f                   	pop    %edi
80102bb2:	5d                   	pop    %ebp
80102bb3:	c3                   	ret    
80102bb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102bb8:	f3 c3                	repz ret 
80102bba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80102bc0 <write_head>:
80102bc0:	55                   	push   %ebp
80102bc1:	89 e5                	mov    %esp,%ebp
80102bc3:	56                   	push   %esi
80102bc4:	53                   	push   %ebx
80102bc5:	83 ec 08             	sub    $0x8,%esp
80102bc8:	ff 35 b4 26 11 80    	pushl  0x801126b4
80102bce:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102bd4:	e8 f7 d4 ff ff       	call   801000d0 <bread>
80102bd9:	8b 1d c8 26 11 80    	mov    0x801126c8,%ebx
80102bdf:	83 c4 10             	add    $0x10,%esp
80102be2:	89 c6                	mov    %eax,%esi
80102be4:	85 db                	test   %ebx,%ebx
80102be6:	89 58 5c             	mov    %ebx,0x5c(%eax)
80102be9:	7e 16                	jle    80102c01 <write_head+0x41>
80102beb:	c1 e3 02             	shl    $0x2,%ebx
80102bee:	31 d2                	xor    %edx,%edx
80102bf0:	8b 8a cc 26 11 80    	mov    -0x7feed934(%edx),%ecx
80102bf6:	89 4c 16 60          	mov    %ecx,0x60(%esi,%edx,1)
80102bfa:	83 c2 04             	add    $0x4,%edx
80102bfd:	39 da                	cmp    %ebx,%edx
80102bff:	75 ef                	jne    80102bf0 <write_head+0x30>
80102c01:	83 ec 0c             	sub    $0xc,%esp
80102c04:	56                   	push   %esi
80102c05:	e8 96 d5 ff ff       	call   801001a0 <bwrite>
80102c0a:	89 34 24             	mov    %esi,(%esp)
80102c0d:	e8 ce d5 ff ff       	call   801001e0 <brelse>
80102c12:	83 c4 10             	add    $0x10,%esp
80102c15:	8d 65 f8             	lea    -0x8(%ebp),%esp
80102c18:	5b                   	pop    %ebx
80102c19:	5e                   	pop    %esi
80102c1a:	5d                   	pop    %ebp
80102c1b:	c3                   	ret    
80102c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102c20 <initlog>:
80102c20:	55                   	push   %ebp
80102c21:	89 e5                	mov    %esp,%ebp
80102c23:	53                   	push   %ebx
80102c24:	83 ec 2c             	sub    $0x2c,%esp
80102c27:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102c2a:	68 40 78 10 80       	push   $0x80107840
80102c2f:	68 80 26 11 80       	push   $0x80112680
80102c34:	e8 07 19 00 00       	call   80104540 <initlock>
80102c39:	58                   	pop    %eax
80102c3a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102c3d:	5a                   	pop    %edx
80102c3e:	50                   	push   %eax
80102c3f:	53                   	push   %ebx
80102c40:	e8 8b e7 ff ff       	call   801013d0 <readsb>
80102c45:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102c48:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102c4b:	59                   	pop    %ecx
80102c4c:	89 1d c4 26 11 80    	mov    %ebx,0x801126c4
80102c52:	89 15 b8 26 11 80    	mov    %edx,0x801126b8
80102c58:	a3 b4 26 11 80       	mov    %eax,0x801126b4
80102c5d:	5a                   	pop    %edx
80102c5e:	50                   	push   %eax
80102c5f:	53                   	push   %ebx
80102c60:	e8 6b d4 ff ff       	call   801000d0 <bread>
80102c65:	8b 58 5c             	mov    0x5c(%eax),%ebx
80102c68:	83 c4 10             	add    $0x10,%esp
80102c6b:	85 db                	test   %ebx,%ebx
80102c6d:	89 1d c8 26 11 80    	mov    %ebx,0x801126c8
80102c73:	7e 1c                	jle    80102c91 <initlog+0x71>
80102c75:	c1 e3 02             	shl    $0x2,%ebx
80102c78:	31 d2                	xor    %edx,%edx
80102c7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102c80:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102c84:	83 c2 04             	add    $0x4,%edx
80102c87:	89 8a c8 26 11 80    	mov    %ecx,-0x7feed938(%edx)
80102c8d:	39 d3                	cmp    %edx,%ebx
80102c8f:	75 ef                	jne    80102c80 <initlog+0x60>
80102c91:	83 ec 0c             	sub    $0xc,%esp
80102c94:	50                   	push   %eax
80102c95:	e8 46 d5 ff ff       	call   801001e0 <brelse>
80102c9a:	e8 81 fe ff ff       	call   80102b20 <install_trans>
80102c9f:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102ca6:	00 00 00 
80102ca9:	e8 12 ff ff ff       	call   80102bc0 <write_head>
80102cae:	83 c4 10             	add    $0x10,%esp
80102cb1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102cb4:	c9                   	leave  
80102cb5:	c3                   	ret    
80102cb6:	8d 76 00             	lea    0x0(%esi),%esi
80102cb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102cc0 <begin_op>:
80102cc0:	55                   	push   %ebp
80102cc1:	89 e5                	mov    %esp,%ebp
80102cc3:	83 ec 14             	sub    $0x14,%esp
80102cc6:	68 80 26 11 80       	push   $0x80112680
80102ccb:	e8 b0 19 00 00       	call   80104680 <acquire>
80102cd0:	83 c4 10             	add    $0x10,%esp
80102cd3:	eb 18                	jmp    80102ced <begin_op+0x2d>
80102cd5:	8d 76 00             	lea    0x0(%esi),%esi
80102cd8:	83 ec 08             	sub    $0x8,%esp
80102cdb:	68 80 26 11 80       	push   $0x80112680
80102ce0:	68 80 26 11 80       	push   $0x80112680
80102ce5:	e8 e6 11 00 00       	call   80103ed0 <sleep>
80102cea:	83 c4 10             	add    $0x10,%esp
80102ced:	a1 c0 26 11 80       	mov    0x801126c0,%eax
80102cf2:	85 c0                	test   %eax,%eax
80102cf4:	75 e2                	jne    80102cd8 <begin_op+0x18>
80102cf6:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102cfb:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102d01:	83 c0 01             	add    $0x1,%eax
80102d04:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102d07:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102d0a:	83 fa 1e             	cmp    $0x1e,%edx
80102d0d:	7f c9                	jg     80102cd8 <begin_op+0x18>
80102d0f:	83 ec 0c             	sub    $0xc,%esp
80102d12:	a3 bc 26 11 80       	mov    %eax,0x801126bc
80102d17:	68 80 26 11 80       	push   $0x80112680
80102d1c:	e8 1f 1a 00 00       	call   80104740 <release>
80102d21:	83 c4 10             	add    $0x10,%esp
80102d24:	c9                   	leave  
80102d25:	c3                   	ret    
80102d26:	8d 76 00             	lea    0x0(%esi),%esi
80102d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102d30 <end_op>:
80102d30:	55                   	push   %ebp
80102d31:	89 e5                	mov    %esp,%ebp
80102d33:	57                   	push   %edi
80102d34:	56                   	push   %esi
80102d35:	53                   	push   %ebx
80102d36:	83 ec 18             	sub    $0x18,%esp
80102d39:	68 80 26 11 80       	push   $0x80112680
80102d3e:	e8 3d 19 00 00       	call   80104680 <acquire>
80102d43:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102d48:	8b 35 c0 26 11 80    	mov    0x801126c0,%esi
80102d4e:	83 c4 10             	add    $0x10,%esp
80102d51:	8d 58 ff             	lea    -0x1(%eax),%ebx
80102d54:	85 f6                	test   %esi,%esi
80102d56:	89 1d bc 26 11 80    	mov    %ebx,0x801126bc
80102d5c:	0f 85 1a 01 00 00    	jne    80102e7c <end_op+0x14c>
80102d62:	85 db                	test   %ebx,%ebx
80102d64:	0f 85 ee 00 00 00    	jne    80102e58 <end_op+0x128>
80102d6a:	83 ec 0c             	sub    $0xc,%esp
80102d6d:	c7 05 c0 26 11 80 01 	movl   $0x1,0x801126c0
80102d74:	00 00 00 
80102d77:	68 80 26 11 80       	push   $0x80112680
80102d7c:	e8 bf 19 00 00       	call   80104740 <release>
80102d81:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102d87:	83 c4 10             	add    $0x10,%esp
80102d8a:	85 c9                	test   %ecx,%ecx
80102d8c:	0f 8e 85 00 00 00    	jle    80102e17 <end_op+0xe7>
80102d92:	a1 b4 26 11 80       	mov    0x801126b4,%eax
80102d97:	83 ec 08             	sub    $0x8,%esp
80102d9a:	01 d8                	add    %ebx,%eax
80102d9c:	83 c0 01             	add    $0x1,%eax
80102d9f:	50                   	push   %eax
80102da0:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102da6:	e8 25 d3 ff ff       	call   801000d0 <bread>
80102dab:	89 c6                	mov    %eax,%esi
80102dad:	58                   	pop    %eax
80102dae:	5a                   	pop    %edx
80102daf:	ff 34 9d cc 26 11 80 	pushl  -0x7feed934(,%ebx,4)
80102db6:	ff 35 c4 26 11 80    	pushl  0x801126c4
80102dbc:	83 c3 01             	add    $0x1,%ebx
80102dbf:	e8 0c d3 ff ff       	call   801000d0 <bread>
80102dc4:	89 c7                	mov    %eax,%edi
80102dc6:	8d 40 5c             	lea    0x5c(%eax),%eax
80102dc9:	83 c4 0c             	add    $0xc,%esp
80102dcc:	68 00 02 00 00       	push   $0x200
80102dd1:	50                   	push   %eax
80102dd2:	8d 46 5c             	lea    0x5c(%esi),%eax
80102dd5:	50                   	push   %eax
80102dd6:	e8 65 1a 00 00       	call   80104840 <memmove>
80102ddb:	89 34 24             	mov    %esi,(%esp)
80102dde:	e8 bd d3 ff ff       	call   801001a0 <bwrite>
80102de3:	89 3c 24             	mov    %edi,(%esp)
80102de6:	e8 f5 d3 ff ff       	call   801001e0 <brelse>
80102deb:	89 34 24             	mov    %esi,(%esp)
80102dee:	e8 ed d3 ff ff       	call   801001e0 <brelse>
80102df3:	83 c4 10             	add    $0x10,%esp
80102df6:	3b 1d c8 26 11 80    	cmp    0x801126c8,%ebx
80102dfc:	7c 94                	jl     80102d92 <end_op+0x62>
80102dfe:	e8 bd fd ff ff       	call   80102bc0 <write_head>
80102e03:	e8 18 fd ff ff       	call   80102b20 <install_trans>
80102e08:	c7 05 c8 26 11 80 00 	movl   $0x0,0x801126c8
80102e0f:	00 00 00 
80102e12:	e8 a9 fd ff ff       	call   80102bc0 <write_head>
80102e17:	83 ec 0c             	sub    $0xc,%esp
80102e1a:	68 80 26 11 80       	push   $0x80112680
80102e1f:	e8 5c 18 00 00       	call   80104680 <acquire>
80102e24:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102e2b:	c7 05 c0 26 11 80 00 	movl   $0x0,0x801126c0
80102e32:	00 00 00 
80102e35:	e8 46 12 00 00       	call   80104080 <wakeup>
80102e3a:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102e41:	e8 fa 18 00 00       	call   80104740 <release>
80102e46:	83 c4 10             	add    $0x10,%esp
80102e49:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102e4c:	5b                   	pop    %ebx
80102e4d:	5e                   	pop    %esi
80102e4e:	5f                   	pop    %edi
80102e4f:	5d                   	pop    %ebp
80102e50:	c3                   	ret    
80102e51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102e58:	83 ec 0c             	sub    $0xc,%esp
80102e5b:	68 80 26 11 80       	push   $0x80112680
80102e60:	e8 1b 12 00 00       	call   80104080 <wakeup>
80102e65:	c7 04 24 80 26 11 80 	movl   $0x80112680,(%esp)
80102e6c:	e8 cf 18 00 00       	call   80104740 <release>
80102e71:	83 c4 10             	add    $0x10,%esp
80102e74:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102e77:	5b                   	pop    %ebx
80102e78:	5e                   	pop    %esi
80102e79:	5f                   	pop    %edi
80102e7a:	5d                   	pop    %ebp
80102e7b:	c3                   	ret    
80102e7c:	83 ec 0c             	sub    $0xc,%esp
80102e7f:	68 44 78 10 80       	push   $0x80107844
80102e84:	e8 07 d5 ff ff       	call   80100390 <panic>
80102e89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80102e90 <log_write>:
80102e90:	55                   	push   %ebp
80102e91:	89 e5                	mov    %esp,%ebp
80102e93:	53                   	push   %ebx
80102e94:	83 ec 04             	sub    $0x4,%esp
80102e97:	8b 15 c8 26 11 80    	mov    0x801126c8,%edx
80102e9d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102ea0:	83 fa 1d             	cmp    $0x1d,%edx
80102ea3:	0f 8f 9d 00 00 00    	jg     80102f46 <log_write+0xb6>
80102ea9:	a1 b8 26 11 80       	mov    0x801126b8,%eax
80102eae:	83 e8 01             	sub    $0x1,%eax
80102eb1:	39 c2                	cmp    %eax,%edx
80102eb3:	0f 8d 8d 00 00 00    	jge    80102f46 <log_write+0xb6>
80102eb9:	a1 bc 26 11 80       	mov    0x801126bc,%eax
80102ebe:	85 c0                	test   %eax,%eax
80102ec0:	0f 8e 8d 00 00 00    	jle    80102f53 <log_write+0xc3>
80102ec6:	83 ec 0c             	sub    $0xc,%esp
80102ec9:	68 80 26 11 80       	push   $0x80112680
80102ece:	e8 ad 17 00 00       	call   80104680 <acquire>
80102ed3:	8b 0d c8 26 11 80    	mov    0x801126c8,%ecx
80102ed9:	83 c4 10             	add    $0x10,%esp
80102edc:	83 f9 00             	cmp    $0x0,%ecx
80102edf:	7e 57                	jle    80102f38 <log_write+0xa8>
80102ee1:	8b 53 08             	mov    0x8(%ebx),%edx
80102ee4:	31 c0                	xor    %eax,%eax
80102ee6:	3b 15 cc 26 11 80    	cmp    0x801126cc,%edx
80102eec:	75 0b                	jne    80102ef9 <log_write+0x69>
80102eee:	eb 38                	jmp    80102f28 <log_write+0x98>
80102ef0:	39 14 85 cc 26 11 80 	cmp    %edx,-0x7feed934(,%eax,4)
80102ef7:	74 2f                	je     80102f28 <log_write+0x98>
80102ef9:	83 c0 01             	add    $0x1,%eax
80102efc:	39 c1                	cmp    %eax,%ecx
80102efe:	75 f0                	jne    80102ef0 <log_write+0x60>
80102f00:	89 14 85 cc 26 11 80 	mov    %edx,-0x7feed934(,%eax,4)
80102f07:	83 c0 01             	add    $0x1,%eax
80102f0a:	a3 c8 26 11 80       	mov    %eax,0x801126c8
80102f0f:	83 0b 04             	orl    $0x4,(%ebx)
80102f12:	c7 45 08 80 26 11 80 	movl   $0x80112680,0x8(%ebp)
80102f19:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102f1c:	c9                   	leave  
80102f1d:	e9 1e 18 00 00       	jmp    80104740 <release>
80102f22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102f28:	89 14 85 cc 26 11 80 	mov    %edx,-0x7feed934(,%eax,4)
80102f2f:	eb de                	jmp    80102f0f <log_write+0x7f>
80102f31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f38:	8b 43 08             	mov    0x8(%ebx),%eax
80102f3b:	a3 cc 26 11 80       	mov    %eax,0x801126cc
80102f40:	75 cd                	jne    80102f0f <log_write+0x7f>
80102f42:	31 c0                	xor    %eax,%eax
80102f44:	eb c1                	jmp    80102f07 <log_write+0x77>
80102f46:	83 ec 0c             	sub    $0xc,%esp
80102f49:	68 53 78 10 80       	push   $0x80107853
80102f4e:	e8 3d d4 ff ff       	call   80100390 <panic>
80102f53:	83 ec 0c             	sub    $0xc,%esp
80102f56:	68 69 78 10 80       	push   $0x80107869
80102f5b:	e8 30 d4 ff ff       	call   80100390 <panic>

80102f60 <mpmain>:
80102f60:	55                   	push   %ebp
80102f61:	89 e5                	mov    %esp,%ebp
80102f63:	53                   	push   %ebx
80102f64:	83 ec 04             	sub    $0x4,%esp
80102f67:	e8 84 09 00 00       	call   801038f0 <cpuid>
80102f6c:	89 c3                	mov    %eax,%ebx
80102f6e:	e8 7d 09 00 00       	call   801038f0 <cpuid>
80102f73:	83 ec 04             	sub    $0x4,%esp
80102f76:	53                   	push   %ebx
80102f77:	50                   	push   %eax
80102f78:	68 84 78 10 80       	push   $0x80107884
80102f7d:	e8 de d6 ff ff       	call   80100660 <cprintf>
80102f82:	e8 19 2c 00 00       	call   80105ba0 <idtinit>
80102f87:	e8 e4 08 00 00       	call   80103870 <mycpu>
80102f8c:	89 c2                	mov    %eax,%edx
80102f8e:	b8 01 00 00 00       	mov    $0x1,%eax
80102f93:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102f9a:	e8 51 0c 00 00       	call   80103bf0 <scheduler>
80102f9f:	90                   	nop

80102fa0 <mpenter>:
80102fa0:	55                   	push   %ebp
80102fa1:	89 e5                	mov    %esp,%ebp
80102fa3:	83 ec 08             	sub    $0x8,%esp
80102fa6:	e8 e5 3c 00 00       	call   80106c90 <switchkvm>
80102fab:	e8 50 3c 00 00       	call   80106c00 <seginit>
80102fb0:	e8 9b f7 ff ff       	call   80102750 <lapicinit>
80102fb5:	e8 a6 ff ff ff       	call   80102f60 <mpmain>
80102fba:	66 90                	xchg   %ax,%ax
80102fbc:	66 90                	xchg   %ax,%ax
80102fbe:	66 90                	xchg   %ax,%ax

80102fc0 <main>:
80102fc0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102fc4:	83 e4 f0             	and    $0xfffffff0,%esp
80102fc7:	ff 71 fc             	pushl  -0x4(%ecx)
80102fca:	55                   	push   %ebp
80102fcb:	89 e5                	mov    %esp,%ebp
80102fcd:	53                   	push   %ebx
80102fce:	51                   	push   %ecx
80102fcf:	83 ec 08             	sub    $0x8,%esp
80102fd2:	68 00 00 40 80       	push   $0x80400000
80102fd7:	68 a8 55 11 80       	push   $0x801155a8
80102fdc:	e8 2f f5 ff ff       	call   80102510 <kinit1>
80102fe1:	e8 7a 41 00 00       	call   80107160 <kvmalloc>
80102fe6:	e8 75 01 00 00       	call   80103160 <mpinit>
80102feb:	e8 60 f7 ff ff       	call   80102750 <lapicinit>
80102ff0:	e8 0b 3c 00 00       	call   80106c00 <seginit>
80102ff5:	e8 46 03 00 00       	call   80103340 <picinit>
80102ffa:	e8 41 f3 ff ff       	call   80102340 <ioapicinit>
80102fff:	e8 bc d9 ff ff       	call   801009c0 <consoleinit>
80103004:	e8 c7 2e 00 00       	call   80105ed0 <uartinit>
80103009:	e8 42 08 00 00       	call   80103850 <pinit>
8010300e:	e8 0d 2b 00 00       	call   80105b20 <tvinit>
80103013:	e8 28 d0 ff ff       	call   80100040 <binit>
80103018:	e8 43 dd ff ff       	call   80100d60 <fileinit>
8010301d:	e8 fe f0 ff ff       	call   80102120 <ideinit>
80103022:	83 c4 0c             	add    $0xc,%esp
80103025:	68 8a 00 00 00       	push   $0x8a
8010302a:	68 8c a4 10 80       	push   $0x8010a48c
8010302f:	68 00 70 00 80       	push   $0x80007000
80103034:	e8 07 18 00 00       	call   80104840 <memmove>
80103039:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
80103040:	00 00 00 
80103043:	83 c4 10             	add    $0x10,%esp
80103046:	05 80 27 11 80       	add    $0x80112780,%eax
8010304b:	3d 80 27 11 80       	cmp    $0x80112780,%eax
80103050:	76 71                	jbe    801030c3 <main+0x103>
80103052:	bb 80 27 11 80       	mov    $0x80112780,%ebx
80103057:	89 f6                	mov    %esi,%esi
80103059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103060:	e8 0b 08 00 00       	call   80103870 <mycpu>
80103065:	39 d8                	cmp    %ebx,%eax
80103067:	74 41                	je     801030aa <main+0xea>
80103069:	e8 72 f5 ff ff       	call   801025e0 <kalloc>
8010306e:	05 00 10 00 00       	add    $0x1000,%eax
80103073:	c7 05 f8 6f 00 80 a0 	movl   $0x80102fa0,0x80006ff8
8010307a:	2f 10 80 
8010307d:	c7 05 f4 6f 00 80 00 	movl   $0x109000,0x80006ff4
80103084:	90 10 00 
80103087:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
8010308c:	0f b6 03             	movzbl (%ebx),%eax
8010308f:	83 ec 08             	sub    $0x8,%esp
80103092:	68 00 70 00 00       	push   $0x7000
80103097:	50                   	push   %eax
80103098:	e8 03 f8 ff ff       	call   801028a0 <lapicstartap>
8010309d:	83 c4 10             	add    $0x10,%esp
801030a0:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
801030a6:	85 c0                	test   %eax,%eax
801030a8:	74 f6                	je     801030a0 <main+0xe0>
801030aa:	69 05 00 2d 11 80 b0 	imul   $0xb0,0x80112d00,%eax
801030b1:	00 00 00 
801030b4:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
801030ba:	05 80 27 11 80       	add    $0x80112780,%eax
801030bf:	39 c3                	cmp    %eax,%ebx
801030c1:	72 9d                	jb     80103060 <main+0xa0>
801030c3:	83 ec 08             	sub    $0x8,%esp
801030c6:	68 00 00 00 8e       	push   $0x8e000000
801030cb:	68 00 00 40 80       	push   $0x80400000
801030d0:	e8 ab f4 ff ff       	call   80102580 <kinit2>
801030d5:	e8 66 08 00 00       	call   80103940 <userinit>
801030da:	e8 81 fe ff ff       	call   80102f60 <mpmain>
801030df:	90                   	nop

801030e0 <mpsearch1>:
801030e0:	55                   	push   %ebp
801030e1:	89 e5                	mov    %esp,%ebp
801030e3:	57                   	push   %edi
801030e4:	56                   	push   %esi
801030e5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
801030eb:	53                   	push   %ebx
801030ec:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
801030ef:	83 ec 0c             	sub    $0xc,%esp
801030f2:	39 de                	cmp    %ebx,%esi
801030f4:	72 10                	jb     80103106 <mpsearch1+0x26>
801030f6:	eb 50                	jmp    80103148 <mpsearch1+0x68>
801030f8:	90                   	nop
801030f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103100:	39 fb                	cmp    %edi,%ebx
80103102:	89 fe                	mov    %edi,%esi
80103104:	76 42                	jbe    80103148 <mpsearch1+0x68>
80103106:	83 ec 04             	sub    $0x4,%esp
80103109:	8d 7e 10             	lea    0x10(%esi),%edi
8010310c:	6a 04                	push   $0x4
8010310e:	68 98 78 10 80       	push   $0x80107898
80103113:	56                   	push   %esi
80103114:	e8 c7 16 00 00       	call   801047e0 <memcmp>
80103119:	83 c4 10             	add    $0x10,%esp
8010311c:	85 c0                	test   %eax,%eax
8010311e:	75 e0                	jne    80103100 <mpsearch1+0x20>
80103120:	89 f1                	mov    %esi,%ecx
80103122:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103128:	0f b6 11             	movzbl (%ecx),%edx
8010312b:	83 c1 01             	add    $0x1,%ecx
8010312e:	01 d0                	add    %edx,%eax
80103130:	39 f9                	cmp    %edi,%ecx
80103132:	75 f4                	jne    80103128 <mpsearch1+0x48>
80103134:	84 c0                	test   %al,%al
80103136:	75 c8                	jne    80103100 <mpsearch1+0x20>
80103138:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010313b:	89 f0                	mov    %esi,%eax
8010313d:	5b                   	pop    %ebx
8010313e:	5e                   	pop    %esi
8010313f:	5f                   	pop    %edi
80103140:	5d                   	pop    %ebp
80103141:	c3                   	ret    
80103142:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103148:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010314b:	31 f6                	xor    %esi,%esi
8010314d:	89 f0                	mov    %esi,%eax
8010314f:	5b                   	pop    %ebx
80103150:	5e                   	pop    %esi
80103151:	5f                   	pop    %edi
80103152:	5d                   	pop    %ebp
80103153:	c3                   	ret    
80103154:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010315a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103160 <mpinit>:
80103160:	55                   	push   %ebp
80103161:	89 e5                	mov    %esp,%ebp
80103163:	57                   	push   %edi
80103164:	56                   	push   %esi
80103165:	53                   	push   %ebx
80103166:	83 ec 1c             	sub    $0x1c,%esp
80103169:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103170:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103177:	c1 e0 08             	shl    $0x8,%eax
8010317a:	09 d0                	or     %edx,%eax
8010317c:	c1 e0 04             	shl    $0x4,%eax
8010317f:	85 c0                	test   %eax,%eax
80103181:	75 1b                	jne    8010319e <mpinit+0x3e>
80103183:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010318a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103191:	c1 e0 08             	shl    $0x8,%eax
80103194:	09 d0                	or     %edx,%eax
80103196:	c1 e0 0a             	shl    $0xa,%eax
80103199:	2d 00 04 00 00       	sub    $0x400,%eax
8010319e:	ba 00 04 00 00       	mov    $0x400,%edx
801031a3:	e8 38 ff ff ff       	call   801030e0 <mpsearch1>
801031a8:	85 c0                	test   %eax,%eax
801031aa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801031ad:	0f 84 3d 01 00 00    	je     801032f0 <mpinit+0x190>
801031b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801031b6:	8b 58 04             	mov    0x4(%eax),%ebx
801031b9:	85 db                	test   %ebx,%ebx
801031bb:	0f 84 4f 01 00 00    	je     80103310 <mpinit+0x1b0>
801031c1:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
801031c7:	83 ec 04             	sub    $0x4,%esp
801031ca:	6a 04                	push   $0x4
801031cc:	68 b5 78 10 80       	push   $0x801078b5
801031d1:	56                   	push   %esi
801031d2:	e8 09 16 00 00       	call   801047e0 <memcmp>
801031d7:	83 c4 10             	add    $0x10,%esp
801031da:	85 c0                	test   %eax,%eax
801031dc:	0f 85 2e 01 00 00    	jne    80103310 <mpinit+0x1b0>
801031e2:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
801031e9:	3c 01                	cmp    $0x1,%al
801031eb:	0f 95 c2             	setne  %dl
801031ee:	3c 04                	cmp    $0x4,%al
801031f0:	0f 95 c0             	setne  %al
801031f3:	20 c2                	and    %al,%dl
801031f5:	0f 85 15 01 00 00    	jne    80103310 <mpinit+0x1b0>
801031fb:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
80103202:	66 85 ff             	test   %di,%di
80103205:	74 1a                	je     80103221 <mpinit+0xc1>
80103207:	89 f0                	mov    %esi,%eax
80103209:	01 f7                	add    %esi,%edi
8010320b:	31 d2                	xor    %edx,%edx
8010320d:	8d 76 00             	lea    0x0(%esi),%esi
80103210:	0f b6 08             	movzbl (%eax),%ecx
80103213:	83 c0 01             	add    $0x1,%eax
80103216:	01 ca                	add    %ecx,%edx
80103218:	39 c7                	cmp    %eax,%edi
8010321a:	75 f4                	jne    80103210 <mpinit+0xb0>
8010321c:	84 d2                	test   %dl,%dl
8010321e:	0f 95 c2             	setne  %dl
80103221:	85 f6                	test   %esi,%esi
80103223:	0f 84 e7 00 00 00    	je     80103310 <mpinit+0x1b0>
80103229:	84 d2                	test   %dl,%dl
8010322b:	0f 85 df 00 00 00    	jne    80103310 <mpinit+0x1b0>
80103231:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
80103237:	a3 7c 26 11 80       	mov    %eax,0x8011267c
8010323c:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
80103243:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
80103249:	bb 01 00 00 00       	mov    $0x1,%ebx
8010324e:	01 d6                	add    %edx,%esi
80103250:	39 c6                	cmp    %eax,%esi
80103252:	76 23                	jbe    80103277 <mpinit+0x117>
80103254:	0f b6 10             	movzbl (%eax),%edx
80103257:	80 fa 04             	cmp    $0x4,%dl
8010325a:	0f 87 ca 00 00 00    	ja     8010332a <mpinit+0x1ca>
80103260:	ff 24 95 dc 78 10 80 	jmp    *-0x7fef8724(,%edx,4)
80103267:	89 f6                	mov    %esi,%esi
80103269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103270:	83 c0 08             	add    $0x8,%eax
80103273:	39 c6                	cmp    %eax,%esi
80103275:	77 dd                	ja     80103254 <mpinit+0xf4>
80103277:	85 db                	test   %ebx,%ebx
80103279:	0f 84 9e 00 00 00    	je     8010331d <mpinit+0x1bd>
8010327f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103282:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103286:	74 15                	je     8010329d <mpinit+0x13d>
80103288:	b8 70 00 00 00       	mov    $0x70,%eax
8010328d:	ba 22 00 00 00       	mov    $0x22,%edx
80103292:	ee                   	out    %al,(%dx)
80103293:	ba 23 00 00 00       	mov    $0x23,%edx
80103298:	ec                   	in     (%dx),%al
80103299:	83 c8 01             	or     $0x1,%eax
8010329c:	ee                   	out    %al,(%dx)
8010329d:	8d 65 f4             	lea    -0xc(%ebp),%esp
801032a0:	5b                   	pop    %ebx
801032a1:	5e                   	pop    %esi
801032a2:	5f                   	pop    %edi
801032a3:	5d                   	pop    %ebp
801032a4:	c3                   	ret    
801032a5:	8d 76 00             	lea    0x0(%esi),%esi
801032a8:	8b 0d 00 2d 11 80    	mov    0x80112d00,%ecx
801032ae:	83 f9 07             	cmp    $0x7,%ecx
801032b1:	7f 19                	jg     801032cc <mpinit+0x16c>
801032b3:	0f b6 50 01          	movzbl 0x1(%eax),%edx
801032b7:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
801032bd:	83 c1 01             	add    $0x1,%ecx
801032c0:	89 0d 00 2d 11 80    	mov    %ecx,0x80112d00
801032c6:	88 97 80 27 11 80    	mov    %dl,-0x7feed880(%edi)
801032cc:	83 c0 14             	add    $0x14,%eax
801032cf:	e9 7c ff ff ff       	jmp    80103250 <mpinit+0xf0>
801032d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801032d8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
801032dc:	83 c0 08             	add    $0x8,%eax
801032df:	88 15 60 27 11 80    	mov    %dl,0x80112760
801032e5:	e9 66 ff ff ff       	jmp    80103250 <mpinit+0xf0>
801032ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801032f0:	ba 00 00 01 00       	mov    $0x10000,%edx
801032f5:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801032fa:	e8 e1 fd ff ff       	call   801030e0 <mpsearch1>
801032ff:	85 c0                	test   %eax,%eax
80103301:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103304:	0f 85 a9 fe ff ff    	jne    801031b3 <mpinit+0x53>
8010330a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103310:	83 ec 0c             	sub    $0xc,%esp
80103313:	68 9d 78 10 80       	push   $0x8010789d
80103318:	e8 73 d0 ff ff       	call   80100390 <panic>
8010331d:	83 ec 0c             	sub    $0xc,%esp
80103320:	68 bc 78 10 80       	push   $0x801078bc
80103325:	e8 66 d0 ff ff       	call   80100390 <panic>
8010332a:	31 db                	xor    %ebx,%ebx
8010332c:	e9 26 ff ff ff       	jmp    80103257 <mpinit+0xf7>
80103331:	66 90                	xchg   %ax,%ax
80103333:	66 90                	xchg   %ax,%ax
80103335:	66 90                	xchg   %ax,%ax
80103337:	66 90                	xchg   %ax,%ax
80103339:	66 90                	xchg   %ax,%ax
8010333b:	66 90                	xchg   %ax,%ax
8010333d:	66 90                	xchg   %ax,%ax
8010333f:	90                   	nop

80103340 <picinit>:
80103340:	55                   	push   %ebp
80103341:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103346:	ba 21 00 00 00       	mov    $0x21,%edx
8010334b:	89 e5                	mov    %esp,%ebp
8010334d:	ee                   	out    %al,(%dx)
8010334e:	ba a1 00 00 00       	mov    $0xa1,%edx
80103353:	ee                   	out    %al,(%dx)
80103354:	5d                   	pop    %ebp
80103355:	c3                   	ret    
80103356:	66 90                	xchg   %ax,%ax
80103358:	66 90                	xchg   %ax,%ax
8010335a:	66 90                	xchg   %ax,%ax
8010335c:	66 90                	xchg   %ax,%ax
8010335e:	66 90                	xchg   %ax,%ax

80103360 <pipealloc>:
80103360:	55                   	push   %ebp
80103361:	89 e5                	mov    %esp,%ebp
80103363:	57                   	push   %edi
80103364:	56                   	push   %esi
80103365:	53                   	push   %ebx
80103366:	83 ec 0c             	sub    $0xc,%esp
80103369:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010336c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010336f:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80103375:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010337b:	e8 00 da ff ff       	call   80100d80 <filealloc>
80103380:	85 c0                	test   %eax,%eax
80103382:	89 03                	mov    %eax,(%ebx)
80103384:	74 22                	je     801033a8 <pipealloc+0x48>
80103386:	e8 f5 d9 ff ff       	call   80100d80 <filealloc>
8010338b:	85 c0                	test   %eax,%eax
8010338d:	89 06                	mov    %eax,(%esi)
8010338f:	74 3f                	je     801033d0 <pipealloc+0x70>
80103391:	e8 4a f2 ff ff       	call   801025e0 <kalloc>
80103396:	85 c0                	test   %eax,%eax
80103398:	89 c7                	mov    %eax,%edi
8010339a:	75 54                	jne    801033f0 <pipealloc+0x90>
8010339c:	8b 03                	mov    (%ebx),%eax
8010339e:	85 c0                	test   %eax,%eax
801033a0:	75 34                	jne    801033d6 <pipealloc+0x76>
801033a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801033a8:	8b 06                	mov    (%esi),%eax
801033aa:	85 c0                	test   %eax,%eax
801033ac:	74 0c                	je     801033ba <pipealloc+0x5a>
801033ae:	83 ec 0c             	sub    $0xc,%esp
801033b1:	50                   	push   %eax
801033b2:	e8 89 da ff ff       	call   80100e40 <fileclose>
801033b7:	83 c4 10             	add    $0x10,%esp
801033ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801033bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801033c2:	5b                   	pop    %ebx
801033c3:	5e                   	pop    %esi
801033c4:	5f                   	pop    %edi
801033c5:	5d                   	pop    %ebp
801033c6:	c3                   	ret    
801033c7:	89 f6                	mov    %esi,%esi
801033c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801033d0:	8b 03                	mov    (%ebx),%eax
801033d2:	85 c0                	test   %eax,%eax
801033d4:	74 e4                	je     801033ba <pipealloc+0x5a>
801033d6:	83 ec 0c             	sub    $0xc,%esp
801033d9:	50                   	push   %eax
801033da:	e8 61 da ff ff       	call   80100e40 <fileclose>
801033df:	8b 06                	mov    (%esi),%eax
801033e1:	83 c4 10             	add    $0x10,%esp
801033e4:	85 c0                	test   %eax,%eax
801033e6:	75 c6                	jne    801033ae <pipealloc+0x4e>
801033e8:	eb d0                	jmp    801033ba <pipealloc+0x5a>
801033ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801033f0:	83 ec 08             	sub    $0x8,%esp
801033f3:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
801033fa:	00 00 00 
801033fd:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
80103404:	00 00 00 
80103407:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
8010340e:	00 00 00 
80103411:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
80103418:	00 00 00 
8010341b:	68 f0 78 10 80       	push   $0x801078f0
80103420:	50                   	push   %eax
80103421:	e8 1a 11 00 00       	call   80104540 <initlock>
80103426:	8b 03                	mov    (%ebx),%eax
80103428:	83 c4 10             	add    $0x10,%esp
8010342b:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
80103431:	8b 03                	mov    (%ebx),%eax
80103433:	c6 40 08 01          	movb   $0x1,0x8(%eax)
80103437:	8b 03                	mov    (%ebx),%eax
80103439:	c6 40 09 00          	movb   $0x0,0x9(%eax)
8010343d:	8b 03                	mov    (%ebx),%eax
8010343f:	89 78 0c             	mov    %edi,0xc(%eax)
80103442:	8b 06                	mov    (%esi),%eax
80103444:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
8010344a:	8b 06                	mov    (%esi),%eax
8010344c:	c6 40 08 00          	movb   $0x0,0x8(%eax)
80103450:	8b 06                	mov    (%esi),%eax
80103452:	c6 40 09 01          	movb   $0x1,0x9(%eax)
80103456:	8b 06                	mov    (%esi),%eax
80103458:	89 78 0c             	mov    %edi,0xc(%eax)
8010345b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010345e:	31 c0                	xor    %eax,%eax
80103460:	5b                   	pop    %ebx
80103461:	5e                   	pop    %esi
80103462:	5f                   	pop    %edi
80103463:	5d                   	pop    %ebp
80103464:	c3                   	ret    
80103465:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103470 <pipeclose>:
80103470:	55                   	push   %ebp
80103471:	89 e5                	mov    %esp,%ebp
80103473:	56                   	push   %esi
80103474:	53                   	push   %ebx
80103475:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103478:	8b 75 0c             	mov    0xc(%ebp),%esi
8010347b:	83 ec 0c             	sub    $0xc,%esp
8010347e:	53                   	push   %ebx
8010347f:	e8 fc 11 00 00       	call   80104680 <acquire>
80103484:	83 c4 10             	add    $0x10,%esp
80103487:	85 f6                	test   %esi,%esi
80103489:	74 45                	je     801034d0 <pipeclose+0x60>
8010348b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103491:	83 ec 0c             	sub    $0xc,%esp
80103494:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010349b:	00 00 00 
8010349e:	50                   	push   %eax
8010349f:	e8 dc 0b 00 00       	call   80104080 <wakeup>
801034a4:	83 c4 10             	add    $0x10,%esp
801034a7:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
801034ad:	85 d2                	test   %edx,%edx
801034af:	75 0a                	jne    801034bb <pipeclose+0x4b>
801034b1:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
801034b7:	85 c0                	test   %eax,%eax
801034b9:	74 35                	je     801034f0 <pipeclose+0x80>
801034bb:	89 5d 08             	mov    %ebx,0x8(%ebp)
801034be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801034c1:	5b                   	pop    %ebx
801034c2:	5e                   	pop    %esi
801034c3:	5d                   	pop    %ebp
801034c4:	e9 77 12 00 00       	jmp    80104740 <release>
801034c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801034d0:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801034d6:	83 ec 0c             	sub    $0xc,%esp
801034d9:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801034e0:	00 00 00 
801034e3:	50                   	push   %eax
801034e4:	e8 97 0b 00 00       	call   80104080 <wakeup>
801034e9:	83 c4 10             	add    $0x10,%esp
801034ec:	eb b9                	jmp    801034a7 <pipeclose+0x37>
801034ee:	66 90                	xchg   %ax,%ax
801034f0:	83 ec 0c             	sub    $0xc,%esp
801034f3:	53                   	push   %ebx
801034f4:	e8 47 12 00 00       	call   80104740 <release>
801034f9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801034fc:	83 c4 10             	add    $0x10,%esp
801034ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103502:	5b                   	pop    %ebx
80103503:	5e                   	pop    %esi
80103504:	5d                   	pop    %ebp
80103505:	e9 26 ef ff ff       	jmp    80102430 <kfree>
8010350a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103510 <pipewrite>:
80103510:	55                   	push   %ebp
80103511:	89 e5                	mov    %esp,%ebp
80103513:	57                   	push   %edi
80103514:	56                   	push   %esi
80103515:	53                   	push   %ebx
80103516:	83 ec 28             	sub    $0x28,%esp
80103519:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010351c:	53                   	push   %ebx
8010351d:	e8 5e 11 00 00       	call   80104680 <acquire>
80103522:	8b 45 10             	mov    0x10(%ebp),%eax
80103525:	83 c4 10             	add    $0x10,%esp
80103528:	85 c0                	test   %eax,%eax
8010352a:	0f 8e c9 00 00 00    	jle    801035f9 <pipewrite+0xe9>
80103530:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80103533:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103539:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
8010353f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103542:	03 4d 10             	add    0x10(%ebp),%ecx
80103545:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80103548:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
8010354e:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
80103554:	39 d0                	cmp    %edx,%eax
80103556:	75 71                	jne    801035c9 <pipewrite+0xb9>
80103558:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010355e:	85 c0                	test   %eax,%eax
80103560:	74 4e                	je     801035b0 <pipewrite+0xa0>
80103562:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103568:	eb 3a                	jmp    801035a4 <pipewrite+0x94>
8010356a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103570:	83 ec 0c             	sub    $0xc,%esp
80103573:	57                   	push   %edi
80103574:	e8 07 0b 00 00       	call   80104080 <wakeup>
80103579:	5a                   	pop    %edx
8010357a:	59                   	pop    %ecx
8010357b:	53                   	push   %ebx
8010357c:	56                   	push   %esi
8010357d:	e8 4e 09 00 00       	call   80103ed0 <sleep>
80103582:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103588:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010358e:	83 c4 10             	add    $0x10,%esp
80103591:	05 00 02 00 00       	add    $0x200,%eax
80103596:	39 c2                	cmp    %eax,%edx
80103598:	75 36                	jne    801035d0 <pipewrite+0xc0>
8010359a:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
801035a0:	85 c0                	test   %eax,%eax
801035a2:	74 0c                	je     801035b0 <pipewrite+0xa0>
801035a4:	e8 67 03 00 00       	call   80103910 <myproc>
801035a9:	8b 40 24             	mov    0x24(%eax),%eax
801035ac:	85 c0                	test   %eax,%eax
801035ae:	74 c0                	je     80103570 <pipewrite+0x60>
801035b0:	83 ec 0c             	sub    $0xc,%esp
801035b3:	53                   	push   %ebx
801035b4:	e8 87 11 00 00       	call   80104740 <release>
801035b9:	83 c4 10             	add    $0x10,%esp
801035bc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801035c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801035c4:	5b                   	pop    %ebx
801035c5:	5e                   	pop    %esi
801035c6:	5f                   	pop    %edi
801035c7:	5d                   	pop    %ebp
801035c8:	c3                   	ret    
801035c9:	89 c2                	mov    %eax,%edx
801035cb:	90                   	nop
801035cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801035d0:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801035d3:	8d 42 01             	lea    0x1(%edx),%eax
801035d6:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
801035dc:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
801035e2:	83 c6 01             	add    $0x1,%esi
801035e5:	0f b6 4e ff          	movzbl -0x1(%esi),%ecx
801035e9:	3b 75 e0             	cmp    -0x20(%ebp),%esi
801035ec:	89 75 e4             	mov    %esi,-0x1c(%ebp)
801035ef:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
801035f3:	0f 85 4f ff ff ff    	jne    80103548 <pipewrite+0x38>
801035f9:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801035ff:	83 ec 0c             	sub    $0xc,%esp
80103602:	50                   	push   %eax
80103603:	e8 78 0a 00 00       	call   80104080 <wakeup>
80103608:	89 1c 24             	mov    %ebx,(%esp)
8010360b:	e8 30 11 00 00       	call   80104740 <release>
80103610:	83 c4 10             	add    $0x10,%esp
80103613:	8b 45 10             	mov    0x10(%ebp),%eax
80103616:	eb a9                	jmp    801035c1 <pipewrite+0xb1>
80103618:	90                   	nop
80103619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103620 <piperead>:
80103620:	55                   	push   %ebp
80103621:	89 e5                	mov    %esp,%ebp
80103623:	57                   	push   %edi
80103624:	56                   	push   %esi
80103625:	53                   	push   %ebx
80103626:	83 ec 18             	sub    $0x18,%esp
80103629:	8b 75 08             	mov    0x8(%ebp),%esi
8010362c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010362f:	56                   	push   %esi
80103630:	e8 4b 10 00 00       	call   80104680 <acquire>
80103635:	83 c4 10             	add    $0x10,%esp
80103638:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
8010363e:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103644:	75 6a                	jne    801036b0 <piperead+0x90>
80103646:	8b 9e 40 02 00 00    	mov    0x240(%esi),%ebx
8010364c:	85 db                	test   %ebx,%ebx
8010364e:	0f 84 c4 00 00 00    	je     80103718 <piperead+0xf8>
80103654:	8d 9e 34 02 00 00    	lea    0x234(%esi),%ebx
8010365a:	eb 2d                	jmp    80103689 <piperead+0x69>
8010365c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103660:	83 ec 08             	sub    $0x8,%esp
80103663:	56                   	push   %esi
80103664:	53                   	push   %ebx
80103665:	e8 66 08 00 00       	call   80103ed0 <sleep>
8010366a:	83 c4 10             	add    $0x10,%esp
8010366d:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
80103673:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
80103679:	75 35                	jne    801036b0 <piperead+0x90>
8010367b:	8b 96 40 02 00 00    	mov    0x240(%esi),%edx
80103681:	85 d2                	test   %edx,%edx
80103683:	0f 84 8f 00 00 00    	je     80103718 <piperead+0xf8>
80103689:	e8 82 02 00 00       	call   80103910 <myproc>
8010368e:	8b 48 24             	mov    0x24(%eax),%ecx
80103691:	85 c9                	test   %ecx,%ecx
80103693:	74 cb                	je     80103660 <piperead+0x40>
80103695:	83 ec 0c             	sub    $0xc,%esp
80103698:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010369d:	56                   	push   %esi
8010369e:	e8 9d 10 00 00       	call   80104740 <release>
801036a3:	83 c4 10             	add    $0x10,%esp
801036a6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801036a9:	89 d8                	mov    %ebx,%eax
801036ab:	5b                   	pop    %ebx
801036ac:	5e                   	pop    %esi
801036ad:	5f                   	pop    %edi
801036ae:	5d                   	pop    %ebp
801036af:	c3                   	ret    
801036b0:	8b 45 10             	mov    0x10(%ebp),%eax
801036b3:	85 c0                	test   %eax,%eax
801036b5:	7e 61                	jle    80103718 <piperead+0xf8>
801036b7:	31 db                	xor    %ebx,%ebx
801036b9:	eb 13                	jmp    801036ce <piperead+0xae>
801036bb:	90                   	nop
801036bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801036c0:	8b 8e 34 02 00 00    	mov    0x234(%esi),%ecx
801036c6:	3b 8e 38 02 00 00    	cmp    0x238(%esi),%ecx
801036cc:	74 1f                	je     801036ed <piperead+0xcd>
801036ce:	8d 41 01             	lea    0x1(%ecx),%eax
801036d1:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
801036d7:	89 86 34 02 00 00    	mov    %eax,0x234(%esi)
801036dd:	0f b6 44 0e 34       	movzbl 0x34(%esi,%ecx,1),%eax
801036e2:	88 04 1f             	mov    %al,(%edi,%ebx,1)
801036e5:	83 c3 01             	add    $0x1,%ebx
801036e8:	39 5d 10             	cmp    %ebx,0x10(%ebp)
801036eb:	75 d3                	jne    801036c0 <piperead+0xa0>
801036ed:	8d 86 38 02 00 00    	lea    0x238(%esi),%eax
801036f3:	83 ec 0c             	sub    $0xc,%esp
801036f6:	50                   	push   %eax
801036f7:	e8 84 09 00 00       	call   80104080 <wakeup>
801036fc:	89 34 24             	mov    %esi,(%esp)
801036ff:	e8 3c 10 00 00       	call   80104740 <release>
80103704:	83 c4 10             	add    $0x10,%esp
80103707:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010370a:	89 d8                	mov    %ebx,%eax
8010370c:	5b                   	pop    %ebx
8010370d:	5e                   	pop    %esi
8010370e:	5f                   	pop    %edi
8010370f:	5d                   	pop    %ebp
80103710:	c3                   	ret    
80103711:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103718:	31 db                	xor    %ebx,%ebx
8010371a:	eb d1                	jmp    801036ed <piperead+0xcd>
8010371c:	66 90                	xchg   %ax,%ax
8010371e:	66 90                	xchg   %ax,%ax

80103720 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
80103720:	55                   	push   %ebp
80103721:	89 e5                	mov    %esp,%ebp
80103723:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103724:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
{
80103729:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);
8010372c:	68 20 2d 11 80       	push   $0x80112d20
80103731:	e8 4a 0f 00 00       	call   80104680 <acquire>
80103736:	83 c4 10             	add    $0x10,%esp
80103739:	eb 14                	jmp    8010374f <allocproc+0x2f>
8010373b:	90                   	nop
8010373c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103740:	83 eb 80             	sub    $0xffffff80,%ebx
80103743:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103749:	0f 83 81 00 00 00    	jae    801037d0 <allocproc+0xb0>
    if(p->state == UNUSED)
8010374f:	8b 43 0c             	mov    0xc(%ebx),%eax
80103752:	85 c0                	test   %eax,%eax
80103754:	75 ea                	jne    80103740 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103756:	a1 04 a0 10 80       	mov    0x8010a004,%eax
  p->priority = 20;

  release(&ptable.lock);
8010375b:	83 ec 0c             	sub    $0xc,%esp
  p->state = EMBRYO;
8010375e:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
  p->priority = 20;
80103765:	c7 43 7c 14 00 00 00 	movl   $0x14,0x7c(%ebx)
  p->pid = nextpid++;
8010376c:	8d 50 01             	lea    0x1(%eax),%edx
8010376f:	89 43 10             	mov    %eax,0x10(%ebx)
  release(&ptable.lock);
80103772:	68 20 2d 11 80       	push   $0x80112d20
  p->pid = nextpid++;
80103777:	89 15 04 a0 10 80    	mov    %edx,0x8010a004
  release(&ptable.lock);
8010377d:	e8 be 0f 00 00       	call   80104740 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
80103782:	e8 59 ee ff ff       	call   801025e0 <kalloc>
80103787:	83 c4 10             	add    $0x10,%esp
8010378a:	85 c0                	test   %eax,%eax
8010378c:	89 43 08             	mov    %eax,0x8(%ebx)
8010378f:	74 58                	je     801037e9 <allocproc+0xc9>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
80103791:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103797:	83 ec 04             	sub    $0x4,%esp
  sp -= sizeof *p->context;
8010379a:	05 9c 0f 00 00       	add    $0xf9c,%eax
  sp -= sizeof *p->tf;
8010379f:	89 53 18             	mov    %edx,0x18(%ebx)
  *(uint*)sp = (uint)trapret;
801037a2:	c7 40 14 0f 5b 10 80 	movl   $0x80105b0f,0x14(%eax)
  p->context = (struct context*)sp;
801037a9:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
801037ac:	6a 14                	push   $0x14
801037ae:	6a 00                	push   $0x0
801037b0:	50                   	push   %eax
801037b1:	e8 da 0f 00 00       	call   80104790 <memset>
  p->context->eip = (uint)forkret;
801037b6:	8b 43 1c             	mov    0x1c(%ebx),%eax

  return p;
801037b9:	83 c4 10             	add    $0x10,%esp
  p->context->eip = (uint)forkret;
801037bc:	c7 40 10 00 38 10 80 	movl   $0x80103800,0x10(%eax)
}
801037c3:	89 d8                	mov    %ebx,%eax
801037c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037c8:	c9                   	leave  
801037c9:	c3                   	ret    
801037ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
801037d0:	83 ec 0c             	sub    $0xc,%esp
  return 0;
801037d3:	31 db                	xor    %ebx,%ebx
  release(&ptable.lock);
801037d5:	68 20 2d 11 80       	push   $0x80112d20
801037da:	e8 61 0f 00 00       	call   80104740 <release>
}
801037df:	89 d8                	mov    %ebx,%eax
  return 0;
801037e1:	83 c4 10             	add    $0x10,%esp
}
801037e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801037e7:	c9                   	leave  
801037e8:	c3                   	ret    
    p->state = UNUSED;
801037e9:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
801037f0:	31 db                	xor    %ebx,%ebx
801037f2:	eb cf                	jmp    801037c3 <allocproc+0xa3>
801037f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103800 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
80103800:	55                   	push   %ebp
80103801:	89 e5                	mov    %esp,%ebp
80103803:	83 ec 14             	sub    $0x14,%esp
  static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
80103806:	68 20 2d 11 80       	push   $0x80112d20
8010380b:	e8 30 0f 00 00       	call   80104740 <release>

  if (first) {
80103810:	a1 00 a0 10 80       	mov    0x8010a000,%eax
80103815:	83 c4 10             	add    $0x10,%esp
80103818:	85 c0                	test   %eax,%eax
8010381a:	75 04                	jne    80103820 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
8010381c:	c9                   	leave  
8010381d:	c3                   	ret    
8010381e:	66 90                	xchg   %ax,%ax
    iinit(ROOTDEV);
80103820:	83 ec 0c             	sub    $0xc,%esp
    first = 0;
80103823:	c7 05 00 a0 10 80 00 	movl   $0x0,0x8010a000
8010382a:	00 00 00 
    iinit(ROOTDEV);
8010382d:	6a 01                	push   $0x1
8010382f:	e8 5c dc ff ff       	call   80101490 <iinit>
    initlog(ROOTDEV);
80103834:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010383b:	e8 e0 f3 ff ff       	call   80102c20 <initlog>
80103840:	83 c4 10             	add    $0x10,%esp
}
80103843:	c9                   	leave  
80103844:	c3                   	ret    
80103845:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103850 <pinit>:
{
80103850:	55                   	push   %ebp
80103851:	89 e5                	mov    %esp,%ebp
80103853:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103856:	68 f5 78 10 80       	push   $0x801078f5
8010385b:	68 20 2d 11 80       	push   $0x80112d20
80103860:	e8 db 0c 00 00       	call   80104540 <initlock>
}
80103865:	83 c4 10             	add    $0x10,%esp
80103868:	c9                   	leave  
80103869:	c3                   	ret    
8010386a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103870 <mycpu>:
{
80103870:	55                   	push   %ebp
80103871:	89 e5                	mov    %esp,%ebp
80103873:	56                   	push   %esi
80103874:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103875:	9c                   	pushf  
80103876:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103877:	f6 c4 02             	test   $0x2,%ah
8010387a:	75 5e                	jne    801038da <mycpu+0x6a>
  apicid = lapicid();
8010387c:	e8 cf ef ff ff       	call   80102850 <lapicid>
  for (i = 0; i < ncpu; ++i) {
80103881:	8b 35 00 2d 11 80    	mov    0x80112d00,%esi
80103887:	85 f6                	test   %esi,%esi
80103889:	7e 42                	jle    801038cd <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
8010388b:	0f b6 15 80 27 11 80 	movzbl 0x80112780,%edx
80103892:	39 d0                	cmp    %edx,%eax
80103894:	74 30                	je     801038c6 <mycpu+0x56>
80103896:	b9 30 28 11 80       	mov    $0x80112830,%ecx
  for (i = 0; i < ncpu; ++i) {
8010389b:	31 d2                	xor    %edx,%edx
8010389d:	8d 76 00             	lea    0x0(%esi),%esi
801038a0:	83 c2 01             	add    $0x1,%edx
801038a3:	39 f2                	cmp    %esi,%edx
801038a5:	74 26                	je     801038cd <mycpu+0x5d>
    if (cpus[i].apicid == apicid)
801038a7:	0f b6 19             	movzbl (%ecx),%ebx
801038aa:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
801038b0:	39 c3                	cmp    %eax,%ebx
801038b2:	75 ec                	jne    801038a0 <mycpu+0x30>
801038b4:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
801038ba:	05 80 27 11 80       	add    $0x80112780,%eax
}
801038bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801038c2:	5b                   	pop    %ebx
801038c3:	5e                   	pop    %esi
801038c4:	5d                   	pop    %ebp
801038c5:	c3                   	ret    
    if (cpus[i].apicid == apicid)
801038c6:	b8 80 27 11 80       	mov    $0x80112780,%eax
      return &cpus[i];
801038cb:	eb f2                	jmp    801038bf <mycpu+0x4f>
  panic("unknown apicid\n");
801038cd:	83 ec 0c             	sub    $0xc,%esp
801038d0:	68 fc 78 10 80       	push   $0x801078fc
801038d5:	e8 b6 ca ff ff       	call   80100390 <panic>
    panic("mycpu called with interrupts enabled\n");
801038da:	83 ec 0c             	sub    $0xc,%esp
801038dd:	68 50 7a 10 80       	push   $0x80107a50
801038e2:	e8 a9 ca ff ff       	call   80100390 <panic>
801038e7:	89 f6                	mov    %esi,%esi
801038e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801038f0 <cpuid>:
cpuid() {
801038f0:	55                   	push   %ebp
801038f1:	89 e5                	mov    %esp,%ebp
801038f3:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
801038f6:	e8 75 ff ff ff       	call   80103870 <mycpu>
801038fb:	2d 80 27 11 80       	sub    $0x80112780,%eax
}
80103900:	c9                   	leave  
  return mycpu()-cpus;
80103901:	c1 f8 04             	sar    $0x4,%eax
80103904:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
8010390a:	c3                   	ret    
8010390b:	90                   	nop
8010390c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80103910 <myproc>:
myproc(void) {
80103910:	55                   	push   %ebp
80103911:	89 e5                	mov    %esp,%ebp
80103913:	53                   	push   %ebx
80103914:	83 ec 04             	sub    $0x4,%esp
  pushcli();
80103917:	e8 94 0c 00 00       	call   801045b0 <pushcli>
  c = mycpu();
8010391c:	e8 4f ff ff ff       	call   80103870 <mycpu>
  p = c->proc;
80103921:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103927:	e8 c4 0c 00 00       	call   801045f0 <popcli>
}
8010392c:	83 c4 04             	add    $0x4,%esp
8010392f:	89 d8                	mov    %ebx,%eax
80103931:	5b                   	pop    %ebx
80103932:	5d                   	pop    %ebp
80103933:	c3                   	ret    
80103934:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010393a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103940 <userinit>:
{
80103940:	55                   	push   %ebp
80103941:	89 e5                	mov    %esp,%ebp
80103943:	53                   	push   %ebx
80103944:	83 ec 04             	sub    $0x4,%esp
  p = allocproc();
80103947:	e8 d4 fd ff ff       	call   80103720 <allocproc>
8010394c:	89 c3                	mov    %eax,%ebx
  initproc = p;
8010394e:	a3 b8 a5 10 80       	mov    %eax,0x8010a5b8
  if((p->pgdir = setupkvm()) == 0)
80103953:	e8 88 37 00 00       	call   801070e0 <setupkvm>
80103958:	85 c0                	test   %eax,%eax
8010395a:	89 43 04             	mov    %eax,0x4(%ebx)
8010395d:	0f 84 d6 00 00 00    	je     80103a39 <userinit+0xf9>
  cprintf("%p %p\n", _binary_initcode_start, _binary_initcode_size);
80103963:	83 ec 04             	sub    $0x4,%esp
80103966:	68 2c 00 00 00       	push   $0x2c
8010396b:	68 60 a4 10 80       	push   $0x8010a460
80103970:	68 25 79 10 80       	push   $0x80107925
80103975:	e8 e6 cc ff ff       	call   80100660 <cprintf>
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
8010397a:	83 c4 0c             	add    $0xc,%esp
8010397d:	68 2c 00 00 00       	push   $0x2c
80103982:	68 60 a4 10 80       	push   $0x8010a460
80103987:	ff 73 04             	pushl  0x4(%ebx)
8010398a:	e8 31 34 00 00       	call   80106dc0 <inituvm>
  memset(p->tf, 0, sizeof(*p->tf));
8010398f:	83 c4 0c             	add    $0xc,%esp
  p->sz = PGSIZE;
80103992:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
80103998:	6a 4c                	push   $0x4c
8010399a:	6a 00                	push   $0x0
8010399c:	ff 73 18             	pushl  0x18(%ebx)
8010399f:	e8 ec 0d 00 00       	call   80104790 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801039a4:	8b 43 18             	mov    0x18(%ebx),%eax
801039a7:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801039ac:	b9 23 00 00 00       	mov    $0x23,%ecx
  safestrcpy(p->name, "initcode", sizeof(p->name));
801039b1:	83 c4 0c             	add    $0xc,%esp
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
801039b4:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
801039b8:	8b 43 18             	mov    0x18(%ebx),%eax
801039bb:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
801039bf:	8b 43 18             	mov    0x18(%ebx),%eax
801039c2:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801039c6:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
801039ca:	8b 43 18             	mov    0x18(%ebx),%eax
801039cd:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
801039d1:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
801039d5:	8b 43 18             	mov    0x18(%ebx),%eax
801039d8:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)
  p->tf->esp = PGSIZE;
801039df:	8b 43 18             	mov    0x18(%ebx),%eax
801039e2:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
801039e9:	8b 43 18             	mov    0x18(%ebx),%eax
801039ec:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)
  safestrcpy(p->name, "initcode", sizeof(p->name));
801039f3:	8d 43 6c             	lea    0x6c(%ebx),%eax
801039f6:	6a 10                	push   $0x10
801039f8:	68 2c 79 10 80       	push   $0x8010792c
801039fd:	50                   	push   %eax
801039fe:	e8 6d 0f 00 00       	call   80104970 <safestrcpy>
  p->cwd = namei("/");
80103a03:	c7 04 24 35 79 10 80 	movl   $0x80107935,(%esp)
80103a0a:	e8 e1 e4 ff ff       	call   80101ef0 <namei>
80103a0f:	89 43 68             	mov    %eax,0x68(%ebx)
  acquire(&ptable.lock);
80103a12:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103a19:	e8 62 0c 00 00       	call   80104680 <acquire>
  p->state = RUNNABLE;
80103a1e:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  release(&ptable.lock);
80103a25:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103a2c:	e8 0f 0d 00 00       	call   80104740 <release>
}
80103a31:	83 c4 10             	add    $0x10,%esp
80103a34:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103a37:	c9                   	leave  
80103a38:	c3                   	ret    
    panic("userinit: out of memory?");
80103a39:	83 ec 0c             	sub    $0xc,%esp
80103a3c:	68 0c 79 10 80       	push   $0x8010790c
80103a41:	e8 4a c9 ff ff       	call   80100390 <panic>
80103a46:	8d 76 00             	lea    0x0(%esi),%esi
80103a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103a50 <growproc>:
{
80103a50:	55                   	push   %ebp
80103a51:	89 e5                	mov    %esp,%ebp
80103a53:	56                   	push   %esi
80103a54:	53                   	push   %ebx
80103a55:	8b 75 08             	mov    0x8(%ebp),%esi
  pushcli();
80103a58:	e8 53 0b 00 00       	call   801045b0 <pushcli>
  c = mycpu();
80103a5d:	e8 0e fe ff ff       	call   80103870 <mycpu>
  p = c->proc;
80103a62:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a68:	e8 83 0b 00 00       	call   801045f0 <popcli>
  if(n > 0){
80103a6d:	83 fe 00             	cmp    $0x0,%esi
  sz = curproc->sz;
80103a70:	8b 03                	mov    (%ebx),%eax
  if(n > 0){
80103a72:	7f 1c                	jg     80103a90 <growproc+0x40>
  } else if(n < 0){
80103a74:	75 3a                	jne    80103ab0 <growproc+0x60>
  switchuvm(curproc);
80103a76:	83 ec 0c             	sub    $0xc,%esp
  curproc->sz = sz;
80103a79:	89 03                	mov    %eax,(%ebx)
  switchuvm(curproc);
80103a7b:	53                   	push   %ebx
80103a7c:	e8 2f 32 00 00       	call   80106cb0 <switchuvm>
  return 0;
80103a81:	83 c4 10             	add    $0x10,%esp
80103a84:	31 c0                	xor    %eax,%eax
}
80103a86:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103a89:	5b                   	pop    %ebx
80103a8a:	5e                   	pop    %esi
80103a8b:	5d                   	pop    %ebp
80103a8c:	c3                   	ret    
80103a8d:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103a90:	83 ec 04             	sub    $0x4,%esp
80103a93:	01 c6                	add    %eax,%esi
80103a95:	56                   	push   %esi
80103a96:	50                   	push   %eax
80103a97:	ff 73 04             	pushl  0x4(%ebx)
80103a9a:	e8 61 34 00 00       	call   80106f00 <allocuvm>
80103a9f:	83 c4 10             	add    $0x10,%esp
80103aa2:	85 c0                	test   %eax,%eax
80103aa4:	75 d0                	jne    80103a76 <growproc+0x26>
      return -1;
80103aa6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103aab:	eb d9                	jmp    80103a86 <growproc+0x36>
80103aad:	8d 76 00             	lea    0x0(%esi),%esi
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
80103ab0:	83 ec 04             	sub    $0x4,%esp
80103ab3:	01 c6                	add    %eax,%esi
80103ab5:	56                   	push   %esi
80103ab6:	50                   	push   %eax
80103ab7:	ff 73 04             	pushl  0x4(%ebx)
80103aba:	e8 71 35 00 00       	call   80107030 <deallocuvm>
80103abf:	83 c4 10             	add    $0x10,%esp
80103ac2:	85 c0                	test   %eax,%eax
80103ac4:	75 b0                	jne    80103a76 <growproc+0x26>
80103ac6:	eb de                	jmp    80103aa6 <growproc+0x56>
80103ac8:	90                   	nop
80103ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80103ad0 <fork>:
{
80103ad0:	55                   	push   %ebp
80103ad1:	89 e5                	mov    %esp,%ebp
80103ad3:	57                   	push   %edi
80103ad4:	56                   	push   %esi
80103ad5:	53                   	push   %ebx
80103ad6:	83 ec 1c             	sub    $0x1c,%esp
  pushcli();
80103ad9:	e8 d2 0a 00 00       	call   801045b0 <pushcli>
  c = mycpu();
80103ade:	e8 8d fd ff ff       	call   80103870 <mycpu>
  p = c->proc;
80103ae3:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103ae9:	e8 02 0b 00 00       	call   801045f0 <popcli>
  if((np = allocproc()) == 0){
80103aee:	e8 2d fc ff ff       	call   80103720 <allocproc>
80103af3:	85 c0                	test   %eax,%eax
80103af5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103af8:	0f 84 bf 00 00 00    	je     80103bbd <fork+0xed>
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103afe:	83 ec 08             	sub    $0x8,%esp
80103b01:	ff 33                	pushl  (%ebx)
80103b03:	ff 73 04             	pushl  0x4(%ebx)
80103b06:	89 c7                	mov    %eax,%edi
80103b08:	e8 a3 36 00 00       	call   801071b0 <copyuvm>
80103b0d:	83 c4 10             	add    $0x10,%esp
80103b10:	85 c0                	test   %eax,%eax
80103b12:	89 47 04             	mov    %eax,0x4(%edi)
80103b15:	0f 84 a9 00 00 00    	je     80103bc4 <fork+0xf4>
  np->sz = curproc->sz;
80103b1b:	8b 03                	mov    (%ebx),%eax
80103b1d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  *np->tf = *curproc->tf;
80103b20:	b9 13 00 00 00       	mov    $0x13,%ecx
  np->sz = curproc->sz;
80103b25:	89 02                	mov    %eax,(%edx)
  np->parent = curproc;
80103b27:	89 5a 14             	mov    %ebx,0x14(%edx)
  *np->tf = *curproc->tf;
80103b2a:	8b 7a 18             	mov    0x18(%edx),%edi
80103b2d:	8b 73 18             	mov    0x18(%ebx),%esi
80103b30:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  for(i = 0; i < NOFILE; i++)
80103b32:	31 f6                	xor    %esi,%esi
  np->priority = curproc->priority;
80103b34:	8b 43 7c             	mov    0x7c(%ebx),%eax
80103b37:	89 42 7c             	mov    %eax,0x7c(%edx)
  np->tf->eax = 0;
80103b3a:	8b 42 18             	mov    0x18(%edx),%eax
80103b3d:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103b44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(curproc->ofile[i])
80103b48:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103b4c:	85 c0                	test   %eax,%eax
80103b4e:	74 13                	je     80103b63 <fork+0x93>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103b50:	83 ec 0c             	sub    $0xc,%esp
80103b53:	50                   	push   %eax
80103b54:	e8 97 d2 ff ff       	call   80100df0 <filedup>
80103b59:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80103b5c:	83 c4 10             	add    $0x10,%esp
80103b5f:	89 44 b2 28          	mov    %eax,0x28(%edx,%esi,4)
  for(i = 0; i < NOFILE; i++)
80103b63:	83 c6 01             	add    $0x1,%esi
80103b66:	83 fe 10             	cmp    $0x10,%esi
80103b69:	75 dd                	jne    80103b48 <fork+0x78>
  np->cwd = idup(curproc->cwd);
80103b6b:	83 ec 0c             	sub    $0xc,%esp
80103b6e:	ff 73 68             	pushl  0x68(%ebx)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b71:	83 c3 6c             	add    $0x6c,%ebx
  np->cwd = idup(curproc->cwd);
80103b74:	e8 e7 da ff ff       	call   80101660 <idup>
80103b79:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b7c:	83 c4 0c             	add    $0xc,%esp
  np->cwd = idup(curproc->cwd);
80103b7f:	89 47 68             	mov    %eax,0x68(%edi)
  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b82:	8d 47 6c             	lea    0x6c(%edi),%eax
80103b85:	6a 10                	push   $0x10
80103b87:	53                   	push   %ebx
80103b88:	50                   	push   %eax
80103b89:	e8 e2 0d 00 00       	call   80104970 <safestrcpy>
  pid = np->pid;
80103b8e:	8b 5f 10             	mov    0x10(%edi),%ebx
  acquire(&ptable.lock);
80103b91:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103b98:	e8 e3 0a 00 00       	call   80104680 <acquire>
  np->state = RUNNABLE;
80103b9d:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)
  release(&ptable.lock);
80103ba4:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103bab:	e8 90 0b 00 00       	call   80104740 <release>
  return pid;
80103bb0:	83 c4 10             	add    $0x10,%esp
}
80103bb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103bb6:	89 d8                	mov    %ebx,%eax
80103bb8:	5b                   	pop    %ebx
80103bb9:	5e                   	pop    %esi
80103bba:	5f                   	pop    %edi
80103bbb:	5d                   	pop    %ebp
80103bbc:	c3                   	ret    
    return -1;
80103bbd:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103bc2:	eb ef                	jmp    80103bb3 <fork+0xe3>
    kfree(np->kstack);
80103bc4:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80103bc7:	83 ec 0c             	sub    $0xc,%esp
80103bca:	ff 73 08             	pushl  0x8(%ebx)
80103bcd:	e8 5e e8 ff ff       	call   80102430 <kfree>
    np->kstack = 0;
80103bd2:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
    np->state = UNUSED;
80103bd9:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return -1;
80103be0:	83 c4 10             	add    $0x10,%esp
80103be3:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80103be8:	eb c9                	jmp    80103bb3 <fork+0xe3>
80103bea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103bf0 <scheduler>:
{
80103bf0:	55                   	push   %ebp
80103bf1:	89 e5                	mov    %esp,%ebp
80103bf3:	57                   	push   %edi
80103bf4:	56                   	push   %esi
80103bf5:	53                   	push   %ebx
80103bf6:	83 ec 0c             	sub    $0xc,%esp
  struct cpu *c = mycpu();
80103bf9:	e8 72 fc ff ff       	call   80103870 <mycpu>
80103bfe:	8d 78 04             	lea    0x4(%eax),%edi
80103c01:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103c03:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103c0a:	00 00 00 
80103c0d:	8d 76 00             	lea    0x0(%esi),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103c10:	fb                   	sti    
    acquire(&ptable.lock);
80103c11:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c14:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
    acquire(&ptable.lock);
80103c19:	68 20 2d 11 80       	push   $0x80112d20
80103c1e:	e8 5d 0a 00 00       	call   80104680 <acquire>
80103c23:	83 c4 10             	add    $0x10,%esp
80103c26:	8d 76 00             	lea    0x0(%esi),%esi
80103c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      if(p->state != RUNNABLE)
80103c30:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103c34:	75 33                	jne    80103c69 <scheduler+0x79>
      switchuvm(p);
80103c36:	83 ec 0c             	sub    $0xc,%esp
      c->proc = p;
80103c39:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
      switchuvm(p);
80103c3f:	53                   	push   %ebx
80103c40:	e8 6b 30 00 00       	call   80106cb0 <switchuvm>
      swtch(&(c->scheduler), p->context);
80103c45:	58                   	pop    %eax
80103c46:	5a                   	pop    %edx
80103c47:	ff 73 1c             	pushl  0x1c(%ebx)
80103c4a:	57                   	push   %edi
      p->state = RUNNING;
80103c4b:	c7 43 0c 04 00 00 00 	movl   $0x4,0xc(%ebx)
      swtch(&(c->scheduler), p->context);
80103c52:	e8 74 0d 00 00       	call   801049cb <swtch>
      switchkvm();
80103c57:	e8 34 30 00 00       	call   80106c90 <switchkvm>
      c->proc = 0;
80103c5c:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103c63:	00 00 00 
80103c66:	83 c4 10             	add    $0x10,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c69:	83 eb 80             	sub    $0xffffff80,%ebx
80103c6c:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103c72:	72 bc                	jb     80103c30 <scheduler+0x40>
    release(&ptable.lock);
80103c74:	83 ec 0c             	sub    $0xc,%esp
80103c77:	68 20 2d 11 80       	push   $0x80112d20
80103c7c:	e8 bf 0a 00 00       	call   80104740 <release>
    sti();
80103c81:	83 c4 10             	add    $0x10,%esp
80103c84:	eb 8a                	jmp    80103c10 <scheduler+0x20>
80103c86:	8d 76 00             	lea    0x0(%esi),%esi
80103c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103c90 <sched>:
{
80103c90:	55                   	push   %ebp
80103c91:	89 e5                	mov    %esp,%ebp
80103c93:	56                   	push   %esi
80103c94:	53                   	push   %ebx
  pushcli();
80103c95:	e8 16 09 00 00       	call   801045b0 <pushcli>
  c = mycpu();
80103c9a:	e8 d1 fb ff ff       	call   80103870 <mycpu>
  p = c->proc;
80103c9f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103ca5:	e8 46 09 00 00       	call   801045f0 <popcli>
  if(!holding(&ptable.lock))
80103caa:	83 ec 0c             	sub    $0xc,%esp
80103cad:	68 20 2d 11 80       	push   $0x80112d20
80103cb2:	e8 99 09 00 00       	call   80104650 <holding>
80103cb7:	83 c4 10             	add    $0x10,%esp
80103cba:	85 c0                	test   %eax,%eax
80103cbc:	74 4f                	je     80103d0d <sched+0x7d>
  if(mycpu()->ncli != 1)
80103cbe:	e8 ad fb ff ff       	call   80103870 <mycpu>
80103cc3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103cca:	75 68                	jne    80103d34 <sched+0xa4>
  if(p->state == RUNNING)
80103ccc:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103cd0:	74 55                	je     80103d27 <sched+0x97>
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103cd2:	9c                   	pushf  
80103cd3:	58                   	pop    %eax
  if(readeflags()&FL_IF)
80103cd4:	f6 c4 02             	test   $0x2,%ah
80103cd7:	75 41                	jne    80103d1a <sched+0x8a>
  intena = mycpu()->intena;
80103cd9:	e8 92 fb ff ff       	call   80103870 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103cde:	83 c3 1c             	add    $0x1c,%ebx
  intena = mycpu()->intena;
80103ce1:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103ce7:	e8 84 fb ff ff       	call   80103870 <mycpu>
80103cec:	83 ec 08             	sub    $0x8,%esp
80103cef:	ff 70 04             	pushl  0x4(%eax)
80103cf2:	53                   	push   %ebx
80103cf3:	e8 d3 0c 00 00       	call   801049cb <swtch>
  mycpu()->intena = intena;
80103cf8:	e8 73 fb ff ff       	call   80103870 <mycpu>
}
80103cfd:	83 c4 10             	add    $0x10,%esp
  mycpu()->intena = intena;
80103d00:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103d06:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103d09:	5b                   	pop    %ebx
80103d0a:	5e                   	pop    %esi
80103d0b:	5d                   	pop    %ebp
80103d0c:	c3                   	ret    
    panic("sched ptable.lock");
80103d0d:	83 ec 0c             	sub    $0xc,%esp
80103d10:	68 37 79 10 80       	push   $0x80107937
80103d15:	e8 76 c6 ff ff       	call   80100390 <panic>
    panic("sched interruptible");
80103d1a:	83 ec 0c             	sub    $0xc,%esp
80103d1d:	68 63 79 10 80       	push   $0x80107963
80103d22:	e8 69 c6 ff ff       	call   80100390 <panic>
    panic("sched running");
80103d27:	83 ec 0c             	sub    $0xc,%esp
80103d2a:	68 55 79 10 80       	push   $0x80107955
80103d2f:	e8 5c c6 ff ff       	call   80100390 <panic>
    panic("sched locks");
80103d34:	83 ec 0c             	sub    $0xc,%esp
80103d37:	68 49 79 10 80       	push   $0x80107949
80103d3c:	e8 4f c6 ff ff       	call   80100390 <panic>
80103d41:	eb 0d                	jmp    80103d50 <exit>
80103d43:	90                   	nop
80103d44:	90                   	nop
80103d45:	90                   	nop
80103d46:	90                   	nop
80103d47:	90                   	nop
80103d48:	90                   	nop
80103d49:	90                   	nop
80103d4a:	90                   	nop
80103d4b:	90                   	nop
80103d4c:	90                   	nop
80103d4d:	90                   	nop
80103d4e:	90                   	nop
80103d4f:	90                   	nop

80103d50 <exit>:
{
80103d50:	55                   	push   %ebp
80103d51:	89 e5                	mov    %esp,%ebp
80103d53:	57                   	push   %edi
80103d54:	56                   	push   %esi
80103d55:	53                   	push   %ebx
80103d56:	83 ec 0c             	sub    $0xc,%esp
  pushcli();
80103d59:	e8 52 08 00 00       	call   801045b0 <pushcli>
  c = mycpu();
80103d5e:	e8 0d fb ff ff       	call   80103870 <mycpu>
  p = c->proc;
80103d63:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103d69:	e8 82 08 00 00       	call   801045f0 <popcli>
  if(curproc == initproc)
80103d6e:	39 35 b8 a5 10 80    	cmp    %esi,0x8010a5b8
80103d74:	8d 5e 28             	lea    0x28(%esi),%ebx
80103d77:	8d 7e 68             	lea    0x68(%esi),%edi
80103d7a:	0f 84 e7 00 00 00    	je     80103e67 <exit+0x117>
    if(curproc->ofile[fd]){
80103d80:	8b 03                	mov    (%ebx),%eax
80103d82:	85 c0                	test   %eax,%eax
80103d84:	74 12                	je     80103d98 <exit+0x48>
      fileclose(curproc->ofile[fd]);
80103d86:	83 ec 0c             	sub    $0xc,%esp
80103d89:	50                   	push   %eax
80103d8a:	e8 b1 d0 ff ff       	call   80100e40 <fileclose>
      curproc->ofile[fd] = 0;
80103d8f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103d95:	83 c4 10             	add    $0x10,%esp
80103d98:	83 c3 04             	add    $0x4,%ebx
  for(fd = 0; fd < NOFILE; fd++){
80103d9b:	39 fb                	cmp    %edi,%ebx
80103d9d:	75 e1                	jne    80103d80 <exit+0x30>
  begin_op();
80103d9f:	e8 1c ef ff ff       	call   80102cc0 <begin_op>
  iput(curproc->cwd);
80103da4:	83 ec 0c             	sub    $0xc,%esp
80103da7:	ff 76 68             	pushl  0x68(%esi)
80103daa:	e8 11 da ff ff       	call   801017c0 <iput>
  end_op();
80103daf:	e8 7c ef ff ff       	call   80102d30 <end_op>
  curproc->cwd = 0;
80103db4:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)
  acquire(&ptable.lock);
80103dbb:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103dc2:	e8 b9 08 00 00       	call   80104680 <acquire>
  wakeup1(curproc->parent);
80103dc7:	8b 56 14             	mov    0x14(%esi),%edx
80103dca:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103dcd:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103dd2:	eb 0e                	jmp    80103de2 <exit+0x92>
80103dd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103dd8:	83 e8 80             	sub    $0xffffff80,%eax
80103ddb:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103de0:	73 1c                	jae    80103dfe <exit+0xae>
    if(p->state == SLEEPING && p->chan == chan)
80103de2:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103de6:	75 f0                	jne    80103dd8 <exit+0x88>
80103de8:	3b 50 20             	cmp    0x20(%eax),%edx
80103deb:	75 eb                	jne    80103dd8 <exit+0x88>
      p->state = RUNNABLE;
80103ded:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103df4:	83 e8 80             	sub    $0xffffff80,%eax
80103df7:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103dfc:	72 e4                	jb     80103de2 <exit+0x92>
      p->parent = initproc;
80103dfe:	8b 0d b8 a5 10 80    	mov    0x8010a5b8,%ecx
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e04:	ba 54 2d 11 80       	mov    $0x80112d54,%edx
80103e09:	eb 10                	jmp    80103e1b <exit+0xcb>
80103e0b:	90                   	nop
80103e0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e10:	83 ea 80             	sub    $0xffffff80,%edx
80103e13:	81 fa 54 4d 11 80    	cmp    $0x80114d54,%edx
80103e19:	73 33                	jae    80103e4e <exit+0xfe>
    if(p->parent == curproc){
80103e1b:	39 72 14             	cmp    %esi,0x14(%edx)
80103e1e:	75 f0                	jne    80103e10 <exit+0xc0>
      if(p->state == ZOMBIE)
80103e20:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
      p->parent = initproc;
80103e24:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103e27:	75 e7                	jne    80103e10 <exit+0xc0>
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e29:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
80103e2e:	eb 0a                	jmp    80103e3a <exit+0xea>
80103e30:	83 e8 80             	sub    $0xffffff80,%eax
80103e33:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80103e38:	73 d6                	jae    80103e10 <exit+0xc0>
    if(p->state == SLEEPING && p->chan == chan)
80103e3a:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e3e:	75 f0                	jne    80103e30 <exit+0xe0>
80103e40:	3b 48 20             	cmp    0x20(%eax),%ecx
80103e43:	75 eb                	jne    80103e30 <exit+0xe0>
      p->state = RUNNABLE;
80103e45:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103e4c:	eb e2                	jmp    80103e30 <exit+0xe0>
  curproc->state = ZOMBIE;
80103e4e:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103e55:	e8 36 fe ff ff       	call   80103c90 <sched>
  panic("zombie exit");
80103e5a:	83 ec 0c             	sub    $0xc,%esp
80103e5d:	68 84 79 10 80       	push   $0x80107984
80103e62:	e8 29 c5 ff ff       	call   80100390 <panic>
    panic("init exiting");
80103e67:	83 ec 0c             	sub    $0xc,%esp
80103e6a:	68 77 79 10 80       	push   $0x80107977
80103e6f:	e8 1c c5 ff ff       	call   80100390 <panic>
80103e74:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80103e7a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103e80 <yield>:
{
80103e80:	55                   	push   %ebp
80103e81:	89 e5                	mov    %esp,%ebp
80103e83:	53                   	push   %ebx
80103e84:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103e87:	68 20 2d 11 80       	push   $0x80112d20
80103e8c:	e8 ef 07 00 00       	call   80104680 <acquire>
  pushcli();
80103e91:	e8 1a 07 00 00       	call   801045b0 <pushcli>
  c = mycpu();
80103e96:	e8 d5 f9 ff ff       	call   80103870 <mycpu>
  p = c->proc;
80103e9b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103ea1:	e8 4a 07 00 00       	call   801045f0 <popcli>
  myproc()->state = RUNNABLE;
80103ea6:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103ead:	e8 de fd ff ff       	call   80103c90 <sched>
  release(&ptable.lock);
80103eb2:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103eb9:	e8 82 08 00 00       	call   80104740 <release>
}
80103ebe:	83 c4 10             	add    $0x10,%esp
80103ec1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103ec4:	c9                   	leave  
80103ec5:	c3                   	ret    
80103ec6:	8d 76 00             	lea    0x0(%esi),%esi
80103ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103ed0 <sleep>:
{
80103ed0:	55                   	push   %ebp
80103ed1:	89 e5                	mov    %esp,%ebp
80103ed3:	57                   	push   %edi
80103ed4:	56                   	push   %esi
80103ed5:	53                   	push   %ebx
80103ed6:	83 ec 0c             	sub    $0xc,%esp
80103ed9:	8b 7d 08             	mov    0x8(%ebp),%edi
80103edc:	8b 75 0c             	mov    0xc(%ebp),%esi
  pushcli();
80103edf:	e8 cc 06 00 00       	call   801045b0 <pushcli>
  c = mycpu();
80103ee4:	e8 87 f9 ff ff       	call   80103870 <mycpu>
  p = c->proc;
80103ee9:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103eef:	e8 fc 06 00 00       	call   801045f0 <popcli>
  if(p == 0)
80103ef4:	85 db                	test   %ebx,%ebx
80103ef6:	0f 84 87 00 00 00    	je     80103f83 <sleep+0xb3>
  if(lk == 0)
80103efc:	85 f6                	test   %esi,%esi
80103efe:	74 76                	je     80103f76 <sleep+0xa6>
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103f00:	81 fe 20 2d 11 80    	cmp    $0x80112d20,%esi
80103f06:	74 50                	je     80103f58 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103f08:	83 ec 0c             	sub    $0xc,%esp
80103f0b:	68 20 2d 11 80       	push   $0x80112d20
80103f10:	e8 6b 07 00 00       	call   80104680 <acquire>
    release(lk);
80103f15:	89 34 24             	mov    %esi,(%esp)
80103f18:	e8 23 08 00 00       	call   80104740 <release>
  p->chan = chan;
80103f1d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103f20:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103f27:	e8 64 fd ff ff       	call   80103c90 <sched>
  p->chan = 0;
80103f2c:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
    release(&ptable.lock);
80103f33:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
80103f3a:	e8 01 08 00 00       	call   80104740 <release>
    acquire(lk);
80103f3f:	89 75 08             	mov    %esi,0x8(%ebp)
80103f42:	83 c4 10             	add    $0x10,%esp
}
80103f45:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f48:	5b                   	pop    %ebx
80103f49:	5e                   	pop    %esi
80103f4a:	5f                   	pop    %edi
80103f4b:	5d                   	pop    %ebp
    acquire(lk);
80103f4c:	e9 2f 07 00 00       	jmp    80104680 <acquire>
80103f51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  p->chan = chan;
80103f58:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103f5b:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)
  sched();
80103f62:	e8 29 fd ff ff       	call   80103c90 <sched>
  p->chan = 0;
80103f67:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
}
80103f6e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103f71:	5b                   	pop    %ebx
80103f72:	5e                   	pop    %esi
80103f73:	5f                   	pop    %edi
80103f74:	5d                   	pop    %ebp
80103f75:	c3                   	ret    
    panic("sleep without lk");
80103f76:	83 ec 0c             	sub    $0xc,%esp
80103f79:	68 96 79 10 80       	push   $0x80107996
80103f7e:	e8 0d c4 ff ff       	call   80100390 <panic>
    panic("sleep");
80103f83:	83 ec 0c             	sub    $0xc,%esp
80103f86:	68 90 79 10 80       	push   $0x80107990
80103f8b:	e8 00 c4 ff ff       	call   80100390 <panic>

80103f90 <wait>:
{
80103f90:	55                   	push   %ebp
80103f91:	89 e5                	mov    %esp,%ebp
80103f93:	56                   	push   %esi
80103f94:	53                   	push   %ebx
  pushcli();
80103f95:	e8 16 06 00 00       	call   801045b0 <pushcli>
  c = mycpu();
80103f9a:	e8 d1 f8 ff ff       	call   80103870 <mycpu>
  p = c->proc;
80103f9f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103fa5:	e8 46 06 00 00       	call   801045f0 <popcli>
  acquire(&ptable.lock);
80103faa:	83 ec 0c             	sub    $0xc,%esp
80103fad:	68 20 2d 11 80       	push   $0x80112d20
80103fb2:	e8 c9 06 00 00       	call   80104680 <acquire>
80103fb7:	83 c4 10             	add    $0x10,%esp
    havekids = 0;
80103fba:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fbc:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
80103fc1:	eb 10                	jmp    80103fd3 <wait+0x43>
80103fc3:	90                   	nop
80103fc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103fc8:	83 eb 80             	sub    $0xffffff80,%ebx
80103fcb:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103fd1:	73 1b                	jae    80103fee <wait+0x5e>
      if(p->parent != curproc)
80103fd3:	39 73 14             	cmp    %esi,0x14(%ebx)
80103fd6:	75 f0                	jne    80103fc8 <wait+0x38>
      if(p->state == ZOMBIE){
80103fd8:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
80103fdc:	74 32                	je     80104010 <wait+0x80>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fde:	83 eb 80             	sub    $0xffffff80,%ebx
      havekids = 1;
80103fe1:	b8 01 00 00 00       	mov    $0x1,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103fe6:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80103fec:	72 e5                	jb     80103fd3 <wait+0x43>
    if(!havekids || curproc->killed){
80103fee:	85 c0                	test   %eax,%eax
80103ff0:	74 74                	je     80104066 <wait+0xd6>
80103ff2:	8b 46 24             	mov    0x24(%esi),%eax
80103ff5:	85 c0                	test   %eax,%eax
80103ff7:	75 6d                	jne    80104066 <wait+0xd6>
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80103ff9:	83 ec 08             	sub    $0x8,%esp
80103ffc:	68 20 2d 11 80       	push   $0x80112d20
80104001:	56                   	push   %esi
80104002:	e8 c9 fe ff ff       	call   80103ed0 <sleep>
    havekids = 0;
80104007:	83 c4 10             	add    $0x10,%esp
8010400a:	eb ae                	jmp    80103fba <wait+0x2a>
8010400c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        kfree(p->kstack);
80104010:	83 ec 0c             	sub    $0xc,%esp
80104013:	ff 73 08             	pushl  0x8(%ebx)
        pid = p->pid;
80104016:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
80104019:	e8 12 e4 ff ff       	call   80102430 <kfree>
        freevm(p->pgdir);
8010401e:	5a                   	pop    %edx
8010401f:	ff 73 04             	pushl  0x4(%ebx)
        p->kstack = 0;
80104022:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
80104029:	e8 32 30 00 00       	call   80107060 <freevm>
        release(&ptable.lock);
8010402e:	c7 04 24 20 2d 11 80 	movl   $0x80112d20,(%esp)
        p->pid = 0;
80104035:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
8010403c:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
80104043:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
80104047:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
8010404e:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
80104055:	e8 e6 06 00 00       	call   80104740 <release>
        return pid;
8010405a:	83 c4 10             	add    $0x10,%esp
}
8010405d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104060:	89 f0                	mov    %esi,%eax
80104062:	5b                   	pop    %ebx
80104063:	5e                   	pop    %esi
80104064:	5d                   	pop    %ebp
80104065:	c3                   	ret    
      release(&ptable.lock);
80104066:	83 ec 0c             	sub    $0xc,%esp
      return -1;
80104069:	be ff ff ff ff       	mov    $0xffffffff,%esi
      release(&ptable.lock);
8010406e:	68 20 2d 11 80       	push   $0x80112d20
80104073:	e8 c8 06 00 00       	call   80104740 <release>
      return -1;
80104078:	83 c4 10             	add    $0x10,%esp
8010407b:	eb e0                	jmp    8010405d <wait+0xcd>
8010407d:	8d 76 00             	lea    0x0(%esi),%esi

80104080 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104080:	55                   	push   %ebp
80104081:	89 e5                	mov    %esp,%ebp
80104083:	53                   	push   %ebx
80104084:	83 ec 10             	sub    $0x10,%esp
80104087:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010408a:	68 20 2d 11 80       	push   $0x80112d20
8010408f:	e8 ec 05 00 00       	call   80104680 <acquire>
80104094:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104097:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
8010409c:	eb 0c                	jmp    801040aa <wakeup+0x2a>
8010409e:	66 90                	xchg   %ax,%ax
801040a0:	83 e8 80             	sub    $0xffffff80,%eax
801040a3:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
801040a8:	73 1c                	jae    801040c6 <wakeup+0x46>
    if(p->state == SLEEPING && p->chan == chan)
801040aa:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
801040ae:	75 f0                	jne    801040a0 <wakeup+0x20>
801040b0:	3b 58 20             	cmp    0x20(%eax),%ebx
801040b3:	75 eb                	jne    801040a0 <wakeup+0x20>
      p->state = RUNNABLE;
801040b5:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801040bc:	83 e8 80             	sub    $0xffffff80,%eax
801040bf:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
801040c4:	72 e4                	jb     801040aa <wakeup+0x2a>
  wakeup1(chan);
  release(&ptable.lock);
801040c6:	c7 45 08 20 2d 11 80 	movl   $0x80112d20,0x8(%ebp)
}
801040cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801040d0:	c9                   	leave  
  release(&ptable.lock);
801040d1:	e9 6a 06 00 00       	jmp    80104740 <release>
801040d6:	8d 76 00             	lea    0x0(%esi),%esi
801040d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801040e0 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
801040e0:	55                   	push   %ebp
801040e1:	89 e5                	mov    %esp,%ebp
801040e3:	53                   	push   %ebx
801040e4:	83 ec 10             	sub    $0x10,%esp
801040e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
801040ea:	68 20 2d 11 80       	push   $0x80112d20
801040ef:	e8 8c 05 00 00       	call   80104680 <acquire>
801040f4:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
801040f7:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
801040fc:	eb 0c                	jmp    8010410a <kill+0x2a>
801040fe:	66 90                	xchg   %ax,%ax
80104100:	83 e8 80             	sub    $0xffffff80,%eax
80104103:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80104108:	73 36                	jae    80104140 <kill+0x60>
    if(p->pid == pid){
8010410a:	39 58 10             	cmp    %ebx,0x10(%eax)
8010410d:	75 f1                	jne    80104100 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
8010410f:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
      p->killed = 1;
80104113:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      if(p->state == SLEEPING)
8010411a:	75 07                	jne    80104123 <kill+0x43>
        p->state = RUNNABLE;
8010411c:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
      release(&ptable.lock);
80104123:	83 ec 0c             	sub    $0xc,%esp
80104126:	68 20 2d 11 80       	push   $0x80112d20
8010412b:	e8 10 06 00 00       	call   80104740 <release>
      return 0;
80104130:	83 c4 10             	add    $0x10,%esp
80104133:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
80104135:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104138:	c9                   	leave  
80104139:	c3                   	ret    
8010413a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
80104140:	83 ec 0c             	sub    $0xc,%esp
80104143:	68 20 2d 11 80       	push   $0x80112d20
80104148:	e8 f3 05 00 00       	call   80104740 <release>
  return -1;
8010414d:	83 c4 10             	add    $0x10,%esp
80104150:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104155:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104158:	c9                   	leave  
80104159:	c3                   	ret    
8010415a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104160 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104160:	55                   	push   %ebp
80104161:	89 e5                	mov    %esp,%ebp
80104163:	57                   	push   %edi
80104164:	56                   	push   %esi
80104165:	53                   	push   %ebx
80104166:	8d 75 e8             	lea    -0x18(%ebp),%esi
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104169:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
{
8010416e:	83 ec 3c             	sub    $0x3c,%esp
80104171:	eb 24                	jmp    80104197 <procdump+0x37>
80104173:	90                   	nop
80104174:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104178:	83 ec 0c             	sub    $0xc,%esp
8010417b:	68 f3 79 10 80       	push   $0x801079f3
80104180:	e8 db c4 ff ff       	call   80100660 <cprintf>
80104185:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104188:	83 eb 80             	sub    $0xffffff80,%ebx
8010418b:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80104191:	0f 83 81 00 00 00    	jae    80104218 <procdump+0xb8>
    if(p->state == UNUSED)
80104197:	8b 43 0c             	mov    0xc(%ebx),%eax
8010419a:	85 c0                	test   %eax,%eax
8010419c:	74 ea                	je     80104188 <procdump+0x28>
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
8010419e:	83 f8 05             	cmp    $0x5,%eax
      state = "???";
801041a1:	ba a7 79 10 80       	mov    $0x801079a7,%edx
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
801041a6:	77 11                	ja     801041b9 <procdump+0x59>
801041a8:	8b 14 85 90 7a 10 80 	mov    -0x7fef8570(,%eax,4),%edx
      state = "???";
801041af:	b8 a7 79 10 80       	mov    $0x801079a7,%eax
801041b4:	85 d2                	test   %edx,%edx
801041b6:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
801041b9:	8d 43 6c             	lea    0x6c(%ebx),%eax
801041bc:	50                   	push   %eax
801041bd:	52                   	push   %edx
801041be:	ff 73 10             	pushl  0x10(%ebx)
801041c1:	68 ab 79 10 80       	push   $0x801079ab
801041c6:	e8 95 c4 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
801041cb:	83 c4 10             	add    $0x10,%esp
801041ce:	83 7b 0c 02          	cmpl   $0x2,0xc(%ebx)
801041d2:	75 a4                	jne    80104178 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
801041d4:	8d 45 c0             	lea    -0x40(%ebp),%eax
801041d7:	83 ec 08             	sub    $0x8,%esp
801041da:	8d 7d c0             	lea    -0x40(%ebp),%edi
801041dd:	50                   	push   %eax
801041de:	8b 43 1c             	mov    0x1c(%ebx),%eax
801041e1:	8b 40 0c             	mov    0xc(%eax),%eax
801041e4:	83 c0 08             	add    $0x8,%eax
801041e7:	50                   	push   %eax
801041e8:	e8 73 03 00 00       	call   80104560 <getcallerpcs>
801041ed:	83 c4 10             	add    $0x10,%esp
      for(i=0; i<10 && pc[i] != 0; i++)
801041f0:	8b 17                	mov    (%edi),%edx
801041f2:	85 d2                	test   %edx,%edx
801041f4:	74 82                	je     80104178 <procdump+0x18>
        cprintf(" %p", pc[i]);
801041f6:	83 ec 08             	sub    $0x8,%esp
801041f9:	83 c7 04             	add    $0x4,%edi
801041fc:	52                   	push   %edx
801041fd:	68 c1 73 10 80       	push   $0x801073c1
80104202:	e8 59 c4 ff ff       	call   80100660 <cprintf>
      for(i=0; i<10 && pc[i] != 0; i++)
80104207:	83 c4 10             	add    $0x10,%esp
8010420a:	39 fe                	cmp    %edi,%esi
8010420c:	75 e2                	jne    801041f0 <procdump+0x90>
8010420e:	e9 65 ff ff ff       	jmp    80104178 <procdump+0x18>
80104213:	90                   	nop
80104214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }
}
80104218:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010421b:	5b                   	pop    %ebx
8010421c:	5e                   	pop    %esi
8010421d:	5f                   	pop    %edi
8010421e:	5d                   	pop    %ebp
8010421f:	c3                   	ret    

80104220 <getnice>:

int
getnice(int pid)
{
80104220:	55                   	push   %ebp
80104221:	89 e5                	mov    %esp,%ebp
80104223:	53                   	push   %ebx
80104224:	83 ec 10             	sub    $0x10,%esp
80104227:	8b 5d 08             	mov    0x8(%ebp),%ebx

  struct proc *p;
  int niceValue = -1;

  acquire(&ptable.lock);
8010422a:	68 20 2d 11 80       	push   $0x80112d20
8010422f:	e8 4c 04 00 00       	call   80104680 <acquire>
80104234:	83 c4 10             	add    $0x10,%esp

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104237:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
8010423c:	eb 0c                	jmp    8010424a <getnice+0x2a>
8010423e:	66 90                	xchg   %ax,%ax
80104240:	83 e8 80             	sub    $0xffffff80,%eax
80104243:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
80104248:	73 26                	jae    80104270 <getnice+0x50>
  {
    if(p->pid == pid && p->state)
8010424a:	39 58 10             	cmp    %ebx,0x10(%eax)
8010424d:	75 f1                	jne    80104240 <getnice+0x20>
8010424f:	8b 50 0c             	mov    0xc(%eax),%edx
80104252:	85 d2                	test   %edx,%edx
80104254:	74 ea                	je     80104240 <getnice+0x20>
    {
      niceValue = p->priority;
80104256:	8b 58 7c             	mov    0x7c(%eax),%ebx
      break;
    }
  }
  
  release(&ptable.lock);
80104259:	83 ec 0c             	sub    $0xc,%esp
8010425c:	68 20 2d 11 80       	push   $0x80112d20
80104261:	e8 da 04 00 00       	call   80104740 <release>

  return niceValue;
}
80104266:	89 d8                	mov    %ebx,%eax
80104268:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010426b:	c9                   	leave  
8010426c:	c3                   	ret    
8010426d:	8d 76 00             	lea    0x0(%esi),%esi
  int niceValue = -1;
80104270:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104275:	eb e2                	jmp    80104259 <getnice+0x39>
80104277:	89 f6                	mov    %esi,%esi
80104279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104280 <setnice>:

int
setnice(int pid, int value)
{
80104280:	55                   	push   %ebp
80104281:	89 e5                	mov    %esp,%ebp
80104283:	56                   	push   %esi
80104284:	53                   	push   %ebx
80104285:	8b 75 0c             	mov    0xc(%ebp),%esi
80104288:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;
  int flag = 0;

  if(value < 0 || value >= 40) return -1;
8010428b:	83 fe 27             	cmp    $0x27,%esi
8010428e:	77 74                	ja     80104304 <setnice+0x84>

  acquire(&ptable.lock);
80104290:	83 ec 0c             	sub    $0xc,%esp
80104293:	68 20 2d 11 80       	push   $0x80112d20
80104298:	e8 e3 03 00 00       	call   80104680 <acquire>
8010429d:	83 c4 10             	add    $0x10,%esp

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801042a0:	b8 54 2d 11 80       	mov    $0x80112d54,%eax
801042a5:	eb 13                	jmp    801042ba <setnice+0x3a>
801042a7:	89 f6                	mov    %esi,%esi
801042a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801042b0:	83 e8 80             	sub    $0xffffff80,%eax
801042b3:	3d 54 4d 11 80       	cmp    $0x80114d54,%eax
801042b8:	73 2e                	jae    801042e8 <setnice+0x68>
  {
    if(p->pid == pid && p->state)
801042ba:	39 58 10             	cmp    %ebx,0x10(%eax)
801042bd:	75 f1                	jne    801042b0 <setnice+0x30>
801042bf:	8b 50 0c             	mov    0xc(%eax),%edx
801042c2:	85 d2                	test   %edx,%edx
801042c4:	74 ea                	je     801042b0 <setnice+0x30>
      flag = 1;
      break;
    }
  }

  release(&ptable.lock);
801042c6:	83 ec 0c             	sub    $0xc,%esp
      p->priority = value;
801042c9:	89 70 7c             	mov    %esi,0x7c(%eax)
  release(&ptable.lock);
801042cc:	68 20 2d 11 80       	push   $0x80112d20
801042d1:	e8 6a 04 00 00       	call   80104740 <release>
801042d6:	83 c4 10             	add    $0x10,%esp

  if(flag)
    return 0;
801042d9:	31 c0                	xor    %eax,%eax
  else 
    return -1;
}
801042db:	8d 65 f8             	lea    -0x8(%ebp),%esp
801042de:	5b                   	pop    %ebx
801042df:	5e                   	pop    %esi
801042e0:	5d                   	pop    %ebp
801042e1:	c3                   	ret    
801042e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  release(&ptable.lock);
801042e8:	83 ec 0c             	sub    $0xc,%esp
801042eb:	68 20 2d 11 80       	push   $0x80112d20
801042f0:	e8 4b 04 00 00       	call   80104740 <release>
    return -1;
801042f5:	83 c4 10             	add    $0x10,%esp
}
801042f8:	8d 65 f8             	lea    -0x8(%ebp),%esp
    return -1;
801042fb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
80104300:	5b                   	pop    %ebx
80104301:	5e                   	pop    %esi
80104302:	5d                   	pop    %ebp
80104303:	c3                   	ret    
  if(value < 0 || value >= 40) return -1;
80104304:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104309:	eb d0                	jmp    801042db <setnice+0x5b>
8010430b:	90                   	nop
8010430c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104310 <ps>:

void 
ps(int pid)
{
80104310:	55                   	push   %ebp
80104311:	89 e5                	mov    %esp,%ebp
80104313:	56                   	push   %esi
80104314:	53                   	push   %ebx
80104315:	8b 75 08             	mov    0x8(%ebp),%esi
      if(p->state)
        cprintf("%s \t %d \t %s \t %d \n", p->name, p->pid, states[p->state], p->priority);
  }
  else
  {
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104318:	bb 54 2d 11 80       	mov    $0x80112d54,%ebx
  acquire(&ptable.lock);
8010431d:	83 ec 0c             	sub    $0xc,%esp
80104320:	68 20 2d 11 80       	push   $0x80112d20
80104325:	e8 56 03 00 00       	call   80104680 <acquire>
  if(pid == 0)
8010432a:	83 c4 10             	add    $0x10,%esp
8010432d:	85 f6                	test   %esi,%esi
8010432f:	75 12                	jne    80104343 <ps+0x33>
80104331:	eb 77                	jmp    801043aa <ps+0x9a>
80104333:	90                   	nop
80104334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104338:	83 eb 80             	sub    $0xffffff80,%ebx
8010433b:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80104341:	73 55                	jae    80104398 <ps+0x88>
      if(p->pid == pid)
80104343:	39 73 10             	cmp    %esi,0x10(%ebx)
80104346:	75 f0                	jne    80104338 <ps+0x28>
      {
        cprintf("%s \t %s \t %s \t\t %s \n", "name", "pid", "state", "priority");
80104348:	83 ec 0c             	sub    $0xc,%esp
8010434b:	68 b4 79 10 80       	push   $0x801079b4
80104350:	68 bd 79 10 80       	push   $0x801079bd
80104355:	68 c3 79 10 80       	push   $0x801079c3
8010435a:	68 c7 79 10 80       	push   $0x801079c7
8010435f:	68 cc 79 10 80       	push   $0x801079cc
80104364:	e8 f7 c2 ff ff       	call   80100660 <cprintf>
        cprintf("%s \t %d \t %s \t %d \n", p->name, p->pid, states[p->state], p->priority);
80104369:	8b 43 0c             	mov    0xc(%ebx),%eax
8010436c:	83 c4 14             	add    $0x14,%esp
8010436f:	ff 73 7c             	pushl  0x7c(%ebx)
80104372:	ff 34 85 78 7a 10 80 	pushl  -0x7fef8588(,%eax,4)
80104379:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010437c:	ff 73 10             	pushl  0x10(%ebx)
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010437f:	83 eb 80             	sub    $0xffffff80,%ebx
        cprintf("%s \t %d \t %s \t %d \n", p->name, p->pid, states[p->state], p->priority);
80104382:	50                   	push   %eax
80104383:	68 e1 79 10 80       	push   $0x801079e1
80104388:	e8 d3 c2 ff ff       	call   80100660 <cprintf>
8010438d:	83 c4 20             	add    $0x20,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104390:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
80104396:	72 ab                	jb     80104343 <ps+0x33>
      }
  }
  
  release(&ptable.lock);
80104398:	c7 45 08 20 2d 11 80 	movl   $0x80112d20,0x8(%ebp)

}
8010439f:	8d 65 f8             	lea    -0x8(%ebp),%esp
801043a2:	5b                   	pop    %ebx
801043a3:	5e                   	pop    %esi
801043a4:	5d                   	pop    %ebp
  release(&ptable.lock);
801043a5:	e9 96 03 00 00       	jmp    80104740 <release>
    cprintf("%s \t %s \t %s \t\t %s \n", "name", "pid", "state", "priority");
801043aa:	83 ec 0c             	sub    $0xc,%esp
801043ad:	68 b4 79 10 80       	push   $0x801079b4
801043b2:	68 bd 79 10 80       	push   $0x801079bd
801043b7:	68 c3 79 10 80       	push   $0x801079c3
801043bc:	68 c7 79 10 80       	push   $0x801079c7
801043c1:	68 cc 79 10 80       	push   $0x801079cc
801043c6:	e8 95 c2 ff ff       	call   80100660 <cprintf>
801043cb:	83 c4 20             	add    $0x20,%esp
801043ce:	eb 0b                	jmp    801043db <ps+0xcb>
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801043d0:	83 eb 80             	sub    $0xffffff80,%ebx
801043d3:	81 fb 54 4d 11 80    	cmp    $0x80114d54,%ebx
801043d9:	73 bd                	jae    80104398 <ps+0x88>
      if(p->state)
801043db:	8b 43 0c             	mov    0xc(%ebx),%eax
801043de:	85 c0                	test   %eax,%eax
801043e0:	74 ee                	je     801043d0 <ps+0xc0>
        cprintf("%s \t %d \t %s \t %d \n", p->name, p->pid, states[p->state], p->priority);
801043e2:	83 ec 0c             	sub    $0xc,%esp
801043e5:	ff 73 7c             	pushl  0x7c(%ebx)
801043e8:	ff 34 85 78 7a 10 80 	pushl  -0x7fef8588(,%eax,4)
801043ef:	8d 43 6c             	lea    0x6c(%ebx),%eax
801043f2:	ff 73 10             	pushl  0x10(%ebx)
801043f5:	50                   	push   %eax
801043f6:	68 e1 79 10 80       	push   $0x801079e1
801043fb:	e8 60 c2 ff ff       	call   80100660 <cprintf>
80104400:	83 c4 20             	add    $0x20,%esp
80104403:	eb cb                	jmp    801043d0 <ps+0xc0>
80104405:	66 90                	xchg   %ax,%ax
80104407:	66 90                	xchg   %ax,%ax
80104409:	66 90                	xchg   %ax,%ax
8010440b:	66 90                	xchg   %ax,%ax
8010440d:	66 90                	xchg   %ax,%ax
8010440f:	90                   	nop

80104410 <initsleeplock>:
80104410:	55                   	push   %ebp
80104411:	89 e5                	mov    %esp,%ebp
80104413:	53                   	push   %ebx
80104414:	83 ec 0c             	sub    $0xc,%esp
80104417:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010441a:	68 a8 7a 10 80       	push   $0x80107aa8
8010441f:	8d 43 04             	lea    0x4(%ebx),%eax
80104422:	50                   	push   %eax
80104423:	e8 18 01 00 00       	call   80104540 <initlock>
80104428:	8b 45 0c             	mov    0xc(%ebp),%eax
8010442b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104431:	83 c4 10             	add    $0x10,%esp
80104434:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
8010443b:	89 43 38             	mov    %eax,0x38(%ebx)
8010443e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104441:	c9                   	leave  
80104442:	c3                   	ret    
80104443:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104450 <acquiresleep>:
80104450:	55                   	push   %ebp
80104451:	89 e5                	mov    %esp,%ebp
80104453:	56                   	push   %esi
80104454:	53                   	push   %ebx
80104455:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104458:	83 ec 0c             	sub    $0xc,%esp
8010445b:	8d 73 04             	lea    0x4(%ebx),%esi
8010445e:	56                   	push   %esi
8010445f:	e8 1c 02 00 00       	call   80104680 <acquire>
80104464:	8b 13                	mov    (%ebx),%edx
80104466:	83 c4 10             	add    $0x10,%esp
80104469:	85 d2                	test   %edx,%edx
8010446b:	74 16                	je     80104483 <acquiresleep+0x33>
8010446d:	8d 76 00             	lea    0x0(%esi),%esi
80104470:	83 ec 08             	sub    $0x8,%esp
80104473:	56                   	push   %esi
80104474:	53                   	push   %ebx
80104475:	e8 56 fa ff ff       	call   80103ed0 <sleep>
8010447a:	8b 03                	mov    (%ebx),%eax
8010447c:	83 c4 10             	add    $0x10,%esp
8010447f:	85 c0                	test   %eax,%eax
80104481:	75 ed                	jne    80104470 <acquiresleep+0x20>
80104483:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80104489:	e8 82 f4 ff ff       	call   80103910 <myproc>
8010448e:	8b 40 10             	mov    0x10(%eax),%eax
80104491:	89 43 3c             	mov    %eax,0x3c(%ebx)
80104494:	89 75 08             	mov    %esi,0x8(%ebp)
80104497:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010449a:	5b                   	pop    %ebx
8010449b:	5e                   	pop    %esi
8010449c:	5d                   	pop    %ebp
8010449d:	e9 9e 02 00 00       	jmp    80104740 <release>
801044a2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801044a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801044b0 <releasesleep>:
801044b0:	55                   	push   %ebp
801044b1:	89 e5                	mov    %esp,%ebp
801044b3:	56                   	push   %esi
801044b4:	53                   	push   %ebx
801044b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801044b8:	83 ec 0c             	sub    $0xc,%esp
801044bb:	8d 73 04             	lea    0x4(%ebx),%esi
801044be:	56                   	push   %esi
801044bf:	e8 bc 01 00 00       	call   80104680 <acquire>
801044c4:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801044ca:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801044d1:	89 1c 24             	mov    %ebx,(%esp)
801044d4:	e8 a7 fb ff ff       	call   80104080 <wakeup>
801044d9:	89 75 08             	mov    %esi,0x8(%ebp)
801044dc:	83 c4 10             	add    $0x10,%esp
801044df:	8d 65 f8             	lea    -0x8(%ebp),%esp
801044e2:	5b                   	pop    %ebx
801044e3:	5e                   	pop    %esi
801044e4:	5d                   	pop    %ebp
801044e5:	e9 56 02 00 00       	jmp    80104740 <release>
801044ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801044f0 <holdingsleep>:
801044f0:	55                   	push   %ebp
801044f1:	89 e5                	mov    %esp,%ebp
801044f3:	57                   	push   %edi
801044f4:	56                   	push   %esi
801044f5:	53                   	push   %ebx
801044f6:	31 ff                	xor    %edi,%edi
801044f8:	83 ec 18             	sub    $0x18,%esp
801044fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801044fe:	8d 73 04             	lea    0x4(%ebx),%esi
80104501:	56                   	push   %esi
80104502:	e8 79 01 00 00       	call   80104680 <acquire>
80104507:	8b 03                	mov    (%ebx),%eax
80104509:	83 c4 10             	add    $0x10,%esp
8010450c:	85 c0                	test   %eax,%eax
8010450e:	74 13                	je     80104523 <holdingsleep+0x33>
80104510:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
80104513:	e8 f8 f3 ff ff       	call   80103910 <myproc>
80104518:	39 58 10             	cmp    %ebx,0x10(%eax)
8010451b:	0f 94 c0             	sete   %al
8010451e:	0f b6 c0             	movzbl %al,%eax
80104521:	89 c7                	mov    %eax,%edi
80104523:	83 ec 0c             	sub    $0xc,%esp
80104526:	56                   	push   %esi
80104527:	e8 14 02 00 00       	call   80104740 <release>
8010452c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010452f:	89 f8                	mov    %edi,%eax
80104531:	5b                   	pop    %ebx
80104532:	5e                   	pop    %esi
80104533:	5f                   	pop    %edi
80104534:	5d                   	pop    %ebp
80104535:	c3                   	ret    
80104536:	66 90                	xchg   %ax,%ax
80104538:	66 90                	xchg   %ax,%ax
8010453a:	66 90                	xchg   %ax,%ax
8010453c:	66 90                	xchg   %ax,%ax
8010453e:	66 90                	xchg   %ax,%ax

80104540 <initlock>:
80104540:	55                   	push   %ebp
80104541:	89 e5                	mov    %esp,%ebp
80104543:	8b 45 08             	mov    0x8(%ebp),%eax
80104546:	8b 55 0c             	mov    0xc(%ebp),%edx
80104549:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
8010454f:	89 50 04             	mov    %edx,0x4(%eax)
80104552:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
80104559:	5d                   	pop    %ebp
8010455a:	c3                   	ret    
8010455b:	90                   	nop
8010455c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104560 <getcallerpcs>:
80104560:	55                   	push   %ebp
80104561:	31 d2                	xor    %edx,%edx
80104563:	89 e5                	mov    %esp,%ebp
80104565:	53                   	push   %ebx
80104566:	8b 45 08             	mov    0x8(%ebp),%eax
80104569:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010456c:	83 e8 08             	sub    $0x8,%eax
8010456f:	90                   	nop
80104570:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80104576:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
8010457c:	77 1a                	ja     80104598 <getcallerpcs+0x38>
8010457e:	8b 58 04             	mov    0x4(%eax),%ebx
80104581:	89 1c 91             	mov    %ebx,(%ecx,%edx,4)
80104584:	83 c2 01             	add    $0x1,%edx
80104587:	8b 00                	mov    (%eax),%eax
80104589:	83 fa 0a             	cmp    $0xa,%edx
8010458c:	75 e2                	jne    80104570 <getcallerpcs+0x10>
8010458e:	5b                   	pop    %ebx
8010458f:	5d                   	pop    %ebp
80104590:	c3                   	ret    
80104591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104598:	8d 04 91             	lea    (%ecx,%edx,4),%eax
8010459b:	83 c1 28             	add    $0x28,%ecx
8010459e:	66 90                	xchg   %ax,%ax
801045a0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801045a6:	83 c0 04             	add    $0x4,%eax
801045a9:	39 c1                	cmp    %eax,%ecx
801045ab:	75 f3                	jne    801045a0 <getcallerpcs+0x40>
801045ad:	5b                   	pop    %ebx
801045ae:	5d                   	pop    %ebp
801045af:	c3                   	ret    

801045b0 <pushcli>:
801045b0:	55                   	push   %ebp
801045b1:	89 e5                	mov    %esp,%ebp
801045b3:	53                   	push   %ebx
801045b4:	83 ec 04             	sub    $0x4,%esp
801045b7:	9c                   	pushf  
801045b8:	5b                   	pop    %ebx
801045b9:	fa                   	cli    
801045ba:	e8 b1 f2 ff ff       	call   80103870 <mycpu>
801045bf:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
801045c5:	85 c0                	test   %eax,%eax
801045c7:	75 11                	jne    801045da <pushcli+0x2a>
801045c9:	81 e3 00 02 00 00    	and    $0x200,%ebx
801045cf:	e8 9c f2 ff ff       	call   80103870 <mycpu>
801045d4:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
801045da:	e8 91 f2 ff ff       	call   80103870 <mycpu>
801045df:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
801045e6:	83 c4 04             	add    $0x4,%esp
801045e9:	5b                   	pop    %ebx
801045ea:	5d                   	pop    %ebp
801045eb:	c3                   	ret    
801045ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801045f0 <popcli>:
801045f0:	55                   	push   %ebp
801045f1:	89 e5                	mov    %esp,%ebp
801045f3:	83 ec 08             	sub    $0x8,%esp
801045f6:	9c                   	pushf  
801045f7:	58                   	pop    %eax
801045f8:	f6 c4 02             	test   $0x2,%ah
801045fb:	75 35                	jne    80104632 <popcli+0x42>
801045fd:	e8 6e f2 ff ff       	call   80103870 <mycpu>
80104602:	83 a8 a4 00 00 00 01 	subl   $0x1,0xa4(%eax)
80104609:	78 34                	js     8010463f <popcli+0x4f>
8010460b:	e8 60 f2 ff ff       	call   80103870 <mycpu>
80104610:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104616:	85 d2                	test   %edx,%edx
80104618:	74 06                	je     80104620 <popcli+0x30>
8010461a:	c9                   	leave  
8010461b:	c3                   	ret    
8010461c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104620:	e8 4b f2 ff ff       	call   80103870 <mycpu>
80104625:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
8010462b:	85 c0                	test   %eax,%eax
8010462d:	74 eb                	je     8010461a <popcli+0x2a>
8010462f:	fb                   	sti    
80104630:	c9                   	leave  
80104631:	c3                   	ret    
80104632:	83 ec 0c             	sub    $0xc,%esp
80104635:	68 b3 7a 10 80       	push   $0x80107ab3
8010463a:	e8 51 bd ff ff       	call   80100390 <panic>
8010463f:	83 ec 0c             	sub    $0xc,%esp
80104642:	68 ca 7a 10 80       	push   $0x80107aca
80104647:	e8 44 bd ff ff       	call   80100390 <panic>
8010464c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104650 <holding>:
80104650:	55                   	push   %ebp
80104651:	89 e5                	mov    %esp,%ebp
80104653:	56                   	push   %esi
80104654:	53                   	push   %ebx
80104655:	8b 75 08             	mov    0x8(%ebp),%esi
80104658:	31 db                	xor    %ebx,%ebx
8010465a:	e8 51 ff ff ff       	call   801045b0 <pushcli>
8010465f:	8b 06                	mov    (%esi),%eax
80104661:	85 c0                	test   %eax,%eax
80104663:	74 10                	je     80104675 <holding+0x25>
80104665:	8b 5e 08             	mov    0x8(%esi),%ebx
80104668:	e8 03 f2 ff ff       	call   80103870 <mycpu>
8010466d:	39 c3                	cmp    %eax,%ebx
8010466f:	0f 94 c3             	sete   %bl
80104672:	0f b6 db             	movzbl %bl,%ebx
80104675:	e8 76 ff ff ff       	call   801045f0 <popcli>
8010467a:	89 d8                	mov    %ebx,%eax
8010467c:	5b                   	pop    %ebx
8010467d:	5e                   	pop    %esi
8010467e:	5d                   	pop    %ebp
8010467f:	c3                   	ret    

80104680 <acquire>:
80104680:	55                   	push   %ebp
80104681:	89 e5                	mov    %esp,%ebp
80104683:	56                   	push   %esi
80104684:	53                   	push   %ebx
80104685:	e8 26 ff ff ff       	call   801045b0 <pushcli>
8010468a:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010468d:	83 ec 0c             	sub    $0xc,%esp
80104690:	53                   	push   %ebx
80104691:	e8 ba ff ff ff       	call   80104650 <holding>
80104696:	83 c4 10             	add    $0x10,%esp
80104699:	85 c0                	test   %eax,%eax
8010469b:	0f 85 83 00 00 00    	jne    80104724 <acquire+0xa4>
801046a1:	89 c6                	mov    %eax,%esi
801046a3:	ba 01 00 00 00       	mov    $0x1,%edx
801046a8:	eb 09                	jmp    801046b3 <acquire+0x33>
801046aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801046b0:	8b 5d 08             	mov    0x8(%ebp),%ebx
801046b3:	89 d0                	mov    %edx,%eax
801046b5:	f0 87 03             	lock xchg %eax,(%ebx)
801046b8:	85 c0                	test   %eax,%eax
801046ba:	75 f4                	jne    801046b0 <acquire+0x30>
801046bc:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
801046c1:	8b 5d 08             	mov    0x8(%ebp),%ebx
801046c4:	e8 a7 f1 ff ff       	call   80103870 <mycpu>
801046c9:	8d 53 0c             	lea    0xc(%ebx),%edx
801046cc:	89 43 08             	mov    %eax,0x8(%ebx)
801046cf:	89 e8                	mov    %ebp,%eax
801046d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801046d8:	8d 88 00 00 00 80    	lea    -0x80000000(%eax),%ecx
801046de:	81 f9 fe ff ff 7f    	cmp    $0x7ffffffe,%ecx
801046e4:	77 1a                	ja     80104700 <acquire+0x80>
801046e6:	8b 48 04             	mov    0x4(%eax),%ecx
801046e9:	89 0c b2             	mov    %ecx,(%edx,%esi,4)
801046ec:	83 c6 01             	add    $0x1,%esi
801046ef:	8b 00                	mov    (%eax),%eax
801046f1:	83 fe 0a             	cmp    $0xa,%esi
801046f4:	75 e2                	jne    801046d8 <acquire+0x58>
801046f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
801046f9:	5b                   	pop    %ebx
801046fa:	5e                   	pop    %esi
801046fb:	5d                   	pop    %ebp
801046fc:	c3                   	ret    
801046fd:	8d 76 00             	lea    0x0(%esi),%esi
80104700:	8d 04 b2             	lea    (%edx,%esi,4),%eax
80104703:	83 c2 28             	add    $0x28,%edx
80104706:	8d 76 00             	lea    0x0(%esi),%esi
80104709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104710:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80104716:	83 c0 04             	add    $0x4,%eax
80104719:	39 d0                	cmp    %edx,%eax
8010471b:	75 f3                	jne    80104710 <acquire+0x90>
8010471d:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104720:	5b                   	pop    %ebx
80104721:	5e                   	pop    %esi
80104722:	5d                   	pop    %ebp
80104723:	c3                   	ret    
80104724:	83 ec 0c             	sub    $0xc,%esp
80104727:	68 d1 7a 10 80       	push   $0x80107ad1
8010472c:	e8 5f bc ff ff       	call   80100390 <panic>
80104731:	eb 0d                	jmp    80104740 <release>
80104733:	90                   	nop
80104734:	90                   	nop
80104735:	90                   	nop
80104736:	90                   	nop
80104737:	90                   	nop
80104738:	90                   	nop
80104739:	90                   	nop
8010473a:	90                   	nop
8010473b:	90                   	nop
8010473c:	90                   	nop
8010473d:	90                   	nop
8010473e:	90                   	nop
8010473f:	90                   	nop

80104740 <release>:
80104740:	55                   	push   %ebp
80104741:	89 e5                	mov    %esp,%ebp
80104743:	53                   	push   %ebx
80104744:	83 ec 10             	sub    $0x10,%esp
80104747:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010474a:	53                   	push   %ebx
8010474b:	e8 00 ff ff ff       	call   80104650 <holding>
80104750:	83 c4 10             	add    $0x10,%esp
80104753:	85 c0                	test   %eax,%eax
80104755:	74 22                	je     80104779 <release+0x39>
80104757:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
8010475e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80104765:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
8010476a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104770:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104773:	c9                   	leave  
80104774:	e9 77 fe ff ff       	jmp    801045f0 <popcli>
80104779:	83 ec 0c             	sub    $0xc,%esp
8010477c:	68 d9 7a 10 80       	push   $0x80107ad9
80104781:	e8 0a bc ff ff       	call   80100390 <panic>
80104786:	66 90                	xchg   %ax,%ax
80104788:	66 90                	xchg   %ax,%ax
8010478a:	66 90                	xchg   %ax,%ax
8010478c:	66 90                	xchg   %ax,%ax
8010478e:	66 90                	xchg   %ax,%ax

80104790 <memset>:
80104790:	55                   	push   %ebp
80104791:	89 e5                	mov    %esp,%ebp
80104793:	57                   	push   %edi
80104794:	53                   	push   %ebx
80104795:	8b 55 08             	mov    0x8(%ebp),%edx
80104798:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010479b:	f6 c2 03             	test   $0x3,%dl
8010479e:	75 05                	jne    801047a5 <memset+0x15>
801047a0:	f6 c1 03             	test   $0x3,%cl
801047a3:	74 13                	je     801047b8 <memset+0x28>
801047a5:	89 d7                	mov    %edx,%edi
801047a7:	8b 45 0c             	mov    0xc(%ebp),%eax
801047aa:	fc                   	cld    
801047ab:	f3 aa                	rep stos %al,%es:(%edi)
801047ad:	5b                   	pop    %ebx
801047ae:	89 d0                	mov    %edx,%eax
801047b0:	5f                   	pop    %edi
801047b1:	5d                   	pop    %ebp
801047b2:	c3                   	ret    
801047b3:	90                   	nop
801047b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801047b8:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
801047bc:	c1 e9 02             	shr    $0x2,%ecx
801047bf:	89 f8                	mov    %edi,%eax
801047c1:	89 fb                	mov    %edi,%ebx
801047c3:	c1 e0 18             	shl    $0x18,%eax
801047c6:	c1 e3 10             	shl    $0x10,%ebx
801047c9:	09 d8                	or     %ebx,%eax
801047cb:	09 f8                	or     %edi,%eax
801047cd:	c1 e7 08             	shl    $0x8,%edi
801047d0:	09 f8                	or     %edi,%eax
801047d2:	89 d7                	mov    %edx,%edi
801047d4:	fc                   	cld    
801047d5:	f3 ab                	rep stos %eax,%es:(%edi)
801047d7:	5b                   	pop    %ebx
801047d8:	89 d0                	mov    %edx,%eax
801047da:	5f                   	pop    %edi
801047db:	5d                   	pop    %ebp
801047dc:	c3                   	ret    
801047dd:	8d 76 00             	lea    0x0(%esi),%esi

801047e0 <memcmp>:
801047e0:	55                   	push   %ebp
801047e1:	89 e5                	mov    %esp,%ebp
801047e3:	57                   	push   %edi
801047e4:	56                   	push   %esi
801047e5:	53                   	push   %ebx
801047e6:	8b 5d 10             	mov    0x10(%ebp),%ebx
801047e9:	8b 75 08             	mov    0x8(%ebp),%esi
801047ec:	8b 7d 0c             	mov    0xc(%ebp),%edi
801047ef:	85 db                	test   %ebx,%ebx
801047f1:	74 29                	je     8010481c <memcmp+0x3c>
801047f3:	0f b6 16             	movzbl (%esi),%edx
801047f6:	0f b6 0f             	movzbl (%edi),%ecx
801047f9:	38 d1                	cmp    %dl,%cl
801047fb:	75 2b                	jne    80104828 <memcmp+0x48>
801047fd:	b8 01 00 00 00       	mov    $0x1,%eax
80104802:	eb 14                	jmp    80104818 <memcmp+0x38>
80104804:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104808:	0f b6 14 06          	movzbl (%esi,%eax,1),%edx
8010480c:	83 c0 01             	add    $0x1,%eax
8010480f:	0f b6 4c 07 ff       	movzbl -0x1(%edi,%eax,1),%ecx
80104814:	38 ca                	cmp    %cl,%dl
80104816:	75 10                	jne    80104828 <memcmp+0x48>
80104818:	39 d8                	cmp    %ebx,%eax
8010481a:	75 ec                	jne    80104808 <memcmp+0x28>
8010481c:	5b                   	pop    %ebx
8010481d:	31 c0                	xor    %eax,%eax
8010481f:	5e                   	pop    %esi
80104820:	5f                   	pop    %edi
80104821:	5d                   	pop    %ebp
80104822:	c3                   	ret    
80104823:	90                   	nop
80104824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104828:	0f b6 c2             	movzbl %dl,%eax
8010482b:	5b                   	pop    %ebx
8010482c:	29 c8                	sub    %ecx,%eax
8010482e:	5e                   	pop    %esi
8010482f:	5f                   	pop    %edi
80104830:	5d                   	pop    %ebp
80104831:	c3                   	ret    
80104832:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104840 <memmove>:
80104840:	55                   	push   %ebp
80104841:	89 e5                	mov    %esp,%ebp
80104843:	56                   	push   %esi
80104844:	53                   	push   %ebx
80104845:	8b 45 08             	mov    0x8(%ebp),%eax
80104848:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010484b:	8b 75 10             	mov    0x10(%ebp),%esi
8010484e:	39 c3                	cmp    %eax,%ebx
80104850:	73 26                	jae    80104878 <memmove+0x38>
80104852:	8d 0c 33             	lea    (%ebx,%esi,1),%ecx
80104855:	39 c8                	cmp    %ecx,%eax
80104857:	73 1f                	jae    80104878 <memmove+0x38>
80104859:	85 f6                	test   %esi,%esi
8010485b:	8d 56 ff             	lea    -0x1(%esi),%edx
8010485e:	74 0f                	je     8010486f <memmove+0x2f>
80104860:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104864:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104867:	83 ea 01             	sub    $0x1,%edx
8010486a:	83 fa ff             	cmp    $0xffffffff,%edx
8010486d:	75 f1                	jne    80104860 <memmove+0x20>
8010486f:	5b                   	pop    %ebx
80104870:	5e                   	pop    %esi
80104871:	5d                   	pop    %ebp
80104872:	c3                   	ret    
80104873:	90                   	nop
80104874:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104878:	31 d2                	xor    %edx,%edx
8010487a:	85 f6                	test   %esi,%esi
8010487c:	74 f1                	je     8010486f <memmove+0x2f>
8010487e:	66 90                	xchg   %ax,%ax
80104880:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104884:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104887:	83 c2 01             	add    $0x1,%edx
8010488a:	39 d6                	cmp    %edx,%esi
8010488c:	75 f2                	jne    80104880 <memmove+0x40>
8010488e:	5b                   	pop    %ebx
8010488f:	5e                   	pop    %esi
80104890:	5d                   	pop    %ebp
80104891:	c3                   	ret    
80104892:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048a0 <memcpy>:
801048a0:	55                   	push   %ebp
801048a1:	89 e5                	mov    %esp,%ebp
801048a3:	5d                   	pop    %ebp
801048a4:	eb 9a                	jmp    80104840 <memmove>
801048a6:	8d 76 00             	lea    0x0(%esi),%esi
801048a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048b0 <strncmp>:
801048b0:	55                   	push   %ebp
801048b1:	89 e5                	mov    %esp,%ebp
801048b3:	57                   	push   %edi
801048b4:	56                   	push   %esi
801048b5:	8b 7d 10             	mov    0x10(%ebp),%edi
801048b8:	53                   	push   %ebx
801048b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
801048bc:	8b 75 0c             	mov    0xc(%ebp),%esi
801048bf:	85 ff                	test   %edi,%edi
801048c1:	74 2f                	je     801048f2 <strncmp+0x42>
801048c3:	0f b6 01             	movzbl (%ecx),%eax
801048c6:	0f b6 1e             	movzbl (%esi),%ebx
801048c9:	84 c0                	test   %al,%al
801048cb:	74 37                	je     80104904 <strncmp+0x54>
801048cd:	38 c3                	cmp    %al,%bl
801048cf:	75 33                	jne    80104904 <strncmp+0x54>
801048d1:	01 f7                	add    %esi,%edi
801048d3:	eb 13                	jmp    801048e8 <strncmp+0x38>
801048d5:	8d 76 00             	lea    0x0(%esi),%esi
801048d8:	0f b6 01             	movzbl (%ecx),%eax
801048db:	84 c0                	test   %al,%al
801048dd:	74 21                	je     80104900 <strncmp+0x50>
801048df:	0f b6 1a             	movzbl (%edx),%ebx
801048e2:	89 d6                	mov    %edx,%esi
801048e4:	38 d8                	cmp    %bl,%al
801048e6:	75 1c                	jne    80104904 <strncmp+0x54>
801048e8:	8d 56 01             	lea    0x1(%esi),%edx
801048eb:	83 c1 01             	add    $0x1,%ecx
801048ee:	39 fa                	cmp    %edi,%edx
801048f0:	75 e6                	jne    801048d8 <strncmp+0x28>
801048f2:	5b                   	pop    %ebx
801048f3:	31 c0                	xor    %eax,%eax
801048f5:	5e                   	pop    %esi
801048f6:	5f                   	pop    %edi
801048f7:	5d                   	pop    %ebp
801048f8:	c3                   	ret    
801048f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104900:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
80104904:	29 d8                	sub    %ebx,%eax
80104906:	5b                   	pop    %ebx
80104907:	5e                   	pop    %esi
80104908:	5f                   	pop    %edi
80104909:	5d                   	pop    %ebp
8010490a:	c3                   	ret    
8010490b:	90                   	nop
8010490c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104910 <strncpy>:
80104910:	55                   	push   %ebp
80104911:	89 e5                	mov    %esp,%ebp
80104913:	56                   	push   %esi
80104914:	53                   	push   %ebx
80104915:	8b 45 08             	mov    0x8(%ebp),%eax
80104918:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010491b:	8b 4d 10             	mov    0x10(%ebp),%ecx
8010491e:	89 c2                	mov    %eax,%edx
80104920:	eb 19                	jmp    8010493b <strncpy+0x2b>
80104922:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104928:	83 c3 01             	add    $0x1,%ebx
8010492b:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
8010492f:	83 c2 01             	add    $0x1,%edx
80104932:	84 c9                	test   %cl,%cl
80104934:	88 4a ff             	mov    %cl,-0x1(%edx)
80104937:	74 09                	je     80104942 <strncpy+0x32>
80104939:	89 f1                	mov    %esi,%ecx
8010493b:	85 c9                	test   %ecx,%ecx
8010493d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104940:	7f e6                	jg     80104928 <strncpy+0x18>
80104942:	31 c9                	xor    %ecx,%ecx
80104944:	85 f6                	test   %esi,%esi
80104946:	7e 17                	jle    8010495f <strncpy+0x4f>
80104948:	90                   	nop
80104949:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104950:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104954:	89 f3                	mov    %esi,%ebx
80104956:	83 c1 01             	add    $0x1,%ecx
80104959:	29 cb                	sub    %ecx,%ebx
8010495b:	85 db                	test   %ebx,%ebx
8010495d:	7f f1                	jg     80104950 <strncpy+0x40>
8010495f:	5b                   	pop    %ebx
80104960:	5e                   	pop    %esi
80104961:	5d                   	pop    %ebp
80104962:	c3                   	ret    
80104963:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104969:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104970 <safestrcpy>:
80104970:	55                   	push   %ebp
80104971:	89 e5                	mov    %esp,%ebp
80104973:	56                   	push   %esi
80104974:	53                   	push   %ebx
80104975:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104978:	8b 45 08             	mov    0x8(%ebp),%eax
8010497b:	8b 55 0c             	mov    0xc(%ebp),%edx
8010497e:	85 c9                	test   %ecx,%ecx
80104980:	7e 26                	jle    801049a8 <safestrcpy+0x38>
80104982:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104986:	89 c1                	mov    %eax,%ecx
80104988:	eb 17                	jmp    801049a1 <safestrcpy+0x31>
8010498a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104990:	83 c2 01             	add    $0x1,%edx
80104993:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104997:	83 c1 01             	add    $0x1,%ecx
8010499a:	84 db                	test   %bl,%bl
8010499c:	88 59 ff             	mov    %bl,-0x1(%ecx)
8010499f:	74 04                	je     801049a5 <safestrcpy+0x35>
801049a1:	39 f2                	cmp    %esi,%edx
801049a3:	75 eb                	jne    80104990 <safestrcpy+0x20>
801049a5:	c6 01 00             	movb   $0x0,(%ecx)
801049a8:	5b                   	pop    %ebx
801049a9:	5e                   	pop    %esi
801049aa:	5d                   	pop    %ebp
801049ab:	c3                   	ret    
801049ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801049b0 <strlen>:
801049b0:	55                   	push   %ebp
801049b1:	31 c0                	xor    %eax,%eax
801049b3:	89 e5                	mov    %esp,%ebp
801049b5:	8b 55 08             	mov    0x8(%ebp),%edx
801049b8:	80 3a 00             	cmpb   $0x0,(%edx)
801049bb:	74 0c                	je     801049c9 <strlen+0x19>
801049bd:	8d 76 00             	lea    0x0(%esi),%esi
801049c0:	83 c0 01             	add    $0x1,%eax
801049c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
801049c7:	75 f7                	jne    801049c0 <strlen+0x10>
801049c9:	5d                   	pop    %ebp
801049ca:	c3                   	ret    

801049cb <swtch>:
801049cb:	8b 44 24 04          	mov    0x4(%esp),%eax
801049cf:	8b 54 24 08          	mov    0x8(%esp),%edx
801049d3:	55                   	push   %ebp
801049d4:	53                   	push   %ebx
801049d5:	56                   	push   %esi
801049d6:	57                   	push   %edi
801049d7:	89 20                	mov    %esp,(%eax)
801049d9:	89 d4                	mov    %edx,%esp
801049db:	5f                   	pop    %edi
801049dc:	5e                   	pop    %esi
801049dd:	5b                   	pop    %ebx
801049de:	5d                   	pop    %ebp
801049df:	c3                   	ret    

801049e0 <fetchint>:
801049e0:	55                   	push   %ebp
801049e1:	89 e5                	mov    %esp,%ebp
801049e3:	53                   	push   %ebx
801049e4:	83 ec 04             	sub    $0x4,%esp
801049e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801049ea:	e8 21 ef ff ff       	call   80103910 <myproc>
801049ef:	8b 00                	mov    (%eax),%eax
801049f1:	39 d8                	cmp    %ebx,%eax
801049f3:	76 1b                	jbe    80104a10 <fetchint+0x30>
801049f5:	8d 53 04             	lea    0x4(%ebx),%edx
801049f8:	39 d0                	cmp    %edx,%eax
801049fa:	72 14                	jb     80104a10 <fetchint+0x30>
801049fc:	8b 45 0c             	mov    0xc(%ebp),%eax
801049ff:	8b 13                	mov    (%ebx),%edx
80104a01:	89 10                	mov    %edx,(%eax)
80104a03:	31 c0                	xor    %eax,%eax
80104a05:	83 c4 04             	add    $0x4,%esp
80104a08:	5b                   	pop    %ebx
80104a09:	5d                   	pop    %ebp
80104a0a:	c3                   	ret    
80104a0b:	90                   	nop
80104a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104a10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a15:	eb ee                	jmp    80104a05 <fetchint+0x25>
80104a17:	89 f6                	mov    %esi,%esi
80104a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104a20 <fetchstr>:
80104a20:	55                   	push   %ebp
80104a21:	89 e5                	mov    %esp,%ebp
80104a23:	53                   	push   %ebx
80104a24:	83 ec 04             	sub    $0x4,%esp
80104a27:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104a2a:	e8 e1 ee ff ff       	call   80103910 <myproc>
80104a2f:	39 18                	cmp    %ebx,(%eax)
80104a31:	76 29                	jbe    80104a5c <fetchstr+0x3c>
80104a33:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104a36:	89 da                	mov    %ebx,%edx
80104a38:	89 19                	mov    %ebx,(%ecx)
80104a3a:	8b 00                	mov    (%eax),%eax
80104a3c:	39 c3                	cmp    %eax,%ebx
80104a3e:	73 1c                	jae    80104a5c <fetchstr+0x3c>
80104a40:	80 3b 00             	cmpb   $0x0,(%ebx)
80104a43:	75 10                	jne    80104a55 <fetchstr+0x35>
80104a45:	eb 39                	jmp    80104a80 <fetchstr+0x60>
80104a47:	89 f6                	mov    %esi,%esi
80104a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104a50:	80 3a 00             	cmpb   $0x0,(%edx)
80104a53:	74 1b                	je     80104a70 <fetchstr+0x50>
80104a55:	83 c2 01             	add    $0x1,%edx
80104a58:	39 d0                	cmp    %edx,%eax
80104a5a:	77 f4                	ja     80104a50 <fetchstr+0x30>
80104a5c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104a61:	83 c4 04             	add    $0x4,%esp
80104a64:	5b                   	pop    %ebx
80104a65:	5d                   	pop    %ebp
80104a66:	c3                   	ret    
80104a67:	89 f6                	mov    %esi,%esi
80104a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104a70:	83 c4 04             	add    $0x4,%esp
80104a73:	89 d0                	mov    %edx,%eax
80104a75:	29 d8                	sub    %ebx,%eax
80104a77:	5b                   	pop    %ebx
80104a78:	5d                   	pop    %ebp
80104a79:	c3                   	ret    
80104a7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a80:	31 c0                	xor    %eax,%eax
80104a82:	eb dd                	jmp    80104a61 <fetchstr+0x41>
80104a84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104a8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80104a90 <argint>:
80104a90:	55                   	push   %ebp
80104a91:	89 e5                	mov    %esp,%ebp
80104a93:	56                   	push   %esi
80104a94:	53                   	push   %ebx
80104a95:	e8 76 ee ff ff       	call   80103910 <myproc>
80104a9a:	8b 40 18             	mov    0x18(%eax),%eax
80104a9d:	8b 55 08             	mov    0x8(%ebp),%edx
80104aa0:	8b 40 44             	mov    0x44(%eax),%eax
80104aa3:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104aa6:	e8 65 ee ff ff       	call   80103910 <myproc>
80104aab:	8b 00                	mov    (%eax),%eax
80104aad:	8d 73 04             	lea    0x4(%ebx),%esi
80104ab0:	39 c6                	cmp    %eax,%esi
80104ab2:	73 1c                	jae    80104ad0 <argint+0x40>
80104ab4:	8d 53 08             	lea    0x8(%ebx),%edx
80104ab7:	39 d0                	cmp    %edx,%eax
80104ab9:	72 15                	jb     80104ad0 <argint+0x40>
80104abb:	8b 45 0c             	mov    0xc(%ebp),%eax
80104abe:	8b 53 04             	mov    0x4(%ebx),%edx
80104ac1:	89 10                	mov    %edx,(%eax)
80104ac3:	31 c0                	xor    %eax,%eax
80104ac5:	5b                   	pop    %ebx
80104ac6:	5e                   	pop    %esi
80104ac7:	5d                   	pop    %ebp
80104ac8:	c3                   	ret    
80104ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104ad0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ad5:	eb ee                	jmp    80104ac5 <argint+0x35>
80104ad7:	89 f6                	mov    %esi,%esi
80104ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ae0 <argptr>:
80104ae0:	55                   	push   %ebp
80104ae1:	89 e5                	mov    %esp,%ebp
80104ae3:	56                   	push   %esi
80104ae4:	53                   	push   %ebx
80104ae5:	83 ec 10             	sub    $0x10,%esp
80104ae8:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104aeb:	e8 20 ee ff ff       	call   80103910 <myproc>
80104af0:	89 c6                	mov    %eax,%esi
80104af2:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104af5:	83 ec 08             	sub    $0x8,%esp
80104af8:	50                   	push   %eax
80104af9:	ff 75 08             	pushl  0x8(%ebp)
80104afc:	e8 8f ff ff ff       	call   80104a90 <argint>
80104b01:	83 c4 10             	add    $0x10,%esp
80104b04:	85 c0                	test   %eax,%eax
80104b06:	78 28                	js     80104b30 <argptr+0x50>
80104b08:	85 db                	test   %ebx,%ebx
80104b0a:	78 24                	js     80104b30 <argptr+0x50>
80104b0c:	8b 16                	mov    (%esi),%edx
80104b0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104b11:	39 c2                	cmp    %eax,%edx
80104b13:	76 1b                	jbe    80104b30 <argptr+0x50>
80104b15:	01 c3                	add    %eax,%ebx
80104b17:	39 da                	cmp    %ebx,%edx
80104b19:	72 15                	jb     80104b30 <argptr+0x50>
80104b1b:	8b 55 0c             	mov    0xc(%ebp),%edx
80104b1e:	89 02                	mov    %eax,(%edx)
80104b20:	31 c0                	xor    %eax,%eax
80104b22:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104b25:	5b                   	pop    %ebx
80104b26:	5e                   	pop    %esi
80104b27:	5d                   	pop    %ebp
80104b28:	c3                   	ret    
80104b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104b30:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b35:	eb eb                	jmp    80104b22 <argptr+0x42>
80104b37:	89 f6                	mov    %esi,%esi
80104b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b40 <argstr>:
80104b40:	55                   	push   %ebp
80104b41:	89 e5                	mov    %esp,%ebp
80104b43:	83 ec 20             	sub    $0x20,%esp
80104b46:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104b49:	50                   	push   %eax
80104b4a:	ff 75 08             	pushl  0x8(%ebp)
80104b4d:	e8 3e ff ff ff       	call   80104a90 <argint>
80104b52:	83 c4 10             	add    $0x10,%esp
80104b55:	85 c0                	test   %eax,%eax
80104b57:	78 17                	js     80104b70 <argstr+0x30>
80104b59:	83 ec 08             	sub    $0x8,%esp
80104b5c:	ff 75 0c             	pushl  0xc(%ebp)
80104b5f:	ff 75 f4             	pushl  -0xc(%ebp)
80104b62:	e8 b9 fe ff ff       	call   80104a20 <fetchstr>
80104b67:	83 c4 10             	add    $0x10,%esp
80104b6a:	c9                   	leave  
80104b6b:	c3                   	ret    
80104b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104b75:	c9                   	leave  
80104b76:	c3                   	ret    
80104b77:	89 f6                	mov    %esi,%esi
80104b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104b80 <syscall>:
80104b80:	55                   	push   %ebp
80104b81:	89 e5                	mov    %esp,%ebp
80104b83:	53                   	push   %ebx
80104b84:	83 ec 04             	sub    $0x4,%esp
80104b87:	e8 84 ed ff ff       	call   80103910 <myproc>
80104b8c:	89 c3                	mov    %eax,%ebx
80104b8e:	8b 40 18             	mov    0x18(%eax),%eax
80104b91:	8b 40 1c             	mov    0x1c(%eax),%eax
80104b94:	8d 50 ff             	lea    -0x1(%eax),%edx
80104b97:	83 fa 19             	cmp    $0x19,%edx
80104b9a:	77 1c                	ja     80104bb8 <syscall+0x38>
80104b9c:	8b 14 85 00 7b 10 80 	mov    -0x7fef8500(,%eax,4),%edx
80104ba3:	85 d2                	test   %edx,%edx
80104ba5:	74 11                	je     80104bb8 <syscall+0x38>
80104ba7:	ff d2                	call   *%edx
80104ba9:	8b 53 18             	mov    0x18(%ebx),%edx
80104bac:	89 42 1c             	mov    %eax,0x1c(%edx)
80104baf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104bb2:	c9                   	leave  
80104bb3:	c3                   	ret    
80104bb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104bb8:	50                   	push   %eax
80104bb9:	8d 43 6c             	lea    0x6c(%ebx),%eax
80104bbc:	50                   	push   %eax
80104bbd:	ff 73 10             	pushl  0x10(%ebx)
80104bc0:	68 e1 7a 10 80       	push   $0x80107ae1
80104bc5:	e8 96 ba ff ff       	call   80100660 <cprintf>
80104bca:	8b 43 18             	mov    0x18(%ebx),%eax
80104bcd:	83 c4 10             	add    $0x10,%esp
80104bd0:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80104bd7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104bda:	c9                   	leave  
80104bdb:	c3                   	ret    
80104bdc:	66 90                	xchg   %ax,%ax
80104bde:	66 90                	xchg   %ax,%ax

80104be0 <create>:
80104be0:	55                   	push   %ebp
80104be1:	89 e5                	mov    %esp,%ebp
80104be3:	57                   	push   %edi
80104be4:	56                   	push   %esi
80104be5:	53                   	push   %ebx
80104be6:	8d 75 da             	lea    -0x26(%ebp),%esi
80104be9:	83 ec 44             	sub    $0x44,%esp
80104bec:	89 4d c0             	mov    %ecx,-0x40(%ebp)
80104bef:	8b 4d 08             	mov    0x8(%ebp),%ecx
80104bf2:	56                   	push   %esi
80104bf3:	50                   	push   %eax
80104bf4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
80104bf7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
80104bfa:	e8 11 d3 ff ff       	call   80101f10 <nameiparent>
80104bff:	83 c4 10             	add    $0x10,%esp
80104c02:	85 c0                	test   %eax,%eax
80104c04:	0f 84 46 01 00 00    	je     80104d50 <create+0x170>
80104c0a:	83 ec 0c             	sub    $0xc,%esp
80104c0d:	89 c3                	mov    %eax,%ebx
80104c0f:	50                   	push   %eax
80104c10:	e8 7b ca ff ff       	call   80101690 <ilock>
80104c15:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104c18:	83 c4 0c             	add    $0xc,%esp
80104c1b:	50                   	push   %eax
80104c1c:	56                   	push   %esi
80104c1d:	53                   	push   %ebx
80104c1e:	e8 9d cf ff ff       	call   80101bc0 <dirlookup>
80104c23:	83 c4 10             	add    $0x10,%esp
80104c26:	85 c0                	test   %eax,%eax
80104c28:	89 c7                	mov    %eax,%edi
80104c2a:	74 34                	je     80104c60 <create+0x80>
80104c2c:	83 ec 0c             	sub    $0xc,%esp
80104c2f:	53                   	push   %ebx
80104c30:	e8 eb cc ff ff       	call   80101920 <iunlockput>
80104c35:	89 3c 24             	mov    %edi,(%esp)
80104c38:	e8 53 ca ff ff       	call   80101690 <ilock>
80104c3d:	83 c4 10             	add    $0x10,%esp
80104c40:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80104c45:	0f 85 95 00 00 00    	jne    80104ce0 <create+0x100>
80104c4b:	66 83 7f 50 02       	cmpw   $0x2,0x50(%edi)
80104c50:	0f 85 8a 00 00 00    	jne    80104ce0 <create+0x100>
80104c56:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104c59:	89 f8                	mov    %edi,%eax
80104c5b:	5b                   	pop    %ebx
80104c5c:	5e                   	pop    %esi
80104c5d:	5f                   	pop    %edi
80104c5e:	5d                   	pop    %ebp
80104c5f:	c3                   	ret    
80104c60:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80104c64:	83 ec 08             	sub    $0x8,%esp
80104c67:	50                   	push   %eax
80104c68:	ff 33                	pushl  (%ebx)
80104c6a:	e8 b1 c8 ff ff       	call   80101520 <ialloc>
80104c6f:	83 c4 10             	add    $0x10,%esp
80104c72:	85 c0                	test   %eax,%eax
80104c74:	89 c7                	mov    %eax,%edi
80104c76:	0f 84 e8 00 00 00    	je     80104d64 <create+0x184>
80104c7c:	83 ec 0c             	sub    $0xc,%esp
80104c7f:	50                   	push   %eax
80104c80:	e8 0b ca ff ff       	call   80101690 <ilock>
80104c85:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80104c89:	66 89 47 52          	mov    %ax,0x52(%edi)
80104c8d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80104c91:	66 89 47 54          	mov    %ax,0x54(%edi)
80104c95:	b8 01 00 00 00       	mov    $0x1,%eax
80104c9a:	66 89 47 56          	mov    %ax,0x56(%edi)
80104c9e:	89 3c 24             	mov    %edi,(%esp)
80104ca1:	e8 3a c9 ff ff       	call   801015e0 <iupdate>
80104ca6:	83 c4 10             	add    $0x10,%esp
80104ca9:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
80104cae:	74 50                	je     80104d00 <create+0x120>
80104cb0:	83 ec 04             	sub    $0x4,%esp
80104cb3:	ff 77 04             	pushl  0x4(%edi)
80104cb6:	56                   	push   %esi
80104cb7:	53                   	push   %ebx
80104cb8:	e8 73 d1 ff ff       	call   80101e30 <dirlink>
80104cbd:	83 c4 10             	add    $0x10,%esp
80104cc0:	85 c0                	test   %eax,%eax
80104cc2:	0f 88 8f 00 00 00    	js     80104d57 <create+0x177>
80104cc8:	83 ec 0c             	sub    $0xc,%esp
80104ccb:	53                   	push   %ebx
80104ccc:	e8 4f cc ff ff       	call   80101920 <iunlockput>
80104cd1:	83 c4 10             	add    $0x10,%esp
80104cd4:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104cd7:	89 f8                	mov    %edi,%eax
80104cd9:	5b                   	pop    %ebx
80104cda:	5e                   	pop    %esi
80104cdb:	5f                   	pop    %edi
80104cdc:	5d                   	pop    %ebp
80104cdd:	c3                   	ret    
80104cde:	66 90                	xchg   %ax,%ax
80104ce0:	83 ec 0c             	sub    $0xc,%esp
80104ce3:	57                   	push   %edi
80104ce4:	31 ff                	xor    %edi,%edi
80104ce6:	e8 35 cc ff ff       	call   80101920 <iunlockput>
80104ceb:	83 c4 10             	add    $0x10,%esp
80104cee:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104cf1:	89 f8                	mov    %edi,%eax
80104cf3:	5b                   	pop    %ebx
80104cf4:	5e                   	pop    %esi
80104cf5:	5f                   	pop    %edi
80104cf6:	5d                   	pop    %ebp
80104cf7:	c3                   	ret    
80104cf8:	90                   	nop
80104cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104d00:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80104d05:	83 ec 0c             	sub    $0xc,%esp
80104d08:	53                   	push   %ebx
80104d09:	e8 d2 c8 ff ff       	call   801015e0 <iupdate>
80104d0e:	83 c4 0c             	add    $0xc,%esp
80104d11:	ff 77 04             	pushl  0x4(%edi)
80104d14:	68 88 7b 10 80       	push   $0x80107b88
80104d19:	57                   	push   %edi
80104d1a:	e8 11 d1 ff ff       	call   80101e30 <dirlink>
80104d1f:	83 c4 10             	add    $0x10,%esp
80104d22:	85 c0                	test   %eax,%eax
80104d24:	78 1c                	js     80104d42 <create+0x162>
80104d26:	83 ec 04             	sub    $0x4,%esp
80104d29:	ff 73 04             	pushl  0x4(%ebx)
80104d2c:	68 87 7b 10 80       	push   $0x80107b87
80104d31:	57                   	push   %edi
80104d32:	e8 f9 d0 ff ff       	call   80101e30 <dirlink>
80104d37:	83 c4 10             	add    $0x10,%esp
80104d3a:	85 c0                	test   %eax,%eax
80104d3c:	0f 89 6e ff ff ff    	jns    80104cb0 <create+0xd0>
80104d42:	83 ec 0c             	sub    $0xc,%esp
80104d45:	68 7b 7b 10 80       	push   $0x80107b7b
80104d4a:	e8 41 b6 ff ff       	call   80100390 <panic>
80104d4f:	90                   	nop
80104d50:	31 ff                	xor    %edi,%edi
80104d52:	e9 ff fe ff ff       	jmp    80104c56 <create+0x76>
80104d57:	83 ec 0c             	sub    $0xc,%esp
80104d5a:	68 8a 7b 10 80       	push   $0x80107b8a
80104d5f:	e8 2c b6 ff ff       	call   80100390 <panic>
80104d64:	83 ec 0c             	sub    $0xc,%esp
80104d67:	68 6c 7b 10 80       	push   $0x80107b6c
80104d6c:	e8 1f b6 ff ff       	call   80100390 <panic>
80104d71:	eb 0d                	jmp    80104d80 <argfd.constprop.0>
80104d73:	90                   	nop
80104d74:	90                   	nop
80104d75:	90                   	nop
80104d76:	90                   	nop
80104d77:	90                   	nop
80104d78:	90                   	nop
80104d79:	90                   	nop
80104d7a:	90                   	nop
80104d7b:	90                   	nop
80104d7c:	90                   	nop
80104d7d:	90                   	nop
80104d7e:	90                   	nop
80104d7f:	90                   	nop

80104d80 <argfd.constprop.0>:
80104d80:	55                   	push   %ebp
80104d81:	89 e5                	mov    %esp,%ebp
80104d83:	56                   	push   %esi
80104d84:	53                   	push   %ebx
80104d85:	89 c3                	mov    %eax,%ebx
80104d87:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104d8a:	89 d6                	mov    %edx,%esi
80104d8c:	83 ec 18             	sub    $0x18,%esp
80104d8f:	50                   	push   %eax
80104d90:	6a 00                	push   $0x0
80104d92:	e8 f9 fc ff ff       	call   80104a90 <argint>
80104d97:	83 c4 10             	add    $0x10,%esp
80104d9a:	85 c0                	test   %eax,%eax
80104d9c:	78 2a                	js     80104dc8 <argfd.constprop.0+0x48>
80104d9e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80104da2:	77 24                	ja     80104dc8 <argfd.constprop.0+0x48>
80104da4:	e8 67 eb ff ff       	call   80103910 <myproc>
80104da9:	8b 55 f4             	mov    -0xc(%ebp),%edx
80104dac:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80104db0:	85 c0                	test   %eax,%eax
80104db2:	74 14                	je     80104dc8 <argfd.constprop.0+0x48>
80104db4:	85 db                	test   %ebx,%ebx
80104db6:	74 02                	je     80104dba <argfd.constprop.0+0x3a>
80104db8:	89 13                	mov    %edx,(%ebx)
80104dba:	89 06                	mov    %eax,(%esi)
80104dbc:	31 c0                	xor    %eax,%eax
80104dbe:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104dc1:	5b                   	pop    %ebx
80104dc2:	5e                   	pop    %esi
80104dc3:	5d                   	pop    %ebp
80104dc4:	c3                   	ret    
80104dc5:	8d 76 00             	lea    0x0(%esi),%esi
80104dc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104dcd:	eb ef                	jmp    80104dbe <argfd.constprop.0+0x3e>
80104dcf:	90                   	nop

80104dd0 <sys_dup>:
80104dd0:	55                   	push   %ebp
80104dd1:	31 c0                	xor    %eax,%eax
80104dd3:	89 e5                	mov    %esp,%ebp
80104dd5:	56                   	push   %esi
80104dd6:	53                   	push   %ebx
80104dd7:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104dda:	83 ec 10             	sub    $0x10,%esp
80104ddd:	e8 9e ff ff ff       	call   80104d80 <argfd.constprop.0>
80104de2:	85 c0                	test   %eax,%eax
80104de4:	78 42                	js     80104e28 <sys_dup+0x58>
80104de6:	8b 75 f4             	mov    -0xc(%ebp),%esi
80104de9:	31 db                	xor    %ebx,%ebx
80104deb:	e8 20 eb ff ff       	call   80103910 <myproc>
80104df0:	eb 0e                	jmp    80104e00 <sys_dup+0x30>
80104df2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104df8:	83 c3 01             	add    $0x1,%ebx
80104dfb:	83 fb 10             	cmp    $0x10,%ebx
80104dfe:	74 28                	je     80104e28 <sys_dup+0x58>
80104e00:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80104e04:	85 d2                	test   %edx,%edx
80104e06:	75 f0                	jne    80104df8 <sys_dup+0x28>
80104e08:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
80104e0c:	83 ec 0c             	sub    $0xc,%esp
80104e0f:	ff 75 f4             	pushl  -0xc(%ebp)
80104e12:	e8 d9 bf ff ff       	call   80100df0 <filedup>
80104e17:	83 c4 10             	add    $0x10,%esp
80104e1a:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104e1d:	89 d8                	mov    %ebx,%eax
80104e1f:	5b                   	pop    %ebx
80104e20:	5e                   	pop    %esi
80104e21:	5d                   	pop    %ebp
80104e22:	c3                   	ret    
80104e23:	90                   	nop
80104e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104e28:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104e2b:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80104e30:	89 d8                	mov    %ebx,%eax
80104e32:	5b                   	pop    %ebx
80104e33:	5e                   	pop    %esi
80104e34:	5d                   	pop    %ebp
80104e35:	c3                   	ret    
80104e36:	8d 76 00             	lea    0x0(%esi),%esi
80104e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e40 <sys_read>:
80104e40:	55                   	push   %ebp
80104e41:	31 c0                	xor    %eax,%eax
80104e43:	89 e5                	mov    %esp,%ebp
80104e45:	83 ec 18             	sub    $0x18,%esp
80104e48:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104e4b:	e8 30 ff ff ff       	call   80104d80 <argfd.constprop.0>
80104e50:	85 c0                	test   %eax,%eax
80104e52:	78 4c                	js     80104ea0 <sys_read+0x60>
80104e54:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104e57:	83 ec 08             	sub    $0x8,%esp
80104e5a:	50                   	push   %eax
80104e5b:	6a 02                	push   $0x2
80104e5d:	e8 2e fc ff ff       	call   80104a90 <argint>
80104e62:	83 c4 10             	add    $0x10,%esp
80104e65:	85 c0                	test   %eax,%eax
80104e67:	78 37                	js     80104ea0 <sys_read+0x60>
80104e69:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104e6c:	83 ec 04             	sub    $0x4,%esp
80104e6f:	ff 75 f0             	pushl  -0x10(%ebp)
80104e72:	50                   	push   %eax
80104e73:	6a 01                	push   $0x1
80104e75:	e8 66 fc ff ff       	call   80104ae0 <argptr>
80104e7a:	83 c4 10             	add    $0x10,%esp
80104e7d:	85 c0                	test   %eax,%eax
80104e7f:	78 1f                	js     80104ea0 <sys_read+0x60>
80104e81:	83 ec 04             	sub    $0x4,%esp
80104e84:	ff 75 f0             	pushl  -0x10(%ebp)
80104e87:	ff 75 f4             	pushl  -0xc(%ebp)
80104e8a:	ff 75 ec             	pushl  -0x14(%ebp)
80104e8d:	e8 ce c0 ff ff       	call   80100f60 <fileread>
80104e92:	83 c4 10             	add    $0x10,%esp
80104e95:	c9                   	leave  
80104e96:	c3                   	ret    
80104e97:	89 f6                	mov    %esi,%esi
80104e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104ea0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ea5:	c9                   	leave  
80104ea6:	c3                   	ret    
80104ea7:	89 f6                	mov    %esi,%esi
80104ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104eb0 <sys_write>:
80104eb0:	55                   	push   %ebp
80104eb1:	31 c0                	xor    %eax,%eax
80104eb3:	89 e5                	mov    %esp,%ebp
80104eb5:	83 ec 18             	sub    $0x18,%esp
80104eb8:	8d 55 ec             	lea    -0x14(%ebp),%edx
80104ebb:	e8 c0 fe ff ff       	call   80104d80 <argfd.constprop.0>
80104ec0:	85 c0                	test   %eax,%eax
80104ec2:	78 4c                	js     80104f10 <sys_write+0x60>
80104ec4:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104ec7:	83 ec 08             	sub    $0x8,%esp
80104eca:	50                   	push   %eax
80104ecb:	6a 02                	push   $0x2
80104ecd:	e8 be fb ff ff       	call   80104a90 <argint>
80104ed2:	83 c4 10             	add    $0x10,%esp
80104ed5:	85 c0                	test   %eax,%eax
80104ed7:	78 37                	js     80104f10 <sys_write+0x60>
80104ed9:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104edc:	83 ec 04             	sub    $0x4,%esp
80104edf:	ff 75 f0             	pushl  -0x10(%ebp)
80104ee2:	50                   	push   %eax
80104ee3:	6a 01                	push   $0x1
80104ee5:	e8 f6 fb ff ff       	call   80104ae0 <argptr>
80104eea:	83 c4 10             	add    $0x10,%esp
80104eed:	85 c0                	test   %eax,%eax
80104eef:	78 1f                	js     80104f10 <sys_write+0x60>
80104ef1:	83 ec 04             	sub    $0x4,%esp
80104ef4:	ff 75 f0             	pushl  -0x10(%ebp)
80104ef7:	ff 75 f4             	pushl  -0xc(%ebp)
80104efa:	ff 75 ec             	pushl  -0x14(%ebp)
80104efd:	e8 ee c0 ff ff       	call   80100ff0 <filewrite>
80104f02:	83 c4 10             	add    $0x10,%esp
80104f05:	c9                   	leave  
80104f06:	c3                   	ret    
80104f07:	89 f6                	mov    %esi,%esi
80104f09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104f10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f15:	c9                   	leave  
80104f16:	c3                   	ret    
80104f17:	89 f6                	mov    %esi,%esi
80104f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104f20 <sys_close>:
80104f20:	55                   	push   %ebp
80104f21:	89 e5                	mov    %esp,%ebp
80104f23:	83 ec 18             	sub    $0x18,%esp
80104f26:	8d 55 f4             	lea    -0xc(%ebp),%edx
80104f29:	8d 45 f0             	lea    -0x10(%ebp),%eax
80104f2c:	e8 4f fe ff ff       	call   80104d80 <argfd.constprop.0>
80104f31:	85 c0                	test   %eax,%eax
80104f33:	78 2b                	js     80104f60 <sys_close+0x40>
80104f35:	e8 d6 e9 ff ff       	call   80103910 <myproc>
80104f3a:	8b 55 f0             	mov    -0x10(%ebp),%edx
80104f3d:	83 ec 0c             	sub    $0xc,%esp
80104f40:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80104f47:	00 
80104f48:	ff 75 f4             	pushl  -0xc(%ebp)
80104f4b:	e8 f0 be ff ff       	call   80100e40 <fileclose>
80104f50:	83 c4 10             	add    $0x10,%esp
80104f53:	31 c0                	xor    %eax,%eax
80104f55:	c9                   	leave  
80104f56:	c3                   	ret    
80104f57:	89 f6                	mov    %esi,%esi
80104f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104f60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f65:	c9                   	leave  
80104f66:	c3                   	ret    
80104f67:	89 f6                	mov    %esi,%esi
80104f69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104f70 <sys_fstat>:
80104f70:	55                   	push   %ebp
80104f71:	31 c0                	xor    %eax,%eax
80104f73:	89 e5                	mov    %esp,%ebp
80104f75:	83 ec 18             	sub    $0x18,%esp
80104f78:	8d 55 f0             	lea    -0x10(%ebp),%edx
80104f7b:	e8 00 fe ff ff       	call   80104d80 <argfd.constprop.0>
80104f80:	85 c0                	test   %eax,%eax
80104f82:	78 2c                	js     80104fb0 <sys_fstat+0x40>
80104f84:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104f87:	83 ec 04             	sub    $0x4,%esp
80104f8a:	6a 14                	push   $0x14
80104f8c:	50                   	push   %eax
80104f8d:	6a 01                	push   $0x1
80104f8f:	e8 4c fb ff ff       	call   80104ae0 <argptr>
80104f94:	83 c4 10             	add    $0x10,%esp
80104f97:	85 c0                	test   %eax,%eax
80104f99:	78 15                	js     80104fb0 <sys_fstat+0x40>
80104f9b:	83 ec 08             	sub    $0x8,%esp
80104f9e:	ff 75 f4             	pushl  -0xc(%ebp)
80104fa1:	ff 75 f0             	pushl  -0x10(%ebp)
80104fa4:	e8 67 bf ff ff       	call   80100f10 <filestat>
80104fa9:	83 c4 10             	add    $0x10,%esp
80104fac:	c9                   	leave  
80104fad:	c3                   	ret    
80104fae:	66 90                	xchg   %ax,%ax
80104fb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104fb5:	c9                   	leave  
80104fb6:	c3                   	ret    
80104fb7:	89 f6                	mov    %esi,%esi
80104fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104fc0 <sys_link>:
80104fc0:	55                   	push   %ebp
80104fc1:	89 e5                	mov    %esp,%ebp
80104fc3:	57                   	push   %edi
80104fc4:	56                   	push   %esi
80104fc5:	53                   	push   %ebx
80104fc6:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80104fc9:	83 ec 34             	sub    $0x34,%esp
80104fcc:	50                   	push   %eax
80104fcd:	6a 00                	push   $0x0
80104fcf:	e8 6c fb ff ff       	call   80104b40 <argstr>
80104fd4:	83 c4 10             	add    $0x10,%esp
80104fd7:	85 c0                	test   %eax,%eax
80104fd9:	0f 88 fb 00 00 00    	js     801050da <sys_link+0x11a>
80104fdf:	8d 45 d0             	lea    -0x30(%ebp),%eax
80104fe2:	83 ec 08             	sub    $0x8,%esp
80104fe5:	50                   	push   %eax
80104fe6:	6a 01                	push   $0x1
80104fe8:	e8 53 fb ff ff       	call   80104b40 <argstr>
80104fed:	83 c4 10             	add    $0x10,%esp
80104ff0:	85 c0                	test   %eax,%eax
80104ff2:	0f 88 e2 00 00 00    	js     801050da <sys_link+0x11a>
80104ff8:	e8 c3 dc ff ff       	call   80102cc0 <begin_op>
80104ffd:	83 ec 0c             	sub    $0xc,%esp
80105000:	ff 75 d4             	pushl  -0x2c(%ebp)
80105003:	e8 e8 ce ff ff       	call   80101ef0 <namei>
80105008:	83 c4 10             	add    $0x10,%esp
8010500b:	85 c0                	test   %eax,%eax
8010500d:	89 c3                	mov    %eax,%ebx
8010500f:	0f 84 ea 00 00 00    	je     801050ff <sys_link+0x13f>
80105015:	83 ec 0c             	sub    $0xc,%esp
80105018:	50                   	push   %eax
80105019:	e8 72 c6 ff ff       	call   80101690 <ilock>
8010501e:	83 c4 10             	add    $0x10,%esp
80105021:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105026:	0f 84 bb 00 00 00    	je     801050e7 <sys_link+0x127>
8010502c:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80105031:	83 ec 0c             	sub    $0xc,%esp
80105034:	8d 7d da             	lea    -0x26(%ebp),%edi
80105037:	53                   	push   %ebx
80105038:	e8 a3 c5 ff ff       	call   801015e0 <iupdate>
8010503d:	89 1c 24             	mov    %ebx,(%esp)
80105040:	e8 2b c7 ff ff       	call   80101770 <iunlock>
80105045:	58                   	pop    %eax
80105046:	5a                   	pop    %edx
80105047:	57                   	push   %edi
80105048:	ff 75 d0             	pushl  -0x30(%ebp)
8010504b:	e8 c0 ce ff ff       	call   80101f10 <nameiparent>
80105050:	83 c4 10             	add    $0x10,%esp
80105053:	85 c0                	test   %eax,%eax
80105055:	89 c6                	mov    %eax,%esi
80105057:	74 5b                	je     801050b4 <sys_link+0xf4>
80105059:	83 ec 0c             	sub    $0xc,%esp
8010505c:	50                   	push   %eax
8010505d:	e8 2e c6 ff ff       	call   80101690 <ilock>
80105062:	83 c4 10             	add    $0x10,%esp
80105065:	8b 03                	mov    (%ebx),%eax
80105067:	39 06                	cmp    %eax,(%esi)
80105069:	75 3d                	jne    801050a8 <sys_link+0xe8>
8010506b:	83 ec 04             	sub    $0x4,%esp
8010506e:	ff 73 04             	pushl  0x4(%ebx)
80105071:	57                   	push   %edi
80105072:	56                   	push   %esi
80105073:	e8 b8 cd ff ff       	call   80101e30 <dirlink>
80105078:	83 c4 10             	add    $0x10,%esp
8010507b:	85 c0                	test   %eax,%eax
8010507d:	78 29                	js     801050a8 <sys_link+0xe8>
8010507f:	83 ec 0c             	sub    $0xc,%esp
80105082:	56                   	push   %esi
80105083:	e8 98 c8 ff ff       	call   80101920 <iunlockput>
80105088:	89 1c 24             	mov    %ebx,(%esp)
8010508b:	e8 30 c7 ff ff       	call   801017c0 <iput>
80105090:	e8 9b dc ff ff       	call   80102d30 <end_op>
80105095:	83 c4 10             	add    $0x10,%esp
80105098:	31 c0                	xor    %eax,%eax
8010509a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010509d:	5b                   	pop    %ebx
8010509e:	5e                   	pop    %esi
8010509f:	5f                   	pop    %edi
801050a0:	5d                   	pop    %ebp
801050a1:	c3                   	ret    
801050a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801050a8:	83 ec 0c             	sub    $0xc,%esp
801050ab:	56                   	push   %esi
801050ac:	e8 6f c8 ff ff       	call   80101920 <iunlockput>
801050b1:	83 c4 10             	add    $0x10,%esp
801050b4:	83 ec 0c             	sub    $0xc,%esp
801050b7:	53                   	push   %ebx
801050b8:	e8 d3 c5 ff ff       	call   80101690 <ilock>
801050bd:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
801050c2:	89 1c 24             	mov    %ebx,(%esp)
801050c5:	e8 16 c5 ff ff       	call   801015e0 <iupdate>
801050ca:	89 1c 24             	mov    %ebx,(%esp)
801050cd:	e8 4e c8 ff ff       	call   80101920 <iunlockput>
801050d2:	e8 59 dc ff ff       	call   80102d30 <end_op>
801050d7:	83 c4 10             	add    $0x10,%esp
801050da:	8d 65 f4             	lea    -0xc(%ebp),%esp
801050dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050e2:	5b                   	pop    %ebx
801050e3:	5e                   	pop    %esi
801050e4:	5f                   	pop    %edi
801050e5:	5d                   	pop    %ebp
801050e6:	c3                   	ret    
801050e7:	83 ec 0c             	sub    $0xc,%esp
801050ea:	53                   	push   %ebx
801050eb:	e8 30 c8 ff ff       	call   80101920 <iunlockput>
801050f0:	e8 3b dc ff ff       	call   80102d30 <end_op>
801050f5:	83 c4 10             	add    $0x10,%esp
801050f8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801050fd:	eb 9b                	jmp    8010509a <sys_link+0xda>
801050ff:	e8 2c dc ff ff       	call   80102d30 <end_op>
80105104:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105109:	eb 8f                	jmp    8010509a <sys_link+0xda>
8010510b:	90                   	nop
8010510c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105110 <sys_unlink>:
80105110:	55                   	push   %ebp
80105111:	89 e5                	mov    %esp,%ebp
80105113:	57                   	push   %edi
80105114:	56                   	push   %esi
80105115:	53                   	push   %ebx
80105116:	8d 45 c0             	lea    -0x40(%ebp),%eax
80105119:	83 ec 44             	sub    $0x44,%esp
8010511c:	50                   	push   %eax
8010511d:	6a 00                	push   $0x0
8010511f:	e8 1c fa ff ff       	call   80104b40 <argstr>
80105124:	83 c4 10             	add    $0x10,%esp
80105127:	85 c0                	test   %eax,%eax
80105129:	0f 88 77 01 00 00    	js     801052a6 <sys_unlink+0x196>
8010512f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80105132:	e8 89 db ff ff       	call   80102cc0 <begin_op>
80105137:	83 ec 08             	sub    $0x8,%esp
8010513a:	53                   	push   %ebx
8010513b:	ff 75 c0             	pushl  -0x40(%ebp)
8010513e:	e8 cd cd ff ff       	call   80101f10 <nameiparent>
80105143:	83 c4 10             	add    $0x10,%esp
80105146:	85 c0                	test   %eax,%eax
80105148:	89 c6                	mov    %eax,%esi
8010514a:	0f 84 60 01 00 00    	je     801052b0 <sys_unlink+0x1a0>
80105150:	83 ec 0c             	sub    $0xc,%esp
80105153:	50                   	push   %eax
80105154:	e8 37 c5 ff ff       	call   80101690 <ilock>
80105159:	58                   	pop    %eax
8010515a:	5a                   	pop    %edx
8010515b:	68 88 7b 10 80       	push   $0x80107b88
80105160:	53                   	push   %ebx
80105161:	e8 3a ca ff ff       	call   80101ba0 <namecmp>
80105166:	83 c4 10             	add    $0x10,%esp
80105169:	85 c0                	test   %eax,%eax
8010516b:	0f 84 03 01 00 00    	je     80105274 <sys_unlink+0x164>
80105171:	83 ec 08             	sub    $0x8,%esp
80105174:	68 87 7b 10 80       	push   $0x80107b87
80105179:	53                   	push   %ebx
8010517a:	e8 21 ca ff ff       	call   80101ba0 <namecmp>
8010517f:	83 c4 10             	add    $0x10,%esp
80105182:	85 c0                	test   %eax,%eax
80105184:	0f 84 ea 00 00 00    	je     80105274 <sys_unlink+0x164>
8010518a:	8d 45 c4             	lea    -0x3c(%ebp),%eax
8010518d:	83 ec 04             	sub    $0x4,%esp
80105190:	50                   	push   %eax
80105191:	53                   	push   %ebx
80105192:	56                   	push   %esi
80105193:	e8 28 ca ff ff       	call   80101bc0 <dirlookup>
80105198:	83 c4 10             	add    $0x10,%esp
8010519b:	85 c0                	test   %eax,%eax
8010519d:	89 c3                	mov    %eax,%ebx
8010519f:	0f 84 cf 00 00 00    	je     80105274 <sys_unlink+0x164>
801051a5:	83 ec 0c             	sub    $0xc,%esp
801051a8:	50                   	push   %eax
801051a9:	e8 e2 c4 ff ff       	call   80101690 <ilock>
801051ae:	83 c4 10             	add    $0x10,%esp
801051b1:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
801051b6:	0f 8e 10 01 00 00    	jle    801052cc <sys_unlink+0x1bc>
801051bc:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801051c1:	74 6d                	je     80105230 <sys_unlink+0x120>
801051c3:	8d 45 d8             	lea    -0x28(%ebp),%eax
801051c6:	83 ec 04             	sub    $0x4,%esp
801051c9:	6a 10                	push   $0x10
801051cb:	6a 00                	push   $0x0
801051cd:	50                   	push   %eax
801051ce:	e8 bd f5 ff ff       	call   80104790 <memset>
801051d3:	8d 45 d8             	lea    -0x28(%ebp),%eax
801051d6:	6a 10                	push   $0x10
801051d8:	ff 75 c4             	pushl  -0x3c(%ebp)
801051db:	50                   	push   %eax
801051dc:	56                   	push   %esi
801051dd:	e8 8e c8 ff ff       	call   80101a70 <writei>
801051e2:	83 c4 20             	add    $0x20,%esp
801051e5:	83 f8 10             	cmp    $0x10,%eax
801051e8:	0f 85 eb 00 00 00    	jne    801052d9 <sys_unlink+0x1c9>
801051ee:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801051f3:	0f 84 97 00 00 00    	je     80105290 <sys_unlink+0x180>
801051f9:	83 ec 0c             	sub    $0xc,%esp
801051fc:	56                   	push   %esi
801051fd:	e8 1e c7 ff ff       	call   80101920 <iunlockput>
80105202:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80105207:	89 1c 24             	mov    %ebx,(%esp)
8010520a:	e8 d1 c3 ff ff       	call   801015e0 <iupdate>
8010520f:	89 1c 24             	mov    %ebx,(%esp)
80105212:	e8 09 c7 ff ff       	call   80101920 <iunlockput>
80105217:	e8 14 db ff ff       	call   80102d30 <end_op>
8010521c:	83 c4 10             	add    $0x10,%esp
8010521f:	31 c0                	xor    %eax,%eax
80105221:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105224:	5b                   	pop    %ebx
80105225:	5e                   	pop    %esi
80105226:	5f                   	pop    %edi
80105227:	5d                   	pop    %ebp
80105228:	c3                   	ret    
80105229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105230:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105234:	76 8d                	jbe    801051c3 <sys_unlink+0xb3>
80105236:	bf 20 00 00 00       	mov    $0x20,%edi
8010523b:	eb 0f                	jmp    8010524c <sys_unlink+0x13c>
8010523d:	8d 76 00             	lea    0x0(%esi),%esi
80105240:	83 c7 10             	add    $0x10,%edi
80105243:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105246:	0f 83 77 ff ff ff    	jae    801051c3 <sys_unlink+0xb3>
8010524c:	8d 45 d8             	lea    -0x28(%ebp),%eax
8010524f:	6a 10                	push   $0x10
80105251:	57                   	push   %edi
80105252:	50                   	push   %eax
80105253:	53                   	push   %ebx
80105254:	e8 17 c7 ff ff       	call   80101970 <readi>
80105259:	83 c4 10             	add    $0x10,%esp
8010525c:	83 f8 10             	cmp    $0x10,%eax
8010525f:	75 5e                	jne    801052bf <sys_unlink+0x1af>
80105261:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105266:	74 d8                	je     80105240 <sys_unlink+0x130>
80105268:	83 ec 0c             	sub    $0xc,%esp
8010526b:	53                   	push   %ebx
8010526c:	e8 af c6 ff ff       	call   80101920 <iunlockput>
80105271:	83 c4 10             	add    $0x10,%esp
80105274:	83 ec 0c             	sub    $0xc,%esp
80105277:	56                   	push   %esi
80105278:	e8 a3 c6 ff ff       	call   80101920 <iunlockput>
8010527d:	e8 ae da ff ff       	call   80102d30 <end_op>
80105282:	83 c4 10             	add    $0x10,%esp
80105285:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010528a:	eb 95                	jmp    80105221 <sys_unlink+0x111>
8010528c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105290:	66 83 6e 56 01       	subw   $0x1,0x56(%esi)
80105295:	83 ec 0c             	sub    $0xc,%esp
80105298:	56                   	push   %esi
80105299:	e8 42 c3 ff ff       	call   801015e0 <iupdate>
8010529e:	83 c4 10             	add    $0x10,%esp
801052a1:	e9 53 ff ff ff       	jmp    801051f9 <sys_unlink+0xe9>
801052a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052ab:	e9 71 ff ff ff       	jmp    80105221 <sys_unlink+0x111>
801052b0:	e8 7b da ff ff       	call   80102d30 <end_op>
801052b5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052ba:	e9 62 ff ff ff       	jmp    80105221 <sys_unlink+0x111>
801052bf:	83 ec 0c             	sub    $0xc,%esp
801052c2:	68 ac 7b 10 80       	push   $0x80107bac
801052c7:	e8 c4 b0 ff ff       	call   80100390 <panic>
801052cc:	83 ec 0c             	sub    $0xc,%esp
801052cf:	68 9a 7b 10 80       	push   $0x80107b9a
801052d4:	e8 b7 b0 ff ff       	call   80100390 <panic>
801052d9:	83 ec 0c             	sub    $0xc,%esp
801052dc:	68 be 7b 10 80       	push   $0x80107bbe
801052e1:	e8 aa b0 ff ff       	call   80100390 <panic>
801052e6:	8d 76 00             	lea    0x0(%esi),%esi
801052e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801052f0 <sys_open>:
801052f0:	55                   	push   %ebp
801052f1:	89 e5                	mov    %esp,%ebp
801052f3:	57                   	push   %edi
801052f4:	56                   	push   %esi
801052f5:	53                   	push   %ebx
801052f6:	8d 45 e0             	lea    -0x20(%ebp),%eax
801052f9:	83 ec 24             	sub    $0x24,%esp
801052fc:	50                   	push   %eax
801052fd:	6a 00                	push   $0x0
801052ff:	e8 3c f8 ff ff       	call   80104b40 <argstr>
80105304:	83 c4 10             	add    $0x10,%esp
80105307:	85 c0                	test   %eax,%eax
80105309:	0f 88 1d 01 00 00    	js     8010542c <sys_open+0x13c>
8010530f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105312:	83 ec 08             	sub    $0x8,%esp
80105315:	50                   	push   %eax
80105316:	6a 01                	push   $0x1
80105318:	e8 73 f7 ff ff       	call   80104a90 <argint>
8010531d:	83 c4 10             	add    $0x10,%esp
80105320:	85 c0                	test   %eax,%eax
80105322:	0f 88 04 01 00 00    	js     8010542c <sys_open+0x13c>
80105328:	e8 93 d9 ff ff       	call   80102cc0 <begin_op>
8010532d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105331:	0f 85 a9 00 00 00    	jne    801053e0 <sys_open+0xf0>
80105337:	83 ec 0c             	sub    $0xc,%esp
8010533a:	ff 75 e0             	pushl  -0x20(%ebp)
8010533d:	e8 ae cb ff ff       	call   80101ef0 <namei>
80105342:	83 c4 10             	add    $0x10,%esp
80105345:	85 c0                	test   %eax,%eax
80105347:	89 c6                	mov    %eax,%esi
80105349:	0f 84 b2 00 00 00    	je     80105401 <sys_open+0x111>
8010534f:	83 ec 0c             	sub    $0xc,%esp
80105352:	50                   	push   %eax
80105353:	e8 38 c3 ff ff       	call   80101690 <ilock>
80105358:	83 c4 10             	add    $0x10,%esp
8010535b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105360:	0f 84 aa 00 00 00    	je     80105410 <sys_open+0x120>
80105366:	e8 15 ba ff ff       	call   80100d80 <filealloc>
8010536b:	85 c0                	test   %eax,%eax
8010536d:	89 c7                	mov    %eax,%edi
8010536f:	0f 84 a6 00 00 00    	je     8010541b <sys_open+0x12b>
80105375:	e8 96 e5 ff ff       	call   80103910 <myproc>
8010537a:	31 db                	xor    %ebx,%ebx
8010537c:	eb 0e                	jmp    8010538c <sys_open+0x9c>
8010537e:	66 90                	xchg   %ax,%ax
80105380:	83 c3 01             	add    $0x1,%ebx
80105383:	83 fb 10             	cmp    $0x10,%ebx
80105386:	0f 84 ac 00 00 00    	je     80105438 <sys_open+0x148>
8010538c:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105390:	85 d2                	test   %edx,%edx
80105392:	75 ec                	jne    80105380 <sys_open+0x90>
80105394:	83 ec 0c             	sub    $0xc,%esp
80105397:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
8010539b:	56                   	push   %esi
8010539c:	e8 cf c3 ff ff       	call   80101770 <iunlock>
801053a1:	e8 8a d9 ff ff       	call   80102d30 <end_op>
801053a6:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
801053ac:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801053af:	83 c4 10             	add    $0x10,%esp
801053b2:	89 77 10             	mov    %esi,0x10(%edi)
801053b5:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
801053bc:	89 d0                	mov    %edx,%eax
801053be:	f7 d0                	not    %eax
801053c0:	83 e0 01             	and    $0x1,%eax
801053c3:	83 e2 03             	and    $0x3,%edx
801053c6:	88 47 08             	mov    %al,0x8(%edi)
801053c9:	0f 95 47 09          	setne  0x9(%edi)
801053cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801053d0:	89 d8                	mov    %ebx,%eax
801053d2:	5b                   	pop    %ebx
801053d3:	5e                   	pop    %esi
801053d4:	5f                   	pop    %edi
801053d5:	5d                   	pop    %ebp
801053d6:	c3                   	ret    
801053d7:	89 f6                	mov    %esi,%esi
801053d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801053e0:	83 ec 0c             	sub    $0xc,%esp
801053e3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801053e6:	31 c9                	xor    %ecx,%ecx
801053e8:	6a 00                	push   $0x0
801053ea:	ba 02 00 00 00       	mov    $0x2,%edx
801053ef:	e8 ec f7 ff ff       	call   80104be0 <create>
801053f4:	83 c4 10             	add    $0x10,%esp
801053f7:	85 c0                	test   %eax,%eax
801053f9:	89 c6                	mov    %eax,%esi
801053fb:	0f 85 65 ff ff ff    	jne    80105366 <sys_open+0x76>
80105401:	e8 2a d9 ff ff       	call   80102d30 <end_op>
80105406:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
8010540b:	eb c0                	jmp    801053cd <sys_open+0xdd>
8010540d:	8d 76 00             	lea    0x0(%esi),%esi
80105410:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80105413:	85 c9                	test   %ecx,%ecx
80105415:	0f 84 4b ff ff ff    	je     80105366 <sys_open+0x76>
8010541b:	83 ec 0c             	sub    $0xc,%esp
8010541e:	56                   	push   %esi
8010541f:	e8 fc c4 ff ff       	call   80101920 <iunlockput>
80105424:	e8 07 d9 ff ff       	call   80102d30 <end_op>
80105429:	83 c4 10             	add    $0x10,%esp
8010542c:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105431:	eb 9a                	jmp    801053cd <sys_open+0xdd>
80105433:	90                   	nop
80105434:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105438:	83 ec 0c             	sub    $0xc,%esp
8010543b:	57                   	push   %edi
8010543c:	e8 ff b9 ff ff       	call   80100e40 <fileclose>
80105441:	83 c4 10             	add    $0x10,%esp
80105444:	eb d5                	jmp    8010541b <sys_open+0x12b>
80105446:	8d 76 00             	lea    0x0(%esi),%esi
80105449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105450 <sys_mkdir>:
80105450:	55                   	push   %ebp
80105451:	89 e5                	mov    %esp,%ebp
80105453:	83 ec 18             	sub    $0x18,%esp
80105456:	e8 65 d8 ff ff       	call   80102cc0 <begin_op>
8010545b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010545e:	83 ec 08             	sub    $0x8,%esp
80105461:	50                   	push   %eax
80105462:	6a 00                	push   $0x0
80105464:	e8 d7 f6 ff ff       	call   80104b40 <argstr>
80105469:	83 c4 10             	add    $0x10,%esp
8010546c:	85 c0                	test   %eax,%eax
8010546e:	78 30                	js     801054a0 <sys_mkdir+0x50>
80105470:	83 ec 0c             	sub    $0xc,%esp
80105473:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105476:	31 c9                	xor    %ecx,%ecx
80105478:	6a 00                	push   $0x0
8010547a:	ba 01 00 00 00       	mov    $0x1,%edx
8010547f:	e8 5c f7 ff ff       	call   80104be0 <create>
80105484:	83 c4 10             	add    $0x10,%esp
80105487:	85 c0                	test   %eax,%eax
80105489:	74 15                	je     801054a0 <sys_mkdir+0x50>
8010548b:	83 ec 0c             	sub    $0xc,%esp
8010548e:	50                   	push   %eax
8010548f:	e8 8c c4 ff ff       	call   80101920 <iunlockput>
80105494:	e8 97 d8 ff ff       	call   80102d30 <end_op>
80105499:	83 c4 10             	add    $0x10,%esp
8010549c:	31 c0                	xor    %eax,%eax
8010549e:	c9                   	leave  
8010549f:	c3                   	ret    
801054a0:	e8 8b d8 ff ff       	call   80102d30 <end_op>
801054a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801054aa:	c9                   	leave  
801054ab:	c3                   	ret    
801054ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801054b0 <sys_mknod>:
801054b0:	55                   	push   %ebp
801054b1:	89 e5                	mov    %esp,%ebp
801054b3:	83 ec 18             	sub    $0x18,%esp
801054b6:	e8 05 d8 ff ff       	call   80102cc0 <begin_op>
801054bb:	8d 45 ec             	lea    -0x14(%ebp),%eax
801054be:	83 ec 08             	sub    $0x8,%esp
801054c1:	50                   	push   %eax
801054c2:	6a 00                	push   $0x0
801054c4:	e8 77 f6 ff ff       	call   80104b40 <argstr>
801054c9:	83 c4 10             	add    $0x10,%esp
801054cc:	85 c0                	test   %eax,%eax
801054ce:	78 60                	js     80105530 <sys_mknod+0x80>
801054d0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801054d3:	83 ec 08             	sub    $0x8,%esp
801054d6:	50                   	push   %eax
801054d7:	6a 01                	push   $0x1
801054d9:	e8 b2 f5 ff ff       	call   80104a90 <argint>
801054de:	83 c4 10             	add    $0x10,%esp
801054e1:	85 c0                	test   %eax,%eax
801054e3:	78 4b                	js     80105530 <sys_mknod+0x80>
801054e5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801054e8:	83 ec 08             	sub    $0x8,%esp
801054eb:	50                   	push   %eax
801054ec:	6a 02                	push   $0x2
801054ee:	e8 9d f5 ff ff       	call   80104a90 <argint>
801054f3:	83 c4 10             	add    $0x10,%esp
801054f6:	85 c0                	test   %eax,%eax
801054f8:	78 36                	js     80105530 <sys_mknod+0x80>
801054fa:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801054fe:	83 ec 0c             	sub    $0xc,%esp
80105501:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
80105505:	ba 03 00 00 00       	mov    $0x3,%edx
8010550a:	50                   	push   %eax
8010550b:	8b 45 ec             	mov    -0x14(%ebp),%eax
8010550e:	e8 cd f6 ff ff       	call   80104be0 <create>
80105513:	83 c4 10             	add    $0x10,%esp
80105516:	85 c0                	test   %eax,%eax
80105518:	74 16                	je     80105530 <sys_mknod+0x80>
8010551a:	83 ec 0c             	sub    $0xc,%esp
8010551d:	50                   	push   %eax
8010551e:	e8 fd c3 ff ff       	call   80101920 <iunlockput>
80105523:	e8 08 d8 ff ff       	call   80102d30 <end_op>
80105528:	83 c4 10             	add    $0x10,%esp
8010552b:	31 c0                	xor    %eax,%eax
8010552d:	c9                   	leave  
8010552e:	c3                   	ret    
8010552f:	90                   	nop
80105530:	e8 fb d7 ff ff       	call   80102d30 <end_op>
80105535:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010553a:	c9                   	leave  
8010553b:	c3                   	ret    
8010553c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105540 <sys_chdir>:
80105540:	55                   	push   %ebp
80105541:	89 e5                	mov    %esp,%ebp
80105543:	56                   	push   %esi
80105544:	53                   	push   %ebx
80105545:	83 ec 10             	sub    $0x10,%esp
80105548:	e8 c3 e3 ff ff       	call   80103910 <myproc>
8010554d:	89 c6                	mov    %eax,%esi
8010554f:	e8 6c d7 ff ff       	call   80102cc0 <begin_op>
80105554:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105557:	83 ec 08             	sub    $0x8,%esp
8010555a:	50                   	push   %eax
8010555b:	6a 00                	push   $0x0
8010555d:	e8 de f5 ff ff       	call   80104b40 <argstr>
80105562:	83 c4 10             	add    $0x10,%esp
80105565:	85 c0                	test   %eax,%eax
80105567:	78 77                	js     801055e0 <sys_chdir+0xa0>
80105569:	83 ec 0c             	sub    $0xc,%esp
8010556c:	ff 75 f4             	pushl  -0xc(%ebp)
8010556f:	e8 7c c9 ff ff       	call   80101ef0 <namei>
80105574:	83 c4 10             	add    $0x10,%esp
80105577:	85 c0                	test   %eax,%eax
80105579:	89 c3                	mov    %eax,%ebx
8010557b:	74 63                	je     801055e0 <sys_chdir+0xa0>
8010557d:	83 ec 0c             	sub    $0xc,%esp
80105580:	50                   	push   %eax
80105581:	e8 0a c1 ff ff       	call   80101690 <ilock>
80105586:	83 c4 10             	add    $0x10,%esp
80105589:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
8010558e:	75 30                	jne    801055c0 <sys_chdir+0x80>
80105590:	83 ec 0c             	sub    $0xc,%esp
80105593:	53                   	push   %ebx
80105594:	e8 d7 c1 ff ff       	call   80101770 <iunlock>
80105599:	58                   	pop    %eax
8010559a:	ff 76 68             	pushl  0x68(%esi)
8010559d:	e8 1e c2 ff ff       	call   801017c0 <iput>
801055a2:	e8 89 d7 ff ff       	call   80102d30 <end_op>
801055a7:	89 5e 68             	mov    %ebx,0x68(%esi)
801055aa:	83 c4 10             	add    $0x10,%esp
801055ad:	31 c0                	xor    %eax,%eax
801055af:	8d 65 f8             	lea    -0x8(%ebp),%esp
801055b2:	5b                   	pop    %ebx
801055b3:	5e                   	pop    %esi
801055b4:	5d                   	pop    %ebp
801055b5:	c3                   	ret    
801055b6:	8d 76 00             	lea    0x0(%esi),%esi
801055b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801055c0:	83 ec 0c             	sub    $0xc,%esp
801055c3:	53                   	push   %ebx
801055c4:	e8 57 c3 ff ff       	call   80101920 <iunlockput>
801055c9:	e8 62 d7 ff ff       	call   80102d30 <end_op>
801055ce:	83 c4 10             	add    $0x10,%esp
801055d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055d6:	eb d7                	jmp    801055af <sys_chdir+0x6f>
801055d8:	90                   	nop
801055d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801055e0:	e8 4b d7 ff ff       	call   80102d30 <end_op>
801055e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055ea:	eb c3                	jmp    801055af <sys_chdir+0x6f>
801055ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801055f0 <sys_exec>:
801055f0:	55                   	push   %ebp
801055f1:	89 e5                	mov    %esp,%ebp
801055f3:	57                   	push   %edi
801055f4:	56                   	push   %esi
801055f5:	53                   	push   %ebx
801055f6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
801055fc:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80105602:	50                   	push   %eax
80105603:	6a 00                	push   $0x0
80105605:	e8 36 f5 ff ff       	call   80104b40 <argstr>
8010560a:	83 c4 10             	add    $0x10,%esp
8010560d:	85 c0                	test   %eax,%eax
8010560f:	0f 88 87 00 00 00    	js     8010569c <sys_exec+0xac>
80105615:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
8010561b:	83 ec 08             	sub    $0x8,%esp
8010561e:	50                   	push   %eax
8010561f:	6a 01                	push   $0x1
80105621:	e8 6a f4 ff ff       	call   80104a90 <argint>
80105626:	83 c4 10             	add    $0x10,%esp
80105629:	85 c0                	test   %eax,%eax
8010562b:	78 6f                	js     8010569c <sys_exec+0xac>
8010562d:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105633:	83 ec 04             	sub    $0x4,%esp
80105636:	31 db                	xor    %ebx,%ebx
80105638:	68 80 00 00 00       	push   $0x80
8010563d:	6a 00                	push   $0x0
8010563f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105645:	50                   	push   %eax
80105646:	e8 45 f1 ff ff       	call   80104790 <memset>
8010564b:	83 c4 10             	add    $0x10,%esp
8010564e:	eb 2c                	jmp    8010567c <sys_exec+0x8c>
80105650:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105656:	85 c0                	test   %eax,%eax
80105658:	74 56                	je     801056b0 <sys_exec+0xc0>
8010565a:	8d 8d 68 ff ff ff    	lea    -0x98(%ebp),%ecx
80105660:	83 ec 08             	sub    $0x8,%esp
80105663:	8d 14 31             	lea    (%ecx,%esi,1),%edx
80105666:	52                   	push   %edx
80105667:	50                   	push   %eax
80105668:	e8 b3 f3 ff ff       	call   80104a20 <fetchstr>
8010566d:	83 c4 10             	add    $0x10,%esp
80105670:	85 c0                	test   %eax,%eax
80105672:	78 28                	js     8010569c <sys_exec+0xac>
80105674:	83 c3 01             	add    $0x1,%ebx
80105677:	83 fb 20             	cmp    $0x20,%ebx
8010567a:	74 20                	je     8010569c <sys_exec+0xac>
8010567c:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105682:	8d 34 9d 00 00 00 00 	lea    0x0(,%ebx,4),%esi
80105689:	83 ec 08             	sub    $0x8,%esp
8010568c:	57                   	push   %edi
8010568d:	01 f0                	add    %esi,%eax
8010568f:	50                   	push   %eax
80105690:	e8 4b f3 ff ff       	call   801049e0 <fetchint>
80105695:	83 c4 10             	add    $0x10,%esp
80105698:	85 c0                	test   %eax,%eax
8010569a:	79 b4                	jns    80105650 <sys_exec+0x60>
8010569c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010569f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801056a4:	5b                   	pop    %ebx
801056a5:	5e                   	pop    %esi
801056a6:	5f                   	pop    %edi
801056a7:	5d                   	pop    %ebp
801056a8:	c3                   	ret    
801056a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801056b0:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
801056b6:	83 ec 08             	sub    $0x8,%esp
801056b9:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
801056c0:	00 00 00 00 
801056c4:	50                   	push   %eax
801056c5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
801056cb:	e8 40 b3 ff ff       	call   80100a10 <exec>
801056d0:	83 c4 10             	add    $0x10,%esp
801056d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801056d6:	5b                   	pop    %ebx
801056d7:	5e                   	pop    %esi
801056d8:	5f                   	pop    %edi
801056d9:	5d                   	pop    %ebp
801056da:	c3                   	ret    
801056db:	90                   	nop
801056dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801056e0 <sys_pipe>:
801056e0:	55                   	push   %ebp
801056e1:	89 e5                	mov    %esp,%ebp
801056e3:	57                   	push   %edi
801056e4:	56                   	push   %esi
801056e5:	53                   	push   %ebx
801056e6:	8d 45 dc             	lea    -0x24(%ebp),%eax
801056e9:	83 ec 20             	sub    $0x20,%esp
801056ec:	6a 08                	push   $0x8
801056ee:	50                   	push   %eax
801056ef:	6a 00                	push   $0x0
801056f1:	e8 ea f3 ff ff       	call   80104ae0 <argptr>
801056f6:	83 c4 10             	add    $0x10,%esp
801056f9:	85 c0                	test   %eax,%eax
801056fb:	0f 88 ae 00 00 00    	js     801057af <sys_pipe+0xcf>
80105701:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105704:	83 ec 08             	sub    $0x8,%esp
80105707:	50                   	push   %eax
80105708:	8d 45 e0             	lea    -0x20(%ebp),%eax
8010570b:	50                   	push   %eax
8010570c:	e8 4f dc ff ff       	call   80103360 <pipealloc>
80105711:	83 c4 10             	add    $0x10,%esp
80105714:	85 c0                	test   %eax,%eax
80105716:	0f 88 93 00 00 00    	js     801057af <sys_pipe+0xcf>
8010571c:	8b 7d e0             	mov    -0x20(%ebp),%edi
8010571f:	31 db                	xor    %ebx,%ebx
80105721:	e8 ea e1 ff ff       	call   80103910 <myproc>
80105726:	eb 10                	jmp    80105738 <sys_pipe+0x58>
80105728:	90                   	nop
80105729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105730:	83 c3 01             	add    $0x1,%ebx
80105733:	83 fb 10             	cmp    $0x10,%ebx
80105736:	74 60                	je     80105798 <sys_pipe+0xb8>
80105738:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
8010573c:	85 f6                	test   %esi,%esi
8010573e:	75 f0                	jne    80105730 <sys_pipe+0x50>
80105740:	8d 73 08             	lea    0x8(%ebx),%esi
80105743:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
80105747:	8b 7d e4             	mov    -0x1c(%ebp),%edi
8010574a:	e8 c1 e1 ff ff       	call   80103910 <myproc>
8010574f:	31 d2                	xor    %edx,%edx
80105751:	eb 0d                	jmp    80105760 <sys_pipe+0x80>
80105753:	90                   	nop
80105754:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105758:	83 c2 01             	add    $0x1,%edx
8010575b:	83 fa 10             	cmp    $0x10,%edx
8010575e:	74 28                	je     80105788 <sys_pipe+0xa8>
80105760:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105764:	85 c9                	test   %ecx,%ecx
80105766:	75 f0                	jne    80105758 <sys_pipe+0x78>
80105768:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
8010576c:	8b 45 dc             	mov    -0x24(%ebp),%eax
8010576f:	89 18                	mov    %ebx,(%eax)
80105771:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105774:	89 50 04             	mov    %edx,0x4(%eax)
80105777:	31 c0                	xor    %eax,%eax
80105779:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010577c:	5b                   	pop    %ebx
8010577d:	5e                   	pop    %esi
8010577e:	5f                   	pop    %edi
8010577f:	5d                   	pop    %ebp
80105780:	c3                   	ret    
80105781:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105788:	e8 83 e1 ff ff       	call   80103910 <myproc>
8010578d:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80105794:	00 
80105795:	8d 76 00             	lea    0x0(%esi),%esi
80105798:	83 ec 0c             	sub    $0xc,%esp
8010579b:	ff 75 e0             	pushl  -0x20(%ebp)
8010579e:	e8 9d b6 ff ff       	call   80100e40 <fileclose>
801057a3:	58                   	pop    %eax
801057a4:	ff 75 e4             	pushl  -0x1c(%ebp)
801057a7:	e8 94 b6 ff ff       	call   80100e40 <fileclose>
801057ac:	83 c4 10             	add    $0x10,%esp
801057af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057b4:	eb c3                	jmp    80105779 <sys_pipe+0x99>
801057b6:	8d 76 00             	lea    0x0(%esi),%esi
801057b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801057c0 <sys_swapread>:
801057c0:	55                   	push   %ebp
801057c1:	89 e5                	mov    %esp,%ebp
801057c3:	83 ec 1c             	sub    $0x1c,%esp
801057c6:	8d 45 f0             	lea    -0x10(%ebp),%eax
801057c9:	68 00 10 00 00       	push   $0x1000
801057ce:	50                   	push   %eax
801057cf:	6a 00                	push   $0x0
801057d1:	e8 0a f3 ff ff       	call   80104ae0 <argptr>
801057d6:	83 c4 10             	add    $0x10,%esp
801057d9:	85 c0                	test   %eax,%eax
801057db:	78 33                	js     80105810 <sys_swapread+0x50>
801057dd:	8d 45 f4             	lea    -0xc(%ebp),%eax
801057e0:	83 ec 08             	sub    $0x8,%esp
801057e3:	50                   	push   %eax
801057e4:	6a 01                	push   $0x1
801057e6:	e8 a5 f2 ff ff       	call   80104a90 <argint>
801057eb:	83 c4 10             	add    $0x10,%esp
801057ee:	85 c0                	test   %eax,%eax
801057f0:	78 1e                	js     80105810 <sys_swapread+0x50>
801057f2:	83 ec 08             	sub    $0x8,%esp
801057f5:	ff 75 f4             	pushl  -0xc(%ebp)
801057f8:	ff 75 f0             	pushl  -0x10(%ebp)
801057fb:	e8 30 c7 ff ff       	call   80101f30 <swapread>
80105800:	83 c4 10             	add    $0x10,%esp
80105803:	31 c0                	xor    %eax,%eax
80105805:	c9                   	leave  
80105806:	c3                   	ret    
80105807:	89 f6                	mov    %esi,%esi
80105809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105810:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105815:	c9                   	leave  
80105816:	c3                   	ret    
80105817:	89 f6                	mov    %esi,%esi
80105819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105820 <sys_swapwrite>:
80105820:	55                   	push   %ebp
80105821:	89 e5                	mov    %esp,%ebp
80105823:	83 ec 1c             	sub    $0x1c,%esp
80105826:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105829:	68 00 10 00 00       	push   $0x1000
8010582e:	50                   	push   %eax
8010582f:	6a 00                	push   $0x0
80105831:	e8 aa f2 ff ff       	call   80104ae0 <argptr>
80105836:	83 c4 10             	add    $0x10,%esp
80105839:	85 c0                	test   %eax,%eax
8010583b:	78 33                	js     80105870 <sys_swapwrite+0x50>
8010583d:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105840:	83 ec 08             	sub    $0x8,%esp
80105843:	50                   	push   %eax
80105844:	6a 01                	push   $0x1
80105846:	e8 45 f2 ff ff       	call   80104a90 <argint>
8010584b:	83 c4 10             	add    $0x10,%esp
8010584e:	85 c0                	test   %eax,%eax
80105850:	78 1e                	js     80105870 <sys_swapwrite+0x50>
80105852:	83 ec 08             	sub    $0x8,%esp
80105855:	ff 75 f4             	pushl  -0xc(%ebp)
80105858:	ff 75 f0             	pushl  -0x10(%ebp)
8010585b:	e8 50 c7 ff ff       	call   80101fb0 <swapwrite>
80105860:	83 c4 10             	add    $0x10,%esp
80105863:	31 c0                	xor    %eax,%eax
80105865:	c9                   	leave  
80105866:	c3                   	ret    
80105867:	89 f6                	mov    %esi,%esi
80105869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105870:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105875:	c9                   	leave  
80105876:	c3                   	ret    
80105877:	66 90                	xchg   %ax,%ax
80105879:	66 90                	xchg   %ax,%ax
8010587b:	66 90                	xchg   %ax,%ax
8010587d:	66 90                	xchg   %ax,%ax
8010587f:	90                   	nop

80105880 <sys_fork>:
80105880:	55                   	push   %ebp
80105881:	89 e5                	mov    %esp,%ebp
80105883:	5d                   	pop    %ebp
80105884:	e9 47 e2 ff ff       	jmp    80103ad0 <fork>
80105889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105890 <sys_exit>:
80105890:	55                   	push   %ebp
80105891:	89 e5                	mov    %esp,%ebp
80105893:	83 ec 08             	sub    $0x8,%esp
80105896:	e8 b5 e4 ff ff       	call   80103d50 <exit>
8010589b:	31 c0                	xor    %eax,%eax
8010589d:	c9                   	leave  
8010589e:	c3                   	ret    
8010589f:	90                   	nop

801058a0 <sys_wait>:
801058a0:	55                   	push   %ebp
801058a1:	89 e5                	mov    %esp,%ebp
801058a3:	5d                   	pop    %ebp
801058a4:	e9 e7 e6 ff ff       	jmp    80103f90 <wait>
801058a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801058b0 <sys_kill>:
801058b0:	55                   	push   %ebp
801058b1:	89 e5                	mov    %esp,%ebp
801058b3:	83 ec 20             	sub    $0x20,%esp
801058b6:	8d 45 f4             	lea    -0xc(%ebp),%eax
801058b9:	50                   	push   %eax
801058ba:	6a 00                	push   $0x0
801058bc:	e8 cf f1 ff ff       	call   80104a90 <argint>
801058c1:	83 c4 10             	add    $0x10,%esp
801058c4:	85 c0                	test   %eax,%eax
801058c6:	78 18                	js     801058e0 <sys_kill+0x30>
801058c8:	83 ec 0c             	sub    $0xc,%esp
801058cb:	ff 75 f4             	pushl  -0xc(%ebp)
801058ce:	e8 0d e8 ff ff       	call   801040e0 <kill>
801058d3:	83 c4 10             	add    $0x10,%esp
801058d6:	c9                   	leave  
801058d7:	c3                   	ret    
801058d8:	90                   	nop
801058d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801058e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058e5:	c9                   	leave  
801058e6:	c3                   	ret    
801058e7:	89 f6                	mov    %esi,%esi
801058e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801058f0 <sys_getpid>:
801058f0:	55                   	push   %ebp
801058f1:	89 e5                	mov    %esp,%ebp
801058f3:	83 ec 08             	sub    $0x8,%esp
801058f6:	e8 15 e0 ff ff       	call   80103910 <myproc>
801058fb:	8b 40 10             	mov    0x10(%eax),%eax
801058fe:	c9                   	leave  
801058ff:	c3                   	ret    

80105900 <sys_sbrk>:
80105900:	55                   	push   %ebp
80105901:	89 e5                	mov    %esp,%ebp
80105903:	53                   	push   %ebx
80105904:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105907:	83 ec 1c             	sub    $0x1c,%esp
8010590a:	50                   	push   %eax
8010590b:	6a 00                	push   $0x0
8010590d:	e8 7e f1 ff ff       	call   80104a90 <argint>
80105912:	83 c4 10             	add    $0x10,%esp
80105915:	85 c0                	test   %eax,%eax
80105917:	78 27                	js     80105940 <sys_sbrk+0x40>
80105919:	e8 f2 df ff ff       	call   80103910 <myproc>
8010591e:	83 ec 0c             	sub    $0xc,%esp
80105921:	8b 18                	mov    (%eax),%ebx
80105923:	ff 75 f4             	pushl  -0xc(%ebp)
80105926:	e8 25 e1 ff ff       	call   80103a50 <growproc>
8010592b:	83 c4 10             	add    $0x10,%esp
8010592e:	85 c0                	test   %eax,%eax
80105930:	78 0e                	js     80105940 <sys_sbrk+0x40>
80105932:	89 d8                	mov    %ebx,%eax
80105934:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105937:	c9                   	leave  
80105938:	c3                   	ret    
80105939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105940:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
80105945:	eb eb                	jmp    80105932 <sys_sbrk+0x32>
80105947:	89 f6                	mov    %esi,%esi
80105949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105950 <sys_sleep>:
80105950:	55                   	push   %ebp
80105951:	89 e5                	mov    %esp,%ebp
80105953:	53                   	push   %ebx
80105954:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105957:	83 ec 1c             	sub    $0x1c,%esp
8010595a:	50                   	push   %eax
8010595b:	6a 00                	push   $0x0
8010595d:	e8 2e f1 ff ff       	call   80104a90 <argint>
80105962:	83 c4 10             	add    $0x10,%esp
80105965:	85 c0                	test   %eax,%eax
80105967:	0f 88 8a 00 00 00    	js     801059f7 <sys_sleep+0xa7>
8010596d:	83 ec 0c             	sub    $0xc,%esp
80105970:	68 60 4d 11 80       	push   $0x80114d60
80105975:	e8 06 ed ff ff       	call   80104680 <acquire>
8010597a:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010597d:	83 c4 10             	add    $0x10,%esp
80105980:	8b 1d a0 55 11 80    	mov    0x801155a0,%ebx
80105986:	85 d2                	test   %edx,%edx
80105988:	75 27                	jne    801059b1 <sys_sleep+0x61>
8010598a:	eb 54                	jmp    801059e0 <sys_sleep+0x90>
8010598c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105990:	83 ec 08             	sub    $0x8,%esp
80105993:	68 60 4d 11 80       	push   $0x80114d60
80105998:	68 a0 55 11 80       	push   $0x801155a0
8010599d:	e8 2e e5 ff ff       	call   80103ed0 <sleep>
801059a2:	a1 a0 55 11 80       	mov    0x801155a0,%eax
801059a7:	83 c4 10             	add    $0x10,%esp
801059aa:	29 d8                	sub    %ebx,%eax
801059ac:	3b 45 f4             	cmp    -0xc(%ebp),%eax
801059af:	73 2f                	jae    801059e0 <sys_sleep+0x90>
801059b1:	e8 5a df ff ff       	call   80103910 <myproc>
801059b6:	8b 40 24             	mov    0x24(%eax),%eax
801059b9:	85 c0                	test   %eax,%eax
801059bb:	74 d3                	je     80105990 <sys_sleep+0x40>
801059bd:	83 ec 0c             	sub    $0xc,%esp
801059c0:	68 60 4d 11 80       	push   $0x80114d60
801059c5:	e8 76 ed ff ff       	call   80104740 <release>
801059ca:	83 c4 10             	add    $0x10,%esp
801059cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801059d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801059d5:	c9                   	leave  
801059d6:	c3                   	ret    
801059d7:	89 f6                	mov    %esi,%esi
801059d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801059e0:	83 ec 0c             	sub    $0xc,%esp
801059e3:	68 60 4d 11 80       	push   $0x80114d60
801059e8:	e8 53 ed ff ff       	call   80104740 <release>
801059ed:	83 c4 10             	add    $0x10,%esp
801059f0:	31 c0                	xor    %eax,%eax
801059f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801059f5:	c9                   	leave  
801059f6:	c3                   	ret    
801059f7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801059fc:	eb f4                	jmp    801059f2 <sys_sleep+0xa2>
801059fe:	66 90                	xchg   %ax,%ax

80105a00 <sys_uptime>:
80105a00:	55                   	push   %ebp
80105a01:	89 e5                	mov    %esp,%ebp
80105a03:	53                   	push   %ebx
80105a04:	83 ec 10             	sub    $0x10,%esp
80105a07:	68 60 4d 11 80       	push   $0x80114d60
80105a0c:	e8 6f ec ff ff       	call   80104680 <acquire>
80105a11:	8b 1d a0 55 11 80    	mov    0x801155a0,%ebx
80105a17:	c7 04 24 60 4d 11 80 	movl   $0x80114d60,(%esp)
80105a1e:	e8 1d ed ff ff       	call   80104740 <release>
80105a23:	89 d8                	mov    %ebx,%eax
80105a25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105a28:	c9                   	leave  
80105a29:	c3                   	ret    
80105a2a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105a30 <sys_getnice>:
80105a30:	55                   	push   %ebp
80105a31:	89 e5                	mov    %esp,%ebp
80105a33:	83 ec 20             	sub    $0x20,%esp
80105a36:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105a39:	50                   	push   %eax
80105a3a:	6a 00                	push   $0x0
80105a3c:	e8 4f f0 ff ff       	call   80104a90 <argint>
80105a41:	83 c4 10             	add    $0x10,%esp
80105a44:	85 c0                	test   %eax,%eax
80105a46:	78 18                	js     80105a60 <sys_getnice+0x30>
80105a48:	83 ec 0c             	sub    $0xc,%esp
80105a4b:	ff 75 f4             	pushl  -0xc(%ebp)
80105a4e:	e8 cd e7 ff ff       	call   80104220 <getnice>
80105a53:	83 c4 10             	add    $0x10,%esp
80105a56:	c9                   	leave  
80105a57:	c3                   	ret    
80105a58:	90                   	nop
80105a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105a60:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a65:	c9                   	leave  
80105a66:	c3                   	ret    
80105a67:	89 f6                	mov    %esi,%esi
80105a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105a70 <sys_setnice>:
80105a70:	55                   	push   %ebp
80105a71:	89 e5                	mov    %esp,%ebp
80105a73:	83 ec 20             	sub    $0x20,%esp
80105a76:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105a79:	50                   	push   %eax
80105a7a:	6a 00                	push   $0x0
80105a7c:	e8 0f f0 ff ff       	call   80104a90 <argint>
80105a81:	83 c4 10             	add    $0x10,%esp
80105a84:	85 c0                	test   %eax,%eax
80105a86:	78 28                	js     80105ab0 <sys_setnice+0x40>
80105a88:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105a8b:	83 ec 08             	sub    $0x8,%esp
80105a8e:	50                   	push   %eax
80105a8f:	6a 01                	push   $0x1
80105a91:	e8 fa ef ff ff       	call   80104a90 <argint>
80105a96:	83 c4 10             	add    $0x10,%esp
80105a99:	85 c0                	test   %eax,%eax
80105a9b:	78 13                	js     80105ab0 <sys_setnice+0x40>
80105a9d:	83 ec 08             	sub    $0x8,%esp
80105aa0:	ff 75 f4             	pushl  -0xc(%ebp)
80105aa3:	ff 75 f0             	pushl  -0x10(%ebp)
80105aa6:	e8 d5 e7 ff ff       	call   80104280 <setnice>
80105aab:	83 c4 10             	add    $0x10,%esp
80105aae:	c9                   	leave  
80105aaf:	c3                   	ret    
80105ab0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105ab5:	c9                   	leave  
80105ab6:	c3                   	ret    
80105ab7:	89 f6                	mov    %esi,%esi
80105ab9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105ac0 <sys_ps>:
80105ac0:	55                   	push   %ebp
80105ac1:	89 e5                	mov    %esp,%ebp
80105ac3:	83 ec 20             	sub    $0x20,%esp
80105ac6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105ac9:	50                   	push   %eax
80105aca:	6a 00                	push   $0x0
80105acc:	e8 bf ef ff ff       	call   80104a90 <argint>
80105ad1:	83 c4 10             	add    $0x10,%esp
80105ad4:	85 c0                	test   %eax,%eax
80105ad6:	78 18                	js     80105af0 <sys_ps+0x30>
80105ad8:	83 ec 0c             	sub    $0xc,%esp
80105adb:	ff 75 f4             	pushl  -0xc(%ebp)
80105ade:	e8 2d e8 ff ff       	call   80104310 <ps>
80105ae3:	83 c4 10             	add    $0x10,%esp
80105ae6:	31 c0                	xor    %eax,%eax
80105ae8:	c9                   	leave  
80105ae9:	c3                   	ret    
80105aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105af0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105af5:	c9                   	leave  
80105af6:	c3                   	ret    

80105af7 <alltraps>:
80105af7:	1e                   	push   %ds
80105af8:	06                   	push   %es
80105af9:	0f a0                	push   %fs
80105afb:	0f a8                	push   %gs
80105afd:	60                   	pusha  
80105afe:	66 b8 10 00          	mov    $0x10,%ax
80105b02:	8e d8                	mov    %eax,%ds
80105b04:	8e c0                	mov    %eax,%es
80105b06:	54                   	push   %esp
80105b07:	e8 c4 00 00 00       	call   80105bd0 <trap>
80105b0c:	83 c4 04             	add    $0x4,%esp

80105b0f <trapret>:
80105b0f:	61                   	popa   
80105b10:	0f a9                	pop    %gs
80105b12:	0f a1                	pop    %fs
80105b14:	07                   	pop    %es
80105b15:	1f                   	pop    %ds
80105b16:	83 c4 08             	add    $0x8,%esp
80105b19:	cf                   	iret   
80105b1a:	66 90                	xchg   %ax,%ax
80105b1c:	66 90                	xchg   %ax,%ax
80105b1e:	66 90                	xchg   %ax,%ax

80105b20 <tvinit>:
80105b20:	55                   	push   %ebp
80105b21:	31 c0                	xor    %eax,%eax
80105b23:	89 e5                	mov    %esp,%ebp
80105b25:	83 ec 08             	sub    $0x8,%esp
80105b28:	90                   	nop
80105b29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105b30:	8b 14 85 08 a0 10 80 	mov    -0x7fef5ff8(,%eax,4),%edx
80105b37:	c7 04 c5 a2 4d 11 80 	movl   $0x8e000008,-0x7feeb25e(,%eax,8)
80105b3e:	08 00 00 8e 
80105b42:	66 89 14 c5 a0 4d 11 	mov    %dx,-0x7feeb260(,%eax,8)
80105b49:	80 
80105b4a:	c1 ea 10             	shr    $0x10,%edx
80105b4d:	66 89 14 c5 a6 4d 11 	mov    %dx,-0x7feeb25a(,%eax,8)
80105b54:	80 
80105b55:	83 c0 01             	add    $0x1,%eax
80105b58:	3d 00 01 00 00       	cmp    $0x100,%eax
80105b5d:	75 d1                	jne    80105b30 <tvinit+0x10>
80105b5f:	a1 08 a1 10 80       	mov    0x8010a108,%eax
80105b64:	83 ec 08             	sub    $0x8,%esp
80105b67:	c7 05 a2 4f 11 80 08 	movl   $0xef000008,0x80114fa2
80105b6e:	00 00 ef 
80105b71:	68 cd 7b 10 80       	push   $0x80107bcd
80105b76:	68 60 4d 11 80       	push   $0x80114d60
80105b7b:	66 a3 a0 4f 11 80    	mov    %ax,0x80114fa0
80105b81:	c1 e8 10             	shr    $0x10,%eax
80105b84:	66 a3 a6 4f 11 80    	mov    %ax,0x80114fa6
80105b8a:	e8 b1 e9 ff ff       	call   80104540 <initlock>
80105b8f:	83 c4 10             	add    $0x10,%esp
80105b92:	c9                   	leave  
80105b93:	c3                   	ret    
80105b94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105b9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80105ba0 <idtinit>:
80105ba0:	55                   	push   %ebp
80105ba1:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80105ba6:	89 e5                	mov    %esp,%ebp
80105ba8:	83 ec 10             	sub    $0x10,%esp
80105bab:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
80105baf:	b8 a0 4d 11 80       	mov    $0x80114da0,%eax
80105bb4:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80105bb8:	c1 e8 10             	shr    $0x10,%eax
80105bbb:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
80105bbf:	8d 45 fa             	lea    -0x6(%ebp),%eax
80105bc2:	0f 01 18             	lidtl  (%eax)
80105bc5:	c9                   	leave  
80105bc6:	c3                   	ret    
80105bc7:	89 f6                	mov    %esi,%esi
80105bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105bd0 <trap>:
80105bd0:	55                   	push   %ebp
80105bd1:	89 e5                	mov    %esp,%ebp
80105bd3:	57                   	push   %edi
80105bd4:	56                   	push   %esi
80105bd5:	53                   	push   %ebx
80105bd6:	83 ec 1c             	sub    $0x1c,%esp
80105bd9:	8b 7d 08             	mov    0x8(%ebp),%edi
80105bdc:	8b 47 30             	mov    0x30(%edi),%eax
80105bdf:	83 f8 40             	cmp    $0x40,%eax
80105be2:	0f 84 f0 00 00 00    	je     80105cd8 <trap+0x108>
80105be8:	83 e8 20             	sub    $0x20,%eax
80105beb:	83 f8 1f             	cmp    $0x1f,%eax
80105bee:	77 10                	ja     80105c00 <trap+0x30>
80105bf0:	ff 24 85 74 7c 10 80 	jmp    *-0x7fef838c(,%eax,4)
80105bf7:	89 f6                	mov    %esi,%esi
80105bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105c00:	e8 0b dd ff ff       	call   80103910 <myproc>
80105c05:	85 c0                	test   %eax,%eax
80105c07:	8b 5f 38             	mov    0x38(%edi),%ebx
80105c0a:	0f 84 14 02 00 00    	je     80105e24 <trap+0x254>
80105c10:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80105c14:	0f 84 0a 02 00 00    	je     80105e24 <trap+0x254>
80105c1a:	0f 20 d1             	mov    %cr2,%ecx
80105c1d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80105c20:	e8 cb dc ff ff       	call   801038f0 <cpuid>
80105c25:	89 45 dc             	mov    %eax,-0x24(%ebp)
80105c28:	8b 47 34             	mov    0x34(%edi),%eax
80105c2b:	8b 77 30             	mov    0x30(%edi),%esi
80105c2e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80105c31:	e8 da dc ff ff       	call   80103910 <myproc>
80105c36:	89 45 e0             	mov    %eax,-0x20(%ebp)
80105c39:	e8 d2 dc ff ff       	call   80103910 <myproc>
80105c3e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
80105c41:	8b 55 dc             	mov    -0x24(%ebp),%edx
80105c44:	51                   	push   %ecx
80105c45:	53                   	push   %ebx
80105c46:	52                   	push   %edx
80105c47:	8b 55 e0             	mov    -0x20(%ebp),%edx
80105c4a:	ff 75 e4             	pushl  -0x1c(%ebp)
80105c4d:	56                   	push   %esi
80105c4e:	83 c2 6c             	add    $0x6c,%edx
80105c51:	52                   	push   %edx
80105c52:	ff 70 10             	pushl  0x10(%eax)
80105c55:	68 30 7c 10 80       	push   $0x80107c30
80105c5a:	e8 01 aa ff ff       	call   80100660 <cprintf>
80105c5f:	83 c4 20             	add    $0x20,%esp
80105c62:	e8 a9 dc ff ff       	call   80103910 <myproc>
80105c67:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
80105c6e:	e8 9d dc ff ff       	call   80103910 <myproc>
80105c73:	85 c0                	test   %eax,%eax
80105c75:	74 1d                	je     80105c94 <trap+0xc4>
80105c77:	e8 94 dc ff ff       	call   80103910 <myproc>
80105c7c:	8b 50 24             	mov    0x24(%eax),%edx
80105c7f:	85 d2                	test   %edx,%edx
80105c81:	74 11                	je     80105c94 <trap+0xc4>
80105c83:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105c87:	83 e0 03             	and    $0x3,%eax
80105c8a:	66 83 f8 03          	cmp    $0x3,%ax
80105c8e:	0f 84 4c 01 00 00    	je     80105de0 <trap+0x210>
80105c94:	e8 77 dc ff ff       	call   80103910 <myproc>
80105c99:	85 c0                	test   %eax,%eax
80105c9b:	74 0b                	je     80105ca8 <trap+0xd8>
80105c9d:	e8 6e dc ff ff       	call   80103910 <myproc>
80105ca2:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
80105ca6:	74 68                	je     80105d10 <trap+0x140>
80105ca8:	e8 63 dc ff ff       	call   80103910 <myproc>
80105cad:	85 c0                	test   %eax,%eax
80105caf:	74 19                	je     80105cca <trap+0xfa>
80105cb1:	e8 5a dc ff ff       	call   80103910 <myproc>
80105cb6:	8b 40 24             	mov    0x24(%eax),%eax
80105cb9:	85 c0                	test   %eax,%eax
80105cbb:	74 0d                	je     80105cca <trap+0xfa>
80105cbd:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80105cc1:	83 e0 03             	and    $0x3,%eax
80105cc4:	66 83 f8 03          	cmp    $0x3,%ax
80105cc8:	74 37                	je     80105d01 <trap+0x131>
80105cca:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ccd:	5b                   	pop    %ebx
80105cce:	5e                   	pop    %esi
80105ccf:	5f                   	pop    %edi
80105cd0:	5d                   	pop    %ebp
80105cd1:	c3                   	ret    
80105cd2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105cd8:	e8 33 dc ff ff       	call   80103910 <myproc>
80105cdd:	8b 58 24             	mov    0x24(%eax),%ebx
80105ce0:	85 db                	test   %ebx,%ebx
80105ce2:	0f 85 e8 00 00 00    	jne    80105dd0 <trap+0x200>
80105ce8:	e8 23 dc ff ff       	call   80103910 <myproc>
80105ced:	89 78 18             	mov    %edi,0x18(%eax)
80105cf0:	e8 8b ee ff ff       	call   80104b80 <syscall>
80105cf5:	e8 16 dc ff ff       	call   80103910 <myproc>
80105cfa:	8b 48 24             	mov    0x24(%eax),%ecx
80105cfd:	85 c9                	test   %ecx,%ecx
80105cff:	74 c9                	je     80105cca <trap+0xfa>
80105d01:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105d04:	5b                   	pop    %ebx
80105d05:	5e                   	pop    %esi
80105d06:	5f                   	pop    %edi
80105d07:	5d                   	pop    %ebp
80105d08:	e9 43 e0 ff ff       	jmp    80103d50 <exit>
80105d0d:	8d 76 00             	lea    0x0(%esi),%esi
80105d10:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
80105d14:	75 92                	jne    80105ca8 <trap+0xd8>
80105d16:	e8 65 e1 ff ff       	call   80103e80 <yield>
80105d1b:	eb 8b                	jmp    80105ca8 <trap+0xd8>
80105d1d:	8d 76 00             	lea    0x0(%esi),%esi
80105d20:	e8 cb db ff ff       	call   801038f0 <cpuid>
80105d25:	85 c0                	test   %eax,%eax
80105d27:	0f 84 c3 00 00 00    	je     80105df0 <trap+0x220>
80105d2d:	e8 3e cb ff ff       	call   80102870 <lapiceoi>
80105d32:	e8 d9 db ff ff       	call   80103910 <myproc>
80105d37:	85 c0                	test   %eax,%eax
80105d39:	0f 85 38 ff ff ff    	jne    80105c77 <trap+0xa7>
80105d3f:	e9 50 ff ff ff       	jmp    80105c94 <trap+0xc4>
80105d44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105d48:	e8 e3 c9 ff ff       	call   80102730 <kbdintr>
80105d4d:	e8 1e cb ff ff       	call   80102870 <lapiceoi>
80105d52:	e8 b9 db ff ff       	call   80103910 <myproc>
80105d57:	85 c0                	test   %eax,%eax
80105d59:	0f 85 18 ff ff ff    	jne    80105c77 <trap+0xa7>
80105d5f:	e9 30 ff ff ff       	jmp    80105c94 <trap+0xc4>
80105d64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105d68:	e8 53 02 00 00       	call   80105fc0 <uartintr>
80105d6d:	e8 fe ca ff ff       	call   80102870 <lapiceoi>
80105d72:	e8 99 db ff ff       	call   80103910 <myproc>
80105d77:	85 c0                	test   %eax,%eax
80105d79:	0f 85 f8 fe ff ff    	jne    80105c77 <trap+0xa7>
80105d7f:	e9 10 ff ff ff       	jmp    80105c94 <trap+0xc4>
80105d84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105d88:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
80105d8c:	8b 77 38             	mov    0x38(%edi),%esi
80105d8f:	e8 5c db ff ff       	call   801038f0 <cpuid>
80105d94:	56                   	push   %esi
80105d95:	53                   	push   %ebx
80105d96:	50                   	push   %eax
80105d97:	68 d8 7b 10 80       	push   $0x80107bd8
80105d9c:	e8 bf a8 ff ff       	call   80100660 <cprintf>
80105da1:	e8 ca ca ff ff       	call   80102870 <lapiceoi>
80105da6:	83 c4 10             	add    $0x10,%esp
80105da9:	e8 62 db ff ff       	call   80103910 <myproc>
80105dae:	85 c0                	test   %eax,%eax
80105db0:	0f 85 c1 fe ff ff    	jne    80105c77 <trap+0xa7>
80105db6:	e9 d9 fe ff ff       	jmp    80105c94 <trap+0xc4>
80105dbb:	90                   	nop
80105dbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105dc0:	e8 db c3 ff ff       	call   801021a0 <ideintr>
80105dc5:	e9 63 ff ff ff       	jmp    80105d2d <trap+0x15d>
80105dca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105dd0:	e8 7b df ff ff       	call   80103d50 <exit>
80105dd5:	e9 0e ff ff ff       	jmp    80105ce8 <trap+0x118>
80105dda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105de0:	e8 6b df ff ff       	call   80103d50 <exit>
80105de5:	e9 aa fe ff ff       	jmp    80105c94 <trap+0xc4>
80105dea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105df0:	83 ec 0c             	sub    $0xc,%esp
80105df3:	68 60 4d 11 80       	push   $0x80114d60
80105df8:	e8 83 e8 ff ff       	call   80104680 <acquire>
80105dfd:	c7 04 24 a0 55 11 80 	movl   $0x801155a0,(%esp)
80105e04:	83 05 a0 55 11 80 01 	addl   $0x1,0x801155a0
80105e0b:	e8 70 e2 ff ff       	call   80104080 <wakeup>
80105e10:	c7 04 24 60 4d 11 80 	movl   $0x80114d60,(%esp)
80105e17:	e8 24 e9 ff ff       	call   80104740 <release>
80105e1c:	83 c4 10             	add    $0x10,%esp
80105e1f:	e9 09 ff ff ff       	jmp    80105d2d <trap+0x15d>
80105e24:	0f 20 d6             	mov    %cr2,%esi
80105e27:	e8 c4 da ff ff       	call   801038f0 <cpuid>
80105e2c:	83 ec 0c             	sub    $0xc,%esp
80105e2f:	56                   	push   %esi
80105e30:	53                   	push   %ebx
80105e31:	50                   	push   %eax
80105e32:	ff 77 30             	pushl  0x30(%edi)
80105e35:	68 fc 7b 10 80       	push   $0x80107bfc
80105e3a:	e8 21 a8 ff ff       	call   80100660 <cprintf>
80105e3f:	83 c4 14             	add    $0x14,%esp
80105e42:	68 d2 7b 10 80       	push   $0x80107bd2
80105e47:	e8 44 a5 ff ff       	call   80100390 <panic>
80105e4c:	66 90                	xchg   %ax,%ax
80105e4e:	66 90                	xchg   %ax,%ax

80105e50 <uartgetc>:
80105e50:	a1 bc a5 10 80       	mov    0x8010a5bc,%eax
80105e55:	55                   	push   %ebp
80105e56:	89 e5                	mov    %esp,%ebp
80105e58:	85 c0                	test   %eax,%eax
80105e5a:	74 1c                	je     80105e78 <uartgetc+0x28>
80105e5c:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105e61:	ec                   	in     (%dx),%al
80105e62:	a8 01                	test   $0x1,%al
80105e64:	74 12                	je     80105e78 <uartgetc+0x28>
80105e66:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105e6b:	ec                   	in     (%dx),%al
80105e6c:	0f b6 c0             	movzbl %al,%eax
80105e6f:	5d                   	pop    %ebp
80105e70:	c3                   	ret    
80105e71:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105e78:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105e7d:	5d                   	pop    %ebp
80105e7e:	c3                   	ret    
80105e7f:	90                   	nop

80105e80 <uartputc.part.0>:
80105e80:	55                   	push   %ebp
80105e81:	89 e5                	mov    %esp,%ebp
80105e83:	57                   	push   %edi
80105e84:	56                   	push   %esi
80105e85:	53                   	push   %ebx
80105e86:	89 c7                	mov    %eax,%edi
80105e88:	bb 80 00 00 00       	mov    $0x80,%ebx
80105e8d:	be fd 03 00 00       	mov    $0x3fd,%esi
80105e92:	83 ec 0c             	sub    $0xc,%esp
80105e95:	eb 1b                	jmp    80105eb2 <uartputc.part.0+0x32>
80105e97:	89 f6                	mov    %esi,%esi
80105e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ea0:	83 ec 0c             	sub    $0xc,%esp
80105ea3:	6a 0a                	push   $0xa
80105ea5:	e8 e6 c9 ff ff       	call   80102890 <microdelay>
80105eaa:	83 c4 10             	add    $0x10,%esp
80105ead:	83 eb 01             	sub    $0x1,%ebx
80105eb0:	74 07                	je     80105eb9 <uartputc.part.0+0x39>
80105eb2:	89 f2                	mov    %esi,%edx
80105eb4:	ec                   	in     (%dx),%al
80105eb5:	a8 20                	test   $0x20,%al
80105eb7:	74 e7                	je     80105ea0 <uartputc.part.0+0x20>
80105eb9:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105ebe:	89 f8                	mov    %edi,%eax
80105ec0:	ee                   	out    %al,(%dx)
80105ec1:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105ec4:	5b                   	pop    %ebx
80105ec5:	5e                   	pop    %esi
80105ec6:	5f                   	pop    %edi
80105ec7:	5d                   	pop    %ebp
80105ec8:	c3                   	ret    
80105ec9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105ed0 <uartinit>:
80105ed0:	55                   	push   %ebp
80105ed1:	31 c9                	xor    %ecx,%ecx
80105ed3:	89 c8                	mov    %ecx,%eax
80105ed5:	89 e5                	mov    %esp,%ebp
80105ed7:	57                   	push   %edi
80105ed8:	56                   	push   %esi
80105ed9:	53                   	push   %ebx
80105eda:	bb fa 03 00 00       	mov    $0x3fa,%ebx
80105edf:	89 da                	mov    %ebx,%edx
80105ee1:	83 ec 0c             	sub    $0xc,%esp
80105ee4:	ee                   	out    %al,(%dx)
80105ee5:	bf fb 03 00 00       	mov    $0x3fb,%edi
80105eea:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
80105eef:	89 fa                	mov    %edi,%edx
80105ef1:	ee                   	out    %al,(%dx)
80105ef2:	b8 0c 00 00 00       	mov    $0xc,%eax
80105ef7:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105efc:	ee                   	out    %al,(%dx)
80105efd:	be f9 03 00 00       	mov    $0x3f9,%esi
80105f02:	89 c8                	mov    %ecx,%eax
80105f04:	89 f2                	mov    %esi,%edx
80105f06:	ee                   	out    %al,(%dx)
80105f07:	b8 03 00 00 00       	mov    $0x3,%eax
80105f0c:	89 fa                	mov    %edi,%edx
80105f0e:	ee                   	out    %al,(%dx)
80105f0f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80105f14:	89 c8                	mov    %ecx,%eax
80105f16:	ee                   	out    %al,(%dx)
80105f17:	b8 01 00 00 00       	mov    $0x1,%eax
80105f1c:	89 f2                	mov    %esi,%edx
80105f1e:	ee                   	out    %al,(%dx)
80105f1f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80105f24:	ec                   	in     (%dx),%al
80105f25:	3c ff                	cmp    $0xff,%al
80105f27:	74 5a                	je     80105f83 <uartinit+0xb3>
80105f29:	c7 05 bc a5 10 80 01 	movl   $0x1,0x8010a5bc
80105f30:	00 00 00 
80105f33:	89 da                	mov    %ebx,%edx
80105f35:	ec                   	in     (%dx),%al
80105f36:	ba f8 03 00 00       	mov    $0x3f8,%edx
80105f3b:	ec                   	in     (%dx),%al
80105f3c:	83 ec 08             	sub    $0x8,%esp
80105f3f:	bb f4 7c 10 80       	mov    $0x80107cf4,%ebx
80105f44:	6a 00                	push   $0x0
80105f46:	6a 04                	push   $0x4
80105f48:	e8 a3 c4 ff ff       	call   801023f0 <ioapicenable>
80105f4d:	83 c4 10             	add    $0x10,%esp
80105f50:	b8 78 00 00 00       	mov    $0x78,%eax
80105f55:	eb 13                	jmp    80105f6a <uartinit+0x9a>
80105f57:	89 f6                	mov    %esi,%esi
80105f59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105f60:	83 c3 01             	add    $0x1,%ebx
80105f63:	0f be 03             	movsbl (%ebx),%eax
80105f66:	84 c0                	test   %al,%al
80105f68:	74 19                	je     80105f83 <uartinit+0xb3>
80105f6a:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105f70:	85 d2                	test   %edx,%edx
80105f72:	74 ec                	je     80105f60 <uartinit+0x90>
80105f74:	83 c3 01             	add    $0x1,%ebx
80105f77:	e8 04 ff ff ff       	call   80105e80 <uartputc.part.0>
80105f7c:	0f be 03             	movsbl (%ebx),%eax
80105f7f:	84 c0                	test   %al,%al
80105f81:	75 e7                	jne    80105f6a <uartinit+0x9a>
80105f83:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105f86:	5b                   	pop    %ebx
80105f87:	5e                   	pop    %esi
80105f88:	5f                   	pop    %edi
80105f89:	5d                   	pop    %ebp
80105f8a:	c3                   	ret    
80105f8b:	90                   	nop
80105f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105f90 <uartputc>:
80105f90:	8b 15 bc a5 10 80    	mov    0x8010a5bc,%edx
80105f96:	55                   	push   %ebp
80105f97:	89 e5                	mov    %esp,%ebp
80105f99:	85 d2                	test   %edx,%edx
80105f9b:	8b 45 08             	mov    0x8(%ebp),%eax
80105f9e:	74 10                	je     80105fb0 <uartputc+0x20>
80105fa0:	5d                   	pop    %ebp
80105fa1:	e9 da fe ff ff       	jmp    80105e80 <uartputc.part.0>
80105fa6:	8d 76 00             	lea    0x0(%esi),%esi
80105fa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105fb0:	5d                   	pop    %ebp
80105fb1:	c3                   	ret    
80105fb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105fc0 <uartintr>:
80105fc0:	55                   	push   %ebp
80105fc1:	89 e5                	mov    %esp,%ebp
80105fc3:	83 ec 14             	sub    $0x14,%esp
80105fc6:	68 50 5e 10 80       	push   $0x80105e50
80105fcb:	e8 40 a8 ff ff       	call   80100810 <consoleintr>
80105fd0:	83 c4 10             	add    $0x10,%esp
80105fd3:	c9                   	leave  
80105fd4:	c3                   	ret    

80105fd5 <vector0>:
80105fd5:	6a 00                	push   $0x0
80105fd7:	6a 00                	push   $0x0
80105fd9:	e9 19 fb ff ff       	jmp    80105af7 <alltraps>

80105fde <vector1>:
80105fde:	6a 00                	push   $0x0
80105fe0:	6a 01                	push   $0x1
80105fe2:	e9 10 fb ff ff       	jmp    80105af7 <alltraps>

80105fe7 <vector2>:
80105fe7:	6a 00                	push   $0x0
80105fe9:	6a 02                	push   $0x2
80105feb:	e9 07 fb ff ff       	jmp    80105af7 <alltraps>

80105ff0 <vector3>:
80105ff0:	6a 00                	push   $0x0
80105ff2:	6a 03                	push   $0x3
80105ff4:	e9 fe fa ff ff       	jmp    80105af7 <alltraps>

80105ff9 <vector4>:
80105ff9:	6a 00                	push   $0x0
80105ffb:	6a 04                	push   $0x4
80105ffd:	e9 f5 fa ff ff       	jmp    80105af7 <alltraps>

80106002 <vector5>:
80106002:	6a 00                	push   $0x0
80106004:	6a 05                	push   $0x5
80106006:	e9 ec fa ff ff       	jmp    80105af7 <alltraps>

8010600b <vector6>:
8010600b:	6a 00                	push   $0x0
8010600d:	6a 06                	push   $0x6
8010600f:	e9 e3 fa ff ff       	jmp    80105af7 <alltraps>

80106014 <vector7>:
80106014:	6a 00                	push   $0x0
80106016:	6a 07                	push   $0x7
80106018:	e9 da fa ff ff       	jmp    80105af7 <alltraps>

8010601d <vector8>:
8010601d:	6a 08                	push   $0x8
8010601f:	e9 d3 fa ff ff       	jmp    80105af7 <alltraps>

80106024 <vector9>:
80106024:	6a 00                	push   $0x0
80106026:	6a 09                	push   $0x9
80106028:	e9 ca fa ff ff       	jmp    80105af7 <alltraps>

8010602d <vector10>:
8010602d:	6a 0a                	push   $0xa
8010602f:	e9 c3 fa ff ff       	jmp    80105af7 <alltraps>

80106034 <vector11>:
80106034:	6a 0b                	push   $0xb
80106036:	e9 bc fa ff ff       	jmp    80105af7 <alltraps>

8010603b <vector12>:
8010603b:	6a 0c                	push   $0xc
8010603d:	e9 b5 fa ff ff       	jmp    80105af7 <alltraps>

80106042 <vector13>:
80106042:	6a 0d                	push   $0xd
80106044:	e9 ae fa ff ff       	jmp    80105af7 <alltraps>

80106049 <vector14>:
80106049:	6a 0e                	push   $0xe
8010604b:	e9 a7 fa ff ff       	jmp    80105af7 <alltraps>

80106050 <vector15>:
80106050:	6a 00                	push   $0x0
80106052:	6a 0f                	push   $0xf
80106054:	e9 9e fa ff ff       	jmp    80105af7 <alltraps>

80106059 <vector16>:
80106059:	6a 00                	push   $0x0
8010605b:	6a 10                	push   $0x10
8010605d:	e9 95 fa ff ff       	jmp    80105af7 <alltraps>

80106062 <vector17>:
80106062:	6a 11                	push   $0x11
80106064:	e9 8e fa ff ff       	jmp    80105af7 <alltraps>

80106069 <vector18>:
80106069:	6a 00                	push   $0x0
8010606b:	6a 12                	push   $0x12
8010606d:	e9 85 fa ff ff       	jmp    80105af7 <alltraps>

80106072 <vector19>:
80106072:	6a 00                	push   $0x0
80106074:	6a 13                	push   $0x13
80106076:	e9 7c fa ff ff       	jmp    80105af7 <alltraps>

8010607b <vector20>:
8010607b:	6a 00                	push   $0x0
8010607d:	6a 14                	push   $0x14
8010607f:	e9 73 fa ff ff       	jmp    80105af7 <alltraps>

80106084 <vector21>:
80106084:	6a 00                	push   $0x0
80106086:	6a 15                	push   $0x15
80106088:	e9 6a fa ff ff       	jmp    80105af7 <alltraps>

8010608d <vector22>:
8010608d:	6a 00                	push   $0x0
8010608f:	6a 16                	push   $0x16
80106091:	e9 61 fa ff ff       	jmp    80105af7 <alltraps>

80106096 <vector23>:
80106096:	6a 00                	push   $0x0
80106098:	6a 17                	push   $0x17
8010609a:	e9 58 fa ff ff       	jmp    80105af7 <alltraps>

8010609f <vector24>:
8010609f:	6a 00                	push   $0x0
801060a1:	6a 18                	push   $0x18
801060a3:	e9 4f fa ff ff       	jmp    80105af7 <alltraps>

801060a8 <vector25>:
801060a8:	6a 00                	push   $0x0
801060aa:	6a 19                	push   $0x19
801060ac:	e9 46 fa ff ff       	jmp    80105af7 <alltraps>

801060b1 <vector26>:
801060b1:	6a 00                	push   $0x0
801060b3:	6a 1a                	push   $0x1a
801060b5:	e9 3d fa ff ff       	jmp    80105af7 <alltraps>

801060ba <vector27>:
801060ba:	6a 00                	push   $0x0
801060bc:	6a 1b                	push   $0x1b
801060be:	e9 34 fa ff ff       	jmp    80105af7 <alltraps>

801060c3 <vector28>:
801060c3:	6a 00                	push   $0x0
801060c5:	6a 1c                	push   $0x1c
801060c7:	e9 2b fa ff ff       	jmp    80105af7 <alltraps>

801060cc <vector29>:
801060cc:	6a 00                	push   $0x0
801060ce:	6a 1d                	push   $0x1d
801060d0:	e9 22 fa ff ff       	jmp    80105af7 <alltraps>

801060d5 <vector30>:
801060d5:	6a 00                	push   $0x0
801060d7:	6a 1e                	push   $0x1e
801060d9:	e9 19 fa ff ff       	jmp    80105af7 <alltraps>

801060de <vector31>:
801060de:	6a 00                	push   $0x0
801060e0:	6a 1f                	push   $0x1f
801060e2:	e9 10 fa ff ff       	jmp    80105af7 <alltraps>

801060e7 <vector32>:
801060e7:	6a 00                	push   $0x0
801060e9:	6a 20                	push   $0x20
801060eb:	e9 07 fa ff ff       	jmp    80105af7 <alltraps>

801060f0 <vector33>:
801060f0:	6a 00                	push   $0x0
801060f2:	6a 21                	push   $0x21
801060f4:	e9 fe f9 ff ff       	jmp    80105af7 <alltraps>

801060f9 <vector34>:
801060f9:	6a 00                	push   $0x0
801060fb:	6a 22                	push   $0x22
801060fd:	e9 f5 f9 ff ff       	jmp    80105af7 <alltraps>

80106102 <vector35>:
80106102:	6a 00                	push   $0x0
80106104:	6a 23                	push   $0x23
80106106:	e9 ec f9 ff ff       	jmp    80105af7 <alltraps>

8010610b <vector36>:
8010610b:	6a 00                	push   $0x0
8010610d:	6a 24                	push   $0x24
8010610f:	e9 e3 f9 ff ff       	jmp    80105af7 <alltraps>

80106114 <vector37>:
80106114:	6a 00                	push   $0x0
80106116:	6a 25                	push   $0x25
80106118:	e9 da f9 ff ff       	jmp    80105af7 <alltraps>

8010611d <vector38>:
8010611d:	6a 00                	push   $0x0
8010611f:	6a 26                	push   $0x26
80106121:	e9 d1 f9 ff ff       	jmp    80105af7 <alltraps>

80106126 <vector39>:
80106126:	6a 00                	push   $0x0
80106128:	6a 27                	push   $0x27
8010612a:	e9 c8 f9 ff ff       	jmp    80105af7 <alltraps>

8010612f <vector40>:
8010612f:	6a 00                	push   $0x0
80106131:	6a 28                	push   $0x28
80106133:	e9 bf f9 ff ff       	jmp    80105af7 <alltraps>

80106138 <vector41>:
80106138:	6a 00                	push   $0x0
8010613a:	6a 29                	push   $0x29
8010613c:	e9 b6 f9 ff ff       	jmp    80105af7 <alltraps>

80106141 <vector42>:
80106141:	6a 00                	push   $0x0
80106143:	6a 2a                	push   $0x2a
80106145:	e9 ad f9 ff ff       	jmp    80105af7 <alltraps>

8010614a <vector43>:
8010614a:	6a 00                	push   $0x0
8010614c:	6a 2b                	push   $0x2b
8010614e:	e9 a4 f9 ff ff       	jmp    80105af7 <alltraps>

80106153 <vector44>:
80106153:	6a 00                	push   $0x0
80106155:	6a 2c                	push   $0x2c
80106157:	e9 9b f9 ff ff       	jmp    80105af7 <alltraps>

8010615c <vector45>:
8010615c:	6a 00                	push   $0x0
8010615e:	6a 2d                	push   $0x2d
80106160:	e9 92 f9 ff ff       	jmp    80105af7 <alltraps>

80106165 <vector46>:
80106165:	6a 00                	push   $0x0
80106167:	6a 2e                	push   $0x2e
80106169:	e9 89 f9 ff ff       	jmp    80105af7 <alltraps>

8010616e <vector47>:
8010616e:	6a 00                	push   $0x0
80106170:	6a 2f                	push   $0x2f
80106172:	e9 80 f9 ff ff       	jmp    80105af7 <alltraps>

80106177 <vector48>:
80106177:	6a 00                	push   $0x0
80106179:	6a 30                	push   $0x30
8010617b:	e9 77 f9 ff ff       	jmp    80105af7 <alltraps>

80106180 <vector49>:
80106180:	6a 00                	push   $0x0
80106182:	6a 31                	push   $0x31
80106184:	e9 6e f9 ff ff       	jmp    80105af7 <alltraps>

80106189 <vector50>:
80106189:	6a 00                	push   $0x0
8010618b:	6a 32                	push   $0x32
8010618d:	e9 65 f9 ff ff       	jmp    80105af7 <alltraps>

80106192 <vector51>:
80106192:	6a 00                	push   $0x0
80106194:	6a 33                	push   $0x33
80106196:	e9 5c f9 ff ff       	jmp    80105af7 <alltraps>

8010619b <vector52>:
8010619b:	6a 00                	push   $0x0
8010619d:	6a 34                	push   $0x34
8010619f:	e9 53 f9 ff ff       	jmp    80105af7 <alltraps>

801061a4 <vector53>:
801061a4:	6a 00                	push   $0x0
801061a6:	6a 35                	push   $0x35
801061a8:	e9 4a f9 ff ff       	jmp    80105af7 <alltraps>

801061ad <vector54>:
801061ad:	6a 00                	push   $0x0
801061af:	6a 36                	push   $0x36
801061b1:	e9 41 f9 ff ff       	jmp    80105af7 <alltraps>

801061b6 <vector55>:
801061b6:	6a 00                	push   $0x0
801061b8:	6a 37                	push   $0x37
801061ba:	e9 38 f9 ff ff       	jmp    80105af7 <alltraps>

801061bf <vector56>:
801061bf:	6a 00                	push   $0x0
801061c1:	6a 38                	push   $0x38
801061c3:	e9 2f f9 ff ff       	jmp    80105af7 <alltraps>

801061c8 <vector57>:
801061c8:	6a 00                	push   $0x0
801061ca:	6a 39                	push   $0x39
801061cc:	e9 26 f9 ff ff       	jmp    80105af7 <alltraps>

801061d1 <vector58>:
801061d1:	6a 00                	push   $0x0
801061d3:	6a 3a                	push   $0x3a
801061d5:	e9 1d f9 ff ff       	jmp    80105af7 <alltraps>

801061da <vector59>:
801061da:	6a 00                	push   $0x0
801061dc:	6a 3b                	push   $0x3b
801061de:	e9 14 f9 ff ff       	jmp    80105af7 <alltraps>

801061e3 <vector60>:
801061e3:	6a 00                	push   $0x0
801061e5:	6a 3c                	push   $0x3c
801061e7:	e9 0b f9 ff ff       	jmp    80105af7 <alltraps>

801061ec <vector61>:
801061ec:	6a 00                	push   $0x0
801061ee:	6a 3d                	push   $0x3d
801061f0:	e9 02 f9 ff ff       	jmp    80105af7 <alltraps>

801061f5 <vector62>:
801061f5:	6a 00                	push   $0x0
801061f7:	6a 3e                	push   $0x3e
801061f9:	e9 f9 f8 ff ff       	jmp    80105af7 <alltraps>

801061fe <vector63>:
801061fe:	6a 00                	push   $0x0
80106200:	6a 3f                	push   $0x3f
80106202:	e9 f0 f8 ff ff       	jmp    80105af7 <alltraps>

80106207 <vector64>:
80106207:	6a 00                	push   $0x0
80106209:	6a 40                	push   $0x40
8010620b:	e9 e7 f8 ff ff       	jmp    80105af7 <alltraps>

80106210 <vector65>:
80106210:	6a 00                	push   $0x0
80106212:	6a 41                	push   $0x41
80106214:	e9 de f8 ff ff       	jmp    80105af7 <alltraps>

80106219 <vector66>:
80106219:	6a 00                	push   $0x0
8010621b:	6a 42                	push   $0x42
8010621d:	e9 d5 f8 ff ff       	jmp    80105af7 <alltraps>

80106222 <vector67>:
80106222:	6a 00                	push   $0x0
80106224:	6a 43                	push   $0x43
80106226:	e9 cc f8 ff ff       	jmp    80105af7 <alltraps>

8010622b <vector68>:
8010622b:	6a 00                	push   $0x0
8010622d:	6a 44                	push   $0x44
8010622f:	e9 c3 f8 ff ff       	jmp    80105af7 <alltraps>

80106234 <vector69>:
80106234:	6a 00                	push   $0x0
80106236:	6a 45                	push   $0x45
80106238:	e9 ba f8 ff ff       	jmp    80105af7 <alltraps>

8010623d <vector70>:
8010623d:	6a 00                	push   $0x0
8010623f:	6a 46                	push   $0x46
80106241:	e9 b1 f8 ff ff       	jmp    80105af7 <alltraps>

80106246 <vector71>:
80106246:	6a 00                	push   $0x0
80106248:	6a 47                	push   $0x47
8010624a:	e9 a8 f8 ff ff       	jmp    80105af7 <alltraps>

8010624f <vector72>:
8010624f:	6a 00                	push   $0x0
80106251:	6a 48                	push   $0x48
80106253:	e9 9f f8 ff ff       	jmp    80105af7 <alltraps>

80106258 <vector73>:
80106258:	6a 00                	push   $0x0
8010625a:	6a 49                	push   $0x49
8010625c:	e9 96 f8 ff ff       	jmp    80105af7 <alltraps>

80106261 <vector74>:
80106261:	6a 00                	push   $0x0
80106263:	6a 4a                	push   $0x4a
80106265:	e9 8d f8 ff ff       	jmp    80105af7 <alltraps>

8010626a <vector75>:
8010626a:	6a 00                	push   $0x0
8010626c:	6a 4b                	push   $0x4b
8010626e:	e9 84 f8 ff ff       	jmp    80105af7 <alltraps>

80106273 <vector76>:
80106273:	6a 00                	push   $0x0
80106275:	6a 4c                	push   $0x4c
80106277:	e9 7b f8 ff ff       	jmp    80105af7 <alltraps>

8010627c <vector77>:
8010627c:	6a 00                	push   $0x0
8010627e:	6a 4d                	push   $0x4d
80106280:	e9 72 f8 ff ff       	jmp    80105af7 <alltraps>

80106285 <vector78>:
80106285:	6a 00                	push   $0x0
80106287:	6a 4e                	push   $0x4e
80106289:	e9 69 f8 ff ff       	jmp    80105af7 <alltraps>

8010628e <vector79>:
8010628e:	6a 00                	push   $0x0
80106290:	6a 4f                	push   $0x4f
80106292:	e9 60 f8 ff ff       	jmp    80105af7 <alltraps>

80106297 <vector80>:
80106297:	6a 00                	push   $0x0
80106299:	6a 50                	push   $0x50
8010629b:	e9 57 f8 ff ff       	jmp    80105af7 <alltraps>

801062a0 <vector81>:
801062a0:	6a 00                	push   $0x0
801062a2:	6a 51                	push   $0x51
801062a4:	e9 4e f8 ff ff       	jmp    80105af7 <alltraps>

801062a9 <vector82>:
801062a9:	6a 00                	push   $0x0
801062ab:	6a 52                	push   $0x52
801062ad:	e9 45 f8 ff ff       	jmp    80105af7 <alltraps>

801062b2 <vector83>:
801062b2:	6a 00                	push   $0x0
801062b4:	6a 53                	push   $0x53
801062b6:	e9 3c f8 ff ff       	jmp    80105af7 <alltraps>

801062bb <vector84>:
801062bb:	6a 00                	push   $0x0
801062bd:	6a 54                	push   $0x54
801062bf:	e9 33 f8 ff ff       	jmp    80105af7 <alltraps>

801062c4 <vector85>:
801062c4:	6a 00                	push   $0x0
801062c6:	6a 55                	push   $0x55
801062c8:	e9 2a f8 ff ff       	jmp    80105af7 <alltraps>

801062cd <vector86>:
801062cd:	6a 00                	push   $0x0
801062cf:	6a 56                	push   $0x56
801062d1:	e9 21 f8 ff ff       	jmp    80105af7 <alltraps>

801062d6 <vector87>:
801062d6:	6a 00                	push   $0x0
801062d8:	6a 57                	push   $0x57
801062da:	e9 18 f8 ff ff       	jmp    80105af7 <alltraps>

801062df <vector88>:
801062df:	6a 00                	push   $0x0
801062e1:	6a 58                	push   $0x58
801062e3:	e9 0f f8 ff ff       	jmp    80105af7 <alltraps>

801062e8 <vector89>:
801062e8:	6a 00                	push   $0x0
801062ea:	6a 59                	push   $0x59
801062ec:	e9 06 f8 ff ff       	jmp    80105af7 <alltraps>

801062f1 <vector90>:
801062f1:	6a 00                	push   $0x0
801062f3:	6a 5a                	push   $0x5a
801062f5:	e9 fd f7 ff ff       	jmp    80105af7 <alltraps>

801062fa <vector91>:
801062fa:	6a 00                	push   $0x0
801062fc:	6a 5b                	push   $0x5b
801062fe:	e9 f4 f7 ff ff       	jmp    80105af7 <alltraps>

80106303 <vector92>:
80106303:	6a 00                	push   $0x0
80106305:	6a 5c                	push   $0x5c
80106307:	e9 eb f7 ff ff       	jmp    80105af7 <alltraps>

8010630c <vector93>:
8010630c:	6a 00                	push   $0x0
8010630e:	6a 5d                	push   $0x5d
80106310:	e9 e2 f7 ff ff       	jmp    80105af7 <alltraps>

80106315 <vector94>:
80106315:	6a 00                	push   $0x0
80106317:	6a 5e                	push   $0x5e
80106319:	e9 d9 f7 ff ff       	jmp    80105af7 <alltraps>

8010631e <vector95>:
8010631e:	6a 00                	push   $0x0
80106320:	6a 5f                	push   $0x5f
80106322:	e9 d0 f7 ff ff       	jmp    80105af7 <alltraps>

80106327 <vector96>:
80106327:	6a 00                	push   $0x0
80106329:	6a 60                	push   $0x60
8010632b:	e9 c7 f7 ff ff       	jmp    80105af7 <alltraps>

80106330 <vector97>:
80106330:	6a 00                	push   $0x0
80106332:	6a 61                	push   $0x61
80106334:	e9 be f7 ff ff       	jmp    80105af7 <alltraps>

80106339 <vector98>:
80106339:	6a 00                	push   $0x0
8010633b:	6a 62                	push   $0x62
8010633d:	e9 b5 f7 ff ff       	jmp    80105af7 <alltraps>

80106342 <vector99>:
80106342:	6a 00                	push   $0x0
80106344:	6a 63                	push   $0x63
80106346:	e9 ac f7 ff ff       	jmp    80105af7 <alltraps>

8010634b <vector100>:
8010634b:	6a 00                	push   $0x0
8010634d:	6a 64                	push   $0x64
8010634f:	e9 a3 f7 ff ff       	jmp    80105af7 <alltraps>

80106354 <vector101>:
80106354:	6a 00                	push   $0x0
80106356:	6a 65                	push   $0x65
80106358:	e9 9a f7 ff ff       	jmp    80105af7 <alltraps>

8010635d <vector102>:
8010635d:	6a 00                	push   $0x0
8010635f:	6a 66                	push   $0x66
80106361:	e9 91 f7 ff ff       	jmp    80105af7 <alltraps>

80106366 <vector103>:
80106366:	6a 00                	push   $0x0
80106368:	6a 67                	push   $0x67
8010636a:	e9 88 f7 ff ff       	jmp    80105af7 <alltraps>

8010636f <vector104>:
8010636f:	6a 00                	push   $0x0
80106371:	6a 68                	push   $0x68
80106373:	e9 7f f7 ff ff       	jmp    80105af7 <alltraps>

80106378 <vector105>:
80106378:	6a 00                	push   $0x0
8010637a:	6a 69                	push   $0x69
8010637c:	e9 76 f7 ff ff       	jmp    80105af7 <alltraps>

80106381 <vector106>:
80106381:	6a 00                	push   $0x0
80106383:	6a 6a                	push   $0x6a
80106385:	e9 6d f7 ff ff       	jmp    80105af7 <alltraps>

8010638a <vector107>:
8010638a:	6a 00                	push   $0x0
8010638c:	6a 6b                	push   $0x6b
8010638e:	e9 64 f7 ff ff       	jmp    80105af7 <alltraps>

80106393 <vector108>:
80106393:	6a 00                	push   $0x0
80106395:	6a 6c                	push   $0x6c
80106397:	e9 5b f7 ff ff       	jmp    80105af7 <alltraps>

8010639c <vector109>:
8010639c:	6a 00                	push   $0x0
8010639e:	6a 6d                	push   $0x6d
801063a0:	e9 52 f7 ff ff       	jmp    80105af7 <alltraps>

801063a5 <vector110>:
801063a5:	6a 00                	push   $0x0
801063a7:	6a 6e                	push   $0x6e
801063a9:	e9 49 f7 ff ff       	jmp    80105af7 <alltraps>

801063ae <vector111>:
801063ae:	6a 00                	push   $0x0
801063b0:	6a 6f                	push   $0x6f
801063b2:	e9 40 f7 ff ff       	jmp    80105af7 <alltraps>

801063b7 <vector112>:
801063b7:	6a 00                	push   $0x0
801063b9:	6a 70                	push   $0x70
801063bb:	e9 37 f7 ff ff       	jmp    80105af7 <alltraps>

801063c0 <vector113>:
801063c0:	6a 00                	push   $0x0
801063c2:	6a 71                	push   $0x71
801063c4:	e9 2e f7 ff ff       	jmp    80105af7 <alltraps>

801063c9 <vector114>:
801063c9:	6a 00                	push   $0x0
801063cb:	6a 72                	push   $0x72
801063cd:	e9 25 f7 ff ff       	jmp    80105af7 <alltraps>

801063d2 <vector115>:
801063d2:	6a 00                	push   $0x0
801063d4:	6a 73                	push   $0x73
801063d6:	e9 1c f7 ff ff       	jmp    80105af7 <alltraps>

801063db <vector116>:
801063db:	6a 00                	push   $0x0
801063dd:	6a 74                	push   $0x74
801063df:	e9 13 f7 ff ff       	jmp    80105af7 <alltraps>

801063e4 <vector117>:
801063e4:	6a 00                	push   $0x0
801063e6:	6a 75                	push   $0x75
801063e8:	e9 0a f7 ff ff       	jmp    80105af7 <alltraps>

801063ed <vector118>:
801063ed:	6a 00                	push   $0x0
801063ef:	6a 76                	push   $0x76
801063f1:	e9 01 f7 ff ff       	jmp    80105af7 <alltraps>

801063f6 <vector119>:
801063f6:	6a 00                	push   $0x0
801063f8:	6a 77                	push   $0x77
801063fa:	e9 f8 f6 ff ff       	jmp    80105af7 <alltraps>

801063ff <vector120>:
801063ff:	6a 00                	push   $0x0
80106401:	6a 78                	push   $0x78
80106403:	e9 ef f6 ff ff       	jmp    80105af7 <alltraps>

80106408 <vector121>:
80106408:	6a 00                	push   $0x0
8010640a:	6a 79                	push   $0x79
8010640c:	e9 e6 f6 ff ff       	jmp    80105af7 <alltraps>

80106411 <vector122>:
80106411:	6a 00                	push   $0x0
80106413:	6a 7a                	push   $0x7a
80106415:	e9 dd f6 ff ff       	jmp    80105af7 <alltraps>

8010641a <vector123>:
8010641a:	6a 00                	push   $0x0
8010641c:	6a 7b                	push   $0x7b
8010641e:	e9 d4 f6 ff ff       	jmp    80105af7 <alltraps>

80106423 <vector124>:
80106423:	6a 00                	push   $0x0
80106425:	6a 7c                	push   $0x7c
80106427:	e9 cb f6 ff ff       	jmp    80105af7 <alltraps>

8010642c <vector125>:
8010642c:	6a 00                	push   $0x0
8010642e:	6a 7d                	push   $0x7d
80106430:	e9 c2 f6 ff ff       	jmp    80105af7 <alltraps>

80106435 <vector126>:
80106435:	6a 00                	push   $0x0
80106437:	6a 7e                	push   $0x7e
80106439:	e9 b9 f6 ff ff       	jmp    80105af7 <alltraps>

8010643e <vector127>:
8010643e:	6a 00                	push   $0x0
80106440:	6a 7f                	push   $0x7f
80106442:	e9 b0 f6 ff ff       	jmp    80105af7 <alltraps>

80106447 <vector128>:
80106447:	6a 00                	push   $0x0
80106449:	68 80 00 00 00       	push   $0x80
8010644e:	e9 a4 f6 ff ff       	jmp    80105af7 <alltraps>

80106453 <vector129>:
80106453:	6a 00                	push   $0x0
80106455:	68 81 00 00 00       	push   $0x81
8010645a:	e9 98 f6 ff ff       	jmp    80105af7 <alltraps>

8010645f <vector130>:
8010645f:	6a 00                	push   $0x0
80106461:	68 82 00 00 00       	push   $0x82
80106466:	e9 8c f6 ff ff       	jmp    80105af7 <alltraps>

8010646b <vector131>:
8010646b:	6a 00                	push   $0x0
8010646d:	68 83 00 00 00       	push   $0x83
80106472:	e9 80 f6 ff ff       	jmp    80105af7 <alltraps>

80106477 <vector132>:
80106477:	6a 00                	push   $0x0
80106479:	68 84 00 00 00       	push   $0x84
8010647e:	e9 74 f6 ff ff       	jmp    80105af7 <alltraps>

80106483 <vector133>:
80106483:	6a 00                	push   $0x0
80106485:	68 85 00 00 00       	push   $0x85
8010648a:	e9 68 f6 ff ff       	jmp    80105af7 <alltraps>

8010648f <vector134>:
8010648f:	6a 00                	push   $0x0
80106491:	68 86 00 00 00       	push   $0x86
80106496:	e9 5c f6 ff ff       	jmp    80105af7 <alltraps>

8010649b <vector135>:
8010649b:	6a 00                	push   $0x0
8010649d:	68 87 00 00 00       	push   $0x87
801064a2:	e9 50 f6 ff ff       	jmp    80105af7 <alltraps>

801064a7 <vector136>:
801064a7:	6a 00                	push   $0x0
801064a9:	68 88 00 00 00       	push   $0x88
801064ae:	e9 44 f6 ff ff       	jmp    80105af7 <alltraps>

801064b3 <vector137>:
801064b3:	6a 00                	push   $0x0
801064b5:	68 89 00 00 00       	push   $0x89
801064ba:	e9 38 f6 ff ff       	jmp    80105af7 <alltraps>

801064bf <vector138>:
801064bf:	6a 00                	push   $0x0
801064c1:	68 8a 00 00 00       	push   $0x8a
801064c6:	e9 2c f6 ff ff       	jmp    80105af7 <alltraps>

801064cb <vector139>:
801064cb:	6a 00                	push   $0x0
801064cd:	68 8b 00 00 00       	push   $0x8b
801064d2:	e9 20 f6 ff ff       	jmp    80105af7 <alltraps>

801064d7 <vector140>:
801064d7:	6a 00                	push   $0x0
801064d9:	68 8c 00 00 00       	push   $0x8c
801064de:	e9 14 f6 ff ff       	jmp    80105af7 <alltraps>

801064e3 <vector141>:
801064e3:	6a 00                	push   $0x0
801064e5:	68 8d 00 00 00       	push   $0x8d
801064ea:	e9 08 f6 ff ff       	jmp    80105af7 <alltraps>

801064ef <vector142>:
801064ef:	6a 00                	push   $0x0
801064f1:	68 8e 00 00 00       	push   $0x8e
801064f6:	e9 fc f5 ff ff       	jmp    80105af7 <alltraps>

801064fb <vector143>:
801064fb:	6a 00                	push   $0x0
801064fd:	68 8f 00 00 00       	push   $0x8f
80106502:	e9 f0 f5 ff ff       	jmp    80105af7 <alltraps>

80106507 <vector144>:
80106507:	6a 00                	push   $0x0
80106509:	68 90 00 00 00       	push   $0x90
8010650e:	e9 e4 f5 ff ff       	jmp    80105af7 <alltraps>

80106513 <vector145>:
80106513:	6a 00                	push   $0x0
80106515:	68 91 00 00 00       	push   $0x91
8010651a:	e9 d8 f5 ff ff       	jmp    80105af7 <alltraps>

8010651f <vector146>:
8010651f:	6a 00                	push   $0x0
80106521:	68 92 00 00 00       	push   $0x92
80106526:	e9 cc f5 ff ff       	jmp    80105af7 <alltraps>

8010652b <vector147>:
8010652b:	6a 00                	push   $0x0
8010652d:	68 93 00 00 00       	push   $0x93
80106532:	e9 c0 f5 ff ff       	jmp    80105af7 <alltraps>

80106537 <vector148>:
80106537:	6a 00                	push   $0x0
80106539:	68 94 00 00 00       	push   $0x94
8010653e:	e9 b4 f5 ff ff       	jmp    80105af7 <alltraps>

80106543 <vector149>:
80106543:	6a 00                	push   $0x0
80106545:	68 95 00 00 00       	push   $0x95
8010654a:	e9 a8 f5 ff ff       	jmp    80105af7 <alltraps>

8010654f <vector150>:
8010654f:	6a 00                	push   $0x0
80106551:	68 96 00 00 00       	push   $0x96
80106556:	e9 9c f5 ff ff       	jmp    80105af7 <alltraps>

8010655b <vector151>:
8010655b:	6a 00                	push   $0x0
8010655d:	68 97 00 00 00       	push   $0x97
80106562:	e9 90 f5 ff ff       	jmp    80105af7 <alltraps>

80106567 <vector152>:
80106567:	6a 00                	push   $0x0
80106569:	68 98 00 00 00       	push   $0x98
8010656e:	e9 84 f5 ff ff       	jmp    80105af7 <alltraps>

80106573 <vector153>:
80106573:	6a 00                	push   $0x0
80106575:	68 99 00 00 00       	push   $0x99
8010657a:	e9 78 f5 ff ff       	jmp    80105af7 <alltraps>

8010657f <vector154>:
8010657f:	6a 00                	push   $0x0
80106581:	68 9a 00 00 00       	push   $0x9a
80106586:	e9 6c f5 ff ff       	jmp    80105af7 <alltraps>

8010658b <vector155>:
8010658b:	6a 00                	push   $0x0
8010658d:	68 9b 00 00 00       	push   $0x9b
80106592:	e9 60 f5 ff ff       	jmp    80105af7 <alltraps>

80106597 <vector156>:
80106597:	6a 00                	push   $0x0
80106599:	68 9c 00 00 00       	push   $0x9c
8010659e:	e9 54 f5 ff ff       	jmp    80105af7 <alltraps>

801065a3 <vector157>:
801065a3:	6a 00                	push   $0x0
801065a5:	68 9d 00 00 00       	push   $0x9d
801065aa:	e9 48 f5 ff ff       	jmp    80105af7 <alltraps>

801065af <vector158>:
801065af:	6a 00                	push   $0x0
801065b1:	68 9e 00 00 00       	push   $0x9e
801065b6:	e9 3c f5 ff ff       	jmp    80105af7 <alltraps>

801065bb <vector159>:
801065bb:	6a 00                	push   $0x0
801065bd:	68 9f 00 00 00       	push   $0x9f
801065c2:	e9 30 f5 ff ff       	jmp    80105af7 <alltraps>

801065c7 <vector160>:
801065c7:	6a 00                	push   $0x0
801065c9:	68 a0 00 00 00       	push   $0xa0
801065ce:	e9 24 f5 ff ff       	jmp    80105af7 <alltraps>

801065d3 <vector161>:
801065d3:	6a 00                	push   $0x0
801065d5:	68 a1 00 00 00       	push   $0xa1
801065da:	e9 18 f5 ff ff       	jmp    80105af7 <alltraps>

801065df <vector162>:
801065df:	6a 00                	push   $0x0
801065e1:	68 a2 00 00 00       	push   $0xa2
801065e6:	e9 0c f5 ff ff       	jmp    80105af7 <alltraps>

801065eb <vector163>:
801065eb:	6a 00                	push   $0x0
801065ed:	68 a3 00 00 00       	push   $0xa3
801065f2:	e9 00 f5 ff ff       	jmp    80105af7 <alltraps>

801065f7 <vector164>:
801065f7:	6a 00                	push   $0x0
801065f9:	68 a4 00 00 00       	push   $0xa4
801065fe:	e9 f4 f4 ff ff       	jmp    80105af7 <alltraps>

80106603 <vector165>:
80106603:	6a 00                	push   $0x0
80106605:	68 a5 00 00 00       	push   $0xa5
8010660a:	e9 e8 f4 ff ff       	jmp    80105af7 <alltraps>

8010660f <vector166>:
8010660f:	6a 00                	push   $0x0
80106611:	68 a6 00 00 00       	push   $0xa6
80106616:	e9 dc f4 ff ff       	jmp    80105af7 <alltraps>

8010661b <vector167>:
8010661b:	6a 00                	push   $0x0
8010661d:	68 a7 00 00 00       	push   $0xa7
80106622:	e9 d0 f4 ff ff       	jmp    80105af7 <alltraps>

80106627 <vector168>:
80106627:	6a 00                	push   $0x0
80106629:	68 a8 00 00 00       	push   $0xa8
8010662e:	e9 c4 f4 ff ff       	jmp    80105af7 <alltraps>

80106633 <vector169>:
80106633:	6a 00                	push   $0x0
80106635:	68 a9 00 00 00       	push   $0xa9
8010663a:	e9 b8 f4 ff ff       	jmp    80105af7 <alltraps>

8010663f <vector170>:
8010663f:	6a 00                	push   $0x0
80106641:	68 aa 00 00 00       	push   $0xaa
80106646:	e9 ac f4 ff ff       	jmp    80105af7 <alltraps>

8010664b <vector171>:
8010664b:	6a 00                	push   $0x0
8010664d:	68 ab 00 00 00       	push   $0xab
80106652:	e9 a0 f4 ff ff       	jmp    80105af7 <alltraps>

80106657 <vector172>:
80106657:	6a 00                	push   $0x0
80106659:	68 ac 00 00 00       	push   $0xac
8010665e:	e9 94 f4 ff ff       	jmp    80105af7 <alltraps>

80106663 <vector173>:
80106663:	6a 00                	push   $0x0
80106665:	68 ad 00 00 00       	push   $0xad
8010666a:	e9 88 f4 ff ff       	jmp    80105af7 <alltraps>

8010666f <vector174>:
8010666f:	6a 00                	push   $0x0
80106671:	68 ae 00 00 00       	push   $0xae
80106676:	e9 7c f4 ff ff       	jmp    80105af7 <alltraps>

8010667b <vector175>:
8010667b:	6a 00                	push   $0x0
8010667d:	68 af 00 00 00       	push   $0xaf
80106682:	e9 70 f4 ff ff       	jmp    80105af7 <alltraps>

80106687 <vector176>:
80106687:	6a 00                	push   $0x0
80106689:	68 b0 00 00 00       	push   $0xb0
8010668e:	e9 64 f4 ff ff       	jmp    80105af7 <alltraps>

80106693 <vector177>:
80106693:	6a 00                	push   $0x0
80106695:	68 b1 00 00 00       	push   $0xb1
8010669a:	e9 58 f4 ff ff       	jmp    80105af7 <alltraps>

8010669f <vector178>:
8010669f:	6a 00                	push   $0x0
801066a1:	68 b2 00 00 00       	push   $0xb2
801066a6:	e9 4c f4 ff ff       	jmp    80105af7 <alltraps>

801066ab <vector179>:
801066ab:	6a 00                	push   $0x0
801066ad:	68 b3 00 00 00       	push   $0xb3
801066b2:	e9 40 f4 ff ff       	jmp    80105af7 <alltraps>

801066b7 <vector180>:
801066b7:	6a 00                	push   $0x0
801066b9:	68 b4 00 00 00       	push   $0xb4
801066be:	e9 34 f4 ff ff       	jmp    80105af7 <alltraps>

801066c3 <vector181>:
801066c3:	6a 00                	push   $0x0
801066c5:	68 b5 00 00 00       	push   $0xb5
801066ca:	e9 28 f4 ff ff       	jmp    80105af7 <alltraps>

801066cf <vector182>:
801066cf:	6a 00                	push   $0x0
801066d1:	68 b6 00 00 00       	push   $0xb6
801066d6:	e9 1c f4 ff ff       	jmp    80105af7 <alltraps>

801066db <vector183>:
801066db:	6a 00                	push   $0x0
801066dd:	68 b7 00 00 00       	push   $0xb7
801066e2:	e9 10 f4 ff ff       	jmp    80105af7 <alltraps>

801066e7 <vector184>:
801066e7:	6a 00                	push   $0x0
801066e9:	68 b8 00 00 00       	push   $0xb8
801066ee:	e9 04 f4 ff ff       	jmp    80105af7 <alltraps>

801066f3 <vector185>:
801066f3:	6a 00                	push   $0x0
801066f5:	68 b9 00 00 00       	push   $0xb9
801066fa:	e9 f8 f3 ff ff       	jmp    80105af7 <alltraps>

801066ff <vector186>:
801066ff:	6a 00                	push   $0x0
80106701:	68 ba 00 00 00       	push   $0xba
80106706:	e9 ec f3 ff ff       	jmp    80105af7 <alltraps>

8010670b <vector187>:
8010670b:	6a 00                	push   $0x0
8010670d:	68 bb 00 00 00       	push   $0xbb
80106712:	e9 e0 f3 ff ff       	jmp    80105af7 <alltraps>

80106717 <vector188>:
80106717:	6a 00                	push   $0x0
80106719:	68 bc 00 00 00       	push   $0xbc
8010671e:	e9 d4 f3 ff ff       	jmp    80105af7 <alltraps>

80106723 <vector189>:
80106723:	6a 00                	push   $0x0
80106725:	68 bd 00 00 00       	push   $0xbd
8010672a:	e9 c8 f3 ff ff       	jmp    80105af7 <alltraps>

8010672f <vector190>:
8010672f:	6a 00                	push   $0x0
80106731:	68 be 00 00 00       	push   $0xbe
80106736:	e9 bc f3 ff ff       	jmp    80105af7 <alltraps>

8010673b <vector191>:
8010673b:	6a 00                	push   $0x0
8010673d:	68 bf 00 00 00       	push   $0xbf
80106742:	e9 b0 f3 ff ff       	jmp    80105af7 <alltraps>

80106747 <vector192>:
80106747:	6a 00                	push   $0x0
80106749:	68 c0 00 00 00       	push   $0xc0
8010674e:	e9 a4 f3 ff ff       	jmp    80105af7 <alltraps>

80106753 <vector193>:
80106753:	6a 00                	push   $0x0
80106755:	68 c1 00 00 00       	push   $0xc1
8010675a:	e9 98 f3 ff ff       	jmp    80105af7 <alltraps>

8010675f <vector194>:
8010675f:	6a 00                	push   $0x0
80106761:	68 c2 00 00 00       	push   $0xc2
80106766:	e9 8c f3 ff ff       	jmp    80105af7 <alltraps>

8010676b <vector195>:
8010676b:	6a 00                	push   $0x0
8010676d:	68 c3 00 00 00       	push   $0xc3
80106772:	e9 80 f3 ff ff       	jmp    80105af7 <alltraps>

80106777 <vector196>:
80106777:	6a 00                	push   $0x0
80106779:	68 c4 00 00 00       	push   $0xc4
8010677e:	e9 74 f3 ff ff       	jmp    80105af7 <alltraps>

80106783 <vector197>:
80106783:	6a 00                	push   $0x0
80106785:	68 c5 00 00 00       	push   $0xc5
8010678a:	e9 68 f3 ff ff       	jmp    80105af7 <alltraps>

8010678f <vector198>:
8010678f:	6a 00                	push   $0x0
80106791:	68 c6 00 00 00       	push   $0xc6
80106796:	e9 5c f3 ff ff       	jmp    80105af7 <alltraps>

8010679b <vector199>:
8010679b:	6a 00                	push   $0x0
8010679d:	68 c7 00 00 00       	push   $0xc7
801067a2:	e9 50 f3 ff ff       	jmp    80105af7 <alltraps>

801067a7 <vector200>:
801067a7:	6a 00                	push   $0x0
801067a9:	68 c8 00 00 00       	push   $0xc8
801067ae:	e9 44 f3 ff ff       	jmp    80105af7 <alltraps>

801067b3 <vector201>:
801067b3:	6a 00                	push   $0x0
801067b5:	68 c9 00 00 00       	push   $0xc9
801067ba:	e9 38 f3 ff ff       	jmp    80105af7 <alltraps>

801067bf <vector202>:
801067bf:	6a 00                	push   $0x0
801067c1:	68 ca 00 00 00       	push   $0xca
801067c6:	e9 2c f3 ff ff       	jmp    80105af7 <alltraps>

801067cb <vector203>:
801067cb:	6a 00                	push   $0x0
801067cd:	68 cb 00 00 00       	push   $0xcb
801067d2:	e9 20 f3 ff ff       	jmp    80105af7 <alltraps>

801067d7 <vector204>:
801067d7:	6a 00                	push   $0x0
801067d9:	68 cc 00 00 00       	push   $0xcc
801067de:	e9 14 f3 ff ff       	jmp    80105af7 <alltraps>

801067e3 <vector205>:
801067e3:	6a 00                	push   $0x0
801067e5:	68 cd 00 00 00       	push   $0xcd
801067ea:	e9 08 f3 ff ff       	jmp    80105af7 <alltraps>

801067ef <vector206>:
801067ef:	6a 00                	push   $0x0
801067f1:	68 ce 00 00 00       	push   $0xce
801067f6:	e9 fc f2 ff ff       	jmp    80105af7 <alltraps>

801067fb <vector207>:
801067fb:	6a 00                	push   $0x0
801067fd:	68 cf 00 00 00       	push   $0xcf
80106802:	e9 f0 f2 ff ff       	jmp    80105af7 <alltraps>

80106807 <vector208>:
80106807:	6a 00                	push   $0x0
80106809:	68 d0 00 00 00       	push   $0xd0
8010680e:	e9 e4 f2 ff ff       	jmp    80105af7 <alltraps>

80106813 <vector209>:
80106813:	6a 00                	push   $0x0
80106815:	68 d1 00 00 00       	push   $0xd1
8010681a:	e9 d8 f2 ff ff       	jmp    80105af7 <alltraps>

8010681f <vector210>:
8010681f:	6a 00                	push   $0x0
80106821:	68 d2 00 00 00       	push   $0xd2
80106826:	e9 cc f2 ff ff       	jmp    80105af7 <alltraps>

8010682b <vector211>:
8010682b:	6a 00                	push   $0x0
8010682d:	68 d3 00 00 00       	push   $0xd3
80106832:	e9 c0 f2 ff ff       	jmp    80105af7 <alltraps>

80106837 <vector212>:
80106837:	6a 00                	push   $0x0
80106839:	68 d4 00 00 00       	push   $0xd4
8010683e:	e9 b4 f2 ff ff       	jmp    80105af7 <alltraps>

80106843 <vector213>:
80106843:	6a 00                	push   $0x0
80106845:	68 d5 00 00 00       	push   $0xd5
8010684a:	e9 a8 f2 ff ff       	jmp    80105af7 <alltraps>

8010684f <vector214>:
8010684f:	6a 00                	push   $0x0
80106851:	68 d6 00 00 00       	push   $0xd6
80106856:	e9 9c f2 ff ff       	jmp    80105af7 <alltraps>

8010685b <vector215>:
8010685b:	6a 00                	push   $0x0
8010685d:	68 d7 00 00 00       	push   $0xd7
80106862:	e9 90 f2 ff ff       	jmp    80105af7 <alltraps>

80106867 <vector216>:
80106867:	6a 00                	push   $0x0
80106869:	68 d8 00 00 00       	push   $0xd8
8010686e:	e9 84 f2 ff ff       	jmp    80105af7 <alltraps>

80106873 <vector217>:
80106873:	6a 00                	push   $0x0
80106875:	68 d9 00 00 00       	push   $0xd9
8010687a:	e9 78 f2 ff ff       	jmp    80105af7 <alltraps>

8010687f <vector218>:
8010687f:	6a 00                	push   $0x0
80106881:	68 da 00 00 00       	push   $0xda
80106886:	e9 6c f2 ff ff       	jmp    80105af7 <alltraps>

8010688b <vector219>:
8010688b:	6a 00                	push   $0x0
8010688d:	68 db 00 00 00       	push   $0xdb
80106892:	e9 60 f2 ff ff       	jmp    80105af7 <alltraps>

80106897 <vector220>:
80106897:	6a 00                	push   $0x0
80106899:	68 dc 00 00 00       	push   $0xdc
8010689e:	e9 54 f2 ff ff       	jmp    80105af7 <alltraps>

801068a3 <vector221>:
801068a3:	6a 00                	push   $0x0
801068a5:	68 dd 00 00 00       	push   $0xdd
801068aa:	e9 48 f2 ff ff       	jmp    80105af7 <alltraps>

801068af <vector222>:
801068af:	6a 00                	push   $0x0
801068b1:	68 de 00 00 00       	push   $0xde
801068b6:	e9 3c f2 ff ff       	jmp    80105af7 <alltraps>

801068bb <vector223>:
801068bb:	6a 00                	push   $0x0
801068bd:	68 df 00 00 00       	push   $0xdf
801068c2:	e9 30 f2 ff ff       	jmp    80105af7 <alltraps>

801068c7 <vector224>:
801068c7:	6a 00                	push   $0x0
801068c9:	68 e0 00 00 00       	push   $0xe0
801068ce:	e9 24 f2 ff ff       	jmp    80105af7 <alltraps>

801068d3 <vector225>:
801068d3:	6a 00                	push   $0x0
801068d5:	68 e1 00 00 00       	push   $0xe1
801068da:	e9 18 f2 ff ff       	jmp    80105af7 <alltraps>

801068df <vector226>:
801068df:	6a 00                	push   $0x0
801068e1:	68 e2 00 00 00       	push   $0xe2
801068e6:	e9 0c f2 ff ff       	jmp    80105af7 <alltraps>

801068eb <vector227>:
801068eb:	6a 00                	push   $0x0
801068ed:	68 e3 00 00 00       	push   $0xe3
801068f2:	e9 00 f2 ff ff       	jmp    80105af7 <alltraps>

801068f7 <vector228>:
801068f7:	6a 00                	push   $0x0
801068f9:	68 e4 00 00 00       	push   $0xe4
801068fe:	e9 f4 f1 ff ff       	jmp    80105af7 <alltraps>

80106903 <vector229>:
80106903:	6a 00                	push   $0x0
80106905:	68 e5 00 00 00       	push   $0xe5
8010690a:	e9 e8 f1 ff ff       	jmp    80105af7 <alltraps>

8010690f <vector230>:
8010690f:	6a 00                	push   $0x0
80106911:	68 e6 00 00 00       	push   $0xe6
80106916:	e9 dc f1 ff ff       	jmp    80105af7 <alltraps>

8010691b <vector231>:
8010691b:	6a 00                	push   $0x0
8010691d:	68 e7 00 00 00       	push   $0xe7
80106922:	e9 d0 f1 ff ff       	jmp    80105af7 <alltraps>

80106927 <vector232>:
80106927:	6a 00                	push   $0x0
80106929:	68 e8 00 00 00       	push   $0xe8
8010692e:	e9 c4 f1 ff ff       	jmp    80105af7 <alltraps>

80106933 <vector233>:
80106933:	6a 00                	push   $0x0
80106935:	68 e9 00 00 00       	push   $0xe9
8010693a:	e9 b8 f1 ff ff       	jmp    80105af7 <alltraps>

8010693f <vector234>:
8010693f:	6a 00                	push   $0x0
80106941:	68 ea 00 00 00       	push   $0xea
80106946:	e9 ac f1 ff ff       	jmp    80105af7 <alltraps>

8010694b <vector235>:
8010694b:	6a 00                	push   $0x0
8010694d:	68 eb 00 00 00       	push   $0xeb
80106952:	e9 a0 f1 ff ff       	jmp    80105af7 <alltraps>

80106957 <vector236>:
80106957:	6a 00                	push   $0x0
80106959:	68 ec 00 00 00       	push   $0xec
8010695e:	e9 94 f1 ff ff       	jmp    80105af7 <alltraps>

80106963 <vector237>:
80106963:	6a 00                	push   $0x0
80106965:	68 ed 00 00 00       	push   $0xed
8010696a:	e9 88 f1 ff ff       	jmp    80105af7 <alltraps>

8010696f <vector238>:
8010696f:	6a 00                	push   $0x0
80106971:	68 ee 00 00 00       	push   $0xee
80106976:	e9 7c f1 ff ff       	jmp    80105af7 <alltraps>

8010697b <vector239>:
8010697b:	6a 00                	push   $0x0
8010697d:	68 ef 00 00 00       	push   $0xef
80106982:	e9 70 f1 ff ff       	jmp    80105af7 <alltraps>

80106987 <vector240>:
80106987:	6a 00                	push   $0x0
80106989:	68 f0 00 00 00       	push   $0xf0
8010698e:	e9 64 f1 ff ff       	jmp    80105af7 <alltraps>

80106993 <vector241>:
80106993:	6a 00                	push   $0x0
80106995:	68 f1 00 00 00       	push   $0xf1
8010699a:	e9 58 f1 ff ff       	jmp    80105af7 <alltraps>

8010699f <vector242>:
8010699f:	6a 00                	push   $0x0
801069a1:	68 f2 00 00 00       	push   $0xf2
801069a6:	e9 4c f1 ff ff       	jmp    80105af7 <alltraps>

801069ab <vector243>:
801069ab:	6a 00                	push   $0x0
801069ad:	68 f3 00 00 00       	push   $0xf3
801069b2:	e9 40 f1 ff ff       	jmp    80105af7 <alltraps>

801069b7 <vector244>:
801069b7:	6a 00                	push   $0x0
801069b9:	68 f4 00 00 00       	push   $0xf4
801069be:	e9 34 f1 ff ff       	jmp    80105af7 <alltraps>

801069c3 <vector245>:
801069c3:	6a 00                	push   $0x0
801069c5:	68 f5 00 00 00       	push   $0xf5
801069ca:	e9 28 f1 ff ff       	jmp    80105af7 <alltraps>

801069cf <vector246>:
801069cf:	6a 00                	push   $0x0
801069d1:	68 f6 00 00 00       	push   $0xf6
801069d6:	e9 1c f1 ff ff       	jmp    80105af7 <alltraps>

801069db <vector247>:
801069db:	6a 00                	push   $0x0
801069dd:	68 f7 00 00 00       	push   $0xf7
801069e2:	e9 10 f1 ff ff       	jmp    80105af7 <alltraps>

801069e7 <vector248>:
801069e7:	6a 00                	push   $0x0
801069e9:	68 f8 00 00 00       	push   $0xf8
801069ee:	e9 04 f1 ff ff       	jmp    80105af7 <alltraps>

801069f3 <vector249>:
801069f3:	6a 00                	push   $0x0
801069f5:	68 f9 00 00 00       	push   $0xf9
801069fa:	e9 f8 f0 ff ff       	jmp    80105af7 <alltraps>

801069ff <vector250>:
801069ff:	6a 00                	push   $0x0
80106a01:	68 fa 00 00 00       	push   $0xfa
80106a06:	e9 ec f0 ff ff       	jmp    80105af7 <alltraps>

80106a0b <vector251>:
80106a0b:	6a 00                	push   $0x0
80106a0d:	68 fb 00 00 00       	push   $0xfb
80106a12:	e9 e0 f0 ff ff       	jmp    80105af7 <alltraps>

80106a17 <vector252>:
80106a17:	6a 00                	push   $0x0
80106a19:	68 fc 00 00 00       	push   $0xfc
80106a1e:	e9 d4 f0 ff ff       	jmp    80105af7 <alltraps>

80106a23 <vector253>:
80106a23:	6a 00                	push   $0x0
80106a25:	68 fd 00 00 00       	push   $0xfd
80106a2a:	e9 c8 f0 ff ff       	jmp    80105af7 <alltraps>

80106a2f <vector254>:
80106a2f:	6a 00                	push   $0x0
80106a31:	68 fe 00 00 00       	push   $0xfe
80106a36:	e9 bc f0 ff ff       	jmp    80105af7 <alltraps>

80106a3b <vector255>:
80106a3b:	6a 00                	push   $0x0
80106a3d:	68 ff 00 00 00       	push   $0xff
80106a42:	e9 b0 f0 ff ff       	jmp    80105af7 <alltraps>
80106a47:	66 90                	xchg   %ax,%ax
80106a49:	66 90                	xchg   %ax,%ax
80106a4b:	66 90                	xchg   %ax,%ax
80106a4d:	66 90                	xchg   %ax,%ax
80106a4f:	90                   	nop

80106a50 <walkpgdir>:
80106a50:	55                   	push   %ebp
80106a51:	89 e5                	mov    %esp,%ebp
80106a53:	57                   	push   %edi
80106a54:	56                   	push   %esi
80106a55:	53                   	push   %ebx
80106a56:	89 d3                	mov    %edx,%ebx
80106a58:	89 d7                	mov    %edx,%edi
80106a5a:	c1 eb 16             	shr    $0x16,%ebx
80106a5d:	8d 34 98             	lea    (%eax,%ebx,4),%esi
80106a60:	83 ec 0c             	sub    $0xc,%esp
80106a63:	8b 06                	mov    (%esi),%eax
80106a65:	a8 01                	test   $0x1,%al
80106a67:	74 27                	je     80106a90 <walkpgdir+0x40>
80106a69:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106a6e:	8d 98 00 00 00 80    	lea    -0x80000000(%eax),%ebx
80106a74:	c1 ef 0a             	shr    $0xa,%edi
80106a77:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106a7a:	89 fa                	mov    %edi,%edx
80106a7c:	81 e2 fc 0f 00 00    	and    $0xffc,%edx
80106a82:	8d 04 13             	lea    (%ebx,%edx,1),%eax
80106a85:	5b                   	pop    %ebx
80106a86:	5e                   	pop    %esi
80106a87:	5f                   	pop    %edi
80106a88:	5d                   	pop    %ebp
80106a89:	c3                   	ret    
80106a8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106a90:	85 c9                	test   %ecx,%ecx
80106a92:	74 2c                	je     80106ac0 <walkpgdir+0x70>
80106a94:	e8 47 bb ff ff       	call   801025e0 <kalloc>
80106a99:	85 c0                	test   %eax,%eax
80106a9b:	89 c3                	mov    %eax,%ebx
80106a9d:	74 21                	je     80106ac0 <walkpgdir+0x70>
80106a9f:	83 ec 04             	sub    $0x4,%esp
80106aa2:	68 00 10 00 00       	push   $0x1000
80106aa7:	6a 00                	push   $0x0
80106aa9:	50                   	push   %eax
80106aaa:	e8 e1 dc ff ff       	call   80104790 <memset>
80106aaf:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106ab5:	83 c4 10             	add    $0x10,%esp
80106ab8:	83 c8 07             	or     $0x7,%eax
80106abb:	89 06                	mov    %eax,(%esi)
80106abd:	eb b5                	jmp    80106a74 <walkpgdir+0x24>
80106abf:	90                   	nop
80106ac0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ac3:	31 c0                	xor    %eax,%eax
80106ac5:	5b                   	pop    %ebx
80106ac6:	5e                   	pop    %esi
80106ac7:	5f                   	pop    %edi
80106ac8:	5d                   	pop    %ebp
80106ac9:	c3                   	ret    
80106aca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106ad0 <mappages>:
80106ad0:	55                   	push   %ebp
80106ad1:	89 e5                	mov    %esp,%ebp
80106ad3:	57                   	push   %edi
80106ad4:	56                   	push   %esi
80106ad5:	53                   	push   %ebx
80106ad6:	89 d3                	mov    %edx,%ebx
80106ad8:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106ade:	83 ec 1c             	sub    $0x1c,%esp
80106ae1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106ae4:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106ae8:	8b 7d 08             	mov    0x8(%ebp),%edi
80106aeb:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106af0:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106af3:	8b 45 0c             	mov    0xc(%ebp),%eax
80106af6:	29 df                	sub    %ebx,%edi
80106af8:	83 c8 01             	or     $0x1,%eax
80106afb:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106afe:	eb 15                	jmp    80106b15 <mappages+0x45>
80106b00:	f6 00 01             	testb  $0x1,(%eax)
80106b03:	75 45                	jne    80106b4a <mappages+0x7a>
80106b05:	0b 75 dc             	or     -0x24(%ebp),%esi
80106b08:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
80106b0b:	89 30                	mov    %esi,(%eax)
80106b0d:	74 31                	je     80106b40 <mappages+0x70>
80106b0f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106b15:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106b18:	b9 01 00 00 00       	mov    $0x1,%ecx
80106b1d:	89 da                	mov    %ebx,%edx
80106b1f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106b22:	e8 29 ff ff ff       	call   80106a50 <walkpgdir>
80106b27:	85 c0                	test   %eax,%eax
80106b29:	75 d5                	jne    80106b00 <mappages+0x30>
80106b2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b2e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106b33:	5b                   	pop    %ebx
80106b34:	5e                   	pop    %esi
80106b35:	5f                   	pop    %edi
80106b36:	5d                   	pop    %ebp
80106b37:	c3                   	ret    
80106b38:	90                   	nop
80106b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106b40:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106b43:	31 c0                	xor    %eax,%eax
80106b45:	5b                   	pop    %ebx
80106b46:	5e                   	pop    %esi
80106b47:	5f                   	pop    %edi
80106b48:	5d                   	pop    %ebp
80106b49:	c3                   	ret    
80106b4a:	83 ec 0c             	sub    $0xc,%esp
80106b4d:	68 fc 7c 10 80       	push   $0x80107cfc
80106b52:	e8 39 98 ff ff       	call   80100390 <panic>
80106b57:	89 f6                	mov    %esi,%esi
80106b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106b60 <deallocuvm.part.0>:
80106b60:	55                   	push   %ebp
80106b61:	89 e5                	mov    %esp,%ebp
80106b63:	57                   	push   %edi
80106b64:	56                   	push   %esi
80106b65:	53                   	push   %ebx
80106b66:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
80106b6c:	89 c7                	mov    %eax,%edi
80106b6e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106b74:	83 ec 1c             	sub    $0x1c,%esp
80106b77:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80106b7a:	39 d3                	cmp    %edx,%ebx
80106b7c:	73 66                	jae    80106be4 <deallocuvm.part.0+0x84>
80106b7e:	89 d6                	mov    %edx,%esi
80106b80:	eb 3d                	jmp    80106bbf <deallocuvm.part.0+0x5f>
80106b82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106b88:	8b 10                	mov    (%eax),%edx
80106b8a:	f6 c2 01             	test   $0x1,%dl
80106b8d:	74 26                	je     80106bb5 <deallocuvm.part.0+0x55>
80106b8f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106b95:	74 58                	je     80106bef <deallocuvm.part.0+0x8f>
80106b97:	83 ec 0c             	sub    $0xc,%esp
80106b9a:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106ba0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106ba3:	52                   	push   %edx
80106ba4:	e8 87 b8 ff ff       	call   80102430 <kfree>
80106ba9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106bac:	83 c4 10             	add    $0x10,%esp
80106baf:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80106bb5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106bbb:	39 f3                	cmp    %esi,%ebx
80106bbd:	73 25                	jae    80106be4 <deallocuvm.part.0+0x84>
80106bbf:	31 c9                	xor    %ecx,%ecx
80106bc1:	89 da                	mov    %ebx,%edx
80106bc3:	89 f8                	mov    %edi,%eax
80106bc5:	e8 86 fe ff ff       	call   80106a50 <walkpgdir>
80106bca:	85 c0                	test   %eax,%eax
80106bcc:	75 ba                	jne    80106b88 <deallocuvm.part.0+0x28>
80106bce:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80106bd4:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
80106bda:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106be0:	39 f3                	cmp    %esi,%ebx
80106be2:	72 db                	jb     80106bbf <deallocuvm.part.0+0x5f>
80106be4:	8b 45 e0             	mov    -0x20(%ebp),%eax
80106be7:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106bea:	5b                   	pop    %ebx
80106beb:	5e                   	pop    %esi
80106bec:	5f                   	pop    %edi
80106bed:	5d                   	pop    %ebp
80106bee:	c3                   	ret    
80106bef:	83 ec 0c             	sub    $0xc,%esp
80106bf2:	68 02 76 10 80       	push   $0x80107602
80106bf7:	e8 94 97 ff ff       	call   80100390 <panic>
80106bfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80106c00 <seginit>:
80106c00:	55                   	push   %ebp
80106c01:	89 e5                	mov    %esp,%ebp
80106c03:	83 ec 18             	sub    $0x18,%esp
80106c06:	e8 e5 cc ff ff       	call   801038f0 <cpuid>
80106c0b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80106c11:	ba 2f 00 00 00       	mov    $0x2f,%edx
80106c16:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
80106c1a:	c7 80 f8 27 11 80 ff 	movl   $0xffff,-0x7feed808(%eax)
80106c21:	ff 00 00 
80106c24:	c7 80 fc 27 11 80 00 	movl   $0xcf9a00,-0x7feed804(%eax)
80106c2b:	9a cf 00 
80106c2e:	c7 80 00 28 11 80 ff 	movl   $0xffff,-0x7feed800(%eax)
80106c35:	ff 00 00 
80106c38:	c7 80 04 28 11 80 00 	movl   $0xcf9200,-0x7feed7fc(%eax)
80106c3f:	92 cf 00 
80106c42:	c7 80 08 28 11 80 ff 	movl   $0xffff,-0x7feed7f8(%eax)
80106c49:	ff 00 00 
80106c4c:	c7 80 0c 28 11 80 00 	movl   $0xcffa00,-0x7feed7f4(%eax)
80106c53:	fa cf 00 
80106c56:	c7 80 10 28 11 80 ff 	movl   $0xffff,-0x7feed7f0(%eax)
80106c5d:	ff 00 00 
80106c60:	c7 80 14 28 11 80 00 	movl   $0xcff200,-0x7feed7ec(%eax)
80106c67:	f2 cf 00 
80106c6a:	05 f0 27 11 80       	add    $0x801127f0,%eax
80106c6f:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80106c73:	c1 e8 10             	shr    $0x10,%eax
80106c76:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
80106c7a:	8d 45 f2             	lea    -0xe(%ebp),%eax
80106c7d:	0f 01 10             	lgdtl  (%eax)
80106c80:	c9                   	leave  
80106c81:	c3                   	ret    
80106c82:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106c90 <switchkvm>:
80106c90:	a1 a4 55 11 80       	mov    0x801155a4,%eax
80106c95:	55                   	push   %ebp
80106c96:	89 e5                	mov    %esp,%ebp
80106c98:	05 00 00 00 80       	add    $0x80000000,%eax
80106c9d:	0f 22 d8             	mov    %eax,%cr3
80106ca0:	5d                   	pop    %ebp
80106ca1:	c3                   	ret    
80106ca2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106cb0 <switchuvm>:
80106cb0:	55                   	push   %ebp
80106cb1:	89 e5                	mov    %esp,%ebp
80106cb3:	57                   	push   %edi
80106cb4:	56                   	push   %esi
80106cb5:	53                   	push   %ebx
80106cb6:	83 ec 1c             	sub    $0x1c,%esp
80106cb9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80106cbc:	85 db                	test   %ebx,%ebx
80106cbe:	0f 84 cb 00 00 00    	je     80106d8f <switchuvm+0xdf>
80106cc4:	8b 43 08             	mov    0x8(%ebx),%eax
80106cc7:	85 c0                	test   %eax,%eax
80106cc9:	0f 84 da 00 00 00    	je     80106da9 <switchuvm+0xf9>
80106ccf:	8b 43 04             	mov    0x4(%ebx),%eax
80106cd2:	85 c0                	test   %eax,%eax
80106cd4:	0f 84 c2 00 00 00    	je     80106d9c <switchuvm+0xec>
80106cda:	e8 d1 d8 ff ff       	call   801045b0 <pushcli>
80106cdf:	e8 8c cb ff ff       	call   80103870 <mycpu>
80106ce4:	89 c6                	mov    %eax,%esi
80106ce6:	e8 85 cb ff ff       	call   80103870 <mycpu>
80106ceb:	89 c7                	mov    %eax,%edi
80106ced:	e8 7e cb ff ff       	call   80103870 <mycpu>
80106cf2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106cf5:	83 c7 08             	add    $0x8,%edi
80106cf8:	e8 73 cb ff ff       	call   80103870 <mycpu>
80106cfd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80106d00:	83 c0 08             	add    $0x8,%eax
80106d03:	ba 67 00 00 00       	mov    $0x67,%edx
80106d08:	c1 e8 18             	shr    $0x18,%eax
80106d0b:	66 89 96 98 00 00 00 	mov    %dx,0x98(%esi)
80106d12:	66 89 be 9a 00 00 00 	mov    %di,0x9a(%esi)
80106d19:	88 86 9f 00 00 00    	mov    %al,0x9f(%esi)
80106d1f:	bf ff ff ff ff       	mov    $0xffffffff,%edi
80106d24:	83 c1 08             	add    $0x8,%ecx
80106d27:	c1 e9 10             	shr    $0x10,%ecx
80106d2a:	88 8e 9c 00 00 00    	mov    %cl,0x9c(%esi)
80106d30:	b9 99 40 00 00       	mov    $0x4099,%ecx
80106d35:	66 89 8e 9d 00 00 00 	mov    %cx,0x9d(%esi)
80106d3c:	be 10 00 00 00       	mov    $0x10,%esi
80106d41:	e8 2a cb ff ff       	call   80103870 <mycpu>
80106d46:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
80106d4d:	e8 1e cb ff ff       	call   80103870 <mycpu>
80106d52:	66 89 70 10          	mov    %si,0x10(%eax)
80106d56:	8b 73 08             	mov    0x8(%ebx),%esi
80106d59:	e8 12 cb ff ff       	call   80103870 <mycpu>
80106d5e:	81 c6 00 10 00 00    	add    $0x1000,%esi
80106d64:	89 70 0c             	mov    %esi,0xc(%eax)
80106d67:	e8 04 cb ff ff       	call   80103870 <mycpu>
80106d6c:	66 89 78 6e          	mov    %di,0x6e(%eax)
80106d70:	b8 28 00 00 00       	mov    $0x28,%eax
80106d75:	0f 00 d8             	ltr    %ax
80106d78:	8b 43 04             	mov    0x4(%ebx),%eax
80106d7b:	05 00 00 00 80       	add    $0x80000000,%eax
80106d80:	0f 22 d8             	mov    %eax,%cr3
80106d83:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106d86:	5b                   	pop    %ebx
80106d87:	5e                   	pop    %esi
80106d88:	5f                   	pop    %edi
80106d89:	5d                   	pop    %ebp
80106d8a:	e9 61 d8 ff ff       	jmp    801045f0 <popcli>
80106d8f:	83 ec 0c             	sub    $0xc,%esp
80106d92:	68 02 7d 10 80       	push   $0x80107d02
80106d97:	e8 f4 95 ff ff       	call   80100390 <panic>
80106d9c:	83 ec 0c             	sub    $0xc,%esp
80106d9f:	68 2d 7d 10 80       	push   $0x80107d2d
80106da4:	e8 e7 95 ff ff       	call   80100390 <panic>
80106da9:	83 ec 0c             	sub    $0xc,%esp
80106dac:	68 18 7d 10 80       	push   $0x80107d18
80106db1:	e8 da 95 ff ff       	call   80100390 <panic>
80106db6:	8d 76 00             	lea    0x0(%esi),%esi
80106db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106dc0 <inituvm>:
80106dc0:	55                   	push   %ebp
80106dc1:	89 e5                	mov    %esp,%ebp
80106dc3:	57                   	push   %edi
80106dc4:	56                   	push   %esi
80106dc5:	53                   	push   %ebx
80106dc6:	83 ec 1c             	sub    $0x1c,%esp
80106dc9:	8b 75 10             	mov    0x10(%ebp),%esi
80106dcc:	8b 45 08             	mov    0x8(%ebp),%eax
80106dcf:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106dd2:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106dd8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106ddb:	77 49                	ja     80106e26 <inituvm+0x66>
80106ddd:	e8 fe b7 ff ff       	call   801025e0 <kalloc>
80106de2:	83 ec 04             	sub    $0x4,%esp
80106de5:	89 c3                	mov    %eax,%ebx
80106de7:	68 00 10 00 00       	push   $0x1000
80106dec:	6a 00                	push   $0x0
80106dee:	50                   	push   %eax
80106def:	e8 9c d9 ff ff       	call   80104790 <memset>
80106df4:	58                   	pop    %eax
80106df5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80106dfb:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106e00:	5a                   	pop    %edx
80106e01:	6a 06                	push   $0x6
80106e03:	50                   	push   %eax
80106e04:	31 d2                	xor    %edx,%edx
80106e06:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106e09:	e8 c2 fc ff ff       	call   80106ad0 <mappages>
80106e0e:	89 75 10             	mov    %esi,0x10(%ebp)
80106e11:	89 7d 0c             	mov    %edi,0xc(%ebp)
80106e14:	83 c4 10             	add    $0x10,%esp
80106e17:	89 5d 08             	mov    %ebx,0x8(%ebp)
80106e1a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106e1d:	5b                   	pop    %ebx
80106e1e:	5e                   	pop    %esi
80106e1f:	5f                   	pop    %edi
80106e20:	5d                   	pop    %ebp
80106e21:	e9 1a da ff ff       	jmp    80104840 <memmove>
80106e26:	83 ec 0c             	sub    $0xc,%esp
80106e29:	68 41 7d 10 80       	push   $0x80107d41
80106e2e:	e8 5d 95 ff ff       	call   80100390 <panic>
80106e33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106e40 <loaduvm>:
80106e40:	55                   	push   %ebp
80106e41:	89 e5                	mov    %esp,%ebp
80106e43:	57                   	push   %edi
80106e44:	56                   	push   %esi
80106e45:	53                   	push   %ebx
80106e46:	83 ec 0c             	sub    $0xc,%esp
80106e49:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80106e50:	0f 85 91 00 00 00    	jne    80106ee7 <loaduvm+0xa7>
80106e56:	8b 75 18             	mov    0x18(%ebp),%esi
80106e59:	31 db                	xor    %ebx,%ebx
80106e5b:	85 f6                	test   %esi,%esi
80106e5d:	75 1a                	jne    80106e79 <loaduvm+0x39>
80106e5f:	eb 6f                	jmp    80106ed0 <loaduvm+0x90>
80106e61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106e68:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106e6e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80106e74:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80106e77:	76 57                	jbe    80106ed0 <loaduvm+0x90>
80106e79:	8b 55 0c             	mov    0xc(%ebp),%edx
80106e7c:	8b 45 08             	mov    0x8(%ebp),%eax
80106e7f:	31 c9                	xor    %ecx,%ecx
80106e81:	01 da                	add    %ebx,%edx
80106e83:	e8 c8 fb ff ff       	call   80106a50 <walkpgdir>
80106e88:	85 c0                	test   %eax,%eax
80106e8a:	74 4e                	je     80106eda <loaduvm+0x9a>
80106e8c:	8b 00                	mov    (%eax),%eax
80106e8e:	8b 4d 14             	mov    0x14(%ebp),%ecx
80106e91:	bf 00 10 00 00       	mov    $0x1000,%edi
80106e96:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106e9b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80106ea1:	0f 46 fe             	cmovbe %esi,%edi
80106ea4:	01 d9                	add    %ebx,%ecx
80106ea6:	05 00 00 00 80       	add    $0x80000000,%eax
80106eab:	57                   	push   %edi
80106eac:	51                   	push   %ecx
80106ead:	50                   	push   %eax
80106eae:	ff 75 10             	pushl  0x10(%ebp)
80106eb1:	e8 ba aa ff ff       	call   80101970 <readi>
80106eb6:	83 c4 10             	add    $0x10,%esp
80106eb9:	39 f8                	cmp    %edi,%eax
80106ebb:	74 ab                	je     80106e68 <loaduvm+0x28>
80106ebd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ec0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106ec5:	5b                   	pop    %ebx
80106ec6:	5e                   	pop    %esi
80106ec7:	5f                   	pop    %edi
80106ec8:	5d                   	pop    %ebp
80106ec9:	c3                   	ret    
80106eca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106ed0:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ed3:	31 c0                	xor    %eax,%eax
80106ed5:	5b                   	pop    %ebx
80106ed6:	5e                   	pop    %esi
80106ed7:	5f                   	pop    %edi
80106ed8:	5d                   	pop    %ebp
80106ed9:	c3                   	ret    
80106eda:	83 ec 0c             	sub    $0xc,%esp
80106edd:	68 5b 7d 10 80       	push   $0x80107d5b
80106ee2:	e8 a9 94 ff ff       	call   80100390 <panic>
80106ee7:	83 ec 0c             	sub    $0xc,%esp
80106eea:	68 fc 7d 10 80       	push   $0x80107dfc
80106eef:	e8 9c 94 ff ff       	call   80100390 <panic>
80106ef4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106efa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80106f00 <allocuvm>:
80106f00:	55                   	push   %ebp
80106f01:	89 e5                	mov    %esp,%ebp
80106f03:	57                   	push   %edi
80106f04:	56                   	push   %esi
80106f05:	53                   	push   %ebx
80106f06:	83 ec 1c             	sub    $0x1c,%esp
80106f09:	8b 7d 10             	mov    0x10(%ebp),%edi
80106f0c:	85 ff                	test   %edi,%edi
80106f0e:	0f 88 8e 00 00 00    	js     80106fa2 <allocuvm+0xa2>
80106f14:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80106f17:	0f 82 93 00 00 00    	jb     80106fb0 <allocuvm+0xb0>
80106f1d:	8b 45 0c             	mov    0xc(%ebp),%eax
80106f20:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80106f26:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106f2c:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106f2f:	0f 86 7e 00 00 00    	jbe    80106fb3 <allocuvm+0xb3>
80106f35:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80106f38:	8b 7d 08             	mov    0x8(%ebp),%edi
80106f3b:	eb 42                	jmp    80106f7f <allocuvm+0x7f>
80106f3d:	8d 76 00             	lea    0x0(%esi),%esi
80106f40:	83 ec 04             	sub    $0x4,%esp
80106f43:	68 00 10 00 00       	push   $0x1000
80106f48:	6a 00                	push   $0x0
80106f4a:	50                   	push   %eax
80106f4b:	e8 40 d8 ff ff       	call   80104790 <memset>
80106f50:	58                   	pop    %eax
80106f51:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106f57:	b9 00 10 00 00       	mov    $0x1000,%ecx
80106f5c:	5a                   	pop    %edx
80106f5d:	6a 06                	push   $0x6
80106f5f:	50                   	push   %eax
80106f60:	89 da                	mov    %ebx,%edx
80106f62:	89 f8                	mov    %edi,%eax
80106f64:	e8 67 fb ff ff       	call   80106ad0 <mappages>
80106f69:	83 c4 10             	add    $0x10,%esp
80106f6c:	85 c0                	test   %eax,%eax
80106f6e:	78 50                	js     80106fc0 <allocuvm+0xc0>
80106f70:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106f76:	39 5d 10             	cmp    %ebx,0x10(%ebp)
80106f79:	0f 86 81 00 00 00    	jbe    80107000 <allocuvm+0x100>
80106f7f:	e8 5c b6 ff ff       	call   801025e0 <kalloc>
80106f84:	85 c0                	test   %eax,%eax
80106f86:	89 c6                	mov    %eax,%esi
80106f88:	75 b6                	jne    80106f40 <allocuvm+0x40>
80106f8a:	83 ec 0c             	sub    $0xc,%esp
80106f8d:	68 79 7d 10 80       	push   $0x80107d79
80106f92:	e8 c9 96 ff ff       	call   80100660 <cprintf>
80106f97:	83 c4 10             	add    $0x10,%esp
80106f9a:	8b 45 0c             	mov    0xc(%ebp),%eax
80106f9d:	39 45 10             	cmp    %eax,0x10(%ebp)
80106fa0:	77 6e                	ja     80107010 <allocuvm+0x110>
80106fa2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106fa5:	31 ff                	xor    %edi,%edi
80106fa7:	89 f8                	mov    %edi,%eax
80106fa9:	5b                   	pop    %ebx
80106faa:	5e                   	pop    %esi
80106fab:	5f                   	pop    %edi
80106fac:	5d                   	pop    %ebp
80106fad:	c3                   	ret    
80106fae:	66 90                	xchg   %ax,%ax
80106fb0:	8b 7d 0c             	mov    0xc(%ebp),%edi
80106fb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106fb6:	89 f8                	mov    %edi,%eax
80106fb8:	5b                   	pop    %ebx
80106fb9:	5e                   	pop    %esi
80106fba:	5f                   	pop    %edi
80106fbb:	5d                   	pop    %ebp
80106fbc:	c3                   	ret    
80106fbd:	8d 76 00             	lea    0x0(%esi),%esi
80106fc0:	83 ec 0c             	sub    $0xc,%esp
80106fc3:	68 91 7d 10 80       	push   $0x80107d91
80106fc8:	e8 93 96 ff ff       	call   80100660 <cprintf>
80106fcd:	83 c4 10             	add    $0x10,%esp
80106fd0:	8b 45 0c             	mov    0xc(%ebp),%eax
80106fd3:	39 45 10             	cmp    %eax,0x10(%ebp)
80106fd6:	76 0d                	jbe    80106fe5 <allocuvm+0xe5>
80106fd8:	89 c1                	mov    %eax,%ecx
80106fda:	8b 55 10             	mov    0x10(%ebp),%edx
80106fdd:	8b 45 08             	mov    0x8(%ebp),%eax
80106fe0:	e8 7b fb ff ff       	call   80106b60 <deallocuvm.part.0>
80106fe5:	83 ec 0c             	sub    $0xc,%esp
80106fe8:	31 ff                	xor    %edi,%edi
80106fea:	56                   	push   %esi
80106feb:	e8 40 b4 ff ff       	call   80102430 <kfree>
80106ff0:	83 c4 10             	add    $0x10,%esp
80106ff3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106ff6:	89 f8                	mov    %edi,%eax
80106ff8:	5b                   	pop    %ebx
80106ff9:	5e                   	pop    %esi
80106ffa:	5f                   	pop    %edi
80106ffb:	5d                   	pop    %ebp
80106ffc:	c3                   	ret    
80106ffd:	8d 76 00             	lea    0x0(%esi),%esi
80107000:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80107003:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107006:	5b                   	pop    %ebx
80107007:	89 f8                	mov    %edi,%eax
80107009:	5e                   	pop    %esi
8010700a:	5f                   	pop    %edi
8010700b:	5d                   	pop    %ebp
8010700c:	c3                   	ret    
8010700d:	8d 76 00             	lea    0x0(%esi),%esi
80107010:	89 c1                	mov    %eax,%ecx
80107012:	8b 55 10             	mov    0x10(%ebp),%edx
80107015:	8b 45 08             	mov    0x8(%ebp),%eax
80107018:	31 ff                	xor    %edi,%edi
8010701a:	e8 41 fb ff ff       	call   80106b60 <deallocuvm.part.0>
8010701f:	eb 92                	jmp    80106fb3 <allocuvm+0xb3>
80107021:	eb 0d                	jmp    80107030 <deallocuvm>
80107023:	90                   	nop
80107024:	90                   	nop
80107025:	90                   	nop
80107026:	90                   	nop
80107027:	90                   	nop
80107028:	90                   	nop
80107029:	90                   	nop
8010702a:	90                   	nop
8010702b:	90                   	nop
8010702c:	90                   	nop
8010702d:	90                   	nop
8010702e:	90                   	nop
8010702f:	90                   	nop

80107030 <deallocuvm>:
80107030:	55                   	push   %ebp
80107031:	89 e5                	mov    %esp,%ebp
80107033:	8b 55 0c             	mov    0xc(%ebp),%edx
80107036:	8b 4d 10             	mov    0x10(%ebp),%ecx
80107039:	8b 45 08             	mov    0x8(%ebp),%eax
8010703c:	39 d1                	cmp    %edx,%ecx
8010703e:	73 10                	jae    80107050 <deallocuvm+0x20>
80107040:	5d                   	pop    %ebp
80107041:	e9 1a fb ff ff       	jmp    80106b60 <deallocuvm.part.0>
80107046:	8d 76 00             	lea    0x0(%esi),%esi
80107049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80107050:	89 d0                	mov    %edx,%eax
80107052:	5d                   	pop    %ebp
80107053:	c3                   	ret    
80107054:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010705a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107060 <freevm>:
80107060:	55                   	push   %ebp
80107061:	89 e5                	mov    %esp,%ebp
80107063:	57                   	push   %edi
80107064:	56                   	push   %esi
80107065:	53                   	push   %ebx
80107066:	83 ec 0c             	sub    $0xc,%esp
80107069:	8b 75 08             	mov    0x8(%ebp),%esi
8010706c:	85 f6                	test   %esi,%esi
8010706e:	74 59                	je     801070c9 <freevm+0x69>
80107070:	31 c9                	xor    %ecx,%ecx
80107072:	ba 00 00 00 80       	mov    $0x80000000,%edx
80107077:	89 f0                	mov    %esi,%eax
80107079:	e8 e2 fa ff ff       	call   80106b60 <deallocuvm.part.0>
8010707e:	89 f3                	mov    %esi,%ebx
80107080:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80107086:	eb 0f                	jmp    80107097 <freevm+0x37>
80107088:	90                   	nop
80107089:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107090:	83 c3 04             	add    $0x4,%ebx
80107093:	39 fb                	cmp    %edi,%ebx
80107095:	74 23                	je     801070ba <freevm+0x5a>
80107097:	8b 03                	mov    (%ebx),%eax
80107099:	a8 01                	test   $0x1,%al
8010709b:	74 f3                	je     80107090 <freevm+0x30>
8010709d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801070a2:	83 ec 0c             	sub    $0xc,%esp
801070a5:	83 c3 04             	add    $0x4,%ebx
801070a8:	05 00 00 00 80       	add    $0x80000000,%eax
801070ad:	50                   	push   %eax
801070ae:	e8 7d b3 ff ff       	call   80102430 <kfree>
801070b3:	83 c4 10             	add    $0x10,%esp
801070b6:	39 fb                	cmp    %edi,%ebx
801070b8:	75 dd                	jne    80107097 <freevm+0x37>
801070ba:	89 75 08             	mov    %esi,0x8(%ebp)
801070bd:	8d 65 f4             	lea    -0xc(%ebp),%esp
801070c0:	5b                   	pop    %ebx
801070c1:	5e                   	pop    %esi
801070c2:	5f                   	pop    %edi
801070c3:	5d                   	pop    %ebp
801070c4:	e9 67 b3 ff ff       	jmp    80102430 <kfree>
801070c9:	83 ec 0c             	sub    $0xc,%esp
801070cc:	68 ad 7d 10 80       	push   $0x80107dad
801070d1:	e8 ba 92 ff ff       	call   80100390 <panic>
801070d6:	8d 76 00             	lea    0x0(%esi),%esi
801070d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801070e0 <setupkvm>:
801070e0:	55                   	push   %ebp
801070e1:	89 e5                	mov    %esp,%ebp
801070e3:	56                   	push   %esi
801070e4:	53                   	push   %ebx
801070e5:	e8 f6 b4 ff ff       	call   801025e0 <kalloc>
801070ea:	85 c0                	test   %eax,%eax
801070ec:	89 c6                	mov    %eax,%esi
801070ee:	74 42                	je     80107132 <setupkvm+0x52>
801070f0:	83 ec 04             	sub    $0x4,%esp
801070f3:	bb 20 a4 10 80       	mov    $0x8010a420,%ebx
801070f8:	68 00 10 00 00       	push   $0x1000
801070fd:	6a 00                	push   $0x0
801070ff:	50                   	push   %eax
80107100:	e8 8b d6 ff ff       	call   80104790 <memset>
80107105:	83 c4 10             	add    $0x10,%esp
80107108:	8b 43 04             	mov    0x4(%ebx),%eax
8010710b:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010710e:	83 ec 08             	sub    $0x8,%esp
80107111:	8b 13                	mov    (%ebx),%edx
80107113:	ff 73 0c             	pushl  0xc(%ebx)
80107116:	50                   	push   %eax
80107117:	29 c1                	sub    %eax,%ecx
80107119:	89 f0                	mov    %esi,%eax
8010711b:	e8 b0 f9 ff ff       	call   80106ad0 <mappages>
80107120:	83 c4 10             	add    $0x10,%esp
80107123:	85 c0                	test   %eax,%eax
80107125:	78 19                	js     80107140 <setupkvm+0x60>
80107127:	83 c3 10             	add    $0x10,%ebx
8010712a:	81 fb 60 a4 10 80    	cmp    $0x8010a460,%ebx
80107130:	75 d6                	jne    80107108 <setupkvm+0x28>
80107132:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107135:	89 f0                	mov    %esi,%eax
80107137:	5b                   	pop    %ebx
80107138:	5e                   	pop    %esi
80107139:	5d                   	pop    %ebp
8010713a:	c3                   	ret    
8010713b:	90                   	nop
8010713c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107140:	83 ec 0c             	sub    $0xc,%esp
80107143:	56                   	push   %esi
80107144:	31 f6                	xor    %esi,%esi
80107146:	e8 15 ff ff ff       	call   80107060 <freevm>
8010714b:	83 c4 10             	add    $0x10,%esp
8010714e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80107151:	89 f0                	mov    %esi,%eax
80107153:	5b                   	pop    %ebx
80107154:	5e                   	pop    %esi
80107155:	5d                   	pop    %ebp
80107156:	c3                   	ret    
80107157:	89 f6                	mov    %esi,%esi
80107159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107160 <kvmalloc>:
80107160:	55                   	push   %ebp
80107161:	89 e5                	mov    %esp,%ebp
80107163:	83 ec 08             	sub    $0x8,%esp
80107166:	e8 75 ff ff ff       	call   801070e0 <setupkvm>
8010716b:	a3 a4 55 11 80       	mov    %eax,0x801155a4
80107170:	05 00 00 00 80       	add    $0x80000000,%eax
80107175:	0f 22 d8             	mov    %eax,%cr3
80107178:	c9                   	leave  
80107179:	c3                   	ret    
8010717a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107180 <clearpteu>:
80107180:	55                   	push   %ebp
80107181:	31 c9                	xor    %ecx,%ecx
80107183:	89 e5                	mov    %esp,%ebp
80107185:	83 ec 08             	sub    $0x8,%esp
80107188:	8b 55 0c             	mov    0xc(%ebp),%edx
8010718b:	8b 45 08             	mov    0x8(%ebp),%eax
8010718e:	e8 bd f8 ff ff       	call   80106a50 <walkpgdir>
80107193:	85 c0                	test   %eax,%eax
80107195:	74 05                	je     8010719c <clearpteu+0x1c>
80107197:	83 20 fb             	andl   $0xfffffffb,(%eax)
8010719a:	c9                   	leave  
8010719b:	c3                   	ret    
8010719c:	83 ec 0c             	sub    $0xc,%esp
8010719f:	68 be 7d 10 80       	push   $0x80107dbe
801071a4:	e8 e7 91 ff ff       	call   80100390 <panic>
801071a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801071b0 <copyuvm>:
801071b0:	55                   	push   %ebp
801071b1:	89 e5                	mov    %esp,%ebp
801071b3:	57                   	push   %edi
801071b4:	56                   	push   %esi
801071b5:	53                   	push   %ebx
801071b6:	83 ec 1c             	sub    $0x1c,%esp
801071b9:	e8 22 ff ff ff       	call   801070e0 <setupkvm>
801071be:	85 c0                	test   %eax,%eax
801071c0:	89 45 e0             	mov    %eax,-0x20(%ebp)
801071c3:	0f 84 9f 00 00 00    	je     80107268 <copyuvm+0xb8>
801071c9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801071cc:	85 c9                	test   %ecx,%ecx
801071ce:	0f 84 94 00 00 00    	je     80107268 <copyuvm+0xb8>
801071d4:	31 ff                	xor    %edi,%edi
801071d6:	eb 4a                	jmp    80107222 <copyuvm+0x72>
801071d8:	90                   	nop
801071d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801071e0:	83 ec 04             	sub    $0x4,%esp
801071e3:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
801071e9:	68 00 10 00 00       	push   $0x1000
801071ee:	53                   	push   %ebx
801071ef:	50                   	push   %eax
801071f0:	e8 4b d6 ff ff       	call   80104840 <memmove>
801071f5:	58                   	pop    %eax
801071f6:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801071fc:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107201:	5a                   	pop    %edx
80107202:	ff 75 e4             	pushl  -0x1c(%ebp)
80107205:	50                   	push   %eax
80107206:	89 fa                	mov    %edi,%edx
80107208:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010720b:	e8 c0 f8 ff ff       	call   80106ad0 <mappages>
80107210:	83 c4 10             	add    $0x10,%esp
80107213:	85 c0                	test   %eax,%eax
80107215:	78 61                	js     80107278 <copyuvm+0xc8>
80107217:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010721d:	39 7d 0c             	cmp    %edi,0xc(%ebp)
80107220:	76 46                	jbe    80107268 <copyuvm+0xb8>
80107222:	8b 45 08             	mov    0x8(%ebp),%eax
80107225:	31 c9                	xor    %ecx,%ecx
80107227:	89 fa                	mov    %edi,%edx
80107229:	e8 22 f8 ff ff       	call   80106a50 <walkpgdir>
8010722e:	85 c0                	test   %eax,%eax
80107230:	74 61                	je     80107293 <copyuvm+0xe3>
80107232:	8b 00                	mov    (%eax),%eax
80107234:	a8 01                	test   $0x1,%al
80107236:	74 4e                	je     80107286 <copyuvm+0xd6>
80107238:	89 c3                	mov    %eax,%ebx
8010723a:	25 ff 0f 00 00       	and    $0xfff,%eax
8010723f:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80107245:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80107248:	e8 93 b3 ff ff       	call   801025e0 <kalloc>
8010724d:	85 c0                	test   %eax,%eax
8010724f:	89 c6                	mov    %eax,%esi
80107251:	75 8d                	jne    801071e0 <copyuvm+0x30>
80107253:	83 ec 0c             	sub    $0xc,%esp
80107256:	ff 75 e0             	pushl  -0x20(%ebp)
80107259:	e8 02 fe ff ff       	call   80107060 <freevm>
8010725e:	83 c4 10             	add    $0x10,%esp
80107261:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
80107268:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010726b:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010726e:	5b                   	pop    %ebx
8010726f:	5e                   	pop    %esi
80107270:	5f                   	pop    %edi
80107271:	5d                   	pop    %ebp
80107272:	c3                   	ret    
80107273:	90                   	nop
80107274:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107278:	83 ec 0c             	sub    $0xc,%esp
8010727b:	56                   	push   %esi
8010727c:	e8 af b1 ff ff       	call   80102430 <kfree>
80107281:	83 c4 10             	add    $0x10,%esp
80107284:	eb cd                	jmp    80107253 <copyuvm+0xa3>
80107286:	83 ec 0c             	sub    $0xc,%esp
80107289:	68 e2 7d 10 80       	push   $0x80107de2
8010728e:	e8 fd 90 ff ff       	call   80100390 <panic>
80107293:	83 ec 0c             	sub    $0xc,%esp
80107296:	68 c8 7d 10 80       	push   $0x80107dc8
8010729b:	e8 f0 90 ff ff       	call   80100390 <panic>

801072a0 <uva2ka>:
801072a0:	55                   	push   %ebp
801072a1:	31 c9                	xor    %ecx,%ecx
801072a3:	89 e5                	mov    %esp,%ebp
801072a5:	83 ec 08             	sub    $0x8,%esp
801072a8:	8b 55 0c             	mov    0xc(%ebp),%edx
801072ab:	8b 45 08             	mov    0x8(%ebp),%eax
801072ae:	e8 9d f7 ff ff       	call   80106a50 <walkpgdir>
801072b3:	8b 00                	mov    (%eax),%eax
801072b5:	c9                   	leave  
801072b6:	89 c2                	mov    %eax,%edx
801072b8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
801072bd:	83 e2 05             	and    $0x5,%edx
801072c0:	05 00 00 00 80       	add    $0x80000000,%eax
801072c5:	83 fa 05             	cmp    $0x5,%edx
801072c8:	ba 00 00 00 00       	mov    $0x0,%edx
801072cd:	0f 45 c2             	cmovne %edx,%eax
801072d0:	c3                   	ret    
801072d1:	eb 0d                	jmp    801072e0 <copyout>
801072d3:	90                   	nop
801072d4:	90                   	nop
801072d5:	90                   	nop
801072d6:	90                   	nop
801072d7:	90                   	nop
801072d8:	90                   	nop
801072d9:	90                   	nop
801072da:	90                   	nop
801072db:	90                   	nop
801072dc:	90                   	nop
801072dd:	90                   	nop
801072de:	90                   	nop
801072df:	90                   	nop

801072e0 <copyout>:
801072e0:	55                   	push   %ebp
801072e1:	89 e5                	mov    %esp,%ebp
801072e3:	57                   	push   %edi
801072e4:	56                   	push   %esi
801072e5:	53                   	push   %ebx
801072e6:	83 ec 1c             	sub    $0x1c,%esp
801072e9:	8b 5d 14             	mov    0x14(%ebp),%ebx
801072ec:	8b 55 0c             	mov    0xc(%ebp),%edx
801072ef:	8b 7d 10             	mov    0x10(%ebp),%edi
801072f2:	85 db                	test   %ebx,%ebx
801072f4:	75 40                	jne    80107336 <copyout+0x56>
801072f6:	eb 70                	jmp    80107368 <copyout+0x88>
801072f8:	90                   	nop
801072f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107300:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107303:	89 f1                	mov    %esi,%ecx
80107305:	29 d1                	sub    %edx,%ecx
80107307:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010730d:	39 d9                	cmp    %ebx,%ecx
8010730f:	0f 47 cb             	cmova  %ebx,%ecx
80107312:	29 f2                	sub    %esi,%edx
80107314:	83 ec 04             	sub    $0x4,%esp
80107317:	01 d0                	add    %edx,%eax
80107319:	51                   	push   %ecx
8010731a:	57                   	push   %edi
8010731b:	50                   	push   %eax
8010731c:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010731f:	e8 1c d5 ff ff       	call   80104840 <memmove>
80107324:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80107327:	83 c4 10             	add    $0x10,%esp
8010732a:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
80107330:	01 cf                	add    %ecx,%edi
80107332:	29 cb                	sub    %ecx,%ebx
80107334:	74 32                	je     80107368 <copyout+0x88>
80107336:	89 d6                	mov    %edx,%esi
80107338:	83 ec 08             	sub    $0x8,%esp
8010733b:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010733e:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
80107344:	56                   	push   %esi
80107345:	ff 75 08             	pushl  0x8(%ebp)
80107348:	e8 53 ff ff ff       	call   801072a0 <uva2ka>
8010734d:	83 c4 10             	add    $0x10,%esp
80107350:	85 c0                	test   %eax,%eax
80107352:	75 ac                	jne    80107300 <copyout+0x20>
80107354:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107357:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010735c:	5b                   	pop    %ebx
8010735d:	5e                   	pop    %esi
8010735e:	5f                   	pop    %edi
8010735f:	5d                   	pop    %ebp
80107360:	c3                   	ret    
80107361:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107368:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010736b:	31 c0                	xor    %eax,%eax
8010736d:	5b                   	pop    %ebx
8010736e:	5e                   	pop    %esi
8010736f:	5f                   	pop    %edi
80107370:	5d                   	pop    %ebp
80107371:	c3                   	ret    
