   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.12.5 - 16 Jun 2021
   3                     ; Generator (Limited) V4.5.3 - 16 Jun 2021
   4                     ; Optimizer V4.5.3 - 16 Jun 2021
  48                     ; 55 void IRTIM_DeInit(void)
  48                     ; 56 {
  50                     .text:	section	.text,new
  51  0000               _IRTIM_DeInit:
  55                     ; 57   IRTIM->CR = IRTIM_CR_RESET_VALUE;
  57  0000 725f52ff      	clr	21247
  58                     ; 58 }
  61  0004 81            	ret	
 116                     ; 66 void IRTIM_Cmd(FunctionalState NewState)
 116                     ; 67 {
 117                     .text:	section	.text,new
 118  0000               _IRTIM_Cmd:
 122                     ; 69   assert_param(IS_FUNCTIONAL_STATE(NewState));
 124                     ; 72   if (NewState ==  DISABLE)
 126  0000 4d            	tnz	a
 127  0001 2605          	jrne	L74
 128                     ; 74     IRTIM->CR &= (uint8_t)(~IRTIM_CR_EN);
 130  0003 721152ff      	bres	21247,#0
 133  0007 81            	ret	
 134  0008               L74:
 135                     ; 78     IRTIM->CR |= IRTIM_CR_EN;
 137  0008 721052ff      	bset	21247,#0
 138                     ; 80 }
 141  000c 81            	ret	
 177                     ; 87 void IRTIM_HighSinkODCmd(FunctionalState NewState)
 177                     ; 88 {
 178                     .text:	section	.text,new
 179  0000               _IRTIM_HighSinkODCmd:
 183                     ; 90   assert_param(IS_FUNCTIONAL_STATE(NewState));
 185                     ; 93   if (NewState == DISABLE)
 187  0000 4d            	tnz	a
 188  0001 2605          	jrne	L17
 189                     ; 95     IRTIM->CR &= (uint8_t)(~IRTIM_CR_HSEN);
 191  0003 721352ff      	bres	21247,#1
 194  0007 81            	ret	
 195  0008               L17:
 196                     ; 99     IRTIM->CR |= IRTIM_CR_HSEN;
 198  0008 721252ff      	bset	21247,#1
 199                     ; 101 }
 202  000c 81            	ret	
 226                     ; 108 FunctionalState IRTIM_GetStatus(void)
 226                     ; 109 {
 227                     .text:	section	.text,new
 228  0000               _IRTIM_GetStatus:
 232                     ; 110   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_EN));
 234  0000 c652ff        	ld	a,21247
 235  0003 a401          	and	a,#1
 238  0005 81            	ret	
 263                     ; 118 FunctionalState IRTIM_GetHighSinkODStatus(void)
 263                     ; 119 {
 264                     .text:	section	.text,new
 265  0000               _IRTIM_GetHighSinkODStatus:
 269                     ; 120   return ((FunctionalState)(IRTIM->CR & IRTIM_CR_HSEN));
 271  0000 c652ff        	ld	a,21247
 272  0003 a402          	and	a,#2
 275  0005 81            	ret	
 288                     	xdef	_IRTIM_GetHighSinkODStatus
 289                     	xdef	_IRTIM_HighSinkODCmd
 290                     	xdef	_IRTIM_GetStatus
 291                     	xdef	_IRTIM_Cmd
 292                     	xdef	_IRTIM_DeInit
 311                     	end
