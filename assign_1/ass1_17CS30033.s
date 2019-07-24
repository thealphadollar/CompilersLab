####################################
## Shivam Kumar Jha
## 17CS30033
## Compilers Assignment 1
####################################	
	.file	"ass1_17CS30033.c"										# name of the source file
	.text															# type of the section below
	.section	.rodata												# read only data below
	.align 8														# 8 byte boundary alignment
.LC0:																# first string label for storing prompt to ask for dimenstions
	.string	"Enter the dimension of a square matrix: "				
.LC1:																# second string label for reading dimenstion from user
	.string	"%d"
	.align 8														# 8 byte boundary alignment
.LC2:																# third string label to prompt user to enter the first matrix
	.string	"Enter the first matix (row-major): "
	.align 8														# 8 byte boundary alignment
.LC3:																# fourth string label to prompt user to enter the second matrix
	.string	"Enter the second matix (row-major): "
.LC4:																# fifth string label to show result
	.string	"\nThe result matrix:"
.LC5:																# sixth string label to store user entry
	.string	"%d "
	.text															# type of the section below
	.globl	main													# defines the global function that is main
	.type	main, @function											# define type of main, which is function
main:																# start of main function
.LFB0:																
	.cfi_startproc													# initialize internal structures and emit initial CFI
	pushq	%rbp													# put base pointer in stack
	.cfi_def_cfa_offset 16											# Set CFA to use offset of 16
	.cfi_offset 6, -16											 	# Set rule to set register 6 at offset of 16 from CFI
	movq	%rsp, %rbp												# rbp <- rsp
	.cfi_def_cfa_register 6											# Set CFA to use offset of 16
	subq	$4816, %rsp												# Allocate space for array and variables
	leaq	.LC0(%rip), %rdi										# load address of .LCO(%rip) into %rdi
	movl	$0, %eax												# load 0 into %eax
	call	printf@PLT												# call system function printf to print "Enter the dimension of a square matrix: "
	leaq	-12(%rbp), %rax											# load address of -12(%rbp) into %rax
	movq	%rax, %rsi												# copy %rax to %rsi
	leaq	.LC1(%rip), %rdi										# copy first bit address of LC1 to store input variable in %rdi
	movl	$0, %eax												# load 0 into %eax
	call	__isoc99_scanf@PLT										# call scanf system function
	leaq	.LC2(%rip), %rdi										# copy first bit address of LC2 to store input variable in %rdi
	movl	$0, %eax												# load 0 into %eax
	call	printf@PLT												# call system printf function
	movl	-12(%rbp), %eax											# move -12(%rbp) to %eax
	leaq	-1616(%rbp), %rdx										# load address -1616(%rbp) to %rdx
	movq	%rdx, %rsi												# move %rdx to %rsi, basically passing matrix to the function ReadMat
	movl	%eax, %edi												# move %eax to %edi for passing variable n to ReadMat
	call	ReadMat													# call function ReadMat
	leaq	.LC3(%rip), %rdi										# copy string label LC3 to %edit for storing starting address of third string to print
	movl	$0, %eax												# put 0 in %eax
	call	printf@PLT												# call system printf function
	movl	-12(%rbp), %eax											# move -12(%rbp) into %eax%
	leaq	-3216(%rbp), %rdx										# loads address -3216(%rbp) into %rdx 
	movq	%rdx, %rsi												# move %rdx to %rsi
	movl	%eax, %edi												# move %eax to %edi
	call	ReadMat													# call ReadMat function
	movl	-12(%rbp), %eax											# move -12(%rbp) to %eax
	leaq	-4816(%rbp), %rcx										# load address of -4816(%rbp) to %rcx
	leaq	-3216(%rbp), %rdx										# load address of -3216(%rbp) to %rdx
	leaq	-1616(%rbp), %rsi										# load address of -1616(%rbp) to %rsi
	movl	%eax, %edi												# copy %eax to %edi
	call	MatMult													# call function MatMult
	leaq	.LC4(%rip), %rdi										# load string to print with the 4th printf statement
	call	puts@PLT												# initiate for loop
	movl	$0, -4(%rbp)											# set i = 0 for the outer loop by copying 0 into -4(%rbp)
	jmp	.L2															# jump to label L2 to check if to continue outer-level loop if i less than n
.L5:
	movl	$0, -8(%rbp)											# set j = 0 for the inner loop by setting 0 in -8(%rbp)
	jmp	.L3															# jump to label L3 to check if to continue inner-level loop if j les than n
