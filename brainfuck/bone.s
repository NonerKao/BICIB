    .section    .text
_start:
        mov $0x3c, %rax
        syscall
    .global        _start
    .end

