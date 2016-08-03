*!*pgodbg.prg
Parameters tlsuspend, TLREALLYSUSPEND
IF TYPE([tcTechnology])=[C] 
	IF [_LA]$UPPER[tcTechnology]
		TLREALLYSUSPEND=.F.
	ENDIF
ENDIF

If TLREALLYSUSPEND&& PGO 02/20/14 11:09:38 AM  tlsuspend
	WAIT WINDOW prog[] NOWAIT at 12,30
	Suspend
Endif	tlsuspend
