
demo.riscv:     file format elf32-littleriscv


Disassembly of section .text:

00010094 <exit>:
   10094:	ff010113          	addi	sp,sp,-16
   10098:	00000593          	li	a1,0
   1009c:	00812423          	sw	s0,8(sp)
   100a0:	00112623          	sw	ra,12(sp)
   100a4:	00050413          	mv	s0,a0
   100a8:	389000ef          	jal	10c30 <__call_exitprocs>
   100ac:	d481a783          	lw	a5,-696(gp) # 13628 <__stdio_exit_handler>
   100b0:	00078463          	beqz	a5,100b8 <exit+0x24>
   100b4:	000780e7          	jalr	a5
   100b8:	00040513          	mv	a0,s0
   100bc:	695010ef          	jal	11f50 <_exit>

000100c0 <register_fini>:
   100c0:	00000793          	li	a5,0
   100c4:	00078863          	beqz	a5,100d4 <register_fini+0x14>
   100c8:	00012537          	lui	a0,0x12
   100cc:	e1850513          	addi	a0,a0,-488 # 11e18 <__libc_fini_array>
   100d0:	4950006f          	j	10d64 <atexit>
   100d4:	00008067          	ret

000100d8 <_start>:
   100d8:	00004197          	auipc	gp,0x4
   100dc:	80818193          	addi	gp,gp,-2040 # 138e0 <__global_pointer$>
   100e0:	d4818513          	addi	a0,gp,-696 # 13628 <__stdio_exit_handler>
   100e4:	07018613          	addi	a2,gp,112 # 13950 <__BSS_END__>
   100e8:	40a60633          	sub	a2,a2,a0
   100ec:	00000593          	li	a1,0
   100f0:	265000ef          	jal	10b54 <memset>
   100f4:	00001517          	auipc	a0,0x1
   100f8:	c7050513          	addi	a0,a0,-912 # 10d64 <atexit>
   100fc:	00050863          	beqz	a0,1010c <_start+0x34>
   10100:	00002517          	auipc	a0,0x2
   10104:	d1850513          	addi	a0,a0,-744 # 11e18 <__libc_fini_array>
   10108:	45d000ef          	jal	10d64 <atexit>
   1010c:	1ad000ef          	jal	10ab8 <__libc_init_array>
   10110:	00012503          	lw	a0,0(sp)
   10114:	00410593          	addi	a1,sp,4
   10118:	00000613          	li	a2,0
   1011c:	06c000ef          	jal	10188 <main>
   10120:	f75ff06f          	j	10094 <exit>

00010124 <__do_global_dtors_aux>:
   10124:	ff010113          	addi	sp,sp,-16
   10128:	00812423          	sw	s0,8(sp)
   1012c:	d641c783          	lbu	a5,-668(gp) # 13644 <completed.1>
   10130:	00112623          	sw	ra,12(sp)
   10134:	02079263          	bnez	a5,10158 <__do_global_dtors_aux+0x34>
   10138:	00000793          	li	a5,0
   1013c:	00078a63          	beqz	a5,10150 <__do_global_dtors_aux+0x2c>
   10140:	00013537          	lui	a0,0x13
   10144:	0cc50513          	addi	a0,a0,204 # 130cc <__EH_FRAME_BEGIN__>
   10148:	00000097          	auipc	ra,0x0
   1014c:	000000e7          	jalr	zero # 0 <exit-0x10094>
   10150:	00100793          	li	a5,1
   10154:	d6f18223          	sb	a5,-668(gp) # 13644 <completed.1>
   10158:	00c12083          	lw	ra,12(sp)
   1015c:	00812403          	lw	s0,8(sp)
   10160:	01010113          	addi	sp,sp,16
   10164:	00008067          	ret

00010168 <frame_dummy>:
   10168:	00000793          	li	a5,0
   1016c:	00078c63          	beqz	a5,10184 <frame_dummy+0x1c>
   10170:	00013537          	lui	a0,0x13
   10174:	d6818593          	addi	a1,gp,-664 # 13648 <object.0>
   10178:	0cc50513          	addi	a0,a0,204 # 130cc <__EH_FRAME_BEGIN__>
   1017c:	00000317          	auipc	t1,0x0
   10180:	00000067          	jr	zero # 0 <exit-0x10094>
   10184:	00008067          	ret

00010188 <main>:
   10188:	fe010113          	addi	sp,sp,-32
   1018c:	00112e23          	sw	ra,28(sp)
   10190:	00812c23          	sw	s0,24(sp)
   10194:	02010413          	addi	s0,sp,32
   10198:	0d4000ef          	jal	1026c <read_char>
   1019c:	00050793          	mv	a5,a0
   101a0:	fef407a3          	sb	a5,-17(s0)
   101a4:	fef44783          	lbu	a5,-17(s0)
   101a8:	00078513          	mv	a0,a5
   101ac:	070000ef          	jal	1021c <print_c>
   101b0:	098000ef          	jal	10248 <exit_proc>
   101b4:	00000793          	li	a5,0
   101b8:	00078513          	mv	a0,a5
   101bc:	01c12083          	lw	ra,28(sp)
   101c0:	01812403          	lw	s0,24(sp)
   101c4:	02010113          	addi	sp,sp,32
   101c8:	00008067          	ret

000101cc <print_d>:
   101cc:	fe010113          	addi	sp,sp,-32
   101d0:	00812e23          	sw	s0,28(sp)
   101d4:	02010413          	addi	s0,sp,32
   101d8:	fea42623          	sw	a0,-20(s0)
   101dc:	00200893          	li	a7,2
   101e0:	00000073          	ecall
   101e4:	00000013          	nop
   101e8:	01c12403          	lw	s0,28(sp)
   101ec:	02010113          	addi	sp,sp,32
   101f0:	00008067          	ret

000101f4 <print_s>:
   101f4:	fe010113          	addi	sp,sp,-32
   101f8:	00812e23          	sw	s0,28(sp)
   101fc:	02010413          	addi	s0,sp,32
   10200:	fea42623          	sw	a0,-20(s0)
   10204:	00000893          	li	a7,0
   10208:	00000073          	ecall
   1020c:	00000013          	nop
   10210:	01c12403          	lw	s0,28(sp)
   10214:	02010113          	addi	sp,sp,32
   10218:	00008067          	ret

0001021c <print_c>:
   1021c:	fe010113          	addi	sp,sp,-32
   10220:	00812e23          	sw	s0,28(sp)
   10224:	02010413          	addi	s0,sp,32
   10228:	00050793          	mv	a5,a0
   1022c:	fef407a3          	sb	a5,-17(s0)
   10230:	00100893          	li	a7,1
   10234:	00000073          	ecall
   10238:	00000013          	nop
   1023c:	01c12403          	lw	s0,28(sp)
   10240:	02010113          	addi	sp,sp,32
   10244:	00008067          	ret

00010248 <exit_proc>:
   10248:	ff010113          	addi	sp,sp,-16
   1024c:	00812623          	sw	s0,12(sp)
   10250:	01010413          	addi	s0,sp,16
   10254:	00300893          	li	a7,3
   10258:	00000073          	ecall
   1025c:	00000013          	nop
   10260:	00c12403          	lw	s0,12(sp)
   10264:	01010113          	addi	sp,sp,16
   10268:	00008067          	ret

0001026c <read_char>:
   1026c:	fe010113          	addi	sp,sp,-32
   10270:	00812e23          	sw	s0,28(sp)
   10274:	02010413          	addi	s0,sp,32
   10278:	00400893          	li	a7,4
   1027c:	00000073          	ecall
   10280:	00050793          	mv	a5,a0
   10284:	fef407a3          	sb	a5,-17(s0)
   10288:	fef44783          	lbu	a5,-17(s0)
   1028c:	00078513          	mv	a0,a5
   10290:	01c12403          	lw	s0,28(sp)
   10294:	02010113          	addi	sp,sp,32
   10298:	00008067          	ret

0001029c <read_num>:
   1029c:	fe010113          	addi	sp,sp,-32
   102a0:	00812e23          	sw	s0,28(sp)
   102a4:	02010413          	addi	s0,sp,32
   102a8:	00500893          	li	a7,5
   102ac:	00000073          	ecall
   102b0:	00050713          	mv	a4,a0
   102b4:	fee42423          	sw	a4,-24(s0)
   102b8:	fef42623          	sw	a5,-20(s0)
   102bc:	fe842703          	lw	a4,-24(s0)
   102c0:	fec42783          	lw	a5,-20(s0)
   102c4:	00070513          	mv	a0,a4
   102c8:	00078593          	mv	a1,a5
   102cc:	01c12403          	lw	s0,28(sp)
   102d0:	02010113          	addi	sp,sp,32
   102d4:	00008067          	ret

000102d8 <__fp_lock>:
   102d8:	00000513          	li	a0,0
   102dc:	00008067          	ret

000102e0 <stdio_exit_handler>:
   102e0:	00013637          	lui	a2,0x13
   102e4:	000125b7          	lui	a1,0x12
   102e8:	00013537          	lui	a0,0x13
   102ec:	0e060613          	addi	a2,a2,224 # 130e0 <__sglue>
   102f0:	97858593          	addi	a1,a1,-1672 # 11978 <_fclose_r>
   102f4:	0f050513          	addi	a0,a0,240 # 130f0 <_impure_data>
   102f8:	3480006f          	j	10640 <_fwalk_sglue>

000102fc <cleanup_stdio>:
   102fc:	00452583          	lw	a1,4(a0)
   10300:	ff010113          	addi	sp,sp,-16
   10304:	00812423          	sw	s0,8(sp)
   10308:	00112623          	sw	ra,12(sp)
   1030c:	d8018793          	addi	a5,gp,-640 # 13660 <__sf>
   10310:	00050413          	mv	s0,a0
   10314:	00f58463          	beq	a1,a5,1031c <cleanup_stdio+0x20>
   10318:	660010ef          	jal	11978 <_fclose_r>
   1031c:	00842583          	lw	a1,8(s0)
   10320:	de818793          	addi	a5,gp,-536 # 136c8 <__sf+0x68>
   10324:	00f58663          	beq	a1,a5,10330 <cleanup_stdio+0x34>
   10328:	00040513          	mv	a0,s0
   1032c:	64c010ef          	jal	11978 <_fclose_r>
   10330:	00c42583          	lw	a1,12(s0)
   10334:	e5018793          	addi	a5,gp,-432 # 13730 <__sf+0xd0>
   10338:	00f58c63          	beq	a1,a5,10350 <cleanup_stdio+0x54>
   1033c:	00040513          	mv	a0,s0
   10340:	00812403          	lw	s0,8(sp)
   10344:	00c12083          	lw	ra,12(sp)
   10348:	01010113          	addi	sp,sp,16
   1034c:	62c0106f          	j	11978 <_fclose_r>
   10350:	00c12083          	lw	ra,12(sp)
   10354:	00812403          	lw	s0,8(sp)
   10358:	01010113          	addi	sp,sp,16
   1035c:	00008067          	ret

00010360 <__fp_unlock>:
   10360:	00000513          	li	a0,0
   10364:	00008067          	ret

00010368 <global_stdio_init.part.0>:
   10368:	fe010113          	addi	sp,sp,-32
   1036c:	000107b7          	lui	a5,0x10
   10370:	00812c23          	sw	s0,24(sp)
   10374:	2e078793          	addi	a5,a5,736 # 102e0 <stdio_exit_handler>
   10378:	d8018413          	addi	s0,gp,-640 # 13660 <__sf>
   1037c:	00112e23          	sw	ra,28(sp)
   10380:	00912a23          	sw	s1,20(sp)
   10384:	01212823          	sw	s2,16(sp)
   10388:	01312623          	sw	s3,12(sp)
   1038c:	01412423          	sw	s4,8(sp)
   10390:	d4f1a423          	sw	a5,-696(gp) # 13628 <__stdio_exit_handler>
   10394:	00800613          	li	a2,8
   10398:	00400793          	li	a5,4
   1039c:	00000593          	li	a1,0
   103a0:	ddc18513          	addi	a0,gp,-548 # 136bc <__sf+0x5c>
   103a4:	00f42623          	sw	a5,12(s0)
   103a8:	00042023          	sw	zero,0(s0)
   103ac:	00042223          	sw	zero,4(s0)
   103b0:	00042423          	sw	zero,8(s0)
   103b4:	06042223          	sw	zero,100(s0)
   103b8:	00042823          	sw	zero,16(s0)
   103bc:	00042a23          	sw	zero,20(s0)
   103c0:	00042c23          	sw	zero,24(s0)
   103c4:	790000ef          	jal	10b54 <memset>
   103c8:	000107b7          	lui	a5,0x10
   103cc:	00010a37          	lui	s4,0x10
   103d0:	000109b7          	lui	s3,0x10
   103d4:	00010937          	lui	s2,0x10
   103d8:	000114b7          	lui	s1,0x11
   103dc:	6f4a0a13          	addi	s4,s4,1780 # 106f4 <__sread>
   103e0:	75898993          	addi	s3,s3,1880 # 10758 <__swrite>
   103e4:	7e090913          	addi	s2,s2,2016 # 107e0 <__sseek>
   103e8:	85848493          	addi	s1,s1,-1960 # 10858 <__sclose>
   103ec:	00978793          	addi	a5,a5,9 # 10009 <exit-0x8b>
   103f0:	00800613          	li	a2,8
   103f4:	00000593          	li	a1,0
   103f8:	e4418513          	addi	a0,gp,-444 # 13724 <__sf+0xc4>
   103fc:	03442023          	sw	s4,32(s0)
   10400:	03342223          	sw	s3,36(s0)
   10404:	03242423          	sw	s2,40(s0)
   10408:	02942623          	sw	s1,44(s0)
   1040c:	06f42a23          	sw	a5,116(s0)
   10410:	00842e23          	sw	s0,28(s0)
   10414:	06042423          	sw	zero,104(s0)
   10418:	06042623          	sw	zero,108(s0)
   1041c:	06042823          	sw	zero,112(s0)
   10420:	0c042623          	sw	zero,204(s0)
   10424:	06042c23          	sw	zero,120(s0)
   10428:	06042e23          	sw	zero,124(s0)
   1042c:	08042023          	sw	zero,128(s0)
   10430:	724000ef          	jal	10b54 <memset>
   10434:	000207b7          	lui	a5,0x20
   10438:	01278793          	addi	a5,a5,18 # 20012 <__BSS_END__+0xc6c2>
   1043c:	de818713          	addi	a4,gp,-536 # 136c8 <__sf+0x68>
   10440:	00800613          	li	a2,8
   10444:	00000593          	li	a1,0
   10448:	eac18513          	addi	a0,gp,-340 # 1378c <__sf+0x12c>
   1044c:	09442423          	sw	s4,136(s0)
   10450:	09342623          	sw	s3,140(s0)
   10454:	09242823          	sw	s2,144(s0)
   10458:	08942a23          	sw	s1,148(s0)
   1045c:	0cf42e23          	sw	a5,220(s0)
   10460:	08e42223          	sw	a4,132(s0)
   10464:	0c042823          	sw	zero,208(s0)
   10468:	0c042a23          	sw	zero,212(s0)
   1046c:	0c042c23          	sw	zero,216(s0)
   10470:	12042a23          	sw	zero,308(s0)
   10474:	0e042023          	sw	zero,224(s0)
   10478:	0e042223          	sw	zero,228(s0)
   1047c:	0e042423          	sw	zero,232(s0)
   10480:	6d4000ef          	jal	10b54 <memset>
   10484:	e5018793          	addi	a5,gp,-432 # 13730 <__sf+0xd0>
   10488:	0f442823          	sw	s4,240(s0)
   1048c:	0f342a23          	sw	s3,244(s0)
   10490:	0f242c23          	sw	s2,248(s0)
   10494:	0e942e23          	sw	s1,252(s0)
   10498:	01c12083          	lw	ra,28(sp)
   1049c:	0ef42623          	sw	a5,236(s0)
   104a0:	01812403          	lw	s0,24(sp)
   104a4:	01412483          	lw	s1,20(sp)
   104a8:	01012903          	lw	s2,16(sp)
   104ac:	00c12983          	lw	s3,12(sp)
   104b0:	00812a03          	lw	s4,8(sp)
   104b4:	02010113          	addi	sp,sp,32
   104b8:	00008067          	ret

