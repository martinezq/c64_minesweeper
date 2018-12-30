!cpu 6502
!to "build/index.prg",cbm    ; output file

!source "globals.asm"
!source "data/data.asm"

;============================================================
; a BASIC loader will help us RUN the intro when loaded
; into the C64 as opposed to manually type SYS49152
;============================================================

* = $0801                               ; BASIC start address (#2049)
!byte $0d,$08,$dc,$07,$9e,$20,$34,$39   ; BASIC loader to start at $c000...
!byte $31,$35,$32,$00,$00,$00           ; puts BASIC line 2012 SYS 49152


;============================================================
;  we assemble all our actual 6502 code starting at $c000
;============================================================

* = $c000     ; start_address were all the assembled 
			  ; code will be consecutively written to

!source "macros/utils.asm"
!source "macros/math.asm"
!source "macros/sprite.asm"
!source "macros/cursor.asm"
!source "macros/board.asm"
!source "macros/init_screen.asm"
!source "macros/keyboard.asm"

!source "routines/main.asm"
!source "routines/loop.asm"
