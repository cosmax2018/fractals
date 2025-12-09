	.file	"mandel8.c"
	.intel_syntax noprefix
	.text
	.globl	DRAW_MANDELBROT_SET
	.def	DRAW_MANDELBROT_SET;	.scl	2;	.type	32;	.endef
DRAW_MANDELBROT_SET:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 144
	movsd	QWORD PTR 16[rbp], xmm0
	movsd	QWORD PTR 24[rbp], xmm1
	movsd	QWORD PTR 32[rbp], xmm2
	movsd	QWORD PTR 40[rbp], xmm3
.L2:
	mov	edx, 0
	mov	ecx, 1
	call	fb_GfxPageSet
	mov	QWORD PTR -8[rbp], 0
	mov	QWORD PTR -16[rbp], 0
	mov	QWORD PTR -24[rbp], 0
	lea	rax, -64[rbp]
	mov	QWORD PTR [rax], 0
	lea	rax, -72[rbp]
	mov	QWORD PTR [rax], 0
	lea	rax, -80[rbp]
	mov	QWORD PTR [rax], 0
	lea	rax, -88[rbp]
	mov	QWORD PTR [rax], 0
	lea	rax, -96[rbp]
	mov	QWORD PTR [rax], 0
	movsd	xmm0, QWORD PTR 32[rbp]
	subsd	xmm0, QWORD PTR 16[rbp]
	movsd	xmm1, QWORD PTR .LC0[rip]
	andpd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC1[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -48[rbp], xmm0
	movsd	xmm0, QWORD PTR 40[rbp]
	subsd	xmm0, QWORD PTR 24[rbp]
	movsd	xmm1, QWORD PTR .LC0[rip]
	andpd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -56[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -32[rbp], xmm0
.L3:
	pxor	xmm0, xmm0
	cvtsi2sdq	xmm0, QWORD PTR -8[rbp]
	mulsd	xmm0, QWORD PTR -48[rbp]
	addsd	xmm0, QWORD PTR 16[rbp]
	movsd	QWORD PTR -64[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC4[rip]
	movsd	QWORD PTR -40[rbp], xmm0
.L4:
	mov	QWORD PTR -24[rbp], 0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -88[rbp], xmm0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -80[rbp], xmm0
	pxor	xmm0, xmm0
	cvtsi2sdq	xmm0, QWORD PTR -16[rbp]
	mulsd	xmm0, QWORD PTR -56[rbp]
	addsd	xmm0, QWORD PTR 24[rbp]
	movsd	QWORD PTR -72[rbp], xmm0
.L5:
	movsd	xmm1, QWORD PTR -80[rbp]
	movsd	xmm0, QWORD PTR -80[rbp]
	mulsd	xmm1, xmm0
	movsd	xmm2, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR -88[rbp]
	mulsd	xmm0, xmm2
	addsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC5[rip]
	ucomisd	xmm1, xmm0
	setnb	al
	movzx	eax, al
	neg	eax
	mov	edx, eax
	cmp	QWORD PTR -24[rbp], 255
	setle	al
	movzx	eax, al
	neg	eax
	and	eax, edx
	test	eax, eax
	je	.L22
	movsd	xmm1, QWORD PTR -80[rbp]
	movsd	xmm0, QWORD PTR -80[rbp]
	mulsd	xmm0, xmm1
	movsd	xmm2, QWORD PTR -88[rbp]
	movsd	xmm1, QWORD PTR -88[rbp]
	mulsd	xmm1, xmm2
	subsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -64[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -96[rbp], xmm0
	movsd	xmm1, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR -80[rbp]
	mulsd	xmm0, xmm1
	addsd	xmm0, xmm0
	movsd	xmm1, QWORD PTR -72[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -88[rbp], xmm0
	movsd	xmm0, QWORD PTR -96[rbp]
	movsd	QWORD PTR -80[rbp], xmm0
	add	QWORD PTR -24[rbp], 1
	jmp	.L5
.L22:
	nop
.L7:
	mov	rax, QWORD PTR -24[rbp]
	cvtsd2ss	xmm1, QWORD PTR -40[rbp]
	cvtsd2ss	xmm0, QWORD PTR -32[rbp]
	mov	DWORD PTR 40[rsp], 0
	mov	DWORD PTR 32[rsp], 4
	mov	r9d, eax
	movaps	xmm2, xmm1
	movaps	xmm1, xmm0
	mov	ecx, 0
	call	fb_GfxPset
	add	QWORD PTR -16[rbp], 1
.L8:
	movsd	xmm0, QWORD PTR -40[rbp]
	movsd	xmm1, QWORD PTR .LC6[rip]
	subsd	xmm0, xmm1
	movsd	QWORD PTR -40[rbp], xmm0
.L9:
	movsd	xmm0, QWORD PTR -40[rbp]
	pxor	xmm1, xmm1
	ucomisd	xmm0, xmm1
	jb	.L20
	jmp	.L4
.L20:
.L10:
	add	QWORD PTR -8[rbp], 1
	mov	QWORD PTR -16[rbp], 0
.L12:
	movsd	xmm1, QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR .LC6[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -32[rbp], xmm0
.L13:
	movsd	xmm0, QWORD PTR .LC7[rip]
	ucomisd	xmm0, QWORD PTR -32[rbp]
	jnb	.L3
.L14:
.L16:
	leave
	ret
	.globl	DRAW_ZOOMBOX
	.def	DRAW_ZOOMBOX;	.scl	2;	.type	32;	.endef
DRAW_ZOOMBOX:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 144
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	movss	DWORD PTR 32[rbp], xmm2
	mov	QWORD PTR 40[rbp], r9
	mov	BYTE PTR -33[rbp], 0
.L24:
	mov	edx, 0
	mov	ecx, 2
	call	fb_GfxPageSet
	pxor	xmm1, xmm1
	cvtsi2sdq	xmm1, QWORD PTR 16[rbp]
	movss	xmm0, DWORD PTR 32[rbp]
	addss	xmm0, xmm0
	cvtss2sd	xmm0, xmm0
	movsd	xmm2, QWORD PTR .LC7[rip]
	divsd	xmm2, xmm0
	movapd	xmm0, xmm2
	subsd	xmm1, xmm0
	movapd	xmm0, xmm1
	call	nearbyint
	cvttsd2si	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
	pxor	xmm1, xmm1
	cvtsi2sdq	xmm1, QWORD PTR 24[rbp]
	movss	xmm0, DWORD PTR 32[rbp]
	addss	xmm0, xmm0
	cvtss2sd	xmm0, xmm0
	movsd	xmm2, QWORD PTR .LC4[rip]
	divsd	xmm2, xmm0
	movapd	xmm0, xmm2
	subsd	xmm1, xmm0
	movapd	xmm0, xmm1
	call	nearbyint
	cvttsd2si	rax, xmm0
	mov	QWORD PTR -16[rbp], rax
	pxor	xmm1, xmm1
	cvtsi2sdq	xmm1, QWORD PTR 16[rbp]
	movss	xmm0, DWORD PTR 32[rbp]
	addss	xmm0, xmm0
	cvtss2sd	xmm0, xmm0
	movsd	xmm2, QWORD PTR .LC7[rip]
	divsd	xmm2, xmm0
	movapd	xmm0, xmm2
	addsd	xmm0, xmm1
	call	nearbyint
	cvttsd2si	rax, xmm0
	mov	QWORD PTR -24[rbp], rax
	pxor	xmm1, xmm1
	cvtsi2sdq	xmm1, QWORD PTR 24[rbp]
	movss	xmm0, DWORD PTR 32[rbp]
	addss	xmm0, xmm0
	cvtss2sd	xmm0, xmm0
	movsd	xmm2, QWORD PTR .LC4[rip]
	divsd	xmm2, xmm0
	movapd	xmm0, xmm2
	addsd	xmm0, xmm1
	call	nearbyint
	cvttsd2si	rax, xmm0
	mov	QWORD PTR -32[rbp], rax
	mov	ecx, -65536
	call	fb_Cls
	pxor	xmm0, xmm0
	cvtsi2ssq	xmm0, QWORD PTR -32[rbp]
	pxor	xmm3, xmm3
	cvtsi2ssq	xmm3, QWORD PTR -24[rbp]
	pxor	xmm2, xmm2
	cvtsi2ssq	xmm2, QWORD PTR -16[rbp]
	pxor	xmm1, xmm1
	cvtsi2ssq	xmm1, QWORD PTR -8[rbp]
	mov	DWORD PTR 64[rsp], 0
	mov	DWORD PTR 56[rsp], 65535
	mov	DWORD PTR 48[rsp], 1
	mov	DWORD PTR 40[rsp], 15
	movss	DWORD PTR 32[rsp], xmm0
	mov	ecx, 0
	call	fb_GfxLine
	lea	rax, -48[rbp]
	mov	QWORD PTR [rax], 0
	lea	rax, -56[rbp]
	mov	QWORD PTR [rax], 0
	mov	rax, QWORD PTR 72[rbp]
	and	eax, 1
	test	rax, rax
	je	.L31
	mov	rax, QWORD PTR 40[rbp]
	movsd	xmm3, QWORD PTR [rax]
	pxor	xmm1, xmm1
	cvtsi2sdq	xmm1, QWORD PTR 16[rbp]
	mov	rax, QWORD PTR 56[rbp]
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR 40[rbp]
	movsd	xmm2, QWORD PTR [rax]
	subsd	xmm0, xmm2
	movsd	xmm2, QWORD PTR .LC0[rip]
	andpd	xmm0, xmm2
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC7[rip]
	divsd	xmm0, xmm1
	addsd	xmm0, xmm3
	movsd	QWORD PTR -48[rbp], xmm0
	mov	rax, QWORD PTR 48[rbp]
	movsd	xmm3, QWORD PTR [rax]
	mov	eax, 480
	sub	rax, QWORD PTR 24[rbp]
	pxor	xmm1, xmm1
	cvtsi2sdq	xmm1, rax
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR 48[rbp]
	movsd	xmm2, QWORD PTR [rax]
	subsd	xmm0, xmm2
	movsd	xmm2, QWORD PTR .LC0[rip]
	andpd	xmm0, xmm2
	mulsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC4[rip]
	divsd	xmm0, xmm1
	addsd	xmm0, xmm3
	movsd	QWORD PTR -56[rbp], xmm0
	movsd	xmm2, QWORD PTR -48[rbp]
	mov	rax, QWORD PTR 56[rbp]
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR 40[rbp]
	movsd	xmm1, QWORD PTR [rax]
	subsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC0[rip]
	andpd	xmm1, xmm0
	movss	xmm0, DWORD PTR 32[rbp]
	addss	xmm0, xmm0
	cvtss2sd	xmm0, xmm0
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1
	subsd	xmm2, xmm0
	movapd	xmm0, xmm2
	mov	rax, QWORD PTR 40[rbp]
	movsd	QWORD PTR [rax], xmm0
	movsd	xmm2, QWORD PTR -56[rbp]
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR 48[rbp]
	movsd	xmm1, QWORD PTR [rax]
	subsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC0[rip]
	andpd	xmm1, xmm0
	movss	xmm0, DWORD PTR 32[rbp]
	addss	xmm0, xmm0
	cvtss2sd	xmm0, xmm0
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1
	subsd	xmm2, xmm0
	movapd	xmm0, xmm2
	mov	rax, QWORD PTR 48[rbp]
	movsd	QWORD PTR [rax], xmm0
	mov	rax, QWORD PTR 56[rbp]
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR 40[rbp]
	movsd	xmm1, QWORD PTR [rax]
	subsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC0[rip]
	andpd	xmm1, xmm0
	movss	xmm0, DWORD PTR 32[rbp]
	addss	xmm0, xmm0
	cvtss2sd	xmm0, xmm0
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -48[rbp]
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR 56[rbp]
	movsd	QWORD PTR [rax], xmm0
	mov	rax, QWORD PTR 64[rbp]
	movsd	xmm0, QWORD PTR [rax]
	mov	rax, QWORD PTR 48[rbp]
	movsd	xmm1, QWORD PTR [rax]
	subsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC0[rip]
	andpd	xmm1, xmm0
	movss	xmm0, DWORD PTR 32[rbp]
	addss	xmm0, xmm0
	cvtss2sd	xmm0, xmm0
	divsd	xmm1, xmm0
	movapd	xmm0, xmm1
	movsd	xmm1, QWORD PTR -56[rbp]
	addsd	xmm0, xmm1
	mov	rax, QWORD PTR 64[rbp]
	movsd	QWORD PTR [rax], xmm0
	mov	BYTE PTR -33[rbp], 1
	jmp	.L28
.L31:
	nop
.L26:
	mov	BYTE PTR -33[rbp], 0
	nop
.L27:
.L28:
	movzx	eax, BYTE PTR -33[rbp]
	leave
	ret
	.section .rdata,"dr"
.LC8:
	.ascii " ( \0"
.LC9:
	.ascii " , \0"
.LC10:
	.ascii " ) - ( \0"
.LC11:
	.ascii " )\0"
.LC12:
	.ascii " \0"
.LC13:
	.ascii "x\0"
	.text
	.globl	TITLE
	.def	TITLE;	.scl	2;	.type	32;	.endef
TITLE:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 576
	mov	QWORD PTR 16[rbp], rcx
	mov	QWORD PTR 24[rbp], rdx
	movsd	QWORD PTR 32[rbp], xmm2
	movsd	QWORD PTR 40[rbp], xmm3
.L33:
	mov	rax, QWORD PTR 64[rbp]
	mov	rcx, rax
	call	fb_LongintToStr
	mov	QWORD PTR -8[rbp], rax
	mov	rax, QWORD PTR 56[rbp]
	mov	QWORD PTR -520[rbp], rax
	movsd	xmm0, QWORD PTR -520[rbp]
	call	fb_DoubleToStr
	mov	QWORD PTR -16[rbp], rax
	mov	rax, QWORD PTR -16[rbp]
	mov	edx, 12
	mov	rcx, rax
	call	fb_LEFT
	mov	QWORD PTR -24[rbp], rax
	mov	rax, QWORD PTR 48[rbp]
	mov	QWORD PTR -520[rbp], rax
	movsd	xmm0, QWORD PTR -520[rbp]
	call	fb_DoubleToStr
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	mov	edx, 12
	mov	rcx, rax
	call	fb_LEFT
	mov	QWORD PTR -40[rbp], rax
	mov	rax, QWORD PTR 40[rbp]
	mov	QWORD PTR -520[rbp], rax
	movsd	xmm0, QWORD PTR -520[rbp]
	call	fb_DoubleToStr
	mov	QWORD PTR -48[rbp], rax
	mov	rax, QWORD PTR -48[rbp]
	mov	edx, 12
	mov	rcx, rax
	call	fb_LEFT
	mov	QWORD PTR -56[rbp], rax
	mov	rax, QWORD PTR 32[rbp]
	mov	QWORD PTR -520[rbp], rax
	movsd	xmm0, QWORD PTR -520[rbp]
	call	fb_DoubleToStr
	mov	QWORD PTR -64[rbp], rax
	mov	rax, QWORD PTR -64[rbp]
	mov	edx, 12
	mov	rcx, rax
	call	fb_LEFT
	mov	QWORD PTR -72[rbp], rax
	lea	rax, -192[rbp]
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR 8[rax], 0
	mov	QWORD PTR 16[rax], 0
	mov	rdx, QWORD PTR -72[rbp]
	lea	rax, -192[rbp]
	mov	QWORD PTR 32[rsp], -1
	mov	r9, rdx
	mov	r8d, 4
	lea	rdx, .LC8[rip]
	mov	rcx, rax
	call	fb_StrConcat
	mov	QWORD PTR -80[rbp], rax
	lea	rax, -224[rbp]
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR 8[rax], 0
	mov	QWORD PTR 16[rax], 0
	mov	rdx, QWORD PTR -80[rbp]
	lea	rax, -224[rbp]
	mov	QWORD PTR 32[rsp], 4
	lea	r9, .LC9[rip]
	mov	r8, -1
	mov	rcx, rax
	call	fb_StrConcat
	mov	QWORD PTR -88[rbp], rax
	lea	rax, -256[rbp]
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR 8[rax], 0
	mov	QWORD PTR 16[rax], 0
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -88[rbp]
	lea	rax, -256[rbp]
	mov	QWORD PTR 32[rsp], -1
	mov	r9, rcx
	mov	r8, -1
	mov	rcx, rax
	call	fb_StrConcat
	mov	QWORD PTR -96[rbp], rax
	lea	rax, -288[rbp]
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR 8[rax], 0
	mov	QWORD PTR 16[rax], 0
	mov	rdx, QWORD PTR -96[rbp]
	lea	rax, -288[rbp]
	mov	QWORD PTR 32[rsp], 8
	lea	r9, .LC10[rip]
	mov	r8, -1
	mov	rcx, rax
	call	fb_StrConcat
	mov	QWORD PTR -104[rbp], rax
	lea	rax, -320[rbp]
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR 8[rax], 0
	mov	QWORD PTR 16[rax], 0
	mov	rcx, QWORD PTR -40[rbp]
	mov	rdx, QWORD PTR -104[rbp]
	lea	rax, -320[rbp]
	mov	QWORD PTR 32[rsp], -1
	mov	r9, rcx
	mov	r8, -1
	mov	rcx, rax
	call	fb_StrConcat
	mov	QWORD PTR -112[rbp], rax
	lea	rax, -352[rbp]
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR 8[rax], 0
	mov	QWORD PTR 16[rax], 0
	mov	rdx, QWORD PTR -112[rbp]
	lea	rax, -352[rbp]
	mov	QWORD PTR 32[rsp], 4
	lea	r9, .LC9[rip]
	mov	r8, -1
	mov	rcx, rax
	call	fb_StrConcat
	mov	QWORD PTR -120[rbp], rax
	lea	rax, -384[rbp]
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR 8[rax], 0
	mov	QWORD PTR 16[rax], 0
	mov	rcx, QWORD PTR -24[rbp]
	mov	rdx, QWORD PTR -120[rbp]
	lea	rax, -384[rbp]
	mov	QWORD PTR 32[rsp], -1
	mov	r9, rcx
	mov	r8, -1
	mov	rcx, rax
	call	fb_StrConcat
	mov	QWORD PTR -128[rbp], rax
	lea	rax, -416[rbp]
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR 8[rax], 0
	mov	QWORD PTR 16[rax], 0
	mov	rdx, QWORD PTR -128[rbp]
	lea	rax, -416[rbp]
	mov	QWORD PTR 32[rsp], 3
	lea	r9, .LC11[rip]
	mov	r8, -1
	mov	rcx, rax
	call	fb_StrConcat
	mov	QWORD PTR -136[rbp], rax
	lea	rax, -448[rbp]
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR 8[rax], 0
	mov	QWORD PTR 16[rax], 0
	mov	rdx, QWORD PTR -136[rbp]
	lea	rax, -448[rbp]
	mov	QWORD PTR 32[rsp], 2
	lea	r9, .LC12[rip]
	mov	r8, -1
	mov	rcx, rax
	call	fb_StrConcat
	mov	QWORD PTR -144[rbp], rax
	lea	rax, -480[rbp]
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR 8[rax], 0
	mov	QWORD PTR 16[rax], 0
	mov	rcx, QWORD PTR -8[rbp]
	mov	rdx, QWORD PTR -144[rbp]
	lea	rax, -480[rbp]
	mov	QWORD PTR 32[rsp], -1
	mov	r9, rcx
	mov	r8, -1
	mov	rcx, rax
	call	fb_StrConcat
	mov	QWORD PTR -152[rbp], rax
	lea	rax, -512[rbp]
	mov	QWORD PTR [rax], 0
	mov	QWORD PTR 8[rax], 0
	mov	QWORD PTR 16[rax], 0
	mov	rdx, QWORD PTR -152[rbp]
	lea	rax, -512[rbp]
	mov	QWORD PTR 32[rsp], 2
	lea	r9, .LC13[rip]
	mov	r8, -1
	mov	rcx, rax
	call	fb_StrConcat
	mov	QWORD PTR -160[rbp], rax
	mov	rax, QWORD PTR -160[rbp]
	mov	rcx, rax
	call	fb_GfxSetWindowTitle
	nop
	leave
	ret
.L34:
	.def	__main;	.scl	2;	.type	32;	.endef
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
main:
	push	rbp
	mov	rbp, rsp
	sub	rsp, 176
	mov	DWORD PTR 16[rbp], ecx
	mov	QWORD PTR 24[rbp], rdx
	call	__main
	mov	DWORD PTR -24[rbp], 0
	mov	rax, QWORD PTR 24[rbp]
	mov	r8d, 0
	mov	rdx, rax
	mov	ecx, DWORD PTR 16[rbp]
	call	fb_Init
.L36:
	movss	xmm0, DWORD PTR .LC14[rip]
	movss	DWORD PTR -4[rbp], xmm0
	mov	QWORD PTR -32[rbp], 0
	mov	QWORD PTR -40[rbp], 0
	mov	QWORD PTR -48[rbp], 0
	mov	QWORD PTR -56[rbp], 0
	movsd	xmm0, QWORD PTR .LC15[rip]
	movsd	QWORD PTR -64[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC15[rip]
	movsd	QWORD PTR -72[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC16[rip]
	movsd	QWORD PTR -80[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC16[rip]
	movsd	QWORD PTR -88[rbp], xmm0
	mov	DWORD PTR 40[rsp], 0
	mov	DWORD PTR 32[rsp], 0
	mov	r9d, 3
	mov	r8d, 8
	mov	edx, 480
	mov	ecx, 640
	call	fb_GfxScreenRes
	movsd	xmm2, QWORD PTR -88[rbp]
	movsd	xmm1, QWORD PTR -80[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -64[rbp]
	movapd	xmm3, xmm2
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	mov	QWORD PTR -104[rbp], rax
	movsd	xmm0, QWORD PTR -104[rbp]
	call	DRAW_MANDELBROT_SET
.L37:
	mov	QWORD PTR -96[rbp], 0
	lea	r9, -56[rbp]
	lea	r8, -48[rbp]
	lea	rdx, -40[rbp]
	lea	rax, -32[rbp]
	lea	rcx, -96[rbp]
	mov	QWORD PTR 32[rsp], rcx
	mov	rcx, rax
	call	fb_GetMouse64
	mov	DWORD PTR -8[rbp], eax
	cmp	DWORD PTR -8[rbp], 0
	jne	.L54
	mov	rax, QWORD PTR -48[rbp]
	test	rax, rax
	je	.L55
	mov	rax, QWORD PTR -48[rbp]
	cqo
	xor	rax, rdx
	sub	rax, rdx
	pxor	xmm0, xmm0
	cvtsi2ssq	xmm0, rax
	movss	DWORD PTR -4[rbp], xmm0
	jmp	.L41
.L55:
	nop
.L41:
	mov	eax, DWORD PTR -4[rbp]
	mov	DWORD PTR -104[rbp], eax
	movss	xmm0, DWORD PTR -104[rbp]
	call	nearbyintf
	cvttss2si	rcx, xmm0
	movsd	xmm1, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR -80[rbp]
	movsd	xmm3, QWORD PTR -72[rbp]
	movsd	xmm2, QWORD PTR -64[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	mov	QWORD PTR 48[rsp], rcx
	movsd	QWORD PTR 40[rsp], xmm1
	movsd	QWORD PTR 32[rsp], xmm0
	mov	rcx, rax
	call	TITLE
	mov	rcx, QWORD PTR -56[rbp]
	mov	rdx, QWORD PTR -40[rbp]
	mov	rax, QWORD PTR -32[rbp]
	lea	r8, -64[rbp]
	movss	xmm0, DWORD PTR -4[rbp]
	mov	QWORD PTR 56[rsp], rcx
	lea	rcx, -88[rbp]
	mov	QWORD PTR 48[rsp], rcx
	lea	rcx, -80[rbp]
	mov	QWORD PTR 40[rsp], rcx
	lea	rcx, -72[rbp]
	mov	QWORD PTR 32[rsp], rcx
	mov	r9, r8
	movaps	xmm2, xmm0
	mov	rcx, rax
	call	DRAW_ZOOMBOX
	mov	BYTE PTR -13[rbp], al
	cmp	BYTE PTR -13[rbp], 0
	je	.L56
	movsd	xmm2, QWORD PTR -88[rbp]
	movsd	xmm1, QWORD PTR -80[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	mov	rax, QWORD PTR -64[rbp]
	movapd	xmm3, xmm2
	movapd	xmm2, xmm1
	movapd	xmm1, xmm0
	mov	QWORD PTR -104[rbp], rax
	movsd	xmm0, QWORD PTR -104[rbp]
	call	DRAW_MANDELBROT_SET
	jmp	.L44
.L56:
	nop
.L43:
	mov	edx, 0
	mov	ecx, 2
	call	fb_GfxFlip
	mov	ecx, 24
	call	fb_Sleep
.L44:
	mov	ecx, 1
	call	fb_Multikey
	mov	DWORD PTR -20[rbp], eax
	cmp	DWORD PTR -20[rbp], 0
	jne	.L57
	nop
.L46:
	mov	edx, 0
	mov	ecx, 1
	call	fb_GfxFlip
	mov	ecx, 10
	call	fb_Sleep
.L39:
.L48:
	jmp	.L49
.L54:
	nop
.L49:
	mov	ecx, 1
	call	fb_Multikey
	mov	DWORD PTR -12[rbp], eax
	cmp	DWORD PTR -12[rbp], 0
	jne	.L50
	jmp	.L37
.L57:
	nop
.L50:
	mov	ecx, 0
	call	fb_End
.L51:
	mov	ecx, 0
	call	fb_End
	mov	eax, DWORD PTR -24[rbp]
	leave
	ret
	.section .rdata,"dr"
	.align 16
.LC0:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC1:
	.long	0
	.long	1083441152
	.align 8
.LC2:
	.long	0
	.long	1083047936
	.align 8
.LC4:
	.long	0
	.long	1081999360
	.align 8
.LC5:
	.long	0
	.long	1074790400
	.align 8
.LC6:
	.long	0
	.long	1071644672
	.align 8
.LC7:
	.long	0
	.long	1082392576
	.align 4
.LC14:
	.long	1073741824
	.align 8
.LC15:
	.long	0
	.long	-1073479680
	.align 8
.LC16:
	.long	0
	.long	1074003968
	.ident	"GCC: (x86_64-win32-sjlj-rev0, Built by MinGW-W64 project) 5.2.0"
	.def	fb_GfxPageSet;	.scl	2;	.type	32;	.endef
	.def	fb_GfxPset;	.scl	2;	.type	32;	.endef
	.def	nearbyint;	.scl	2;	.type	32;	.endef
	.def	fb_Cls;	.scl	2;	.type	32;	.endef
	.def	fb_GfxLine;	.scl	2;	.type	32;	.endef
	.def	fb_LongintToStr;	.scl	2;	.type	32;	.endef
	.def	fb_DoubleToStr;	.scl	2;	.type	32;	.endef
	.def	fb_LEFT;	.scl	2;	.type	32;	.endef
	.def	fb_StrConcat;	.scl	2;	.type	32;	.endef
	.def	fb_GfxSetWindowTitle;	.scl	2;	.type	32;	.endef
	.def	fb_Init;	.scl	2;	.type	32;	.endef
	.def	fb_GfxScreenRes;	.scl	2;	.type	32;	.endef
	.def	fb_GetMouse64;	.scl	2;	.type	32;	.endef
	.def	nearbyintf;	.scl	2;	.type	32;	.endef
	.def	fb_GfxFlip;	.scl	2;	.type	32;	.endef
	.def	fb_Sleep;	.scl	2;	.type	32;	.endef
	.def	fb_Multikey;	.scl	2;	.type	32;	.endef
	.def	fb_End;	.scl	2;	.type	32;	.endef