.L4:
	movl	-8(%rbp), %eax											# move -8(%rbp) to %eax
	movslq	%eax, %rcx												# convert long int to quad
	movl	-4(%rbp), %eax											# copy -4(%rbp) to %eax
	movslq	%eax, %rdx												# convert long int to quad
	movq	%rdx, %rax												# copy %rdx to %rax
	salq	$2, %rax												# divide %rax by 4 using left shifts
	addq	%rdx, %rax												# add %rdx and %rax and store back in %rdx
	salq	$2, %rax												# divide %rax by 4 using left shifts
	addq	%rcx, %rax												# add %rcx and %rax and store back in %rcx
	movl	-4816(%rbp,%rax,4), %eax								# calculate array element address to print by storing (-1616 + %rbp + 4* %rax) in %rbp
	movl	%eax, %esi												# set second argument
	leaq	.LC5(%rip), %rdi										# load string label LC5 for printing
	movl	$0, %eax												# set 0 to %eax
	call	printf@PLT												# call system printf function
	addl	$1, -8(%rbp)											# increment -8(%rbp) by 1
.L3:
	movl	-12(%rbp), %eax											# move -12(%rbp) to %eax, that is store n in %eax
	cmpl	%eax, -8(%rbp)											# compare if %eax is less than -8(%rbp)
	jl	.L4															# if previous is true, jump to label L4
	movl	$10, %edi												# put 10 in %edi
	call	putchar@PLT												# call system putchar function
	addl	$1, -4(%rbp)											# increment -4(%rbp) by 1
.L2:
	movl	-12(%rbp), %eax											# copy -12(%rbp) to %eax that is putting n in %eax
	cmpl	%eax, -4(%rbp)											# compare if %eax is less than -4(%rbp)
	jl	.L5															# jump to label L5 if previous statement is true
	movl	$0, %eax												# put 0 in %eax
	leave															# put EBP to ESP and restore state of EBP to original
	.cfi_def_cfa 7, 8												# set computing CFA from register 7 and 8
	ret																# pop return address
	.cfi_endproc													# generate binary structure
.LFE0:
	.size	main, .-main											
	.globl	ReadMat
	.type	ReadMat, @function
ReadMat:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L8
.L11:
	movl	$0, -8(%rbp)
	jmp	.L9
.L10:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	salq	$2, %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	addl	$1, -8(%rbp)
.L9:
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L10
	addl	$1, -4(%rbp)
.L8:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L11
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	ReadMat, .-ReadMat
	.section	.rodata
	.align 8
.LC6:
	.string	"\nThe transpose of the second matrix:"
	.text
	.globl	TransMat
	.type	TransMat, @function
TransMat:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L13
.L16:
	movl	$0, -8(%rbp)
	jmp	.L14
.L15:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rsi
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	movl	(%rsi,%rax,4), %edx
	movl	-8(%rbp), %eax
	cltq
	movl	%edx, (%rcx,%rax,4)
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	leaq	(%rdx,%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	movl	-12(%rbp), %edx
	movl	%edx, (%rcx,%rax,4)
	addl	$1, -8(%rbp)
.L14:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jl	.L15
	addl	$1, -4(%rbp)
.L13:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L16
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movl	$0, -4(%rbp)
	jmp	.L17
.L20:
	movl	$0, -8(%rbp)
	jmp	.L18
.L19:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rax, %rdx
	movl	-8(%rbp), %eax
	cltq
	movl	(%rdx,%rax,4), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	addl	$1, -8(%rbp)
.L18:
	movl	-8(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L19
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -4(%rbp)
.L17:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L20
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	TransMat, .-TransMat
	.globl	VectMult
	.type	VectMult, @function
VectMult:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movq	%rdx, -40(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L22
.L23:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	-40(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	imull	%edx, %eax
	addl	%eax, -8(%rbp)
	addl	$1, -4(%rbp)
.L22:
	movl	-4(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L23
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	VectMult, .-VectMult
	.globl	MatMult
	.type	MatMult, @function
MatMult:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$56, %rsp
	.cfi_offset 3, -24
	movl	%edi, -36(%rbp)
	movq	%rsi, -48(%rbp)
	movq	%rdx, -56(%rbp)
	movq	%rcx, -64(%rbp)
	movq	-56(%rbp), %rdx
	movl	-36(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	TransMat
	movl	$0, -20(%rbp)
	jmp	.L26
.L29:
	movl	$0, -24(%rbp)
	jmp	.L27
.L28:
	movl	-24(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-56(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rsi
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-48(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rcx
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-64(%rbp), %rax
	leaq	(%rdx,%rax), %rbx
	movl	-36(%rbp), %eax
	movq	%rsi, %rdx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	VectMult
	movl	%eax, %edx
	movl	-24(%rbp), %eax
	cltq
	movl	%edx, (%rbx,%rax,4)
	addl	$1, -24(%rbp)
.L27:
	movl	-24(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L28
	addl	$1, -20(%rbp)
.L26:
	movl	-20(%rbp), %eax
	cmpl	-36(%rbp), %eax
	jl	.L29
	nop
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	MatMult, .-MatMult
	.ident	"GCC: (Debian 8.3.0-19) 8.3.0"
	.section	.note.GNU-stack,"",@progbits
