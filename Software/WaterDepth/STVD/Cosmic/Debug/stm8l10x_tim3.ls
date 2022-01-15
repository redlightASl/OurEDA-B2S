   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  48                     ; 64 void TIM3_DeInit(void)
  48                     ; 65 {
  50                     .text:	section	.text,new
  51  0000               _TIM3_DeInit:
  55                     ; 66   TIM3->CR1 = TIM_CR1_RESET_VALUE;
  57  0000 725f5280      	clr	21120
  58                     ; 67   TIM3->CR2 = TIM_CR2_RESET_VALUE;
  60  0004 725f5281      	clr	21121
  61                     ; 68   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  63  0008 725f5282      	clr	21122
  64                     ; 69   TIM3->ETR = TIM_ETR_RESET_VALUE;
  66  000c 725f5283      	clr	21123
  67                     ; 70   TIM3->IER = TIM_IER_RESET_VALUE;
  69  0010 725f5284      	clr	21124
  70                     ; 71   TIM3->SR2 = TIM_SR2_RESET_VALUE;
  72  0014 725f5286      	clr	21126
  73                     ; 74   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  75  0018 725f528a      	clr	21130
  76                     ; 76   TIM3->CCMR1 = 0x01;/*TIM3_ICxSource_TIxFPx */
  78  001c 35015288      	mov	21128,#1
  79                     ; 77   TIM3->CCMR2 = 0x01;/*TIM3_ICxSource_TIxFPx */
  81  0020 35015289      	mov	21129,#1
  82                     ; 80   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  84  0024 725f528a      	clr	21130
  85                     ; 81   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  87  0028 725f5288      	clr	21128
  88                     ; 82   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  90  002c 725f5289      	clr	21129
  91                     ; 84   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  93  0030 725f528b      	clr	21131
  94                     ; 85   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  96  0034 725f528c      	clr	21132
  97                     ; 87   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
  99  0038 725f528d      	clr	21133
 100                     ; 89   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
 102  003c 35ff528e      	mov	21134,#255
 103                     ; 90   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
 105  0040 35ff528f      	mov	21135,#255
 106                     ; 92   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
 108  0044 725f5290      	clr	21136
 109                     ; 93   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
 111  0048 725f5291      	clr	21137
 112                     ; 94   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
 114  004c 725f5292      	clr	21138
 115                     ; 95   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
 117  0050 725f5293      	clr	21139
 118                     ; 98   TIM3->OISR = TIM_OISR_RESET_VALUE;
 120  0054 725f5295      	clr	21141
 121                     ; 99   TIM3->EGR = 0x01;/*TIM_EGR_UG;*/
 123  0058 35015287      	mov	21127,#1
 124                     ; 100   TIM3->BKR = TIM_BKR_RESET_VALUE;
 126  005c 725f5294      	clr	21140
 127                     ; 101   TIM3->SR1 = TIM_SR1_RESET_VALUE;
 129  0060 725f5285      	clr	21125
 130                     ; 102 }
 133  0064 81            	ret	
 295                     ; 127 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
 295                     ; 128                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
 295                     ; 129                        uint16_t TIM3_Period)
 295                     ; 130 {
 296                     .text:	section	.text,new
 297  0000               _TIM3_TimeBaseInit:
 299       fffffffe      OFST: set -2
 302                     ; 132   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
 304                     ; 133   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 306                     ; 138   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
 308  0000 7b03          	ld	a,(OFST+5,sp)
 309  0002 c7528e        	ld	21134,a
 310                     ; 139   TIM3->ARRL = (uint8_t)(TIM3_Period);
 312  0005 7b04          	ld	a,(OFST+6,sp)
 313  0007 c7528f        	ld	21135,a
 314                     ; 142   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 316  000a 9e            	ld	a,xh
 317  000b c7528d        	ld	21133,a
 318                     ; 145   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 320  000e c65280        	ld	a,21120
 321  0011 a48f          	and	a,#143
 322  0013 c75280        	ld	21120,a
 323                     ; 146   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
 325  0016 9f            	ld	a,xl
 326  0017 ca5280        	or	a,21120
 327  001a c75280        	ld	21120,a
 328                     ; 147 }
 331  001d 81            	ret	
 529                     ; 174 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 529                     ; 175                   TIM3_OutputState_TypeDef TIM3_OutputState,
 529                     ; 176                   uint16_t TIM3_Pulse,
 529                     ; 177                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 529                     ; 178                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 529                     ; 179 {
 530                     .text:	section	.text,new
 531  0000               _TIM3_OC1Init:
 533  0000 89            	pushw	x
 534  0001 88            	push	a
 535       00000001      OFST:	set	1
 538                     ; 180   uint8_t tmpccmr1 = 0;
 540                     ; 183   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 542                     ; 184   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 544                     ; 185   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 546                     ; 186   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 548                     ; 188   tmpccmr1 = TIM3->CCMR1;
 550  0002 c65288        	ld	a,21128
 551  0005 6b01          	ld	(OFST+0,sp),a
 553                     ; 191   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 555  0007 7211528a      	bres	21130,#0
 556                     ; 193   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
 558  000b a48f          	and	a,#143
 559  000d 6b01          	ld	(OFST+0,sp),a
 561                     ; 196   tmpccmr1 |= (uint8_t)TIM3_OCMode;
 563  000f 9e            	ld	a,xh
 564  0010 1a01          	or	a,(OFST+0,sp)
 565  0012 6b01          	ld	(OFST+0,sp),a
 567                     ; 198   TIM3->CCMR1 = tmpccmr1;
 569  0014 c75288        	ld	21128,a
 570                     ; 201   if (TIM3_OutputState == TIM3_OutputState_Enable)
 572  0017 9f            	ld	a,xl
 573  0018 4a            	dec	a
 574  0019 2606          	jrne	L722
 575                     ; 203     TIM3->CCER1 |= TIM_CCER1_CC1E;
 577  001b 7210528a      	bset	21130,#0
 579  001f 2004          	jra	L132
 580  0021               L722:
 581                     ; 207     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
 583  0021 7211528a      	bres	21130,#0
 584  0025               L132:
 585                     ; 211   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 587  0025 7b08          	ld	a,(OFST+7,sp)
 588  0027 4a            	dec	a
 589  0028 2606          	jrne	L332
 590                     ; 213     TIM3->CCER1 |= TIM_CCER1_CC1P;
 592  002a 7212528a      	bset	21130,#1
 594  002e 2004          	jra	L532
 595  0030               L332:
 596                     ; 217     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
 598  0030 7213528a      	bres	21130,#1
 599  0034               L532:
 600                     ; 221   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 602  0034 7b09          	ld	a,(OFST+8,sp)
 603  0036 4a            	dec	a
 604  0037 2606          	jrne	L732
 605                     ; 223     TIM3->OISR |= TIM_OISR_OIS1;
 607  0039 72105295      	bset	21141,#0
 609  003d 2004          	jra	L142
 610  003f               L732:
 611                     ; 227     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
 613  003f 72115295      	bres	21141,#0
 614  0043               L142:
 615                     ; 231   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
 617  0043 7b06          	ld	a,(OFST+5,sp)
 618  0045 c75290        	ld	21136,a
 619                     ; 232   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
 621  0048 7b07          	ld	a,(OFST+6,sp)
 622  004a c75291        	ld	21137,a
 623                     ; 233 }
 626  004d 5b03          	addw	sp,#3
 627  004f 81            	ret	
 710                     ; 260 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
 710                     ; 261                   TIM3_OutputState_TypeDef TIM3_OutputState,
 710                     ; 262                   uint16_t TIM3_Pulse,
 710                     ; 263                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
 710                     ; 264                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
 710                     ; 265 {
 711                     .text:	section	.text,new
 712  0000               _TIM3_OC2Init:
 714  0000 89            	pushw	x
 715  0001 88            	push	a
 716       00000001      OFST:	set	1
 719                     ; 266   uint8_t tmpccmr2 = 0;
 721                     ; 269   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
 723                     ; 270   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
 725                     ; 271   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
 727                     ; 272   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
 729                     ; 274   tmpccmr2 = TIM3->CCMR2;
 731  0002 c65289        	ld	a,21129
 732  0005 6b01          	ld	(OFST+0,sp),a
 734                     ; 277   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 736  0007 7219528a      	bres	21130,#4
 737                     ; 280   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
 739  000b a48f          	and	a,#143
 740  000d 6b01          	ld	(OFST+0,sp),a
 742                     ; 283   tmpccmr2 |= (uint8_t)TIM3_OCMode;
 744  000f 9e            	ld	a,xh
 745  0010 1a01          	or	a,(OFST+0,sp)
 746  0012 6b01          	ld	(OFST+0,sp),a
 748                     ; 285   TIM3->CCMR2 = tmpccmr2;
 750  0014 c75289        	ld	21129,a
 751                     ; 288   if (TIM3_OutputState == TIM3_OutputState_Enable)
 753  0017 9f            	ld	a,xl
 754  0018 4a            	dec	a
 755  0019 2606          	jrne	L503
 756                     ; 290     TIM3->CCER1 |= TIM_CCER1_CC2E;
 758  001b 7218528a      	bset	21130,#4
 760  001f 2004          	jra	L703
 761  0021               L503:
 762                     ; 294     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
 764  0021 7219528a      	bres	21130,#4
 765  0025               L703:
 766                     ; 298   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
 768  0025 7b08          	ld	a,(OFST+7,sp)
 769  0027 4a            	dec	a
 770  0028 2606          	jrne	L113
 771                     ; 300     TIM3->CCER1 |= TIM_CCER1_CC2P;
 773  002a 721a528a      	bset	21130,#5
 775  002e 2004          	jra	L313
 776  0030               L113:
 777                     ; 304     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
 779  0030 721b528a      	bres	21130,#5
 780  0034               L313:
 781                     ; 309   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
 783  0034 7b09          	ld	a,(OFST+8,sp)
 784  0036 4a            	dec	a
 785  0037 2606          	jrne	L513
 786                     ; 311     TIM3->OISR |= TIM_OISR_OIS2;
 788  0039 72145295      	bset	21141,#2
 790  003d 2004          	jra	L713
 791  003f               L513:
 792                     ; 315     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
 794  003f 72155295      	bres	21141,#2
 795  0043               L713:
 796                     ; 319   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
 798  0043 7b06          	ld	a,(OFST+5,sp)
 799  0045 c75292        	ld	21138,a
 800                     ; 320   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
 802  0048 7b07          	ld	a,(OFST+6,sp)
 803  004a c75293        	ld	21139,a
 804                     ; 321 }
 807  004d 5b03          	addw	sp,#3
 808  004f 81            	ret	
