.section    .text
_start:
mov %rsp, %rbx
sub $0x8, %rbx
mov $32768, %rax
ZERO:
test $0xFFFF, %rax
jz EZERO
sub $0x8, %rax
sub $0x8, %rbx
movq $0x0, 0x0(%rbx)
jmp ZERO
EZERO:
mov %rsp, %rbx
sub $0x8, %rbx
mov $0x1, %rdx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
mov $0x3c, %rax
syscall
.global        _start
.end
