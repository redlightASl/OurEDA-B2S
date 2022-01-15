   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  48                     ; 56 void TIM4_DeInit(void)
  48                     ; 57 {
  50                     .text:	section	.text,new
  51  0000               _TIM4_DeInit:
  55                     ; 58   TIM4->CR1  = TIM4_CR1_RESET_VALUE;
  57  0000 725f52e0      	clr	21216
  58                     ; 59   TIM4->CR2  = TIM4_CR2_RESET_VALUE;
  60  0004 725f52e1      	clr	21217
  61                     ; 60   TIM4->SMCR  = TIM4_SMCR_RESET_VALUE;
  63  0008 725f52e2      	clr	21218
  64                     ; 61   TIM4->IER  = TIM4_IER_RESET_VALUE;
  66  000c 725f52e3      	clr	21219
  67                     ; 62   TIM4->CNTR  = TIM4_CNTR_RESET_VALUE;
  69  0010 725f52e6      	clr	21222
  70                     ; 63   TIM4->PSCR = TIM4_PSCR_RESET_VALUE;
  72  0014 725f52e7      	clr	21223
  73                     ; 64   TIM4->ARR  = TIM4_ARR_RESET_VALUE;
  75  0018 35ff52e8      	mov	21224,#255
  76                     ; 65   TIM4->SR1  = TIM4_SR1_RESET_VALUE;
  78  001c 725f52e4      	clr	21220
  79                     ; 66 }
  82  0020 81            	ret	
 250                     ; 91 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 250                     ; 92                        uint8_t TIM4_Period)
 250                     ; 93 {
 251                     .text:	section	.text,new
 252  0000               _TIM4_TimeBaseInit:
 256                     ; 95   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
 258                     ; 97   TIM4->ARR = (uint8_t)(TIM4_Period);
 260  0000 9f            	ld	a,xl
 261  0001 c752e8        	ld	21224,a
 262                     ; 99   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 264  0004 9e            	ld	a,xh
 265  0005 c752e7        	ld	21223,a
 266                     ; 100 }
 269  0008 81            	ret	
 324                     ; 108 void TIM4_Cmd(FunctionalState NewState)
 324                     ; 109 {
 325                     .text:	section	.text,new
 326  0000               _TIM4_Cmd:
 330                     ; 111   assert_param(IS_FUNCTIONAL_STATE(NewState));
 332                     ; 114   if (NewState != DISABLE)
 334  0000 4d            	tnz	a
 335  0001 2705          	jreq	L531
 336                     ; 116     TIM4->CR1 |= TIM4_CR1_CEN ;
 338  0003 721052e0      	bset	21216,#0
 341  0007 81            	ret	
 342  0008               L531:
 343                     ; 120     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 345  0008 721152e0      	bres	21216,#0
 346                     ; 122 }
 349  000c 81            	ret	
 414                     ; 134 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 414                     ; 135 {
 415                     .text:	section	.text,new
 416  0000               _TIM4_ITConfig:
 418  0000 89            	pushw	x
 419       00000000      OFST:	set	0
 422                     ; 137   assert_param(IS_TIM4_IT(TIM4_IT));
 424                     ; 138   assert_param(IS_FUNCTIONAL_STATE(NewState));
 426                     ; 140   if (NewState != DISABLE)
 428  0001 9f            	ld	a,xl
 429  0002 4d            	tnz	a
 430  0003 2706          	jreq	L371
 431                     ; 143     TIM4->IER |= (uint8_t)TIM4_IT;
 433  0005 9e            	ld	a,xh
 434  0006 ca52e3        	or	a,21219
 436  0009 2006          	jra	L571
 437  000b               L371:
 438                     ; 148     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 440  000b 7b01          	ld	a,(OFST+1,sp)
 441  000d 43            	cpl	a
 442  000e c452e3        	and	a,21219
 443  0011               L571:
 444  0011 c752e3        	ld	21219,a
 445                     ; 150 }
 448  0014 85            	popw	x
 449  0015 81            	ret	
 473                     ; 157 void TIM4_InternalClockConfig(void)
 473                     ; 158 {
 474                     .text:	section	.text,new
 475  0000               _TIM4_InternalClockConfig:
 479                     ; 160   TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_SMS);
 481  0000 c652e2        	ld	a,21218
 482  0003 a4f8          	and	a,#248
 483  0005 c752e2        	ld	21218,a
 484                     ; 161 }
 487  0008 81            	ret	
 555                     ; 171 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
 555                     ; 172 {
 556                     .text:	section	.text,new
 557  0000               _TIM4_SelectInputTrigger:
 559  0000 88            	push	a
 560  0001 88            	push	a
 561       00000001      OFST:	set	1
 564                     ; 173   uint8_t tmpsmcr = 0;
 566                     ; 176   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
 568                     ; 178   tmpsmcr = TIM4->SMCR;
 570  0002 c652e2        	ld	a,21218
 572                     ; 181   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
 574  0005 a48f          	and	a,#143
 576                     ; 182   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
 578  0007 1a02          	or	a,(OFST+1,sp)
 580                     ; 184   TIM4->SMCR = (uint8_t)tmpsmcr;
 582  0009 c752e2        	ld	21218,a
 583                     ; 185 }
 586  000c 85            	popw	x
 587  000d 81            	ret	
 623                     ; 193 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 623                     ; 194 {
 624                     .text:	section	.text,new
 625  0000               _TIM4_UpdateDisableConfig:
 629                     ; 196   assert_param(IS_FUNCTIONAL_STATE(NewState));
 631                     ; 199   if (NewState != DISABLE)
 633  0000 4d            	tnz	a
 634  0001 2705          	jreq	L752
 635                     ; 201     TIM4->CR1 |= TIM4_CR1_UDIS ;
 637  0003 721252e0      	bset	21216,#1
 640  0007 81            	ret	
 641  0008               L752:
 642                     ; 205     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 644  0008 721352e0      	bres	21216,#1
 645                     ; 207 }
 648  000c 81            	ret	
 706                     ; 217 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 706                     ; 218 {
 707                     .text:	section	.text,new
 708  0000               _TIM4_UpdateRequestConfig:
 712                     ; 220   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 714                     ; 223   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 716  0000 4a            	dec	a
 717  0001 2605          	jrne	L113
 718                     ; 225     TIM4->CR1 |= TIM4_CR1_URS ;
 720  0003 721452e0      	bset	21216,#2
 723  0007 81            	ret	
 724  0008               L113:
 725                     ; 229     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 727  0008 721552e0      	bres	21216,#2
 728                     ; 231 }
 731  000c 81            	ret	
 788                     ; 241 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 788                     ; 242 {
 789                     .text:	section	.text,new
 790  0000               _TIM4_SelectOnePulseMode:
 794                     ; 244   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 796                     ; 247   if (TIM4_OPMode == TIM4_OPMode_Single)
 798  0000 4a            	dec	a
 799  0001 2605          	jrne	L343
 800                     ; 249     TIM4->CR1 |= TIM4_CR1_OPM ;
 802  0003 721652e0      	bset	21216,#3
 805  0007 81            	ret	
 806  0008               L343:
 807                     ; 253     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 809  0008 721752e0      	bres	21216,#3
 810                     ; 256 }
 813  000c 81            	ret	
 888                     ; 267 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
 888                     ; 268 {
 889                     .text:	section	.text,new
 890  0000               _TIM4_SelectOutputTrigger:
 892  0000 88            	push	a
 893  0001 88            	push	a
 894       00000001      OFST:	set	1
 897                     ; 269   uint8_t tmpcr2 = 0;
 899                     ; 272   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
 901                     ; 274   tmpcr2 = TIM4->CR2;
 903  0002 c652e1        	ld	a,21217
 905                     ; 277   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
 907  0005 a48f          	and	a,#143
 909                     ; 280   tmpcr2 |= (uint8_t)TIM4_TRGOSource;
 911  0007 1a02          	or	a,(OFST+1,sp)
 913                     ; 282   TIM4->CR2 = tmpcr2;
 915  0009 c752e1        	ld	21217,a
 916                     ; 283 }
 919  000c 85            	popw	x
 920  000d 81            	ret	
