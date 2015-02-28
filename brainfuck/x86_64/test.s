.section    .text
_start:
mov %rsp, %rbx
mov $32768, %rax
ZERO:
test $0xFFFF, %rax
jz EZERO
movq $0x0, 0x0(%rbx)
sub $0x8, %rax
sub $0x8, %rbx
jmp ZERO
EZERO:
add $32768, %rbx
mov $0x1, %rdx
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
START_0:
testb $0xff, 0x0(%rbx)
jz END_0
dec %rbx
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
START_1:
testb $0xff, 0x0(%rbx)
jz END_1
dec %rbx
incb 0x0(%rbx)
incb 0x0(%rbx)
dec %rbx
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
dec %rbx
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
dec %rbx
incb 0x0(%rbx)
inc %rbx
inc %rbx
inc %rbx
inc %rbx
decb 0x0(%rbx)
jmp START_1
END_1:
dec %rbx
incb 0x0(%rbx)
dec %rbx
incb 0x0(%rbx)
dec %rbx
decb 0x0(%rbx)
dec %rbx
dec %rbx
incb 0x0(%rbx)
START_2:
testb $0xff, 0x0(%rbx)
jz END_2
inc %rbx
jmp START_2
END_2:
inc %rbx
decb 0x0(%rbx)
jmp START_0
END_0:
dec %rbx
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
decb 0x0(%rbx)
decb 0x0(%rbx)
decb 0x0(%rbx)
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
dec %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
inc %rbx
decb 0x0(%rbx)
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
inc %rbx
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
incb 0x0(%rbx)
incb 0x0(%rbx)
incb 0x0(%rbx)
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
decb 0x0(%rbx)
decb 0x0(%rbx)
decb 0x0(%rbx)
decb 0x0(%rbx)
decb 0x0(%rbx)
decb 0x0(%rbx)
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
decb 0x0(%rbx)
decb 0x0(%rbx)
decb 0x0(%rbx)
decb 0x0(%rbx)
decb 0x0(%rbx)
decb 0x0(%rbx)
decb 0x0(%rbx)
decb 0x0(%rbx)
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
dec %rbx
incb 0x0(%rbx)
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
dec %rbx
incb 0x0(%rbx)
incb 0x0(%rbx)
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
mov $0x3c, %rax
syscall
.global        _start
.end