000104bc <__sfp>:
   104bc:	d481a783          	lw	a5,-696(gp) # 13628 <__stdio_exit_handler>
   104c0:	fe010113          	addi	sp,sp,-32
   104c4:	01312623          	sw	s3,12(sp)
   104c8:	00112e23          	sw	ra,28(sp)
   104cc:	00812c23          	sw	s0,24(sp)
   104d0:	00912a23          	sw	s1,20(sp)
   104d4:	01212823          	sw	s2,16(sp)
   104d8:	00050993          	mv	s3,a0
   104dc:	0e078863          	beqz	a5,105cc <__sfp+0x110>
   104e0:	00013937          	lui	s2,0x13
   104e4:	0e090913          	addi	s2,s2,224 # 130e0 <__sglue>
   104e8:	fff00493          	li	s1,-1
   104ec:	00492783          	lw	a5,4(s2)
   104f0:	00892403          	lw	s0,8(s2)
   104f4:	fff78793          	addi	a5,a5,-1
   104f8:	0007d863          	bgez	a5,10508 <__sfp+0x4c>
   104fc:	0800006f          	j	1057c <__sfp+0xc0>
   10500:	06840413          	addi	s0,s0,104
   10504:	06978c63          	beq	a5,s1,1057c <__sfp+0xc0>
   10508:	00c41703          	lh	a4,12(s0)
   1050c:	fff78793          	addi	a5,a5,-1
   10510:	fe0718e3          	bnez	a4,10500 <__sfp+0x44>
   10514:	ffff07b7          	lui	a5,0xffff0
   10518:	00178793          	addi	a5,a5,1 # ffff0001 <__BSS_END__+0xfffdc6b1>
   1051c:	00f42623          	sw	a5,12(s0)
   10520:	06042223          	sw	zero,100(s0)
   10524:	00042023          	sw	zero,0(s0)
   10528:	00042423          	sw	zero,8(s0)
   1052c:	00042223          	sw	zero,4(s0)
   10530:	00042823          	sw	zero,16(s0)
   10534:	00042a23          	sw	zero,20(s0)
   10538:	00042c23          	sw	zero,24(s0)
   1053c:	00800613          	li	a2,8
   10540:	00000593          	li	a1,0
   10544:	05c40513          	addi	a0,s0,92
   10548:	60c000ef          	jal	10b54 <memset>
   1054c:	02042823          	sw	zero,48(s0)
   10550:	02042a23          	sw	zero,52(s0)
   10554:	04042223          	sw	zero,68(s0)
   10558:	04042423          	sw	zero,72(s0)
   1055c:	01c12083          	lw	ra,28(sp)
   10560:	00040513          	mv	a0,s0
   10564:	01812403          	lw	s0,24(sp)
   10568:	01412483          	lw	s1,20(sp)
   1056c:	01012903          	lw	s2,16(sp)
   10570:	00c12983          	lw	s3,12(sp)
   10574:	02010113          	addi	sp,sp,32
   10578:	00008067          	ret
   1057c:	00092403          	lw	s0,0(s2)
   10580:	00040663          	beqz	s0,1058c <__sfp+0xd0>
   10584:	00040913          	mv	s2,s0
   10588:	f65ff06f          	j	104ec <__sfp+0x30>
   1058c:	1ac00593          	li	a1,428
   10590:	00098513          	mv	a0,s3
   10594:	421000ef          	jal	111b4 <_malloc_r>
   10598:	00050413          	mv	s0,a0
   1059c:	02050c63          	beqz	a0,105d4 <__sfp+0x118>
   105a0:	00c50513          	addi	a0,a0,12
   105a4:	00400793          	li	a5,4
   105a8:	00042023          	sw	zero,0(s0)
   105ac:	00f42223          	sw	a5,4(s0)
   105b0:	00a42423          	sw	a0,8(s0)
   105b4:	1a000613          	li	a2,416
   105b8:	00000593          	li	a1,0
   105bc:	598000ef          	jal	10b54 <memset>
   105c0:	00892023          	sw	s0,0(s2)
   105c4:	00040913          	mv	s2,s0
   105c8:	f25ff06f          	j	104ec <__sfp+0x30>
   105cc:	d9dff0ef          	jal	10368 <global_stdio_init.part.0>
   105d0:	f11ff06f          	j	104e0 <__sfp+0x24>
   105d4:	00092023          	sw	zero,0(s2)
   105d8:	00c00793          	li	a5,12
   105dc:	00f9a023          	sw	a5,0(s3)
   105e0:	f7dff06f          	j	1055c <__sfp+0xa0>

000105e4 <__sinit>:
   105e4:	03452783          	lw	a5,52(a0)
   105e8:	00078463          	beqz	a5,105f0 <__sinit+0xc>
   105ec:	00008067          	ret
   105f0:	d481a703          	lw	a4,-696(gp) # 13628 <__stdio_exit_handler>
   105f4:	000107b7          	lui	a5,0x10
   105f8:	2fc78793          	addi	a5,a5,764 # 102fc <cleanup_stdio>
   105fc:	02f52a23          	sw	a5,52(a0)
   10600:	fe0716e3          	bnez	a4,105ec <__sinit+0x8>
   10604:	d65ff06f          	j	10368 <global_stdio_init.part.0>

00010608 <__sfp_lock_acquire>:
   10608:	00008067          	ret

0001060c <__sfp_lock_release>:
   1060c:	00008067          	ret

00010610 <__fp_lock_all>:
   10610:	00013637          	lui	a2,0x13
   10614:	000105b7          	lui	a1,0x10
   10618:	0e060613          	addi	a2,a2,224 # 130e0 <__sglue>
   1061c:	2d858593          	addi	a1,a1,728 # 102d8 <__fp_lock>
   10620:	00000513          	li	a0,0
   10624:	01c0006f          	j	10640 <_fwalk_sglue>

00010628 <__fp_unlock_all>:
   10628:	00013637          	lui	a2,0x13
   1062c:	000105b7          	lui	a1,0x10
   10630:	0e060613          	addi	a2,a2,224 # 130e0 <__sglue>
   10634:	36058593          	addi	a1,a1,864 # 10360 <__fp_unlock>
   10638:	00000513          	li	a0,0
   1063c:	0040006f          	j	10640 <_fwalk_sglue>

00010640 <_fwalk_sglue>:
   10640:	fd010113          	addi	sp,sp,-48
   10644:	03212023          	sw	s2,32(sp)
   10648:	01312e23          	sw	s3,28(sp)
   1064c:	01412c23          	sw	s4,24(sp)
   10650:	01512a23          	sw	s5,20(sp)
   10654:	01612823          	sw	s6,16(sp)
   10658:	01712623          	sw	s7,12(sp)
   1065c:	02112623          	sw	ra,44(sp)
   10660:	02812423          	sw	s0,40(sp)
   10664:	02912223          	sw	s1,36(sp)
   10668:	00050b13          	mv	s6,a0
   1066c:	00058b93          	mv	s7,a1
   10670:	00060a93          	mv	s5,a2
   10674:	00000a13          	li	s4,0
   10678:	00100993          	li	s3,1
   1067c:	fff00913          	li	s2,-1
   10680:	004aa483          	lw	s1,4(s5)
   10684:	008aa403          	lw	s0,8(s5)
   10688:	fff48493          	addi	s1,s1,-1
   1068c:	0204c863          	bltz	s1,106bc <_fwalk_sglue+0x7c>
   10690:	00c45783          	lhu	a5,12(s0)
   10694:	00f9fe63          	bgeu	s3,a5,106b0 <_fwalk_sglue+0x70>
   10698:	00e41783          	lh	a5,14(s0)
   1069c:	00040593          	mv	a1,s0
   106a0:	000b0513          	mv	a0,s6
   106a4:	01278663          	beq	a5,s2,106b0 <_fwalk_sglue+0x70>
   106a8:	000b80e7          	jalr	s7
   106ac:	00aa6a33          	or	s4,s4,a0
   106b0:	fff48493          	addi	s1,s1,-1
   106b4:	06840413          	addi	s0,s0,104
   106b8:	fd249ce3          	bne	s1,s2,10690 <_fwalk_sglue+0x50>
   106bc:	000aaa83          	lw	s5,0(s5)
   106c0:	fc0a90e3          	bnez	s5,10680 <_fwalk_sglue+0x40>
   106c4:	02c12083          	lw	ra,44(sp)
   106c8:	02812403          	lw	s0,40(sp)
   106cc:	02412483          	lw	s1,36(sp)
   106d0:	02012903          	lw	s2,32(sp)
   106d4:	01c12983          	lw	s3,28(sp)
   106d8:	01412a83          	lw	s5,20(sp)
   106dc:	01012b03          	lw	s6,16(sp)
   106e0:	00c12b83          	lw	s7,12(sp)
   106e4:	000a0513          	mv	a0,s4
   106e8:	01812a03          	lw	s4,24(sp)
   106ec:	03010113          	addi	sp,sp,48
   106f0:	00008067          	ret

000106f4 <__sread>:
   106f4:	ff010113          	addi	sp,sp,-16
   106f8:	00812423          	sw	s0,8(sp)
   106fc:	00058413          	mv	s0,a1
   10700:	00e59583          	lh	a1,14(a1)
   10704:	00112623          	sw	ra,12(sp)
   10708:	2e0000ef          	jal	109e8 <_read_r>
   1070c:	02054063          	bltz	a0,1072c <__sread+0x38>
   10710:	05042783          	lw	a5,80(s0)
   10714:	00c12083          	lw	ra,12(sp)
   10718:	00a787b3          	add	a5,a5,a0
   1071c:	04f42823          	sw	a5,80(s0)
   10720:	00812403          	lw	s0,8(sp)
   10724:	01010113          	addi	sp,sp,16
   10728:	00008067          	ret
   1072c:	00c45783          	lhu	a5,12(s0)
   10730:	fffff737          	lui	a4,0xfffff
   10734:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffeb6af>
   10738:	00e7f7b3          	and	a5,a5,a4
   1073c:	00c12083          	lw	ra,12(sp)
   10740:	00f41623          	sh	a5,12(s0)
   10744:	00812403          	lw	s0,8(sp)
   10748:	01010113          	addi	sp,sp,16
   1074c:	00008067          	ret

00010750 <__seofread>:
   10750:	00000513          	li	a0,0
   10754:	00008067          	ret

00010758 <__swrite>:
   10758:	00c59783          	lh	a5,12(a1)
   1075c:	fe010113          	addi	sp,sp,-32
   10760:	00812c23          	sw	s0,24(sp)
   10764:	00912a23          	sw	s1,20(sp)
   10768:	01212823          	sw	s2,16(sp)
   1076c:	01312623          	sw	s3,12(sp)
   10770:	00112e23          	sw	ra,28(sp)
   10774:	1007f713          	andi	a4,a5,256
   10778:	00058413          	mv	s0,a1
   1077c:	00050493          	mv	s1,a0
   10780:	00060913          	mv	s2,a2
   10784:	00068993          	mv	s3,a3
   10788:	04071063          	bnez	a4,107c8 <__swrite+0x70>
   1078c:	fffff737          	lui	a4,0xfffff
   10790:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffeb6af>
   10794:	00e7f7b3          	and	a5,a5,a4
   10798:	00e41583          	lh	a1,14(s0)
   1079c:	00f41623          	sh	a5,12(s0)
   107a0:	01812403          	lw	s0,24(sp)
   107a4:	01c12083          	lw	ra,28(sp)
   107a8:	00098693          	mv	a3,s3
   107ac:	00090613          	mv	a2,s2
   107b0:	00c12983          	lw	s3,12(sp)
   107b4:	01012903          	lw	s2,16(sp)
   107b8:	00048513          	mv	a0,s1
   107bc:	01412483          	lw	s1,20(sp)
   107c0:	02010113          	addi	sp,sp,32
   107c4:	28c0006f          	j	10a50 <_write_r>
   107c8:	00e59583          	lh	a1,14(a1)
   107cc:	00200693          	li	a3,2
   107d0:	00000613          	li	a2,0
   107d4:	1ac000ef          	jal	10980 <_lseek_r>
   107d8:	00c41783          	lh	a5,12(s0)
   107dc:	fb1ff06f          	j	1078c <__swrite+0x34>

000107e0 <__sseek>:
   107e0:	ff010113          	addi	sp,sp,-16
   107e4:	00812423          	sw	s0,8(sp)
   107e8:	00058413          	mv	s0,a1
   107ec:	00e59583          	lh	a1,14(a1)
   107f0:	00112623          	sw	ra,12(sp)
   107f4:	18c000ef          	jal	10980 <_lseek_r>
   107f8:	fff00793          	li	a5,-1
   107fc:	02f50863          	beq	a0,a5,1082c <__sseek+0x4c>
   10800:	00c45783          	lhu	a5,12(s0)
   10804:	00001737          	lui	a4,0x1
   10808:	00c12083          	lw	ra,12(sp)
   1080c:	00e7e7b3          	or	a5,a5,a4
   10810:	01079793          	slli	a5,a5,0x10
   10814:	4107d793          	srai	a5,a5,0x10
   10818:	04a42823          	sw	a0,80(s0)
   1081c:	00f41623          	sh	a5,12(s0)
   10820:	00812403          	lw	s0,8(sp)
   10824:	01010113          	addi	sp,sp,16
   10828:	00008067          	ret
   1082c:	00c45783          	lhu	a5,12(s0)
   10830:	fffff737          	lui	a4,0xfffff
   10834:	fff70713          	addi	a4,a4,-1 # ffffefff <__BSS_END__+0xfffeb6af>
   10838:	00e7f7b3          	and	a5,a5,a4
   1083c:	01079793          	slli	a5,a5,0x10
   10840:	4107d793          	srai	a5,a5,0x10
   10844:	00c12083          	lw	ra,12(sp)
   10848:	00f41623          	sh	a5,12(s0)
   1084c:	00812403          	lw	s0,8(sp)
   10850:	01010113          	addi	sp,sp,16
   10854:	00008067          	ret

00010858 <__sclose>:
   10858:	00e59583          	lh	a1,14(a1)
   1085c:	0040006f          	j	10860 <_close_r>

00010860 <_close_r>:
   10860:	ff010113          	addi	sp,sp,-16
   10864:	00812423          	sw	s0,8(sp)
   10868:	00912223          	sw	s1,4(sp)
   1086c:	00050413          	mv	s0,a0
   10870:	00058513          	mv	a0,a1
   10874:	00112623          	sw	ra,12(sp)
   10878:	d401a623          	sw	zero,-692(gp) # 1362c <errno>
   1087c:	690010ef          	jal	11f0c <_close>
   10880:	fff00793          	li	a5,-1
   10884:	00f50c63          	beq	a0,a5,1089c <_close_r+0x3c>
   10888:	00c12083          	lw	ra,12(sp)
   1088c:	00812403          	lw	s0,8(sp)
   10890:	00412483          	lw	s1,4(sp)
   10894:	01010113          	addi	sp,sp,16
   10898:	00008067          	ret
   1089c:	d4c1a783          	lw	a5,-692(gp) # 1362c <errno>
   108a0:	fe0784e3          	beqz	a5,10888 <_close_r+0x28>
   108a4:	00c12083          	lw	ra,12(sp)
   108a8:	00f42023          	sw	a5,0(s0)
   108ac:	00812403          	lw	s0,8(sp)
   108b0:	00412483          	lw	s1,4(sp)
   108b4:	01010113          	addi	sp,sp,16
   108b8:	00008067          	ret

000108bc <_reclaim_reent>:
   108bc:	d3c1a783          	lw	a5,-708(gp) # 1361c <_impure_ptr>
   108c0:	0aa78e63          	beq	a5,a0,1097c <_reclaim_reent+0xc0>
   108c4:	04452583          	lw	a1,68(a0)
   108c8:	fe010113          	addi	sp,sp,-32
   108cc:	00912a23          	sw	s1,20(sp)
   108d0:	00112e23          	sw	ra,28(sp)
   108d4:	00050493          	mv	s1,a0
   108d8:	04058c63          	beqz	a1,10930 <_reclaim_reent+0x74>
   108dc:	01212823          	sw	s2,16(sp)
   108e0:	01312623          	sw	s3,12(sp)
   108e4:	00812c23          	sw	s0,24(sp)
   108e8:	00000913          	li	s2,0
   108ec:	08000993          	li	s3,128
   108f0:	012587b3          	add	a5,a1,s2
   108f4:	0007a403          	lw	s0,0(a5)
   108f8:	00040e63          	beqz	s0,10914 <_reclaim_reent+0x58>
   108fc:	00040593          	mv	a1,s0
   10900:	00042403          	lw	s0,0(s0)
   10904:	00048513          	mv	a0,s1
   10908:	5a8000ef          	jal	10eb0 <_free_r>
   1090c:	fe0418e3          	bnez	s0,108fc <_reclaim_reent+0x40>
   10910:	0444a583          	lw	a1,68(s1)
   10914:	00490913          	addi	s2,s2,4
   10918:	fd391ce3          	bne	s2,s3,108f0 <_reclaim_reent+0x34>
   1091c:	00048513          	mv	a0,s1
   10920:	590000ef          	jal	10eb0 <_free_r>
   10924:	01812403          	lw	s0,24(sp)
   10928:	01012903          	lw	s2,16(sp)
   1092c:	00c12983          	lw	s3,12(sp)
   10930:	0384a583          	lw	a1,56(s1)
   10934:	00058663          	beqz	a1,10940 <_reclaim_reent+0x84>
   10938:	00048513          	mv	a0,s1
   1093c:	574000ef          	jal	10eb0 <_free_r>
   10940:	04c4a583          	lw	a1,76(s1)
   10944:	00058663          	beqz	a1,10950 <_reclaim_reent+0x94>
   10948:	00048513          	mv	a0,s1
   1094c:	564000ef          	jal	10eb0 <_free_r>
   10950:	0344a783          	lw	a5,52(s1)
   10954:	00078c63          	beqz	a5,1096c <_reclaim_reent+0xb0>
   10958:	01c12083          	lw	ra,28(sp)
   1095c:	00048513          	mv	a0,s1
   10960:	01412483          	lw	s1,20(sp)
   10964:	02010113          	addi	sp,sp,32
   10968:	00078067          	jr	a5
   1096c:	01c12083          	lw	ra,28(sp)
   10970:	01412483          	lw	s1,20(sp)
   10974:	02010113          	addi	sp,sp,32
   10978:	00008067          	ret
   1097c:	00008067          	ret

