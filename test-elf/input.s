
input.riscv:     file format elf32-littleriscv


Disassembly of section .text:

00010094 <exit>:
   10094:	ff010113          	addi	sp,sp,-16
   10098:	00000593          	li	a1,0
   1009c:	00812423          	sw	s0,8(sp)
   100a0:	00112623          	sw	ra,12(sp)
   100a4:	00050413          	mv	s0,a0
   100a8:	3c9000ef          	jal	10c70 <__call_exitprocs>
   100ac:	d481a783          	lw	a5,-696(gp) # 13688 <__stdio_exit_handler>
   100b0:	00078463          	beqz	a5,100b8 <exit+0x24>
   100b4:	000780e7          	jalr	a5
   100b8:	00040513          	mv	a0,s0
   100bc:	6d5010ef          	jal	11f90 <_exit>

000100c0 <register_fini>:
   100c0:	00000793          	li	a5,0
   100c4:	00078863          	beqz	a5,100d4 <register_fini+0x14>
   100c8:	00012537          	lui	a0,0x12
   100cc:	e5850513          	addi	a0,a0,-424 # 11e58 <__libc_fini_array>
   100d0:	4d50006f          	j	10da4 <atexit>
   100d4:	00008067          	ret

000100d8 <_start>:
   100d8:	00004197          	auipc	gp,0x4
   100dc:	86818193          	addi	gp,gp,-1944 # 13940 <__global_pointer$>
   100e0:	d4818513          	addi	a0,gp,-696 # 13688 <__stdio_exit_handler>
   100e4:	07018613          	addi	a2,gp,112 # 139b0 <__BSS_END__>
   100e8:	40a60633          	sub	a2,a2,a0
   100ec:	00000593          	li	a1,0
   100f0:	2a5000ef          	jal	10b94 <memset>
   100f4:	00001517          	auipc	a0,0x1
   100f8:	cb050513          	addi	a0,a0,-848 # 10da4 <atexit>
   100fc:	00050863          	beqz	a0,1010c <_start+0x34>
   10100:	00002517          	auipc	a0,0x2
   10104:	d5850513          	addi	a0,a0,-680 # 11e58 <__libc_fini_array>
   10108:	49d000ef          	jal	10da4 <atexit>
   1010c:	1ed000ef          	jal	10af8 <__libc_init_array>
   10110:	00012503          	lw	a0,0(sp)
   10114:	00410593          	addi	a1,sp,4
   10118:	00000613          	li	a2,0
   1011c:	06c000ef          	jal	10188 <main>
   10120:	f75ff06f          	j	10094 <exit>

00010124 <__do_global_dtors_aux>:
   10124:	ff010113          	addi	sp,sp,-16
   10128:	00812423          	sw	s0,8(sp)
   1012c:	d641c783          	lbu	a5,-668(gp) # 136a4 <completed.1>
   10130:	00112623          	sw	ra,12(sp)
   10134:	02079263          	bnez	a5,10158 <__do_global_dtors_aux+0x34>
   10138:	00000793          	li	a5,0
   1013c:	00078a63          	beqz	a5,10150 <__do_global_dtors_aux+0x2c>
   10140:	00013537          	lui	a0,0x13
   10144:	13050513          	addi	a0,a0,304 # 13130 <__EH_FRAME_BEGIN__>
   10148:	00000097          	auipc	ra,0x0
   1014c:	000000e7          	jalr	zero # 0 <exit-0x10094>
   10150:	00100793          	li	a5,1
   10154:	d6f18223          	sb	a5,-668(gp) # 136a4 <completed.1>
   10158:	00c12083          	lw	ra,12(sp)
   1015c:	00812403          	lw	s0,8(sp)
   10160:	01010113          	addi	sp,sp,16
   10164:	00008067          	ret

00010168 <frame_dummy>:
   10168:	00000793          	li	a5,0
   1016c:	00078c63          	beqz	a5,10184 <frame_dummy+0x1c>
   10170:	00013537          	lui	a0,0x13
   10174:	d6818593          	addi	a1,gp,-664 # 136a8 <object.0>
   10178:	13050513          	addi	a0,a0,304 # 13130 <__EH_FRAME_BEGIN__>
   1017c:	00000317          	auipc	t1,0x0
   10180:	00000067          	jr	zero # 0 <exit-0x10094>
   10184:	00008067          	ret

00010188 <main>:
   10188:	fe010113          	addi	sp,sp,-32
   1018c:	00112e23          	sw	ra,28(sp)
   10190:	00812c23          	sw	s0,24(sp)
   10194:	02010413          	addi	s0,sp,32
   10198:	114000ef          	jal	102ac <read_char>
   1019c:	00050793          	mv	a5,a0
   101a0:	fef407a3          	sb	a5,-17(s0)
   101a4:	000127b7          	lui	a5,0x12
   101a8:	10c78513          	addi	a0,a5,268 # 1210c <__errno+0x8>
   101ac:	088000ef          	jal	10234 <print_s>
   101b0:	fef44783          	lbu	a5,-17(s0)
   101b4:	00078513          	mv	a0,a5
   101b8:	0a4000ef          	jal	1025c <print_c>
   101bc:	00a00513          	li	a0,10
   101c0:	09c000ef          	jal	1025c <print_c>
   101c4:	118000ef          	jal	102dc <read_num>
   101c8:	00050713          	mv	a4,a0
   101cc:	00058793          	mv	a5,a1
   101d0:	fee42423          	sw	a4,-24(s0)
   101d4:	000127b7          	lui	a5,0x12
   101d8:	12078513          	addi	a0,a5,288 # 12120 <__errno+0x1c>
   101dc:	058000ef          	jal	10234 <print_s>
   101e0:	fe842503          	lw	a0,-24(s0)
   101e4:	028000ef          	jal	1020c <print_d>
   101e8:	00a00513          	li	a0,10
   101ec:	070000ef          	jal	1025c <print_c>
   101f0:	098000ef          	jal	10288 <exit_proc>
   101f4:	00000793          	li	a5,0
   101f8:	00078513          	mv	a0,a5
   101fc:	01c12083          	lw	ra,28(sp)
   10200:	01812403          	lw	s0,24(sp)
   10204:	02010113          	addi	sp,sp,32
   10208:	00008067          	ret

0001020c <print_d>:
   1020c:	fe010113          	addi	sp,sp,-32
   10210:	00812e23          	sw	s0,28(sp)
   10214:	02010413          	addi	s0,sp,32
   10218:	fea42623          	sw	a0,-20(s0)
   1021c:	00200893          	li	a7,2
   10220:	00000073          	ecall
   10224:	00000013          	nop
   10228:	01c12403          	lw	s0,28(sp)
   1022c:	02010113          	addi	sp,sp,32
   10230:	00008067          	ret

00010234 <print_s>:
   10234:	fe010113          	addi	sp,sp,-32
   10238:	00812e23          	sw	s0,28(sp)
   1023c:	02010413          	addi	s0,sp,32
   10240:	fea42623          	sw	a0,-20(s0)
   10244:	00000893          	li	a7,0
   10248:	00000073          	ecall
   1024c:	00000013          	nop
   10250:	01c12403          	lw	s0,28(sp)
   10254:	02010113          	addi	sp,sp,32
   10258:	00008067          	ret

0001025c <print_c>:
   1025c:	fe010113          	addi	sp,sp,-32
   10260:	00812e23          	sw	s0,28(sp)
   10264:	02010413          	addi	s0,sp,32
   10268:	00050793          	mv	a5,a0
   1026c:	fef407a3          	sb	a5,-17(s0)
   10270:	00100893          	li	a7,1
   10274:	00000073          	ecall
   10278:	00000013          	nop
   1027c:	01c12403          	lw	s0,28(sp)
   10280:	02010113          	addi	sp,sp,32
   10284:	00008067          	ret

00010288 <exit_proc>:
   10288:	ff010113          	addi	sp,sp,-16
   1028c:	00812623          	sw	s0,12(sp)
   10290:	01010413          	addi	s0,sp,16
   10294:	00300893          	li	a7,3
   10298:	00000073          	ecall
   1029c:	00000013          	nop
   102a0:	00c12403          	lw	s0,12(sp)
   102a4:	01010113          	addi	sp,sp,16
   102a8:	00008067          	ret

000102ac <read_char>:
   102ac:	fe010113          	addi	sp,sp,-32
   102b0:	00812e23          	sw	s0,28(sp)
   102b4:	02010413          	addi	s0,sp,32
   102b8:	00400893          	li	a7,4
   102bc:	00000073          	ecall
   102c0:	00050793          	mv	a5,a0
   102c4:	fef407a3          	sb	a5,-17(s0)
   102c8:	fef44783          	lbu	a5,-17(s0)
   102cc:	00078513          	mv	a0,a5
   102d0:	01c12403          	lw	s0,28(sp)
   102d4:	02010113          	addi	sp,sp,32
   102d8:	00008067          	ret

000102dc <read_num>:
   102dc:	fe010113          	addi	sp,sp,-32
   102e0:	00812e23          	sw	s0,28(sp)
   102e4:	02010413          	addi	s0,sp,32
   102e8:	00500893          	li	a7,5
   102ec:	00000073          	ecall
   102f0:	00050713          	mv	a4,a0
   102f4:	fee42423          	sw	a4,-24(s0)
   102f8:	fef42623          	sw	a5,-20(s0)
   102fc:	fe842703          	lw	a4,-24(s0)
   10300:	fec42783          	lw	a5,-20(s0)
   10304:	00070513          	mv	a0,a4
   10308:	00078593          	mv	a1,a5
   1030c:	01c12403          	lw	s0,28(sp)
   10310:	02010113          	addi	sp,sp,32
   10314:	00008067          	ret

00010318 <__fp_lock>:
   10318:	00000513          	li	a0,0
   1031c:	00008067          	ret

00010320 <stdio_exit_handler>:
   10320:	00013637          	lui	a2,0x13
   10324:	000125b7          	lui	a1,0x12
   10328:	00013537          	lui	a0,0x13
   1032c:	14060613          	addi	a2,a2,320 # 13140 <__sglue>
   10330:	9b858593          	addi	a1,a1,-1608 # 119b8 <_fclose_r>
   10334:	15050513          	addi	a0,a0,336 # 13150 <_impure_data>
   10338:	3480006f          	j	10680 <_fwalk_sglue>

0001033c <cleanup_stdio>:
   1033c:	00452583          	lw	a1,4(a0)
   10340:	ff010113          	addi	sp,sp,-16
   10344:	00812423          	sw	s0,8(sp)
   10348:	00112623          	sw	ra,12(sp)
   1034c:	d8018793          	addi	a5,gp,-640 # 136c0 <__sf>
   10350:	00050413          	mv	s0,a0
   10354:	00f58463          	beq	a1,a5,1035c <cleanup_stdio+0x20>
   10358:	660010ef          	jal	119b8 <_fclose_r>
   1035c:	00842583          	lw	a1,8(s0)
   10360:	de818793          	addi	a5,gp,-536 # 13728 <__sf+0x68>
   10364:	00f58663          	beq	a1,a5,10370 <cleanup_stdio+0x34>
   10368:	00040513          	mv	a0,s0
   1036c:	64c010ef          	jal	119b8 <_fclose_r>
   10370:	00c42583          	lw	a1,12(s0)
   10374:	e5018793          	addi	a5,gp,-432 # 13790 <__sf+0xd0>
   10378:	00f58c63          	beq	a1,a5,10390 <cleanup_stdio+0x54>
   1037c:	00040513          	mv	a0,s0
   10380:	00812403          	lw	s0,8(sp)
   10384:	00c12083          	lw	ra,12(sp)
   10388:	01010113          	addi	sp,sp,16
   1038c:	62c0106f          	j	119b8 <_fclose_r>
   10390:	00c12083          	lw	ra,12(sp)
   10394:	00812403          	lw	s0,8(sp)
   10398:	01010113          	addi	sp,sp,16
   1039c:	00008067          	ret

000103a0 <__fp_unlock>:
   103a0:	00000513          	li	a0,0
   103a4:	00008067          	ret

000103a8 <global_stdio_init.part.0>:
   103a8:	fe010113          	addi	sp,sp,-32
   103ac:	000107b7          	lui	a5,0x10
   103b0:	00812c23          	sw	s0,24(sp)
   103b4:	32078793          	addi	a5,a5,800 # 10320 <stdio_exit_handler>
   103b8:	d8018413          	addi	s0,gp,-640 # 136c0 <__sf>
   103bc:	00112e23          	sw	ra,28(sp)
   103c0:	00912a23          	sw	s1,20(sp)
   103c4:	01212823          	sw	s2,16(sp)
   103c8:	01312623          	sw	s3,12(sp)
   103cc:	01412423          	sw	s4,8(sp)
   103d0:	d4f1a423          	sw	a5,-696(gp) # 13688 <__stdio_exit_handler>
   103d4:	00800613          	li	a2,8
   103d8:	00400793          	li	a5,4
   103dc:	00000593          	li	a1,0
   103e0:	ddc18513          	addi	a0,gp,-548 # 1371c <__sf+0x5c>
   103e4:	00f42623          	sw	a5,12(s0)
   103e8:	00042023          	sw	zero,0(s0)
   103ec:	00042223          	sw	zero,4(s0)
   103f0:	00042423          	sw	zero,8(s0)
   103f4:	06042223          	sw	zero,100(s0)
   103f8:	00042823          	sw	zero,16(s0)
   103fc:	00042a23          	sw	zero,20(s0)
   10400:	00042c23          	sw	zero,24(s0)
   10404:	790000ef          	jal	10b94 <memset>
   10408:	000107b7          	lui	a5,0x10
   1040c:	00010a37          	lui	s4,0x10
   10410:	000109b7          	lui	s3,0x10
   10414:	00011937          	lui	s2,0x11
   10418:	000114b7          	lui	s1,0x11
   1041c:	734a0a13          	addi	s4,s4,1844 # 10734 <__sread>
   10420:	79898993          	addi	s3,s3,1944 # 10798 <__swrite>
   10424:	82090913          	addi	s2,s2,-2016 # 10820 <__sseek>
   10428:	89848493          	addi	s1,s1,-1896 # 10898 <__sclose>
   1042c:	00978793          	addi	a5,a5,9 # 10009 <exit-0x8b>
   10430:	00800613          	li	a2,8
   10434:	00000593          	li	a1,0
   10438:	e4418513          	addi	a0,gp,-444 # 13784 <__sf+0xc4>
   1043c:	03442023          	sw	s4,32(s0)
   10440:	03342223          	sw	s3,36(s0)
   10444:	03242423          	sw	s2,40(s0)
   10448:	02942623          	sw	s1,44(s0)
   1044c:	06f42a23          	sw	a5,116(s0)
   10450:	00842e23          	sw	s0,28(s0)
   10454:	06042423          	sw	zero,104(s0)
   10458:	06042623          	sw	zero,108(s0)
   1045c:	06042823          	sw	zero,112(s0)
   10460:	0c042623          	sw	zero,204(s0)
   10464:	06042c23          	sw	zero,120(s0)
   10468:	06042e23          	sw	zero,124(s0)
   1046c:	08042023          	sw	zero,128(s0)
   10470:	724000ef          	jal	10b94 <memset>
   10474:	000207b7          	lui	a5,0x20
   10478:	01278793          	addi	a5,a5,18 # 20012 <__BSS_END__+0xc662>
   1047c:	de818713          	addi	a4,gp,-536 # 13728 <__sf+0x68>
   10480:	00800613          	li	a2,8
   10484:	00000593          	li	a1,0
   10488:	eac18513          	addi	a0,gp,-340 # 137ec <__sf+0x12c>
   1048c:	09442423          	sw	s4,136(s0)
   10490:	09342623          	sw	s3,140(s0)
   10494:	09242823          	sw	s2,144(s0)
   10498:	08942a23          	sw	s1,148(s0)
   1049c:	0cf42e23          	sw	a5,220(s0)
   104a0:	08e42223          	sw	a4,132(s0)
   104a4:	0c042823          	sw	zero,208(s0)
   104a8:	0c042a23          	sw	zero,212(s0)
   104ac:	0c042c23          	sw	zero,216(s0)
   104b0:	12042a23          	sw	zero,308(s0)
   104b4:	0e042023          	sw	zero,224(s0)
   104b8:	0e042223          	sw	zero,228(s0)
   104bc:	0e042423          	sw	zero,232(s0)
   104c0:	6d4000ef          	jal	10b94 <memset>
   104c4:	e5018793          	addi	a5,gp,-432 # 13790 <__sf+0xd0>
   104c8:	0f442823          	sw	s4,240(s0)
   104cc:	0f342a23          	sw	s3,244(s0)
   104d0:	0f242c23          	sw	s2,248(s0)
   104d4:	0e942e23          	sw	s1,252(s0)
   104d8:	01c12083          	lw	ra,28(sp)
   104dc:	0ef42623          	sw	a5,236(s0)
   104e0:	01812403          	lw	s0,24(sp)
   104e4:	01412483          	lw	s1,20(sp)
   104e8:	01012903          	lw	s2,16(sp)
   104ec:	00c12983          	lw	s3,12(sp)
   104f0:	00812a03          	lw	s4,8(sp)
   104f4:	02010113          	addi	sp,sp,32
   104f8:	00008067          	ret

000104fc <__sfp>:
   104fc:	d481a783          	lw	a5,-696(gp) # 13688 <__stdio_exit_handler>
   10500:	fe010113          	addi	sp,sp,-32
   10504:	01312623          	sw	s3,12(sp)
   10508:	00112e23          	sw	ra,28(sp)
   1050c:	00812c23          	sw	s0,24(sp)
   10510:	00912a23          	sw	s1,20(sp)
   10514:	01212823          	sw	s2,16(sp)
   10518:	00050993          	mv	s3,a0
   1051c:	0e078863          	beqz	a5,1060c <__sfp+0x110>
   10520:	00013937          	lui	s2,0x13
   10524:	14090913          	addi	s2,s2,320 # 13140 <__sglue>
   10528:	fff00493          	li	s1,-1
   1052c:	00492783          	lw	a5,4(s2)
   10530:	00892403          	lw	s0,8(s2)
   10534:	fff78793          	addi	a5,a5,-1
   10538:	0007d863          	bgez	a5,10548 <__sfp+0x4c>
   1053c:	0800006f          	j	105bc <__sfp+0xc0>
   10540:	06840413          	addi	s0,s0,104
   10544:	06978c63          	beq	a5,s1,105bc <__sfp+0xc0>
   10548:	00c41703          	lh	a4,12(s0)
   1054c:	fff78793          	addi	a5,a5,-1
   10550:	fe0718e3          	bnez	a4,10540 <__sfp+0x44>
   10554:	ffff07b7          	lui	a5,0xffff0
   10558:	00178793          	addi	a5,a5,1 # ffff0001 <__BSS_END__+0xfffdc651>
   1055c:	00f42623          	sw	a5,12(s0)
   10560:	06042223          	sw	zero,100(s0)
   10564:	00042023          	sw	zero,0(s0)
   10568:	00042423          	sw	zero,8(s0)
   1056c:	00042223          	sw	zero,4(s0)
   10570:	00042823          	sw	zero,16(s0)
   10574:	00042a23          	sw	zero,20(s0)
   10578:	00042c23          	sw	zero,24(s0)
   1057c:	00800613          	li	a2,8
   10580:	00000593          	li	a1,0
   10584:	05c40513          	addi	a0,s0,92
   10588:	60c000ef          	jal	10b94 <memset>
   1058c:	02042823          	sw	zero,48(s0)
   10590:	02042a23          	sw	zero,52(s0)
   10594:	04042223          	sw	zero,68(s0)
   10598:	04042423          	sw	zero,72(s0)
   1059c:	01c12083          	lw	ra,28(sp)
   105a0:	00040513          	mv	a0,s0
   105a4:	01812403          	lw	s0,24(sp)
   105a8:	01412483          	lw	s1,20(sp)
   105ac:	01012903          	lw	s2,16(sp)
   105b0:	00c12983          	lw	s3,12(sp)
   105b4:	02010113          	addi	sp,sp,32
   105b8:	00008067          	ret
   105bc:	00092403          	lw	s0,0(s2)
   105c0:	00040663          	beqz	s0,105cc <__sfp+0xd0>
   105c4:	00040913          	mv	s2,s0
   105c8:	f65ff06f          	j	1052c <__sfp+0x30>
   105cc:	1ac00593          	li	a1,428
   105d0:	00098513          	mv	a0,s3
   105d4:	421000ef          	jal	111f4 <_malloc_r>
   105d8:	00050413          	mv	s0,a0
   105dc:	02050c63          	beqz	a0,10614 <__sfp+0x118>
   105e0:	00c50513          	addi	a0,a0,12
   105e4:	00400793          	li	a5,4
   105e8:	00042023          	sw	zero,0(s0)
   105ec:	00f42223          	sw	a5,4(s0)
   105f0:	00a42423          	sw	a0,8(s0)
   105f4:	1a000613          	li	a2,416
   105f8:	00000593          	li	a1,0
   105fc:	598000ef          	jal	10b94 <memset>
   10600:	00892023          	sw	s0,0(s2)
   10604:	00040913          	mv	s2,s0
   10608:	f25ff06f          	j	1052c <__sfp+0x30>
   1060c:	d9dff0ef          	jal	103a8 <global_stdio_init.part.0>
   10610:	f11ff06f          	j	10520 <__sfp+0x24>
   10614:	00092023          	sw	zero,0(s2)
   10618:	00c00793          	li	a5,12
   1061c:	00f9a023          	sw	a5,0(s3)
   10620:	f7dff06f          	j	1059c <__sfp+0xa0>

