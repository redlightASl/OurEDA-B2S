   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  48                     ; 63 void TIM2_DeInit(void)
  48                     ; 64 {
  50                     .text:	section	.text,new
  51  0000               _TIM2_DeInit:
  55                     ; 65   TIM2->CR1 = TIM_CR1_RESET_VALUE;
  57  0000 725f5250      	clr	21072
  58                     ; 66   TIM2->CR2 = TIM_CR2_RESET_VALUE;
  60  0004 725f5251      	clr	21073
  61                     ; 67   TIM2->SMCR = TIM_SMCR_RESET_VALUE;
  63  0008 725f5252      	clr	21074
  64                     ; 68   TIM2->ETR = TIM_ETR_RESET_VALUE;
  66  000c 725f5253      	clr	21075
  67                     ; 69   TIM2->IER = TIM_IER_RESET_VALUE;
  69  0010 725f5254      	clr	21076
  70                     ; 70   TIM2->SR2 = TIM_SR2_RESET_VALUE;
  72  0014 725f5256      	clr	21078
  73                     ; 73   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  75  0018 725f525a      	clr	21082
  76                     ; 75   TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
  78  001c 35015258      	mov	21080,#1
  79                     ; 76   TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
  81  0020 35015259      	mov	21081,#1
  82                     ; 79   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  84  0024 725f525a      	clr	21082
  85                     ; 80   TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
  87  0028 725f5258      	clr	21080
  88                     ; 81   TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
  90  002c 725f5259      	clr	21081
  91                     ; 83   TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
  93  0030 725f525b      	clr	21083
  94                     ; 84   TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
  96  0034 725f525c      	clr	21084
  97                     ; 86   TIM2->PSCR = TIM_PSCR_RESET_VALUE;
  99  0038 725f525d      	clr	21085
 100                     ; 88   TIM2->ARRH = TIM_ARRH_RESET_VALUE;
 102  003c 35ff525e      	mov	21086,#255
 103                     ; 89   TIM2->ARRL = TIM_ARRL_RESET_VALUE;
 105  0040 35ff525f      	mov	21087,#255
 106                     ; 91   TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
 108  0044 725f5260      	clr	21088
 109                     ; 92   TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
 111  0048 725f5261      	clr	21089
 112                     ; 93   TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
 114  004c 725f5262      	clr	21090
 115                     ; 94   TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
 117  0050 725f5263      	clr	21091
 118                     ; 96   TIM2->OISR = TIM_OISR_RESET_VALUE;
 120  0054 725f5265      	clr	21093
 121                     ; 97   TIM2->EGR = 0x01;/*TIM_EGR_UG;*/
 123  0058 35015257      	mov	21079,#1
 124                     ; 98   TIM2->BKR = TIM_BKR_RESET_VALUE;
 126  005c 725f5264      	clr	21092
 127                     ; 99   TIM2->SR1 = TIM_SR1_RESET_VALUE;
 129  0060 725f5255      	clr	21077
 130                     ; 100 }
 133  0064 81            	ret	
 295                     ; 124 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
 295                     ; 125                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
 295                     ; 126                        uint16_t TIM2_Period)
 295                     ; 127 {
 296                     .text:	section	.text,new
 297  0000               _TIM2_TimeBaseInit:
 299       fffffffe      OFST: set -2
 302                     ; 129   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
 304                     ; 130   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 306                     ; 133   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
 308  0000 7b03          	ld	a,(OFST+5,sp)
 309  0002 c7525e        	ld	21086,a
 310                     ; 134   TIM2->ARRL = (uint8_t)(TIM2_Period);
 312  0005 7b04          	ld	a,(OFST+6,sp)
 313  0007 c7525f        	ld	21087,a
 314                     ; 137   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 316  000a 9e            	ld	a,xh
 317  000b c7525d        	ld	21085,a
 318                     ; 140   TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 320  000e c65250        	ld	a,21072
 321  0011 a48f          	and	a,#143
 322  0013 c75250        	ld	21072,a
 323                     ; 141   TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
 325  0016 9f            	ld	a,xl
 326  0017 ca5250        	or	a,21072
 327  001a c75250        	ld	21072,a
 328                     ; 142 }
 331  001d 81            	ret	
 529                     ; 169 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 529                     ; 170                   TIM2_OutputState_TypeDef TIM2_OutputState,
 529                     ; 171                   uint16_t TIM2_Pulse,
 529                     ; 172                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 529                     ; 173                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 529                     ; 174 {
 530                     .text:	section	.text,new
 531  0000               _TIM2_OC1Init:
 533  0000 89            	pushw	x
 534  0001 88            	push	a
 535       00000001      OFST:	set	1
 538                     ; 175   uint8_t tmpccmr1 = 0;
 540                     ; 178   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 542                     ; 179   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 544                     ; 180   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 546                     ; 181   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 548                     ; 183   tmpccmr1 = TIM2->CCMR1;
 550  0002 c65258        	ld	a,21080
 551  0005 6b01          	ld	(OFST+0,sp),a
 553                     ; 186   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 555  0007 7211525a      	bres	21082,#0
 556                     ; 188   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 558  000b a48f          	and	a,#143
 559  000d 6b01          	ld	(OFST+0,sp),a
 561                     ; 191   tmpccmr1 |= (uint8_t)TIM2_OCMode;
 563  000f 9e            	ld	a,xh
 564  0010 1a01          	or	a,(OFST+0,sp)
 565  0012 6b01          	ld	(OFST+0,sp),a
 567                     ; 193   TIM2->CCMR1 = tmpccmr1;
 569  0014 c75258        	ld	21080,a
 570                     ; 196   if (TIM2_OutputState == TIM2_OutputState_Enable)
 572  0017 9f            	ld	a,xl
 573  0018 4a            	dec	a
 574  0019 2606          	jrne	L722
 575                     ; 198     TIM2->CCER1 |= TIM_CCER1_CC1E;
 577  001b 7210525a      	bset	21082,#0
 579  001f 2004          	jra	L132
 580  0021               L722:
 581                     ; 202     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 583  0021 7211525a      	bres	21082,#0
 584  0025               L132:
 585                     ; 206   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 587  0025 7b08          	ld	a,(OFST+7,sp)
 588  0027 4a            	dec	a
 589  0028 2606          	jrne	L332
 590                     ; 208     TIM2->CCER1 |= TIM_CCER1_CC1P;
 592  002a 7212525a      	bset	21082,#1
 594  002e 2004          	jra	L532
 595  0030               L332:
 596                     ; 212     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 598  0030 7213525a      	bres	21082,#1
 599  0034               L532:
 600                     ; 216   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 602  0034 7b09          	ld	a,(OFST+8,sp)
 603  0036 4a            	dec	a
 604  0037 2606          	jrne	L732
 605                     ; 218     TIM2->OISR |= TIM_OISR_OIS1;
 607  0039 72105265      	bset	21093,#0
 609  003d 2004          	jra	L142
 610  003f               L732:
 611                     ; 222     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 613  003f 72115265      	bres	21093,#0
 614  0043               L142:
 615                     ; 226   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 617  0043 7b06          	ld	a,(OFST+5,sp)
 618  0045 c75260        	ld	21088,a
 619                     ; 227   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 621  0048 7b07          	ld	a,(OFST+6,sp)
 622  004a c75261        	ld	21089,a
 623                     ; 228 }
 626  004d 5b03          	addw	sp,#3
 627  004f 81            	ret	
 710                     ; 255 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 710                     ; 256                   TIM2_OutputState_TypeDef TIM2_OutputState,
 710                     ; 257                   uint16_t TIM2_Pulse,
 710                     ; 258                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
 710                     ; 259                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
 710                     ; 260 {
 711                     .text:	section	.text,new
 712  0000               _TIM2_OC2Init:
 714  0000 89            	pushw	x
 715  0001 88            	push	a
 716       00000001      OFST:	set	1
 719                     ; 261   uint8_t tmpccmr2 = 0;
 721                     ; 264   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
 723                     ; 265   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
 725                     ; 266   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
 727                     ; 267   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
 729                     ; 269   tmpccmr2 = TIM2->CCMR2;
 731  0002 c65259        	ld	a,21081
 732  0005 6b01          	ld	(OFST+0,sp),a
 734                     ; 272   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 736  0007 7219525a      	bres	21082,#4
 737                     ; 275   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 739  000b a48f          	and	a,#143
 740  000d 6b01          	ld	(OFST+0,sp),a
 742                     ; 278   tmpccmr2 |= (uint8_t)TIM2_OCMode;
 744  000f 9e            	ld	a,xh
 745  0010 1a01          	or	a,(OFST+0,sp)
 746  0012 6b01          	ld	(OFST+0,sp),a
 748                     ; 280   TIM2->CCMR2 = tmpccmr2;
 750  0014 c75259        	ld	21081,a
 751                     ; 283   if (TIM2_OutputState == TIM2_OutputState_Enable)
 753  0017 9f            	ld	a,xl
 754  0018 4a            	dec	a
 755  0019 2606          	jrne	L503
 756                     ; 285     TIM2->CCER1 |= TIM_CCER1_CC2E;
 758  001b 7218525a      	bset	21082,#4
 760  001f 2004          	jra	L703
 761  0021               L503:
 762                     ; 289     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 764  0021 7219525a      	bres	21082,#4
 765  0025               L703:
 766                     ; 293   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
 768  0025 7b08          	ld	a,(OFST+7,sp)
 769  0027 4a            	dec	a
 770  0028 2606          	jrne	L113
 771                     ; 295     TIM2->CCER1 |= TIM_CCER1_CC2P;
 773  002a 721a525a      	bset	21082,#5
 775  002e 2004          	jra	L313
 776  0030               L113:
 777                     ; 299     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 779  0030 721b525a      	bres	21082,#5
 780  0034               L313:
 781                     ; 304   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
 783  0034 7b09          	ld	a,(OFST+8,sp)
 784  0036 4a            	dec	a
 785  0037 2606          	jrne	L513
 786                     ; 306     TIM2->OISR |= TIM_OISR_OIS2;
 788  0039 72145265      	bset	21093,#2
 790  003d 2004          	jra	L713
 791  003f               L513:
 792                     ; 310     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 794  003f 72155265      	bres	21093,#2
 795  0043               L713:
 796                     ; 314   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 798  0043 7b06          	ld	a,(OFST+5,sp)
 799  0045 c75262        	ld	21090,a
 800                     ; 315   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 802  0048 7b07          	ld	a,(OFST+6,sp)
 803  004a c75263        	ld	21091,a
 804                     ; 316 }
 807  004d 5b03          	addw	sp,#3
 808  004f 81            	ret	
