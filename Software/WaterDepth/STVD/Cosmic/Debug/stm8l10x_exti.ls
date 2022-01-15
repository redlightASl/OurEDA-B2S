   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  48                     ; 55 void EXTI_DeInit(void)
  48                     ; 56 {
  50                     .text:	section	.text,new
  51  0000               _EXTI_DeInit:
  55                     ; 57   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  57  0000 725f50a0      	clr	20640
  58                     ; 58   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  60  0004 725f50a1      	clr	20641
  61                     ; 59   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  63  0008 725f50a2      	clr	20642
  64                     ; 60   EXTI->SR1 = EXTI_SR1_RESET_VALUE;
  66  000c 725f50a3      	clr	20643
  67                     ; 61   EXTI->SR2 = EXTI_SR2_RESET_VALUE;
  69  0010 725f50a4      	clr	20644
  70                     ; 62   EXTI->CONF = EXTI_CONF_RESET_VALUE;
  72  0014 725f50a5      	clr	20645
  73                     ; 63 }
  76  0018 81            	ret	
 180                     ; 84 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 180                     ; 85                              EXTI_Trigger_TypeDef EXTI_TriggerValue)
 180                     ; 86 {
 181                     .text:	section	.text,new
 182  0000               _EXTI_SetPortSensitivity:
 184  0000 89            	pushw	x
 185       00000000      OFST:	set	0
 188                     ; 89   assert_param(IS_EXTI_PORT(EXTI_Port));
 190                     ; 90   assert_param(IS_EXTI_Trigger_VALUE(EXTI_TriggerValue));
 192                     ; 93   if (EXTI_Port != EXTI_Port_B)
 194  0001 9e            	ld	a,xh
 195  0002 4d            	tnz	a
 196  0003 2707          	jreq	L76
 197                     ; 95     EXTI->CR3 &= (uint8_t)(~EXTI_CR3_PDIS);
 199  0005 c650a2        	ld	a,20642
 200  0008 a4f3          	and	a,#243
 202  000a 2005          	jra	L17
 203  000c               L76:
 204                     ; 99     EXTI->CR3 &= (uint8_t)(~EXTI_CR3_PBIS);
 206  000c c650a2        	ld	a,20642
 207  000f a4fc          	and	a,#252
 208  0011               L17:
 209  0011 c750a2        	ld	20642,a
 210                     ; 103   EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_Port);
 212  0014 7b01          	ld	a,(OFST+1,sp)
 213  0016 5f            	clrw	x
 214  0017 97            	ld	xl,a
 215  0018 7b02          	ld	a,(OFST+2,sp)
 216  001a 5d            	tnzw	x
 217  001b 2704          	jreq	L01
 218  001d               L21:
 219  001d 48            	sll	a
 220  001e 5a            	decw	x
 221  001f 26fc          	jrne	L21
 222  0021               L01:
 223  0021 ca50a2        	or	a,20642
 224  0024 c750a2        	ld	20642,a
 225                     ; 105 }
 228  0027 85            	popw	x
 229  0028 81            	ret	
 337                     ; 132 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_PinNum,
 337                     ; 133                             EXTI_Trigger_TypeDef EXTI_TriggerValue)
 337                     ; 134 {
 338                     .text:	section	.text,new
 339  0000               _EXTI_SetPinSensitivity:
 341  0000 89            	pushw	x
 342       00000000      OFST:	set	0
 345                     ; 137   assert_param(IS_EXTI_PINNUM(EXTI_PinNum));
 347                     ; 138   assert_param(IS_EXTI_Trigger_VALUE(EXTI_TriggerValue));
 349                     ; 141   switch (EXTI_PinNum)
 351  0001 9e            	ld	a,xh
 353                     ; 175     default:
 353                     ; 176       break;
 354  0002 4d            	tnz	a
 355  0003 2728          	jreq	L37
 356  0005 a002          	sub	a,#2
 357  0007 273b          	jreq	L57
 358  0009 a002          	sub	a,#2
 359  000b 274e          	jreq	L77
 360  000d a002          	sub	a,#2
 361  000f 2761          	jreq	L101
 362  0011 a00a          	sub	a,#10
 363  0013 277a          	jreq	L301
 364  0015 a002          	sub	a,#2
 365  0017 2603cc00a6    	jreq	L501
 366  001c a002          	sub	a,#2
 367  001e 2603cc00bd    	jreq	L701
 368  0023 a002          	sub	a,#2
 369  0025 2603cc00d4    	jreq	L111
 370  002a cc00ef        	jra	L561
 371  002d               L37:
 372                     ; 143     case EXTI_Pin_0:
 372                     ; 144       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P0IS);
 374  002d c650a0        	ld	a,20640
 375  0030 a4fc          	and	a,#252
 376  0032 c750a0        	ld	20640,a
 377                     ; 145       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 379  0035 7b01          	ld	a,(OFST+1,sp)
 380  0037 5f            	clrw	x
 381  0038 97            	ld	xl,a
 382  0039 7b02          	ld	a,(OFST+2,sp)
 383  003b 5d            	tnzw	x
 384  003c 2749          	jreq	L23
 385  003e               L02:
 386  003e 48            	sll	a
 387  003f 5a            	decw	x
 388  0040 26fc          	jrne	L02
 389                     ; 146       break;
 391  0042 2043          	jp	L23
 392  0044               L57:
 393                     ; 147     case EXTI_Pin_1:
 393                     ; 148       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P1IS);
 395  0044 c650a0        	ld	a,20640
 396  0047 a4f3          	and	a,#243
 397  0049 c750a0        	ld	20640,a
 398                     ; 149       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 400  004c 7b01          	ld	a,(OFST+1,sp)
 401  004e 5f            	clrw	x
 402  004f 97            	ld	xl,a
 403  0050 7b02          	ld	a,(OFST+2,sp)
 404  0052 5d            	tnzw	x
 405  0053 2732          	jreq	L23
 406  0055               L42:
 407  0055 48            	sll	a
 408  0056 5a            	decw	x
 409  0057 26fc          	jrne	L42
 410                     ; 150       break;
 412  0059 202c          	jp	L23
 413  005b               L77:
 414                     ; 151     case EXTI_Pin_2:
 414                     ; 152       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P2IS);
 416  005b c650a0        	ld	a,20640
 417  005e a4cf          	and	a,#207
 418  0060 c750a0        	ld	20640,a
 419                     ; 153       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 421  0063 7b01          	ld	a,(OFST+1,sp)
 422  0065 5f            	clrw	x
 423  0066 97            	ld	xl,a
 424  0067 7b02          	ld	a,(OFST+2,sp)
 425  0069 5d            	tnzw	x
 426  006a 271b          	jreq	L23
 427  006c               L03:
 428  006c 48            	sll	a
 429  006d 5a            	decw	x
 430  006e 26fc          	jrne	L03
 431                     ; 154       break;
 433  0070 2015          	jp	L23
 434  0072               L101:
 435                     ; 155     case EXTI_Pin_3:
 435                     ; 156       EXTI->CR1 &= (uint8_t)(~EXTI_CR1_P3IS);
 437  0072 c650a0        	ld	a,20640
 438  0075 a43f          	and	a,#63
 439  0077 c750a0        	ld	20640,a
 440                     ; 157       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << (uint8_t)EXTI_PinNum);
 442  007a 7b01          	ld	a,(OFST+1,sp)
 443  007c 5f            	clrw	x
 444  007d 97            	ld	xl,a
 445  007e 7b02          	ld	a,(OFST+2,sp)
 446  0080 5d            	tnzw	x
 447  0081 2704          	jreq	L23
 448  0083               L43:
 449  0083 48            	sll	a
 450  0084 5a            	decw	x
 451  0085 26fc          	jrne	L43
 452  0087               L23:
 453  0087 ca50a0        	or	a,20640
 454  008a c750a0        	ld	20640,a
 455                     ; 158       break;
 457  008d 2060          	jra	L561
 458  008f               L301:
 459                     ; 159     case EXTI_Pin_4:
 459                     ; 160       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P4IS);
 461  008f c650a1        	ld	a,20641
 462  0092 a4fc          	and	a,#252
 463  0094 c750a1        	ld	20641,a
 464                     ; 161       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 466  0097 7b01          	ld	a,(OFST+1,sp)
 467  0099 ad56          	call	LC003
 468  009b 7b02          	ld	a,(OFST+2,sp)
 469  009d 5d            	tnzw	x
 470  009e 2749          	jreq	L25
 471  00a0               L04:
 472  00a0 48            	sll	a
 473  00a1 5a            	decw	x
 474  00a2 26fc          	jrne	L04
 475                     ; 162       break;
 477  00a4 2043          	jp	L25
 478  00a6               L501:
 479                     ; 163     case EXTI_Pin_5:
 479                     ; 164       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P5IS);
 481  00a6 c650a1        	ld	a,20641
 482  00a9 a4f3          	and	a,#243
 483  00ab c750a1        	ld	20641,a
 484                     ; 165       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 486  00ae 7b01          	ld	a,(OFST+1,sp)
 487  00b0 ad3f          	call	LC003
 488  00b2 7b02          	ld	a,(OFST+2,sp)
 489  00b4 5d            	tnzw	x
 490  00b5 2732          	jreq	L25
 491  00b7               L44:
 492  00b7 48            	sll	a
 493  00b8 5a            	decw	x
 494  00b9 26fc          	jrne	L44
 495                     ; 166       break;
 497  00bb 202c          	jp	L25
 498  00bd               L701:
 499                     ; 167     case EXTI_Pin_6:
 499                     ; 168       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P6IS);
 501  00bd c650a1        	ld	a,20641
 502  00c0 a4cf          	and	a,#207
 503  00c2 c750a1        	ld	20641,a
 504                     ; 169       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 506  00c5 7b01          	ld	a,(OFST+1,sp)
 507  00c7 ad28          	call	LC003
 508  00c9 7b02          	ld	a,(OFST+2,sp)
 509  00cb 5d            	tnzw	x
 510  00cc 271b          	jreq	L25
 511  00ce               L05:
 512  00ce 48            	sll	a
 513  00cf 5a            	decw	x
 514  00d0 26fc          	jrne	L05
 515                     ; 170       break;
 517  00d2 2015          	jp	L25
 518  00d4               L111:
 519                     ; 171     case EXTI_Pin_7:
 519                     ; 172       EXTI->CR2 &= (uint8_t)(~EXTI_CR2_P7IS);
 521  00d4 c650a1        	ld	a,20641
 522  00d7 a43f          	and	a,#63
 523  00d9 c750a1        	ld	20641,a
 524                     ; 173       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_TriggerValue) << ((uint8_t)EXTI_PinNum & (uint8_t)0xEF));
 526  00dc 7b01          	ld	a,(OFST+1,sp)
 527  00de ad11          	call	LC003
 528  00e0 7b02          	ld	a,(OFST+2,sp)
 529  00e2 5d            	tnzw	x
 530  00e3 2704          	jreq	L25
 531  00e5               L45:
 532  00e5 48            	sll	a
 533  00e6 5a            	decw	x
 534  00e7 26fc          	jrne	L45
 535  00e9               L25:
 536  00e9 ca50a1        	or	a,20641
 537  00ec c750a1        	ld	20641,a
 538                     ; 174       break;
 540                     ; 175     default:
 540                     ; 176       break;
 542  00ef               L561:
 543                     ; 178 }
 546  00ef 85            	popw	x
 547  00f0 81            	ret	
 548  00f1               LC003:
 549  00f1 a4ef          	and	a,#239
 550  00f3 5f            	clrw	x
 551  00f4 97            	ld	xl,a
 552  00f5 81            	ret	
 656                     ; 193 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 656                     ; 194                                FunctionalState NewState)
 656                     ; 195 {
 657                     .text:	section	.text,new
 658  0000               _EXTI_SetHalfPortSelection:
 660  0000 89            	pushw	x
 661       00000000      OFST:	set	0
 664                     ; 197   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 666                     ; 198   assert_param(IS_FUNCTIONAL_STATE(NewState));
 668                     ; 200   if (NewState != DISABLE)
 670  0001 9f            	ld	a,xl
 671  0002 4d            	tnz	a
 672  0003 2706          	jreq	L532
 673                     ; 202     EXTI->CONF |= (uint8_t)EXTI_HalfPort; /* Enable port interrupt selector */
 675  0005 9e            	ld	a,xh
 676  0006 ca50a5        	or	a,20645
 678  0009 2006          	jra	L732
 679  000b               L532:
 680                     ; 206     EXTI->CONF &= (uint8_t)(~(uint8_t)EXTI_HalfPort); /* Disable port interrupt selector */
 682  000b 7b01          	ld	a,(OFST+1,sp)
 683  000d 43            	cpl	a
 684  000e c450a5        	and	a,20645
 685  0011               L732:
 686  0011 c750a5        	ld	20645,a
 687                     ; 208 }
 690  0014 85            	popw	x
 691  0015 81            	ret	
 737                     ; 218 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
 737                     ; 219 {
 738                     .text:	section	.text,new
 739  0000               _EXTI_GetPortSensitivity:
 741       00000001      OFST:	set	1
 744                     ; 220   uint8_t value = 0;
 746                     ; 223   assert_param(IS_EXTI_PORT(EXTI_Port));
 748                     ; 225   if (EXTI_Port != EXTI_Port_B)
 750  0000 4d            	tnz	a
 751  0001 2707          	jreq	L362
 752                     ; 227     value = (uint8_t)((EXTI->CR3 & EXTI_CR3_PDIS) >> 2);
 754  0003 c650a2        	ld	a,20642
 755  0006 44            	srl	a
 756  0007 44            	srl	a
 758  0008 2003          	jra	L562
 759  000a               L362:
 760                     ; 231     value = (uint8_t)(EXTI->CR3 & EXTI_CR3_PBIS);
 762  000a c650a2        	ld	a,20642
 763  000d               L562:
 764  000d a403          	and	a,#3
 766                     ; 233   return((EXTI_Trigger_TypeDef)value);
 770  000f 81            	ret	
 816                     ; 250 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_PinNum)
 816                     ; 251 {
 817                     .text:	section	.text,new
 818  0000               _EXTI_GetPinSensitivity:
 820  0000 88            	push	a
 821       00000001      OFST:	set	1
 824                     ; 252   uint8_t value = 0;
 826  0001 0f01          	clr	(OFST+0,sp)
 828                     ; 255   assert_param(IS_EXTI_PINNUM(EXTI_PinNum));
 830                     ; 257   switch (EXTI_PinNum)
 833                     ; 283     default:
 833                     ; 284       break;
 834  0003 4d            	tnz	a
 835  0004 2720          	jreq	L762
 836  0006 a002          	sub	a,#2
 837  0008 2721          	jreq	L172
 838  000a a002          	sub	a,#2
 839  000c 2722          	jreq	L372
 840  000e a002          	sub	a,#2
 841  0010 2724          	jreq	L572
 842  0012 a00a          	sub	a,#10
 843  0014 2725          	jreq	L772
 844  0016 a002          	sub	a,#2
 845  0018 2726          	jreq	L103
 846  001a a002          	sub	a,#2
 847  001c 2727          	jreq	L303
 848  001e a002          	sub	a,#2
 849  0020 2729          	jreq	L503
 850  0022 7b01          	ld	a,(OFST+0,sp)
 851  0024 202d          	jra	L533
 852  0026               L762:
 853                     ; 259     case EXTI_Pin_0:
 853                     ; 260       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
 855  0026 c650a0        	ld	a,20640
 856                     ; 261       break;
 858  0029 2026          	jp	LC004
 859  002b               L172:
 860                     ; 262     case EXTI_Pin_1:
 860                     ; 263       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P1IS) >> (uint8_t)EXTI_Pin_1);
 862  002b c650a0        	ld	a,20640
 863                     ; 264       break;
 865  002e 201f          	jp	LC005
 866  0030               L372:
 867                     ; 265     case EXTI_Pin_2:
 867                     ; 266       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P2IS) >> (uint8_t)EXTI_Pin_2);
 869  0030 c650a0        	ld	a,20640
 870  0033 4e            	swap	a
 871                     ; 267       break;
 873  0034 201b          	jp	LC004
 874  0036               L572:
 875                     ; 268     case EXTI_Pin_3:
 875                     ; 269       value = (uint8_t)((EXTI->CR1 & EXTI_CR1_P3IS) >> (uint8_t)EXTI_Pin_3);
 877  0036 c650a0        	ld	a,20640
 878                     ; 270       break;
 880  0039 2013          	jp	LC006
 881  003b               L772:
 882                     ; 271     case EXTI_Pin_4:
 882                     ; 272       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
 884  003b c650a1        	ld	a,20641
 885                     ; 273       break;
 887  003e 2011          	jp	LC004
 888  0040               L103:
 889                     ; 274     case EXTI_Pin_5:
 889                     ; 275       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
 891  0040 c650a1        	ld	a,20641
 892                     ; 276       break;
 894  0043 200a          	jp	LC005
 895  0045               L303:
 896                     ; 277     case EXTI_Pin_6:
 896                     ; 278       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
 898  0045 c650a1        	ld	a,20641
 899  0048 4e            	swap	a
 900                     ; 279       break;
 902  0049 2006          	jp	LC004
 903  004b               L503:
 904                     ; 280     case EXTI_Pin_7:
 904                     ; 281       value = (uint8_t)((EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
 906  004b c650a1        	ld	a,20641
 907  004e               LC006:
 908  004e 4e            	swap	a
 909  004f               LC005:
 910  004f 44            	srl	a
 911  0050 44            	srl	a
 912  0051               LC004:
 913  0051 a403          	and	a,#3
 915                     ; 282       break;
 917                     ; 283     default:
 917                     ; 284       break;
 919  0053               L533:
 920                     ; 286   return((EXTI_Trigger_TypeDef)value);
 924  0053 5b01          	addw	sp,#1
 925  0055 81            	ret	
 972                     ; 299 FunctionalState EXTI_GetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort)
 972                     ; 300 {
 973                     .text:	section	.text,new
 974  0000               _EXTI_GetHalfPortSelection:
 976       00000001      OFST:	set	1
 979                     ; 301   FunctionalState value = DISABLE;
 981                     ; 303   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 983                     ; 304   if ((EXTI->CONF & (uint8_t)EXTI_HalfPort) != (uint8_t)DISABLE)
 985  0000 c450a5        	and	a,20645
 986  0003 2702          	jreq	L163
 987                     ; 306     value = ENABLE;
 989  0005 a601          	ld	a,#1
 992  0007               L163:
 993                     ; 310     value = DISABLE;
 996                     ; 313   return(value);
1000  0007 81            	ret	
1142                     ; 332 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1142                     ; 333 {
1143                     .text:	section	.text,new
1144  0000               _EXTI_GetITStatus:
1146  0000 88            	push	a
1147  0001 88            	push	a
1148       00000001      OFST:	set	1
1151                     ; 334   ITStatus status = RESET;
1153                     ; 336   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1155                     ; 338   if (((uint8_t)EXTI_IT & (uint8_t)0xF0) == 0xF0)
1157  0002 a4f0          	and	a,#240
1158  0004 a1f0          	cp	a,#240
1159  0006 2609          	jrne	L744
1160                     ; 340     status = (ITStatus)(EXTI->SR2 & ((uint8_t)EXTI_IT & (uint8_t)0x0F));
1162  0008 7b02          	ld	a,(OFST+1,sp)
1163  000a a40f          	and	a,#15
1164  000c c450a4        	and	a,20644
1167  000f 2005          	jra	L154
1168  0011               L744:
1169                     ; 344     status = (ITStatus)(EXTI->SR1 & (uint8_t)EXTI_IT);
1171  0011 c650a3        	ld	a,20643
1172  0014 1402          	and	a,(OFST+1,sp)
1174  0016               L154:
1175                     ; 346   return((ITStatus)status);
1179  0016 85            	popw	x
1180  0017 81            	ret	
1216                     ; 365 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1216                     ; 366 {
1217                     .text:	section	.text,new
1218  0000               _EXTI_ClearITPendingBit:
1220  0000 88            	push	a
1221       00000000      OFST:	set	0
1224                     ; 368   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1226                     ; 370   if (((uint8_t)EXTI_IT & (uint8_t)0xF0) == 0xF0)
1228  0001 a4f0          	and	a,#240
1229  0003 a1f0          	cp	a,#240
1230  0005 2609          	jrne	L174
1231                     ; 372     EXTI->SR2 = (uint8_t)((uint8_t)EXTI_IT & (uint8_t)0x0F);
1233  0007 7b01          	ld	a,(OFST+1,sp)
1234  0009 a40f          	and	a,#15
1235  000b c750a4        	ld	20644,a
1237  000e 2005          	jra	L374
1238  0010               L174:
1239                     ; 376     EXTI->SR1 = (uint8_t)EXTI_IT;
1241  0010 7b01          	ld	a,(OFST+1,sp)
1242  0012 c750a3        	ld	20643,a
1243  0015               L374:
1244                     ; 378 }
1247  0015 84            	pop	a
1248  0016 81            	ret	
1261                     	xdef	_EXTI_ClearITPendingBit
1262                     	xdef	_EXTI_GetITStatus
1263                     	xdef	_EXTI_GetHalfPortSelection
1264                     	xdef	_EXTI_GetPinSensitivity
1265                     	xdef	_EXTI_GetPortSensitivity
1266                     	xdef	_EXTI_SetHalfPortSelection
1267                     	xdef	_EXTI_SetPinSensitivity
1268                     	xdef	_EXTI_SetPortSensitivity
1269                     	xdef	_EXTI_DeInit
1288                     	end