00010624 <__sinit>:
   10624:	03452783          	lw	a5,52(a0)
   10628:	00078463          	beqz	a5,10630 <__sinit+0xc>
   1062c:	00008067          	ret
   10630:	d481a703          	lw	a4,-696(gp) # 13688 <__stdio_exit_handler>
   10634:	000107b7          	lui	a5,0x10
   10638:	33c78793          	addi	a5,a5,828 # 1033c <cleanup_stdio>
   1063c:	02f52a23          	sw	a5,52(a0)
   10640:	fe0716e3          	bnez	a4,1062c <__sinit+0x8>
   10644:	d65ff06f          	j	103a8 <global_stdio_init.part.0>

00010648 <__sfp_lock_acquire>:
   10648:	00008067          	ret

0001064c <__sfp_lock_release>:
   1064c:	00008067          	ret

00010650 <__fp_lock_all>:
   10650:	00013637          	lui	a2,0x13
   10654:	000105b7          	lui	a1,0x10
   10658:	14060613          	addi	a2,a2,320 # 13140 <__sglue>
   1065c:	31858593          	addi	a1,a1,792 # 10318 <__fp_lock>
   10660:	00000513          	li	a0,0
   10664:	01c0006f          	j	10680 <_fwalk_sglue>

00010668 <__fp_unlock_all>:
   10668:	00013637          	lui	a2,0x13
   1066c:	000105b7          	lui	a1,0x10
   10670:	14060613          	addi	a2,a2,320 # 13140 <__sglue>
   10674:	3a058593          	addi	a1,a1,928 # 103a0 <__fp_unlock>
   10678:	00000513          	li	a0,0
   1067c:	0040006f          	j	10680 <_fwalk_sglue>

00010680 <_fwalk_sglue>:
   10680:	fd010113          	addi	sp,sp,-48
   10684:	03212023          	sw	s2,32(sp)
   10688:	01312e23          	sw	s3,28(sp)
   1068c:	01412c23          	sw	s4,24(sp)
   10690:	01512a23          	sw	s5,20(sp)
   10694:	01612823          	sw	s6,16(sp)
   10698:	01712623          	sw	s7,12(sp)
   1069c:	02112623          	sw	ra,44(sp)
   106a0:	02812423          	sw	s0,40(sp)
   106a4:	02912223          	sw	s1,36(sp)
   106a8:	00050b13          	mv	s6,a0
   106ac:	00058b93          	mv	s7,a1
   106b0:	00060a93          	mv	s5,a2
   106b4:	00000a13          	li	s4,0
   106b8:	00100993          	li	s3,1
   106bc:	fff00913          	li	s2,-1
   106c0:	004aa483          	lw	s1,4(s5)
   106c4:	008aa403          	lw	s0,8(s5)
   106c8:	fff48493          	addi	s1,s1,-1
   106cc:	0204c863          	bltz	s1,106fc <_fwalk_sglue+0x7c>
   106d0:	00c45783          	lhu	a5,12(s0)
   106d4:	00f9fe63          	bgeu	s3,a5,106f0 <_fwalk_sglue+0x70>
   106d8:	00e41783          	lh	a5,14(s0)
   106dc:	00040593          	mv	a1,s0
   106e0:	000b0513          	mv	a0,s6
   106e4:	01278663          	beq	a5,s2,106f0 <_fwalk_sglue+0x70>
   106e8:	000b80e7          	jalr	s7
   106ec:	00aa6a33          	or	s4,s4,a0
   106f0:	fff48493          	addi	s1,s1,-1
   106f4:	06840413          	addi	s0,s0,104
   106f8:	fd249ce3          	bne	s1,s2,106d0 <_fwalk_sglue+0x50>
   106fc:	000aaa83          	lw	s5,0(s5)
   10700:	fc0a90e3          	bnez	s5,106c0 <_fwalk_sglue+0x40>
   10704:	02c12083          	lw	ra,44(sp)
   10708:	02812403          	lw	s0,40(sp)
   1070c:	02412483          	lw	s1,36(sp)
   10710:	02012903          	lw	s2,32(sp)
   10714:	01c12983          	lw	s3,28(sp)
   10718:	01412a83          	lw	s5,20(sp)
   1071c:	01012b03          	lw	s6,16(sp)
   10720:	00c12b83          	lw	s7,12(sp)
   10724:	000a0513          	mv	a0,s4
   10728:	01812a03          	lw	s4,24(sp)
   1072c:	03010113          	addi	sp,sp,48
   10730:	00008067          	ret

00010734 <__sread>:
   10734:	ff010113          	addi	sp,sp,-16
   10738:	00812423          	sw	s0,8(sp)
   1073c:	00058413          	mv	s0,a1
   10740:	00e59583          	lh	a1,14(a1)
   10744:	00112623          	sw	ra,12(sp)
   10748:	2e0000ef          	jal	10a28 <_read_r>
   1074c:	02054063          	bltz	a0,1076c <__sread+0x38>
   10750:	05042783          	lw	a5,80(s0)
   10754:	00c12083          	lw	ra,12(sp)
   10758:	00a787b3          	add	a5,a5,a0
   1075c:	04f42823          	sw	a5,80(s0)
   10760:	00812403          	lw	s0,8(sp)
   10764:	01010113          	addi	sp,sp,16
   10768:	00008067          	ret
   1076c:	00c45783          	lhu	a5,12(s0)
   10770:	fffff737          	lui	a4,0xfffff
   10774:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffeb64f>
   10778:	00e7f7b3          	and	a5,a5,a4
   1077c:	00c12083          	lw	ra,12(sp)
   10780:	00f41623          	sh	a5,12(s0)
   10784:	00812403          	lw	s0,8(sp)
   10788:	01010113          	addi	sp,sp,16
   1078c:	00008067          	ret

00010790 <__seofread>:
   10790:	00000513          	li	a0,0
   10794:	00008067          	ret

00010798 <__swrite>:
   10798:	00c59783          	lh	a5,12(a1)
   1079c:	fe010113          	addi	sp,sp,-32
   107a0:	00812c23          	sw	s0,24(sp)
   107a4:	00912a23          	sw	s1,20(sp)
   107a8:	01212823          	sw	s2,16(sp)
   107ac:	01312623          	sw	s3,12(sp)
   107b0:	00112e23          	sw	ra,28(sp)
   107b4:	1007f713          	andi	a4,a5,256
   107b8:	00058413          	mv	s0,a1
   107bc:	00050493          	mv	s1,a0
   107c0:	00060913          	mv	s2,a2
   107c4:	00068993          	mv	s3,a3
   107c8:	04071063          	bnez	a4,10808 <__swrite+0x70>
   107cc:	fffff737          	lui	a4,0xfffff
   107d0:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffeb64f>
   107d4:	00e7f7b3          	and	a5,a5,a4
   107d8:	00e41583          	lh	a1,14(s0)
   107dc:	00f41623          	sh	a5,12(s0)
   107e0:	01812403          	lw	s0,24(sp)
   107e4:	01c12083          	lw	ra,28(sp)
   107e8:	00098693          	mv	a3,s3
   107ec:	00090613          	mv	a2,s2
   107f0:	00c12983          	lw	s3,12(sp)
   107f4:	01012903          	lw	s2,16(sp)
   107f8:	00048513          	mv	a0,s1
   107fc:	01412483          	lw	s1,20(sp)
   10800:	02010113          	addi	sp,sp,32
   10804:	28c0006f          	j	10a90 <_write_r>
   10808:	00e59583          	lh	a1,14(a1)
   1080c:	00200693          	li	a3,2
   10810:	00000613          	li	a2,0
   10814:	1ac000ef          	jal	109c0 <_lseek_r>
   10818:	00c41783          	lh	a5,12(s0)
   1081c:	fb1ff06f          	j	107cc <__swrite+0x34>

00010820 <__sseek>:
   10820:	ff010113          	addi	sp,sp,-16
   10824:	00812423          	sw	s0,8(sp)
   10828:	00058413          	mv	s0,a1
   1082c:	00e59583          	lh	a1,14(a1)
   10830:	00112623          	sw	ra,12(sp)
   10834:	18c000ef          	jal	109c0 <_lseek_r>
   10838:	fff00793          	li	a5,-1
   1083c:	02f50863          	beq	a0,a5,1086c <__sseek+0x4c>
   10840:	00c45783          	lhu	a5,12(s0)
   10844:	00001737          	lui	a4,0x1
   10848:	00c12083          	lw	ra,12(sp)
   1084c:	00e7e7b3          	or	a5,a5,a4
   10850:	01079793          	slli	a5,a5,0x10
   10854:	4107d793          	srai	a5,a5,0x10
   10858:	04a42823          	sw	a0,80(s0)
   1085c:	00f41623          	sh	a5,12(s0)
   10860:	00812403          	lw	s0,8(sp)
   10864:	01010113          	addi	sp,sp,16
   10868:	00008067          	ret
   1086c:	00c45783          	lhu	a5,12(s0)
   10870:	fffff737          	lui	a4,0xfffff
   10874:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffeb64f>
   10878:	00e7f7b3          	and	a5,a5,a4
   1087c:	01079793          	slli	a5,a5,0x10
   10880:	4107d793          	srai	a5,a5,0x10
   10884:	00c12083          	lw	ra,12(sp)
   10888:	00f41623          	sh	a5,12(s0)
   1088c:	00812403          	lw	s0,8(sp)
   10890:	01010113          	addi	sp,sp,16
   10894:	00008067          	ret

00010898 <__sclose>:
   10898:	00e59583          	lh	a1,14(a1)
   1089c:	0040006f          	j	108a0 <_close_r>

000108a0 <_close_r>:
   108a0:	ff010113          	addi	sp,sp,-16
   108a4:	00812423          	sw	s0,8(sp)
   108a8:	00912223          	sw	s1,4(sp)
   108ac:	00050413          	mv	s0,a0
   108b0:	00058513          	mv	a0,a1
   108b4:	00112623          	sw	ra,12(sp)
   108b8:	d401a623          	sw	zero,-692(gp) # 1368c <errno>
   108bc:	690010ef          	jal	11f4c <_close>
   108c0:	fff00793          	li	a5,-1
   108c4:	00f50c63          	beq	a0,a5,108dc <_close_r+0x3c>
   108c8:	00c12083          	lw	ra,12(sp)
   108cc:	00812403          	lw	s0,8(sp)
   108d0:	00412483          	lw	s1,4(sp)
   108d4:	01010113          	addi	sp,sp,16
   108d8:	00008067          	ret
   108dc:	d4c1a783          	lw	a5,-692(gp) # 1368c <errno>
   108e0:	fe0784e3          	beqz	a5,108c8 <_close_r+0x28>
   108e4:	00c12083          	lw	ra,12(sp)
   108e8:	00f42023          	sw	a5,0(s0)
   108ec:	00812403          	lw	s0,8(sp)
   108f0:	00412483          	lw	s1,4(sp)
   108f4:	01010113          	addi	sp,sp,16
   108f8:	00008067          	ret

000108fc <_reclaim_reent>:
   108fc:	d3c1a783          	lw	a5,-708(gp) # 1367c <_impure_ptr>
   10900:	0aa78e63          	beq	a5,a0,109bc <_reclaim_reent+0xc0>
   10904:	04452583          	lw	a1,68(a0)
   10908:	fe010113          	addi	sp,sp,-32
   1090c:	00912a23          	sw	s1,20(sp)
   10910:	00112e23          	sw	ra,28(sp)
   10914:	00050493          	mv	s1,a0
   10918:	04058c63          	beqz	a1,10970 <_reclaim_reent+0x74>
   1091c:	01212823          	sw	s2,16(sp)
   10920:	01312623          	sw	s3,12(sp)
   10924:	00812c23          	sw	s0,24(sp)
   10928:	00000913          	li	s2,0
   1092c:	08000993          	li	s3,128
   10930:	012587b3          	add	a5,a1,s2
   10934:	0007a403          	lw	s0,0(a5)
   10938:	00040e63          	beqz	s0,10954 <_reclaim_reent+0x58>
   1093c:	00040593          	mv	a1,s0
   10940:	00042403          	lw	s0,0(s0)
   10944:	00048513          	mv	a0,s1
   10948:	5a8000ef          	jal	10ef0 <_free_r>
   1094c:	fe0418e3          	bnez	s0,1093c <_reclaim_reent+0x40>
   10950:	0444a583          	lw	a1,68(s1)
   10954:	00490913          	addi	s2,s2,4
   10958:	fd391ce3          	bne	s2,s3,10930 <_reclaim_reent+0x34>
   1095c:	00048513          	mv	a0,s1
   10960:	590000ef          	jal	10ef0 <_free_r>
   10964:	01812403          	lw	s0,24(sp)
   10968:	01012903          	lw	s2,16(sp)
   1096c:	00c12983          	lw	s3,12(sp)
   10970:	0384a583          	lw	a1,56(s1)
   10974:	00058663          	beqz	a1,10980 <_reclaim_reent+0x84>
   10978:	00048513          	mv	a0,s1
   1097c:	574000ef          	jal	10ef0 <_free_r>
   10980:	04c4a583          	lw	a1,76(s1)
   10984:	00058663          	beqz	a1,10990 <_reclaim_reent+0x94>
   10988:	00048513          	mv	a0,s1
   1098c:	564000ef          	jal	10ef0 <_free_r>
   10990:	0344a783          	lw	a5,52(s1)
   10994:	00078c63          	beqz	a5,109ac <_reclaim_reent+0xb0>
   10998:	01c12083          	lw	ra,28(sp)
   1099c:	00048513          	mv	a0,s1
   109a0:	01412483          	lw	s1,20(sp)
   109a4:	02010113          	addi	sp,sp,32
   109a8:	00078067          	jr	a5
   109ac:	01c12083          	lw	ra,28(sp)
   109b0:	01412483          	lw	s1,20(sp)
   109b4:	02010113          	addi	sp,sp,32
   109b8:	00008067          	ret
   109bc:	00008067          	ret

000109c0 <_lseek_r>:
   109c0:	ff010113          	addi	sp,sp,-16
   109c4:	00058713          	mv	a4,a1
   109c8:	00812423          	sw	s0,8(sp)
   109cc:	00912223          	sw	s1,4(sp)
   109d0:	00060593          	mv	a1,a2
   109d4:	00050413          	mv	s0,a0
   109d8:	00068613          	mv	a2,a3
   109dc:	00070513          	mv	a0,a4
   109e0:	00112623          	sw	ra,12(sp)
   109e4:	d401a623          	sw	zero,-692(gp) # 1368c <errno>
   109e8:	5d8010ef          	jal	11fc0 <_lseek>
   109ec:	fff00793          	li	a5,-1
   109f0:	00f50c63          	beq	a0,a5,10a08 <_lseek_r+0x48>
   109f4:	00c12083          	lw	ra,12(sp)
   109f8:	00812403          	lw	s0,8(sp)
   109fc:	00412483          	lw	s1,4(sp)
   10a00:	01010113          	addi	sp,sp,16
   10a04:	00008067          	ret
   10a08:	d4c1a783          	lw	a5,-692(gp) # 1368c <errno>
   10a0c:	fe0784e3          	beqz	a5,109f4 <_lseek_r+0x34>
   10a10:	00c12083          	lw	ra,12(sp)
   10a14:	00f42023          	sw	a5,0(s0)
   10a18:	00812403          	lw	s0,8(sp)
   10a1c:	00412483          	lw	s1,4(sp)
   10a20:	01010113          	addi	sp,sp,16
   10a24:	00008067          	ret

00010a28 <_read_r>:
   10a28:	ff010113          	addi	sp,sp,-16
   10a2c:	00058713          	mv	a4,a1
   10a30:	00812423          	sw	s0,8(sp)
   10a34:	00912223          	sw	s1,4(sp)
   10a38:	00060593          	mv	a1,a2
   10a3c:	00050413          	mv	s0,a0
   10a40:	00068613          	mv	a2,a3
   10a44:	00070513          	mv	a0,a4
   10a48:	00112623          	sw	ra,12(sp)
   10a4c:	d401a623          	sw	zero,-692(gp) # 1368c <errno>
   10a50:	5b4010ef          	jal	12004 <_read>
   10a54:	fff00793          	li	a5,-1
   10a58:	00f50c63          	beq	a0,a5,10a70 <_read_r+0x48>
   10a5c:	00c12083          	lw	ra,12(sp)
   10a60:	00812403          	lw	s0,8(sp)
   10a64:	00412483          	lw	s1,4(sp)
   10a68:	01010113          	addi	sp,sp,16
   10a6c:	00008067          	ret
   10a70:	d4c1a783          	lw	a5,-692(gp) # 1368c <errno>
   10a74:	fe0784e3          	beqz	a5,10a5c <_read_r+0x34>
   10a78:	00c12083          	lw	ra,12(sp)
   10a7c:	00f42023          	sw	a5,0(s0)
   10a80:	00812403          	lw	s0,8(sp)
   10a84:	00412483          	lw	s1,4(sp)
   10a88:	01010113          	addi	sp,sp,16
   10a8c:	00008067          	ret

00010a90 <_write_r>:
   10a90:	ff010113          	addi	sp,sp,-16
   10a94:	00058713          	mv	a4,a1
   10a98:	00812423          	sw	s0,8(sp)
   10a9c:	00912223          	sw	s1,4(sp)
   10aa0:	00060593          	mv	a1,a2
   10aa4:	00050413          	mv	s0,a0
   10aa8:	00068613          	mv	a2,a3
   10aac:	00070513          	mv	a0,a4
   10ab0:	00112623          	sw	ra,12(sp)
   10ab4:	d401a623          	sw	zero,-692(gp) # 1368c <errno>
   10ab8:	608010ef          	jal	120c0 <_write>
   10abc:	fff00793          	li	a5,-1
   10ac0:	00f50c63          	beq	a0,a5,10ad8 <_write_r+0x48>
   10ac4:	00c12083          	lw	ra,12(sp)
   10ac8:	00812403          	lw	s0,8(sp)
   10acc:	00412483          	lw	s1,4(sp)
   10ad0:	01010113          	addi	sp,sp,16
   10ad4:	00008067          	ret
   10ad8:	d4c1a783          	lw	a5,-692(gp) # 1368c <errno>
   10adc:	fe0784e3          	beqz	a5,10ac4 <_write_r+0x34>
   10ae0:	00c12083          	lw	ra,12(sp)
   10ae4:	00f42023          	sw	a5,0(s0)
   10ae8:	00812403          	lw	s0,8(sp)
   10aec:	00412483          	lw	s1,4(sp)
   10af0:	01010113          	addi	sp,sp,16
   10af4:	00008067          	ret