00010980 <_lseek_r>:
   10980:	ff010113          	addi	sp,sp,-16
   10984:	00058713          	mv	a4,a1
   10988:	00812423          	sw	s0,8(sp)
   1098c:	00912223          	sw	s1,4(sp)
   10990:	00060593          	mv	a1,a2
   10994:	00050413          	mv	s0,a0
   10998:	00068613          	mv	a2,a3
   1099c:	00070513          	mv	a0,a4
   109a0:	00112623          	sw	ra,12(sp)
   109a4:	d401a623          	sw	zero,-692(gp) # 1362c <errno>
   109a8:	5d8010ef          	jal	11f80 <_lseek>
   109ac:	fff00793          	li	a5,-1
   109b0:	00f50c63          	beq	a0,a5,109c8 <_lseek_r+0x48>
   109b4:	00c12083          	lw	ra,12(sp)
   109b8:	00812403          	lw	s0,8(sp)
   109bc:	00412483          	lw	s1,4(sp)
   109c0:	01010113          	addi	sp,sp,16
   109c4:	00008067          	ret
   109c8:	d4c1a783          	lw	a5,-692(gp) # 1362c <errno>
   109cc:	fe0784e3          	beqz	a5,109b4 <_lseek_r+0x34>
   109d0:	00c12083          	lw	ra,12(sp)
   109d4:	00f42023          	sw	a5,0(s0)
   109d8:	00812403          	lw	s0,8(sp)
   109dc:	00412483          	lw	s1,4(sp)
   109e0:	01010113          	addi	sp,sp,16
   109e4:	00008067          	ret

000109e8 <_read_r>:
   109e8:	ff010113          	addi	sp,sp,-16
   109ec:	00058713          	mv	a4,a1
   109f0:	00812423          	sw	s0,8(sp)
   109f4:	00912223          	sw	s1,4(sp)
   109f8:	00060593          	mv	a1,a2
   109fc:	00050413          	mv	s0,a0
   10a00:	00068613          	mv	a2,a3
   10a04:	00070513          	mv	a0,a4
   10a08:	00112623          	sw	ra,12(sp)
   10a0c:	d401a623          	sw	zero,-692(gp) # 1362c <errno>
   10a10:	5b4010ef          	jal	11fc4 <_read>
   10a14:	fff00793          	li	a5,-1
   10a18:	00f50c63          	beq	a0,a5,10a30 <_read_r+0x48>
   10a1c:	00c12083          	lw	ra,12(sp)
   10a20:	00812403          	lw	s0,8(sp)
   10a24:	00412483          	lw	s1,4(sp)
   10a28:	01010113          	addi	sp,sp,16
   10a2c:	00008067          	ret
   10a30:	d4c1a783          	lw	a5,-692(gp) # 1362c <errno>
   10a34:	fe0784e3          	beqz	a5,10a1c <_read_r+0x34>
   10a38:	00c12083          	lw	ra,12(sp)
   10a3c:	00f42023          	sw	a5,0(s0)
   10a40:	00812403          	lw	s0,8(sp)
   10a44:	00412483          	lw	s1,4(sp)
   10a48:	01010113          	addi	sp,sp,16
   10a4c:	00008067          	ret

00010a50 <_write_r>:
   10a50:	ff010113          	addi	sp,sp,-16
   10a54:	00058713          	mv	a4,a1
   10a58:	00812423          	sw	s0,8(sp)
   10a5c:	00912223          	sw	s1,4(sp)
   10a60:	00060593          	mv	a1,a2
   10a64:	00050413          	mv	s0,a0
   10a68:	00068613          	mv	a2,a3
   10a6c:	00070513          	mv	a0,a4
   10a70:	00112623          	sw	ra,12(sp)
   10a74:	d401a623          	sw	zero,-692(gp) # 1362c <errno>
   10a78:	608010ef          	jal	12080 <_write>
   10a7c:	fff00793          	li	a5,-1
   10a80:	00f50c63          	beq	a0,a5,10a98 <_write_r+0x48>
   10a84:	00c12083          	lw	ra,12(sp)
   10a88:	00812403          	lw	s0,8(sp)
   10a8c:	00412483          	lw	s1,4(sp)
   10a90:	01010113          	addi	sp,sp,16
   10a94:	00008067          	ret
   10a98:	d4c1a783          	lw	a5,-692(gp) # 1362c <errno>
   10a9c:	fe0784e3          	beqz	a5,10a84 <_write_r+0x34>
   10aa0:	00c12083          	lw	ra,12(sp)
   10aa4:	00f42023          	sw	a5,0(s0)
   10aa8:	00812403          	lw	s0,8(sp)
   10aac:	00412483          	lw	s1,4(sp)
   10ab0:	01010113          	addi	sp,sp,16
   10ab4:	00008067          	ret

00010ab8 <__libc_init_array>:
   10ab8:	ff010113          	addi	sp,sp,-16
   10abc:	00812423          	sw	s0,8(sp)
   10ac0:	000137b7          	lui	a5,0x13
   10ac4:	00013437          	lui	s0,0x13
   10ac8:	01212023          	sw	s2,0(sp)
   10acc:	0d078793          	addi	a5,a5,208 # 130d0 <__init_array_start>
   10ad0:	0d040713          	addi	a4,s0,208 # 130d0 <__init_array_start>
   10ad4:	00112623          	sw	ra,12(sp)
   10ad8:	00912223          	sw	s1,4(sp)
   10adc:	40e78933          	sub	s2,a5,a4
   10ae0:	02e78263          	beq	a5,a4,10b04 <__libc_init_array+0x4c>
   10ae4:	40295913          	srai	s2,s2,0x2
   10ae8:	0d040413          	addi	s0,s0,208
   10aec:	00000493          	li	s1,0
   10af0:	00042783          	lw	a5,0(s0)
   10af4:	00148493          	addi	s1,s1,1
   10af8:	00440413          	addi	s0,s0,4
   10afc:	000780e7          	jalr	a5
   10b00:	ff24e8e3          	bltu	s1,s2,10af0 <__libc_init_array+0x38>
   10b04:	00013437          	lui	s0,0x13
   10b08:	000137b7          	lui	a5,0x13
   10b0c:	0d878793          	addi	a5,a5,216 # 130d8 <__do_global_dtors_aux_fini_array_entry>
   10b10:	0d040713          	addi	a4,s0,208 # 130d0 <__init_array_start>
   10b14:	40e78933          	sub	s2,a5,a4
   10b18:	40295913          	srai	s2,s2,0x2
   10b1c:	02e78063          	beq	a5,a4,10b3c <__libc_init_array+0x84>
   10b20:	0d040413          	addi	s0,s0,208
   10b24:	00000493          	li	s1,0
   10b28:	00042783          	lw	a5,0(s0)
   10b2c:	00148493          	addi	s1,s1,1
   10b30:	00440413          	addi	s0,s0,4
   10b34:	000780e7          	jalr	a5
   10b38:	ff24e8e3          	bltu	s1,s2,10b28 <__libc_init_array+0x70>
   10b3c:	00c12083          	lw	ra,12(sp)
   10b40:	00812403          	lw	s0,8(sp)
   10b44:	00412483          	lw	s1,4(sp)
   10b48:	00012903          	lw	s2,0(sp)
   10b4c:	01010113          	addi	sp,sp,16
   10b50:	00008067          	ret

00010b54 <memset>:
   10b54:	00f00313          	li	t1,15
   10b58:	00050713          	mv	a4,a0
   10b5c:	02c37e63          	bgeu	t1,a2,10b98 <memset+0x44>
   10b60:	00f77793          	andi	a5,a4,15
   10b64:	0a079063          	bnez	a5,10c04 <memset+0xb0>
   10b68:	08059263          	bnez	a1,10bec <memset+0x98>
   10b6c:	ff067693          	andi	a3,a2,-16
   10b70:	00f67613          	andi	a2,a2,15
   10b74:	00e686b3          	add	a3,a3,a4
   10b78:	00b72023          	sw	a1,0(a4)
   10b7c:	00b72223          	sw	a1,4(a4)
   10b80:	00b72423          	sw	a1,8(a4)
   10b84:	00b72623          	sw	a1,12(a4)
   10b88:	01070713          	addi	a4,a4,16
   10b8c:	fed766e3          	bltu	a4,a3,10b78 <memset+0x24>
   10b90:	00061463          	bnez	a2,10b98 <memset+0x44>
   10b94:	00008067          	ret
   10b98:	40c306b3          	sub	a3,t1,a2
   10b9c:	00269693          	slli	a3,a3,0x2
   10ba0:	00000297          	auipc	t0,0x0
   10ba4:	005686b3          	add	a3,a3,t0
   10ba8:	00c68067          	jr	12(a3)
   10bac:	00b70723          	sb	a1,14(a4)
   10bb0:	00b706a3          	sb	a1,13(a4)
   10bb4:	00b70623          	sb	a1,12(a4)
   10bb8:	00b705a3          	sb	a1,11(a4)
   10bbc:	00b70523          	sb	a1,10(a4)
   10bc0:	00b704a3          	sb	a1,9(a4)
   10bc4:	00b70423          	sb	a1,8(a4)
   10bc8:	00b703a3          	sb	a1,7(a4)
   10bcc:	00b70323          	sb	a1,6(a4)
   10bd0:	00b702a3          	sb	a1,5(a4)
   10bd4:	00b70223          	sb	a1,4(a4)
   10bd8:	00b701a3          	sb	a1,3(a4)
   10bdc:	00b70123          	sb	a1,2(a4)
   10be0:	00b700a3          	sb	a1,1(a4)
   10be4:	00b70023          	sb	a1,0(a4)
   10be8:	00008067          	ret
   10bec:	0ff5f593          	zext.b	a1,a1
   10bf0:	00859693          	slli	a3,a1,0x8
   10bf4:	00d5e5b3          	or	a1,a1,a3
   10bf8:	01059693          	slli	a3,a1,0x10
   10bfc:	00d5e5b3          	or	a1,a1,a3
   10c00:	f6dff06f          	j	10b6c <memset+0x18>
   10c04:	00279693          	slli	a3,a5,0x2
   10c08:	00000297          	auipc	t0,0x0
   10c0c:	005686b3          	add	a3,a3,t0
   10c10:	00008293          	mv	t0,ra
   10c14:	fa0680e7          	jalr	-96(a3)
   10c18:	00028093          	mv	ra,t0
   10c1c:	ff078793          	addi	a5,a5,-16
   10c20:	40f70733          	sub	a4,a4,a5
   10c24:	00f60633          	add	a2,a2,a5
   10c28:	f6c378e3          	bgeu	t1,a2,10b98 <memset+0x44>
   10c2c:	f3dff06f          	j	10b68 <memset+0x14>

00010c30 <__call_exitprocs>:
   10c30:	fd010113          	addi	sp,sp,-48
   10c34:	01412c23          	sw	s4,24(sp)
   10c38:	03212023          	sw	s2,32(sp)
   10c3c:	d501a903          	lw	s2,-688(gp) # 13630 <__atexit>
   10c40:	02112623          	sw	ra,44(sp)
   10c44:	0a090863          	beqz	s2,10cf4 <__call_exitprocs+0xc4>
   10c48:	01312e23          	sw	s3,28(sp)
   10c4c:	01512a23          	sw	s5,20(sp)
   10c50:	01612823          	sw	s6,16(sp)
   10c54:	01712623          	sw	s7,12(sp)
   10c58:	02812423          	sw	s0,40(sp)
   10c5c:	02912223          	sw	s1,36(sp)
   10c60:	01812423          	sw	s8,8(sp)
   10c64:	00050b13          	mv	s6,a0
   10c68:	00058b93          	mv	s7,a1
   10c6c:	fff00993          	li	s3,-1
   10c70:	00100a93          	li	s5,1
   10c74:	00492483          	lw	s1,4(s2)
   10c78:	fff48413          	addi	s0,s1,-1
   10c7c:	04044e63          	bltz	s0,10cd8 <__call_exitprocs+0xa8>
   10c80:	00249493          	slli	s1,s1,0x2
   10c84:	009904b3          	add	s1,s2,s1
   10c88:	080b9063          	bnez	s7,10d08 <__call_exitprocs+0xd8>
   10c8c:	00492783          	lw	a5,4(s2)
   10c90:	0044a683          	lw	a3,4(s1)
   10c94:	fff78793          	addi	a5,a5,-1
   10c98:	0a878c63          	beq	a5,s0,10d50 <__call_exitprocs+0x120>
   10c9c:	0004a223          	sw	zero,4(s1)
   10ca0:	02068663          	beqz	a3,10ccc <__call_exitprocs+0x9c>
   10ca4:	18892783          	lw	a5,392(s2)
   10ca8:	008a9733          	sll	a4,s5,s0
   10cac:	00492c03          	lw	s8,4(s2)
   10cb0:	00f777b3          	and	a5,a4,a5
   10cb4:	06079663          	bnez	a5,10d20 <__call_exitprocs+0xf0>
   10cb8:	000680e7          	jalr	a3
   10cbc:	00492703          	lw	a4,4(s2)
   10cc0:	d501a783          	lw	a5,-688(gp) # 13630 <__atexit>
   10cc4:	09871063          	bne	a4,s8,10d44 <__call_exitprocs+0x114>
   10cc8:	07279e63          	bne	a5,s2,10d44 <__call_exitprocs+0x114>
   10ccc:	fff40413          	addi	s0,s0,-1
   10cd0:	ffc48493          	addi	s1,s1,-4
   10cd4:	fb341ae3          	bne	s0,s3,10c88 <__call_exitprocs+0x58>
   10cd8:	02812403          	lw	s0,40(sp)
   10cdc:	02412483          	lw	s1,36(sp)
   10ce0:	01c12983          	lw	s3,28(sp)
   10ce4:	01412a83          	lw	s5,20(sp)
   10ce8:	01012b03          	lw	s6,16(sp)
   10cec:	00c12b83          	lw	s7,12(sp)
   10cf0:	00812c03          	lw	s8,8(sp)
   10cf4:	02c12083          	lw	ra,44(sp)
   10cf8:	02012903          	lw	s2,32(sp)
   10cfc:	01812a03          	lw	s4,24(sp)
   10d00:	03010113          	addi	sp,sp,48
   10d04:	00008067          	ret
   10d08:	1044a783          	lw	a5,260(s1)
   10d0c:	f97780e3          	beq	a5,s7,10c8c <__call_exitprocs+0x5c>
   10d10:	fff40413          	addi	s0,s0,-1
   10d14:	ffc48493          	addi	s1,s1,-4
   10d18:	ff3418e3          	bne	s0,s3,10d08 <__call_exitprocs+0xd8>
   10d1c:	fbdff06f          	j	10cd8 <__call_exitprocs+0xa8>
   10d20:	18c92783          	lw	a5,396(s2)
   10d24:	0844a583          	lw	a1,132(s1)
   10d28:	00f77733          	and	a4,a4,a5
   10d2c:	02071663          	bnez	a4,10d58 <__call_exitprocs+0x128>
   10d30:	000b0513          	mv	a0,s6
   10d34:	000680e7          	jalr	a3
   10d38:	00492703          	lw	a4,4(s2)
   10d3c:	d501a783          	lw	a5,-688(gp) # 13630 <__atexit>
   10d40:	f98704e3          	beq	a4,s8,10cc8 <__call_exitprocs+0x98>
   10d44:	f8078ae3          	beqz	a5,10cd8 <__call_exitprocs+0xa8>
   10d48:	00078913          	mv	s2,a5
   10d4c:	f29ff06f          	j	10c74 <__call_exitprocs+0x44>
   10d50:	00892223          	sw	s0,4(s2)
   10d54:	f4dff06f          	j	10ca0 <__call_exitprocs+0x70>
   10d58:	00058513          	mv	a0,a1
   10d5c:	000680e7          	jalr	a3
   10d60:	f5dff06f          	j	10cbc <__call_exitprocs+0x8c>