1011                     ; 297 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1011                     ; 298 {
1012                     .text:	section	.text,new
1013  0000               _TIM4_SelectSlaveMode:
1015  0000 88            	push	a
1016  0001 88            	push	a
1017       00000001      OFST:	set	1
1020                     ; 299   uint8_t tmpsmcr = 0;
1022                     ; 302   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1024                     ; 304   tmpsmcr = TIM4->SMCR;
1026  0002 c652e2        	ld	a,21218
1028                     ; 307   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1030  0005 a4f8          	and	a,#248
1032                     ; 310   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1034  0007 1a02          	or	a,(OFST+1,sp)
1036                     ; 312   TIM4->SMCR = tmpsmcr;
1038  0009 c752e2        	ld	21218,a
1039                     ; 313 }
1042  000c 85            	popw	x
1043  000d 81            	ret	
1079                     ; 321 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1079                     ; 322 {
1080                     .text:	section	.text,new
1081  0000               _TIM4_SelectMasterSlaveMode:
1085                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1087                     ; 327   if (NewState != DISABLE)
1089  0000 4d            	tnz	a
1090  0001 2705          	jreq	L164
1091                     ; 329     TIM4->SMCR |= TIM4_SMCR_MSM;
1093  0003 721e52e2      	bset	21218,#7
1096  0007 81            	ret	
1097  0008               L164:
1098                     ; 333     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1100  0008 721f52e2      	bres	21218,#7
1101                     ; 335 }
1104  000c 81            	ret	
1172                     ; 363 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef TIM4_Prescaler,
1172                     ; 364                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
1172                     ; 365 {
1173                     .text:	section	.text,new
1174  0000               _TIM4_PrescalerConfig:
1178                     ; 367   assert_param(IS_TIM4_PRESCALER_RELOAD(TIM4_PSCReloadMode));
1180                     ; 368   assert_param(IS_TIM4_PRESCALER(TIM4_Prescaler));
1182                     ; 371   TIM4->PSCR = (uint8_t)TIM4_Prescaler;
1184  0000 9e            	ld	a,xh
1185  0001 c752e7        	ld	21223,a
1186                     ; 374   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
1188  0004 9f            	ld	a,xl
1189  0005 4a            	dec	a
1190  0006 2605          	jrne	L715
1191                     ; 376     TIM4->EGR |= TIM4_EGR_UG ;
1193  0008 721052e5      	bset	21221,#0
1196  000c 81            	ret	
1197  000d               L715:
1198                     ; 380     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
1200  000d 721152e5      	bres	21221,#0
1201                     ; 382 }
1204  0011 81            	ret	
1240                     ; 390 void TIM4_ARRPreloadConfig(FunctionalState NewState)
1240                     ; 391 {
1241                     .text:	section	.text,new
1242  0000               _TIM4_ARRPreloadConfig:
1246                     ; 393   assert_param(IS_FUNCTIONAL_STATE(NewState));
1248                     ; 396   if (NewState != DISABLE)
1250  0000 4d            	tnz	a
1251  0001 2705          	jreq	L145
1252                     ; 398     TIM4->CR1 |= TIM4_CR1_ARPE ;
1254  0003 721e52e0      	bset	21216,#7
1257  0007 81            	ret	
1258  0008               L145:
1259                     ; 402     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
1261  0008 721f52e0      	bres	21216,#7
1262                     ; 404 }
1265  000c 81            	ret	
1322                     ; 414 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1322                     ; 415 {
1323                     .text:	section	.text,new
1324  0000               _TIM4_GenerateEvent:
1328                     ; 417   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1330                     ; 420   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1332  0000 ca52e5        	or	a,21221
1333  0003 c752e5        	ld	21221,a
1334                     ; 421 }
1337  0006 81            	ret	
1371                     ; 429 void TIM4_SetCounter(uint8_t TIM4_Counter)
1371                     ; 430 {
1372                     .text:	section	.text,new
1373  0000               _TIM4_SetCounter:
1377                     ; 432   TIM4->CNTR = (uint8_t)(TIM4_Counter);
1379  0000 c752e6        	ld	21222,a
1380                     ; 433 }
1383  0003 81            	ret	
1417                     ; 441 void TIM4_SetAutoreload(uint8_t TIM4_Autoreload)
1417                     ; 442 {
1418                     .text:	section	.text,new
1419  0000               _TIM4_SetAutoreload:
1423                     ; 445   TIM4->ARR = (uint8_t)(TIM4_Autoreload);
1425  0000 c752e8        	ld	21224,a
1426                     ; 446 }
1429  0003 81            	ret	
1463                     ; 453 uint8_t TIM4_GetCounter(void)
1463                     ; 454 {
1464                     .text:	section	.text,new
1465  0000               _TIM4_GetCounter:
1467       00000001      OFST:	set	1
1470                     ; 455   uint8_t tmpcntr = 0;
1472                     ; 456   tmpcntr = TIM4->CNTR;
1474  0000 c652e6        	ld	a,21222
1476                     ; 458   return ((uint8_t)tmpcntr);
1480  0003 81            	ret	
1504                     ; 482 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
1504                     ; 483 {
1505                     .text:	section	.text,new
1506  0000               _TIM4_GetPrescaler:
1510                     ; 485   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
1512  0000 c652e7        	ld	a,21223
1515  0003 81            	ret	
1539                     ; 493 FunctionalState TIM4_GetStatus(void)
1539                     ; 494 {
1540                     .text:	section	.text,new
1541  0000               _TIM4_GetStatus:
1545                     ; 495   return ((FunctionalState)(TIM4->CR1 & TIM4_CR1_CEN));
1547  0000 c652e0        	ld	a,21216
1548  0003 a401          	and	a,#1
1551  0005 81            	ret	
1637                     ; 507 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1637                     ; 508 {
1638                     .text:	section	.text,new
1639  0000               _TIM4_GetFlagStatus:
1641  0000 88            	push	a
1642       00000001      OFST:	set	1
1645                     ; 509   __IO FlagStatus bitstatus = RESET;
1647  0001 0f01          	clr	(OFST+0,sp)
1649                     ; 512   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1651                     ; 514   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1653  0003 c452e4        	and	a,21220
1654  0006 2702          	jreq	L727
1655                     ; 516     bitstatus = SET;
1657  0008 a601          	ld	a,#1
1659  000a               L727:
1660                     ; 520     bitstatus = RESET;
1662  000a 6b01          	ld	(OFST+0,sp),a
1664                     ; 522   return ((FlagStatus)bitstatus);
1666  000c 7b01          	ld	a,(OFST+0,sp)
1669  000e 5b01          	addw	sp,#1
1670  0010 81            	ret	
1705                     ; 533 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1705                     ; 534 {
1706                     .text:	section	.text,new
1707  0000               _TIM4_ClearFlag:
1711                     ; 536   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1713                     ; 538   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1715  0000 43            	cpl	a
1716  0001 c752e4        	ld	21220,a
1717                     ; 539 }
1720  0004 81            	ret	
1784                     ; 550 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1784                     ; 551 {
1785                     .text:	section	.text,new
1786  0000               _TIM4_GetITStatus:
1788  0000 88            	push	a
1789  0001 5203          	subw	sp,#3
1790       00000003      OFST:	set	3
1793                     ; 552   __IO ITStatus bitstatus = RESET;
1795  0003 0f03          	clr	(OFST+0,sp)
1797                     ; 554   __IO uint8_t itStatus = 0x0, itEnable = 0x0;
1799  0005 0f01          	clr	(OFST-2,sp)
1803  0007 0f02          	clr	(OFST-1,sp)
1805                     ; 557   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1807                     ; 559   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1809  0009 c452e4        	and	a,21220
1810  000c 6b01          	ld	(OFST-2,sp),a
1812                     ; 561   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1814  000e c652e3        	ld	a,21219
1815  0011 1404          	and	a,(OFST+1,sp)
1816  0013 6b02          	ld	(OFST-1,sp),a
1818                     ; 563   if ((itStatus != (uint8_t)RESET) && (itEnable != (uint8_t)RESET))
1820  0015 0d01          	tnz	(OFST-2,sp)
1821  0017 270a          	jreq	L3001
1823  0019 0d02          	tnz	(OFST-1,sp)
1824  001b 2706          	jreq	L3001
1825                     ; 565     bitstatus = (ITStatus)SET;
1827  001d a601          	ld	a,#1
1828  001f 6b03          	ld	(OFST+0,sp),a
1831  0021 2002          	jra	L5001
1832  0023               L3001:
1833                     ; 569     bitstatus = (ITStatus)RESET;
1835  0023 0f03          	clr	(OFST+0,sp)
1837  0025               L5001:
1838                     ; 571   return ((ITStatus)bitstatus);
1840  0025 7b03          	ld	a,(OFST+0,sp)
1843  0027 5b04          	addw	sp,#4
1844  0029 81            	ret	
1880                     ; 582 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1880                     ; 583 {
1881                     .text:	section	.text,new
1882  0000               _TIM4_ClearITPendingBit:
1886                     ; 585   assert_param(IS_TIM4_IT(TIM4_IT));
1888                     ; 588   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1890  0000 43            	cpl	a
1891  0001 c752e4        	ld	21220,a
1892                     ; 589 }
1895  0004 81            	ret	
1908                     	xdef	_TIM4_ClearITPendingBit
1909                     	xdef	_TIM4_GetITStatus
1910                     	xdef	_TIM4_ClearFlag
1911                     	xdef	_TIM4_GetFlagStatus
1912                     	xdef	_TIM4_GetStatus
1913                     	xdef	_TIM4_GetPrescaler
1914                     	xdef	_TIM4_GetCounter
1915                     	xdef	_TIM4_SetAutoreload
1916                     	xdef	_TIM4_SetCounter
1917                     	xdef	_TIM4_GenerateEvent
1918                     	xdef	_TIM4_ARRPreloadConfig
1919                     	xdef	_TIM4_PrescalerConfig
1920                     	xdef	_TIM4_SelectMasterSlaveMode
1921                     	xdef	_TIM4_SelectSlaveMode
1922                     	xdef	_TIM4_SelectOutputTrigger
1923                     	xdef	_TIM4_SelectOnePulseMode
1924                     	xdef	_TIM4_UpdateRequestConfig
1925                     	xdef	_TIM4_UpdateDisableConfig
1926                     	xdef	_TIM4_SelectInputTrigger
1927                     	xdef	_TIM4_InternalClockConfig
1928                     	xdef	_TIM4_ITConfig
1929                     	xdef	_TIM4_Cmd
1930                     	xdef	_TIM4_TimeBaseInit
1931                     	xdef	_TIM4_DeInit
1950                     	end
