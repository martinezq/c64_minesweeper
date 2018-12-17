!macro setAtCursor .val {
    lda #<SCREEN        ; low byte
    sta buf16
    lda #>SCREEN        ; high byte
    sta buf16+1

    lda cursor_x
    +add16a buf16

    ldy cursor_y
    cpy #$00
    beq .out

.loop1    
    lda #40
    +add16a buf16
    dey
    cpy #$00
    bne .loop1

.out
    ldy #$00
    lda .val
    sta (buf16),y
}