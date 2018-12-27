!macro ADD_16_A .PTR {
        clc
        adc .PTR
        sta .PTR

        lda .PTR+1
        adc #0
        sta .PTR+1
}

!macro ADD_16_V .PTR, .SPTR {
        clc
        lda .SPTR
        adc .PTR
        sta .PTR
        lda .SPTR+1
        adc .PTR+1
        sta .PTR+1
}

!macro MULT_16_A .PTR {
    tax
    .check_zero
        cmp #$00
        bne .check_one
        +RESET_16 .PTR
        jmp .end
    .check_one
        txa
        cmp #$01
        beq .end
    .mult
        dex
        +COPY_16 buf16mult, .PTR
    .loop
        +ADD_16_V .PTR, buf16mult
        dex
        cpx #$00
        bne .loop
    .end
}