00010af8 <__libc_init_array>:
   10af8:	ff010113          	addi	sp,sp,-16
   10afc:	00812423          	sw	s0,8(sp)
   10b00:	000137b7          	lui	a5,0x13
   10b04:	00013437          	lui	s0,0x13
   10b08:	01212023          	sw	s2,0(sp)
   10b0c:	13478793          	addi	a5,a5,308 # 13134 <__init_array_start>
   10b10:	13440713          	addi	a4,s0,308 # 13134 <__init_array_start>
   10b14:	00112623          	sw	ra,12(sp)
   10b18:	00912223          	sw	s1,4(sp)
   10b1c:	40e78933          	sub	s2,a5,a4
   10b20:	02e78263          	beq	a5,a4,10b44 <__libc_init_array+0x4c>
   10b24:	40295913          	srai	s2,s2,0x2
   10b28:	13440413          	addi	s0,s0,308
   10b2c:	00000493          	li	s1,0
   10b30:	00042783          	lw	a5,0(s0)
   10b34:	00148493          	addi	s1,s1,1
   10b38:	00440413          	addi	s0,s0,4
   10b3c:	000780e7          	jalr	a5
   10b40:	ff24e8e3          	bltu	s1,s2,10b30 <__libc_init_array+0x38>
   10b44:	00013437          	lui	s0,0x13
   10b48:	000137b7          	lui	a5,0x13
   10b4c:	13c78793          	addi	a5,a5,316 # 1313c <__do_global_dtors_aux_fini_array_entry>
   10b50:	13440713          	addi	a4,s0,308 # 13134 <__init_array_start>
   10b54:	40e78933          	sub	s2,a5,a4
   10b58:	40295913          	srai	s2,s2,0x2
   10b5c:	02e78063          	beq	a5,a4,10b7c <__libc_init_array+0x84>
   10b60:	13440413          	addi	s0,s0,308
   10b64:	00000493          	li	s1,0
   10b68:	00042783          	lw	a5,0(s0)
   10b6c:	00148493          	addi	s1,s1,1
   10b70:	00440413          	addi	s0,s0,4
   10b74:	000780e7          	jalr	a5
   10b78:	ff24e8e3          	bltu	s1,s2,10b68 <__libc_init_array+0x70>
   10b7c:	00c12083          	lw	ra,12(sp)
   10b80:	00812403          	lw	s0,8(sp)
   10b84:	00412483          	lw	s1,4(sp)
   10b88:	00012903          	lw	s2,0(sp)
   10b8c:	01010113          	addi	sp,sp,16
   10b90:	00008067          	ret

00010b94 <memset>:
   10b94:	00f00313          	li	t1,15
   10b98:	00050713          	mv	a4,a0
   10b9c:	02c37e63          	bgeu	t1,a2,10bd8 <memset+0x44>
   10ba0:	00f77793          	andi	a5,a4,15
   10ba4:	0a079063          	bnez	a5,10c44 <memset+0xb0>
   10ba8:	08059263          	bnez	a1,10c2c <memset+0x98>
   10bac:	ff067693          	andi	a3,a2,-16
   10bb0:	00f67613          	andi	a2,a2,15
   10bb4:	00e686b3          	add	a3,a3,a4
   10bb8:	00b72023          	sw	a1,0(a4)
   10bbc:	00b72223          	sw	a1,4(a4)
   10bc0:	00b72423          	sw	a1,8(a4)
   10bc4:	00b72623          	sw	a1,12(a4)
   10bc8:	01070713          	addi	a4,a4,16
   10bcc:	fed766e3          	bltu	a4,a3,10bb8 <memset+0x24>
   10bd0:	00061463          	bnez	a2,10bd8 <memset+0x44>
   10bd4:	00008067          	ret
   10bd8:	40c306b3          	sub	a3,t1,a2
   10bdc:	00269693          	slli	a3,a3,0x2
   10be0:	00000297          	auipc	t0,0x0
   10be4:	005686b3          	add	a3,a3,t0
   10be8:	00c68067          	jr	12(a3)
   10bec:	00b70723          	sb	a1,14(a4)
   10bf0:	00b706a3          	sb	a1,13(a4)
   10bf4:	00b70623          	sb	a1,12(a4)
   10bf8:	00b705a3          	sb	a1,11(a4)
   10bfc:	00b70523          	sb	a1,10(a4)
   10c00:	00b704a3          	sb	a1,9(a4)
   10c04:	00b70423          	sb	a1,8(a4)
   10c08:	00b703a3          	sb	a1,7(a4)
   10c0c:	00b70323          	sb	a1,6(a4)
   10c10:	00b702a3          	sb	a1,5(a4)
   10c14:	00b70223          	sb	a1,4(a4)
   10c18:	00b701a3          	sb	a1,3(a4)
   10c1c:	00b70123          	sb	a1,2(a4)
   10c20:	00b700a3          	sb	a1,1(a4)
   10c24:	00b70023          	sb	a1,0(a4)
   10c28:	00008067          	ret
   10c2c:	0ff5f593          	zext.b	a1,a1
   10c30:	00859693          	slli	a3,a1,0x8
   10c34:	00d5e5b3          	or	a1,a1,a3
   10c38:	01059693          	slli	a3,a1,0x10
   10c3c:	00d5e5b3          	or	a1,a1,a3
   10c40:	f6dff06f          	j	10bac <memset+0x18>
   10c44:	00279693          	slli	a3,a5,0x2
   10c48:	00000297          	auipc	t0,0x0
   10c4c:	005686b3          	add	a3,a3,t0
   10c50:	00008293          	mv	t0,ra
   10c54:	fa0680e7          	jalr	-96(a3)
   10c58:	00028093          	mv	ra,t0
   10c5c:	ff078793          	addi	a5,a5,-16
   10c60:	40f70733          	sub	a4,a4,a5
   10c64:	00f60633          	add	a2,a2,a5
   10c68:	f6c378e3          	bgeu	t1,a2,10bd8 <memset+0x44>
   10c6c:	f3dff06f          	j	10ba8 <memset+0x14>

00010c70 <__call_exitprocs>:
   10c70:	fd010113          	addi	sp,sp,-48
   10c74:	01412c23          	sw	s4,24(sp)
   10c78:	03212023          	sw	s2,32(sp)
   10c7c:	d501a903          	lw	s2,-688(gp) # 13690 <__atexit>
   10c80:	02112623          	sw	ra,44(sp)
   10c84:	0a090863          	beqz	s2,10d34 <__call_exitprocs+0xc4>
   10c88:	01312e23          	sw	s3,28(sp)
   10c8c:	01512a23          	sw	s5,20(sp)
   10c90:	01612823          	sw	s6,16(sp)
   10c94:	01712623          	sw	s7,12(sp)
   10c98:	02812423          	sw	s0,40(sp)
   10c9c:	02912223          	sw	s1,36(sp)
   10ca0:	01812423          	sw	s8,8(sp)
   10ca4:	00050b13          	mv	s6,a0
   10ca8:	00058b93          	mv	s7,a1
   10cac:	fff00993          	li	s3,-1
   10cb0:	00100a93          	li	s5,1
   10cb4:	00492483          	lw	s1,4(s2)
   10cb8:	fff48413          	addi	s0,s1,-1
   10cbc:	04044e63          	bltz	s0,10d18 <__call_exitprocs+0xa8>
   10cc0:	00249493          	slli	s1,s1,0x2
   10cc4:	009904b3          	add	s1,s2,s1
   10cc8:	080b9063          	bnez	s7,10d48 <__call_exitprocs+0xd8>
   10ccc:	00492783          	lw	a5,4(s2)
   10cd0:	0044a683          	lw	a3,4(s1)
   10cd4:	fff78793          	addi	a5,a5,-1
   10cd8:	0a878c63          	beq	a5,s0,10d90 <__call_exitprocs+0x120>
   10cdc:	0004a223          	sw	zero,4(s1)
   10ce0:	02068663          	beqz	a3,10d0c <__call_exitprocs+0x9c>
   10ce4:	18892783          	lw	a5,392(s2)
   10ce8:	008a9733          	sll	a4,s5,s0
   10cec:	00492c03          	lw	s8,4(s2)
   10cf0:	00f777b3          	and	a5,a4,a5
   10cf4:	06079663          	bnez	a5,10d60 <__call_exitprocs+0xf0>
   10cf8:	000680e7          	jalr	a3
   10cfc:	00492703          	lw	a4,4(s2)
   10d00:	d501a783          	lw	a5,-688(gp) # 13690 <__atexit>
   10d04:	09871063          	bne	a4,s8,10d84 <__call_exitprocs+0x114>
   10d08:	07279e63          	bne	a5,s2,10d84 <__call_exitprocs+0x114>
   10d0c:	fff40413          	addi	s0,s0,-1
   10d10:	ffc48493          	addi	s1,s1,-4
   10d14:	fb341ae3          	bne	s0,s3,10cc8 <__call_exitprocs+0x58>
   10d18:	02812403          	lw	s0,40(sp)
   10d1c:	02412483          	lw	s1,36(sp)
   10d20:	01c12983          	lw	s3,28(sp)
   10d24:	01412a83          	lw	s5,20(sp)
   10d28:	01012b03          	lw	s6,16(sp)
   10d2c:	00c12b83          	lw	s7,12(sp)
   10d30:	00812c03          	lw	s8,8(sp)
   10d34:	02c12083          	lw	ra,44(sp)
   10d38:	02012903          	lw	s2,32(sp)
   10d3c:	01812a03          	lw	s4,24(sp)
   10d40:	03010113          	addi	sp,sp,48
   10d44:	00008067          	ret
   10d48:	1044a783          	lw	a5,260(s1)
   10d4c:	f97780e3          	beq	a5,s7,10ccc <__call_exitprocs+0x5c>
   10d50:	fff40413          	addi	s0,s0,-1
   10d54:	ffc48493          	addi	s1,s1,-4
   10d58:	ff3418e3          	bne	s0,s3,10d48 <__call_exitprocs+0xd8>
   10d5c:	fbdff06f          	j	10d18 <__call_exitprocs+0xa8>
   10d60:	18c92783          	lw	a5,396(s2)
   10d64:	0844a583          	lw	a1,132(s1)
   10d68:	00f77733          	and	a4,a4,a5
   10d6c:	02071663          	bnez	a4,10d98 <__call_exitprocs+0x128>
   10d70:	000b0513          	mv	a0,s6
   10d74:	000680e7          	jalr	a3
   10d78:	00492703          	lw	a4,4(s2)
   10d7c:	d501a783          	lw	a5,-688(gp) # 13690 <__atexit>
   10d80:	f98704e3          	beq	a4,s8,10d08 <__call_exitprocs+0x98>
   10d84:	f8078ae3          	beqz	a5,10d18 <__call_exitprocs+0xa8>
   10d88:	00078913          	mv	s2,a5
   10d8c:	f29ff06f          	j	10cb4 <__call_exitprocs+0x44>
   10d90:	00892223          	sw	s0,4(s2)
   10d94:	f4dff06f          	j	10ce0 <__call_exitprocs+0x70>
   10d98:	00058513          	mv	a0,a1
   10d9c:	000680e7          	jalr	a3
   10da0:	f5dff06f          	j	10cfc <__call_exitprocs+0x8c>

00010da4 <atexit>:
   10da4:	00050593          	mv	a1,a0
   10da8:	00000693          	li	a3,0
   10dac:	00000613          	li	a2,0
   10db0:	00000513          	li	a0,0
   10db4:	1000106f          	j	11eb4 <__register_exitproc>

00010db8 <_malloc_trim_r>:
   10db8:	fe010113          	addi	sp,sp,-32
   10dbc:	01312623          	sw	s3,12(sp)
   10dc0:	000139b7          	lui	s3,0x13
   10dc4:	00812c23          	sw	s0,24(sp)
   10dc8:	00912a23          	sw	s1,20(sp)
   10dcc:	01212823          	sw	s2,16(sp)
   10dd0:	01412423          	sw	s4,8(sp)
   10dd4:	00112e23          	sw	ra,28(sp)
   10dd8:	00058a13          	mv	s4,a1
   10ddc:	00050913          	mv	s2,a0
   10de0:	27098993          	addi	s3,s3,624 # 13270 <__malloc_av_>
   10de4:	3cd000ef          	jal	119b0 <__malloc_lock>
   10de8:	0089a703          	lw	a4,8(s3)
   10dec:	000017b7          	lui	a5,0x1
   10df0:	fef78793          	addi	a5,a5,-17 # fef <exit-0xf0a5>
   10df4:	00472483          	lw	s1,4(a4)
   10df8:	00001737          	lui	a4,0x1
   10dfc:	ffc4f493          	andi	s1,s1,-4
   10e00:	00f48433          	add	s0,s1,a5
   10e04:	41440433          	sub	s0,s0,s4
   10e08:	00c45413          	srli	s0,s0,0xc
   10e0c:	fff40413          	addi	s0,s0,-1
   10e10:	00c41413          	slli	s0,s0,0xc
   10e14:	00e44e63          	blt	s0,a4,10e30 <_malloc_trim_r+0x78>
   10e18:	00000593          	li	a1,0
   10e1c:	00090513          	mv	a0,s2
   10e20:	7dd000ef          	jal	11dfc <_sbrk_r>
   10e24:	0089a783          	lw	a5,8(s3)
   10e28:	009787b3          	add	a5,a5,s1
   10e2c:	02f50863          	beq	a0,a5,10e5c <_malloc_trim_r+0xa4>
   10e30:	00090513          	mv	a0,s2
   10e34:	381000ef          	jal	119b4 <__malloc_unlock>
   10e38:	01c12083          	lw	ra,28(sp)
   10e3c:	01812403          	lw	s0,24(sp)
   10e40:	01412483          	lw	s1,20(sp)
   10e44:	01012903          	lw	s2,16(sp)
   10e48:	00c12983          	lw	s3,12(sp)
   10e4c:	00812a03          	lw	s4,8(sp)
   10e50:	00000513          	li	a0,0
   10e54:	02010113          	addi	sp,sp,32
   10e58:	00008067          	ret
   10e5c:	408005b3          	neg	a1,s0
   10e60:	00090513          	mv	a0,s2
   10e64:	799000ef          	jal	11dfc <_sbrk_r>
   10e68:	fff00793          	li	a5,-1
   10e6c:	04f50863          	beq	a0,a5,10ebc <_malloc_trim_r+0x104>
   10e70:	eb818793          	addi	a5,gp,-328 # 137f8 <__malloc_current_mallinfo>
   10e74:	0007a703          	lw	a4,0(a5)
   10e78:	0089a683          	lw	a3,8(s3)
   10e7c:	408484b3          	sub	s1,s1,s0
   10e80:	0014e493          	ori	s1,s1,1
   10e84:	40870733          	sub	a4,a4,s0
   10e88:	00090513          	mv	a0,s2
   10e8c:	0096a223          	sw	s1,4(a3)
   10e90:	00e7a023          	sw	a4,0(a5)
   10e94:	321000ef          	jal	119b4 <__malloc_unlock>
   10e98:	01c12083          	lw	ra,28(sp)
   10e9c:	01812403          	lw	s0,24(sp)
   10ea0:	01412483          	lw	s1,20(sp)
   10ea4:	01012903          	lw	s2,16(sp)
   10ea8:	00c12983          	lw	s3,12(sp)
   10eac:	00812a03          	lw	s4,8(sp)
   10eb0:	00100513          	li	a0,1
   10eb4:	02010113          	addi	sp,sp,32
   10eb8:	00008067          	ret
   10ebc:	00000593          	li	a1,0
   10ec0:	00090513          	mv	a0,s2
   10ec4:	739000ef          	jal	11dfc <_sbrk_r>
   10ec8:	0089a703          	lw	a4,8(s3)
   10ecc:	00f00693          	li	a3,15
   10ed0:	40e507b3          	sub	a5,a0,a4
   10ed4:	f4f6dee3          	bge	a3,a5,10e30 <_malloc_trim_r+0x78>
   10ed8:	d401a683          	lw	a3,-704(gp) # 13680 <__malloc_sbrk_base>
   10edc:	0017e793          	ori	a5,a5,1
   10ee0:	00f72223          	sw	a5,4(a4) # 1004 <exit-0xf090>
   10ee4:	40d50533          	sub	a0,a0,a3
   10ee8:	eaa1ac23          	sw	a0,-328(gp) # 137f8 <__malloc_current_mallinfo>
   10eec:	f45ff06f          	j	10e30 <_malloc_trim_r+0x78>

