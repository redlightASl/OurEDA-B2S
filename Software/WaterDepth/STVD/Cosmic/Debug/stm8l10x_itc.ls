   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  48                     ; 57 uint8_t ITC_GetCPUCC(void)
  48                     ; 58 {
  50                     .text:	section	.text,new
  51  0000               _ITC_GetCPUCC:
  55                     ; 60   _asm("push cc");
  58  0000 8a            	push	cc
  60                     ; 61   _asm("pop a");
  63  0001 84            	pop	a
  65                     ; 62   return; /* Ignore compiler warning, the returned value is in A register */
  68  0002 81            	ret	
  91                     ; 76 void ITC_DeInit(void)
  91                     ; 77 {
  92                     .text:	section	.text,new
  93  0000               _ITC_DeInit:
  97                     ; 78   ITC->ISPR1 = ITC_SPR1_RESET_VALUE;
  99  0000 35ff7f70      	mov	32624,#255
 100                     ; 79   ITC->ISPR2 = ITC_SPR2_RESET_VALUE;
 102  0004 35ff7f71      	mov	32625,#255
 103                     ; 80   ITC->ISPR3 = ITC_SPR3_RESET_VALUE;
 105  0008 35ff7f72      	mov	32626,#255
 106                     ; 81   ITC->ISPR4 = ITC_SPR4_RESET_VALUE;
 108  000c 35ff7f73      	mov	32627,#255
 109                     ; 82   ITC->ISPR5 = ITC_SPR5_RESET_VALUE;
 111  0010 35ff7f74      	mov	32628,#255
 112                     ; 83   ITC->ISPR6 = ITC_SPR6_RESET_VALUE;
 114  0014 35ff7f75      	mov	32629,#255
 115                     ; 84   ITC->ISPR7 = ITC_SPR7_RESET_VALUE;
 117  0018 35ff7f76      	mov	32630,#255
 118                     ; 85   ITC->ISPR8 = ITC_SPR8_RESET_VALUE;
 120  001c 35ff7f77      	mov	32631,#255
 121                     ; 86 }
 124  0020 81            	ret	
 149                     ; 93 uint8_t ITC_GetSoftIntStatus(void)
 149                     ; 94 {
 150                     .text:	section	.text,new
 151  0000               _ITC_GetSoftIntStatus:
 155                     ; 95   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 157  0000 cd0000        	call	_ITC_GetCPUCC
 159  0003 a428          	and	a,#40
 162  0005 81            	ret	
 417                     .const:	section	.text
 418  0000               L42:
 419  0000 0022          	dc.w	L14
 420  0002 004c          	dc.w	L702
 421  0004 004c          	dc.w	L702
 422  0006 0027          	dc.w	L34
 423  0008 004c          	dc.w	L702
 424  000a 0027          	dc.w	L34
 425  000c 0027          	dc.w	L34
 426  000e 002c          	dc.w	L54
 427  0010 002c          	dc.w	L54
 428  0012 002c          	dc.w	L54
 429  0014 002c          	dc.w	L54
 430  0016 0031          	dc.w	L74
 431  0018 0031          	dc.w	L74
 432  001a 0031          	dc.w	L74
 433  001c 0031          	dc.w	L74
 434  001e 004c          	dc.w	L702
 435  0020 004c          	dc.w	L702
 436  0022 0036          	dc.w	L15
 437  0024 0036          	dc.w	L15
 438  0026 003b          	dc.w	L35
 439  0028 003b          	dc.w	L35
 440  002a 003b          	dc.w	L35
 441  002c 004c          	dc.w	L702
 442  002e 004c          	dc.w	L702
 443  0030 0040          	dc.w	L55
 444  0032 0040          	dc.w	L55
 445  0034 0040          	dc.w	L55
 446  0036 0045          	dc.w	L75
 447  0038 0045          	dc.w	L75
 448                     ; 126 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 448                     ; 127 {
 449                     .text:	section	.text,new
 450  0000               _ITC_GetSoftwarePriority:
 452  0000 88            	push	a
 453  0001 89            	pushw	x
 454       00000002      OFST:	set	2
 457                     ; 128   uint8_t Value = 0;
 459  0002 0f02          	clr	(OFST+0,sp)
 461                     ; 129   uint8_t Mask = 0;
 463                     ; 132   assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 465                     ; 135   Mask = (uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U));
 467  0004 a403          	and	a,#3
 468  0006 48            	sll	a
 469  0007 5f            	clrw	x
 470  0008 97            	ld	xl,a
 471  0009 a603          	ld	a,#3
 472  000b 5d            	tnzw	x
 473  000c 2704          	jreq	L61
 474  000e               L02:
 475  000e 48            	sll	a
 476  000f 5a            	decw	x
 477  0010 26fc          	jrne	L02
 478  0012               L61:
 479  0012 6b01          	ld	(OFST-1,sp),a
 481                     ; 137   switch (IRQn)
 483  0014 7b03          	ld	a,(OFST+1,sp)
 485                     ; 185     default:
 485                     ; 186       break;
 486  0016 4a            	dec	a
 487  0017 a11d          	cp	a,#29
 488  0019 2431          	jruge	L702
 489  001b 5f            	clrw	x
 490  001c 97            	ld	xl,a
 491  001d 58            	sllw	x
 492  001e de0000        	ldw	x,(L42,x)
 493  0021 fc            	jp	(x)
 494  0022               L14:
 495                     ; 139     case FLASH_IRQn:
 495                     ; 140       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 497  0022 c67f70        	ld	a,32624
 498                     ; 141       break;
 500  0025 2021          	jp	LC001
 501  0027               L34:
 502                     ; 143     case AWU_IRQn:
 502                     ; 144     case EXTIB_IRQn:
 502                     ; 145     case EXTID_IRQn:
 502                     ; 146       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 504  0027 c67f71        	ld	a,32625
 505                     ; 147       break;
 507  002a 201c          	jp	LC001
 508  002c               L54:
 509                     ; 149     case EXTI0_IRQn:
 509                     ; 150     case EXTI1_IRQn:
 509                     ; 151     case EXTI2_IRQn:
 509                     ; 152     case EXTI3_IRQn:
 509                     ; 153       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 511  002c c67f72        	ld	a,32626
 512                     ; 154       break;
 514  002f 2017          	jp	LC001
 515  0031               L74:
 516                     ; 156     case EXTI4_IRQn:
 516                     ; 157     case EXTI5_IRQn:
 516                     ; 158     case EXTI6_IRQn:
 516                     ; 159     case EXTI7_IRQn:
 516                     ; 160       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 518  0031 c67f73        	ld	a,32627
 519                     ; 161       break;
 521  0034 2012          	jp	LC001
 522  0036               L15:
 523                     ; 163     case COMP_IRQn:
 523                     ; 164     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 523                     ; 165       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 525  0036 c67f74        	ld	a,32628
 526                     ; 166       break;
 528  0039 200d          	jp	LC001
 529  003b               L35:
 530                     ; 168     case TIM2_CAP_IRQn:
 530                     ; 169     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 530                     ; 170     case TIM3_CAP_IRQn:
 530                     ; 171       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 532  003b c67f75        	ld	a,32629
 533                     ; 172       break;
 535  003e 2008          	jp	LC001
 536  0040               L55:
 537                     ; 174     case TIM4_UPD_OVF_IRQn:
 537                     ; 175     case SPI_IRQn:
 537                     ; 176     case USART_TX_IRQn:
 537                     ; 177       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 539  0040 c67f76        	ld	a,32630
 540                     ; 178       break;
 542  0043 2003          	jp	LC001
 543  0045               L75:
 544                     ; 180     case USART_RX_IRQn:
 544                     ; 181     case I2C_IRQn:
 544                     ; 182       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 546  0045 c67f77        	ld	a,32631
 547  0048               LC001:
 548  0048 1401          	and	a,(OFST-1,sp)
 549  004a 6b02          	ld	(OFST+0,sp),a
 551                     ; 183       break;
 553                     ; 185     default:
 553                     ; 186       break;
 555  004c               L702:
 556                     ; 189   Value >>= (uint8_t)(((uint8_t)IRQn % 4u) * 2u);
 558  004c 7b03          	ld	a,(OFST+1,sp)
 559  004e a403          	and	a,#3
 560  0050 48            	sll	a
 561  0051 5f            	clrw	x
 562  0052 97            	ld	xl,a
 563  0053 7b02          	ld	a,(OFST+0,sp)
 564  0055 5d            	tnzw	x
 565  0056 2704          	jreq	L62
 566  0058               L03:
 567  0058 44            	srl	a
 568  0059 5a            	decw	x
 569  005a 26fc          	jrne	L03
 570  005c               L62:
 572                     ; 191   return((ITC_PriorityLevel_TypeDef)Value);
 576  005c 5b03          	addw	sp,#3
 577  005e 81            	ret	
 641                     	switch	.const
 642  003a               L64:
 643  003a 0037          	dc.w	L112
 644  003c 00c5          	dc.w	L762
 645  003e 00c5          	dc.w	L762
 646  0040 0049          	dc.w	L312
 647  0042 00c5          	dc.w	L762
 648  0044 0049          	dc.w	L312
 649  0046 0049          	dc.w	L312
 650  0048 005b          	dc.w	L512
 651  004a 005b          	dc.w	L512
 652  004c 005b          	dc.w	L512
 653  004e 005b          	dc.w	L512
 654  0050 006d          	dc.w	L712
 655  0052 006d          	dc.w	L712
 656  0054 006d          	dc.w	L712
 657  0056 006d          	dc.w	L712
 658  0058 00c5          	dc.w	L762
 659  005a 00c5          	dc.w	L762
 660  005c 007f          	dc.w	L122
 661  005e 007f          	dc.w	L122
 662  0060 0091          	dc.w	L322
 663  0062 0091          	dc.w	L322
 664  0064 0091          	dc.w	L322
 665  0066 00c5          	dc.w	L762
 666  0068 00c5          	dc.w	L762
 667  006a 00a3          	dc.w	L522
 668  006c 00a3          	dc.w	L522
 669  006e 00a3          	dc.w	L522
 670  0070 00b5          	dc.w	L722
 671  0072 00b5          	dc.w	L722
 672                     ; 234 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 672                     ; 235 {
 673                     .text:	section	.text,new
 674  0000               _ITC_SetSoftwarePriority:
 676  0000 89            	pushw	x
 677  0001 89            	pushw	x
 678       00000002      OFST:	set	2
 681                     ; 236   uint8_t Mask = 0;
 683                     ; 237   uint8_t NewPriority = 0;
 685                     ; 240   assert_param(IS_ITC_IRQ((uint8_t)IRQn));
 687                     ; 241   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 689                     ; 244   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 691                     ; 248   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IRQn % 4U) * 2U)));
 693  0002 9e            	ld	a,xh
 694  0003 a403          	and	a,#3
 695  0005 48            	sll	a
 696  0006 5f            	clrw	x
 697  0007 97            	ld	xl,a
 698  0008 a603          	ld	a,#3
 699  000a 5d            	tnzw	x
 700  000b 2704          	jreq	L43
 701  000d               L63:
 702  000d 48            	sll	a
 703  000e 5a            	decw	x
 704  000f 26fc          	jrne	L63
 705  0011               L43:
 706  0011 43            	cpl	a
 707  0012 6b01          	ld	(OFST-1,sp),a
 709                     ; 251   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << (((uint8_t)IRQn % 4U) * 2U));
 711  0014 7b03          	ld	a,(OFST+1,sp)
 712  0016 a403          	and	a,#3
 713  0018 48            	sll	a
 714  0019 5f            	clrw	x
 715  001a 97            	ld	xl,a
 716  001b 7b04          	ld	a,(OFST+2,sp)
 717  001d 5d            	tnzw	x
 718  001e 2704          	jreq	L04
 719  0020               L24:
 720  0020 48            	sll	a
 721  0021 5a            	decw	x
 722  0022 26fc          	jrne	L24
 723  0024               L04:
 724  0024 6b02          	ld	(OFST+0,sp),a
 726                     ; 253   switch (IRQn)
 728  0026 7b03          	ld	a,(OFST+1,sp)
 730                     ; 309     default:
 730                     ; 310       break;
 731  0028 4a            	dec	a
 732  0029 a11d          	cp	a,#29
 733  002b 2503cc00c5    	jruge	L762
 734  0030 5f            	clrw	x
 735  0031 97            	ld	xl,a
 736  0032 58            	sllw	x
 737  0033 de003a        	ldw	x,(L64,x)
 738  0036 fc            	jp	(x)
 739  0037               L112:
 740                     ; 255     case FLASH_IRQn:
 740                     ; 256       ITC->ISPR1 &= Mask;
 742  0037 c67f70        	ld	a,32624
 743  003a 1401          	and	a,(OFST-1,sp)
 744  003c c77f70        	ld	32624,a
 745                     ; 257       ITC->ISPR1 |= NewPriority;
 747  003f c67f70        	ld	a,32624
 748  0042 1a02          	or	a,(OFST+0,sp)
 749  0044 c77f70        	ld	32624,a
 750                     ; 258       break;
 752  0047 207c          	jra	L762
 753  0049               L312:
 754                     ; 260     case AWU_IRQn:
 754                     ; 261     case EXTIB_IRQn:
 754                     ; 262     case EXTID_IRQn:
 754                     ; 263       ITC->ISPR2 &= Mask;
 756  0049 c67f71        	ld	a,32625
 757  004c 1401          	and	a,(OFST-1,sp)
 758  004e c77f71        	ld	32625,a
 759                     ; 264       ITC->ISPR2 |= NewPriority;
 761  0051 c67f71        	ld	a,32625
 762  0054 1a02          	or	a,(OFST+0,sp)
 763  0056 c77f71        	ld	32625,a
 764                     ; 265       break;
 766  0059 206a          	jra	L762
 767  005b               L512:
 768                     ; 267     case EXTI0_IRQn:
 768                     ; 268     case EXTI1_IRQn:
 768                     ; 269     case EXTI2_IRQn:
 768                     ; 270     case EXTI3_IRQn:
 768                     ; 271       ITC->ISPR3 &= Mask;
 770  005b c67f72        	ld	a,32626
 771  005e 1401          	and	a,(OFST-1,sp)
 772  0060 c77f72        	ld	32626,a
 773                     ; 272       ITC->ISPR3 |= NewPriority;
 775  0063 c67f72        	ld	a,32626
 776  0066 1a02          	or	a,(OFST+0,sp)
 777  0068 c77f72        	ld	32626,a
 778                     ; 273       break;
 780  006b 2058          	jra	L762
 781  006d               L712:
 782                     ; 275     case EXTI4_IRQn:
 782                     ; 276     case EXTI5_IRQn:
 782                     ; 277     case EXTI6_IRQn:
 782                     ; 278     case EXTI7_IRQn:
 782                     ; 279       ITC->ISPR4 &= Mask;
 784  006d c67f73        	ld	a,32627
 785  0070 1401          	and	a,(OFST-1,sp)
 786  0072 c77f73        	ld	32627,a
 787                     ; 280       ITC->ISPR4 |= NewPriority;
 789  0075 c67f73        	ld	a,32627
 790  0078 1a02          	or	a,(OFST+0,sp)
 791  007a c77f73        	ld	32627,a
 792                     ; 281       break;
 794  007d 2046          	jra	L762
 795  007f               L122:
 796                     ; 283     case COMP_IRQn:
 796                     ; 284     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 796                     ; 285       ITC->ISPR5 &= Mask;
 798  007f c67f74        	ld	a,32628
 799  0082 1401          	and	a,(OFST-1,sp)
 800  0084 c77f74        	ld	32628,a
 801                     ; 286       ITC->ISPR5 |= NewPriority;
 803  0087 c67f74        	ld	a,32628
 804  008a 1a02          	or	a,(OFST+0,sp)
 805  008c c77f74        	ld	32628,a
 806                     ; 287       break;
 808  008f 2034          	jra	L762
 809  0091               L322:
 810                     ; 289     case TIM2_CAP_IRQn:
 810                     ; 290     case TIM3_UPD_OVF_TRG_BRK_IRQn:
 810                     ; 291     case TIM3_CAP_IRQn:
 810                     ; 292       ITC->ISPR6 &= Mask;
 812  0091 c67f75        	ld	a,32629
 813  0094 1401          	and	a,(OFST-1,sp)
 814  0096 c77f75        	ld	32629,a
 815                     ; 293       ITC->ISPR6 |= NewPriority;
 817  0099 c67f75        	ld	a,32629
 818  009c 1a02          	or	a,(OFST+0,sp)
 819  009e c77f75        	ld	32629,a
 820                     ; 294       break;
 822  00a1 2022          	jra	L762
 823  00a3               L522:
 824                     ; 296     case TIM4_UPD_OVF_IRQn:
 824                     ; 297     case SPI_IRQn:
 824                     ; 298     case USART_TX_IRQn:
 824                     ; 299       ITC->ISPR7 &= Mask;
 826  00a3 c67f76        	ld	a,32630
 827  00a6 1401          	and	a,(OFST-1,sp)
 828  00a8 c77f76        	ld	32630,a
 829                     ; 300       ITC->ISPR7 |= NewPriority;
 831  00ab c67f76        	ld	a,32630
 832  00ae 1a02          	or	a,(OFST+0,sp)
 833  00b0 c77f76        	ld	32630,a
 834                     ; 301       break;
 836  00b3 2010          	jra	L762
 837  00b5               L722:
 838                     ; 303     case USART_RX_IRQn:
 838                     ; 304     case I2C_IRQn:
 838                     ; 305       ITC->ISPR8 &= Mask;
 840  00b5 c67f77        	ld	a,32631
 841  00b8 1401          	and	a,(OFST-1,sp)
 842  00ba c77f77        	ld	32631,a
 843                     ; 306       ITC->ISPR8 |= NewPriority;
 845  00bd c67f77        	ld	a,32631
 846  00c0 1a02          	or	a,(OFST+0,sp)
 847  00c2 c77f77        	ld	32631,a
 848                     ; 307       break;
 850                     ; 309     default:
 850                     ; 310       break;
 852  00c5               L762:
 853                     ; 312 }
 856  00c5 5b04          	addw	sp,#4
 857  00c7 81            	ret	
 870                     	xdef	_ITC_SetSoftwarePriority
 871                     	xdef	_ITC_GetSoftwarePriority
 872                     	xdef	_ITC_GetSoftIntStatus
 873                     	xdef	_ITC_DeInit
 874                     	xdef	_ITC_GetCPUCC
 893                     	end