00010d64 <atexit>:
   10d64:	00050593          	mv	a1,a0
   10d68:	00000693          	li	a3,0
   10d6c:	00000613          	li	a2,0
   10d70:	00000513          	li	a0,0
   10d74:	1000106f          	j	11e74 <__register_exitproc>

00010d78 <_malloc_trim_r>:
   10d78:	fe010113          	addi	sp,sp,-32
   10d7c:	01312623          	sw	s3,12(sp)
   10d80:	000139b7          	lui	s3,0x13
   10d84:	00812c23          	sw	s0,24(sp)
   10d88:	00912a23          	sw	s1,20(sp)
   10d8c:	01212823          	sw	s2,16(sp)
   10d90:	01412423          	sw	s4,8(sp)
   10d94:	00112e23          	sw	ra,28(sp)
   10d98:	00058a13          	mv	s4,a1
   10d9c:	00050913          	mv	s2,a0
   10da0:	21098993          	addi	s3,s3,528 # 13210 <__malloc_av_>
   10da4:	3cd000ef          	jal	11970 <__malloc_lock>
   10da8:	0089a703          	lw	a4,8(s3)
   10dac:	000017b7          	lui	a5,0x1
   10db0:	fef78793          	addi	a5,a5,-17 # fef <exit-0xf0a5>
   10db4:	00472483          	lw	s1,4(a4)
   10db8:	00001737          	lui	a4,0x1
   10dbc:	ffc4f493          	andi	s1,s1,-4
   10dc0:	00f48433          	add	s0,s1,a5
   10dc4:	41440433          	sub	s0,s0,s4
   10dc8:	00c45413          	srli	s0,s0,0xc
   10dcc:	fff40413          	addi	s0,s0,-1
   10dd0:	00c41413          	slli	s0,s0,0xc
   10dd4:	00e44e63          	blt	s0,a4,10df0 <_malloc_trim_r+0x78>
   10dd8:	00000593          	li	a1,0
   10ddc:	00090513          	mv	a0,s2
   10de0:	7dd000ef          	jal	11dbc <_sbrk_r>
   10de4:	0089a783          	lw	a5,8(s3)
   10de8:	009787b3          	add	a5,a5,s1
   10dec:	02f50863          	beq	a0,a5,10e1c <_malloc_trim_r+0xa4>
   10df0:	00090513          	mv	a0,s2
   10df4:	381000ef          	jal	11974 <__malloc_unlock>
   10df8:	01c12083          	lw	ra,28(sp)
   10dfc:	01812403          	lw	s0,24(sp)
   10e00:	01412483          	lw	s1,20(sp)
   10e04:	01012903          	lw	s2,16(sp)
   10e08:	00c12983          	lw	s3,12(sp)
   10e0c:	00812a03          	lw	s4,8(sp)
   10e10:	00000513          	li	a0,0
   10e14:	02010113          	addi	sp,sp,32
   10e18:	00008067          	ret
   10e1c:	408005b3          	neg	a1,s0
   10e20:	00090513          	mv	a0,s2
   10e24:	799000ef          	jal	11dbc <_sbrk_r>
   10e28:	fff00793          	li	a5,-1
   10e2c:	04f50863          	beq	a0,a5,10e7c <_malloc_trim_r+0x104>
   10e30:	eb818793          	addi	a5,gp,-328 # 13798 <__malloc_current_mallinfo>
   10e34:	0007a703          	lw	a4,0(a5)
   10e38:	0089a683          	lw	a3,8(s3)
   10e3c:	408484b3          	sub	s1,s1,s0
   10e40:	0014e493          	ori	s1,s1,1
   10e44:	40870733          	sub	a4,a4,s0
   10e48:	00090513          	mv	a0,s2
   10e4c:	0096a223          	sw	s1,4(a3)
   10e50:	00e7a023          	sw	a4,0(a5)
   10e54:	321000ef          	jal	11974 <__malloc_unlock>
   10e58:	01c12083          	lw	ra,28(sp)
   10e5c:	01812403          	lw	s0,24(sp)
   10e60:	01412483          	lw	s1,20(sp)
   10e64:	01012903          	lw	s2,16(sp)
   10e68:	00c12983          	lw	s3,12(sp)
   10e6c:	00812a03          	lw	s4,8(sp)
   10e70:	00100513          	li	a0,1
   10e74:	02010113          	addi	sp,sp,32
   10e78:	00008067          	ret
   10e7c:	00000593          	li	a1,0
   10e80:	00090513          	mv	a0,s2
   10e84:	739000ef          	jal	11dbc <_sbrk_r>
   10e88:	0089a703          	lw	a4,8(s3)
   10e8c:	00f00693          	li	a3,15
   10e90:	40e507b3          	sub	a5,a0,a4
   10e94:	f4f6dee3          	bge	a3,a5,10df0 <_malloc_trim_r+0x78>
   10e98:	d401a683          	lw	a3,-704(gp) # 13620 <__malloc_sbrk_base>
   10e9c:	0017e793          	ori	a5,a5,1
   10ea0:	00f72223          	sw	a5,4(a4) # 1004 <exit-0xf090>
   10ea4:	40d50533          	sub	a0,a0,a3
   10ea8:	eaa1ac23          	sw	a0,-328(gp) # 13798 <__malloc_current_mallinfo>
   10eac:	f45ff06f          	j	10df0 <_malloc_trim_r+0x78>

00010eb0 <_free_r>:
   10eb0:	18058263          	beqz	a1,11034 <_free_r+0x184>
   10eb4:	ff010113          	addi	sp,sp,-16
   10eb8:	00812423          	sw	s0,8(sp)
   10ebc:	00912223          	sw	s1,4(sp)
   10ec0:	00058413          	mv	s0,a1
   10ec4:	00050493          	mv	s1,a0
   10ec8:	00112623          	sw	ra,12(sp)
   10ecc:	2a5000ef          	jal	11970 <__malloc_lock>
   10ed0:	ffc42503          	lw	a0,-4(s0)
   10ed4:	ff840713          	addi	a4,s0,-8
   10ed8:	000135b7          	lui	a1,0x13
   10edc:	ffe57793          	andi	a5,a0,-2
   10ee0:	00f70633          	add	a2,a4,a5
   10ee4:	21058593          	addi	a1,a1,528 # 13210 <__malloc_av_>
   10ee8:	00462683          	lw	a3,4(a2)
   10eec:	0085a803          	lw	a6,8(a1)
   10ef0:	ffc6f693          	andi	a3,a3,-4
   10ef4:	1ac80263          	beq	a6,a2,11098 <_free_r+0x1e8>
   10ef8:	00d62223          	sw	a3,4(a2)
   10efc:	00157513          	andi	a0,a0,1
   10f00:	00d60833          	add	a6,a2,a3
   10f04:	0a051063          	bnez	a0,10fa4 <_free_r+0xf4>
   10f08:	ff842303          	lw	t1,-8(s0)
   10f0c:	00482803          	lw	a6,4(a6)
   10f10:	00013537          	lui	a0,0x13
   10f14:	40670733          	sub	a4,a4,t1
   10f18:	00872883          	lw	a7,8(a4)
   10f1c:	21850513          	addi	a0,a0,536 # 13218 <__malloc_av_+0x8>
   10f20:	006787b3          	add	a5,a5,t1
   10f24:	00187813          	andi	a6,a6,1
   10f28:	14a88263          	beq	a7,a0,1106c <_free_r+0x1bc>
   10f2c:	00c72303          	lw	t1,12(a4)
   10f30:	0068a623          	sw	t1,12(a7)
   10f34:	01132423          	sw	a7,8(t1) # 10184 <frame_dummy+0x1c>
   10f38:	1a080663          	beqz	a6,110e4 <_free_r+0x234>
   10f3c:	0017e693          	ori	a3,a5,1
   10f40:	00d72223          	sw	a3,4(a4)
   10f44:	00f62023          	sw	a5,0(a2)
   10f48:	1ff00693          	li	a3,511
   10f4c:	06f6ec63          	bltu	a3,a5,10fc4 <_free_r+0x114>
   10f50:	ff87f693          	andi	a3,a5,-8
   10f54:	00868693          	addi	a3,a3,8
   10f58:	0045a503          	lw	a0,4(a1)
   10f5c:	00d586b3          	add	a3,a1,a3
   10f60:	0006a603          	lw	a2,0(a3)
   10f64:	0057d813          	srli	a6,a5,0x5
   10f68:	00100793          	li	a5,1
   10f6c:	010797b3          	sll	a5,a5,a6
   10f70:	00a7e7b3          	or	a5,a5,a0
   10f74:	ff868513          	addi	a0,a3,-8
   10f78:	00a72623          	sw	a0,12(a4)
   10f7c:	00c72423          	sw	a2,8(a4)
   10f80:	00f5a223          	sw	a5,4(a1)
   10f84:	00e6a023          	sw	a4,0(a3)
   10f88:	00e62623          	sw	a4,12(a2)
   10f8c:	00812403          	lw	s0,8(sp)
   10f90:	00c12083          	lw	ra,12(sp)
   10f94:	00048513          	mv	a0,s1
   10f98:	00412483          	lw	s1,4(sp)
   10f9c:	01010113          	addi	sp,sp,16
   10fa0:	1d50006f          	j	11974 <__malloc_unlock>
   10fa4:	00482503          	lw	a0,4(a6)
   10fa8:	00157513          	andi	a0,a0,1
   10fac:	08050663          	beqz	a0,11038 <_free_r+0x188>
   10fb0:	0017e693          	ori	a3,a5,1
   10fb4:	fed42e23          	sw	a3,-4(s0)
   10fb8:	00f62023          	sw	a5,0(a2)
   10fbc:	1ff00693          	li	a3,511
   10fc0:	f8f6f8e3          	bgeu	a3,a5,10f50 <_free_r+0xa0>
   10fc4:	0097d693          	srli	a3,a5,0x9
   10fc8:	00400613          	li	a2,4
   10fcc:	12d66063          	bltu	a2,a3,110ec <_free_r+0x23c>
   10fd0:	0067d693          	srli	a3,a5,0x6
   10fd4:	03968513          	addi	a0,a3,57
   10fd8:	03868613          	addi	a2,a3,56
   10fdc:	00351513          	slli	a0,a0,0x3
   10fe0:	00a58533          	add	a0,a1,a0
   10fe4:	00052683          	lw	a3,0(a0)
   10fe8:	ff850513          	addi	a0,a0,-8
   10fec:	00d51863          	bne	a0,a3,10ffc <_free_r+0x14c>
   10ff0:	1540006f          	j	11144 <_free_r+0x294>
   10ff4:	0086a683          	lw	a3,8(a3)
   10ff8:	00d50863          	beq	a0,a3,11008 <_free_r+0x158>
   10ffc:	0046a603          	lw	a2,4(a3)
   11000:	ffc67613          	andi	a2,a2,-4
   11004:	fec7e8e3          	bltu	a5,a2,10ff4 <_free_r+0x144>
   11008:	00c6a503          	lw	a0,12(a3)
   1100c:	00a72623          	sw	a0,12(a4)
   11010:	00d72423          	sw	a3,8(a4)
   11014:	00812403          	lw	s0,8(sp)
   11018:	00e52423          	sw	a4,8(a0)
   1101c:	00c12083          	lw	ra,12(sp)
   11020:	00048513          	mv	a0,s1
   11024:	00412483          	lw	s1,4(sp)
   11028:	00e6a623          	sw	a4,12(a3)
   1102c:	01010113          	addi	sp,sp,16
   11030:	1450006f          	j	11974 <__malloc_unlock>
   11034:	00008067          	ret
   11038:	00013537          	lui	a0,0x13
   1103c:	00d787b3          	add	a5,a5,a3
   11040:	21850513          	addi	a0,a0,536 # 13218 <__malloc_av_+0x8>
   11044:	00862683          	lw	a3,8(a2)
   11048:	0ca68c63          	beq	a3,a0,11120 <_free_r+0x270>
   1104c:	00c62803          	lw	a6,12(a2)
   11050:	0017e513          	ori	a0,a5,1
   11054:	00f70633          	add	a2,a4,a5
   11058:	0106a623          	sw	a6,12(a3)
   1105c:	00d82423          	sw	a3,8(a6)
   11060:	00a72223          	sw	a0,4(a4)
   11064:	00f62023          	sw	a5,0(a2)
   11068:	ee1ff06f          	j	10f48 <_free_r+0x98>
   1106c:	12081c63          	bnez	a6,111a4 <_free_r+0x2f4>
   11070:	00862583          	lw	a1,8(a2)
   11074:	00c62603          	lw	a2,12(a2)
   11078:	00f686b3          	add	a3,a3,a5
   1107c:	0016e793          	ori	a5,a3,1
   11080:	00c5a623          	sw	a2,12(a1)
   11084:	00b62423          	sw	a1,8(a2)
   11088:	00f72223          	sw	a5,4(a4)
   1108c:	00d70733          	add	a4,a4,a3
   11090:	00d72023          	sw	a3,0(a4)
   11094:	ef9ff06f          	j	10f8c <_free_r+0xdc>
   11098:	00157513          	andi	a0,a0,1
   1109c:	00d786b3          	add	a3,a5,a3
   110a0:	02051063          	bnez	a0,110c0 <_free_r+0x210>
   110a4:	ff842503          	lw	a0,-8(s0)
   110a8:	40a70733          	sub	a4,a4,a0
   110ac:	00c72783          	lw	a5,12(a4)
   110b0:	00872603          	lw	a2,8(a4)
   110b4:	00a686b3          	add	a3,a3,a0
   110b8:	00f62623          	sw	a5,12(a2)
   110bc:	00c7a423          	sw	a2,8(a5)
   110c0:	0016e613          	ori	a2,a3,1
   110c4:	d441a783          	lw	a5,-700(gp) # 13624 <__malloc_trim_threshold>
   110c8:	00c72223          	sw	a2,4(a4)
   110cc:	00e5a423          	sw	a4,8(a1)
   110d0:	eaf6eee3          	bltu	a3,a5,10f8c <_free_r+0xdc>
   110d4:	d5c1a583          	lw	a1,-676(gp) # 1363c <__malloc_top_pad>
   110d8:	00048513          	mv	a0,s1
   110dc:	c9dff0ef          	jal	10d78 <_malloc_trim_r>
   110e0:	eadff06f          	j	10f8c <_free_r+0xdc>
   110e4:	00d787b3          	add	a5,a5,a3
   110e8:	f5dff06f          	j	11044 <_free_r+0x194>
   110ec:	01400613          	li	a2,20
   110f0:	02d67063          	bgeu	a2,a3,11110 <_free_r+0x260>
   110f4:	05400613          	li	a2,84
   110f8:	06d66463          	bltu	a2,a3,11160 <_free_r+0x2b0>
   110fc:	00c7d693          	srli	a3,a5,0xc
   11100:	06f68513          	addi	a0,a3,111
   11104:	06e68613          	addi	a2,a3,110
   11108:	00351513          	slli	a0,a0,0x3
   1110c:	ed5ff06f          	j	10fe0 <_free_r+0x130>
   11110:	05c68513          	addi	a0,a3,92
   11114:	05b68613          	addi	a2,a3,91
   11118:	00351513          	slli	a0,a0,0x3
   1111c:	ec5ff06f          	j	10fe0 <_free_r+0x130>
   11120:	00e5aa23          	sw	a4,20(a1)
   11124:	00e5a823          	sw	a4,16(a1)
   11128:	0017e693          	ori	a3,a5,1
   1112c:	00a72623          	sw	a0,12(a4)
   11130:	00a72423          	sw	a0,8(a4)
   11134:	00d72223          	sw	a3,4(a4)
   11138:	00f70733          	add	a4,a4,a5
   1113c:	00f72023          	sw	a5,0(a4)
   11140:	e4dff06f          	j	10f8c <_free_r+0xdc>
   11144:	0045a803          	lw	a6,4(a1)
   11148:	40265613          	srai	a2,a2,0x2
   1114c:	00100793          	li	a5,1
   11150:	00c797b3          	sll	a5,a5,a2
   11154:	0107e7b3          	or	a5,a5,a6
   11158:	00f5a223          	sw	a5,4(a1)
   1115c:	eb1ff06f          	j	1100c <_free_r+0x15c>
   11160:	15400613          	li	a2,340
   11164:	00d66c63          	bltu	a2,a3,1117c <_free_r+0x2cc>
   11168:	00f7d693          	srli	a3,a5,0xf
   1116c:	07868513          	addi	a0,a3,120
   11170:	07768613          	addi	a2,a3,119
   11174:	00351513          	slli	a0,a0,0x3
   11178:	e69ff06f          	j	10fe0 <_free_r+0x130>
   1117c:	55400613          	li	a2,1364
   11180:	00d66c63          	bltu	a2,a3,11198 <_free_r+0x2e8>
   11184:	0127d693          	srli	a3,a5,0x12
   11188:	07d68513          	addi	a0,a3,125
   1118c:	07c68613          	addi	a2,a3,124
   11190:	00351513          	slli	a0,a0,0x3
   11194:	e4dff06f          	j	10fe0 <_free_r+0x130>
   11198:	3f800513          	li	a0,1016
   1119c:	07e00613          	li	a2,126
   111a0:	e41ff06f          	j	10fe0 <_free_r+0x130>
   111a4:	0017e693          	ori	a3,a5,1
   111a8:	00d72223          	sw	a3,4(a4)
   111ac:	00f62023          	sw	a5,0(a2)
   111b0:	dddff06f          	j	10f8c <_free_r+0xdc>

