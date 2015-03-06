.section .text 
main:
push   %rbp
mov    %rsp,%rbp
sub    $0x10,%rsp
mov    %edi,-0x4(%rbp)       # argc
mov    %rsi,-0x10(%rbp)      # argv
push %rbx
push %rcx

mov $0x1, %ebx
jmp    L2
L1:
lea    0x0(,%ebx,8),%rdx
mov    -0x10(%rbp),%rax
add    %rdx,%rax
mov    (%rax),%rax
#open
mov    %rax,%rdi
mov $0x2, %rax
mov $0x0, %rsi
mov $0x0, %rdx
syscall

mov %rax, %rdi
mov %rsp, %rsi
sub $0x20, %rsi
#read
L3:
mov $0x0, %rax
mov $0x1, %rdx
syscall
dec %rsi
movb %al, 0x0(%rsi)
cmpb $0x0, %al
jne L3

#close
mov $0x3, %rax
syscall

incl %ebx
L2:
cmpl   %ebx,-0x4(%rbp)
jne    L1

callq _bicib

pop %rcx
pop %rbx
mov    $0x0,%eax
leaveq 
retq   
.global main
.end