00010ef0 <_free_r>:
   10ef0:	18058263          	beqz	a1,11074 <_free_r+0x184>
   10ef4:	ff010113          	addi	sp,sp,-16
   10ef8:	00812423          	sw	s0,8(sp)
   10efc:	00912223          	sw	s1,4(sp)
   10f00:	00058413          	mv	s0,a1
   10f04:	00050493          	mv	s1,a0
   10f08:	00112623          	sw	ra,12(sp)
   10f0c:	2a5000ef          	jal	119b0 <__malloc_lock>
   10f10:	ffc42503          	lw	a0,-4(s0)
   10f14:	ff840713          	addi	a4,s0,-8
   10f18:	000135b7          	lui	a1,0x13
   10f1c:	ffe57793          	andi	a5,a0,-2
   10f20:	00f70633          	add	a2,a4,a5
   10f24:	27058593          	addi	a1,a1,624 # 13270 <__malloc_av_>
   10f28:	00462683          	lw	a3,4(a2)
   10f2c:	0085a803          	lw	a6,8(a1)
   10f30:	ffc6f693          	andi	a3,a3,-4
   10f34:	1ac80263          	beq	a6,a2,110d8 <_free_r+0x1e8>
   10f38:	00d62223          	sw	a3,4(a2)
   10f3c:	00157513          	andi	a0,a0,1
   10f40:	00d60833          	add	a6,a2,a3
   10f44:	0a051063          	bnez	a0,10fe4 <_free_r+0xf4>
   10f48:	ff842303          	lw	t1,-8(s0)
   10f4c:	00482803          	lw	a6,4(a6)
   10f50:	00013537          	lui	a0,0x13
   10f54:	40670733          	sub	a4,a4,t1
   10f58:	00872883          	lw	a7,8(a4)
   10f5c:	27850513          	addi	a0,a0,632 # 13278 <__malloc_av_+0x8>
   10f60:	006787b3          	add	a5,a5,t1
   10f64:	00187813          	andi	a6,a6,1
   10f68:	14a88263          	beq	a7,a0,110ac <_free_r+0x1bc>
   10f6c:	00c72303          	lw	t1,12(a4)
   10f70:	0068a623          	sw	t1,12(a7)
   10f74:	01132423          	sw	a7,8(t1) # 10184 <frame_dummy+0x1c>
   10f78:	1a080663          	beqz	a6,11124 <_free_r+0x234>
   10f7c:	0017e693          	ori	a3,a5,1
   10f80:	00d72223          	sw	a3,4(a4)
   10f84:	00f62023          	sw	a5,0(a2)
   10f88:	1ff00693          	li	a3,511
   10f8c:	06f6ec63          	bltu	a3,a5,11004 <_free_r+0x114>
   10f90:	ff87f693          	andi	a3,a5,-8
   10f94:	00868693          	addi	a3,a3,8
   10f98:	0045a503          	lw	a0,4(a1)
   10f9c:	00d586b3          	add	a3,a1,a3
   10fa0:	0006a603          	lw	a2,0(a3)
   10fa4:	0057d813          	srli	a6,a5,0x5
   10fa8:	00100793          	li	a5,1
   10fac:	010797b3          	sll	a5,a5,a6
   10fb0:	00a7e7b3          	or	a5,a5,a0
   10fb4:	ff868513          	addi	a0,a3,-8
   10fb8:	00a72623          	sw	a0,12(a4)
   10fbc:	00c72423          	sw	a2,8(a4)
   10fc0:	00f5a223          	sw	a5,4(a1)
   10fc4:	00e6a023          	sw	a4,0(a3)
   10fc8:	00e62623          	sw	a4,12(a2)
   10fcc:	00812403          	lw	s0,8(sp)
   10fd0:	00c12083          	lw	ra,12(sp)
   10fd4:	00048513          	mv	a0,s1
   10fd8:	00412483          	lw	s1,4(sp)
   10fdc:	01010113          	addi	sp,sp,16
   10fe0:	1d50006f          	j	119b4 <__malloc_unlock>
   10fe4:	00482503          	lw	a0,4(a6)
   10fe8:	00157513          	andi	a0,a0,1
   10fec:	08050663          	beqz	a0,11078 <_free_r+0x188>
   10ff0:	0017e693          	ori	a3,a5,1
   10ff4:	fed42e23          	sw	a3,-4(s0)
   10ff8:	00f62023          	sw	a5,0(a2)
   10ffc:	1ff00693          	li	a3,511
   11000:	f8f6f8e3          	bgeu	a3,a5,10f90 <_free_r+0xa0>
   11004:	0097d693          	srli	a3,a5,0x9
   11008:	00400613          	li	a2,4
   1100c:	12d66063          	bltu	a2,a3,1112c <_free_r+0x23c>
   11010:	0067d693          	srli	a3,a5,0x6
   11014:	03968513          	addi	a0,a3,57
   11018:	03868613          	addi	a2,a3,56
   1101c:	00351513          	slli	a0,a0,0x3
   11020:	00a58533          	add	a0,a1,a0
   11024:	00052683          	lw	a3,0(a0)
   11028:	ff850513          	addi	a0,a0,-8
   1102c:	00d51863          	bne	a0,a3,1103c <_free_r+0x14c>
   11030:	1540006f          	j	11184 <_free_r+0x294>
   11034:	0086a683          	lw	a3,8(a3)
   11038:	00d50863          	beq	a0,a3,11048 <_free_r+0x158>
   1103c:	0046a603          	lw	a2,4(a3)
   11040:	ffc67613          	andi	a2,a2,-4
   11044:	fec7e8e3          	bltu	a5,a2,11034 <_free_r+0x144>
   11048:	00c6a503          	lw	a0,12(a3)
   1104c:	00a72623          	sw	a0,12(a4)
   11050:	00d72423          	sw	a3,8(a4)
   11054:	00812403          	lw	s0,8(sp)
   11058:	00e52423          	sw	a4,8(a0)
   1105c:	00c12083          	lw	ra,12(sp)
   11060:	00048513          	mv	a0,s1
   11064:	00412483          	lw	s1,4(sp)
   11068:	00e6a623          	sw	a4,12(a3)
   1106c:	01010113          	addi	sp,sp,16
   11070:	1450006f          	j	119b4 <__malloc_unlock>
   11074:	00008067          	ret
   11078:	00013537          	lui	a0,0x13
   1107c:	00d787b3          	add	a5,a5,a3
   11080:	27850513          	addi	a0,a0,632 # 13278 <__malloc_av_+0x8>
   11084:	00862683          	lw	a3,8(a2)
   11088:	0ca68c63          	beq	a3,a0,11160 <_free_r+0x270>
   1108c:	00c62803          	lw	a6,12(a2)
   11090:	0017e513          	ori	a0,a5,1
   11094:	00f70633          	add	a2,a4,a5
   11098:	0106a623          	sw	a6,12(a3)
   1109c:	00d82423          	sw	a3,8(a6)
   110a0:	00a72223          	sw	a0,4(a4)
   110a4:	00f62023          	sw	a5,0(a2)
   110a8:	ee1ff06f          	j	10f88 <_free_r+0x98>
   110ac:	12081c63          	bnez	a6,111e4 <_free_r+0x2f4>
   110b0:	00862583          	lw	a1,8(a2)
   110b4:	00c62603          	lw	a2,12(a2)
   110b8:	00f686b3          	add	a3,a3,a5
   110bc:	0016e793          	ori	a5,a3,1
   110c0:	00c5a623          	sw	a2,12(a1)
   110c4:	00b62423          	sw	a1,8(a2)
   110c8:	00f72223          	sw	a5,4(a4)
   110cc:	00d70733          	add	a4,a4,a3
   110d0:	00d72023          	sw	a3,0(a4)
   110d4:	ef9ff06f          	j	10fcc <_free_r+0xdc>
   110d8:	00157513          	andi	a0,a0,1
   110dc:	00d786b3          	add	a3,a5,a3
   110e0:	02051063          	bnez	a0,11100 <_free_r+0x210>
   110e4:	ff842503          	lw	a0,-8(s0)
   110e8:	40a70733          	sub	a4,a4,a0
   110ec:	00c72783          	lw	a5,12(a4)
   110f0:	00872603          	lw	a2,8(a4)
   110f4:	00a686b3          	add	a3,a3,a0
   110f8:	00f62623          	sw	a5,12(a2)
   110fc:	00c7a423          	sw	a2,8(a5)
   11100:	0016e613          	ori	a2,a3,1
   11104:	d441a783          	lw	a5,-700(gp) # 13684 <__malloc_trim_threshold>
   11108:	00c72223          	sw	a2,4(a4)
   1110c:	00e5a423          	sw	a4,8(a1)
   11110:	eaf6eee3          	bltu	a3,a5,10fcc <_free_r+0xdc>
   11114:	d5c1a583          	lw	a1,-676(gp) # 1369c <__malloc_top_pad>
   11118:	00048513          	mv	a0,s1
   1111c:	c9dff0ef          	jal	10db8 <_malloc_trim_r>
   11120:	eadff06f          	j	10fcc <_free_r+0xdc>
   11124:	00d787b3          	add	a5,a5,a3
   11128:	f5dff06f          	j	11084 <_free_r+0x194>
   1112c:	01400613          	li	a2,20
   11130:	02d67063          	bgeu	a2,a3,11150 <_free_r+0x260>
   11134:	05400613          	li	a2,84
   11138:	06d66463          	bltu	a2,a3,111a0 <_free_r+0x2b0>
   1113c:	00c7d693          	srli	a3,a5,0xc
   11140:	06f68513          	addi	a0,a3,111
   11144:	06e68613          	addi	a2,a3,110
   11148:	00351513          	slli	a0,a0,0x3
   1114c:	ed5ff06f          	j	11020 <_free_r+0x130>
   11150:	05c68513          	addi	a0,a3,92
   11154:	05b68613          	addi	a2,a3,91
   11158:	00351513          	slli	a0,a0,0x3
   1115c:	ec5ff06f          	j	11020 <_free_r+0x130>
   11160:	00e5aa23          	sw	a4,20(a1)
   11164:	00e5a823          	sw	a4,16(a1)
   11168:	0017e693          	ori	a3,a5,1
   1116c:	00a72623          	sw	a0,12(a4)
   11170:	00a72423          	sw	a0,8(a4)
   11174:	00d72223          	sw	a3,4(a4)
   11178:	00f70733          	add	a4,a4,a5
   1117c:	00f72023          	sw	a5,0(a4)
   11180:	e4dff06f          	j	10fcc <_free_r+0xdc>
   11184:	0045a803          	lw	a6,4(a1)
   11188:	40265613          	srai	a2,a2,0x2
   1118c:	00100793          	li	a5,1
   11190:	00c797b3          	sll	a5,a5,a2
   11194:	0107e7b3          	or	a5,a5,a6
   11198:	00f5a223          	sw	a5,4(a1)
   1119c:	eb1ff06f          	j	1104c <_free_r+0x15c>
   111a0:	15400613          	li	a2,340
   111a4:	00d66c63          	bltu	a2,a3,111bc <_free_r+0x2cc>
   111a8:	00f7d693          	srli	a3,a5,0xf
   111ac:	07868513          	addi	a0,a3,120
   111b0:	07768613          	addi	a2,a3,119
   111b4:	00351513          	slli	a0,a0,0x3
   111b8:	e69ff06f          	j	11020 <_free_r+0x130>
   111bc:	55400613          	li	a2,1364
   111c0:	00d66c63          	bltu	a2,a3,111d8 <_free_r+0x2e8>
   111c4:	0127d693          	srli	a3,a5,0x12
   111c8:	07d68513          	addi	a0,a3,125
   111cc:	07c68613          	addi	a2,a3,124
   111d0:	00351513          	slli	a0,a0,0x3
   111d4:	e4dff06f          	j	11020 <_free_r+0x130>
   111d8:	3f800513          	li	a0,1016
   111dc:	07e00613          	li	a2,126
   111e0:	e41ff06f          	j	11020 <_free_r+0x130>
   111e4:	0017e693          	ori	a3,a5,1
   111e8:	00d72223          	sw	a3,4(a4)
   111ec:	00f62023          	sw	a5,0(a2)
   111f0:	dddff06f          	j	10fcc <_free_r+0xdc>