000111b4 <_malloc_r>:
   111b4:	fd010113          	addi	sp,sp,-48
   111b8:	01312e23          	sw	s3,28(sp)
   111bc:	02112623          	sw	ra,44(sp)
   111c0:	02812423          	sw	s0,40(sp)
   111c4:	02912223          	sw	s1,36(sp)
   111c8:	03212023          	sw	s2,32(sp)
   111cc:	00b58793          	addi	a5,a1,11
   111d0:	01600713          	li	a4,22
   111d4:	00050993          	mv	s3,a0
   111d8:	08f76263          	bltu	a4,a5,1125c <_malloc_r+0xa8>
   111dc:	01000793          	li	a5,16
   111e0:	20b7e663          	bltu	a5,a1,113ec <_malloc_r+0x238>
   111e4:	78c000ef          	jal	11970 <__malloc_lock>
   111e8:	01800793          	li	a5,24
   111ec:	00200593          	li	a1,2
   111f0:	01000493          	li	s1,16
   111f4:	00013937          	lui	s2,0x13
   111f8:	21090913          	addi	s2,s2,528 # 13210 <__malloc_av_>
   111fc:	00f907b3          	add	a5,s2,a5
   11200:	0047a403          	lw	s0,4(a5)
   11204:	ff878713          	addi	a4,a5,-8
   11208:	34e40463          	beq	s0,a4,11550 <_malloc_r+0x39c>
   1120c:	00442783          	lw	a5,4(s0)
   11210:	00c42683          	lw	a3,12(s0)
   11214:	00842603          	lw	a2,8(s0)
   11218:	ffc7f793          	andi	a5,a5,-4
   1121c:	00f407b3          	add	a5,s0,a5
   11220:	0047a703          	lw	a4,4(a5)
   11224:	00d62623          	sw	a3,12(a2)
   11228:	00c6a423          	sw	a2,8(a3)
   1122c:	00176713          	ori	a4,a4,1
   11230:	00098513          	mv	a0,s3
   11234:	00e7a223          	sw	a4,4(a5)
   11238:	73c000ef          	jal	11974 <__malloc_unlock>
   1123c:	00840513          	addi	a0,s0,8
   11240:	02c12083          	lw	ra,44(sp)
   11244:	02812403          	lw	s0,40(sp)
   11248:	02412483          	lw	s1,36(sp)
   1124c:	02012903          	lw	s2,32(sp)
   11250:	01c12983          	lw	s3,28(sp)
   11254:	03010113          	addi	sp,sp,48
   11258:	00008067          	ret
   1125c:	ff87f493          	andi	s1,a5,-8
   11260:	1807c663          	bltz	a5,113ec <_malloc_r+0x238>
   11264:	18b4e463          	bltu	s1,a1,113ec <_malloc_r+0x238>
   11268:	708000ef          	jal	11970 <__malloc_lock>
   1126c:	1f700793          	li	a5,503
   11270:	3e97fa63          	bgeu	a5,s1,11664 <_malloc_r+0x4b0>
   11274:	0094d793          	srli	a5,s1,0x9
   11278:	18078263          	beqz	a5,113fc <_malloc_r+0x248>
   1127c:	00400713          	li	a4,4
   11280:	34f76063          	bltu	a4,a5,115c0 <_malloc_r+0x40c>
   11284:	0064d793          	srli	a5,s1,0x6
   11288:	03978593          	addi	a1,a5,57
   1128c:	03878813          	addi	a6,a5,56
   11290:	00359613          	slli	a2,a1,0x3
   11294:	00013937          	lui	s2,0x13
   11298:	21090913          	addi	s2,s2,528 # 13210 <__malloc_av_>
   1129c:	00c90633          	add	a2,s2,a2
   112a0:	00462403          	lw	s0,4(a2)
   112a4:	ff860613          	addi	a2,a2,-8
   112a8:	02860863          	beq	a2,s0,112d8 <_malloc_r+0x124>
   112ac:	00f00513          	li	a0,15
   112b0:	0140006f          	j	112c4 <_malloc_r+0x110>
   112b4:	00c42683          	lw	a3,12(s0)
   112b8:	28075863          	bgez	a4,11548 <_malloc_r+0x394>
   112bc:	00d60e63          	beq	a2,a3,112d8 <_malloc_r+0x124>
   112c0:	00068413          	mv	s0,a3
   112c4:	00442783          	lw	a5,4(s0)
   112c8:	ffc7f793          	andi	a5,a5,-4
   112cc:	40978733          	sub	a4,a5,s1
   112d0:	fee552e3          	bge	a0,a4,112b4 <_malloc_r+0x100>
   112d4:	00080593          	mv	a1,a6
   112d8:	01092403          	lw	s0,16(s2)
   112dc:	00013837          	lui	a6,0x13
   112e0:	21880813          	addi	a6,a6,536 # 13218 <__malloc_av_+0x8>
   112e4:	25040e63          	beq	s0,a6,11540 <_malloc_r+0x38c>
   112e8:	00442783          	lw	a5,4(s0)
   112ec:	00f00693          	li	a3,15
   112f0:	ffc7f793          	andi	a5,a5,-4
   112f4:	40978733          	sub	a4,a5,s1
   112f8:	36e6cc63          	blt	a3,a4,11670 <_malloc_r+0x4bc>
   112fc:	01092a23          	sw	a6,20(s2)
   11300:	01092823          	sw	a6,16(s2)
   11304:	34075063          	bgez	a4,11644 <_malloc_r+0x490>
   11308:	1ff00713          	li	a4,511
   1130c:	00492503          	lw	a0,4(s2)
   11310:	24f76863          	bltu	a4,a5,11560 <_malloc_r+0x3ac>
   11314:	ff87f713          	andi	a4,a5,-8
   11318:	00870713          	addi	a4,a4,8
   1131c:	00e90733          	add	a4,s2,a4
   11320:	00072683          	lw	a3,0(a4)
   11324:	0057d613          	srli	a2,a5,0x5
   11328:	00100793          	li	a5,1
   1132c:	00c797b3          	sll	a5,a5,a2
   11330:	00f56533          	or	a0,a0,a5
   11334:	ff870793          	addi	a5,a4,-8
   11338:	00f42623          	sw	a5,12(s0)
   1133c:	00d42423          	sw	a3,8(s0)
   11340:	00a92223          	sw	a0,4(s2)
   11344:	00872023          	sw	s0,0(a4)
   11348:	0086a623          	sw	s0,12(a3)
   1134c:	4025d793          	srai	a5,a1,0x2
   11350:	00100613          	li	a2,1
   11354:	00f61633          	sll	a2,a2,a5
   11358:	0ac56a63          	bltu	a0,a2,1140c <_malloc_r+0x258>
   1135c:	00a677b3          	and	a5,a2,a0
   11360:	02079463          	bnez	a5,11388 <_malloc_r+0x1d4>
   11364:	00161613          	slli	a2,a2,0x1
   11368:	ffc5f593          	andi	a1,a1,-4
   1136c:	00a677b3          	and	a5,a2,a0
   11370:	00458593          	addi	a1,a1,4
   11374:	00079a63          	bnez	a5,11388 <_malloc_r+0x1d4>
   11378:	00161613          	slli	a2,a2,0x1
   1137c:	00a677b3          	and	a5,a2,a0
   11380:	00458593          	addi	a1,a1,4
   11384:	fe078ae3          	beqz	a5,11378 <_malloc_r+0x1c4>
   11388:	00f00893          	li	a7,15
   1138c:	00359313          	slli	t1,a1,0x3
   11390:	00690333          	add	t1,s2,t1
   11394:	00030513          	mv	a0,t1
   11398:	00c52783          	lw	a5,12(a0)
   1139c:	00058e13          	mv	t3,a1
   113a0:	24f50263          	beq	a0,a5,115e4 <_malloc_r+0x430>
   113a4:	0047a703          	lw	a4,4(a5)
   113a8:	00078413          	mv	s0,a5
   113ac:	00c7a783          	lw	a5,12(a5)
   113b0:	ffc77713          	andi	a4,a4,-4
   113b4:	409706b3          	sub	a3,a4,s1
   113b8:	24d8c263          	blt	a7,a3,115fc <_malloc_r+0x448>
   113bc:	fe06c2e3          	bltz	a3,113a0 <_malloc_r+0x1ec>
   113c0:	00e40733          	add	a4,s0,a4
   113c4:	00472683          	lw	a3,4(a4)
   113c8:	00842603          	lw	a2,8(s0)
   113cc:	00098513          	mv	a0,s3
   113d0:	0016e693          	ori	a3,a3,1
   113d4:	00d72223          	sw	a3,4(a4)
   113d8:	00f62623          	sw	a5,12(a2)
   113dc:	00c7a423          	sw	a2,8(a5)
   113e0:	594000ef          	jal	11974 <__malloc_unlock>
   113e4:	00840513          	addi	a0,s0,8
   113e8:	e59ff06f          	j	11240 <_malloc_r+0x8c>
   113ec:	00c00793          	li	a5,12
   113f0:	00f9a023          	sw	a5,0(s3)
   113f4:	00000513          	li	a0,0
   113f8:	e49ff06f          	j	11240 <_malloc_r+0x8c>
   113fc:	20000613          	li	a2,512
   11400:	04000593          	li	a1,64
   11404:	03f00813          	li	a6,63
   11408:	e8dff06f          	j	11294 <_malloc_r+0xe0>
   1140c:	00892403          	lw	s0,8(s2)
   11410:	01612823          	sw	s6,16(sp)
   11414:	00442783          	lw	a5,4(s0)
   11418:	ffc7fb13          	andi	s6,a5,-4
   1141c:	009b6863          	bltu	s6,s1,1142c <_malloc_r+0x278>
   11420:	409b0733          	sub	a4,s6,s1
   11424:	00f00793          	li	a5,15
   11428:	0ce7ca63          	blt	a5,a4,114fc <_malloc_r+0x348>
   1142c:	01912223          	sw	s9,4(sp)
   11430:	01512a23          	sw	s5,20(sp)
   11434:	d401a703          	lw	a4,-704(gp) # 13620 <__malloc_sbrk_base>
   11438:	d5c1aa83          	lw	s5,-676(gp) # 1363c <__malloc_top_pad>
   1143c:	01412c23          	sw	s4,24(sp)
   11440:	01712623          	sw	s7,12(sp)
   11444:	fff00793          	li	a5,-1
   11448:	01640a33          	add	s4,s0,s6
   1144c:	01548ab3          	add	s5,s1,s5
   11450:	3cf70663          	beq	a4,a5,1181c <_malloc_r+0x668>
   11454:	000017b7          	lui	a5,0x1
   11458:	00f78793          	addi	a5,a5,15 # 100f <exit-0xf085>
   1145c:	00fa8ab3          	add	s5,s5,a5
   11460:	fffff7b7          	lui	a5,0xfffff
   11464:	00fafab3          	and	s5,s5,a5
   11468:	000a8593          	mv	a1,s5
   1146c:	00098513          	mv	a0,s3
   11470:	14d000ef          	jal	11dbc <_sbrk_r>
   11474:	fff00793          	li	a5,-1
   11478:	00050b93          	mv	s7,a0
   1147c:	44f50a63          	beq	a0,a5,118d0 <_malloc_r+0x71c>
   11480:	01812423          	sw	s8,8(sp)
   11484:	23456e63          	bltu	a0,s4,116c0 <_malloc_r+0x50c>
   11488:	eb818c13          	addi	s8,gp,-328 # 13798 <__malloc_current_mallinfo>
   1148c:	000c2583          	lw	a1,0(s8)
   11490:	00ba85b3          	add	a1,s5,a1
   11494:	00bc2023          	sw	a1,0(s8)
   11498:	00058713          	mv	a4,a1
   1149c:	2aaa1663          	bne	s4,a0,11748 <_malloc_r+0x594>
   114a0:	01451793          	slli	a5,a0,0x14
   114a4:	2a079263          	bnez	a5,11748 <_malloc_r+0x594>
   114a8:	00892b83          	lw	s7,8(s2)
   114ac:	015b07b3          	add	a5,s6,s5
   114b0:	0017e793          	ori	a5,a5,1
   114b4:	00fba223          	sw	a5,4(s7)
   114b8:	d581a683          	lw	a3,-680(gp) # 13638 <__malloc_max_sbrked_mem>
   114bc:	00b6f463          	bgeu	a3,a1,114c4 <_malloc_r+0x310>
   114c0:	d4b1ac23          	sw	a1,-680(gp) # 13638 <__malloc_max_sbrked_mem>
   114c4:	d541a683          	lw	a3,-684(gp) # 13634 <__malloc_max_total_mem>
   114c8:	00b6f463          	bgeu	a3,a1,114d0 <_malloc_r+0x31c>
   114cc:	d4b1aa23          	sw	a1,-684(gp) # 13634 <__malloc_max_total_mem>
   114d0:	00812c03          	lw	s8,8(sp)
   114d4:	000b8413          	mv	s0,s7
   114d8:	ffc7f793          	andi	a5,a5,-4
   114dc:	40978733          	sub	a4,a5,s1
   114e0:	3897ea63          	bltu	a5,s1,11874 <_malloc_r+0x6c0>
   114e4:	00f00793          	li	a5,15
   114e8:	38e7d663          	bge	a5,a4,11874 <_malloc_r+0x6c0>
   114ec:	01812a03          	lw	s4,24(sp)
   114f0:	01412a83          	lw	s5,20(sp)
   114f4:	00c12b83          	lw	s7,12(sp)
   114f8:	00412c83          	lw	s9,4(sp)
   114fc:	0014e793          	ori	a5,s1,1
   11500:	00f42223          	sw	a5,4(s0)
   11504:	009404b3          	add	s1,s0,s1
   11508:	00992423          	sw	s1,8(s2)
   1150c:	00176713          	ori	a4,a4,1
   11510:	00098513          	mv	a0,s3
   11514:	00e4a223          	sw	a4,4(s1)
   11518:	45c000ef          	jal	11974 <__malloc_unlock>
   1151c:	02c12083          	lw	ra,44(sp)
   11520:	00840513          	addi	a0,s0,8
   11524:	02812403          	lw	s0,40(sp)
   11528:	01012b03          	lw	s6,16(sp)
   1152c:	02412483          	lw	s1,36(sp)
   11530:	02012903          	lw	s2,32(sp)
   11534:	01c12983          	lw	s3,28(sp)
   11538:	03010113          	addi	sp,sp,48
   1153c:	00008067          	ret
   11540:	00492503          	lw	a0,4(s2)
   11544:	e09ff06f          	j	1134c <_malloc_r+0x198>
   11548:	00842603          	lw	a2,8(s0)
   1154c:	cd1ff06f          	j	1121c <_malloc_r+0x68>
   11550:	00c7a403          	lw	s0,12(a5) # fffff00c <__BSS_END__+0xfffeb6bc>
   11554:	00258593          	addi	a1,a1,2
   11558:	d88780e3          	beq	a5,s0,112d8 <_malloc_r+0x124>
   1155c:	cb1ff06f          	j	1120c <_malloc_r+0x58>
   11560:	0097d713          	srli	a4,a5,0x9
   11564:	00400693          	li	a3,4
   11568:	14e6f263          	bgeu	a3,a4,116ac <_malloc_r+0x4f8>
   1156c:	01400693          	li	a3,20
   11570:	32e6e463          	bltu	a3,a4,11898 <_malloc_r+0x6e4>
   11574:	05c70613          	addi	a2,a4,92
   11578:	05b70693          	addi	a3,a4,91
   1157c:	00361613          	slli	a2,a2,0x3
   11580:	00c90633          	add	a2,s2,a2
   11584:	00062703          	lw	a4,0(a2)
   11588:	ff860613          	addi	a2,a2,-8
   1158c:	00e61863          	bne	a2,a4,1159c <_malloc_r+0x3e8>
   11590:	2940006f          	j	11824 <_malloc_r+0x670>
   11594:	00872703          	lw	a4,8(a4)
   11598:	00e60863          	beq	a2,a4,115a8 <_malloc_r+0x3f4>
   1159c:	00472683          	lw	a3,4(a4)
   115a0:	ffc6f693          	andi	a3,a3,-4
   115a4:	fed7e8e3          	bltu	a5,a3,11594 <_malloc_r+0x3e0>
   115a8:	00c72603          	lw	a2,12(a4)
   115ac:	00c42623          	sw	a2,12(s0)
   115b0:	00e42423          	sw	a4,8(s0)
   115b4:	00862423          	sw	s0,8(a2)
   115b8:	00872623          	sw	s0,12(a4)
   115bc:	d91ff06f          	j	1134c <_malloc_r+0x198>
   115c0:	01400713          	li	a4,20
   115c4:	10f77863          	bgeu	a4,a5,116d4 <_malloc_r+0x520>
   115c8:	05400713          	li	a4,84
   115cc:	2ef76463          	bltu	a4,a5,118b4 <_malloc_r+0x700>
   115d0:	00c4d793          	srli	a5,s1,0xc
   115d4:	06f78593          	addi	a1,a5,111
   115d8:	06e78813          	addi	a6,a5,110
   115dc:	00359613          	slli	a2,a1,0x3
   115e0:	cb5ff06f          	j	11294 <_malloc_r+0xe0>
   115e4:	001e0e13          	addi	t3,t3,1
   115e8:	003e7793          	andi	a5,t3,3
   115ec:	00850513          	addi	a0,a0,8
   115f0:	10078063          	beqz	a5,116f0 <_malloc_r+0x53c>
   115f4:	00c52783          	lw	a5,12(a0)
   115f8:	da9ff06f          	j	113a0 <_malloc_r+0x1ec>
   115fc:	00842603          	lw	a2,8(s0)
   11600:	0014e593          	ori	a1,s1,1
   11604:	00b42223          	sw	a1,4(s0)
   11608:	00f62623          	sw	a5,12(a2)
   1160c:	00c7a423          	sw	a2,8(a5)
   11610:	009404b3          	add	s1,s0,s1
   11614:	00992a23          	sw	s1,20(s2)
   11618:	00992823          	sw	s1,16(s2)
   1161c:	0016e793          	ori	a5,a3,1
   11620:	0104a623          	sw	a6,12(s1)
   11624:	0104a423          	sw	a6,8(s1)
   11628:	00f4a223          	sw	a5,4(s1)
   1162c:	00e40733          	add	a4,s0,a4
   11630:	00098513          	mv	a0,s3
   11634:	00d72023          	sw	a3,0(a4)
   11638:	33c000ef          	jal	11974 <__malloc_unlock>
   1163c:	00840513          	addi	a0,s0,8
   11640:	c01ff06f          	j	11240 <_malloc_r+0x8c>
   11644:	00f407b3          	add	a5,s0,a5
   11648:	0047a703          	lw	a4,4(a5)
   1164c:	00098513          	mv	a0,s3
   11650:	00176713          	ori	a4,a4,1
   11654:	00e7a223          	sw	a4,4(a5)
   11658:	31c000ef          	jal	11974 <__malloc_unlock>
   1165c:	00840513          	addi	a0,s0,8
   11660:	be1ff06f          	j	11240 <_malloc_r+0x8c>
   11664:	0034d593          	srli	a1,s1,0x3
   11668:	00848793          	addi	a5,s1,8
   1166c:	b89ff06f          	j	111f4 <_malloc_r+0x40>
   11670:	0014e693          	ori	a3,s1,1
   11674:	00d42223          	sw	a3,4(s0)
   11678:	009404b3          	add	s1,s0,s1
   1167c:	00992a23          	sw	s1,20(s2)
   11680:	00992823          	sw	s1,16(s2)
   11684:	00176693          	ori	a3,a4,1
   11688:	0104a623          	sw	a6,12(s1)
   1168c:	0104a423          	sw	a6,8(s1)
   11690:	00d4a223          	sw	a3,4(s1)
   11694:	00f407b3          	add	a5,s0,a5
   11698:	00098513          	mv	a0,s3
   1169c:	00e7a023          	sw	a4,0(a5)
   116a0:	2d4000ef          	jal	11974 <__malloc_unlock>
   116a4:	00840513          	addi	a0,s0,8
   116a8:	b99ff06f          	j	11240 <_malloc_r+0x8c>
   116ac:	0067d713          	srli	a4,a5,0x6
   116b0:	03970613          	addi	a2,a4,57
   116b4:	03870693          	addi	a3,a4,56
   116b8:	00361613          	slli	a2,a2,0x3
   116bc:	ec5ff06f          	j	11580 <_malloc_r+0x3cc>
   116c0:	07240c63          	beq	s0,s2,11738 <_malloc_r+0x584>
   116c4:	00892403          	lw	s0,8(s2)
   116c8:	00812c03          	lw	s8,8(sp)
   116cc:	00442783          	lw	a5,4(s0)
   116d0:	e09ff06f          	j	114d8 <_malloc_r+0x324>
   116d4:	05c78593          	addi	a1,a5,92
   116d8:	05b78813          	addi	a6,a5,91
   116dc:	00359613          	slli	a2,a1,0x3
   116e0:	bb5ff06f          	j	11294 <_malloc_r+0xe0>
   116e4:	00832783          	lw	a5,8(t1)
   116e8:	fff58593          	addi	a1,a1,-1
   116ec:	26679e63          	bne	a5,t1,11968 <_malloc_r+0x7b4>
   116f0:	0035f793          	andi	a5,a1,3
   116f4:	ff830313          	addi	t1,t1,-8
   116f8:	fe0796e3          	bnez	a5,116e4 <_malloc_r+0x530>
   116fc:	00492703          	lw	a4,4(s2)
   11700:	fff64793          	not	a5,a2
   11704:	00e7f7b3          	and	a5,a5,a4
   11708:	00f92223          	sw	a5,4(s2)
   1170c:	00161613          	slli	a2,a2,0x1
   11710:	cec7eee3          	bltu	a5,a2,1140c <_malloc_r+0x258>
   11714:	ce060ce3          	beqz	a2,1140c <_malloc_r+0x258>
   11718:	00f67733          	and	a4,a2,a5
   1171c:	00071a63          	bnez	a4,11730 <_malloc_r+0x57c>
   11720:	00161613          	slli	a2,a2,0x1
   11724:	00f67733          	and	a4,a2,a5
   11728:	004e0e13          	addi	t3,t3,4
   1172c:	fe070ae3          	beqz	a4,11720 <_malloc_r+0x56c>
   11730:	000e0593          	mv	a1,t3
   11734:	c59ff06f          	j	1138c <_malloc_r+0x1d8>
   11738:	eb818c13          	addi	s8,gp,-328 # 13798 <__malloc_current_mallinfo>
   1173c:	000c2703          	lw	a4,0(s8)
   11740:	00ea8733          	add	a4,s5,a4
   11744:	00ec2023          	sw	a4,0(s8)
   11748:	d401a683          	lw	a3,-704(gp) # 13620 <__malloc_sbrk_base>
   1174c:	fff00793          	li	a5,-1
   11750:	18f68663          	beq	a3,a5,118dc <_malloc_r+0x728>
   11754:	414b87b3          	sub	a5,s7,s4
   11758:	00e787b3          	add	a5,a5,a4
   1175c:	00fc2023          	sw	a5,0(s8)
   11760:	007bfc93          	andi	s9,s7,7
   11764:	0c0c8c63          	beqz	s9,1183c <_malloc_r+0x688>
   11768:	419b8bb3          	sub	s7,s7,s9
   1176c:	000017b7          	lui	a5,0x1
   11770:	00878793          	addi	a5,a5,8 # 1008 <exit-0xf08c>
   11774:	008b8b93          	addi	s7,s7,8
   11778:	419785b3          	sub	a1,a5,s9
   1177c:	015b8ab3          	add	s5,s7,s5
   11780:	415585b3          	sub	a1,a1,s5
   11784:	01459593          	slli	a1,a1,0x14
   11788:	0145da13          	srli	s4,a1,0x14
   1178c:	000a0593          	mv	a1,s4
   11790:	00098513          	mv	a0,s3
   11794:	628000ef          	jal	11dbc <_sbrk_r>
   11798:	fff00793          	li	a5,-1
   1179c:	18f50063          	beq	a0,a5,1191c <_malloc_r+0x768>
   117a0:	41750533          	sub	a0,a0,s7
   117a4:	01450ab3          	add	s5,a0,s4
   117a8:	000c2703          	lw	a4,0(s8)
   117ac:	01792423          	sw	s7,8(s2)
   117b0:	001ae793          	ori	a5,s5,1
   117b4:	00ea05b3          	add	a1,s4,a4
   117b8:	00bc2023          	sw	a1,0(s8)
   117bc:	00fba223          	sw	a5,4(s7)
   117c0:	cf240ce3          	beq	s0,s2,114b8 <_malloc_r+0x304>
   117c4:	00f00693          	li	a3,15
   117c8:	0b66f063          	bgeu	a3,s6,11868 <_malloc_r+0x6b4>
   117cc:	00442703          	lw	a4,4(s0)
   117d0:	ff4b0793          	addi	a5,s6,-12
   117d4:	ff87f793          	andi	a5,a5,-8
   117d8:	00177713          	andi	a4,a4,1
   117dc:	00f76733          	or	a4,a4,a5
   117e0:	00e42223          	sw	a4,4(s0)
   117e4:	00500613          	li	a2,5
   117e8:	00f40733          	add	a4,s0,a5
   117ec:	00c72223          	sw	a2,4(a4)
   117f0:	00c72423          	sw	a2,8(a4)
   117f4:	00f6e663          	bltu	a3,a5,11800 <_malloc_r+0x64c>
   117f8:	004ba783          	lw	a5,4(s7)
   117fc:	cbdff06f          	j	114b8 <_malloc_r+0x304>
   11800:	00840593          	addi	a1,s0,8
   11804:	00098513          	mv	a0,s3
   11808:	ea8ff0ef          	jal	10eb0 <_free_r>
   1180c:	00892b83          	lw	s7,8(s2)
   11810:	000c2583          	lw	a1,0(s8)
   11814:	004ba783          	lw	a5,4(s7)
   11818:	ca1ff06f          	j	114b8 <_malloc_r+0x304>
   1181c:	010a8a93          	addi	s5,s5,16
   11820:	c49ff06f          	j	11468 <_malloc_r+0x2b4>
   11824:	4026d693          	srai	a3,a3,0x2
   11828:	00100793          	li	a5,1
   1182c:	00d797b3          	sll	a5,a5,a3
   11830:	00f56533          	or	a0,a0,a5
   11834:	00a92223          	sw	a0,4(s2)
   11838:	d75ff06f          	j	115ac <_malloc_r+0x3f8>
   1183c:	015b85b3          	add	a1,s7,s5
   11840:	40b005b3          	neg	a1,a1
   11844:	01459593          	slli	a1,a1,0x14
   11848:	0145da13          	srli	s4,a1,0x14
   1184c:	000a0593          	mv	a1,s4
   11850:	00098513          	mv	a0,s3
   11854:	568000ef          	jal	11dbc <_sbrk_r>
   11858:	fff00793          	li	a5,-1
   1185c:	f4f512e3          	bne	a0,a5,117a0 <_malloc_r+0x5ec>
   11860:	00000a13          	li	s4,0
   11864:	f45ff06f          	j	117a8 <_malloc_r+0x5f4>
   11868:	00812c03          	lw	s8,8(sp)
   1186c:	00100793          	li	a5,1
   11870:	00fba223          	sw	a5,4(s7)
   11874:	00098513          	mv	a0,s3
   11878:	0fc000ef          	jal	11974 <__malloc_unlock>
   1187c:	00000513          	li	a0,0
   11880:	01812a03          	lw	s4,24(sp)
   11884:	01412a83          	lw	s5,20(sp)
   11888:	01012b03          	lw	s6,16(sp)
   1188c:	00c12b83          	lw	s7,12(sp)
   11890:	00412c83          	lw	s9,4(sp)
   11894:	9adff06f          	j	11240 <_malloc_r+0x8c>
   11898:	05400693          	li	a3,84
   1189c:	04e6e463          	bltu	a3,a4,118e4 <_malloc_r+0x730>
   118a0:	00c7d713          	srli	a4,a5,0xc
   118a4:	06f70613          	addi	a2,a4,111
   118a8:	06e70693          	addi	a3,a4,110
   118ac:	00361613          	slli	a2,a2,0x3
   118b0:	cd1ff06f          	j	11580 <_malloc_r+0x3cc>
   118b4:	15400713          	li	a4,340
   118b8:	04f76463          	bltu	a4,a5,11900 <_malloc_r+0x74c>
   118bc:	00f4d793          	srli	a5,s1,0xf
   118c0:	07878593          	addi	a1,a5,120
   118c4:	07778813          	addi	a6,a5,119
   118c8:	00359613          	slli	a2,a1,0x3
   118cc:	9c9ff06f          	j	11294 <_malloc_r+0xe0>
   118d0:	00892403          	lw	s0,8(s2)
   118d4:	00442783          	lw	a5,4(s0)
   118d8:	c01ff06f          	j	114d8 <_malloc_r+0x324>
   118dc:	d571a023          	sw	s7,-704(gp) # 13620 <__malloc_sbrk_base>
   118e0:	e81ff06f          	j	11760 <_malloc_r+0x5ac>
   118e4:	15400693          	li	a3,340
   118e8:	04e6e463          	bltu	a3,a4,11930 <_malloc_r+0x77c>
   118ec:	00f7d713          	srli	a4,a5,0xf
   118f0:	07870613          	addi	a2,a4,120
   118f4:	07770693          	addi	a3,a4,119
   118f8:	00361613          	slli	a2,a2,0x3
   118fc:	c85ff06f          	j	11580 <_malloc_r+0x3cc>
   11900:	55400713          	li	a4,1364
   11904:	04f76463          	bltu	a4,a5,1194c <_malloc_r+0x798>
   11908:	0124d793          	srli	a5,s1,0x12
   1190c:	07d78593          	addi	a1,a5,125
   11910:	07c78813          	addi	a6,a5,124
   11914:	00359613          	slli	a2,a1,0x3
   11918:	97dff06f          	j	11294 <_malloc_r+0xe0>
   1191c:	ff8c8c93          	addi	s9,s9,-8
   11920:	019a8ab3          	add	s5,s5,s9
   11924:	417a8ab3          	sub	s5,s5,s7
   11928:	00000a13          	li	s4,0
   1192c:	e7dff06f          	j	117a8 <_malloc_r+0x5f4>
   11930:	55400693          	li	a3,1364
   11934:	02e6e463          	bltu	a3,a4,1195c <_malloc_r+0x7a8>
   11938:	0127d713          	srli	a4,a5,0x12
   1193c:	07d70613          	addi	a2,a4,125
   11940:	07c70693          	addi	a3,a4,124
   11944:	00361613          	slli	a2,a2,0x3
   11948:	c39ff06f          	j	11580 <_malloc_r+0x3cc>
   1194c:	3f800613          	li	a2,1016
   11950:	07f00593          	li	a1,127
   11954:	07e00813          	li	a6,126
   11958:	93dff06f          	j	11294 <_malloc_r+0xe0>
   1195c:	3f800613          	li	a2,1016
   11960:	07e00693          	li	a3,126
   11964:	c1dff06f          	j	11580 <_malloc_r+0x3cc>
   11968:	00492783          	lw	a5,4(s2)
   1196c:	da1ff06f          	j	1170c <_malloc_r+0x558>

