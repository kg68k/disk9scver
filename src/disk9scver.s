.title disk9scver - print version of 9SCDRV.X

;This file is part of disk9scver
;Copyright (C) 2026 TcbnErik
;
;This program is free software: you can redistribute it and/or modify
;it under the terms of the GNU General Public License as published by
;the Free Software Foundation, either version 3 of the License, or
;(at your option) any later version.
;
;This program is distributed in the hope that it will be useful,
;but WITHOUT ANY WARRANTY; without even the implied warranty of
;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;GNU General Public License for more details.
;
;You should have received a copy of the GNU General Public License
;along with this program.  If not, see <https://www.gnu.org/licenses/>.

.include doscall.mac

.xref _X_KPCHK  ;_X_KPCHK.O

LF: .equ $0a
CR: .equ $0d


.cpu 68000
.text

ProgramStart:
  bra @f
    .dc.b 'disk9scver 1.0.0',0
    .even
  @@:

  ;a0.l = 自分自身のプロセスのメモリ管理ポインタ
  bsr _X_KPCHK
  cmpi.l #-1,d0
  beq NotFound

  bsr PrintVersion
  DOS _EXIT

NotFound:
  pea (str9scdrvNotFound,pc)
  DOS _PRINT
  addq.l #4,sp
  move #1,-(sp)
  DOS _EXIT2


PrintVersion:
  link a6,#-16
  lea (sp),a0

  move.l d0,(a0)+  ;バージョンコード'v???'
  move.b #' ',(a0)+  ;奇数アドレスになるので以後はバイト単位で書き込むこと
  moveq #4-1,d0
  @@:
    rol.l #8,d1
    move.b d1,(a0)+  ;リビジョンコード'r???'
  dbra d0,@b
  move.b #CR,(a0)+
  move.b #LF,(a0)+
  clr.b (a0)

  pea (sp)
  DOS _PRINT
  addq.l #4,sp

  unlk a6
  rts


.data

str9scdrvNotFound:
  .dc.b '9SCDRV.Xは組み込まれていません。',CR,LF,0


.end ProgramStart
