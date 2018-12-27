!macro CHECK_KEYBOARD {           
        lda #%11111111          ; CIA#1 Port A set to output 
        sta DATA_DIR_REG_A             
        lda #%00000000          ; CIA#1 Port B set to inputt
        sta DATA_DIR_REG_B       

    .check_space
        lda #%01111111          ; select row 8
        sta PORT_REG_A 
        lda PORT_REG_B          ; load column information
        and #%00010000          ; test 'space' key to exit
        bne .check_s
        +CURSOR_PRESS

    .check_s                 
        lda #%11111101          ; select row 2
        sta PORT_REG_A 
        lda PORT_REG_B          ; load column information
        and #%00100000          ; test 's' key  
        bne .check_w
        +CURSOR_DOWN

    .check_w                 
        lda #%11111101          ; select row 2
        sta PORT_REG_A 
        lda PORT_REG_B          ; load column information
        and #%00000010          ; test 'w' key 
        bne .check_a
        +CURSOR_UP   

    .check_a                 
        lda #%11111101          ; select row 2
        sta PORT_REG_A 
        lda PORT_REG_B          ; load column information
        and #%00000100          ; test 'a' key 
        bne .check_d
        +CURSOR_LEFT 

    .check_d                 
        lda #%11111011          ; select row 3
        sta PORT_REG_A 
        lda PORT_REG_B          ; load column information
        and #%00000100          ; test 'd' key
        bne .end 
        +CURSOR_RIGHT             

    .end
}            