00011970 <__malloc_lock>:
   11970:	00008067          	ret

00011974 <__malloc_unlock>:
   11974:	00008067          	ret

00011978 <_fclose_r>:
   11978:	ff010113          	addi	sp,sp,-16
   1197c:	00112623          	sw	ra,12(sp)
   11980:	01212023          	sw	s2,0(sp)
   11984:	02058863          	beqz	a1,119b4 <_fclose_r+0x3c>
   11988:	00812423          	sw	s0,8(sp)
   1198c:	00912223          	sw	s1,4(sp)
   11990:	00058413          	mv	s0,a1
   11994:	00050493          	mv	s1,a0
   11998:	00050663          	beqz	a0,119a4 <_fclose_r+0x2c>
   1199c:	03452783          	lw	a5,52(a0)
   119a0:	0c078c63          	beqz	a5,11a78 <_fclose_r+0x100>
   119a4:	00c41783          	lh	a5,12(s0)
   119a8:	02079263          	bnez	a5,119cc <_fclose_r+0x54>
   119ac:	00812403          	lw	s0,8(sp)
   119b0:	00412483          	lw	s1,4(sp)
   119b4:	00c12083          	lw	ra,12(sp)
   119b8:	00000913          	li	s2,0
   119bc:	00090513          	mv	a0,s2
   119c0:	00012903          	lw	s2,0(sp)
   119c4:	01010113          	addi	sp,sp,16
   119c8:	00008067          	ret
   119cc:	00040593          	mv	a1,s0
   119d0:	00048513          	mv	a0,s1
   119d4:	0b8000ef          	jal	11a8c <__sflush_r>
   119d8:	02c42783          	lw	a5,44(s0)
   119dc:	00050913          	mv	s2,a0
   119e0:	00078a63          	beqz	a5,119f4 <_fclose_r+0x7c>
   119e4:	01c42583          	lw	a1,28(s0)
   119e8:	00048513          	mv	a0,s1
   119ec:	000780e7          	jalr	a5
   119f0:	06054463          	bltz	a0,11a58 <_fclose_r+0xe0>
   119f4:	00c45783          	lhu	a5,12(s0)
   119f8:	0807f793          	andi	a5,a5,128
   119fc:	06079663          	bnez	a5,11a68 <_fclose_r+0xf0>
   11a00:	03042583          	lw	a1,48(s0)
   11a04:	00058c63          	beqz	a1,11a1c <_fclose_r+0xa4>
   11a08:	04040793          	addi	a5,s0,64
   11a0c:	00f58663          	beq	a1,a5,11a18 <_fclose_r+0xa0>
   11a10:	00048513          	mv	a0,s1
   11a14:	c9cff0ef          	jal	10eb0 <_free_r>
   11a18:	02042823          	sw	zero,48(s0)
   11a1c:	04442583          	lw	a1,68(s0)
   11a20:	00058863          	beqz	a1,11a30 <_fclose_r+0xb8>
   11a24:	00048513          	mv	a0,s1
   11a28:	c88ff0ef          	jal	10eb0 <_free_r>
   11a2c:	04042223          	sw	zero,68(s0)
   11a30:	bd9fe0ef          	jal	10608 <__sfp_lock_acquire>
   11a34:	00041623          	sh	zero,12(s0)
   11a38:	bd5fe0ef          	jal	1060c <__sfp_lock_release>
   11a3c:	00c12083          	lw	ra,12(sp)
   11a40:	00812403          	lw	s0,8(sp)
   11a44:	00412483          	lw	s1,4(sp)
   11a48:	00090513          	mv	a0,s2
   11a4c:	00012903          	lw	s2,0(sp)
   11a50:	01010113          	addi	sp,sp,16
   11a54:	00008067          	ret
   11a58:	00c45783          	lhu	a5,12(s0)
   11a5c:	fff00913          	li	s2,-1
   11a60:	0807f793          	andi	a5,a5,128
   11a64:	f8078ee3          	beqz	a5,11a00 <_fclose_r+0x88>
   11a68:	01042583          	lw	a1,16(s0)
   11a6c:	00048513          	mv	a0,s1
   11a70:	c40ff0ef          	jal	10eb0 <_free_r>
   11a74:	f8dff06f          	j	11a00 <_fclose_r+0x88>
   11a78:	b6dfe0ef          	jal	105e4 <__sinit>
   11a7c:	f29ff06f          	j	119a4 <_fclose_r+0x2c>