000111f4 <_malloc_r>:
   111f4:	fd010113          	addi	sp,sp,-48
   111f8:	01312e23          	sw	s3,28(sp)
   111fc:	02112623          	sw	ra,44(sp)
   11200:	02812423          	sw	s0,40(sp)
   11204:	02912223          	sw	s1,36(sp)
   11208:	03212023          	sw	s2,32(sp)
   1120c:	00b58793          	addi	a5,a1,11
   11210:	01600713          	li	a4,22
   11214:	00050993          	mv	s3,a0
   11218:	08f76263          	bltu	a4,a5,1129c <_malloc_r+0xa8>
   1121c:	01000793          	li	a5,16
   11220:	20b7e663          	bltu	a5,a1,1142c <_malloc_r+0x238>
   11224:	78c000ef          	jal	119b0 <__malloc_lock>
   11228:	01800793          	li	a5,24
   1122c:	00200593          	li	a1,2
   11230:	01000493          	li	s1,16
   11234:	00013937          	lui	s2,0x13
   11238:	27090913          	addi	s2,s2,624 # 13270 <__malloc_av_>
   1123c:	00f907b3          	add	a5,s2,a5
   11240:	0047a403          	lw	s0,4(a5)
   11244:	ff878713          	addi	a4,a5,-8
   11248:	34e40463          	beq	s0,a4,11590 <_malloc_r+0x39c>
   1124c:	00442783          	lw	a5,4(s0)
   11250:	00c42683          	lw	a3,12(s0)
   11254:	00842603          	lw	a2,8(s0)
   11258:	ffc7f793          	andi	a5,a5,-4
   1125c:	00f407b3          	add	a5,s0,a5
   11260:	0047a703          	lw	a4,4(a5)
   11264:	00d62623          	sw	a3,12(a2)
   11268:	00c6a423          	sw	a2,8(a3)
   1126c:	00176713          	ori	a4,a4,1
   11270:	00098513          	mv	a0,s3
   11274:	00e7a223          	sw	a4,4(a5)
   11278:	73c000ef          	jal	119b4 <__malloc_unlock>
   1127c:	00840513          	addi	a0,s0,8
   11280:	02c12083          	lw	ra,44(sp)
   11284:	02812403          	lw	s0,40(sp)
   11288:	02412483          	lw	s1,36(sp)
   1128c:	02012903          	lw	s2,32(sp)
   11290:	01c12983          	lw	s3,28(sp)
   11294:	03010113          	addi	sp,sp,48
   11298:	00008067          	ret
   1129c:	ff87f493          	andi	s1,a5,-8
   112a0:	1807c663          	bltz	a5,1142c <_malloc_r+0x238>
   112a4:	18b4e463          	bltu	s1,a1,1142c <_malloc_r+0x238>
   112a8:	708000ef          	jal	119b0 <__malloc_lock>
   112ac:	1f700793          	li	a5,503
   112b0:	3e97fa63          	bgeu	a5,s1,116a4 <_malloc_r+0x4b0>
   112b4:	0094d793          	srli	a5,s1,0x9
   112b8:	18078263          	beqz	a5,1143c <_malloc_r+0x248>
   112bc:	00400713          	li	a4,4
   112c0:	34f76063          	bltu	a4,a5,11600 <_malloc_r+0x40c>
   112c4:	0064d793          	srli	a5,s1,0x6
   112c8:	03978593          	addi	a1,a5,57
   112cc:	03878813          	addi	a6,a5,56
   112d0:	00359613          	slli	a2,a1,0x3
   112d4:	00013937          	lui	s2,0x13
   112d8:	27090913          	addi	s2,s2,624 # 13270 <__malloc_av_>
   112dc:	00c90633          	add	a2,s2,a2
   112e0:	00462403          	lw	s0,4(a2)
   112e4:	ff860613          	addi	a2,a2,-8
   112e8:	02860863          	beq	a2,s0,11318 <_malloc_r+0x124>
   112ec:	00f00513          	li	a0,15
   112f0:	0140006f          	j	11304 <_malloc_r+0x110>
   112f4:	00c42683          	lw	a3,12(s0)
   112f8:	28075863          	bgez	a4,11588 <_malloc_r+0x394>
   112fc:	00d60e63          	beq	a2,a3,11318 <_malloc_r+0x124>
   11300:	00068413          	mv	s0,a3
   11304:	00442783          	lw	a5,4(s0)
   11308:	ffc7f793          	andi	a5,a5,-4
   1130c:	40978733          	sub	a4,a5,s1
   11310:	fee552e3          	bge	a0,a4,112f4 <_malloc_r+0x100>
   11314:	00080593          	mv	a1,a6
   11318:	01092403          	lw	s0,16(s2)
   1131c:	00013837          	lui	a6,0x13
   11320:	27880813          	addi	a6,a6,632 # 13278 <__malloc_av_+0x8>
   11324:	25040e63          	beq	s0,a6,11580 <_malloc_r+0x38c>
   11328:	00442783          	lw	a5,4(s0)
   1132c:	00f00693          	li	a3,15
   11330:	ffc7f793          	andi	a5,a5,-4
   11334:	40978733          	sub	a4,a5,s1
   11338:	36e6cc63          	blt	a3,a4,116b0 <_malloc_r+0x4bc>
   1133c:	01092a23          	sw	a6,20(s2)
   11340:	01092823          	sw	a6,16(s2)
   11344:	34075063          	bgez	a4,11684 <_malloc_r+0x490>
   11348:	1ff00713          	li	a4,511
   1134c:	00492503          	lw	a0,4(s2)
   11350:	24f76863          	bltu	a4,a5,115a0 <_malloc_r+0x3ac>
   11354:	ff87f713          	andi	a4,a5,-8
   11358:	00870713          	addi	a4,a4,8
   1135c:	00e90733          	add	a4,s2,a4
   11360:	00072683          	lw	a3,0(a4)
   11364:	0057d613          	srli	a2,a5,0x5
   11368:	00100793          	li	a5,1
   1136c:	00c797b3          	sll	a5,a5,a2
   11370:	00f56533          	or	a0,a0,a5
   11374:	ff870793          	addi	a5,a4,-8
   11378:	00f42623          	sw	a5,12(s0)
   1137c:	00d42423          	sw	a3,8(s0)
   11380:	00a92223          	sw	a0,4(s2)
   11384:	00872023          	sw	s0,0(a4)
   11388:	0086a623          	sw	s0,12(a3)
   1138c:	4025d793          	srai	a5,a1,0x2
   11390:	00100613          	li	a2,1
   11394:	00f61633          	sll	a2,a2,a5
   11398:	0ac56a63          	bltu	a0,a2,1144c <_malloc_r+0x258>
   1139c:	00a677b3          	and	a5,a2,a0
   113a0:	02079463          	bnez	a5,113c8 <_malloc_r+0x1d4>
   113a4:	00161613          	slli	a2,a2,0x1
   113a8:	ffc5f593          	andi	a1,a1,-4
   113ac:	00a677b3          	and	a5,a2,a0
   113b0:	00458593          	addi	a1,a1,4
   113b4:	00079a63          	bnez	a5,113c8 <_malloc_r+0x1d4>
   113b8:	00161613          	slli	a2,a2,0x1
   113bc:	00a677b3          	and	a5,a2,a0
   113c0:	00458593          	addi	a1,a1,4
   113c4:	fe078ae3          	beqz	a5,113b8 <_malloc_r+0x1c4>
   113c8:	00f00893          	li	a7,15
   113cc:	00359313          	slli	t1,a1,0x3
   113d0:	00690333          	add	t1,s2,t1
   113d4:	00030513          	mv	a0,t1
   113d8:	00c52783          	lw	a5,12(a0)
   113dc:	00058e13          	mv	t3,a1
   113e0:	24f50263          	beq	a0,a5,11624 <_malloc_r+0x430>
   113e4:	0047a703          	lw	a4,4(a5)
   113e8:	00078413          	mv	s0,a5
   113ec:	00c7a783          	lw	a5,12(a5)
   113f0:	ffc77713          	andi	a4,a4,-4
   113f4:	409706b3          	sub	a3,a4,s1
   113f8:	24d8c263          	blt	a7,a3,1163c <_malloc_r+0x448>
   113fc:	fe06c2e3          	bltz	a3,113e0 <_malloc_r+0x1ec>
   11400:	00e40733          	add	a4,s0,a4
   11404:	00472683          	lw	a3,4(a4)
   11408:	00842603          	lw	a2,8(s0)
   1140c:	00098513          	mv	a0,s3
   11410:	0016e693          	ori	a3,a3,1
   11414:	00d72223          	sw	a3,4(a4)
   11418:	00f62623          	sw	a5,12(a2)
   1141c:	00c7a423          	sw	a2,8(a5)
   11420:	594000ef          	jal	119b4 <__malloc_unlock>
   11424:	00840513          	addi	a0,s0,8
   11428:	e59ff06f          	j	11280 <_malloc_r+0x8c>
   1142c:	00c00793          	li	a5,12
   11430:	00f9a023          	sw	a5,0(s3)
   11434:	00000513          	li	a0,0
   11438:	e49ff06f          	j	11280 <_malloc_r+0x8c>
   1143c:	20000613          	li	a2,512
   11440:	04000593          	li	a1,64
   11444:	03f00813          	li	a6,63
   11448:	e8dff06f          	j	112d4 <_malloc_r+0xe0>
   1144c:	00892403          	lw	s0,8(s2)
   11450:	01612823          	sw	s6,16(sp)
   11454:	00442783          	lw	a5,4(s0)
   11458:	ffc7fb13          	andi	s6,a5,-4
   1145c:	009b6863          	bltu	s6,s1,1146c <_malloc_r+0x278>
   11460:	409b0733          	sub	a4,s6,s1
   11464:	00f00793          	li	a5,15
   11468:	0ce7ca63          	blt	a5,a4,1153c <_malloc_r+0x348>
   1146c:	01912223          	sw	s9,4(sp)
   11470:	01512a23          	sw	s5,20(sp)
   11474:	d401a703          	lw	a4,-704(gp) # 13680 <__malloc_sbrk_base>
   11478:	d5c1aa83          	lw	s5,-676(gp) # 1369c <__malloc_top_pad>
   1147c:	01412c23          	sw	s4,24(sp)
   11480:	01712623          	sw	s7,12(sp)
   11484:	fff00793          	li	a5,-1
   11488:	01640a33          	add	s4,s0,s6
   1148c:	01548ab3          	add	s5,s1,s5
   11490:	3cf70663          	beq	a4,a5,1185c <_malloc_r+0x668>
   11494:	000017b7          	lui	a5,0x1
   11498:	00f78793          	addi	a5,a5,15 # 100f <exit-0xf085>
   1149c:	00fa8ab3          	add	s5,s5,a5
   114a0:	fffff7b7          	lui	a5,0xfffff
   114a4:	00fafab3          	and	s5,s5,a5
   114a8:	000a8593          	mv	a1,s5
   114ac:	00098513          	mv	a0,s3
   114b0:	14d000ef          	jal	11dfc <_sbrk_r>
   114b4:	fff00793          	li	a5,-1
   114b8:	00050b93          	mv	s7,a0
   114bc:	44f50a63          	beq	a0,a5,11910 <_malloc_r+0x71c>
   114c0:	01812423          	sw	s8,8(sp)
   114c4:	23456e63          	bltu	a0,s4,11700 <_malloc_r+0x50c>
   114c8:	eb818c13          	addi	s8,gp,-328 # 137f8 <__malloc_current_mallinfo>
   114cc:	000c2583          	lw	a1,0(s8)
   114d0:	00ba85b3          	add	a1,s5,a1
   114d4:	00bc2023          	sw	a1,0(s8)
   114d8:	00058713          	mv	a4,a1
   114dc:	2aaa1663          	bne	s4,a0,11788 <_malloc_r+0x594>
   114e0:	01451793          	slli	a5,a0,0x14
   114e4:	2a079263          	bnez	a5,11788 <_malloc_r+0x594>
   114e8:	00892b83          	lw	s7,8(s2)
   114ec:	015b07b3          	add	a5,s6,s5
   114f0:	0017e793          	ori	a5,a5,1
   114f4:	00fba223          	sw	a5,4(s7)
   114f8:	d581a683          	lw	a3,-680(gp) # 13698 <__malloc_max_sbrked_mem>
   114fc:	00b6f463          	bgeu	a3,a1,11504 <_malloc_r+0x310>
   11500:	d4b1ac23          	sw	a1,-680(gp) # 13698 <__malloc_max_sbrked_mem>
   11504:	d541a683          	lw	a3,-684(gp) # 13694 <__malloc_max_total_mem>
   11508:	00b6f463          	bgeu	a3,a1,11510 <_malloc_r+0x31c>
   1150c:	d4b1aa23          	sw	a1,-684(gp) # 13694 <__malloc_max_total_mem>
   11510:	00812c03          	lw	s8,8(sp)
   11514:	000b8413          	mv	s0,s7
   11518:	ffc7f793          	andi	a5,a5,-4
   1151c:	40978733          	sub	a4,a5,s1
   11520:	3897ea63          	bltu	a5,s1,118b4 <_malloc_r+0x6c0>
   11524:	00f00793          	li	a5,15
   11528:	38e7d663          	bge	a5,a4,118b4 <_malloc_r+0x6c0>
   1152c:	01812a03          	lw	s4,24(sp)
   11530:	01412a83          	lw	s5,20(sp)
   11534:	00c12b83          	lw	s7,12(sp)
   11538:	00412c83          	lw	s9,4(sp)
   1153c:	0014e793          	ori	a5,s1,1
   11540:	00f42223          	sw	a5,4(s0)
   11544:	009404b3          	add	s1,s0,s1
   11548:	00992423          	sw	s1,8(s2)
   1154c:	00176713          	ori	a4,a4,1
   11550:	00098513          	mv	a0,s3
   11554:	00e4a223          	sw	a4,4(s1)
   11558:	45c000ef          	jal	119b4 <__malloc_unlock>
   1155c:	02c12083          	lw	ra,44(sp)
   11560:	00840513          	addi	a0,s0,8
   11564:	02812403          	lw	s0,40(sp)
   11568:	01012b03          	lw	s6,16(sp)
   1156c:	02412483          	lw	s1,36(sp)
   11570:	02012903          	lw	s2,32(sp)
   11574:	01c12983          	lw	s3,28(sp)
   11578:	03010113          	addi	sp,sp,48
   1157c:	00008067          	ret
   11580:	00492503          	lw	a0,4(s2)
   11584:	e09ff06f          	j	1138c <_malloc_r+0x198>
   11588:	00842603          	lw	a2,8(s0)
   1158c:	cd1ff06f          	j	1125c <_malloc_r+0x68>
   11590:	00c7a403          	lw	s0,12(a5) # fffff00c <__BSS_END__+0xfffeb65c>
   11594:	00258593          	addi	a1,a1,2
   11598:	d88780e3          	beq	a5,s0,11318 <_malloc_r+0x124>
   1159c:	cb1ff06f          	j	1124c <_malloc_r+0x58>
   115a0:	0097d713          	srli	a4,a5,0x9
   115a4:	00400693          	li	a3,4
   115a8:	14e6f263          	bgeu	a3,a4,116ec <_malloc_r+0x4f8>
   115ac:	01400693          	li	a3,20
   115b0:	32e6e463          	bltu	a3,a4,118d8 <_malloc_r+0x6e4>
   115b4:	05c70613          	addi	a2,a4,92
   115b8:	05b70693          	addi	a3,a4,91
   115bc:	00361613          	slli	a2,a2,0x3
   115c0:	00c90633          	add	a2,s2,a2
   115c4:	00062703          	lw	a4,0(a2)
   115c8:	ff860613          	addi	a2,a2,-8
   115cc:	00e61863          	bne	a2,a4,115dc <_malloc_r+0x3e8>
   115d0:	2940006f          	j	11864 <_malloc_r+0x670>
   115d4:	00872703          	lw	a4,8(a4)
   115d8:	00e60863          	beq	a2,a4,115e8 <_malloc_r+0x3f4>
   115dc:	00472683          	lw	a3,4(a4)
   115e0:	ffc6f693          	andi	a3,a3,-4
   115e4:	fed7e8e3          	bltu	a5,a3,115d4 <_malloc_r+0x3e0>
   115e8:	00c72603          	lw	a2,12(a4)
   115ec:	00c42623          	sw	a2,12(s0)
   115f0:	00e42423          	sw	a4,8(s0)
   115f4:	00862423          	sw	s0,8(a2)
   115f8:	00872623          	sw	s0,12(a4)
   115fc:	d91ff06f          	j	1138c <_malloc_r+0x198>
   11600:	01400713          	li	a4,20
   11604:	10f77863          	bgeu	a4,a5,11714 <_malloc_r+0x520>
   11608:	05400713          	li	a4,84
   1160c:	2ef76463          	bltu	a4,a5,118f4 <_malloc_r+0x700>
   11610:	00c4d793          	srli	a5,s1,0xc
   11614:	06f78593          	addi	a1,a5,111
   11618:	06e78813          	addi	a6,a5,110
   1161c:	00359613          	slli	a2,a1,0x3
   11620:	cb5ff06f          	j	112d4 <_malloc_r+0xe0>
   11624:	001e0e13          	addi	t3,t3,1
   11628:	003e7793          	andi	a5,t3,3
   1162c:	00850513          	addi	a0,a0,8
   11630:	10078063          	beqz	a5,11730 <_malloc_r+0x53c>
   11634:	00c52783          	lw	a5,12(a0)
   11638:	da9ff06f          	j	113e0 <_malloc_r+0x1ec>
   1163c:	00842603          	lw	a2,8(s0)
   11640:	0014e593          	ori	a1,s1,1
   11644:	00b42223          	sw	a1,4(s0)
   11648:	00f62623          	sw	a5,12(a2)
   1164c:	00c7a423          	sw	a2,8(a5)
   11650:	009404b3          	add	s1,s0,s1
   11654:	00992a23          	sw	s1,20(s2)
   11658:	00992823          	sw	s1,16(s2)
   1165c:	0016e793          	ori	a5,a3,1
   11660:	0104a623          	sw	a6,12(s1)
   11664:	0104a423          	sw	a6,8(s1)
   11668:	00f4a223          	sw	a5,4(s1)
   1166c:	00e40733          	add	a4,s0,a4
   11670:	00098513          	mv	a0,s3
   11674:	00d72023          	sw	a3,0(a4)
   11678:	33c000ef          	jal	119b4 <__malloc_unlock>
   1167c:	00840513          	addi	a0,s0,8
   11680:	c01ff06f          	j	11280 <_malloc_r+0x8c>
   11684:	00f407b3          	add	a5,s0,a5
   11688:	0047a703          	lw	a4,4(a5)
   1168c:	00098513          	mv	a0,s3
   11690:	00176713          	ori	a4,a4,1
   11694:	00e7a223          	sw	a4,4(a5)
   11698:	31c000ef          	jal	119b4 <__malloc_unlock>
   1169c:	00840513          	addi	a0,s0,8
   116a0:	be1ff06f          	j	11280 <_malloc_r+0x8c>
   116a4:	0034d593          	srli	a1,s1,0x3
   116a8:	00848793          	addi	a5,s1,8
   116ac:	b89ff06f          	j	11234 <_malloc_r+0x40>
   116b0:	0014e693          	ori	a3,s1,1
   116b4:	00d42223          	sw	a3,4(s0)
   116b8:	009404b3          	add	s1,s0,s1
   116bc:	00992a23          	sw	s1,20(s2)
   116c0:	00992823          	sw	s1,16(s2)
   116c4:	00176693          	ori	a3,a4,1
   116c8:	0104a623          	sw	a6,12(s1)
   116cc:	0104a423          	sw	a6,8(s1)
   116d0:	00d4a223          	sw	a3,4(s1)
   116d4:	00f407b3          	add	a5,s0,a5
   116d8:	00098513          	mv	a0,s3
   116dc:	00e7a023          	sw	a4,0(a5)
   116e0:	2d4000ef          	jal	119b4 <__malloc_unlock>
   116e4:	00840513          	addi	a0,s0,8
   116e8:	b99ff06f          	j	11280 <_malloc_r+0x8c>
   116ec:	0067d713          	srli	a4,a5,0x6
   116f0:	03970613          	addi	a2,a4,57
   116f4:	03870693          	addi	a3,a4,56
   116f8:	00361613          	slli	a2,a2,0x3
   116fc:	ec5ff06f          	j	115c0 <_malloc_r+0x3cc>
   11700:	07240c63          	beq	s0,s2,11778 <_malloc_r+0x584>
   11704:	00892403          	lw	s0,8(s2)
   11708:	00812c03          	lw	s8,8(sp)
   1170c:	00442783          	lw	a5,4(s0)
   11710:	e09ff06f          	j	11518 <_malloc_r+0x324>
   11714:	05c78593          	addi	a1,a5,92
   11718:	05b78813          	addi	a6,a5,91
   1171c:	00359613          	slli	a2,a1,0x3
   11720:	bb5ff06f          	j	112d4 <_malloc_r+0xe0>
   11724:	00832783          	lw	a5,8(t1)
   11728:	fff58593          	addi	a1,a1,-1
   1172c:	26679e63          	bne	a5,t1,119a8 <_malloc_r+0x7b4>
   11730:	0035f793          	andi	a5,a1,3
   11734:	ff830313          	addi	t1,t1,-8
   11738:	fe0796e3          	bnez	a5,11724 <_malloc_r+0x530>
   1173c:	00492703          	lw	a4,4(s2)
   11740:	fff64793          	not	a5,a2
   11744:	00e7f7b3          	and	a5,a5,a4
   11748:	00f92223          	sw	a5,4(s2)
   1174c:	00161613          	slli	a2,a2,0x1
   11750:	cec7eee3          	bltu	a5,a2,1144c <_malloc_r+0x258>
   11754:	ce060ce3          	beqz	a2,1144c <_malloc_r+0x258>
   11758:	00f67733          	and	a4,a2,a5
   1175c:	00071a63          	bnez	a4,11770 <_malloc_r+0x57c>
   11760:	00161613          	slli	a2,a2,0x1
   11764:	00f67733          	and	a4,a2,a5
   11768:	004e0e13          	addi	t3,t3,4
   1176c:	fe070ae3          	beqz	a4,11760 <_malloc_r+0x56c>
   11770:	000e0593          	mv	a1,t3
   11774:	c59ff06f          	j	113cc <_malloc_r+0x1d8>
   11778:	eb818c13          	addi	s8,gp,-328 # 137f8 <__malloc_current_mallinfo>
   1177c:	000c2703          	lw	a4,0(s8)
   11780:	00ea8733          	add	a4,s5,a4
   11784:	00ec2023          	sw	a4,0(s8)
   11788:	d401a683          	lw	a3,-704(gp) # 13680 <__malloc_sbrk_base>
   1178c:	fff00793          	li	a5,-1
   11790:	18f68663          	beq	a3,a5,1191c <_malloc_r+0x728>
   11794:	414b87b3          	sub	a5,s7,s4
   11798:	00e787b3          	add	a5,a5,a4
   1179c:	00fc2023          	sw	a5,0(s8)
   117a0:	007bfc93          	andi	s9,s7,7
   117a4:	0c0c8c63          	beqz	s9,1187c <_malloc_r+0x688>
   117a8:	419b8bb3          	sub	s7,s7,s9
   117ac:	000017b7          	lui	a5,0x1
   117b0:	00878793          	addi	a5,a5,8 # 1008 <exit-0xf08c>
   117b4:	008b8b93          	addi	s7,s7,8
   117b8:	419785b3          	sub	a1,a5,s9
   117bc:	015b8ab3          	add	s5,s7,s5
   117c0:	415585b3          	sub	a1,a1,s5
   117c4:	01459593          	slli	a1,a1,0x14
   117c8:	0145da13          	srli	s4,a1,0x14
   117cc:	000a0593          	mv	a1,s4
   117d0:	00098513          	mv	a0,s3
   117d4:	628000ef          	jal	11dfc <_sbrk_r>
   117d8:	fff00793          	li	a5,-1
   117dc:	18f50063          	beq	a0,a5,1195c <_malloc_r+0x768>
   117e0:	41750533          	sub	a0,a0,s7
   117e4:	01450ab3          	add	s5,a0,s4
   117e8:	000c2703          	lw	a4,0(s8)
   117ec:	01792423          	sw	s7,8(s2)
   117f0:	001ae793          	ori	a5,s5,1
   117f4:	00ea05b3          	add	a1,s4,a4
   117f8:	00bc2023          	sw	a1,0(s8)
   117fc:	00fba223          	sw	a5,4(s7)
   11800:	cf240ce3          	beq	s0,s2,114f8 <_malloc_r+0x304>
   11804:	00f00693          	li	a3,15
   11808:	0b66f063          	bgeu	a3,s6,118a8 <_malloc_r+0x6b4>
   1180c:	00442703          	lw	a4,4(s0)
   11810:	ff4b0793          	addi	a5,s6,-12
   11814:	ff87f793          	andi	a5,a5,-8
   11818:	00177713          	andi	a4,a4,1
   1181c:	00f76733          	or	a4,a4,a5
   11820:	00e42223          	sw	a4,4(s0)
   11824:	00500613          	li	a2,5
   11828:	00f40733          	add	a4,s0,a5
   1182c:	00c72223          	sw	a2,4(a4)
   11830:	00c72423          	sw	a2,8(a4)
   11834:	00f6e663          	bltu	a3,a5,11840 <_malloc_r+0x64c>
   11838:	004ba783          	lw	a5,4(s7)
   1183c:	cbdff06f          	j	114f8 <_malloc_r+0x304>
   11840:	00840593          	addi	a1,s0,8
   11844:	00098513          	mv	a0,s3
   11848:	ea8ff0ef          	jal	10ef0 <_free_r>
   1184c:	00892b83          	lw	s7,8(s2)
   11850:	000c2583          	lw	a1,0(s8)
   11854:	004ba783          	lw	a5,4(s7)
   11858:	ca1ff06f          	j	114f8 <_malloc_r+0x304>
   1185c:	010a8a93          	addi	s5,s5,16
   11860:	c49ff06f          	j	114a8 <_malloc_r+0x2b4>
   11864:	4026d693          	srai	a3,a3,0x2
   11868:	00100793          	li	a5,1
   1186c:	00d797b3          	sll	a5,a5,a3
   11870:	00f56533          	or	a0,a0,a5
   11874:	00a92223          	sw	a0,4(s2)
   11878:	d75ff06f          	j	115ec <_malloc_r+0x3f8>
   1187c:	015b85b3          	add	a1,s7,s5
   11880:	40b005b3          	neg	a1,a1
   11884:	01459593          	slli	a1,a1,0x14
   11888:	0145da13          	srli	s4,a1,0x14
   1188c:	000a0593          	mv	a1,s4
   11890:	00098513          	mv	a0,s3
   11894:	568000ef          	jal	11dfc <_sbrk_r>
   11898:	fff00793          	li	a5,-1
   1189c:	f4f512e3          	bne	a0,a5,117e0 <_malloc_r+0x5ec>
   118a0:	00000a13          	li	s4,0
   118a4:	f45ff06f          	j	117e8 <_malloc_r+0x5f4>
   118a8:	00812c03          	lw	s8,8(sp)
   118ac:	00100793          	li	a5,1
   118b0:	00fba223          	sw	a5,4(s7)
   118b4:	00098513          	mv	a0,s3
   118b8:	0fc000ef          	jal	119b4 <__malloc_unlock>
   118bc:	00000513          	li	a0,0
   118c0:	01812a03          	lw	s4,24(sp)
   118c4:	01412a83          	lw	s5,20(sp)
   118c8:	01012b03          	lw	s6,16(sp)
   118cc:	00c12b83          	lw	s7,12(sp)
   118d0:	00412c83          	lw	s9,4(sp)
   118d4:	9adff06f          	j	11280 <_malloc_r+0x8c>
   118d8:	05400693          	li	a3,84
   118dc:	04e6e463          	bltu	a3,a4,11924 <_malloc_r+0x730>
   118e0:	00c7d713          	srli	a4,a5,0xc
   118e4:	06f70613          	addi	a2,a4,111
   118e8:	06e70693          	addi	a3,a4,110
   118ec:	00361613          	slli	a2,a2,0x3
   118f0:	cd1ff06f          	j	115c0 <_malloc_r+0x3cc>
   118f4:	15400713          	li	a4,340
   118f8:	04f76463          	bltu	a4,a5,11940 <_malloc_r+0x74c>
   118fc:	00f4d793          	srli	a5,s1,0xf
   11900:	07878593          	addi	a1,a5,120
   11904:	07778813          	addi	a6,a5,119
   11908:	00359613          	slli	a2,a1,0x3
   1190c:	9c9ff06f          	j	112d4 <_malloc_r+0xe0>
   11910:	00892403          	lw	s0,8(s2)
   11914:	00442783          	lw	a5,4(s0)
   11918:	c01ff06f          	j	11518 <_malloc_r+0x324>
   1191c:	d571a023          	sw	s7,-704(gp) # 13680 <__malloc_sbrk_base>
   11920:	e81ff06f          	j	117a0 <_malloc_r+0x5ac>
   11924:	15400693          	li	a3,340
   11928:	04e6e463          	bltu	a3,a4,11970 <_malloc_r+0x77c>
   1192c:	00f7d713          	srli	a4,a5,0xf
   11930:	07870613          	addi	a2,a4,120
   11934:	07770693          	addi	a3,a4,119
   11938:	00361613          	slli	a2,a2,0x3
   1193c:	c85ff06f          	j	115c0 <_malloc_r+0x3cc>
   11940:	55400713          	li	a4,1364
   11944:	04f76463          	bltu	a4,a5,1198c <_malloc_r+0x798>
   11948:	0124d793          	srli	a5,s1,0x12
   1194c:	07d78593          	addi	a1,a5,125
   11950:	07c78813          	addi	a6,a5,124
   11954:	00359613          	slli	a2,a1,0x3
   11958:	97dff06f          	j	112d4 <_malloc_r+0xe0>
   1195c:	ff8c8c93          	addi	s9,s9,-8
   11960:	019a8ab3          	add	s5,s5,s9
   11964:	417a8ab3          	sub	s5,s5,s7
   11968:	00000a13          	li	s4,0
   1196c:	e7dff06f          	j	117e8 <_malloc_r+0x5f4>
   11970:	55400693          	li	a3,1364
   11974:	02e6e463          	bltu	a3,a4,1199c <_malloc_r+0x7a8>
   11978:	0127d713          	srli	a4,a5,0x12
   1197c:	07d70613          	addi	a2,a4,125
   11980:	07c70693          	addi	a3,a4,124
   11984:	00361613          	slli	a2,a2,0x3
   11988:	c39ff06f          	j	115c0 <_malloc_r+0x3cc>
   1198c:	3f800613          	li	a2,1016
   11990:	07f00593          	li	a1,127
   11994:	07e00813          	li	a6,126
   11998:	93dff06f          	j	112d4 <_malloc_r+0xe0>
   1199c:	3f800613          	li	a2,1016
   119a0:	07e00693          	li	a3,126
   119a4:	c1dff06f          	j	115c0 <_malloc_r+0x3cc>
   119a8:	00492783          	lw	a5,4(s2)
   119ac:	da1ff06f          	j	1174c <_malloc_r+0x558>

000119b0 <__malloc_lock>:
   119b0:	00008067          	ret

000119b4 <__malloc_unlock>:
   119b4:	00008067          	ret