1006                     ; 350 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
1006                     ; 351                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
1006                     ; 352                     TIM3_BreakState_TypeDef TIM3_BreakState,
1006                     ; 353                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
1006                     ; 354                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
1006                     ; 355 
1006                     ; 356 {
1007                     .text:	section	.text,new
1008  0000               _TIM3_BKRConfig:
1010  0000 89            	pushw	x
1011       00000000      OFST:	set	0
1014                     ; 358   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
1016                     ; 359   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
1018                     ; 360   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
1020                     ; 361   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
1022                     ; 362   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
1024                     ; 369   TIM3->BKR = (uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel | \
1024                     ; 370                         (uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity | \
1024                     ; 371                         (uint8_t)TIM3_AutomaticOutput);
1026  0001 9f            	ld	a,xl
1027  0002 1a01          	or	a,(OFST+1,sp)
1028  0004 1a05          	or	a,(OFST+5,sp)
1029  0006 1a06          	or	a,(OFST+6,sp)
1030  0008 1a07          	or	a,(OFST+7,sp)
1031  000a c75294        	ld	21140,a
1032                     ; 372 }
1035  000d 85            	popw	x
1036  000e 81            	ret	
1220                     ; 398 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
1220                     ; 399                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1220                     ; 400                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
1220                     ; 401                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1220                     ; 402                  uint8_t TIM3_ICFilter)
1220                     ; 403 {
1221                     .text:	section	.text,new
1222  0000               _TIM3_ICInit:
1224  0000 89            	pushw	x
1225       00000000      OFST:	set	0
1228                     ; 405   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1230                     ; 407   if (TIM3_Channel == TIM3_Channel_1)
1232  0001 9e            	ld	a,xh
1233  0002 4d            	tnz	a
1234  0003 2614          	jrne	L735
1235                     ; 410     TI1_Config(TIM3_ICPolarity,
1235                     ; 411                TIM3_ICSelection,
1235                     ; 412                TIM3_ICFilter);
1237  0005 7b07          	ld	a,(OFST+7,sp)
1238  0007 88            	push	a
1239  0008 7b06          	ld	a,(OFST+6,sp)
1240  000a 97            	ld	xl,a
1241  000b 7b03          	ld	a,(OFST+3,sp)
1242  000d 95            	ld	xh,a
1243  000e cd0000        	call	L3_TI1_Config
1245  0011 84            	pop	a
1246                     ; 415     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1248  0012 7b06          	ld	a,(OFST+6,sp)
1249  0014 cd0000        	call	_TIM3_SetIC1Prescaler
1252  0017 2012          	jra	L145
1253  0019               L735:
1254                     ; 420     TI2_Config(TIM3_ICPolarity,
1254                     ; 421                TIM3_ICSelection,
1254                     ; 422                TIM3_ICFilter);
1256  0019 7b07          	ld	a,(OFST+7,sp)
1257  001b 88            	push	a
1258  001c 7b06          	ld	a,(OFST+6,sp)
1259  001e 97            	ld	xl,a
1260  001f 7b03          	ld	a,(OFST+3,sp)
1261  0021 95            	ld	xh,a
1262  0022 cd0000        	call	L5_TI2_Config
1264  0025 84            	pop	a
1265                     ; 424     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1267  0026 7b06          	ld	a,(OFST+6,sp)
1268  0028 cd0000        	call	_TIM3_SetIC2Prescaler
1270  002b               L145:
1271                     ; 426 }
1274  002b 85            	popw	x
1275  002c 81            	ret	
1371                     ; 452 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
1371                     ; 453                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
1371                     ; 454                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
1371                     ; 455                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
1371                     ; 456                      uint8_t TIM3_ICFilter)
1371                     ; 457 {
1372                     .text:	section	.text,new
1373  0000               _TIM3_PWMIConfig:
1375  0000 89            	pushw	x
1376  0001 89            	pushw	x
1377       00000002      OFST:	set	2
1380                     ; 458   uint8_t icpolarity = (uint8_t)TIM3_ICPolarity_Rising;
1382                     ; 459   uint8_t icselection = (uint8_t)TIM3_ICSelection_DirectTI;
1384                     ; 462   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1386                     ; 465   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
1388  0002 9f            	ld	a,xl
1389  0003 4d            	tnz	a
1390  0004 2605          	jrne	L116
1391                     ; 467     icpolarity = (uint8_t)TIM3_ICPolarity_Falling;
1393  0006 4c            	inc	a
1394  0007 6b01          	ld	(OFST-1,sp),a
1397  0009 2002          	jra	L316
1398  000b               L116:
1399                     ; 471     icpolarity = (uint8_t)TIM3_ICPolarity_Rising;
1401  000b 0f01          	clr	(OFST-1,sp)
1403  000d               L316:
1404                     ; 475   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
1406  000d 7b07          	ld	a,(OFST+5,sp)
1407  000f 4a            	dec	a
1408  0010 2604          	jrne	L516
1409                     ; 477     icselection = (uint8_t)TIM3_ICSelection_IndirectTI;
1411  0012 a602          	ld	a,#2
1413  0014 2002          	jra	L716
1414  0016               L516:
1415                     ; 481     icselection = (uint8_t)TIM3_ICSelection_DirectTI;
1417  0016 a601          	ld	a,#1
1418  0018               L716:
1419  0018 6b02          	ld	(OFST+0,sp),a
1421                     ; 484   if (TIM3_Channel == TIM3_Channel_1)
1423  001a 7b03          	ld	a,(OFST+1,sp)
1424  001c 2626          	jrne	L126
1425                     ; 487     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
1425                     ; 488                TIM3_ICFilter);
1427  001e 7b09          	ld	a,(OFST+7,sp)
1428  0020 88            	push	a
1429  0021 7b08          	ld	a,(OFST+6,sp)
1430  0023 97            	ld	xl,a
1431  0024 7b05          	ld	a,(OFST+3,sp)
1432  0026 95            	ld	xh,a
1433  0027 cd0000        	call	L3_TI1_Config
1435  002a 84            	pop	a
1436                     ; 491     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1438  002b 7b08          	ld	a,(OFST+6,sp)
1439  002d cd0000        	call	_TIM3_SetIC1Prescaler
1441                     ; 494     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1443  0030 7b09          	ld	a,(OFST+7,sp)
1444  0032 88            	push	a
1445  0033 7b03          	ld	a,(OFST+1,sp)
1446  0035 97            	ld	xl,a
1447  0036 7b02          	ld	a,(OFST+0,sp)
1448  0038 95            	ld	xh,a
1449  0039 cd0000        	call	L5_TI2_Config
1451  003c 84            	pop	a
1452                     ; 497     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1454  003d 7b08          	ld	a,(OFST+6,sp)
1455  003f cd0000        	call	_TIM3_SetIC2Prescaler
1458  0042 2024          	jra	L326
1459  0044               L126:
1460                     ; 502     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
1460                     ; 503                TIM3_ICFilter);
1462  0044 7b09          	ld	a,(OFST+7,sp)
1463  0046 88            	push	a
1464  0047 7b08          	ld	a,(OFST+6,sp)
1465  0049 97            	ld	xl,a
1466  004a 7b05          	ld	a,(OFST+3,sp)
1467  004c 95            	ld	xh,a
1468  004d cd0000        	call	L5_TI2_Config
1470  0050 84            	pop	a
1471                     ; 506     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
1473  0051 7b08          	ld	a,(OFST+6,sp)
1474  0053 cd0000        	call	_TIM3_SetIC2Prescaler
1476                     ; 509     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
1478  0056 7b09          	ld	a,(OFST+7,sp)
1479  0058 88            	push	a
1480  0059 7b03          	ld	a,(OFST+1,sp)
1481  005b 97            	ld	xl,a
1482  005c 7b02          	ld	a,(OFST+0,sp)
1483  005e 95            	ld	xh,a
1484  005f cd0000        	call	L3_TI1_Config
1486  0062 84            	pop	a
1487                     ; 512     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
1489  0063 7b08          	ld	a,(OFST+6,sp)
1490  0065 cd0000        	call	_TIM3_SetIC1Prescaler
1492  0068               L326:
1493                     ; 514 }
1496  0068 5b04          	addw	sp,#4
1497  006a 81            	ret	
1552                     ; 522 void TIM3_Cmd(FunctionalState NewState)
1552                     ; 523 {
1553                     .text:	section	.text,new
1554  0000               _TIM3_Cmd:
1558                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1560                     ; 528   if (NewState != DISABLE)
1562  0000 4d            	tnz	a
1563  0001 2705          	jreq	L356
1564                     ; 530     TIM3->CR1 |= TIM_CR1_CEN;
1566  0003 72105280      	bset	21120,#0
1569  0007 81            	ret	
1570  0008               L356:
1571                     ; 534     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1573  0008 72115280      	bres	21120,#0
1574                     ; 536 }
1577  000c 81            	ret	
1613                     ; 544 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
1613                     ; 545 {
1614                     .text:	section	.text,new
1615  0000               _TIM3_CtrlPWMOutputs:
1619                     ; 547   assert_param(IS_FUNCTIONAL_STATE(NewState));
1621                     ; 551   if (NewState != DISABLE)
1623  0000 4d            	tnz	a
1624  0001 2705          	jreq	L576
1625                     ; 553     TIM3->BKR |= TIM_BKR_MOE ;
1627  0003 721e5294      	bset	21140,#7
1630  0007 81            	ret	
1631  0008               L576:
1632                     ; 557     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1634  0008 721f5294      	bres	21140,#7
1635                     ; 559 }
1638  000c 81            	ret	
1724                     ; 574 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
1724                     ; 575 {
1725                     .text:	section	.text,new
1726  0000               _TIM3_ITConfig:
1728  0000 89            	pushw	x
1729       00000000      OFST:	set	0
1732                     ; 577   assert_param(IS_TIM3_IT(TIM3_IT));
1734                     ; 578   assert_param(IS_FUNCTIONAL_STATE(NewState));
1736                     ; 580   if (NewState != DISABLE)
1738  0001 9f            	ld	a,xl
1739  0002 4d            	tnz	a
1740  0003 2706          	jreq	L147
1741                     ; 583     TIM3->IER |= (uint8_t)TIM3_IT;
1743  0005 9e            	ld	a,xh
1744  0006 ca5284        	or	a,21124
1746  0009 2006          	jra	L347
1747  000b               L147:
1748                     ; 588     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
1750  000b 7b01          	ld	a,(OFST+1,sp)
1751  000d 43            	cpl	a
1752  000e c45284        	and	a,21124
1753  0011               L347:
1754  0011 c75284        	ld	21124,a
1755                     ; 590 }
1758  0014 85            	popw	x
1759  0015 81            	ret	
1783                     ; 597 void TIM3_InternalClockConfig(void)
1783                     ; 598 {
1784                     .text:	section	.text,new
1785  0000               _TIM3_InternalClockConfig:
1789                     ; 600   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1791  0000 c65282        	ld	a,21122
1792  0003 a4f8          	and	a,#248
1793  0005 c75282        	ld	21122,a
1794                     ; 601 }
1797  0008 81            	ret	
1914                     ; 619 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
1914                     ; 620                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
1914                     ; 621                               uint8_t TIM3_ExtTRGFilter)
1914                     ; 622 {
1915                     .text:	section	.text,new
1916  0000               _TIM3_ETRClockMode1Config:
1918  0000 89            	pushw	x
1919       00000000      OFST:	set	0
1922                     ; 624   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
1924  0001 7b05          	ld	a,(OFST+5,sp)
1925  0003 88            	push	a
1926  0004 7b02          	ld	a,(OFST+2,sp)
1927  0006 95            	ld	xh,a
1928  0007 cd0000        	call	_TIM3_ETRConfig
1930  000a 84            	pop	a
1931                     ; 627   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
1933  000b c65282        	ld	a,21122
1934  000e a4f8          	and	a,#248
1935  0010 c75282        	ld	21122,a
1936                     ; 628   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
1938  0013 c65282        	ld	a,21122
1939  0016 aa07          	or	a,#7
1940  0018 c75282        	ld	21122,a
1941                     ; 631   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
1943  001b c65282        	ld	a,21122
1944  001e a48f          	and	a,#143
1945  0020 c75282        	ld	21122,a
1946                     ; 632   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
1948  0023 c65282        	ld	a,21122
1949  0026 aa70          	or	a,#112
1950  0028 c75282        	ld	21122,a
1951                     ; 633 }
1954  002b 85            	popw	x
1955  002c 81            	ret	
2013                     ; 651 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2013                     ; 652                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2013                     ; 653                               uint8_t TIM3_ExtTRGFilter)
2013                     ; 654 {
2014                     .text:	section	.text,new
2015  0000               _TIM3_ETRClockMode2Config:
2017  0000 89            	pushw	x
2018       00000000      OFST:	set	0
2021                     ; 656   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, TIM3_ExtTRGFilter);
2023  0001 7b05          	ld	a,(OFST+5,sp)
2024  0003 88            	push	a
2025  0004 7b02          	ld	a,(OFST+2,sp)
2026  0006 95            	ld	xh,a
2027  0007 cd0000        	call	_TIM3_ETRConfig
2029  000a 721c5283      	bset	21123,#6
2030                     ; 659   TIM3->ETR |= TIM_ETR_ECE ;
2032                     ; 660 }
2035  000e 5b03          	addw	sp,#3
2036  0010 81            	ret	
2092                     ; 678 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
2092                     ; 679                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
2092                     ; 680                     uint8_t TIM3_ExtTRGFilter)
2092                     ; 681 {
2093                     .text:	section	.text,new
2094  0000               _TIM3_ETRConfig:
2096  0000 89            	pushw	x
2097       00000000      OFST:	set	0
2100                     ; 683   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
2102                     ; 684   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
2104                     ; 685   assert_param(IS_TIM3_EXT_FILTER(TIM3_ExtTRGFilter));
2106                     ; 687   TIM3->ETR |= (uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity | (uint8_t)TIM3_ExtTRGFilter);
2108  0001 9f            	ld	a,xl
2109  0002 1a01          	or	a,(OFST+1,sp)
2110  0004 1a05          	or	a,(OFST+5,sp)
2111  0006 ca5283        	or	a,21123
2112  0009 c75283        	ld	21123,a
2113                     ; 688 }
2116  000c 85            	popw	x
2117  000d 81            	ret	
2206                     ; 705 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
2206                     ; 706                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2206                     ; 707                                  uint8_t TIM3_ICFilter)
2206                     ; 708 {
2207                     .text:	section	.text,new
2208  0000               _TIM3_TIxExternalClockConfig:
2210  0000 89            	pushw	x
2211       00000000      OFST:	set	0
2214                     ; 710   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
2216                     ; 711   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
2218                     ; 712   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
2220                     ; 715   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
2222  0001 9e            	ld	a,xh
2223  0002 a160          	cp	a,#96
2224  0004 260d          	jrne	L3411
2225                     ; 717     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2227  0006 7b05          	ld	a,(OFST+5,sp)
2228  0008 88            	push	a
2229  0009 9f            	ld	a,xl
2230  000a ae0001        	ldw	x,#1
2231  000d 95            	ld	xh,a
2232  000e cd0000        	call	L5_TI2_Config
2235  0011 200c          	jra	L5411
2236  0013               L3411:
2237                     ; 721     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, TIM3_ICFilter);
2239  0013 7b05          	ld	a,(OFST+5,sp)
2240  0015 88            	push	a
2241  0016 7b03          	ld	a,(OFST+3,sp)
2242  0018 ae0001        	ldw	x,#1
2243  001b 95            	ld	xh,a
2244  001c cd0000        	call	L3_TI1_Config
2246  001f               L5411:
2247  001f 84            	pop	a
2248                     ; 725   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
2250  0020 7b01          	ld	a,(OFST+1,sp)
2251  0022 cd0000        	call	_TIM3_SelectInputTrigger
2253                     ; 728   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
2255  0025 c65282        	ld	a,21122
2256  0028 aa07          	or	a,#7
2257  002a c75282        	ld	21122,a
2258                     ; 729 }
2261  002d 85            	popw	x
2262  002e 81            	ret	
2362                     ; 745 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
2362                     ; 746 {
2363                     .text:	section	.text,new
2364  0000               _TIM3_SelectInputTrigger:
2366  0000 88            	push	a
2367  0001 88            	push	a
2368       00000001      OFST:	set	1
2371                     ; 747   uint8_t tmpsmcr = 0;
2373                     ; 750   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
2375                     ; 752   tmpsmcr = TIM3->SMCR;
2377  0002 c65282        	ld	a,21122
2379                     ; 755   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
2381  0005 a48f          	and	a,#143
2383                     ; 756   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
2385  0007 1a02          	or	a,(OFST+1,sp)
2387                     ; 758   TIM3->SMCR = (uint8_t)tmpsmcr;
2389  0009 c75282        	ld	21122,a
2390                     ; 759 }
2393  000c 85            	popw	x
2394  000d 81            	ret	
2430                     ; 767 void TIM3_UpdateDisableConfig(FunctionalState NewState)
2430                     ; 768 {
2431                     .text:	section	.text,new
2432  0000               _TIM3_UpdateDisableConfig:
2436                     ; 770   assert_param(IS_FUNCTIONAL_STATE(NewState));
2438                     ; 773   if (NewState != DISABLE)
2440  0000 4d            	tnz	a
2441  0001 2705          	jreq	L7221
2442                     ; 775     TIM3->CR1 |= TIM_CR1_UDIS;
2444  0003 72125280      	bset	21120,#1
2447  0007 81            	ret	
2448  0008               L7221:
2449                     ; 779     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
2451  0008 72135280      	bres	21120,#1
2452                     ; 781 }
2455  000c 81            	ret	
2513                     ; 791 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
2513                     ; 792 {
2514                     .text:	section	.text,new
2515  0000               _TIM3_UpdateRequestConfig:
2519                     ; 794   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
2521                     ; 797   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
2523  0000 4a            	dec	a
2524  0001 2605          	jrne	L1621
2525                     ; 799     TIM3->CR1 |= TIM_CR1_URS ;
2527  0003 72145280      	bset	21120,#2
2530  0007 81            	ret	
2531  0008               L1621:
2532                     ; 803     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
2534  0008 72155280      	bres	21120,#2
2535                     ; 805 }
2538  000c 81            	ret	
2574                     ; 813 void TIM3_SelectHallSensor(FunctionalState NewState)
2574                     ; 814 {
2575                     .text:	section	.text,new
2576  0000               _TIM3_SelectHallSensor:
2580                     ; 816   assert_param(IS_FUNCTIONAL_STATE(NewState));
2582                     ; 819   if (NewState != DISABLE)
2584  0000 4d            	tnz	a
2585  0001 2705          	jreq	L3031
2586                     ; 821     TIM3->CR2 |= TIM_CR2_TI1S;
2588  0003 721e5281      	bset	21121,#7
2591  0007 81            	ret	
2592  0008               L3031:
2593                     ; 825     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
2595  0008 721f5281      	bres	21121,#7
2596                     ; 827 }
2599  000c 81            	ret	
2656                     ; 837 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
2656                     ; 838 {
2657                     .text:	section	.text,new
2658  0000               _TIM3_SelectOnePulseMode:
2662                     ; 840   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
2664                     ; 843   if (TIM3_OPMode == TIM3_OPMode_Single)
2666  0000 4a            	dec	a
2667  0001 2605          	jrne	L5331
2668                     ; 845     TIM3->CR1 |= TIM_CR1_OPM ;
2670  0003 72165280      	bset	21120,#3
2673  0007 81            	ret	
2674  0008               L5331:
2675                     ; 849     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
2677  0008 72175280      	bres	21120,#3
2678                     ; 851 }
2681  000c 81            	ret	
2780                     ; 865 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
2780                     ; 866 {
2781                     .text:	section	.text,new
2782  0000               _TIM3_SelectOutputTrigger:
2784  0000 88            	push	a
2785  0001 88            	push	a
2786       00000001      OFST:	set	1
2789                     ; 867   uint8_t tmpcr2 = 0;
2791                     ; 870   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
2793                     ; 872   tmpcr2 = TIM3->CR2;
2795  0002 c65281        	ld	a,21121
2797                     ; 875   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
2799  0005 a48f          	and	a,#143
2801                     ; 878   tmpcr2 |= (uint8_t)TIM3_TRGOSource;
2803  0007 1a02          	or	a,(OFST+1,sp)
2805                     ; 880   TIM3->CR2 = tmpcr2;
2807  0009 c75281        	ld	21121,a
2808                     ; 881 }
2811  000c 85            	popw	x
2812  000d 81            	ret	
2895                     ; 893 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
2895                     ; 894 {
2896                     .text:	section	.text,new
2897  0000               _TIM3_SelectSlaveMode:
2899  0000 88            	push	a
2900  0001 88            	push	a
2901       00000001      OFST:	set	1
2904                     ; 895   uint8_t tmpsmcr = 0;
2906                     ; 898   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
2908                     ; 900   tmpsmcr = TIM3->SMCR;
2910  0002 c65282        	ld	a,21122
2912                     ; 903   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
2914  0005 a4f8          	and	a,#248
2916                     ; 906   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
2918  0007 1a02          	or	a,(OFST+1,sp)
2920                     ; 908   TIM3->SMCR = tmpsmcr;
2922  0009 c75282        	ld	21122,a
2923                     ; 909 }
2926  000c 85            	popw	x
2927  000d 81            	ret	
2963                     ; 917 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
2963                     ; 918 {
2964                     .text:	section	.text,new
2965  0000               _TIM3_SelectMasterSlaveMode:
2969                     ; 920   assert_param(IS_FUNCTIONAL_STATE(NewState));
2971                     ; 923   if (NewState != DISABLE)
2973  0000 4d            	tnz	a
2974  0001 2705          	jreq	L7541
2975                     ; 925     TIM3->SMCR |= TIM_SMCR_MSM;
2977  0003 721e5282      	bset	21122,#7
2980  0007 81            	ret	
2981  0008               L7541:
2982                     ; 929     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
2984  0008 721f5282      	bres	21122,#7
2985                     ; 931 }
2988  000c 81            	ret	
3101                     ; 950 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
3101                     ; 951                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
3101                     ; 952                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
3101                     ; 953 {
3102                     .text:	section	.text,new
3103  0000               _TIM3_EncoderInterfaceConfig:
3105  0000 89            	pushw	x
3106  0001 5203          	subw	sp,#3
3107       00000003      OFST:	set	3
3110                     ; 954   uint8_t tmpsmcr = 0;
3112                     ; 955   uint8_t tmpccmr1 = 0;
3114                     ; 956   uint8_t tmpccmr2 = 0;
3116                     ; 959   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
3118                     ; 960   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
3120                     ; 961   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
3122                     ; 963   tmpsmcr = TIM3->SMCR;
3124  0003 c65282        	ld	a,21122
3125  0006 6b01          	ld	(OFST-2,sp),a
3127                     ; 964   tmpccmr1 = TIM3->CCMR1;
3129  0008 c65288        	ld	a,21128
3130  000b 6b02          	ld	(OFST-1,sp),a
3132                     ; 965   tmpccmr2 = TIM3->CCMR2;
3134  000d c65289        	ld	a,21129
3135  0010 6b03          	ld	(OFST+0,sp),a
3137                     ; 968   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
3139  0012 7b01          	ld	a,(OFST-2,sp)
3140  0014 a4f0          	and	a,#240
3141  0016 6b01          	ld	(OFST-2,sp),a
3143                     ; 969   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
3145  0018 9e            	ld	a,xh
3146  0019 1a01          	or	a,(OFST-2,sp)
3147  001b 6b01          	ld	(OFST-2,sp),a
3149                     ; 972   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
3151  001d 7b02          	ld	a,(OFST-1,sp)
3152  001f a4fc          	and	a,#252
3153  0021 6b02          	ld	(OFST-1,sp),a
3155                     ; 973   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
3157  0023 7b03          	ld	a,(OFST+0,sp)
3158  0025 a4fc          	and	a,#252
3159  0027 6b03          	ld	(OFST+0,sp),a
3161                     ; 974   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
3163  0029 7b02          	ld	a,(OFST-1,sp)
3164  002b aa01          	or	a,#1
3165  002d 6b02          	ld	(OFST-1,sp),a
3167                     ; 975   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
3169  002f 7b03          	ld	a,(OFST+0,sp)
3170  0031 aa01          	or	a,#1
3171  0033 6b03          	ld	(OFST+0,sp),a
3173                     ; 978   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
3175  0035 9f            	ld	a,xl
3176  0036 4a            	dec	a
3177  0037 2606          	jrne	L7351
3178                     ; 980     TIM3->CCER1 |= TIM_CCER1_CC1P ;
3180  0039 7212528a      	bset	21130,#1
3182  003d 2004          	jra	L1451
3183  003f               L7351:
3184                     ; 984     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
3186  003f 7213528a      	bres	21130,#1
3187  0043               L1451:
3188                     ; 987   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
3190  0043 7b08          	ld	a,(OFST+5,sp)
3191  0045 4a            	dec	a
3192  0046 2606          	jrne	L3451
3193                     ; 989     TIM3->CCER1 |= TIM_CCER1_CC2P ;
3195  0048 721a528a      	bset	21130,#5
3197  004c 2004          	jra	L5451
3198  004e               L3451:
3199                     ; 993     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
3201  004e 721b528a      	bres	21130,#5
3202  0052               L5451:
3203                     ; 996   TIM3->SMCR = tmpsmcr;
3205  0052 7b01          	ld	a,(OFST-2,sp)
3206  0054 c75282        	ld	21122,a
3207                     ; 997   TIM3->CCMR1 = tmpccmr1;
3209  0057 7b02          	ld	a,(OFST-1,sp)
3210  0059 c75288        	ld	21128,a
3211                     ; 998   TIM3->CCMR2 = tmpccmr2;
3213  005c 7b03          	ld	a,(OFST+0,sp)
3214  005e c75289        	ld	21129,a
3215                     ; 999 }
3218  0061 5b05          	addw	sp,#5
3219  0063 81            	ret	
3287                     ; 1019 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef TIM3_Prescaler,
3287                     ; 1020                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
3287                     ; 1021 {
3288                     .text:	section	.text,new
3289  0000               _TIM3_PrescalerConfig:
3293                     ; 1023   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
3295                     ; 1024   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
3297                     ; 1027   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
3299  0000 9e            	ld	a,xh
3300  0001 c7528d        	ld	21133,a
3301                     ; 1031   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
3303  0004 9f            	ld	a,xl
3304  0005 4a            	dec	a
3305  0006 2605          	jrne	L1061
3306                     ; 1033     TIM3->EGR |= TIM_EGR_UG ;
3308  0008 72105287      	bset	21127,#0
3311  000c 81            	ret	
3312  000d               L1061:
3313                     ; 1037     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
3315  000d 72115287      	bres	21127,#0
3316                     ; 1039 }
3319  0011 81            	ret	
3364                     ; 1052 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
3364                     ; 1053 {
3365                     .text:	section	.text,new
3366  0000               _TIM3_CounterModeConfig:
3368  0000 88            	push	a
3369  0001 88            	push	a
3370       00000001      OFST:	set	1
3373                     ; 1054   uint8_t tmpcr1 = 0;
3375                     ; 1057   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
3377                     ; 1059   tmpcr1 = TIM3->CR1;
3379  0002 c65280        	ld	a,21120
3381                     ; 1062   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
3383  0005 a48f          	and	a,#143
3385                     ; 1065   tmpcr1 |= (uint8_t)TIM3_CounterMode;
3387  0007 1a02          	or	a,(OFST+1,sp)
3389                     ; 1067   TIM3->CR1 = tmpcr1;
3391  0009 c75280        	ld	21120,a
3392                     ; 1068 }
3395  000c 85            	popw	x
3396  000d 81            	ret	
3463                     ; 1078 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3463                     ; 1079 {
3464                     .text:	section	.text,new
3465  0000               _TIM3_ForcedOC1Config:
3467  0000 88            	push	a
3468  0001 88            	push	a
3469       00000001      OFST:	set	1
3472                     ; 1080   uint8_t tmpccmr1 = 0;
3474                     ; 1083   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3476                     ; 1085   tmpccmr1 = TIM3->CCMR1;
3478  0002 c65288        	ld	a,21128
3480                     ; 1088   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
3482  0005 a48f          	and	a,#143
3484                     ; 1091   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
3486  0007 1a02          	or	a,(OFST+1,sp)
3488                     ; 1093   TIM3->CCMR1 = tmpccmr1;
3490  0009 c75288        	ld	21128,a
3491                     ; 1094 }
3494  000c 85            	popw	x
3495  000d 81            	ret	
3540                     ; 1104 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
3540                     ; 1105 {
3541                     .text:	section	.text,new
3542  0000               _TIM3_ForcedOC2Config:
3544  0000 88            	push	a
3545  0001 88            	push	a
3546       00000001      OFST:	set	1
3549                     ; 1106   uint8_t tmpccmr2 = 0;
3551                     ; 1109   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
3553                     ; 1111   tmpccmr2 = TIM3->CCMR2;
3555  0002 c65289        	ld	a,21129
3557                     ; 1114   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
3559  0005 a48f          	and	a,#143
3561                     ; 1117   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
3563  0007 1a02          	or	a,(OFST+1,sp)
3565                     ; 1119   TIM3->CCMR2 = tmpccmr2;
3567  0009 c75289        	ld	21129,a
3568                     ; 1120 }
3571  000c 85            	popw	x
3572  000d 81            	ret	
3608                     ; 1128 void TIM3_ARRPreloadConfig(FunctionalState NewState)
3608                     ; 1129 {
3609                     .text:	section	.text,new
3610  0000               _TIM3_ARRPreloadConfig:
3614                     ; 1131   assert_param(IS_FUNCTIONAL_STATE(NewState));
3616                     ; 1134   if (NewState != DISABLE)
3618  0000 4d            	tnz	a
3619  0001 2705          	jreq	L1271
3620                     ; 1136     TIM3->CR1 |= TIM_CR1_ARPE;
3622  0003 721e5280      	bset	21120,#7
3625  0007 81            	ret	
3626  0008               L1271:
3627                     ; 1140     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
3629  0008 721f5280      	bres	21120,#7
3630                     ; 1142 }
3633  000c 81            	ret	
3669                     ; 1150 void TIM3_OC1PreloadConfig(FunctionalState NewState)
3669                     ; 1151 {
3670                     .text:	section	.text,new
3671  0000               _TIM3_OC1PreloadConfig:
3675                     ; 1153   assert_param(IS_FUNCTIONAL_STATE(NewState));
3677                     ; 1156   if (NewState != DISABLE)
3679  0000 4d            	tnz	a
3680  0001 2705          	jreq	L3471
3681                     ; 1158     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
3683  0003 72165288      	bset	21128,#3
3686  0007 81            	ret	
3687  0008               L3471:
3688                     ; 1162     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3690  0008 72175288      	bres	21128,#3
3691                     ; 1164 }
3694  000c 81            	ret	
3730                     ; 1172 void TIM3_OC2PreloadConfig(FunctionalState NewState)
3730                     ; 1173 {
3731                     .text:	section	.text,new
3732  0000               _TIM3_OC2PreloadConfig:
3736                     ; 1175   assert_param(IS_FUNCTIONAL_STATE(NewState));
3738                     ; 1178   if (NewState != DISABLE)
3740  0000 4d            	tnz	a
3741  0001 2705          	jreq	L5671
3742                     ; 1180     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
3744  0003 72165289      	bset	21129,#3
3747  0007 81            	ret	
3748  0008               L5671:
3749                     ; 1184     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
3751  0008 72175289      	bres	21129,#3
3752                     ; 1186 }
3755  000c 81            	ret	
3790                     ; 1194 void TIM3_OC1FastCmd(FunctionalState NewState)
3790                     ; 1195 {
3791                     .text:	section	.text,new
3792  0000               _TIM3_OC1FastCmd:
3796                     ; 1197   assert_param(IS_FUNCTIONAL_STATE(NewState));
3798                     ; 1200   if (NewState != DISABLE)
3800  0000 4d            	tnz	a
3801  0001 2705          	jreq	L7002
3802                     ; 1202     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
3804  0003 72145288      	bset	21128,#2
3807  0007 81            	ret	
3808  0008               L7002:
3809                     ; 1206     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3811  0008 72155288      	bres	21128,#2
3812                     ; 1208 }
3815  000c 81            	ret	
3850                     ; 1216 void TIM3_OC2FastCmd(FunctionalState NewState)
3850                     ; 1217 {
3851                     .text:	section	.text,new
3852  0000               _TIM3_OC2FastCmd:
3856                     ; 1219   assert_param(IS_FUNCTIONAL_STATE(NewState));
3858                     ; 1222   if (NewState != DISABLE)
3860  0000 4d            	tnz	a
3861  0001 2705          	jreq	L1302
3862                     ; 1224     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
3864  0003 72145289      	bset	21129,#2
3867  0007 81            	ret	
3868  0008               L1302:
3869                     ; 1228     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
3871  0008 72155289      	bres	21129,#2
3872                     ; 1230 }
3875  000c 81            	ret	
3956                     ; 1243 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
3956                     ; 1244 {
3957                     .text:	section	.text,new
3958  0000               _TIM3_GenerateEvent:
3962                     ; 1246   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
3964                     ; 1249   TIM3->EGR |= (uint8_t)TIM3_EventSource;
3966  0000 ca5287        	or	a,21127
3967  0003 c75287        	ld	21127,a
3968                     ; 1250 }
3971  0006 81            	ret	
4007                     ; 1260 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4007                     ; 1261 {
4008                     .text:	section	.text,new
4009  0000               _TIM3_OC1PolarityConfig:
4013                     ; 1263   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4015                     ; 1266   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4017  0000 4a            	dec	a
4018  0001 2605          	jrne	L7012
4019                     ; 1268     TIM3->CCER1 |= TIM_CCER1_CC1P ;
4021  0003 7212528a      	bset	21130,#1
4024  0007 81            	ret	
4025  0008               L7012:
4026                     ; 1272     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
4028  0008 7213528a      	bres	21130,#1
4029                     ; 1274 }
4032  000c 81            	ret	
4068                     ; 1284 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
4068                     ; 1285 {
4069                     .text:	section	.text,new
4070  0000               _TIM3_OC2PolarityConfig:
4074                     ; 1287   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
4076                     ; 1290   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
4078  0000 4a            	dec	a
4079  0001 2605          	jrne	L1312
4080                     ; 1292     TIM3->CCER1 |= TIM_CCER1_CC2P ;
4082  0003 721a528a      	bset	21130,#5
4085  0007 81            	ret	
4086  0008               L1312:
4087                     ; 1296     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
4089  0008 721b528a      	bres	21130,#5
4090                     ; 1298 }
4093  000c 81            	ret	
4138                     ; 1310 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel,
4138                     ; 1311                  FunctionalState NewState)
4138                     ; 1312 {
4139                     .text:	section	.text,new
4140  0000               _TIM3_CCxCmd:
4142  0000 89            	pushw	x
4143       00000000      OFST:	set	0
4146                     ; 1314   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4148                     ; 1315   assert_param(IS_FUNCTIONAL_STATE(NewState));
4150                     ; 1317   if (TIM3_Channel == TIM3_Channel_1)
4152  0001 9e            	ld	a,xh
4153  0002 4d            	tnz	a
4154  0003 2610          	jrne	L7512
4155                     ; 1320     if (NewState != DISABLE)
4157  0005 9f            	ld	a,xl
4158  0006 4d            	tnz	a
4159  0007 2706          	jreq	L1612
4160                     ; 1322       TIM3->CCER1 |= TIM_CCER1_CC1E ;
4162  0009 7210528a      	bset	21130,#0
4164  000d 2014          	jra	L5612
4165  000f               L1612:
4166                     ; 1326       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
4168  000f 7211528a      	bres	21130,#0
4169  0013 200e          	jra	L5612
4170  0015               L7512:
4171                     ; 1333     if (NewState != DISABLE)
4173  0015 7b02          	ld	a,(OFST+2,sp)
4174  0017 2706          	jreq	L7612
4175                     ; 1335       TIM3->CCER1 |= TIM_CCER1_CC2E;
4177  0019 7218528a      	bset	21130,#4
4179  001d 2004          	jra	L5612
4180  001f               L7612:
4181                     ; 1339       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
4183  001f 7219528a      	bres	21130,#4
4184  0023               L5612:
4185                     ; 1343 }
4188  0023 85            	popw	x
4189  0024 81            	ret	
4234                     ; 1362 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
4234                     ; 1363                      TIM3_OCMode_TypeDef TIM3_OCMode)
4234                     ; 1364 {
4235                     .text:	section	.text,new
4236  0000               _TIM3_SelectOCxM:
4238  0000 89            	pushw	x
4239       00000000      OFST:	set	0
4242                     ; 1366   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
4244                     ; 1367   assert_param(IS_TIM3_OCM(TIM3_OCMode));
4246                     ; 1369   if (TIM3_Channel == TIM3_Channel_1)
4248  0001 9e            	ld	a,xh
4249  0002 4d            	tnz	a
4250  0003 2615          	jrne	L5122
4251                     ; 1372     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
4253  0005 7211528a      	bres	21130,#0
4254                     ; 1375     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
4256  0009 c65288        	ld	a,21128
4257  000c a48f          	and	a,#143
4258  000e c75288        	ld	21128,a
4259                     ; 1378     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
4261  0011 9f            	ld	a,xl
4262  0012 ca5288        	or	a,21128
4263  0015 c75288        	ld	21128,a
4265  0018 2014          	jra	L7122
4266  001a               L5122:
4267                     ; 1383     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
4269  001a 7219528a      	bres	21130,#4
4270                     ; 1386     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
4272  001e c65289        	ld	a,21129
4273  0021 a48f          	and	a,#143
4274  0023 c75289        	ld	21129,a
4275                     ; 1389     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
4277  0026 c65289        	ld	a,21129
4278  0029 1a02          	or	a,(OFST+2,sp)
4279  002b c75289        	ld	21129,a
4280  002e               L7122:
4281                     ; 1391 }
4284  002e 85            	popw	x
4285  002f 81            	ret	
4319                     ; 1399 void TIM3_SetCounter(uint16_t TIM3_Counter)
4319                     ; 1400 {
4320                     .text:	section	.text,new
4321  0000               _TIM3_SetCounter:
4325                     ; 1403   TIM3->CNTRH = (uint8_t)(TIM3_Counter >> 8);
4327  0000 9e            	ld	a,xh
4328  0001 c7528b        	ld	21131,a
4329                     ; 1404   TIM3->CNTRL = (uint8_t)(TIM3_Counter);
4331  0004 9f            	ld	a,xl
4332  0005 c7528c        	ld	21132,a
4333                     ; 1405 }
4336  0008 81            	ret	
4370                     ; 1413 void TIM3_SetAutoreload(uint16_t TIM3_Autoreload)
4370                     ; 1414 {
4371                     .text:	section	.text,new
4372  0000               _TIM3_SetAutoreload:
4376                     ; 1416   TIM3->ARRH = (uint8_t)(TIM3_Autoreload >> 8);
4378  0000 9e            	ld	a,xh
4379  0001 c7528e        	ld	21134,a
4380                     ; 1417   TIM3->ARRL = (uint8_t)(TIM3_Autoreload);
4382  0004 9f            	ld	a,xl
4383  0005 c7528f        	ld	21135,a
4384                     ; 1418 }
4387  0008 81            	ret	
4421                     ; 1426 void TIM3_SetCompare1(uint16_t TIM3_Compare)
4421                     ; 1427 {
4422                     .text:	section	.text,new
4423  0000               _TIM3_SetCompare1:
4427                     ; 1429   TIM3->CCR1H = (uint8_t)(TIM3_Compare >> 8);
4429  0000 9e            	ld	a,xh
4430  0001 c75290        	ld	21136,a
4431                     ; 1430   TIM3->CCR1L = (uint8_t)(TIM3_Compare);
4433  0004 9f            	ld	a,xl
4434  0005 c75291        	ld	21137,a
4435                     ; 1431 }
4438  0008 81            	ret	
4472                     ; 1439 void TIM3_SetCompare2(uint16_t TIM3_Compare)
4472                     ; 1440 {
4473                     .text:	section	.text,new
4474  0000               _TIM3_SetCompare2:
4478                     ; 1442   TIM3->CCR2H = (uint8_t)(TIM3_Compare >> 8);
4480  0000 9e            	ld	a,xh
4481  0001 c75292        	ld	21138,a
4482                     ; 1443   TIM3->CCR2L = (uint8_t)(TIM3_Compare);
4484  0004 9f            	ld	a,xl
4485  0005 c75293        	ld	21139,a
4486                     ; 1444 }
4489  0008 81            	ret	
4534                     ; 1456 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
4534                     ; 1457 {
4535                     .text:	section	.text,new
4536  0000               _TIM3_SetIC1Prescaler:
4538  0000 88            	push	a
4539  0001 88            	push	a
4540       00000001      OFST:	set	1
4543                     ; 1458   uint8_t tmpccmr1 = 0;
4545                     ; 1461   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
4547                     ; 1463   tmpccmr1 = TIM3->CCMR1;
4549  0002 c65288        	ld	a,21128
4551                     ; 1466   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4553  0005 a4f3          	and	a,#243
4555                     ; 1469   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
4557  0007 1a02          	or	a,(OFST+1,sp)
4559                     ; 1471   TIM3->CCMR1 = tmpccmr1;
4561  0009 c75288        	ld	21128,a
4562                     ; 1472 }
4565  000c 85            	popw	x
4566  000d 81            	ret	
4611                     ; 1484 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
4611                     ; 1485 {
4612                     .text:	section	.text,new
4613  0000               _TIM3_SetIC2Prescaler:
4615  0000 88            	push	a
4616  0001 88            	push	a
4617       00000001      OFST:	set	1
4620                     ; 1486   uint8_t tmpccmr2 = 0;
4622                     ; 1489   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
4624                     ; 1491   tmpccmr2 = TIM3->CCMR2;
4626  0002 c65289        	ld	a,21129
4628                     ; 1494   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
4630  0005 a4f3          	and	a,#243
4632                     ; 1497   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
4634  0007 1a02          	or	a,(OFST+1,sp)
4636                     ; 1499   TIM3->CCMR2 = tmpccmr2;
4638  0009 c75289        	ld	21129,a
4639                     ; 1500 }
4642  000c 85            	popw	x
4643  000d 81            	ret	
4695                     ; 1507 uint16_t TIM3_GetCapture1(void)
4695                     ; 1508 {
4696                     .text:	section	.text,new
4697  0000               _TIM3_GetCapture1:
4699  0000 5204          	subw	sp,#4
4700       00000004      OFST:	set	4
4703                     ; 1509   uint16_t tmpccr1 = 0;
4705                     ; 1512   tmpccr1h = TIM3->CCR1H;
4707  0002 c65290        	ld	a,21136
4708  0005 6b02          	ld	(OFST-2,sp),a
4710                     ; 1513   tmpccr1l = TIM3->CCR1L;
4712  0007 c65291        	ld	a,21137
4713  000a 6b01          	ld	(OFST-3,sp),a
4715                     ; 1515   tmpccr1 = (uint16_t)(tmpccr1l);
4717  000c 5f            	clrw	x
4718  000d 97            	ld	xl,a
4719  000e 1f03          	ldw	(OFST-1,sp),x
4721                     ; 1516   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4723  0010 5f            	clrw	x
4724  0011 7b02          	ld	a,(OFST-2,sp)
4725  0013 97            	ld	xl,a
4726  0014 7b04          	ld	a,(OFST+0,sp)
4727  0016 01            	rrwa	x,a
4728  0017 1a03          	or	a,(OFST-1,sp)
4729  0019 01            	rrwa	x,a
4731                     ; 1518   return ((uint16_t)tmpccr1);
4735  001a 5b04          	addw	sp,#4
4736  001c 81            	ret	
4788                     ; 1526 uint16_t TIM3_GetCapture2(void)
4788                     ; 1527 {
4789                     .text:	section	.text,new
4790  0000               _TIM3_GetCapture2:
4792  0000 5204          	subw	sp,#4
4793       00000004      OFST:	set	4
4796                     ; 1528   uint16_t tmpccr2 = 0;
4798                     ; 1531   tmpccr2h = TIM3->CCR2H;
4800  0002 c65292        	ld	a,21138
4801  0005 6b02          	ld	(OFST-2,sp),a
4803                     ; 1532   tmpccr2l = TIM3->CCR2L;
4805  0007 c65293        	ld	a,21139
4806  000a 6b01          	ld	(OFST-3,sp),a
4808                     ; 1534   tmpccr2 = (uint16_t)(tmpccr2l);
4810  000c 5f            	clrw	x
4811  000d 97            	ld	xl,a
4812  000e 1f03          	ldw	(OFST-1,sp),x
4814                     ; 1535   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4816  0010 5f            	clrw	x
4817  0011 7b02          	ld	a,(OFST-2,sp)
4818  0013 97            	ld	xl,a
4819  0014 7b04          	ld	a,(OFST+0,sp)
4820  0016 01            	rrwa	x,a
4821  0017 1a03          	or	a,(OFST-1,sp)
4822  0019 01            	rrwa	x,a
4824                     ; 1537   return ((uint16_t)tmpccr2);
4828  001a 5b04          	addw	sp,#4
4829  001c 81            	ret	
4881                     ; 1545 uint16_t TIM3_GetCounter(void)
4881                     ; 1546 {
4882                     .text:	section	.text,new
4883  0000               _TIM3_GetCounter:
4885  0000 5204          	subw	sp,#4
4886       00000004      OFST:	set	4
4889                     ; 1547   uint16_t tmpcnt = 0;
4891                     ; 1550   tmpcntrh = TIM3->CNTRH;
4893  0002 c6528b        	ld	a,21131
4894  0005 6b02          	ld	(OFST-2,sp),a
4896                     ; 1551   tmpcntrl = TIM3->CNTRL;
4898  0007 c6528c        	ld	a,21132
4899  000a 6b01          	ld	(OFST-3,sp),a
4901                     ; 1553   tmpcnt = (uint16_t)(tmpcntrl);
4903  000c 5f            	clrw	x
4904  000d 97            	ld	xl,a
4905  000e 1f03          	ldw	(OFST-1,sp),x
4907                     ; 1554   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
4909  0010 5f            	clrw	x
4910  0011 7b02          	ld	a,(OFST-2,sp)
4911  0013 97            	ld	xl,a
4912  0014 7b04          	ld	a,(OFST+0,sp)
4913  0016 01            	rrwa	x,a
4914  0017 1a03          	or	a,(OFST-1,sp)
4915  0019 01            	rrwa	x,a
4917                     ; 1556   return ((uint16_t)tmpcnt);
4921  001a 5b04          	addw	sp,#4
4922  001c 81            	ret	
4946                     ; 1572 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
4946                     ; 1573 {
4947                     .text:	section	.text,new
4948  0000               _TIM3_GetPrescaler:
4952                     ; 1575   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
4954  0000 c6528d        	ld	a,21133
4957  0003 81            	ret	
5096                     ; 1591 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
5096                     ; 1592 {
5097                     .text:	section	.text,new
5098  0000               _TIM3_GetFlagStatus:
5100  0000 89            	pushw	x
5101  0001 89            	pushw	x
5102       00000002      OFST:	set	2
5105                     ; 1593   FlagStatus bitstatus = RESET;
5107                     ; 1597   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
5109                     ; 1599   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
5111  0002 9f            	ld	a,xl
5112  0003 c45285        	and	a,21125
5113  0006 6b01          	ld	(OFST-1,sp),a
5115                     ; 1600   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
5117  0008 c65286        	ld	a,21126
5118  000b 1403          	and	a,(OFST+1,sp)
5119  000d 6b02          	ld	(OFST+0,sp),a
5121                     ; 1602   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
5123  000f 1a01          	or	a,(OFST-1,sp)
5124  0011 2702          	jreq	L3552
5125                     ; 1604     bitstatus = SET;
5127  0013 a601          	ld	a,#1
5130  0015               L3552:
5131                     ; 1608     bitstatus = RESET;
5134                     ; 1610   return ((FlagStatus)bitstatus);
5138  0015 5b04          	addw	sp,#4
5139  0017 81            	ret	
5174                     ; 1624 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
5174                     ; 1625 {
5175                     .text:	section	.text,new
5176  0000               _TIM3_ClearFlag:
5178  0000 89            	pushw	x
5179       00000000      OFST:	set	0
5182                     ; 1627   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
5184                     ; 1629   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
5186  0001 9f            	ld	a,xl
5187  0002 43            	cpl	a
5188  0003 c75285        	ld	21125,a
5189                     ; 1630   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
5191  0006 7b01          	ld	a,(OFST+1,sp)
5192  0008 43            	cpl	a
5193  0009 c75286        	ld	21126,a
5194                     ; 1631 }
5197  000c 85            	popw	x
5198  000d 81            	ret	
5262                     ; 1644 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
5262                     ; 1645 {
5263                     .text:	section	.text,new
5264  0000               _TIM3_GetITStatus:
5266  0000 88            	push	a
5267  0001 5203          	subw	sp,#3
5268       00000003      OFST:	set	3
5271                     ; 1646   __IO ITStatus bitstatus = RESET;
5273  0003 0f03          	clr	(OFST+0,sp)
5275                     ; 1648   __IO uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
5277  0005 0f01          	clr	(OFST-2,sp)
5281  0007 0f02          	clr	(OFST-1,sp)
5283                     ; 1651   assert_param(IS_TIM3_GET_IT(TIM3_IT));
5285                     ; 1653   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
5287  0009 c45285        	and	a,21125
5288  000c 6b01          	ld	(OFST-2,sp),a
5290                     ; 1655   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
5292  000e c65284        	ld	a,21124
5293  0011 1404          	and	a,(OFST+1,sp)
5294  0013 6b02          	ld	(OFST-1,sp),a
5296                     ; 1657   if ((TIM3_itStatus != (uint8_t)RESET) && (TIM3_itEnable != (uint8_t)RESET))
5298  0015 0d01          	tnz	(OFST-2,sp)
5299  0017 270a          	jreq	L7262
5301  0019 0d02          	tnz	(OFST-1,sp)
5302  001b 2706          	jreq	L7262
5303                     ; 1659     bitstatus = (ITStatus)SET;
5305  001d a601          	ld	a,#1
5306  001f 6b03          	ld	(OFST+0,sp),a
5309  0021 2002          	jra	L1362
5310  0023               L7262:
5311                     ; 1663     bitstatus = (ITStatus)RESET;
5313  0023 0f03          	clr	(OFST+0,sp)
5315  0025               L1362:
5316                     ; 1665   return ((ITStatus)bitstatus);
5318  0025 7b03          	ld	a,(OFST+0,sp)
5321  0027 5b04          	addw	sp,#4
5322  0029 81            	ret	
5358                     ; 1679 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
5358                     ; 1680 {
5359                     .text:	section	.text,new
5360  0000               _TIM3_ClearITPendingBit:
5364                     ; 1682   assert_param(IS_TIM3_IT(TIM3_IT));
5366                     ; 1685   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
5368  0000 43            	cpl	a
5369  0001 c75285        	ld	21125,a
5370                     ; 1686 }
5373  0004 81            	ret	
5445                     ; 1703 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5445                     ; 1704                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5445                     ; 1705                        uint8_t TIM3_ICFilter)
5445                     ; 1706 {
5446                     .text:	section	.text,new
5447  0000               L3_TI1_Config:
5449  0000 89            	pushw	x
5450  0001 89            	pushw	x
5451       00000002      OFST:	set	2
5454                     ; 1707   uint8_t tmpccmr1 = 0;
5456                     ; 1708   uint8_t tmpicpolarity = (uint8_t)TIM3_ICPolarity;
5458  0002 9e            	ld	a,xh
5459  0003 6b01          	ld	(OFST-1,sp),a
5461                     ; 1709   tmpccmr1 = TIM3->CCMR1;
5463  0005 c65288        	ld	a,21128
5464  0008 6b02          	ld	(OFST+0,sp),a
5466                     ; 1712   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5468                     ; 1713   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5470                     ; 1714   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5472                     ; 1717   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
5474  000a 7211528a      	bres	21130,#0
5475                     ; 1720   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5477  000e a40c          	and	a,#12
5478  0010 6b02          	ld	(OFST+0,sp),a
5480                     ; 1721   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5482  0012 7b07          	ld	a,(OFST+5,sp)
5483  0014 97            	ld	xl,a
5484  0015 a610          	ld	a,#16
5485  0017 42            	mul	x,a
5486  0018 9f            	ld	a,xl
5487  0019 1a04          	or	a,(OFST+2,sp)
5488  001b 1a02          	or	a,(OFST+0,sp)
5489  001d 6b02          	ld	(OFST+0,sp),a
5491                     ; 1723   TIM3->CCMR1 = tmpccmr1;
5493  001f c75288        	ld	21128,a
5494                     ; 1726   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
5496  0022 7b01          	ld	a,(OFST-1,sp)
5497  0024 4a            	dec	a
5498  0025 2606          	jrne	L7072
5499                     ; 1728     TIM3->CCER1 |= TIM_CCER1_CC1P;
5501  0027 7212528a      	bset	21130,#1
5503  002b 2004          	jra	L1172
5504  002d               L7072:
5505                     ; 1732     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5507  002d 7213528a      	bres	21130,#1
5508  0031               L1172:
5509                     ; 1736   TIM3->CCER1 |=  TIM_CCER1_CC1E;
5511  0031 7210528a      	bset	21130,#0
5512                     ; 1737 }
5515  0035 5b04          	addw	sp,#4
5516  0037 81            	ret	
5588                     ; 1754 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5588                     ; 1755                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5588                     ; 1756                        uint8_t TIM3_ICFilter)
5588                     ; 1757 {
5589                     .text:	section	.text,new
5590  0000               L5_TI2_Config:
5592  0000 89            	pushw	x
5593  0001 89            	pushw	x
5594       00000002      OFST:	set	2
5597                     ; 1758   uint8_t tmpccmr2 = 0;
5599                     ; 1759   uint8_t tmpicpolarity = (uint8_t)TIM3_ICPolarity;
5601  0002 9e            	ld	a,xh
5602  0003 6b01          	ld	(OFST-1,sp),a
5604                     ; 1762   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5606                     ; 1763   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5608                     ; 1764   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5610                     ; 1766   tmpccmr2 = TIM3->CCMR2;
5612  0005 c65289        	ld	a,21129
5613  0008 6b02          	ld	(OFST+0,sp),a
5615                     ; 1769   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
5617  000a 7219528a      	bres	21130,#4
5618                     ; 1772   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5620  000e a40c          	and	a,#12
5621  0010 6b02          	ld	(OFST+0,sp),a
5623                     ; 1773   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5625  0012 7b07          	ld	a,(OFST+5,sp)
5626  0014 97            	ld	xl,a
5627  0015 a610          	ld	a,#16
5628  0017 42            	mul	x,a
5629  0018 9f            	ld	a,xl
5630  0019 1a04          	or	a,(OFST+2,sp)
5631  001b 1a02          	or	a,(OFST+0,sp)
5632  001d 6b02          	ld	(OFST+0,sp),a
5634                     ; 1775   TIM3->CCMR2 = tmpccmr2;
5636  001f c75289        	ld	21129,a
5637                     ; 1778   if (tmpicpolarity == (uint8_t)TIM3_ICPolarity_Falling)
5639  0022 7b01          	ld	a,(OFST-1,sp)
5640  0024 4a            	dec	a
5641  0025 2606          	jrne	L1572
5642                     ; 1780     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5644  0027 721a528a      	bset	21130,#5
5646  002b 2004          	jra	L3572
5647  002d               L1572:
5648                     ; 1784     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5650  002d 721b528a      	bres	21130,#5
5651  0031               L3572:
5652                     ; 1788   TIM3->CCER1 |=  TIM_CCER1_CC2E;
5654  0031 7218528a      	bset	21130,#4
5655                     ; 1789 }
5658  0035 5b04          	addw	sp,#4
5659  0037 81            	ret	
5683                     ; 1797 FunctionalState TIM3_GetStatus(void)
5683                     ; 1798 {
5684                     .text:	section	.text,new
5685  0000               _TIM3_GetStatus:
5689                     ; 1799   return ((FunctionalState)(TIM3->CR1 & TIM_CR1_CEN));
5691  0000 c65280        	ld	a,21120
5692  0003 a401          	and	a,#1
5695  0005 81            	ret	
5708                     	xdef	_TIM3_ClearITPendingBit
5709                     	xdef	_TIM3_GetITStatus
5710                     	xdef	_TIM3_ClearFlag
5711                     	xdef	_TIM3_GetFlagStatus
5712                     	xdef	_TIM3_GetPrescaler
5713                     	xdef	_TIM3_GetCounter
5714                     	xdef	_TIM3_GetCapture2
5715                     	xdef	_TIM3_GetCapture1
5716                     	xdef	_TIM3_SetIC2Prescaler
5717                     	xdef	_TIM3_SetIC1Prescaler
5718                     	xdef	_TIM3_SetCompare2
5719                     	xdef	_TIM3_SetCompare1
5720                     	xdef	_TIM3_SetAutoreload
5721                     	xdef	_TIM3_SetCounter
5722                     	xdef	_TIM3_SelectOCxM
5723                     	xdef	_TIM3_CCxCmd
5724                     	xdef	_TIM3_OC2PolarityConfig
5725                     	xdef	_TIM3_OC1PolarityConfig
5726                     	xdef	_TIM3_GenerateEvent
5727                     	xdef	_TIM3_OC2FastCmd
5728                     	xdef	_TIM3_OC1FastCmd
5729                     	xdef	_TIM3_OC2PreloadConfig
5730                     	xdef	_TIM3_OC1PreloadConfig
5731                     	xdef	_TIM3_ARRPreloadConfig
5732                     	xdef	_TIM3_ForcedOC2Config
5733                     	xdef	_TIM3_ForcedOC1Config
5734                     	xdef	_TIM3_CounterModeConfig
5735                     	xdef	_TIM3_PrescalerConfig
5736                     	xdef	_TIM3_EncoderInterfaceConfig
5737                     	xdef	_TIM3_SelectMasterSlaveMode
5738                     	xdef	_TIM3_SelectSlaveMode
5739                     	xdef	_TIM3_SelectOutputTrigger
5740                     	xdef	_TIM3_SelectOnePulseMode
5741                     	xdef	_TIM3_SelectHallSensor
5742                     	xdef	_TIM3_UpdateRequestConfig
5743                     	xdef	_TIM3_UpdateDisableConfig
5744                     	xdef	_TIM3_SelectInputTrigger
5745                     	xdef	_TIM3_TIxExternalClockConfig
5746                     	xdef	_TIM3_ETRConfig
5747                     	xdef	_TIM3_ETRClockMode2Config
5748                     	xdef	_TIM3_ETRClockMode1Config
5749                     	xdef	_TIM3_InternalClockConfig
5750                     	xdef	_TIM3_ITConfig
5751                     	xdef	_TIM3_CtrlPWMOutputs
5752                     	xdef	_TIM3_GetStatus
5753                     	xdef	_TIM3_Cmd
5754                     	xdef	_TIM3_PWMIConfig
5755                     	xdef	_TIM3_ICInit
5756                     	xdef	_TIM3_BKRConfig
5757                     	xdef	_TIM3_OC2Init
5758                     	xdef	_TIM3_OC1Init
5759                     	xdef	_TIM3_TimeBaseInit
5760                     	xdef	_TIM3_DeInit
5779                     	end