00011a80 <fclose>:
   11a80:	00050593          	mv	a1,a0
   11a84:	d3c1a503          	lw	a0,-708(gp) # 1361c <_impure_ptr>
   11a88:	ef1ff06f          	j	11978 <_fclose_r>

00011a8c <__sflush_r>:
   11a8c:	00c59703          	lh	a4,12(a1)
   11a90:	fe010113          	addi	sp,sp,-32
   11a94:	00812c23          	sw	s0,24(sp)
   11a98:	01312623          	sw	s3,12(sp)
   11a9c:	00112e23          	sw	ra,28(sp)
   11aa0:	00877793          	andi	a5,a4,8
   11aa4:	00058413          	mv	s0,a1
   11aa8:	00050993          	mv	s3,a0
   11aac:	12079063          	bnez	a5,11bcc <__sflush_r+0x140>
   11ab0:	000017b7          	lui	a5,0x1
   11ab4:	80078793          	addi	a5,a5,-2048 # 800 <exit-0xf894>
   11ab8:	0045a683          	lw	a3,4(a1)
   11abc:	00f767b3          	or	a5,a4,a5
   11ac0:	00f59623          	sh	a5,12(a1)
   11ac4:	18d05263          	blez	a3,11c48 <__sflush_r+0x1bc>
   11ac8:	02842803          	lw	a6,40(s0)
   11acc:	0e080463          	beqz	a6,11bb4 <__sflush_r+0x128>
   11ad0:	00912a23          	sw	s1,20(sp)
   11ad4:	01371693          	slli	a3,a4,0x13
   11ad8:	0009a483          	lw	s1,0(s3)
   11adc:	0009a023          	sw	zero,0(s3)
   11ae0:	01c42583          	lw	a1,28(s0)
   11ae4:	1606ce63          	bltz	a3,11c60 <__sflush_r+0x1d4>
   11ae8:	00000613          	li	a2,0
   11aec:	00100693          	li	a3,1
   11af0:	00098513          	mv	a0,s3
   11af4:	000800e7          	jalr	a6
   11af8:	fff00793          	li	a5,-1
   11afc:	00050613          	mv	a2,a0
   11b00:	1af50463          	beq	a0,a5,11ca8 <__sflush_r+0x21c>
   11b04:	00c41783          	lh	a5,12(s0)
   11b08:	02842803          	lw	a6,40(s0)
   11b0c:	01c42583          	lw	a1,28(s0)
   11b10:	0047f793          	andi	a5,a5,4
   11b14:	00078e63          	beqz	a5,11b30 <__sflush_r+0xa4>
   11b18:	00442703          	lw	a4,4(s0)
   11b1c:	03042783          	lw	a5,48(s0)
   11b20:	40e60633          	sub	a2,a2,a4
   11b24:	00078663          	beqz	a5,11b30 <__sflush_r+0xa4>
   11b28:	03c42783          	lw	a5,60(s0)
   11b2c:	40f60633          	sub	a2,a2,a5
   11b30:	00000693          	li	a3,0
   11b34:	00098513          	mv	a0,s3
   11b38:	000800e7          	jalr	a6
   11b3c:	fff00793          	li	a5,-1
   11b40:	12f51463          	bne	a0,a5,11c68 <__sflush_r+0x1dc>
   11b44:	0009a683          	lw	a3,0(s3)
   11b48:	01d00793          	li	a5,29
   11b4c:	00c41703          	lh	a4,12(s0)
   11b50:	16d7ea63          	bltu	a5,a3,11cc4 <__sflush_r+0x238>
   11b54:	204007b7          	lui	a5,0x20400
   11b58:	00178793          	addi	a5,a5,1 # 20400001 <__BSS_END__+0x203ec6b1>
   11b5c:	00d7d7b3          	srl	a5,a5,a3
   11b60:	0017f793          	andi	a5,a5,1
   11b64:	16078063          	beqz	a5,11cc4 <__sflush_r+0x238>
   11b68:	01042603          	lw	a2,16(s0)
   11b6c:	fffff7b7          	lui	a5,0xfffff
   11b70:	7ff78793          	addi	a5,a5,2047 # fffff7ff <__BSS_END__+0xfffebeaf>
   11b74:	00f777b3          	and	a5,a4,a5
   11b78:	00f41623          	sh	a5,12(s0)
   11b7c:	00042223          	sw	zero,4(s0)
   11b80:	00c42023          	sw	a2,0(s0)
   11b84:	01371793          	slli	a5,a4,0x13
   11b88:	0007d463          	bgez	a5,11b90 <__sflush_r+0x104>
   11b8c:	10068263          	beqz	a3,11c90 <__sflush_r+0x204>
   11b90:	03042583          	lw	a1,48(s0)
   11b94:	0099a023          	sw	s1,0(s3)
   11b98:	10058463          	beqz	a1,11ca0 <__sflush_r+0x214>
   11b9c:	04040793          	addi	a5,s0,64
   11ba0:	00f58663          	beq	a1,a5,11bac <__sflush_r+0x120>
   11ba4:	00098513          	mv	a0,s3
   11ba8:	b08ff0ef          	jal	10eb0 <_free_r>
   11bac:	01412483          	lw	s1,20(sp)
   11bb0:	02042823          	sw	zero,48(s0)
   11bb4:	00000513          	li	a0,0
   11bb8:	01c12083          	lw	ra,28(sp)
   11bbc:	01812403          	lw	s0,24(sp)
   11bc0:	00c12983          	lw	s3,12(sp)
   11bc4:	02010113          	addi	sp,sp,32
   11bc8:	00008067          	ret
   11bcc:	01212823          	sw	s2,16(sp)
   11bd0:	0105a903          	lw	s2,16(a1)
   11bd4:	08090263          	beqz	s2,11c58 <__sflush_r+0x1cc>
   11bd8:	00912a23          	sw	s1,20(sp)
   11bdc:	0005a483          	lw	s1,0(a1)
   11be0:	00377713          	andi	a4,a4,3
   11be4:	0125a023          	sw	s2,0(a1)
   11be8:	412484b3          	sub	s1,s1,s2
   11bec:	00000793          	li	a5,0
   11bf0:	00071463          	bnez	a4,11bf8 <__sflush_r+0x16c>
   11bf4:	0145a783          	lw	a5,20(a1)
   11bf8:	00f42423          	sw	a5,8(s0)
   11bfc:	00904863          	bgtz	s1,11c0c <__sflush_r+0x180>
   11c00:	0540006f          	j	11c54 <__sflush_r+0x1c8>
   11c04:	00a90933          	add	s2,s2,a0
   11c08:	04905663          	blez	s1,11c54 <__sflush_r+0x1c8>
   11c0c:	02442783          	lw	a5,36(s0)
   11c10:	01c42583          	lw	a1,28(s0)
   11c14:	00048693          	mv	a3,s1
   11c18:	00090613          	mv	a2,s2
   11c1c:	00098513          	mv	a0,s3
   11c20:	000780e7          	jalr	a5
   11c24:	40a484b3          	sub	s1,s1,a0
   11c28:	fca04ee3          	bgtz	a0,11c04 <__sflush_r+0x178>
   11c2c:	00c41703          	lh	a4,12(s0)
   11c30:	01012903          	lw	s2,16(sp)
   11c34:	04076713          	ori	a4,a4,64
   11c38:	01412483          	lw	s1,20(sp)
   11c3c:	00e41623          	sh	a4,12(s0)
   11c40:	fff00513          	li	a0,-1
   11c44:	f75ff06f          	j	11bb8 <__sflush_r+0x12c>
   11c48:	03c5a683          	lw	a3,60(a1)
   11c4c:	e6d04ee3          	bgtz	a3,11ac8 <__sflush_r+0x3c>
   11c50:	f65ff06f          	j	11bb4 <__sflush_r+0x128>
   11c54:	01412483          	lw	s1,20(sp)
   11c58:	01012903          	lw	s2,16(sp)
   11c5c:	f59ff06f          	j	11bb4 <__sflush_r+0x128>
   11c60:	05042603          	lw	a2,80(s0)
   11c64:	eadff06f          	j	11b10 <__sflush_r+0x84>
   11c68:	00c41703          	lh	a4,12(s0)
   11c6c:	01042683          	lw	a3,16(s0)
   11c70:	fffff7b7          	lui	a5,0xfffff
   11c74:	7ff78793          	addi	a5,a5,2047 # fffff7ff <__BSS_END__+0xfffebeaf>
   11c78:	00f777b3          	and	a5,a4,a5
   11c7c:	00f41623          	sh	a5,12(s0)
   11c80:	00042223          	sw	zero,4(s0)
   11c84:	00d42023          	sw	a3,0(s0)
   11c88:	01371793          	slli	a5,a4,0x13
   11c8c:	f007d2e3          	bgez	a5,11b90 <__sflush_r+0x104>
   11c90:	03042583          	lw	a1,48(s0)
   11c94:	04a42823          	sw	a0,80(s0)
   11c98:	0099a023          	sw	s1,0(s3)
   11c9c:	f00590e3          	bnez	a1,11b9c <__sflush_r+0x110>
   11ca0:	01412483          	lw	s1,20(sp)
   11ca4:	f11ff06f          	j	11bb4 <__sflush_r+0x128>
   11ca8:	0009a783          	lw	a5,0(s3)
   11cac:	e4078ce3          	beqz	a5,11b04 <__sflush_r+0x78>
   11cb0:	01d00713          	li	a4,29
   11cb4:	00e78c63          	beq	a5,a4,11ccc <__sflush_r+0x240>
   11cb8:	01600713          	li	a4,22
   11cbc:	00e78863          	beq	a5,a4,11ccc <__sflush_r+0x240>
   11cc0:	00c41703          	lh	a4,12(s0)
   11cc4:	04076713          	ori	a4,a4,64
   11cc8:	f71ff06f          	j	11c38 <__sflush_r+0x1ac>
   11ccc:	0099a023          	sw	s1,0(s3)
   11cd0:	01412483          	lw	s1,20(sp)
   11cd4:	ee1ff06f          	j	11bb4 <__sflush_r+0x128>

00011cd8 <_fflush_r>:
   11cd8:	fe010113          	addi	sp,sp,-32
   11cdc:	00812c23          	sw	s0,24(sp)
   11ce0:	00112e23          	sw	ra,28(sp)
   11ce4:	00050413          	mv	s0,a0
   11ce8:	00050663          	beqz	a0,11cf4 <_fflush_r+0x1c>
   11cec:	03452783          	lw	a5,52(a0)
   11cf0:	02078a63          	beqz	a5,11d24 <_fflush_r+0x4c>
   11cf4:	00c59783          	lh	a5,12(a1)
   11cf8:	00079c63          	bnez	a5,11d10 <_fflush_r+0x38>
   11cfc:	01c12083          	lw	ra,28(sp)
   11d00:	01812403          	lw	s0,24(sp)
   11d04:	00000513          	li	a0,0
   11d08:	02010113          	addi	sp,sp,32
   11d0c:	00008067          	ret
   11d10:	00040513          	mv	a0,s0
   11d14:	01812403          	lw	s0,24(sp)
   11d18:	01c12083          	lw	ra,28(sp)
   11d1c:	02010113          	addi	sp,sp,32
   11d20:	d6dff06f          	j	11a8c <__sflush_r>
   11d24:	00b12623          	sw	a1,12(sp)
   11d28:	8bdfe0ef          	jal	105e4 <__sinit>
   11d2c:	00c12583          	lw	a1,12(sp)
   11d30:	fc5ff06f          	j	11cf4 <_fflush_r+0x1c>

00011d34 <fflush>:
   11d34:	06050063          	beqz	a0,11d94 <fflush+0x60>
   11d38:	00050593          	mv	a1,a0
   11d3c:	d3c1a503          	lw	a0,-708(gp) # 1361c <_impure_ptr>
   11d40:	00050663          	beqz	a0,11d4c <fflush+0x18>
   11d44:	03452783          	lw	a5,52(a0)
   11d48:	00078c63          	beqz	a5,11d60 <fflush+0x2c>
   11d4c:	00c59783          	lh	a5,12(a1)
   11d50:	00079663          	bnez	a5,11d5c <fflush+0x28>
   11d54:	00000513          	li	a0,0
   11d58:	00008067          	ret
   11d5c:	d31ff06f          	j	11a8c <__sflush_r>
   11d60:	fe010113          	addi	sp,sp,-32
   11d64:	00b12623          	sw	a1,12(sp)
   11d68:	00a12423          	sw	a0,8(sp)
   11d6c:	00112e23          	sw	ra,28(sp)
   11d70:	875fe0ef          	jal	105e4 <__sinit>
   11d74:	00c12583          	lw	a1,12(sp)
   11d78:	00812503          	lw	a0,8(sp)
   11d7c:	00c59783          	lh	a5,12(a1)
   11d80:	02079863          	bnez	a5,11db0 <fflush+0x7c>
   11d84:	01c12083          	lw	ra,28(sp)
   11d88:	00000513          	li	a0,0
   11d8c:	02010113          	addi	sp,sp,32
   11d90:	00008067          	ret
   11d94:	00013637          	lui	a2,0x13
   11d98:	000125b7          	lui	a1,0x12
   11d9c:	00013537          	lui	a0,0x13
   11da0:	0e060613          	addi	a2,a2,224 # 130e0 <__sglue>
   11da4:	cd858593          	addi	a1,a1,-808 # 11cd8 <_fflush_r>
   11da8:	0f050513          	addi	a0,a0,240 # 130f0 <_impure_data>
   11dac:	895fe06f          	j	10640 <_fwalk_sglue>
   11db0:	01c12083          	lw	ra,28(sp)
   11db4:	02010113          	addi	sp,sp,32
   11db8:	cd5ff06f          	j	11a8c <__sflush_r>