000119b8 <_fclose_r>:
   119b8:	ff010113          	addi	sp,sp,-16
   119bc:	00112623          	sw	ra,12(sp)
   119c0:	01212023          	sw	s2,0(sp)
   119c4:	02058863          	beqz	a1,119f4 <_fclose_r+0x3c>
   119c8:	00812423          	sw	s0,8(sp)
   119cc:	00912223          	sw	s1,4(sp)
   119d0:	00058413          	mv	s0,a1
   119d4:	00050493          	mv	s1,a0
   119d8:	00050663          	beqz	a0,119e4 <_fclose_r+0x2c>
   119dc:	03452783          	lw	a5,52(a0)
   119e0:	0c078c63          	beqz	a5,11ab8 <_fclose_r+0x100>
   119e4:	00c41783          	lh	a5,12(s0)
   119e8:	02079263          	bnez	a5,11a0c <_fclose_r+0x54>
   119ec:	00812403          	lw	s0,8(sp)
   119f0:	00412483          	lw	s1,4(sp)
   119f4:	00c12083          	lw	ra,12(sp)
   119f8:	00000913          	li	s2,0
   119fc:	00090513          	mv	a0,s2
   11a00:	00012903          	lw	s2,0(sp)
   11a04:	01010113          	addi	sp,sp,16
   11a08:	00008067          	ret
   11a0c:	00040593          	mv	a1,s0
   11a10:	00048513          	mv	a0,s1
   11a14:	0b8000ef          	jal	11acc <__sflush_r>
   11a18:	02c42783          	lw	a5,44(s0)
   11a1c:	00050913          	mv	s2,a0
   11a20:	00078a63          	beqz	a5,11a34 <_fclose_r+0x7c>
   11a24:	01c42583          	lw	a1,28(s0)
   11a28:	00048513          	mv	a0,s1
   11a2c:	000780e7          	jalr	a5
   11a30:	06054463          	bltz	a0,11a98 <_fclose_r+0xe0>
   11a34:	00c45783          	lhu	a5,12(s0)
   11a38:	0807f793          	andi	a5,a5,128
   11a3c:	06079663          	bnez	a5,11aa8 <_fclose_r+0xf0>
   11a40:	03042583          	lw	a1,48(s0)
   11a44:	00058c63          	beqz	a1,11a5c <_fclose_r+0xa4>
   11a48:	04040793          	addi	a5,s0,64
   11a4c:	00f58663          	beq	a1,a5,11a58 <_fclose_r+0xa0>
   11a50:	00048513          	mv	a0,s1
   11a54:	c9cff0ef          	jal	10ef0 <_free_r>
   11a58:	02042823          	sw	zero,48(s0)
   11a5c:	04442583          	lw	a1,68(s0)
   11a60:	00058863          	beqz	a1,11a70 <_fclose_r+0xb8>
   11a64:	00048513          	mv	a0,s1
   11a68:	c88ff0ef          	jal	10ef0 <_free_r>
   11a6c:	04042223          	sw	zero,68(s0)
   11a70:	bd9fe0ef          	jal	10648 <__sfp_lock_acquire>
   11a74:	00041623          	sh	zero,12(s0)
   11a78:	bd5fe0ef          	jal	1064c <__sfp_lock_release>
   11a7c:	00c12083          	lw	ra,12(sp)
   11a80:	00812403          	lw	s0,8(sp)
   11a84:	00412483          	lw	s1,4(sp)
   11a88:	00090513          	mv	a0,s2
   11a8c:	00012903          	lw	s2,0(sp)
   11a90:	01010113          	addi	sp,sp,16
   11a94:	00008067          	ret
   11a98:	00c45783          	lhu	a5,12(s0)
   11a9c:	fff00913          	li	s2,-1
   11aa0:	0807f793          	andi	a5,a5,128
   11aa4:	f8078ee3          	beqz	a5,11a40 <_fclose_r+0x88>
   11aa8:	01042583          	lw	a1,16(s0)
   11aac:	00048513          	mv	a0,s1
   11ab0:	c40ff0ef          	jal	10ef0 <_free_r>
   11ab4:	f8dff06f          	j	11a40 <_fclose_r+0x88>
   11ab8:	b6dfe0ef          	jal	10624 <__sinit>
   11abc:	f29ff06f          	j	119e4 <_fclose_r+0x2c>

00011ac0 <fclose>:
   11ac0:	00050593          	mv	a1,a0
   11ac4:	d3c1a503          	lw	a0,-708(gp) # 1367c <_impure_ptr>
   11ac8:	ef1ff06f          	j	119b8 <_fclose_r>

00011acc <__sflush_r>:
   11acc:	00c59703          	lh	a4,12(a1)
   11ad0:	fe010113          	addi	sp,sp,-32
   11ad4:	00812c23          	sw	s0,24(sp)
   11ad8:	01312623          	sw	s3,12(sp)
   11adc:	00112e23          	sw	ra,28(sp)
   11ae0:	00877793          	andi	a5,a4,8
   11ae4:	00058413          	mv	s0,a1
   11ae8:	00050993          	mv	s3,a0
   11aec:	12079063          	bnez	a5,11c0c <__sflush_r+0x140>
   11af0:	000017b7          	lui	a5,0x1
   11af4:	80078793          	addi	a5,a5,-2048 # 800 <exit-0xf894>
   11af8:	0045a683          	lw	a3,4(a1)
   11afc:	00f767b3          	or	a5,a4,a5
   11b00:	00f59623          	sh	a5,12(a1)
   11b04:	18d05263          	blez	a3,11c88 <__sflush_r+0x1bc>
   11b08:	02842803          	lw	a6,40(s0)
   11b0c:	0e080463          	beqz	a6,11bf4 <__sflush_r+0x128>
   11b10:	00912a23          	sw	s1,20(sp)
   11b14:	01371693          	slli	a3,a4,0x13
   11b18:	0009a483          	lw	s1,0(s3)
   11b1c:	0009a023          	sw	zero,0(s3)
   11b20:	01c42583          	lw	a1,28(s0)
   11b24:	1606ce63          	bltz	a3,11ca0 <__sflush_r+0x1d4>
   11b28:	00000613          	li	a2,0
   11b2c:	00100693          	li	a3,1
   11b30:	00098513          	mv	a0,s3
   11b34:	000800e7          	jalr	a6
   11b38:	fff00793          	li	a5,-1
   11b3c:	00050613          	mv	a2,a0
   11b40:	1af50463          	beq	a0,a5,11ce8 <__sflush_r+0x21c>
   11b44:	00c41783          	lh	a5,12(s0)
   11b48:	02842803          	lw	a6,40(s0)
   11b4c:	01c42583          	lw	a1,28(s0)
   11b50:	0047f793          	andi	a5,a5,4
   11b54:	00078e63          	beqz	a5,11b70 <__sflush_r+0xa4>
   11b58:	00442703          	lw	a4,4(s0)
   11b5c:	03042783          	lw	a5,48(s0)
   11b60:	40e60633          	sub	a2,a2,a4
   11b64:	00078663          	beqz	a5,11b70 <__sflush_r+0xa4>
   11b68:	03c42783          	lw	a5,60(s0)
   11b6c:	40f60633          	sub	a2,a2,a5
   11b70:	00000693          	li	a3,0
   11b74:	00098513          	mv	a0,s3
   11b78:	000800e7          	jalr	a6
   11b7c:	fff00793          	li	a5,-1
   11b80:	12f51463          	bne	a0,a5,11ca8 <__sflush_r+0x1dc>
   11b84:	0009a683          	lw	a3,0(s3)
   11b88:	01d00793          	li	a5,29
   11b8c:	00c41703          	lh	a4,12(s0)
   11b90:	16d7ea63          	bltu	a5,a3,11d04 <__sflush_r+0x238>
   11b94:	204007b7          	lui	a5,0x20400
   11b98:	00178793          	addi	a5,a5,1 # 20400001 <__BSS_END__+0x203ec651>
   11b9c:	00d7d7b3          	srl	a5,a5,a3
   11ba0:	0017f793          	andi	a5,a5,1
   11ba4:	16078063          	beqz	a5,11d04 <__sflush_r+0x238>
   11ba8:	01042603          	lw	a2,16(s0)
   11bac:	fffff7b7          	lui	a5,0xfffff
   11bb0:	7ff78793          	addi	a5,a5,2047 # fffff7ff <__BSS_END__+0xfffebe4f>
   11bb4:	00f777b3          	and	a5,a4,a5
   11bb8:	00f41623          	sh	a5,12(s0)
   11bbc:	00042223          	sw	zero,4(s0)
   11bc0:	00c42023          	sw	a2,0(s0)
   11bc4:	01371793          	slli	a5,a4,0x13
   11bc8:	0007d463          	bgez	a5,11bd0 <__sflush_r+0x104>
   11bcc:	10068263          	beqz	a3,11cd0 <__sflush_r+0x204>
   11bd0:	03042583          	lw	a1,48(s0)
   11bd4:	0099a023          	sw	s1,0(s3)
   11bd8:	10058463          	beqz	a1,11ce0 <__sflush_r+0x214>
   11bdc:	04040793          	addi	a5,s0,64
   11be0:	00f58663          	beq	a1,a5,11bec <__sflush_r+0x120>
   11be4:	00098513          	mv	a0,s3
   11be8:	b08ff0ef          	jal	10ef0 <_free_r>
   11bec:	01412483          	lw	s1,20(sp)
   11bf0:	02042823          	sw	zero,48(s0)
   11bf4:	00000513          	li	a0,0
   11bf8:	01c12083          	lw	ra,28(sp)
   11bfc:	01812403          	lw	s0,24(sp)
   11c00:	00c12983          	lw	s3,12(sp)
   11c04:	02010113          	addi	sp,sp,32
   11c08:	00008067          	ret
   11c0c:	01212823          	sw	s2,16(sp)
   11c10:	0105a903          	lw	s2,16(a1)
   11c14:	08090263          	beqz	s2,11c98 <__sflush_r+0x1cc>
   11c18:	00912a23          	sw	s1,20(sp)
   11c1c:	0005a483          	lw	s1,0(a1)
   11c20:	00377713          	andi	a4,a4,3
   11c24:	0125a023          	sw	s2,0(a1)
   11c28:	412484b3          	sub	s1,s1,s2
   11c2c:	00000793          	li	a5,0
   11c30:	00071463          	bnez	a4,11c38 <__sflush_r+0x16c>
   11c34:	0145a783          	lw	a5,20(a1)
   11c38:	00f42423          	sw	a5,8(s0)
   11c3c:	00904863          	bgtz	s1,11c4c <__sflush_r+0x180>
   11c40:	0540006f          	j	11c94 <__sflush_r+0x1c8>
   11c44:	00a90933          	add	s2,s2,a0
   11c48:	04905663          	blez	s1,11c94 <__sflush_r+0x1c8>
   11c4c:	02442783          	lw	a5,36(s0)
   11c50:	01c42583          	lw	a1,28(s0)
   11c54:	00048693          	mv	a3,s1
   11c58:	00090613          	mv	a2,s2
   11c5c:	00098513          	mv	a0,s3
   11c60:	000780e7          	jalr	a5
   11c64:	40a484b3          	sub	s1,s1,a0
   11c68:	fca04ee3          	bgtz	a0,11c44 <__sflush_r+0x178>
   11c6c:	00c41703          	lh	a4,12(s0)
   11c70:	01012903          	lw	s2,16(sp)
   11c74:	04076713          	ori	a4,a4,64
   11c78:	01412483          	lw	s1,20(sp)
   11c7c:	00e41623          	sh	a4,12(s0)
   11c80:	fff00513          	li	a0,-1
   11c84:	f75ff06f          	j	11bf8 <__sflush_r+0x12c>
   11c88:	03c5a683          	lw	a3,60(a1)
   11c8c:	e6d04ee3          	bgtz	a3,11b08 <__sflush_r+0x3c>
   11c90:	f65ff06f          	j	11bf4 <__sflush_r+0x128>
   11c94:	01412483          	lw	s1,20(sp)
   11c98:	01012903          	lw	s2,16(sp)
   11c9c:	f59ff06f          	j	11bf4 <__sflush_r+0x128>
   11ca0:	05042603          	lw	a2,80(s0)
   11ca4:	eadff06f          	j	11b50 <__sflush_r+0x84>
   11ca8:	00c41703          	lh	a4,12(s0)
   11cac:	01042683          	lw	a3,16(s0)
   11cb0:	fffff7b7          	lui	a5,0xfffff
   11cb4:	7ff78793          	addi	a5,a5,2047 # fffff7ff <__BSS_END__+0xfffebe4f>
   11cb8:	00f777b3          	and	a5,a4,a5
   11cbc:	00f41623          	sh	a5,12(s0)
   11cc0:	00042223          	sw	zero,4(s0)
   11cc4:	00d42023          	sw	a3,0(s0)
   11cc8:	01371793          	slli	a5,a4,0x13
   11ccc:	f007d2e3          	bgez	a5,11bd0 <__sflush_r+0x104>
   11cd0:	03042583          	lw	a1,48(s0)
   11cd4:	04a42823          	sw	a0,80(s0)
   11cd8:	0099a023          	sw	s1,0(s3)
   11cdc:	f00590e3          	bnez	a1,11bdc <__sflush_r+0x110>
   11ce0:	01412483          	lw	s1,20(sp)
   11ce4:	f11ff06f          	j	11bf4 <__sflush_r+0x128>
   11ce8:	0009a783          	lw	a5,0(s3)
   11cec:	e4078ce3          	beqz	a5,11b44 <__sflush_r+0x78>
   11cf0:	01d00713          	li	a4,29
   11cf4:	00e78c63          	beq	a5,a4,11d0c <__sflush_r+0x240>
   11cf8:	01600713          	li	a4,22
   11cfc:	00e78863          	beq	a5,a4,11d0c <__sflush_r+0x240>
   11d00:	00c41703          	lh	a4,12(s0)
   11d04:	04076713          	ori	a4,a4,64
   11d08:	f71ff06f          	j	11c78 <__sflush_r+0x1ac>
   11d0c:	0099a023          	sw	s1,0(s3)
   11d10:	01412483          	lw	s1,20(sp)
   11d14:	ee1ff06f          	j	11bf4 <__sflush_r+0x128>

00011d18 <_fflush_r>:
   11d18:	fe010113          	addi	sp,sp,-32
   11d1c:	00812c23          	sw	s0,24(sp)
   11d20:	00112e23          	sw	ra,28(sp)
   11d24:	00050413          	mv	s0,a0
   11d28:	00050663          	beqz	a0,11d34 <_fflush_r+0x1c>
   11d2c:	03452783          	lw	a5,52(a0)
   11d30:	02078a63          	beqz	a5,11d64 <_fflush_r+0x4c>
   11d34:	00c59783          	lh	a5,12(a1)
   11d38:	00079c63          	bnez	a5,11d50 <_fflush_r+0x38>
   11d3c:	01c12083          	lw	ra,28(sp)
   11d40:	01812403          	lw	s0,24(sp)
   11d44:	00000513          	li	a0,0
   11d48:	02010113          	addi	sp,sp,32
   11d4c:	00008067          	ret
   11d50:	00040513          	mv	a0,s0
   11d54:	01812403          	lw	s0,24(sp)
   11d58:	01c12083          	lw	ra,28(sp)
   11d5c:	02010113          	addi	sp,sp,32
   11d60:	d6dff06f          	j	11acc <__sflush_r>
   11d64:	00b12623          	sw	a1,12(sp)
   11d68:	8bdfe0ef          	jal	10624 <__sinit>
   11d6c:	00c12583          	lw	a1,12(sp)
   11d70:	fc5ff06f          	j	11d34 <_fflush_r+0x1c>

00011d74 <fflush>:
   11d74:	06050063          	beqz	a0,11dd4 <fflush+0x60>
   11d78:	00050593          	mv	a1,a0
   11d7c:	d3c1a503          	lw	a0,-708(gp) # 1367c <_impure_ptr>
   11d80:	00050663          	beqz	a0,11d8c <fflush+0x18>
   11d84:	03452783          	lw	a5,52(a0)
   11d88:	00078c63          	beqz	a5,11da0 <fflush+0x2c>
   11d8c:	00c59783          	lh	a5,12(a1)
   11d90:	00079663          	bnez	a5,11d9c <fflush+0x28>
   11d94:	00000513          	li	a0,0
   11d98:	00008067          	ret
   11d9c:	d31ff06f          	j	11acc <__sflush_r>
   11da0:	fe010113          	addi	sp,sp,-32
   11da4:	00b12623          	sw	a1,12(sp)
   11da8:	00a12423          	sw	a0,8(sp)
   11dac:	00112e23          	sw	ra,28(sp)
   11db0:	875fe0ef          	jal	10624 <__sinit>
   11db4:	00c12583          	lw	a1,12(sp)
   11db8:	00812503          	lw	a0,8(sp)
   11dbc:	00c59783          	lh	a5,12(a1)
   11dc0:	02079863          	bnez	a5,11df0 <fflush+0x7c>
   11dc4:	01c12083          	lw	ra,28(sp)
   11dc8:	00000513          	li	a0,0
   11dcc:	02010113          	addi	sp,sp,32
   11dd0:	00008067          	ret
   11dd4:	00013637          	lui	a2,0x13
   11dd8:	000125b7          	lui	a1,0x12
   11ddc:	00013537          	lui	a0,0x13
   11de0:	14060613          	addi	a2,a2,320 # 13140 <__sglue>
   11de4:	d1858593          	addi	a1,a1,-744 # 11d18 <_fflush_r>
   11de8:	15050513          	addi	a0,a0,336 # 13150 <_impure_data>
   11dec:	895fe06f          	j	10680 <_fwalk_sglue>
   11df0:	01c12083          	lw	ra,28(sp)
   11df4:	02010113          	addi	sp,sp,32
   11df8:	cd5ff06f          	j	11acc <__sflush_r>

00011dfc <_sbrk_r>:
   11dfc:	ff010113          	addi	sp,sp,-16
   11e00:	00812423          	sw	s0,8(sp)
   11e04:	00912223          	sw	s1,4(sp)
   11e08:	00050413          	mv	s0,a0
   11e0c:	00058513          	mv	a0,a1
   11e10:	00112623          	sw	ra,12(sp)
   11e14:	d401a623          	sw	zero,-692(gp) # 1368c <errno>
   11e18:	230000ef          	jal	12048 <_sbrk>
   11e1c:	fff00793          	li	a5,-1
   11e20:	00f50c63          	beq	a0,a5,11e38 <_sbrk_r+0x3c>
   11e24:	00c12083          	lw	ra,12(sp)
   11e28:	00812403          	lw	s0,8(sp)
   11e2c:	00412483          	lw	s1,4(sp)
   11e30:	01010113          	addi	sp,sp,16
   11e34:	00008067          	ret
   11e38:	d4c1a783          	lw	a5,-692(gp) # 1368c <errno>
   11e3c:	fe0784e3          	beqz	a5,11e24 <_sbrk_r+0x28>
   11e40:	00c12083          	lw	ra,12(sp)
   11e44:	00f42023          	sw	a5,0(s0)
   11e48:	00812403          	lw	s0,8(sp)
   11e4c:	00412483          	lw	s1,4(sp)
   11e50:	01010113          	addi	sp,sp,16
   11e54:	00008067          	ret

00011e58 <__libc_fini_array>:
   11e58:	ff010113          	addi	sp,sp,-16
   11e5c:	00812423          	sw	s0,8(sp)
   11e60:	000137b7          	lui	a5,0x13
   11e64:	00013437          	lui	s0,0x13
   11e68:	13c78793          	addi	a5,a5,316 # 1313c <__do_global_dtors_aux_fini_array_entry>
   11e6c:	14040413          	addi	s0,s0,320 # 13140 <__sglue>
   11e70:	40f40433          	sub	s0,s0,a5
   11e74:	00912223          	sw	s1,4(sp)
   11e78:	00112623          	sw	ra,12(sp)
   11e7c:	40245493          	srai	s1,s0,0x2
   11e80:	02048063          	beqz	s1,11ea0 <__libc_fini_array+0x48>
   11e84:	ffc40413          	addi	s0,s0,-4
   11e88:	00f40433          	add	s0,s0,a5
   11e8c:	00042783          	lw	a5,0(s0)
   11e90:	fff48493          	addi	s1,s1,-1
   11e94:	ffc40413          	addi	s0,s0,-4
   11e98:	000780e7          	jalr	a5
   11e9c:	fe0498e3          	bnez	s1,11e8c <__libc_fini_array+0x34>
   11ea0:	00c12083          	lw	ra,12(sp)
   11ea4:	00812403          	lw	s0,8(sp)
   11ea8:	00412483          	lw	s1,4(sp)
   11eac:	01010113          	addi	sp,sp,16
   11eb0:	00008067          	ret