1006                     ; 344 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
1006                     ; 345                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
1006                     ; 346                     TIM2_BreakState_TypeDef TIM2_BreakState,
1006                     ; 347                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
1006                     ; 348                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
1006                     ; 349 
1006                     ; 350 {
1007                     .text:	section	.text,new
1008  0000               _TIM2_BKRConfig:
1010  0000 89            	pushw	x
1011       00000000      OFST:	set	0
1014                     ; 352   assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
1016                     ; 353   assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
1018                     ; 354   assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
1020                     ; 355   assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
1022                     ; 356   assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
1024                     ; 361   TIM2->BKR = (uint8_t)((uint8_t)TIM2_OSSIState | (uint8_t)TIM2_LockLevel | \
1024                     ; 362                         (uint8_t)TIM2_BreakState | (uint8_t)TIM2_BreakPolarity | \
1024                     ; 363                         (uint8_t)TIM2_AutomaticOutput);
1026  0001 9f            	ld	a,xl
1027  0002 1a01          	or	a,(OFST+1,sp)
1028  0004 1a05          	or	a,(OFST+5,sp)
1029  0006 1a06          	or	a,(OFST+6,sp)
1030  0008 1a07          	or	a,(OFST+7,sp)
1031  000a c75264        	ld	21092,a
1032                     ; 364 }
1035  000d 85            	popw	x
1036  000e 81            	ret	
1220                     ; 390 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1220                     ; 391                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1220                     ; 392                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1220                     ; 393                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1220                     ; 394                  uint8_t TIM2_ICFilter)
1220                     ; 395 {
1221                     .text:	section	.text,new
1222  0000               _TIM2_ICInit:
1224  0000 89            	pushw	x
1225       00000000      OFST:	set	0
1228                     ; 397   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1230                     ; 399   if (TIM2_Channel == TIM2_Channel_1)
1232  0001 9e            	ld	a,xh
1233  0002 4d            	tnz	a
1234  0003 2614          	jrne	L735
1235                     ; 402     TI1_Config(TIM2_ICPolarity,
1235                     ; 403                TIM2_ICSelection,
1235                     ; 404                TIM2_ICFilter);
1237  0005 7b07          	ld	a,(OFST+7,sp)
1238  0007 88            	push	a
1239  0008 7b06          	ld	a,(OFST+6,sp)
1240  000a 97            	ld	xl,a
1241  000b 7b03          	ld	a,(OFST+3,sp)
1242  000d 95            	ld	xh,a
1243  000e cd0000        	call	L3_TI1_Config
1245  0011 84            	pop	a
1246                     ; 407     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1248  0012 7b06          	ld	a,(OFST+6,sp)
1249  0014 cd0000        	call	_TIM2_SetIC1Prescaler
1252  0017 2012          	jra	L145
1253  0019               L735:
1254                     ; 412     TI2_Config(TIM2_ICPolarity,
1254                     ; 413                TIM2_ICSelection,
1254                     ; 414                TIM2_ICFilter);
1256  0019 7b07          	ld	a,(OFST+7,sp)
1257  001b 88            	push	a
1258  001c 7b06          	ld	a,(OFST+6,sp)
1259  001e 97            	ld	xl,a
1260  001f 7b03          	ld	a,(OFST+3,sp)
1261  0021 95            	ld	xh,a
1262  0022 cd0000        	call	L5_TI2_Config
1264  0025 84            	pop	a
1265                     ; 416     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1267  0026 7b06          	ld	a,(OFST+6,sp)
1268  0028 cd0000        	call	_TIM2_SetIC2Prescaler
1270  002b               L145:
1271                     ; 418 }
1274  002b 85            	popw	x
1275  002c 81            	ret	
1371                     ; 444 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1371                     ; 445                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1371                     ; 446                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1371                     ; 447                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1371                     ; 448                      uint8_t TIM2_ICFilter)
1371                     ; 449 {
1372                     .text:	section	.text,new
1373  0000               _TIM2_PWMIConfig:
1375  0000 89            	pushw	x
1376  0001 89            	pushw	x
1377       00000002      OFST:	set	2
1380                     ; 450   uint8_t icpolarity = (uint8_t)TIM2_ICPolarity_Rising;
1382                     ; 451   uint8_t icselection = (uint8_t)TIM2_ICSelection_DirectTI;
1384                     ; 454   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1386                     ; 457   if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
1388  0002 9f            	ld	a,xl
1389  0003 4d            	tnz	a
1390  0004 2605          	jrne	L116
1391                     ; 459     icpolarity = (uint8_t)TIM2_ICPolarity_Falling;
1393  0006 4c            	inc	a
1394  0007 6b01          	ld	(OFST-1,sp),a
1397  0009 2002          	jra	L316
1398  000b               L116:
1399                     ; 463     icpolarity = (uint8_t)TIM2_ICPolarity_Rising;
1401  000b 0f01          	clr	(OFST-1,sp)
1403  000d               L316:
1404                     ; 467   if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
1406  000d 7b07          	ld	a,(OFST+5,sp)
1407  000f 4a            	dec	a
1408  0010 2604          	jrne	L516
1409                     ; 469     icselection = (uint8_t)TIM2_ICSelection_IndirectTI;
1411  0012 a602          	ld	a,#2
1413  0014 2002          	jra	L716
1414  0016               L516:
1415                     ; 473     icselection = (uint8_t)TIM2_ICSelection_DirectTI;
1417  0016 a601          	ld	a,#1
1418  0018               L716:
1419  0018 6b02          	ld	(OFST+0,sp),a
1421                     ; 476   if (TIM2_Channel == TIM2_Channel_1)
1423  001a 7b03          	ld	a,(OFST+1,sp)
1424  001c 2626          	jrne	L126
1425                     ; 479     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
1425                     ; 480                TIM2_ICFilter);
1427  001e 7b09          	ld	a,(OFST+7,sp)
1428  0020 88            	push	a
1429  0021 7b08          	ld	a,(OFST+6,sp)
1430  0023 97            	ld	xl,a
1431  0024 7b05          	ld	a,(OFST+3,sp)
1432  0026 95            	ld	xh,a
1433  0027 cd0000        	call	L3_TI1_Config
1435  002a 84            	pop	a
1436                     ; 483     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1438  002b 7b08          	ld	a,(OFST+6,sp)
1439  002d cd0000        	call	_TIM2_SetIC1Prescaler
1441                     ; 486     TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1443  0030 7b09          	ld	a,(OFST+7,sp)
1444  0032 88            	push	a
1445  0033 7b03          	ld	a,(OFST+1,sp)
1446  0035 97            	ld	xl,a
1447  0036 7b02          	ld	a,(OFST+0,sp)
1448  0038 95            	ld	xh,a
1449  0039 cd0000        	call	L5_TI2_Config
1451  003c 84            	pop	a
1452                     ; 489     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1454  003d 7b08          	ld	a,(OFST+6,sp)
1455  003f cd0000        	call	_TIM2_SetIC2Prescaler
1458  0042 2024          	jra	L326
1459  0044               L126:
1460                     ; 494     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
1460                     ; 495                TIM2_ICFilter);
1462  0044 7b09          	ld	a,(OFST+7,sp)
1463  0046 88            	push	a
1464  0047 7b08          	ld	a,(OFST+6,sp)
1465  0049 97            	ld	xl,a
1466  004a 7b05          	ld	a,(OFST+3,sp)
1467  004c 95            	ld	xh,a
1468  004d cd0000        	call	L5_TI2_Config
1470  0050 84            	pop	a
1471                     ; 498     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1473  0051 7b08          	ld	a,(OFST+6,sp)
1474  0053 cd0000        	call	_TIM2_SetIC2Prescaler
1476                     ; 501     TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
1478  0056 7b09          	ld	a,(OFST+7,sp)
1479  0058 88            	push	a
1480  0059 7b03          	ld	a,(OFST+1,sp)
1481  005b 97            	ld	xl,a
1482  005c 7b02          	ld	a,(OFST+0,sp)
1483  005e 95            	ld	xh,a
1484  005f cd0000        	call	L3_TI1_Config
1486  0062 84            	pop	a
1487                     ; 504     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1489  0063 7b08          	ld	a,(OFST+6,sp)
1490  0065 cd0000        	call	_TIM2_SetIC1Prescaler
1492  0068               L326:
1493                     ; 506 }
1496  0068 5b04          	addw	sp,#4
1497  006a 81            	ret	
1552                     ; 514 void TIM2_Cmd(FunctionalState NewState)
1552                     ; 515 {
1553                     .text:	section	.text,new
1554  0000               _TIM2_Cmd:
1558                     ; 517   assert_param(IS_FUNCTIONAL_STATE(NewState));
1560                     ; 520   if (NewState != DISABLE)
1562  0000 4d            	tnz	a
1563  0001 2705          	jreq	L356
1564                     ; 522     TIM2->CR1 |= TIM_CR1_CEN;
1566  0003 72105250      	bset	21072,#0
1569  0007 81            	ret	
1570  0008               L356:
1571                     ; 526     TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1573  0008 72115250      	bres	21072,#0
1574                     ; 528 }
1577  000c 81            	ret	
1613                     ; 536 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
1613                     ; 537 {
1614                     .text:	section	.text,new
1615  0000               _TIM2_CtrlPWMOutputs:
1619                     ; 539   assert_param(IS_FUNCTIONAL_STATE(NewState));
1621                     ; 543   if (NewState != DISABLE)
1623  0000 4d            	tnz	a
1624  0001 2705          	jreq	L576
1625                     ; 545     TIM2->BKR |= TIM_BKR_MOE ;
1627  0003 721e5264      	bset	21092,#7
1630  0007 81            	ret	
1631  0008               L576:
1632                     ; 549     TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1634  0008 721f5264      	bres	21092,#7
1635                     ; 551 }
1638  000c 81            	ret	
1724                     ; 566 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1724                     ; 567 {
1725                     .text:	section	.text,new
1726  0000               _TIM2_ITConfig:
1728  0000 89            	pushw	x
1729       00000000      OFST:	set	0
1732                     ; 569   assert_param(IS_TIM2_IT(TIM2_IT));
1734                     ; 570   assert_param(IS_FUNCTIONAL_STATE(NewState));
1736                     ; 572   if (NewState != DISABLE)
1738  0001 9f            	ld	a,xl
1739  0002 4d            	tnz	a
1740  0003 2706          	jreq	L147
1741                     ; 575     TIM2->IER |= (uint8_t)TIM2_IT;
1743  0005 9e            	ld	a,xh
1744  0006 ca5254        	or	a,21076
1746  0009 2006          	jra	L347
1747  000b               L147:
1748                     ; 580     TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
1750  000b 7b01          	ld	a,(OFST+1,sp)
1751  000d 43            	cpl	a
1752  000e c45254        	and	a,21076
1753  0011               L347:
1754  0011 c75254        	ld	21076,a
1755                     ; 582 }
1758  0014 85            	popw	x
1759  0015 81            	ret	
1783                     ; 589 void TIM2_InternalClockConfig(void)
1783                     ; 590 {
1784                     .text:	section	.text,new
1785  0000               _TIM2_InternalClockConfig:
1789                     ; 592   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1791  0000 c65252        	ld	a,21074
1792  0003 a4f8          	and	a,#248
1793  0005 c75252        	ld	21074,a
1794                     ; 593 }
1797  0008 81            	ret	
1914                     ; 611 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
1914                     ; 612                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
1914                     ; 613                               uint8_t TIM2_ExtTRGFilter)
1914                     ; 614 {
1915                     .text:	section	.text,new
1916  0000               _TIM2_ETRClockMode1Config:
1918  0000 89            	pushw	x
1919       00000000      OFST:	set	0
1922                     ; 616   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
1924  0001 7b05          	ld	a,(OFST+5,sp)
1925  0003 88            	push	a
1926  0004 7b02          	ld	a,(OFST+2,sp)
1927  0006 95            	ld	xh,a
1928  0007 cd0000        	call	_TIM2_ETRConfig
1930  000a 84            	pop	a
1931                     ; 619   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1933  000b c65252        	ld	a,21074
1934  000e a4f8          	and	a,#248
1935  0010 c75252        	ld	21074,a
1936                     ; 620   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
1938  0013 c65252        	ld	a,21074
1939  0016 aa07          	or	a,#7
1940  0018 c75252        	ld	21074,a
1941                     ; 623   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1943  001b c65252        	ld	a,21074
1944  001e a48f          	and	a,#143
1945  0020 c75252        	ld	21074,a
1946                     ; 624   TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
1948  0023 c65252        	ld	a,21074
1949  0026 aa70          	or	a,#112
1950  0028 c75252        	ld	21074,a
1951                     ; 625 }
1954  002b 85            	popw	x
1955  002c 81            	ret	
2013                     ; 634 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2013                     ; 635                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2013                     ; 636                               uint8_t TIM2_ExtTRGFilter)
2013                     ; 637 {
2014                     .text:	section	.text,new
2015  0000               _TIM2_ETRClockMode2Config:
2017  0000 89            	pushw	x
2018       00000000      OFST:	set	0
2021                     ; 639   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, TIM2_ExtTRGFilter);
2023  0001 7b05          	ld	a,(OFST+5,sp)
2024  0003 88            	push	a
2025  0004 7b02          	ld	a,(OFST+2,sp)
2026  0006 95            	ld	xh,a
2027  0007 cd0000        	call	_TIM2_ETRConfig
2029  000a 721c5253      	bset	21075,#6
2030                     ; 642   TIM2->ETR |= TIM_ETR_ECE ;
2032                     ; 643 }
2035  000e 5b03          	addw	sp,#3
2036  0010 81            	ret	
2092                     ; 660 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
2092                     ; 661                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
2092                     ; 662                     uint8_t TIM2_ExtTRGFilter)
2092                     ; 663 {
2093                     .text:	section	.text,new
2094  0000               _TIM2_ETRConfig:
2096  0000 89            	pushw	x
2097       00000000      OFST:	set	0
2100                     ; 665   assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
2102                     ; 666   assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
2104                     ; 667   assert_param(IS_TIM2_EXT_FILTER(TIM2_ExtTRGFilter));
2106                     ; 669   TIM2->ETR |= (uint8_t)((uint8_t)TIM2_ExtTRGPrescaler | (uint8_t)TIM2_ExtTRGPolarity | (uint8_t)TIM2_ExtTRGFilter);
2108  0001 9f            	ld	a,xl
2109  0002 1a01          	or	a,(OFST+1,sp)
2110  0004 1a05          	or	a,(OFST+5,sp)
2111  0006 ca5253        	or	a,21075
2112  0009 c75253        	ld	21075,a
2113                     ; 670 }
2116  000c 85            	popw	x
2117  000d 81            	ret	
2206                     ; 687 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
2206                     ; 688                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2206                     ; 689                                  uint8_t TIM2_ICFilter)
2206                     ; 690 {
2207                     .text:	section	.text,new
2208  0000               _TIM2_TIxExternalClockConfig:
2210  0000 89            	pushw	x
2211       00000000      OFST:	set	0
2214                     ; 692   assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
2216                     ; 693   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
2218                     ; 694   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
2220                     ; 697   if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
2222  0001 9e            	ld	a,xh
2223  0002 a160          	cp	a,#96
2224  0004 260d          	jrne	L3411
2225                     ; 699     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2227  0006 7b05          	ld	a,(OFST+5,sp)
2228  0008 88            	push	a
2229  0009 9f            	ld	a,xl
2230  000a ae0001        	ldw	x,#1
2231  000d 95            	ld	xh,a
2232  000e cd0000        	call	L5_TI2_Config
2235  0011 200c          	jra	L5411
2236  0013               L3411:
2237                     ; 703     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, TIM2_ICFilter);
2239  0013 7b05          	ld	a,(OFST+5,sp)
2240  0015 88            	push	a
2241  0016 7b03          	ld	a,(OFST+3,sp)
2242  0018 ae0001        	ldw	x,#1
2243  001b 95            	ld	xh,a
2244  001c cd0000        	call	L3_TI1_Config
2246  001f               L5411:
2247  001f 84            	pop	a
2248                     ; 707   TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
2250  0020 7b01          	ld	a,(OFST+1,sp)
2251  0022 cd0000        	call	_TIM2_SelectInputTrigger
2253                     ; 710   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
2255  0025 c65252        	ld	a,21074
2256  0028 aa07          	or	a,#7
2257  002a c75252        	ld	21074,a
2258                     ; 711 }
2261  002d 85            	popw	x
2262  002e 81            	ret	
2362                     ; 727 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
2362                     ; 728 {
2363                     .text:	section	.text,new
2364  0000               _TIM2_SelectInputTrigger:
2366  0000 88            	push	a
2367  0001 88            	push	a
2368       00000001      OFST:	set	1
2371                     ; 729   uint8_t tmpsmcr = 0;
2373                     ; 732   assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
2375                     ; 734   tmpsmcr = TIM2->SMCR;
2377  0002 c65252        	ld	a,21074
2379                     ; 737   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2381  0005 a48f          	and	a,#143
2383                     ; 738   tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
2385  0007 1a02          	or	a,(OFST+1,sp)
2387                     ; 740   TIM2->SMCR = (uint8_t)tmpsmcr;
2389  0009 c75252        	ld	21074,a
2390                     ; 741 }
2393  000c 85            	popw	x
2394  000d 81            	ret	
2430                     ; 749 void TIM2_UpdateDisableConfig(FunctionalState NewState)
2430                     ; 750 {
2431                     .text:	section	.text,new
2432  0000               _TIM2_UpdateDisableConfig:
2436                     ; 752   assert_param(IS_FUNCTIONAL_STATE(NewState));
2438                     ; 755   if (NewState != DISABLE)
2440  0000 4d            	tnz	a
2441  0001 2705          	jreq	L7221
2442                     ; 757     TIM2->CR1 |= TIM_CR1_UDIS;
2444  0003 72125250      	bset	21072,#1
2447  0007 81            	ret	
2448  0008               L7221:
2449                     ; 761     TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2451  0008 72135250      	bres	21072,#1
2452                     ; 763 }
2455  000c 81            	ret	
2513                     ; 773 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2513                     ; 774 {
2514                     .text:	section	.text,new
2515  0000               _TIM2_UpdateRequestConfig:
2519                     ; 776   assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
2521                     ; 779   if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
2523  0000 4a            	dec	a
2524  0001 2605          	jrne	L1621
2525                     ; 781     TIM2->CR1 |= TIM_CR1_URS ;
2527  0003 72145250      	bset	21072,#2
2530  0007 81            	ret	
2531  0008               L1621:
2532                     ; 785     TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
2534  0008 72155250      	bres	21072,#2
2535                     ; 787 }
2538  000c 81            	ret	
2574                     ; 795 void TIM2_SelectHallSensor(FunctionalState NewState)
2574                     ; 796 {
2575                     .text:	section	.text,new
2576  0000               _TIM2_SelectHallSensor:
2580                     ; 798   assert_param(IS_FUNCTIONAL_STATE(NewState));
2582                     ; 801   if (NewState != DISABLE)
2584  0000 4d            	tnz	a
2585  0001 2705          	jreq	L3031
2586                     ; 803     TIM2->CR2 |= TIM_CR2_TI1S;
2588  0003 721e5251      	bset	21073,#7
2591  0007 81            	ret	
2592  0008               L3031:
2593                     ; 807     TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2595  0008 721f5251      	bres	21073,#7
2596                     ; 809 }
2599  000c 81            	ret	
2656                     ; 819 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2656                     ; 820 {
2657                     .text:	section	.text,new
2658  0000               _TIM2_SelectOnePulseMode:
2662                     ; 822   assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
2664                     ; 825   if (TIM2_OPMode == TIM2_OPMode_Single)
2666  0000 4a            	dec	a
2667  0001 2605          	jrne	L5331
2668                     ; 827     TIM2->CR1 |= TIM_CR1_OPM ;
2670  0003 72165250      	bset	21072,#3
2673  0007 81            	ret	
2674  0008               L5331:
2675                     ; 831     TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2677  0008 72175250      	bres	21072,#3
2678                     ; 833 }
2681  000c 81            	ret	
2780                     ; 847 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
2780                     ; 848 {
2781                     .text:	section	.text,new
2782  0000               _TIM2_SelectOutputTrigger:
2784  0000 88            	push	a
2785  0001 88            	push	a
2786       00000001      OFST:	set	1
2789                     ; 849   uint8_t tmpcr2 = 0;
2791                     ; 852   assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
2793                     ; 854   tmpcr2 = TIM2->CR2;
2795  0002 c65251        	ld	a,21073
2797                     ; 857   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2799  0005 a48f          	and	a,#143
2801                     ; 860   tmpcr2 |= (uint8_t)TIM2_TRGOSource;
2803  0007 1a02          	or	a,(OFST+1,sp)
2805                     ; 862   TIM2->CR2 = tmpcr2;
2807  0009 c75251        	ld	21073,a
2808                     ; 863 }
2811  000c 85            	popw	x
2812  000d 81            	ret	
2895                     ; 875 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
2895                     ; 876 {
2896                     .text:	section	.text,new
2897  0000               _TIM2_SelectSlaveMode:
2899  0000 88            	push	a
2900  0001 88            	push	a
2901       00000001      OFST:	set	1
2904                     ; 877   uint8_t tmpsmcr = 0;
2906                     ; 880   assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
2908                     ; 882   tmpsmcr = TIM2->SMCR;
2910  0002 c65252        	ld	a,21074
2912                     ; 885   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2914  0005 a4f8          	and	a,#248
2916                     ; 888   tmpsmcr |= (uint8_t)TIM2_SlaveMode;
2918  0007 1a02          	or	a,(OFST+1,sp)
2920                     ; 890   TIM2->SMCR = tmpsmcr;
2922  0009 c75252        	ld	21074,a
2923                     ; 891 }
2926  000c 85            	popw	x
2927  000d 81            	ret	
2963                     ; 899 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
2963                     ; 900 {
2964                     .text:	section	.text,new
2965  0000               _TIM2_SelectMasterSlaveMode:
2969                     ; 902   assert_param(IS_FUNCTIONAL_STATE(NewState));
2971                     ; 905   if (NewState != DISABLE)
2973  0000 4d            	tnz	a
2974  0001 2705          	jreq	L7541
2975                     ; 907     TIM2->SMCR |= TIM_SMCR_MSM;
2977  0003 721e5252      	bset	21074,#7
2980  0007 81            	ret	
2981  0008               L7541:
2982                     ; 911     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
2984  0008 721f5252      	bres	21074,#7
2985                     ; 913 }
2988  000c 81            	ret	
3101                     ; 932 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
3101                     ; 933                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
3101                     ; 934                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
3101                     ; 935 {
3102                     .text:	section	.text,new
3103  0000               _TIM2_EncoderInterfaceConfig:
3105  0000 89            	pushw	x
3106  0001 5203          	subw	sp,#3
3107       00000003      OFST:	set	3
3110                     ; 936   uint8_t tmpsmcr = 0;
3112                     ; 937   uint8_t tmpccmr1 = 0;
3114                     ; 938   uint8_t tmpccmr2 = 0;
3116                     ; 941   assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
3118                     ; 942   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
3120                     ; 943   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
3122                     ; 945   tmpsmcr = TIM2->SMCR;
3124  0003 c65252        	ld	a,21074
3125  0006 6b01          	ld	(OFST-2,sp),a
3127                     ; 946   tmpccmr1 = TIM2->CCMR1;
3129  0008 c65258        	ld	a,21080
3130  000b 6b02          	ld	(OFST-1,sp),a
3132                     ; 947   tmpccmr2 = TIM2->CCMR2;
3134  000d c65259        	ld	a,21081
3135  0010 6b03          	ld	(OFST+0,sp),a
3137                     ; 950   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3139  0012 7b01          	ld	a,(OFST-2,sp)
3140  0014 a4f0          	and	a,#240
3141  0016 6b01          	ld	(OFST-2,sp),a
3143                     ; 951   tmpsmcr |= (uint8_t)TIM2_EncoderMode;
3145  0018 9e            	ld	a,xh
3146  0019 1a01          	or	a,(OFST-2,sp)
3147  001b 6b01          	ld	(OFST-2,sp),a
3149                     ; 954   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3151  001d 7b02          	ld	a,(OFST-1,sp)
3152  001f a4fc          	and	a,#252
3153  0021 6b02          	ld	(OFST-1,sp),a
3155                     ; 955   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3157  0023 7b03          	ld	a,(OFST+0,sp)
3158  0025 a4fc          	and	a,#252
3159  0027 6b03          	ld	(OFST+0,sp),a
3161                     ; 956   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3163  0029 7b02          	ld	a,(OFST-1,sp)
3164  002b aa01          	or	a,#1
3165  002d 6b02          	ld	(OFST-1,sp),a
3167                     ; 957   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3169  002f 7b03          	ld	a,(OFST+0,sp)
3170  0031 aa01          	or	a,#1
3171  0033 6b03          	ld	(OFST+0,sp),a
3173                     ; 960   if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
3175  0035 9f            	ld	a,xl
3176  0036 4a            	dec	a
3177  0037 2606          	jrne	L7351
3178                     ; 962     TIM2->CCER1 |= TIM_CCER1_CC1P ;
3180  0039 7212525a      	bset	21082,#1
3182  003d 2004          	jra	L1451
3183  003f               L7351:
3184                     ; 966     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3186  003f 7213525a      	bres	21082,#1
3187  0043               L1451:
3188                     ; 969   if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
3190  0043 7b08          	ld	a,(OFST+5,sp)
3191  0045 4a            	dec	a
3192  0046 2606          	jrne	L3451
3193                     ; 971     TIM2->CCER1 |= TIM_CCER1_CC2P ;
3195  0048 721a525a      	bset	21082,#5
3197  004c 2004          	jra	L5451
3198  004e               L3451:
3199                     ; 975     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3201  004e 721b525a      	bres	21082,#5
3202  0052               L5451:
3203                     ; 978   TIM2->SMCR = tmpsmcr;
3205  0052 7b01          	ld	a,(OFST-2,sp)
3206  0054 c75252        	ld	21074,a
3207                     ; 979   TIM2->CCMR1 = tmpccmr1;
3209  0057 7b02          	ld	a,(OFST-1,sp)
3210  0059 c75258        	ld	21080,a
3211                     ; 980   TIM2->CCMR2 = tmpccmr2;
3213  005c 7b03          	ld	a,(OFST+0,sp)
3214  005e c75259        	ld	21081,a
3215                     ; 981 }
3218  0061 5b05          	addw	sp,#5
3219  0063 81            	ret	
3287                     ; 1001 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef TIM2_Prescaler,
3287                     ; 1002                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
3287                     ; 1003 {
3288                     .text:	section	.text,new
3289  0000               _TIM2_PrescalerConfig:
3293                     ; 1005   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
3295                     ; 1006   assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
3297                     ; 1009   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
3299  0000 9e            	ld	a,xh
3300  0001 c7525d        	ld	21085,a
3301                     ; 1012   if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
3303  0004 9f            	ld	a,xl
3304  0005 4a            	dec	a
3305  0006 2605          	jrne	L1061
3306                     ; 1014     TIM2->EGR |= TIM_EGR_UG ;
3308  0008 72105257      	bset	21079,#0
3311  000c 81            	ret	
3312  000d               L1061:
3313                     ; 1018     TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3315  000d 72115257      	bres	21079,#0
3316                     ; 1020 }
3319  0011 81            	ret	
3364                     ; 1033 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
3364                     ; 1034 {
3365                     .text:	section	.text,new
3366  0000               _TIM2_CounterModeConfig:
3368  0000 88            	push	a
3369  0001 88            	push	a
3370       00000001      OFST:	set	1
3373                     ; 1035   uint8_t tmpcr1 = 0;
3375                     ; 1038   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
3377                     ; 1040   tmpcr1 = TIM2->CR1;
3379  0002 c65250        	ld	a,21072
3381                     ; 1043   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3383  0005 a48f          	and	a,#143
3385                     ; 1046   tmpcr1 |= (uint8_t)TIM2_CounterMode;
3387  0007 1a02          	or	a,(OFST+1,sp)
3389                     ; 1048   TIM2->CR1 = tmpcr1;
3391  0009 c75250        	ld	21072,a
3392                     ; 1049 }
3395  000c 85            	popw	x
3396  000d 81            	ret	
3463                     ; 1059 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3463                     ; 1060 {
3464                     .text:	section	.text,new
3465  0000               _TIM2_ForcedOC1Config:
3467  0000 88            	push	a
3468  0001 88            	push	a
3469       00000001      OFST:	set	1
3472                     ; 1061   uint8_t tmpccmr1 = 0;
3474                     ; 1064   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3476                     ; 1066   tmpccmr1 = TIM2->CCMR1;
3478  0002 c65258        	ld	a,21080
3480                     ; 1069   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3482  0005 a48f          	and	a,#143
3484                     ; 1072   tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
3486  0007 1a02          	or	a,(OFST+1,sp)
3488                     ; 1074   TIM2->CCMR1 = tmpccmr1;
3490  0009 c75258        	ld	21080,a
3491                     ; 1075 }
3494  000c 85            	popw	x
3495  000d 81            	ret	
3540                     ; 1085 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
3540                     ; 1086 {
3541                     .text:	section	.text,new
3542  0000               _TIM2_ForcedOC2Config:
3544  0000 88            	push	a
3545  0001 88            	push	a
3546       00000001      OFST:	set	1
3549                     ; 1087   uint8_t tmpccmr2 = 0;
3551                     ; 1090   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
3553                     ; 1092   tmpccmr2 = TIM2->CCMR2;
3555  0002 c65259        	ld	a,21081
3557                     ; 1095   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3559  0005 a48f          	and	a,#143
3561                     ; 1098   tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
3563  0007 1a02          	or	a,(OFST+1,sp)
3565                     ; 1100   TIM2->CCMR2 = tmpccmr2;
3567  0009 c75259        	ld	21081,a
3568                     ; 1101 }
3571  000c 85            	popw	x
3572  000d 81            	ret	
3608                     ; 1109 void TIM2_ARRPreloadConfig(FunctionalState NewState)
3608                     ; 1110 {
3609                     .text:	section	.text,new
3610  0000               _TIM2_ARRPreloadConfig:
3614                     ; 1112   assert_param(IS_FUNCTIONAL_STATE(NewState));
3616                     ; 1115   if (NewState != DISABLE)
3618  0000 4d            	tnz	a
3619  0001 2705          	jreq	L1271
3620                     ; 1117     TIM2->CR1 |= TIM_CR1_ARPE;
3622  0003 721e5250      	bset	21072,#7
3625  0007 81            	ret	
3626  0008               L1271:
3627                     ; 1121     TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3629  0008 721f5250      	bres	21072,#7
3630                     ; 1123 }
3633  000c 81            	ret	
3669                     ; 1131 void TIM2_OC1PreloadConfig(FunctionalState NewState)
3669                     ; 1132 {
3670                     .text:	section	.text,new
3671  0000               _TIM2_OC1PreloadConfig:
3675                     ; 1134   assert_param(IS_FUNCTIONAL_STATE(NewState));
3677                     ; 1137   if (NewState != DISABLE)
3679  0000 4d            	tnz	a
3680  0001 2705          	jreq	L3471
3681                     ; 1139     TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
3683  0003 72165258      	bset	21080,#3
3686  0007 81            	ret	
3687  0008               L3471:
3688                     ; 1143     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3690  0008 72175258      	bres	21080,#3
3691                     ; 1145 }
3694  000c 81            	ret	
3730                     ; 1153 void TIM2_OC2PreloadConfig(FunctionalState NewState)
3730                     ; 1154 {
3731                     .text:	section	.text,new
3732  0000               _TIM2_OC2PreloadConfig:
3736                     ; 1156   assert_param(IS_FUNCTIONAL_STATE(NewState));
3738                     ; 1159   if (NewState != DISABLE)
3740  0000 4d            	tnz	a
3741  0001 2705          	jreq	L5671
3742                     ; 1161     TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
3744  0003 72165259      	bset	21081,#3
3747  0007 81            	ret	
3748  0008               L5671:
3749                     ; 1165     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3751  0008 72175259      	bres	21081,#3
3752                     ; 1167 }
3755  000c 81            	ret	
3790                     ; 1174 void TIM2_OC1FastCmd(FunctionalState NewState)
3790                     ; 1175 {
3791                     .text:	section	.text,new
3792  0000               _TIM2_OC1FastCmd:
3796                     ; 1177   assert_param(IS_FUNCTIONAL_STATE(NewState));
3798                     ; 1180   if (NewState != DISABLE)
3800  0000 4d            	tnz	a
3801  0001 2705          	jreq	L7002
3802                     ; 1182     TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
3804  0003 72145258      	bset	21080,#2
3807  0007 81            	ret	
3808  0008               L7002:
3809                     ; 1186     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3811  0008 72155258      	bres	21080,#2
3812                     ; 1188 }
3815  000c 81            	ret	
3850                     ; 1195 void TIM2_OC2FastCmd(FunctionalState NewState)
3850                     ; 1196 {
3851                     .text:	section	.text,new
3852  0000               _TIM2_OC2FastCmd:
3856                     ; 1198   assert_param(IS_FUNCTIONAL_STATE(NewState));
3858                     ; 1201   if (NewState != DISABLE)
3860  0000 4d            	tnz	a
3861  0001 2705          	jreq	L1302
3862                     ; 1203     TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
3864  0003 72145259      	bset	21081,#2
3867  0007 81            	ret	
3868  0008               L1302:
3869                     ; 1207     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3871  0008 72155259      	bres	21081,#2
3872                     ; 1209 }
3875  000c 81            	ret	
3956                     ; 1222 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
3956                     ; 1223 {
3957                     .text:	section	.text,new
3958  0000               _TIM2_GenerateEvent:
3962                     ; 1225   assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
3964                     ; 1228   TIM2->EGR |= (uint8_t)TIM2_EventSource;
3966  0000 ca5257        	or	a,21079
3967  0003 c75257        	ld	21079,a
3968                     ; 1229 }
3971  0006 81            	ret	
4007                     ; 1239 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4007                     ; 1240 {
4008                     .text:	section	.text,new
4009  0000               _TIM2_OC1PolarityConfig:
4013                     ; 1242   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4015                     ; 1245   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4017  0000 4a            	dec	a
4018  0001 2605          	jrne	L7012
4019                     ; 1247     TIM2->CCER1 |= TIM_CCER1_CC1P ;
4021  0003 7212525a      	bset	21082,#1
4024  0007 81            	ret	
4025  0008               L7012:
4026                     ; 1251     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
4028  0008 7213525a      	bres	21082,#1
4029                     ; 1253 }
4032  000c 81            	ret	
4068                     ; 1263 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
4068                     ; 1264 {
4069                     .text:	section	.text,new
4070  0000               _TIM2_OC2PolarityConfig:
4074                     ; 1266   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
4076                     ; 1269   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
4078  0000 4a            	dec	a
4079  0001 2605          	jrne	L1312
4080                     ; 1271     TIM2->CCER1 |= TIM_CCER1_CC2P ;
4082  0003 721a525a      	bset	21082,#5
4085  0007 81            	ret	
4086  0008               L1312:
4087                     ; 1275     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4089  0008 721b525a      	bres	21082,#5
4090                     ; 1277 }
4093  000c 81            	ret	
4138                     ; 1289 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
4138                     ; 1290                  FunctionalState NewState)
4138                     ; 1291 {
4139                     .text:	section	.text,new
4140  0000               _TIM2_CCxCmd:
4142  0000 89            	pushw	x
4143       00000000      OFST:	set	0
4146                     ; 1293   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4148                     ; 1294   assert_param(IS_FUNCTIONAL_STATE(NewState));
4150                     ; 1296   if (TIM2_Channel == TIM2_Channel_1)
4152  0001 9e            	ld	a,xh
4153  0002 4d            	tnz	a
4154  0003 2610          	jrne	L7512
4155                     ; 1299     if (NewState != DISABLE)
4157  0005 9f            	ld	a,xl
4158  0006 4d            	tnz	a
4159  0007 2706          	jreq	L1612
4160                     ; 1301       TIM2->CCER1 |= TIM_CCER1_CC1E ;
4162  0009 7210525a      	bset	21082,#0
4164  000d 2014          	jra	L5612
4165  000f               L1612:
4166                     ; 1305       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4168  000f 7211525a      	bres	21082,#0
4169  0013 200e          	jra	L5612
4170  0015               L7512:
4171                     ; 1312     if (NewState != DISABLE)
4173  0015 7b02          	ld	a,(OFST+2,sp)
4174  0017 2706          	jreq	L7612
4175                     ; 1314       TIM2->CCER1 |= TIM_CCER1_CC2E;
4177  0019 7218525a      	bset	21082,#4
4179  001d 2004          	jra	L5612
4180  001f               L7612:
4181                     ; 1318       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4183  001f 7219525a      	bres	21082,#4
4184  0023               L5612:
4185                     ; 1322 }
4188  0023 85            	popw	x
4189  0024 81            	ret	
4234                     ; 1342 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
4234                     ; 1343                      TIM2_OCMode_TypeDef TIM2_OCMode)
4234                     ; 1344 {
4235                     .text:	section	.text,new
4236  0000               _TIM2_SelectOCxM:
4238  0000 89            	pushw	x
4239       00000000      OFST:	set	0
4242                     ; 1346   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
4244                     ; 1347   assert_param(IS_TIM2_OCM(TIM2_OCMode));
4246                     ; 1349   if (TIM2_Channel == TIM2_Channel_1)
4248  0001 9e            	ld	a,xh
4249  0002 4d            	tnz	a
4250  0003 2615          	jrne	L5122
4251                     ; 1352     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4253  0005 7211525a      	bres	21082,#0
4254                     ; 1355     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4256  0009 c65258        	ld	a,21080
4257  000c a48f          	and	a,#143
4258  000e c75258        	ld	21080,a
4259                     ; 1358     TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
4261  0011 9f            	ld	a,xl
4262  0012 ca5258        	or	a,21080
4263  0015 c75258        	ld	21080,a
4265  0018 2014          	jra	L7122
4266  001a               L5122:
4267                     ; 1363     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4269  001a 7219525a      	bres	21082,#4
4270                     ; 1366     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4272  001e c65259        	ld	a,21081
4273  0021 a48f          	and	a,#143
4274  0023 c75259        	ld	21081,a
4275                     ; 1369     TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
4277  0026 c65259        	ld	a,21081
4278  0029 1a02          	or	a,(OFST+2,sp)
4279  002b c75259        	ld	21081,a
4280  002e               L7122:
4281                     ; 1371 }
4284  002e 85            	popw	x
4285  002f 81            	ret	
4319                     ; 1379 void TIM2_SetCounter(uint16_t TIM2_Counter)
4319                     ; 1380 {
4320                     .text:	section	.text,new
4321  0000               _TIM2_SetCounter:
4325                     ; 1383   TIM2->CNTRH = (uint8_t)(TIM2_Counter >> 8);
4327  0000 9e            	ld	a,xh
4328  0001 c7525b        	ld	21083,a
4329                     ; 1384   TIM2->CNTRL = (uint8_t)(TIM2_Counter);
4331  0004 9f            	ld	a,xl
4332  0005 c7525c        	ld	21084,a
4333                     ; 1385 }
4336  0008 81            	ret	
4370                     ; 1393 void TIM2_SetAutoreload(uint16_t TIM2_Autoreload)
4370                     ; 1394 {
4371                     .text:	section	.text,new
4372  0000               _TIM2_SetAutoreload:
4376                     ; 1396   TIM2->ARRH = (uint8_t)(TIM2_Autoreload >> 8);
4378  0000 9e            	ld	a,xh
4379  0001 c7525e        	ld	21086,a
4380                     ; 1397   TIM2->ARRL = (uint8_t)(TIM2_Autoreload);
4382  0004 9f            	ld	a,xl
4383  0005 c7525f        	ld	21087,a
4384                     ; 1398 }
4387  0008 81            	ret	
4421                     ; 1406 void TIM2_SetCompare1(uint16_t TIM2_Compare)
4421                     ; 1407 {
4422                     .text:	section	.text,new
4423  0000               _TIM2_SetCompare1:
4427                     ; 1409   TIM2->CCR1H = (uint8_t)(TIM2_Compare >> 8);
4429  0000 9e            	ld	a,xh
4430  0001 c75260        	ld	21088,a
4431                     ; 1410   TIM2->CCR1L = (uint8_t)(TIM2_Compare);
4433  0004 9f            	ld	a,xl
4434  0005 c75261        	ld	21089,a
4435                     ; 1411 }
4438  0008 81            	ret	
4472                     ; 1419 void TIM2_SetCompare2(uint16_t TIM2_Compare)
4472                     ; 1420 {
4473                     .text:	section	.text,new
4474  0000               _TIM2_SetCompare2:
4478                     ; 1422   TIM2->CCR2H = (uint8_t)(TIM2_Compare >> 8);
4480  0000 9e            	ld	a,xh
4481  0001 c75262        	ld	21090,a
4482                     ; 1423   TIM2->CCR2L = (uint8_t)(TIM2_Compare);
4484  0004 9f            	ld	a,xl
4485  0005 c75263        	ld	21091,a
4486                     ; 1424 }
4489  0008 81            	ret	
4534                     ; 1436 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
4534                     ; 1437 {
4535                     .text:	section	.text,new
4536  0000               _TIM2_SetIC1Prescaler:
4538  0000 88            	push	a
4539  0001 88            	push	a
4540       00000001      OFST:	set	1
4543                     ; 1438   uint8_t tmpccmr1 = 0;
4545                     ; 1441   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
4547                     ; 1443   tmpccmr1 = TIM2->CCMR1;
4549  0002 c65258        	ld	a,21080
4551                     ; 1446   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4553  0005 a4f3          	and	a,#243
4555                     ; 1449   tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
4557  0007 1a02          	or	a,(OFST+1,sp)
4559                     ; 1451   TIM2->CCMR1 = tmpccmr1;
4561  0009 c75258        	ld	21080,a
4562                     ; 1452 }
4565  000c 85            	popw	x
4566  000d 81            	ret	
4611                     ; 1464 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
4611                     ; 1465 {
4612                     .text:	section	.text,new
4613  0000               _TIM2_SetIC2Prescaler:
4615  0000 88            	push	a
4616  0001 88            	push	a
4617       00000001      OFST:	set	1
4620                     ; 1466   uint8_t tmpccmr2 = 0;
4622                     ; 1469   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
4624                     ; 1471   tmpccmr2 = TIM2->CCMR2;
4626  0002 c65259        	ld	a,21081
4628                     ; 1474   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4630  0005 a4f3          	and	a,#243
4632                     ; 1477   tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
4634  0007 1a02          	or	a,(OFST+1,sp)
4636                     ; 1479   TIM2->CCMR2 = tmpccmr2;
4638  0009 c75259        	ld	21081,a
4639                     ; 1480 }
4642  000c 85            	popw	x
4643  000d 81            	ret	
4695                     ; 1487 uint16_t TIM2_GetCapture1(void)
4695                     ; 1488 {
4696                     .text:	section	.text,new
4697  0000               _TIM2_GetCapture1:
4699  0000 5204          	subw	sp,#4
4700       00000004      OFST:	set	4
4703                     ; 1489   uint16_t tmpccr1 = 0;
4705                     ; 1492   tmpccr1h = TIM2->CCR1H;
4707  0002 c65260        	ld	a,21088
4708  0005 6b02          	ld	(OFST-2,sp),a
4710                     ; 1493   tmpccr1l = TIM2->CCR1L;
4712  0007 c65261        	ld	a,21089
4713  000a 6b01          	ld	(OFST-3,sp),a
4715                     ; 1495   tmpccr1 = (uint16_t)(tmpccr1l);
4717  000c 5f            	clrw	x
4718  000d 97            	ld	xl,a
4719  000e 1f03          	ldw	(OFST-1,sp),x
4721                     ; 1496   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4723  0010 5f            	clrw	x
4724  0011 7b02          	ld	a,(OFST-2,sp)
4725  0013 97            	ld	xl,a
4726  0014 7b04          	ld	a,(OFST+0,sp)
4727  0016 01            	rrwa	x,a
4728  0017 1a03          	or	a,(OFST-1,sp)
4729  0019 01            	rrwa	x,a
4731                     ; 1498   return ((uint16_t)tmpccr1);
4735  001a 5b04          	addw	sp,#4
4736  001c 81            	ret	
4788                     ; 1506 uint16_t TIM2_GetCapture2(void)
4788                     ; 1507 {
4789                     .text:	section	.text,new
4790  0000               _TIM2_GetCapture2:
4792  0000 5204          	subw	sp,#4
4793       00000004      OFST:	set	4
4796                     ; 1508   uint16_t tmpccr2 = 0;
4798                     ; 1511   tmpccr2h = TIM2->CCR2H;
4800  0002 c65262        	ld	a,21090
4801  0005 6b02          	ld	(OFST-2,sp),a
4803                     ; 1512   tmpccr2l = TIM2->CCR2L;
4805  0007 c65263        	ld	a,21091
4806  000a 6b01          	ld	(OFST-3,sp),a
4808                     ; 1514   tmpccr2 = (uint16_t)(tmpccr2l);
4810  000c 5f            	clrw	x
4811  000d 97            	ld	xl,a
4812  000e 1f03          	ldw	(OFST-1,sp),x
4814                     ; 1515   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4816  0010 5f            	clrw	x
4817  0011 7b02          	ld	a,(OFST-2,sp)
4818  0013 97            	ld	xl,a
4819  0014 7b04          	ld	a,(OFST+0,sp)
4820  0016 01            	rrwa	x,a
4821  0017 1a03          	or	a,(OFST-1,sp)
4822  0019 01            	rrwa	x,a
4824                     ; 1517   return ((uint16_t)tmpccr2);
4828  001a 5b04          	addw	sp,#4
4829  001c 81            	ret	
4881                     ; 1525 uint16_t TIM2_GetCounter(void)
4881                     ; 1526 {
4882                     .text:	section	.text,new
4883  0000               _TIM2_GetCounter:
4885  0000 5204          	subw	sp,#4
4886       00000004      OFST:	set	4
4889                     ; 1527   uint16_t tmpcnt = 0;
4891                     ; 1530   tmpcntrh = TIM2->CNTRH;
4893  0002 c6525b        	ld	a,21083
4894  0005 6b02          	ld	(OFST-2,sp),a
4896                     ; 1531   tmpcntrl = TIM2->CNTRL;
4898  0007 c6525c        	ld	a,21084
4899  000a 6b01          	ld	(OFST-3,sp),a
4901                     ; 1533   tmpcnt = (uint16_t)(tmpcntrl);
4903  000c 5f            	clrw	x
4904  000d 97            	ld	xl,a
4905  000e 1f03          	ldw	(OFST-1,sp),x
4907                     ; 1534   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
4909  0010 5f            	clrw	x
4910  0011 7b02          	ld	a,(OFST-2,sp)
4911  0013 97            	ld	xl,a
4912  0014 7b04          	ld	a,(OFST+0,sp)
4913  0016 01            	rrwa	x,a
4914  0017 1a03          	or	a,(OFST-1,sp)
4915  0019 01            	rrwa	x,a
4917                     ; 1536   return ((uint16_t)tmpcnt);
4921  001a 5b04          	addw	sp,#4
4922  001c 81            	ret	
4946                     ; 1544 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4946                     ; 1545 {
4947                     .text:	section	.text,new
4948  0000               _TIM2_GetPrescaler:
4952                     ; 1547   return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
4954  0000 c6525d        	ld	a,21085
4957  0003 81            	ret	
5096                     ; 1563 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
5096                     ; 1564 {
5097                     .text:	section	.text,new
5098  0000               _TIM2_GetFlagStatus:
5100  0000 89            	pushw	x
5101  0001 89            	pushw	x
5102       00000002      OFST:	set	2
5105                     ; 1565   FlagStatus bitstatus = RESET;
5107                     ; 1569   assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
5109                     ; 1571   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)(TIM2_FLAG));
5111  0002 9f            	ld	a,xl
5112  0003 c45255        	and	a,21077
5113  0006 6b01          	ld	(OFST-1,sp),a
5115                     ; 1572   tim2_flag_h = (uint8_t)(TIM2->SR2 & (uint8_t)((uint16_t)TIM2_FLAG >> 8));
5117  0008 c65256        	ld	a,21078
5118  000b 1403          	and	a,(OFST+1,sp)
5119  000d 6b02          	ld	(OFST+0,sp),a
5121                     ; 1574   if ((uint8_t)(tim2_flag_l | tim2_flag_h) != 0)
5123  000f 1a01          	or	a,(OFST-1,sp)
5124  0011 2702          	jreq	L3552
5125                     ; 1576     bitstatus = SET;
5127  0013 a601          	ld	a,#1
5130  0015               L3552:
5131                     ; 1580     bitstatus = RESET;
5134                     ; 1582   return ((FlagStatus)bitstatus);
5138  0015 5b04          	addw	sp,#4
5139  0017 81            	ret	
5174                     ; 1596 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
5174                     ; 1597 {
5175                     .text:	section	.text,new
5176  0000               _TIM2_ClearFlag:
5178  0000 89            	pushw	x
5179       00000000      OFST:	set	0
5182                     ; 1599   assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
5184                     ; 1601   TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
5186  0001 9f            	ld	a,xl
5187  0002 43            	cpl	a
5188  0003 c75255        	ld	21077,a
5189                     ; 1602   TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
5191  0006 7b01          	ld	a,(OFST+1,sp)
5192  0008 43            	cpl	a
5193  0009 c75256        	ld	21078,a
5194                     ; 1603 }
5197  000c 85            	popw	x
5198  000d 81            	ret	
5262                     ; 1616 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
5262                     ; 1617 {
5263                     .text:	section	.text,new
5264  0000               _TIM2_GetITStatus:
5266  0000 88            	push	a
5267  0001 5203          	subw	sp,#3
5268       00000003      OFST:	set	3
5271                     ; 1618   __IO ITStatus bitstatus = RESET;
5273  0003 0f03          	clr	(OFST+0,sp)
5275                     ; 1620   __IO uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
5277  0005 0f01          	clr	(OFST-2,sp)
5281  0007 0f02          	clr	(OFST-1,sp)
5283                     ; 1623   assert_param(IS_TIM2_GET_IT(TIM2_IT));
5285                     ; 1625   TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
5287  0009 c45255        	and	a,21077
5288  000c 6b01          	ld	(OFST-2,sp),a
5290                     ; 1627   TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
5292  000e c65254        	ld	a,21076
5293  0011 1404          	and	a,(OFST+1,sp)
5294  0013 6b02          	ld	(OFST-1,sp),a
5296                     ; 1629   if ((TIM2_itStatus != (uint8_t)RESET) && (TIM2_itEnable != (uint8_t)RESET))
5298  0015 0d01          	tnz	(OFST-2,sp)
5299  0017 270a          	jreq	L7262
5301  0019 0d02          	tnz	(OFST-1,sp)
5302  001b 2706          	jreq	L7262
5303                     ; 1631     bitstatus = (ITStatus)SET;
5305  001d a601          	ld	a,#1
5306  001f 6b03          	ld	(OFST+0,sp),a
5309  0021 2002          	jra	L1362
5310  0023               L7262:
5311                     ; 1635     bitstatus = (ITStatus)RESET;
5313  0023 0f03          	clr	(OFST+0,sp)
5315  0025               L1362:
5316                     ; 1637   return ((ITStatus)bitstatus);
5318  0025 7b03          	ld	a,(OFST+0,sp)
5321  0027 5b04          	addw	sp,#4
5322  0029 81            	ret	
5358                     ; 1651 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
5358                     ; 1652 {
5359                     .text:	section	.text,new
5360  0000               _TIM2_ClearITPendingBit:
5364                     ; 1654   assert_param(IS_TIM2_IT(TIM2_IT));
5366                     ; 1657   TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
5368  0000 43            	cpl	a
5369  0001 c75255        	ld	21077,a
5370                     ; 1658 }
5373  0004 81            	ret	
5445                     ; 1675 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \
5445                     ; 1676                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \
5445                     ; 1677                        uint8_t TIM2_ICFilter)
5445                     ; 1678 {
5446                     .text:	section	.text,new
5447  0000               L3_TI1_Config:
5449  0000 89            	pushw	x
5450  0001 89            	pushw	x
5451       00000002      OFST:	set	2
5454                     ; 1679   uint8_t tmpccmr1 = 0;
5456                     ; 1680   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5458  0002 9e            	ld	a,xh
5459  0003 6b01          	ld	(OFST-1,sp),a
5461                     ; 1681   tmpccmr1 = TIM2->CCMR1;
5463  0005 c65258        	ld	a,21080
5464  0008 6b02          	ld	(OFST+0,sp),a
5466                     ; 1684   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5468                     ; 1685   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5470                     ; 1686   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5472                     ; 1689   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5474  000a 7211525a      	bres	21082,#0
5475                     ; 1692   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5477  000e a40c          	and	a,#12
5478  0010 6b02          	ld	(OFST+0,sp),a
5480                     ; 1693   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5482  0012 7b07          	ld	a,(OFST+5,sp)
5483  0014 97            	ld	xl,a
5484  0015 a610          	ld	a,#16
5485  0017 42            	mul	x,a
5486  0018 9f            	ld	a,xl
5487  0019 1a04          	or	a,(OFST+2,sp)
5488  001b 1a02          	or	a,(OFST+0,sp)
5489  001d 6b02          	ld	(OFST+0,sp),a
5491                     ; 1695   TIM2->CCMR1 = tmpccmr1;
5493  001f c75258        	ld	21080,a
5494                     ; 1698   if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
5496  0022 7b01          	ld	a,(OFST-1,sp)
5497  0024 4a            	dec	a
5498  0025 2606          	jrne	L7072
5499                     ; 1700     TIM2->CCER1 |= TIM_CCER1_CC1P;
5501  0027 7212525a      	bset	21082,#1
5503  002b 2004          	jra	L1172
5504  002d               L7072:
5505                     ; 1704     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5507  002d 7213525a      	bres	21082,#1
5508  0031               L1172:
5509                     ; 1708   TIM2->CCER1 |=  TIM_CCER1_CC1E;
5511  0031 7210525a      	bset	21082,#0
5512                     ; 1709 }
5515  0035 5b04          	addw	sp,#4
5516  0037 81            	ret	
5588                     ; 1726 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
5588                     ; 1727                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
5588                     ; 1728                        uint8_t TIM2_ICFilter)
5588                     ; 1729 {
5589                     .text:	section	.text,new
5590  0000               L5_TI2_Config:
5592  0000 89            	pushw	x
5593  0001 89            	pushw	x
5594       00000002      OFST:	set	2
5597                     ; 1730   uint8_t tmpccmr2 = 0;
5599                     ; 1731   uint8_t tmpicpolarity = (uint8_t)TIM2_ICPolarity;
5601  0002 9e            	ld	a,xh
5602  0003 6b01          	ld	(OFST-1,sp),a
5604                     ; 1734   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5606                     ; 1735   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5608                     ; 1736   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5610                     ; 1738   tmpccmr2 = TIM2->CCMR2;
5612  0005 c65259        	ld	a,21081
5613  0008 6b02          	ld	(OFST+0,sp),a
5615                     ; 1741   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
5617  000a 7219525a      	bres	21082,#4
5618                     ; 1744   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5620  000e a40c          	and	a,#12
5621  0010 6b02          	ld	(OFST+0,sp),a
5623                     ; 1745   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5625  0012 7b07          	ld	a,(OFST+5,sp)
5626  0014 97            	ld	xl,a
5627  0015 a610          	ld	a,#16
5628  0017 42            	mul	x,a
5629  0018 9f            	ld	a,xl
5630  0019 1a04          	or	a,(OFST+2,sp)
5631  001b 1a02          	or	a,(OFST+0,sp)
5632  001d 6b02          	ld	(OFST+0,sp),a
5634                     ; 1747   TIM2->CCMR2 = tmpccmr2;
5636  001f c75259        	ld	21081,a
5637                     ; 1750   if (tmpicpolarity == (uint8_t)TIM2_ICPolarity_Falling)
5639  0022 7b01          	ld	a,(OFST-1,sp)
5640  0024 4a            	dec	a
5641  0025 2606          	jrne	L1572
5642                     ; 1752     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5644  0027 721a525a      	bset	21082,#5
5646  002b 2004          	jra	L3572
5647  002d               L1572:
5648                     ; 1756     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5650  002d 721b525a      	bres	21082,#5
5651  0031               L3572:
5652                     ; 1760   TIM2->CCER1 |=  TIM_CCER1_CC2E;
5654  0031 7218525a      	bset	21082,#4
5655                     ; 1761 }
5658  0035 5b04          	addw	sp,#4
5659  0037 81            	ret	
5727                     ; 1771 uint32_t TIM2_ComputeLsiClockFreq(uint32_t TIM2_TimerClockFreq)
5727                     ; 1772 {
5728                     .text:	section	.text,new
5729  0000               _TIM2_ComputeLsiClockFreq:
5731  0000 520c          	subw	sp,#12
5732       0000000c      OFST:	set	12
5735                     ; 1777   TIM2_ICInit(TIM2_Channel_1, TIM2_ICPolarity_Rising, TIM2_ICSelection_DirectTI, TIM2_ICPSC_Div8, 0x0);
5737  0002 4b00          	push	#0
5738  0004 4b0c          	push	#12
5739  0006 4b01          	push	#1
5740  0008 5f            	clrw	x
5741  0009 cd0000        	call	_TIM2_ICInit
5743  000c 5b03          	addw	sp,#3
5744                     ; 1780   TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
5746  000e ae0201        	ldw	x,#513
5747  0011 cd0000        	call	_TIM2_ITConfig
5749                     ; 1783   TIM2_Cmd(ENABLE);
5751  0014 a601          	ld	a,#1
5752  0016 cd0000        	call	_TIM2_Cmd
5754                     ; 1785   TIM2->SR1 = 0x00;
5756  0019 725f5255      	clr	21077
5757                     ; 1786   TIM2->SR2 = 0x00;
5759  001d 725f5256      	clr	21078
5760                     ; 1789   TIM2_ClearFlag(TIM2_FLAG_CC1);
5762  0021 ae0002        	ldw	x,#2
5763  0024 cd0000        	call	_TIM2_ClearFlag
5766  0027               L1103:
5767                     ; 1792   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
5769  0027 72035255fb    	btjf	21077,#1,L1103
5770                     ; 1795   ICValue1 = TIM2_GetCapture1();
5772  002c cd0000        	call	_TIM2_GetCapture1
5774  002f 1f09          	ldw	(OFST-3,sp),x
5776                     ; 1796   TIM2_ClearFlag(TIM2_FLAG_CC1);
5778  0031 ae0002        	ldw	x,#2
5779  0034 cd0000        	call	_TIM2_ClearFlag
5782  0037               L7103:
5783                     ; 1799   while ((TIM2->SR1 & (uint8_t)TIM2_FLAG_CC1) != (uint8_t)TIM2_FLAG_CC1)
5785  0037 72035255fb    	btjf	21077,#1,L7103
5786                     ; 1802   ICValue2 = TIM2_GetCapture1();
5788  003c cd0000        	call	_TIM2_GetCapture1
5790  003f 1f0b          	ldw	(OFST-1,sp),x
5792                     ; 1803   TIM2_ClearFlag(TIM2_FLAG_CC1);
5794  0041 ae0002        	ldw	x,#2
5795  0044 cd0000        	call	_TIM2_ClearFlag
5797                     ; 1806   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5799  0047 7211525a      	bres	21082,#0
5800                     ; 1808   TIM2->CCMR1 = 0x00;
5802  004b 725f5258      	clr	21080
5803                     ; 1810   TIM2_Cmd(DISABLE);
5805  004f 4f            	clr	a
5806  0050 cd0000        	call	_TIM2_Cmd
5808                     ; 1813   LSIClockFreq = (8 * TIM2_TimerClockFreq) / (ICValue2 - ICValue1);
5810  0053 1e0b          	ldw	x,(OFST-1,sp)
5811  0055 72f009        	subw	x,(OFST-3,sp)
5812  0058 cd0000        	call	c_uitolx
5814  005b 96            	ldw	x,sp
5815  005c 5c            	incw	x
5816  005d cd0000        	call	c_rtol
5819  0060 96            	ldw	x,sp
5820  0061 1c000f        	addw	x,#OFST+3
5821  0064 cd0000        	call	c_ltor
5823  0067 a603          	ld	a,#3
5824  0069 cd0000        	call	c_llsh
5826  006c 96            	ldw	x,sp
5827  006d 5c            	incw	x
5828  006e cd0000        	call	c_ludv
5830  0071 96            	ldw	x,sp
5831  0072 1c0005        	addw	x,#OFST-7
5832  0075 cd0000        	call	c_rtol
5835                     ; 1814   return LSIClockFreq;
5837  0078 96            	ldw	x,sp
5838  0079 1c0005        	addw	x,#OFST-7
5839  007c cd0000        	call	c_ltor
5843  007f 5b0c          	addw	sp,#12
5844  0081 81            	ret	
5868                     ; 1822 FunctionalState TIM2_GetStatus(void)
5868                     ; 1823 {
5869                     .text:	section	.text,new
5870  0000               _TIM2_GetStatus:
5874                     ; 1824   return ((FunctionalState)(TIM2->CR1 & TIM_CR1_CEN));
5876  0000 c65250        	ld	a,21072
5877  0003 a401          	and	a,#1
5880  0005 81            	ret	
5893                     	xdef	_TIM2_GetStatus
5894                     	xdef	_TIM2_ComputeLsiClockFreq
5895                     	xdef	_TIM2_ClearITPendingBit
5896                     	xdef	_TIM2_GetITStatus
5897                     	xdef	_TIM2_ClearFlag
5898                     	xdef	_TIM2_GetFlagStatus
5899                     	xdef	_TIM2_GetPrescaler
5900                     	xdef	_TIM2_GetCounter
5901                     	xdef	_TIM2_GetCapture2
5902                     	xdef	_TIM2_GetCapture1
5903                     	xdef	_TIM2_SetIC2Prescaler
5904                     	xdef	_TIM2_SetIC1Prescaler
5905                     	xdef	_TIM2_SetCompare2
5906                     	xdef	_TIM2_SetCompare1
5907                     	xdef	_TIM2_SetAutoreload
5908                     	xdef	_TIM2_SetCounter
5909                     	xdef	_TIM2_SelectOCxM
5910                     	xdef	_TIM2_CCxCmd
5911                     	xdef	_TIM2_OC2PolarityConfig
5912                     	xdef	_TIM2_OC1PolarityConfig
5913                     	xdef	_TIM2_GenerateEvent
5914                     	xdef	_TIM2_OC2FastCmd
5915                     	xdef	_TIM2_OC1FastCmd
5916                     	xdef	_TIM2_OC2PreloadConfig
5917                     	xdef	_TIM2_OC1PreloadConfig
5918                     	xdef	_TIM2_ARRPreloadConfig
5919                     	xdef	_TIM2_ForcedOC2Config
5920                     	xdef	_TIM2_ForcedOC1Config
5921                     	xdef	_TIM2_CounterModeConfig
5922                     	xdef	_TIM2_PrescalerConfig
5923                     	xdef	_TIM2_EncoderInterfaceConfig
5924                     	xdef	_TIM2_SelectMasterSlaveMode
5925                     	xdef	_TIM2_SelectSlaveMode
5926                     	xdef	_TIM2_SelectOutputTrigger
5927                     	xdef	_TIM2_SelectOnePulseMode
5928                     	xdef	_TIM2_SelectHallSensor
5929                     	xdef	_TIM2_UpdateRequestConfig
5930                     	xdef	_TIM2_UpdateDisableConfig
5931                     	xdef	_TIM2_SelectInputTrigger
5932                     	xdef	_TIM2_TIxExternalClockConfig
5933                     	xdef	_TIM2_ETRConfig
5934                     	xdef	_TIM2_ETRClockMode2Config
5935                     	xdef	_TIM2_ETRClockMode1Config
5936                     	xdef	_TIM2_InternalClockConfig
5937                     	xdef	_TIM2_ITConfig
5938                     	xdef	_TIM2_CtrlPWMOutputs
5939                     	xdef	_TIM2_Cmd
5940                     	xdef	_TIM2_PWMIConfig
5941                     	xdef	_TIM2_ICInit
5942                     	xdef	_TIM2_BKRConfig
5943                     	xdef	_TIM2_OC2Init
5944                     	xdef	_TIM2_OC1Init
5945                     	xdef	_TIM2_TimeBaseInit
5946                     	xdef	_TIM2_DeInit
5947                     	xref.b	c_x
5966                     	xref	c_ludv
5967                     	xref	c_rtol
5968                     	xref	c_uitolx
5969                     	xref	c_llsh
5970                     	xref	c_ltor
5971                     	end