00011dbc <_sbrk_r>:
   11dbc:	ff010113          	addi	sp,sp,-16
   11dc0:	00812423          	sw	s0,8(sp)
   11dc4:	00912223          	sw	s1,4(sp)
   11dc8:	00050413          	mv	s0,a0
   11dcc:	00058513          	mv	a0,a1
   11dd0:	00112623          	sw	ra,12(sp)
   11dd4:	d401a623          	sw	zero,-692(gp) # 1362c <errno>
   11dd8:	230000ef          	jal	12008 <_sbrk>
   11ddc:	fff00793          	li	a5,-1
   11de0:	00f50c63          	beq	a0,a5,11df8 <_sbrk_r+0x3c>
   11de4:	00c12083          	lw	ra,12(sp)
   11de8:	00812403          	lw	s0,8(sp)
   11dec:	00412483          	lw	s1,4(sp)
   11df0:	01010113          	addi	sp,sp,16
   11df4:	00008067          	ret
   11df8:	d4c1a783          	lw	a5,-692(gp) # 1362c <errno>
   11dfc:	fe0784e3          	beqz	a5,11de4 <_sbrk_r+0x28>
   11e00:	00c12083          	lw	ra,12(sp)
   11e04:	00f42023          	sw	a5,0(s0)
   11e08:	00812403          	lw	s0,8(sp)
   11e0c:	00412483          	lw	s1,4(sp)
   11e10:	01010113          	addi	sp,sp,16
   11e14:	00008067          	ret

00011e18 <__libc_fini_array>:
   11e18:	ff010113          	addi	sp,sp,-16
   11e1c:	00812423          	sw	s0,8(sp)
   11e20:	000137b7          	lui	a5,0x13
   11e24:	00013437          	lui	s0,0x13
   11e28:	0d878793          	addi	a5,a5,216 # 130d8 <__do_global_dtors_aux_fini_array_entry>
   11e2c:	0dc40413          	addi	s0,s0,220 # 130dc <__fini_array_end>
   11e30:	40f40433          	sub	s0,s0,a5
   11e34:	00912223          	sw	s1,4(sp)
   11e38:	00112623          	sw	ra,12(sp)
   11e3c:	40245493          	srai	s1,s0,0x2
   11e40:	02048063          	beqz	s1,11e60 <__libc_fini_array+0x48>
   11e44:	ffc40413          	addi	s0,s0,-4
   11e48:	00f40433          	add	s0,s0,a5
   11e4c:	00042783          	lw	a5,0(s0)
   11e50:	fff48493          	addi	s1,s1,-1
   11e54:	ffc40413          	addi	s0,s0,-4
   11e58:	000780e7          	jalr	a5
   11e5c:	fe0498e3          	bnez	s1,11e4c <__libc_fini_array+0x34>
   11e60:	00c12083          	lw	ra,12(sp)
   11e64:	00812403          	lw	s0,8(sp)
   11e68:	00412483          	lw	s1,4(sp)
   11e6c:	01010113          	addi	sp,sp,16
   11e70:	00008067          	ret

00011e74 <__register_exitproc>:
   11e74:	d501a783          	lw	a5,-688(gp) # 13630 <__atexit>
   11e78:	04078c63          	beqz	a5,11ed0 <__register_exitproc+0x5c>
   11e7c:	0047a703          	lw	a4,4(a5)
   11e80:	01f00813          	li	a6,31
   11e84:	08e84063          	blt	a6,a4,11f04 <__register_exitproc+0x90>
   11e88:	00271813          	slli	a6,a4,0x2
   11e8c:	02050663          	beqz	a0,11eb8 <__register_exitproc+0x44>
   11e90:	01078333          	add	t1,a5,a6
   11e94:	08c32423          	sw	a2,136(t1)
   11e98:	1887a883          	lw	a7,392(a5)
   11e9c:	00100613          	li	a2,1
   11ea0:	00e61633          	sll	a2,a2,a4
   11ea4:	00c8e8b3          	or	a7,a7,a2
   11ea8:	1917a423          	sw	a7,392(a5)
   11eac:	10d32423          	sw	a3,264(t1)
   11eb0:	00200693          	li	a3,2
   11eb4:	02d50663          	beq	a0,a3,11ee0 <__register_exitproc+0x6c>
   11eb8:	00170713          	addi	a4,a4,1
   11ebc:	00e7a223          	sw	a4,4(a5)
   11ec0:	010787b3          	add	a5,a5,a6
   11ec4:	00b7a423          	sw	a1,8(a5)
   11ec8:	00000513          	li	a0,0
   11ecc:	00008067          	ret
   11ed0:	ee018813          	addi	a6,gp,-288 # 137c0 <__atexit0>
   11ed4:	d501a823          	sw	a6,-688(gp) # 13630 <__atexit>
   11ed8:	ee018793          	addi	a5,gp,-288 # 137c0 <__atexit0>
   11edc:	fa1ff06f          	j	11e7c <__register_exitproc+0x8>
   11ee0:	18c7a683          	lw	a3,396(a5)
   11ee4:	00170713          	addi	a4,a4,1
   11ee8:	00e7a223          	sw	a4,4(a5)
   11eec:	00c6e6b3          	or	a3,a3,a2
   11ef0:	18d7a623          	sw	a3,396(a5)
   11ef4:	010787b3          	add	a5,a5,a6
   11ef8:	00b7a423          	sw	a1,8(a5)
   11efc:	00000513          	li	a0,0
   11f00:	00008067          	ret
   11f04:	fff00513          	li	a0,-1
   11f08:	00008067          	ret

00011f0c <_close>:
   11f0c:	ff010113          	addi	sp,sp,-16
   11f10:	00112623          	sw	ra,12(sp)
   11f14:	00812423          	sw	s0,8(sp)
   11f18:	03900893          	li	a7,57
   11f1c:	00000073          	ecall
   11f20:	00050413          	mv	s0,a0
   11f24:	00054c63          	bltz	a0,11f3c <_close+0x30>
   11f28:	00c12083          	lw	ra,12(sp)
   11f2c:	00040513          	mv	a0,s0
   11f30:	00812403          	lw	s0,8(sp)
   11f34:	01010113          	addi	sp,sp,16
   11f38:	00008067          	ret
   11f3c:	40800433          	neg	s0,s0
   11f40:	184000ef          	jal	120c4 <__errno>
   11f44:	00852023          	sw	s0,0(a0)
   11f48:	fff00413          	li	s0,-1
   11f4c:	fddff06f          	j	11f28 <_close+0x1c>

00011f50 <_exit>:
   11f50:	05d00893          	li	a7,93
   11f54:	00000073          	ecall
   11f58:	00054463          	bltz	a0,11f60 <_exit+0x10>
   11f5c:	0000006f          	j	11f5c <_exit+0xc>
   11f60:	ff010113          	addi	sp,sp,-16
   11f64:	00812423          	sw	s0,8(sp)
   11f68:	00050413          	mv	s0,a0
   11f6c:	00112623          	sw	ra,12(sp)
   11f70:	40800433          	neg	s0,s0
   11f74:	150000ef          	jal	120c4 <__errno>
   11f78:	00852023          	sw	s0,0(a0)
   11f7c:	0000006f          	j	11f7c <_exit+0x2c>

00011f80 <_lseek>:
   11f80:	ff010113          	addi	sp,sp,-16
   11f84:	00112623          	sw	ra,12(sp)
   11f88:	00812423          	sw	s0,8(sp)
   11f8c:	03e00893          	li	a7,62
   11f90:	00000073          	ecall
   11f94:	00050413          	mv	s0,a0
   11f98:	00054c63          	bltz	a0,11fb0 <_lseek+0x30>
   11f9c:	00c12083          	lw	ra,12(sp)
   11fa0:	00040513          	mv	a0,s0
   11fa4:	00812403          	lw	s0,8(sp)
   11fa8:	01010113          	addi	sp,sp,16
   11fac:	00008067          	ret
   11fb0:	40800433          	neg	s0,s0
   11fb4:	110000ef          	jal	120c4 <__errno>
   11fb8:	00852023          	sw	s0,0(a0)
   11fbc:	fff00413          	li	s0,-1
   11fc0:	fddff06f          	j	11f9c <_lseek+0x1c>

00011fc4 <_read>:
   11fc4:	ff010113          	addi	sp,sp,-16
   11fc8:	00112623          	sw	ra,12(sp)
   11fcc:	00812423          	sw	s0,8(sp)
   11fd0:	03f00893          	li	a7,63
   11fd4:	00000073          	ecall
   11fd8:	00050413          	mv	s0,a0
   11fdc:	00054c63          	bltz	a0,11ff4 <_read+0x30>
   11fe0:	00c12083          	lw	ra,12(sp)
   11fe4:	00040513          	mv	a0,s0
   11fe8:	00812403          	lw	s0,8(sp)
   11fec:	01010113          	addi	sp,sp,16
   11ff0:	00008067          	ret
   11ff4:	40800433          	neg	s0,s0
   11ff8:	0cc000ef          	jal	120c4 <__errno>
   11ffc:	00852023          	sw	s0,0(a0)
   12000:	fff00413          	li	s0,-1
   12004:	fddff06f          	j	11fe0 <_read+0x1c>

00012008 <_sbrk>:
   12008:	d601a703          	lw	a4,-672(gp) # 13640 <heap_end.0>
   1200c:	ff010113          	addi	sp,sp,-16
   12010:	00112623          	sw	ra,12(sp)
   12014:	00050793          	mv	a5,a0
   12018:	02071063          	bnez	a4,12038 <_sbrk+0x30>
   1201c:	0d600893          	li	a7,214
   12020:	00000513          	li	a0,0
   12024:	00000073          	ecall
   12028:	fff00613          	li	a2,-1
   1202c:	00050713          	mv	a4,a0
   12030:	02c50a63          	beq	a0,a2,12064 <_sbrk+0x5c>
   12034:	d6a1a023          	sw	a0,-672(gp) # 13640 <heap_end.0>
   12038:	0d600893          	li	a7,214
   1203c:	00e78533          	add	a0,a5,a4
   12040:	00000073          	ecall
   12044:	d601a703          	lw	a4,-672(gp) # 13640 <heap_end.0>
   12048:	00e787b3          	add	a5,a5,a4
   1204c:	00f51c63          	bne	a0,a5,12064 <_sbrk+0x5c>
   12050:	00c12083          	lw	ra,12(sp)
   12054:	d6a1a023          	sw	a0,-672(gp) # 13640 <heap_end.0>
   12058:	00070513          	mv	a0,a4
   1205c:	01010113          	addi	sp,sp,16
   12060:	00008067          	ret
   12064:	060000ef          	jal	120c4 <__errno>
   12068:	00c12083          	lw	ra,12(sp)
   1206c:	00c00793          	li	a5,12
   12070:	00f52023          	sw	a5,0(a0)
   12074:	fff00513          	li	a0,-1
   12078:	01010113          	addi	sp,sp,16
   1207c:	00008067          	ret

00012080 <_write>:
   12080:	ff010113          	addi	sp,sp,-16
   12084:	00112623          	sw	ra,12(sp)
   12088:	00812423          	sw	s0,8(sp)
   1208c:	04000893          	li	a7,64
   12090:	00000073          	ecall
   12094:	00050413          	mv	s0,a0
   12098:	00054c63          	bltz	a0,120b0 <_write+0x30>
   1209c:	00c12083          	lw	ra,12(sp)
   120a0:	00040513          	mv	a0,s0
   120a4:	00812403          	lw	s0,8(sp)
   120a8:	01010113          	addi	sp,sp,16
   120ac:	00008067          	ret
   120b0:	40800433          	neg	s0,s0
   120b4:	010000ef          	jal	120c4 <__errno>
   120b8:	00852023          	sw	s0,0(a0)
   120bc:	fff00413          	li	s0,-1
   120c0:	fddff06f          	j	1209c <_write+0x1c>

000120c4 <__errno>:
   120c4:	d3c1a503          	lw	a0,-708(gp) # 1361c <_impure_ptr>
   120c8:	00008067          	ret

Disassembly of section .eh_frame:

000130cc <__EH_FRAME_BEGIN__>:
   130cc:	0000                	.insn	2, 0x
	...

Disassembly of section .init_array:

000130d0 <__init_array_start>:
   130d0:	00c0                	.insn	2, 0x00c0
   130d2:	0001                	.insn	2, 0x0001

000130d4 <__frame_dummy_init_array_entry>:
   130d4:	0168                	.insn	2, 0x0168
   130d6:	0001                	.insn	2, 0x0001

Disassembly of section .fini_array:

000130d8 <__do_global_dtors_aux_fini_array_entry>:
   130d8:	0124                	.insn	2, 0x0124
   130da:	0001                	.insn	2, 0x0001

Disassembly of section .data:

000130e0 <__sglue>:
   130e0:	0000                	.insn	2, 0x
   130e2:	0000                	.insn	2, 0x
   130e4:	00000003          	lb	zero,0(zero) # 0 <exit-0x10094>
   130e8:	3660                	.insn	2, 0x3660
   130ea:	0001                	.insn	2, 0x0001
   130ec:	0000                	.insn	2, 0x
	...

000130f0 <_impure_data>:
   130f0:	0000                	.insn	2, 0x
   130f2:	0000                	.insn	2, 0x
   130f4:	3660                	.insn	2, 0x3660
   130f6:	0001                	.insn	2, 0x0001
   130f8:	36c8                	.insn	2, 0x36c8
   130fa:	0001                	.insn	2, 0x0001
   130fc:	3730                	.insn	2, 0x3730
   130fe:	0001                	.insn	2, 0x0001
	...
   13188:	0001                	.insn	2, 0x0001
   1318a:	0000                	.insn	2, 0x
   1318c:	0000                	.insn	2, 0x
   1318e:	0000                	.insn	2, 0x
   13190:	330e                	.insn	2, 0x330e
   13192:	abcd                	.insn	2, 0xabcd
   13194:	1234                	.insn	2, 0x1234
   13196:	e66d                	.insn	2, 0xe66d
   13198:	deec                	.insn	2, 0xdeec
   1319a:	0005                	.insn	2, 0x0005
   1319c:	0000000b          	.insn	4, 0x000b
	...

00013210 <__malloc_av_>:
	...
   13218:	3210                	.insn	2, 0x3210
   1321a:	0001                	.insn	2, 0x0001
   1321c:	3210                	.insn	2, 0x3210
   1321e:	0001                	.insn	2, 0x0001
   13220:	3218                	.insn	2, 0x3218
   13222:	0001                	.insn	2, 0x0001
   13224:	3218                	.insn	2, 0x3218
   13226:	0001                	.insn	2, 0x0001
   13228:	3220                	.insn	2, 0x3220
   1322a:	0001                	.insn	2, 0x0001
   1322c:	3220                	.insn	2, 0x3220
   1322e:	0001                	.insn	2, 0x0001
   13230:	3228                	.insn	2, 0x3228
   13232:	0001                	.insn	2, 0x0001
   13234:	3228                	.insn	2, 0x3228
   13236:	0001                	.insn	2, 0x0001
   13238:	3230                	.insn	2, 0x3230
   1323a:	0001                	.insn	2, 0x0001
   1323c:	3230                	.insn	2, 0x3230
   1323e:	0001                	.insn	2, 0x0001
   13240:	3238                	.insn	2, 0x3238
   13242:	0001                	.insn	2, 0x0001
   13244:	3238                	.insn	2, 0x3238
   13246:	0001                	.insn	2, 0x0001
   13248:	3240                	.insn	2, 0x3240
   1324a:	0001                	.insn	2, 0x0001
   1324c:	3240                	.insn	2, 0x3240
   1324e:	0001                	.insn	2, 0x0001
   13250:	3248                	.insn	2, 0x3248
   13252:	0001                	.insn	2, 0x0001
   13254:	3248                	.insn	2, 0x3248
   13256:	0001                	.insn	2, 0x0001
   13258:	3250                	.insn	2, 0x3250
   1325a:	0001                	.insn	2, 0x0001
   1325c:	3250                	.insn	2, 0x3250
   1325e:	0001                	.insn	2, 0x0001
   13260:	3258                	.insn	2, 0x3258
   13262:	0001                	.insn	2, 0x0001
   13264:	3258                	.insn	2, 0x3258
   13266:	0001                	.insn	2, 0x0001
   13268:	3260                	.insn	2, 0x3260
   1326a:	0001                	.insn	2, 0x0001
   1326c:	3260                	.insn	2, 0x3260
   1326e:	0001                	.insn	2, 0x0001
   13270:	3268                	.insn	2, 0x3268
   13272:	0001                	.insn	2, 0x0001
   13274:	3268                	.insn	2, 0x3268
   13276:	0001                	.insn	2, 0x0001
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

Disassembly of section .sdata:

00013618 <__dso_handle>:
   13618:	0000                	.insn	2, 0x
	...

0001361c <_impure_ptr>:
   1361c:	30f0                	.insn	2, 0x30f0
   1361e:	0001                	.insn	2, 0x0001

00013620 <__malloc_sbrk_base>:
   13620:	ffff                	.insn	2, 0xffff
   13622:	ffff                	.insn	2, 0xffff

00013624 <__malloc_trim_threshold>:
   13624:	0000                	.insn	2, 0x
   13626:	0002                	.insn	2, 0x0002

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