00011eb4 <__register_exitproc>:
   11eb4:	d501a783          	lw	a5,-688(gp) # 13690 <__atexit>
   11eb8:	04078c63          	beqz	a5,11f10 <__register_exitproc+0x5c>
   11ebc:	0047a703          	lw	a4,4(a5)
   11ec0:	01f00813          	li	a6,31
   11ec4:	08e84063          	blt	a6,a4,11f44 <__register_exitproc+0x90>
   11ec8:	00271813          	slli	a6,a4,0x2
   11ecc:	02050663          	beqz	a0,11ef8 <__register_exitproc+0x44>
   11ed0:	01078333          	add	t1,a5,a6
   11ed4:	08c32423          	sw	a2,136(t1)
   11ed8:	1887a883          	lw	a7,392(a5)
   11edc:	00100613          	li	a2,1
   11ee0:	00e61633          	sll	a2,a2,a4
   11ee4:	00c8e8b3          	or	a7,a7,a2
   11ee8:	1917a423          	sw	a7,392(a5)
   11eec:	10d32423          	sw	a3,264(t1)
   11ef0:	00200693          	li	a3,2
   11ef4:	02d50663          	beq	a0,a3,11f20 <__register_exitproc+0x6c>
   11ef8:	00170713          	addi	a4,a4,1
   11efc:	00e7a223          	sw	a4,4(a5)
   11f00:	010787b3          	add	a5,a5,a6
   11f04:	00b7a423          	sw	a1,8(a5)
   11f08:	00000513          	li	a0,0
   11f0c:	00008067          	ret
   11f10:	ee018813          	addi	a6,gp,-288 # 13820 <__atexit0>
   11f14:	d501a823          	sw	a6,-688(gp) # 13690 <__atexit>
   11f18:	ee018793          	addi	a5,gp,-288 # 13820 <__atexit0>
   11f1c:	fa1ff06f          	j	11ebc <__register_exitproc+0x8>
   11f20:	18c7a683          	lw	a3,396(a5)
   11f24:	00170713          	addi	a4,a4,1
   11f28:	00e7a223          	sw	a4,4(a5)
   11f2c:	00c6e6b3          	or	a3,a3,a2
   11f30:	18d7a623          	sw	a3,396(a5)
   11f34:	010787b3          	add	a5,a5,a6
   11f38:	00b7a423          	sw	a1,8(a5)
   11f3c:	00000513          	li	a0,0
   11f40:	00008067          	ret
   11f44:	fff00513          	li	a0,-1
   11f48:	00008067          	ret

00011f4c <_close>:
   11f4c:	ff010113          	addi	sp,sp,-16
   11f50:	00112623          	sw	ra,12(sp)
   11f54:	00812423          	sw	s0,8(sp)
   11f58:	03900893          	li	a7,57
   11f5c:	00000073          	ecall
   11f60:	00050413          	mv	s0,a0
   11f64:	00054c63          	bltz	a0,11f7c <_close+0x30>
   11f68:	00c12083          	lw	ra,12(sp)
   11f6c:	00040513          	mv	a0,s0
   11f70:	00812403          	lw	s0,8(sp)
   11f74:	01010113          	addi	sp,sp,16
   11f78:	00008067          	ret
   11f7c:	40800433          	neg	s0,s0
   11f80:	184000ef          	jal	12104 <__errno>
   11f84:	00852023          	sw	s0,0(a0)
   11f88:	fff00413          	li	s0,-1
   11f8c:	fddff06f          	j	11f68 <_close+0x1c>

00011f90 <_exit>:
   11f90:	05d00893          	li	a7,93
   11f94:	00000073          	ecall
   11f98:	00054463          	bltz	a0,11fa0 <_exit+0x10>
   11f9c:	0000006f          	j	11f9c <_exit+0xc>
   11fa0:	ff010113          	addi	sp,sp,-16
   11fa4:	00812423          	sw	s0,8(sp)
   11fa8:	00050413          	mv	s0,a0
   11fac:	00112623          	sw	ra,12(sp)
   11fb0:	40800433          	neg	s0,s0
   11fb4:	150000ef          	jal	12104 <__errno>
   11fb8:	00852023          	sw	s0,0(a0)
   11fbc:	0000006f          	j	11fbc <_exit+0x2c>

00011fc0 <_lseek>:
   11fc0:	ff010113          	addi	sp,sp,-16
   11fc4:	00112623          	sw	ra,12(sp)
   11fc8:	00812423          	sw	s0,8(sp)
   11fcc:	03e00893          	li	a7,62
   11fd0:	00000073          	ecall
   11fd4:	00050413          	mv	s0,a0
   11fd8:	00054c63          	bltz	a0,11ff0 <_lseek+0x30>
   11fdc:	00c12083          	lw	ra,12(sp)
   11fe0:	00040513          	mv	a0,s0
   11fe4:	00812403          	lw	s0,8(sp)
   11fe8:	01010113          	addi	sp,sp,16
   11fec:	00008067          	ret
   11ff0:	40800433          	neg	s0,s0
   11ff4:	110000ef          	jal	12104 <__errno>
   11ff8:	00852023          	sw	s0,0(a0)
   11ffc:	fff00413          	li	s0,-1
   12000:	fddff06f          	j	11fdc <_lseek+0x1c>

00012004 <_read>:
   12004:	ff010113          	addi	sp,sp,-16
   12008:	00112623          	sw	ra,12(sp)
   1200c:	00812423          	sw	s0,8(sp)
   12010:	03f00893          	li	a7,63
   12014:	00000073          	ecall
   12018:	00050413          	mv	s0,a0
   1201c:	00054c63          	bltz	a0,12034 <_read+0x30>
   12020:	00c12083          	lw	ra,12(sp)
   12024:	00040513          	mv	a0,s0
   12028:	00812403          	lw	s0,8(sp)
   1202c:	01010113          	addi	sp,sp,16
   12030:	00008067          	ret
   12034:	40800433          	neg	s0,s0
   12038:	0cc000ef          	jal	12104 <__errno>
   1203c:	00852023          	sw	s0,0(a0)
   12040:	fff00413          	li	s0,-1
   12044:	fddff06f          	j	12020 <_read+0x1c>

00012048 <_sbrk>:
   12048:	d601a703          	lw	a4,-672(gp) # 136a0 <heap_end.0>
   1204c:	ff010113          	addi	sp,sp,-16
   12050:	00112623          	sw	ra,12(sp)
   12054:	00050793          	mv	a5,a0
   12058:	02071063          	bnez	a4,12078 <_sbrk+0x30>
   1205c:	0d600893          	li	a7,214
   12060:	00000513          	li	a0,0
   12064:	00000073          	ecall
   12068:	fff00613          	li	a2,-1
   1206c:	00050713          	mv	a4,a0
   12070:	02c50a63          	beq	a0,a2,120a4 <_sbrk+0x5c>
   12074:	d6a1a023          	sw	a0,-672(gp) # 136a0 <heap_end.0>
   12078:	0d600893          	li	a7,214
   1207c:	00e78533          	add	a0,a5,a4
   12080:	00000073          	ecall
   12084:	d601a703          	lw	a4,-672(gp) # 136a0 <heap_end.0>
   12088:	00e787b3          	add	a5,a5,a4
   1208c:	00f51c63          	bne	a0,a5,120a4 <_sbrk+0x5c>
   12090:	00c12083          	lw	ra,12(sp)
   12094:	d6a1a023          	sw	a0,-672(gp) # 136a0 <heap_end.0>
   12098:	00070513          	mv	a0,a4
   1209c:	01010113          	addi	sp,sp,16
   120a0:	00008067          	ret
   120a4:	060000ef          	jal	12104 <__errno>
   120a8:	00c12083          	lw	ra,12(sp)
   120ac:	00c00793          	li	a5,12
   120b0:	00f52023          	sw	a5,0(a0)
   120b4:	fff00513          	li	a0,-1
   120b8:	01010113          	addi	sp,sp,16
   120bc:	00008067          	ret

000120c0 <_write>:
   120c0:	ff010113          	addi	sp,sp,-16
   120c4:	00112623          	sw	ra,12(sp)
   120c8:	00812423          	sw	s0,8(sp)
   120cc:	04000893          	li	a7,64
   120d0:	00000073          	ecall
   120d4:	00050413          	mv	s0,a0
   120d8:	00054c63          	bltz	a0,120f0 <_write+0x30>
   120dc:	00c12083          	lw	ra,12(sp)
   120e0:	00040513          	mv	a0,s0
   120e4:	00812403          	lw	s0,8(sp)
   120e8:	01010113          	addi	sp,sp,16
   120ec:	00008067          	ret
   120f0:	40800433          	neg	s0,s0
   120f4:	010000ef          	jal	12104 <__errno>
   120f8:	00852023          	sw	s0,0(a0)
   120fc:	fff00413          	li	s0,-1
   12100:	fddff06f          	j	120dc <_write+0x1c>

00012104 <__errno>:
   12104:	d3c1a503          	lw	a0,-708(gp) # 1367c <_impure_ptr>
   12108:	00008067          	ret

Disassembly of section .rodata:

0001210c <.rodata>:
   1210c:	6854                	.insn	2, 0x6854
   1210e:	2065                	.insn	2, 0x2065
   12110:	72616863          	bltu	sp,t1,12840 <__errno+0x73c>
   12114:	6361                	.insn	2, 0x6361
   12116:	6574                	.insn	2, 0x6574
   12118:	2072                	.insn	2, 0x2072
   1211a:	7369                	.insn	2, 0x7369
   1211c:	203a                	.insn	2, 0x203a
   1211e:	0000                	.insn	2, 0x
   12120:	6854                	.insn	2, 0x6854
   12122:	2065                	.insn	2, 0x2065
   12124:	756e                	.insn	2, 0x756e
   12126:	626d                	.insn	2, 0x626d
   12128:	7265                	.insn	2, 0x7265
   1212a:	6920                	.insn	2, 0x6920
   1212c:	00203a73          	.insn	4, 0x00203a73

Disassembly of section .eh_frame:

00013130 <__EH_FRAME_BEGIN__>:
   13130:	0000                	.insn	2, 0x
	...

Disassembly of section .init_array:

00013134 <__init_array_start>:
   13134:	00c0                	.insn	2, 0x00c0
   13136:	0001                	.insn	2, 0x0001

00013138 <__frame_dummy_init_array_entry>:
   13138:	0168                	.insn	2, 0x0168
   1313a:	0001                	.insn	2, 0x0001

Disassembly of section .fini_array:

0001313c <__do_global_dtors_aux_fini_array_entry>:
   1313c:	0124                	.insn	2, 0x0124
   1313e:	0001                	.insn	2, 0x0001

Disassembly of section .data:

00013140 <__sglue>:
   13140:	0000                	.insn	2, 0x
   13142:	0000                	.insn	2, 0x
   13144:	00000003          	lb	zero,0(zero) # 0 <exit-0x10094>
   13148:	36c0                	.insn	2, 0x36c0
   1314a:	0001                	.insn	2, 0x0001
   1314c:	0000                	.insn	2, 0x
	...

00013150 <_impure_data>:
   13150:	0000                	.insn	2, 0x
   13152:	0000                	.insn	2, 0x
   13154:	36c0                	.insn	2, 0x36c0
   13156:	0001                	.insn	2, 0x0001
   13158:	3728                	.insn	2, 0x3728
   1315a:	0001                	.insn	2, 0x0001
   1315c:	3790                	.insn	2, 0x3790
   1315e:	0001                	.insn	2, 0x0001
	...
   131e8:	0001                	.insn	2, 0x0001
   131ea:	0000                	.insn	2, 0x
   131ec:	0000                	.insn	2, 0x
   131ee:	0000                	.insn	2, 0x
   131f0:	330e                	.insn	2, 0x330e
   131f2:	abcd                	.insn	2, 0xabcd
   131f4:	1234                	.insn	2, 0x1234
   131f6:	e66d                	.insn	2, 0xe66d
   131f8:	deec                	.insn	2, 0xdeec
   131fa:	0005                	.insn	2, 0x0005
   131fc:	0000000b          	.insn	4, 0x000b
	...

