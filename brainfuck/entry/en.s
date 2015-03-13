.section .text 
main:
push   %rbp
mov    %rsp,%rbp
sub    $0x10,%rsp
mov    %edi,-0x4(%rbp)       # argc
mov    %rsi,-0x10(%rbp)      # argv
push %rbx
push %r10

mov $0x1, %ebx
mov %rsp, %r10
sub $0x20, %r10

mov $0x8000, %rax
ZERO:
test $0xFFFF, %rax
jz EZERO
movq $0x0, 0x0(%r10)
sub $0x8, %rax
sub $0x8, %r10
jmp ZERO
EZERO:
add $0x8000, %r10

# for (ebx=1; ebx!=argc;ebx++)
jmp    L2
L1:
# rax = argv[ebx]
lea    0x0(,%ebx,8),%rdx
mov    -0x10(%rbp),%rax
add    %rdx,%rax
mov    (%rax),%rax

#open
mov %rax,%rdi
mov $0x2, %rax
mov $0x0, %rsi
mov $0x0, %rdx
syscall

mov %rax, %rdi
#read
movb $0x0, 0x0(%r10)
L3:
dec %r10
mov %r10, %rsi
mov $0x0, %rax
mov $0x1, %rdx
syscall
cmpb $0x1, %al
je L3
movb $0x0, 0x0(%r10)
dec %r10
movb $0x0, 0x0(%r10)
dec %r10

#close
mov $0x3, %rax
syscall

incl %ebx
L2:
cmpl   %ebx,-0x4(%rbp)
jne    L1

callq _bicib

pop %r10
pop %rbx
mov    $0x0,%eax
leaveq 
retq   
.global main
.end

