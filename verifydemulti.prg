*	verifyDEMulti.prg				[po 20160630] 
PARAMETERS tcDEfldV, tcFLDA, tcfld
LOCAL llverifyDEMulti, lnsele
lnsele = sele[]
SELECT (tcFLDA  )
SKIP
lcval = allt[eval[ tcFLDA -[.]- tcfld]   ] &&	[po 06/30/16 04:46:54 PM ]  7 crrctd
IF upper[lcval] = upper[allt[ tcDEfldV ] ]  &&	[po 06/30/16 04:43:51 PM ]  crrctd
	llverifyDEMulti = .T.
ENDIF
SELECT ( lnsele)
RETURN llverifyDEMulti