00013270 <__malloc_av_>:
	...
   13278:	3270                	.insn	2, 0x3270
   1327a:	0001                	.insn	2, 0x0001
   1327c:	3270                	.insn	2, 0x3270
   1327e:	0001                	.insn	2, 0x0001
   13280:	3278                	.insn	2, 0x3278
   13282:	0001                	.insn	2, 0x0001
   13284:	3278                	.insn	2, 0x3278
   13286:	0001                	.insn	2, 0x0001
   13288:	3280                	.insn	2, 0x3280
   1328a:	0001                	.insn	2, 0x0001
   1328c:	3280                	.insn	2, 0x3280
   1328e:	0001                	.insn	2, 0x0001
   13290:	3288                	.insn	2, 0x3288
   13292:	0001                	.insn	2, 0x0001
   13294:	3288                	.insn	2, 0x3288
   13296:	0001                	.insn	2, 0x0001
   13298:	3290                	.insn	2, 0x3290
   1329a:	0001                	.insn	2, 0x0001
   1329c:	3290                	.insn	2, 0x3290
   1329e:	0001                	.insn	2, 0x0001
   132a0:	3298                	.insn	2, 0x3298
   132a2:	0001                	.insn	2, 0x0001
   132a4:	3298                	.insn	2, 0x3298
   132a6:	0001                	.insn	2, 0x0001
   132a8:	32a0                	.insn	2, 0x32a0
   132aa:	0001                	.insn	2, 0x0001
   132ac:	32a0                	.insn	2, 0x32a0
   132ae:	0001                	.insn	2, 0x0001
   132b0:	32a8                	.insn	2, 0x32a8
   132b2:	0001                	.insn	2, 0x0001
   132b4:	32a8                	.insn	2, 0x32a8
   132b6:	0001                	.insn	2, 0x0001
   132b8:	32b0                	.insn	2, 0x32b0
   132ba:	0001                	.insn	2, 0x0001
   132bc:	32b0                	.insn	2, 0x32b0
   132be:	0001                	.insn	2, 0x0001
   132c0:	32b8                	.insn	2, 0x32b8
   132c2:	0001                	.insn	2, 0x0001
   132c4:	32b8                	.insn	2, 0x32b8
   132c6:	0001                	.insn	2, 0x0001
   132c8:	32c0                	.insn	2, 0x32c0
   132ca:	0001                	.insn	2, 0x0001
   132cc:	32c0                	.insn	2, 0x32c0
   132ce:	0001                	.insn	2, 0x0001
   132d0:	32c8                	.insn	2, 0x32c8
   132d2:	0001                	.insn	2, 0x0001
   132d4:	32c8                	.insn	2, 0x32c8
   132d6:	0001                	.insn	2, 0x0001
   132d8:	32d0                	.insn	2, 0x32d0
   132da:	0001                	.insn	2, 0x0001
   132dc:	32d0                	.insn	2, 0x32d0
   132de:	0001                	.insn	2, 0x0001
   132e0:	32d8                	.insn	2, 0x32d8
   132e2:	0001                	.insn	2, 0x0001
   132e4:	32d8                	.insn	2, 0x32d8
   132e6:	0001                	.insn	2, 0x0001
   132e8:	32e0                	.insn	2, 0x32e0
   132ea:	0001                	.insn	2, 0x0001
   132ec:	32e0                	.insn	2, 0x32e0
   132ee:	0001                	.insn	2, 0x0001
   132f0:	32e8                	.insn	2, 0x32e8
   132f2:	0001                	.insn	2, 0x0001
   132f4:	32e8                	.insn	2, 0x32e8
   132f6:	0001                	.insn	2, 0x0001
   132f8:	32f0                	.insn	2, 0x32f0
   132fa:	0001                	.insn	2, 0x0001
   132fc:	32f0                	.insn	2, 0x32f0
   132fe:	0001                	.insn	2, 0x0001
   13300:	32f8                	.insn	2, 0x32f8
   13302:	0001                	.insn	2, 0x0001
   13304:	32f8                	.insn	2, 0x32f8
   13306:	0001                	.insn	2, 0x0001
   13308:	3300                	.insn	2, 0x3300
   1330a:	0001                	.insn	2, 0x0001
   1330c:	3300                	.insn	2, 0x3300
   1330e:	0001                	.insn	2, 0x0001
   13310:	3308                	.insn	2, 0x3308
   13312:	0001                	.insn	2, 0x0001
   13314:	3308                	.insn	2, 0x3308
   13316:	0001                	.insn	2, 0x0001
   13318:	3310                	.insn	2, 0x3310
   1331a:	0001                	.insn	2, 0x0001
   1331c:	3310                	.insn	2, 0x3310
   1331e:	0001                	.insn	2, 0x0001
   13320:	3318                	.insn	2, 0x3318
   13322:	0001                	.insn	2, 0x0001
   13324:	3318                	.insn	2, 0x3318
   13326:	0001                	.insn	2, 0x0001
   13328:	3320                	.insn	2, 0x3320
   1332a:	0001                	.insn	2, 0x0001
   1332c:	3320                	.insn	2, 0x3320
   1332e:	0001                	.insn	2, 0x0001
   13330:	3328                	.insn	2, 0x3328
   13332:	0001                	.insn	2, 0x0001
   13334:	3328                	.insn	2, 0x3328
   13336:	0001                	.insn	2, 0x0001
   13338:	3330                	.insn	2, 0x3330
   1333a:	0001                	.insn	2, 0x0001
   1333c:	3330                	.insn	2, 0x3330
   1333e:	0001                	.insn	2, 0x0001
   13340:	3338                	.insn	2, 0x3338
   13342:	0001                	.insn	2, 0x0001
   13344:	3338                	.insn	2, 0x3338
   13346:	0001                	.insn	2, 0x0001
   13348:	3340                	.insn	2, 0x3340
   1334a:	0001                	.insn	2, 0x0001
   1334c:	3340                	.insn	2, 0x3340
   1334e:	0001                	.insn	2, 0x0001
   13350:	3348                	.insn	2, 0x3348
   13352:	0001                	.insn	2, 0x0001
   13354:	3348                	.insn	2, 0x3348
   13356:	0001                	.insn	2, 0x0001
   13358:	3350                	.insn	2, 0x3350
   1335a:	0001                	.insn	2, 0x0001
   1335c:	3350                	.insn	2, 0x3350
   1335e:	0001                	.insn	2, 0x0001
   13360:	3358                	.insn	2, 0x3358
   13362:	0001                	.insn	2, 0x0001
   13364:	3358                	.insn	2, 0x3358
   13366:	0001                	.insn	2, 0x0001
   13368:	3360                	.insn	2, 0x3360
   1336a:	0001                	.insn	2, 0x0001
   1336c:	3360                	.insn	2, 0x3360
   1336e:	0001                	.insn	2, 0x0001
   13370:	3368                	.insn	2, 0x3368
   13372:	0001                	.insn	2, 0x0001
   13374:	3368                	.insn	2, 0x3368
   13376:	0001                	.insn	2, 0x0001
   13378:	3370                	.insn	2, 0x3370
   1337a:	0001                	.insn	2, 0x0001
   1337c:	3370                	.insn	2, 0x3370
   1337e:	0001                	.insn	2, 0x0001
   13380:	3378                	.insn	2, 0x3378
   13382:	0001                	.insn	2, 0x0001
   13384:	3378                	.insn	2, 0x3378
   13386:	0001                	.insn	2, 0x0001
   13388:	3380                	.insn	2, 0x3380
   1338a:	0001                	.insn	2, 0x0001
   1338c:	3380                	.insn	2, 0x3380
   1338e:	0001                	.insn	2, 0x0001
   13390:	3388                	.insn	2, 0x3388
   13392:	0001                	.insn	2, 0x0001
   13394:	3388                	.insn	2, 0x3388
   13396:	0001                	.insn	2, 0x0001
   13398:	3390                	.insn	2, 0x3390
   1339a:	0001                	.insn	2, 0x0001
   1339c:	3390                	.insn	2, 0x3390
   1339e:	0001                	.insn	2, 0x0001
   133a0:	3398                	.insn	2, 0x3398
   133a2:	0001                	.insn	2, 0x0001
   133a4:	3398                	.insn	2, 0x3398
   133a6:	0001                	.insn	2, 0x0001
   133a8:	33a0                	.insn	2, 0x33a0
   133aa:	0001                	.insn	2, 0x0001
   133ac:	33a0                	.insn	2, 0x33a0
   133ae:	0001                	.insn	2, 0x0001
   133b0:	33a8                	.insn	2, 0x33a8
   133b2:	0001                	.insn	2, 0x0001
   133b4:	33a8                	.insn	2, 0x33a8
   133b6:	0001                	.insn	2, 0x0001
   133b8:	33b0                	.insn	2, 0x33b0
   133ba:	0001                	.insn	2, 0x0001
   133bc:	33b0                	.insn	2, 0x33b0
   133be:	0001                	.insn	2, 0x0001
   133c0:	33b8                	.insn	2, 0x33b8
   133c2:	0001                	.insn	2, 0x0001
   133c4:	33b8                	.insn	2, 0x33b8
   133c6:	0001                	.insn	2, 0x0001
   133c8:	33c0                	.insn	2, 0x33c0
   133ca:	0001                	.insn	2, 0x0001
   133cc:	33c0                	.insn	2, 0x33c0
   133ce:	0001                	.insn	2, 0x0001
   133d0:	33c8                	.insn	2, 0x33c8
   133d2:	0001                	.insn	2, 0x0001
   133d4:	33c8                	.insn	2, 0x33c8
   133d6:	0001                	.insn	2, 0x0001
   133d8:	33d0                	.insn	2, 0x33d0
   133da:	0001                	.insn	2, 0x0001
   133dc:	33d0                	.insn	2, 0x33d0
   133de:	0001                	.insn	2, 0x0001
   133e0:	33d8                	.insn	2, 0x33d8
   133e2:	0001                	.insn	2, 0x0001
   133e4:	33d8                	.insn	2, 0x33d8
   133e6:	0001                	.insn	2, 0x0001
   133e8:	33e0                	.insn	2, 0x33e0
   133ea:	0001                	.insn	2, 0x0001
   133ec:	33e0                	.insn	2, 0x33e0
   133ee:	0001                	.insn	2, 0x0001
   133f0:	33e8                	.insn	2, 0x33e8
   133f2:	0001                	.insn	2, 0x0001
   133f4:	33e8                	.insn	2, 0x33e8
   133f6:	0001                	.insn	2, 0x0001
   133f8:	33f0                	.insn	2, 0x33f0
   133fa:	0001                	.insn	2, 0x0001
   133fc:	33f0                	.insn	2, 0x33f0
   133fe:	0001                	.insn	2, 0x0001
   13400:	33f8                	.insn	2, 0x33f8
   13402:	0001                	.insn	2, 0x0001
   13404:	33f8                	.insn	2, 0x33f8
   13406:	0001                	.insn	2, 0x0001
   13408:	3400                	.insn	2, 0x3400
   1340a:	0001                	.insn	2, 0x0001
   1340c:	3400                	.insn	2, 0x3400
   1340e:	0001                	.insn	2, 0x0001
   13410:	3408                	.insn	2, 0x3408
   13412:	0001                	.insn	2, 0x0001
   13414:	3408                	.insn	2, 0x3408
   13416:	0001                	.insn	2, 0x0001
   13418:	3410                	.insn	2, 0x3410
   1341a:	0001                	.insn	2, 0x0001
   1341c:	3410                	.insn	2, 0x3410
   1341e:	0001                	.insn	2, 0x0001
   13420:	3418                	.insn	2, 0x3418
   13422:	0001                	.insn	2, 0x0001
   13424:	3418                	.insn	2, 0x3418
   13426:	0001                	.insn	2, 0x0001
   13428:	3420                	.insn	2, 0x3420
   1342a:	0001                	.insn	2, 0x0001
   1342c:	3420                	.insn	2, 0x3420
   1342e:	0001                	.insn	2, 0x0001
   13430:	3428                	.insn	2, 0x3428
   13432:	0001                	.insn	2, 0x0001
   13434:	3428                	.insn	2, 0x3428
   13436:	0001                	.insn	2, 0x0001
   13438:	3430                	.insn	2, 0x3430
   1343a:	0001                	.insn	2, 0x0001
   1343c:	3430                	.insn	2, 0x3430
   1343e:	0001                	.insn	2, 0x0001
   13440:	3438                	.insn	2, 0x3438
   13442:	0001                	.insn	2, 0x0001
   13444:	3438                	.insn	2, 0x3438
   13446:	0001                	.insn	2, 0x0001
   13448:	3440                	.insn	2, 0x3440
   1344a:	0001                	.insn	2, 0x0001
   1344c:	3440                	.insn	2, 0x3440
   1344e:	0001                	.insn	2, 0x0001
   13450:	3448                	.insn	2, 0x3448
   13452:	0001                	.insn	2, 0x0001
   13454:	3448                	.insn	2, 0x3448
   13456:	0001                	.insn	2, 0x0001
   13458:	3450                	.insn	2, 0x3450
   1345a:	0001                	.insn	2, 0x0001
   1345c:	3450                	.insn	2, 0x3450
   1345e:	0001                	.insn	2, 0x0001
   13460:	3458                	.insn	2, 0x3458
   13462:	0001                	.insn	2, 0x0001
   13464:	3458                	.insn	2, 0x3458
   13466:	0001                	.insn	2, 0x0001
   13468:	3460                	.insn	2, 0x3460
   1346a:	0001                	.insn	2, 0x0001
   1346c:	3460                	.insn	2, 0x3460
   1346e:	0001                	.insn	2, 0x0001
   13470:	3468                	.insn	2, 0x3468
   13472:	0001                	.insn	2, 0x0001
   13474:	3468                	.insn	2, 0x3468
   13476:	0001                	.insn	2, 0x0001
   13478:	3470                	.insn	2, 0x3470
   1347a:	0001                	.insn	2, 0x0001
   1347c:	3470                	.insn	2, 0x3470
   1347e:	0001                	.insn	2, 0x0001
   13480:	3478                	.insn	2, 0x3478
   13482:	0001                	.insn	2, 0x0001
   13484:	3478                	.insn	2, 0x3478
   13486:	0001                	.insn	2, 0x0001
   13488:	3480                	.insn	2, 0x3480
   1348a:	0001                	.insn	2, 0x0001
   1348c:	3480                	.insn	2, 0x3480
   1348e:	0001                	.insn	2, 0x0001
   13490:	3488                	.insn	2, 0x3488
   13492:	0001                	.insn	2, 0x0001
   13494:	3488                	.insn	2, 0x3488
   13496:	0001                	.insn	2, 0x0001
   13498:	3490                	.insn	2, 0x3490
   1349a:	0001                	.insn	2, 0x0001
   1349c:	3490                	.insn	2, 0x3490
   1349e:	0001                	.insn	2, 0x0001
   134a0:	3498                	.insn	2, 0x3498
   134a2:	0001                	.insn	2, 0x0001
   134a4:	3498                	.insn	2, 0x3498
   134a6:	0001                	.insn	2, 0x0001
   134a8:	34a0                	.insn	2, 0x34a0
   134aa:	0001                	.insn	2, 0x0001
   134ac:	34a0                	.insn	2, 0x34a0
   134ae:	0001                	.insn	2, 0x0001
   134b0:	34a8                	.insn	2, 0x34a8
   134b2:	0001                	.insn	2, 0x0001
   134b4:	34a8                	.insn	2, 0x34a8
   134b6:	0001                	.insn	2, 0x0001
   134b8:	34b0                	.insn	2, 0x34b0
   134ba:	0001                	.insn	2, 0x0001
   134bc:	34b0                	.insn	2, 0x34b0
   134be:	0001                	.insn	2, 0x0001
   134c0:	34b8                	.insn	2, 0x34b8
   134c2:	0001                	.insn	2, 0x0001
   134c4:	34b8                	.insn	2, 0x34b8
   134c6:	0001                	.insn	2, 0x0001
   134c8:	34c0                	.insn	2, 0x34c0
   134ca:	0001                	.insn	2, 0x0001
   134cc:	34c0                	.insn	2, 0x34c0
   134ce:	0001                	.insn	2, 0x0001
   134d0:	34c8                	.insn	2, 0x34c8
   134d2:	0001                	.insn	2, 0x0001
   134d4:	34c8                	.insn	2, 0x34c8
   134d6:	0001                	.insn	2, 0x0001
   134d8:	34d0                	.insn	2, 0x34d0
   134da:	0001                	.insn	2, 0x0001
   134dc:	34d0                	.insn	2, 0x34d0
   134de:	0001                	.insn	2, 0x0001
   134e0:	34d8                	.insn	2, 0x34d8
   134e2:	0001                	.insn	2, 0x0001
   134e4:	34d8                	.insn	2, 0x34d8
   134e6:	0001                	.insn	2, 0x0001
   134e8:	34e0                	.insn	2, 0x34e0
   134ea:	0001                	.insn	2, 0x0001
   134ec:	34e0                	.insn	2, 0x34e0
   134ee:	0001                	.insn	2, 0x0001
   134f0:	34e8                	.insn	2, 0x34e8
   134f2:	0001                	.insn	2, 0x0001
   134f4:	34e8                	.insn	2, 0x34e8
   134f6:	0001                	.insn	2, 0x0001
   134f8:	34f0                	.insn	2, 0x34f0
   134fa:	0001                	.insn	2, 0x0001
   134fc:	34f0                	.insn	2, 0x34f0
   134fe:	0001                	.insn	2, 0x0001
   13500:	34f8                	.insn	2, 0x34f8
   13502:	0001                	.insn	2, 0x0001
   13504:	34f8                	.insn	2, 0x34f8
   13506:	0001                	.insn	2, 0x0001
   13508:	3500                	.insn	2, 0x3500
   1350a:	0001                	.insn	2, 0x0001
   1350c:	3500                	.insn	2, 0x3500
   1350e:	0001                	.insn	2, 0x0001
   13510:	3508                	.insn	2, 0x3508
   13512:	0001                	.insn	2, 0x0001
   13514:	3508                	.insn	2, 0x3508
   13516:	0001                	.insn	2, 0x0001
   13518:	3510                	.insn	2, 0x3510
   1351a:	0001                	.insn	2, 0x0001
   1351c:	3510                	.insn	2, 0x3510
   1351e:	0001                	.insn	2, 0x0001
   13520:	3518                	.insn	2, 0x3518
   13522:	0001                	.insn	2, 0x0001
   13524:	3518                	.insn	2, 0x3518
   13526:	0001                	.insn	2, 0x0001
   13528:	3520                	.insn	2, 0x3520
   1352a:	0001                	.insn	2, 0x0001
   1352c:	3520                	.insn	2, 0x3520
   1352e:	0001                	.insn	2, 0x0001
   13530:	3528                	.insn	2, 0x3528
   13532:	0001                	.insn	2, 0x0001
   13534:	3528                	.insn	2, 0x3528
   13536:	0001                	.insn	2, 0x0001
   13538:	3530                	.insn	2, 0x3530
   1353a:	0001                	.insn	2, 0x0001
   1353c:	3530                	.insn	2, 0x3530
   1353e:	0001                	.insn	2, 0x0001
   13540:	3538                	.insn	2, 0x3538
   13542:	0001                	.insn	2, 0x0001
   13544:	3538                	.insn	2, 0x3538
   13546:	0001                	.insn	2, 0x0001
   13548:	3540                	.insn	2, 0x3540
   1354a:	0001                	.insn	2, 0x0001
   1354c:	3540                	.insn	2, 0x3540
   1354e:	0001                	.insn	2, 0x0001
   13550:	3548                	.insn	2, 0x3548
   13552:	0001                	.insn	2, 0x0001
   13554:	3548                	.insn	2, 0x3548
   13556:	0001                	.insn	2, 0x0001
   13558:	3550                	.insn	2, 0x3550
   1355a:	0001                	.insn	2, 0x0001
   1355c:	3550                	.insn	2, 0x3550
   1355e:	0001                	.insn	2, 0x0001
   13560:	3558                	.insn	2, 0x3558
   13562:	0001                	.insn	2, 0x0001
   13564:	3558                	.insn	2, 0x3558
   13566:	0001                	.insn	2, 0x0001
   13568:	3560                	.insn	2, 0x3560
   1356a:	0001                	.insn	2, 0x0001
   1356c:	3560                	.insn	2, 0x3560
   1356e:	0001                	.insn	2, 0x0001
   13570:	3568                	.insn	2, 0x3568
   13572:	0001                	.insn	2, 0x0001
   13574:	3568                	.insn	2, 0x3568
   13576:	0001                	.insn	2, 0x0001
   13578:	3570                	.insn	2, 0x3570
   1357a:	0001                	.insn	2, 0x0001
   1357c:	3570                	.insn	2, 0x3570
   1357e:	0001                	.insn	2, 0x0001
   13580:	3578                	.insn	2, 0x3578
   13582:	0001                	.insn	2, 0x0001
   13584:	3578                	.insn	2, 0x3578
   13586:	0001                	.insn	2, 0x0001
   13588:	3580                	.insn	2, 0x3580
   1358a:	0001                	.insn	2, 0x0001
   1358c:	3580                	.insn	2, 0x3580
   1358e:	0001                	.insn	2, 0x0001
   13590:	3588                	.insn	2, 0x3588
   13592:	0001                	.insn	2, 0x0001
   13594:	3588                	.insn	2, 0x3588
   13596:	0001                	.insn	2, 0x0001
   13598:	3590                	.insn	2, 0x3590
   1359a:	0001                	.insn	2, 0x0001
   1359c:	3590                	.insn	2, 0x3590
   1359e:	0001                	.insn	2, 0x0001
   135a0:	3598                	.insn	2, 0x3598
   135a2:	0001                	.insn	2, 0x0001
   135a4:	3598                	.insn	2, 0x3598
   135a6:	0001                	.insn	2, 0x0001
   135a8:	35a0                	.insn	2, 0x35a0
   135aa:	0001                	.insn	2, 0x0001
   135ac:	35a0                	.insn	2, 0x35a0
   135ae:	0001                	.insn	2, 0x0001
   135b0:	35a8                	.insn	2, 0x35a8
   135b2:	0001                	.insn	2, 0x0001
   135b4:	35a8                	.insn	2, 0x35a8
   135b6:	0001                	.insn	2, 0x0001
   135b8:	35b0                	.insn	2, 0x35b0
   135ba:	0001                	.insn	2, 0x0001
   135bc:	35b0                	.insn	2, 0x35b0
   135be:	0001                	.insn	2, 0x0001
   135c0:	35b8                	.insn	2, 0x35b8
   135c2:	0001                	.insn	2, 0x0001
   135c4:	35b8                	.insn	2, 0x35b8
   135c6:	0001                	.insn	2, 0x0001
   135c8:	35c0                	.insn	2, 0x35c0
   135ca:	0001                	.insn	2, 0x0001
   135cc:	35c0                	.insn	2, 0x35c0
   135ce:	0001                	.insn	2, 0x0001
   135d0:	35c8                	.insn	2, 0x35c8
   135d2:	0001                	.insn	2, 0x0001
   135d4:	35c8                	.insn	2, 0x35c8
   135d6:	0001                	.insn	2, 0x0001
   135d8:	35d0                	.insn	2, 0x35d0
   135da:	0001                	.insn	2, 0x0001
   135dc:	35d0                	.insn	2, 0x35d0
   135de:	0001                	.insn	2, 0x0001
   135e0:	35d8                	.insn	2, 0x35d8
   135e2:	0001                	.insn	2, 0x0001
   135e4:	35d8                	.insn	2, 0x35d8
   135e6:	0001                	.insn	2, 0x0001
   135e8:	35e0                	.insn	2, 0x35e0
   135ea:	0001                	.insn	2, 0x0001
   135ec:	35e0                	.insn	2, 0x35e0
   135ee:	0001                	.insn	2, 0x0001
   135f0:	35e8                	.insn	2, 0x35e8
   135f2:	0001                	.insn	2, 0x0001
   135f4:	35e8                	.insn	2, 0x35e8
   135f6:	0001                	.insn	2, 0x0001
   135f8:	35f0                	.insn	2, 0x35f0
   135fa:	0001                	.insn	2, 0x0001
   135fc:	35f0                	.insn	2, 0x35f0
   135fe:	0001                	.insn	2, 0x0001
   13600:	35f8                	.insn	2, 0x35f8
   13602:	0001                	.insn	2, 0x0001
   13604:	35f8                	.insn	2, 0x35f8
   13606:	0001                	.insn	2, 0x0001
   13608:	3600                	.insn	2, 0x3600
   1360a:	0001                	.insn	2, 0x0001
   1360c:	3600                	.insn	2, 0x3600
   1360e:	0001                	.insn	2, 0x0001
   13610:	3608                	.insn	2, 0x3608
   13612:	0001                	.insn	2, 0x0001
   13614:	3608                	.insn	2, 0x3608
   13616:	0001                	.insn	2, 0x0001
   13618:	3610                	.insn	2, 0x3610
   1361a:	0001                	.insn	2, 0x0001
   1361c:	3610                	.insn	2, 0x3610
   1361e:	0001                	.insn	2, 0x0001
   13620:	3618                	.insn	2, 0x3618
   13622:	0001                	.insn	2, 0x0001
   13624:	3618                	.insn	2, 0x3618
   13626:	0001                	.insn	2, 0x0001
   13628:	3620                	.insn	2, 0x3620
   1362a:	0001                	.insn	2, 0x0001
   1362c:	3620                	.insn	2, 0x3620
   1362e:	0001                	.insn	2, 0x0001
   13630:	3628                	.insn	2, 0x3628
   13632:	0001                	.insn	2, 0x0001
   13634:	3628                	.insn	2, 0x3628
   13636:	0001                	.insn	2, 0x0001
   13638:	3630                	.insn	2, 0x3630
   1363a:	0001                	.insn	2, 0x0001
   1363c:	3630                	.insn	2, 0x3630
   1363e:	0001                	.insn	2, 0x0001
   13640:	3638                	.insn	2, 0x3638
   13642:	0001                	.insn	2, 0x0001
   13644:	3638                	.insn	2, 0x3638
   13646:	0001                	.insn	2, 0x0001
   13648:	3640                	.insn	2, 0x3640
   1364a:	0001                	.insn	2, 0x0001
   1364c:	3640                	.insn	2, 0x3640
   1364e:	0001                	.insn	2, 0x0001
   13650:	3648                	.insn	2, 0x3648
   13652:	0001                	.insn	2, 0x0001
   13654:	3648                	.insn	2, 0x3648
   13656:	0001                	.insn	2, 0x0001
   13658:	3650                	.insn	2, 0x3650
   1365a:	0001                	.insn	2, 0x0001
   1365c:	3650                	.insn	2, 0x3650
   1365e:	0001                	.insn	2, 0x0001
   13660:	3658                	.insn	2, 0x3658
   13662:	0001                	.insn	2, 0x0001
   13664:	3658                	.insn	2, 0x3658
   13666:	0001                	.insn	2, 0x0001
   13668:	3660                	.insn	2, 0x3660
   1366a:	0001                	.insn	2, 0x0001
   1366c:	3660                	.insn	2, 0x3660
   1366e:	0001                	.insn	2, 0x0001
   13670:	3668                	.insn	2, 0x3668
   13672:	0001                	.insn	2, 0x0001
   13674:	3668                	.insn	2, 0x3668
   13676:	0001                	.insn	2, 0x0001

Disassembly of section .sdata:

00013678 <__dso_handle>:
   13678:	0000                	.insn	2, 0x
	...

0001367c <_impure_ptr>:
   1367c:	3150                	.insn	2, 0x3150
   1367e:	0001                	.insn	2, 0x0001

00013680 <__malloc_sbrk_base>:
   13680:	ffff                	.insn	2, 0xffff
   13682:	ffff                	.insn	2, 0xffff

00013684 <__malloc_trim_threshold>:
   13684:	0000                	.insn	2, 0x
   13686:	0002                	.insn	2, 0x0002

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	.insn	4, 0x3a434347
   4:	2820                	.insn	2, 0x2820
   6:	39386367          	.insn	4, 0x39386367
   a:	6431                	.insn	2, 0x6431
   c:	6438                	.insn	2, 0x6438
   e:	65333263          	.insn	4, 0x65333263
  12:	2029                	.insn	2, 0x2029
  14:	3331                	.insn	2, 0x3331
  16:	322e                	.insn	2, 0x322e
  18:	302e                	.insn	2, 0x302e
  1a:	4700                	.insn	2, 0x4700
  1c:	203a4343          	.insn	4, 0x203a4343
  20:	4728                	.insn	2, 0x4728
  22:	554e                	.insn	2, 0x554e
  24:	2029                	.insn	2, 0x2029
  26:	3331                	.insn	2, 0x3331
  28:	322e                	.insn	2, 0x322e
  2a:	302e                	.insn	2, 0x302e
	...

Disassembly of section .riscv.attributes:

00000000 <.riscv.attributes>:
   0:	1b41                	.insn	2, 0x1b41
   2:	0000                	.insn	2, 0x
   4:	7200                	.insn	2, 0x7200
   6:	7369                	.insn	2, 0x7369
   8:	01007663          	bgeu	zero,a6,14 <exit-0x10080>
   c:	0011                	.insn	2, 0x0011
   e:	0000                	.insn	2, 0x
  10:	1004                	.insn	2, 0x1004
  12:	7205                	.insn	2, 0x7205
  14:	3376                	.insn	2, 0x3376
  16:	6932                	.insn	2, 0x6932
  18:	7032                	.insn	2, 0x7032
  1a:	0031                	.insn	2, 0x0031
