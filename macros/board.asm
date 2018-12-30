!macro INIT_BOARD {
    +RESET_BOARD

        ldy #$01
    .loop_y
        ldx #$01
    .loop_x
        jsr .update
        inx
        cpx #39
        bne .loop_x
        iny
        cpy #24
        bne .loop_y
        jmp .end

    .update
        +MOVE_CURSOR_XY
        +RANDOM_BOMB
        cmp #CHAR_BOMB
        beq .place_bomb
        rts
    .place_bomb
        +SET_AT_CURSOR CHAR_BOMB
        
        +CURSOR_LEFT
        +CHECK_NO_BOMB_AND_INC
        
        +CURSOR_DOWN
        +CHECK_NO_BOMB_AND_INC
        
        +CURSOR_RIGHT
        +CHECK_NO_BOMB_AND_INC

        +CURSOR_RIGHT
        +CHECK_NO_BOMB_AND_INC

        +CURSOR_UP
        +CHECK_NO_BOMB_AND_INC

        +CURSOR_UP
        +CHECK_NO_BOMB_AND_INC

        +CURSOR_LEFT
        +CHECK_NO_BOMB_AND_INC

        +CURSOR_LEFT
        +CHECK_NO_BOMB_AND_INC

        +CURSOR_RIGHT
        +CURSOR_DOWN
        rts

    .end
}

!macro CHECK_NO_BOMB_AND_INC {
        lda CURSOR_VAL
        cmp #CHAR_BOMB
        beq .skip
        +INC_AT_CURSOR
    .skip
}

!macro RESET_BOARD {
        ldx #$00
        lda #CHAR_00
    .loop
        sta SCREEN,x
        sta SCREEN+$ff,x
        sta SCREEN+$1ff,x
        sta SCREEN+$2ff,x
        inx
        bne .loop
}

!macro RANDOM_BOMB {
        +RND
        and #%10100001
        bne .zero
    .bomb    
        lda #CHAR_BOMB
        jmp .end
    .zero    
        lda #CHAR_00
    .end
}