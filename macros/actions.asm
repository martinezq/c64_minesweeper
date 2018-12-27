!macro CURSOR_UP {   
        lda CURSOR_Y
        cmp #$00
        beq .skip
        dec CURSOR_Y
    .skip
}

!macro CURSOR_DOWN {   
        lda CURSOR_Y
        cmp #24
        beq .skip
        inc CURSOR_Y
    .skip
}

!macro CURSOR_LEFT {   
        lda CURSOR_X
        cmp #$00        
        beq .skip        
        dec CURSOR_X       
    .skip
}

!macro CURSOR_RIGHT {   
        lda CURSOR_X
        cmp #39        
        beq .skip        
        inc CURSOR_X       
    .skip
}

!macro CURSOR_PRESS {
        +setAtCursor $01
}
            