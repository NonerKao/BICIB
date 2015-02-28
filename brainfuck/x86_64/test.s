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
dec %rbx
mov %rbx, %rsi
mov $0x0, %rdi
mov $0x0, %rax
syscall
START_0:
testb $0xff, 0x0(%rbx)
jz END_0
START_1:
testb $0xff, 0x0(%rbx)
jz END_1
dec %rbx
jmp START_1
END_1:
incb 0x0(%rbx)
mov %rbx, %rsi
mov $0x1, %rdi
mov $0x1, %rax
syscall
START_2:
testb $0xff, 0x0(%rbx)
jz END_2
inc %rbx
jmp START_2
END_2:
dec %rbx
decb 0x0(%rbx)
jmp START_0
END_0:
mov $0x3c, %rax
syscall
.global        _start
.end
