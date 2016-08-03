*	dfpmmain.prg			[po 20160714]
Parameters tlwiderPDF, tlDev&&	[po 06/15/16 09:51:29 PM ]
&&	[po 07/21/2016 07:35:21 PM ] _Screen.Visible = .T.
Set Exclusive Off
Set Echo Off
Set Talk Off
Set Safety Off
&&	[po 07/21/2016 07:19:06 PM ] Release   Gcuserid, Gcpswd, GCPRIVLEGE
LCWHOAMI=[;]-JUSTPATH[SYS[16]]
LCP= [SET PATH TO ]+Set[[PATH]]-LCWHOAMI-LCWHOAMI-[\DBFS]&&	[po 07/04/16 09:34:14 AM ] REDUCE CLUTTER
&LCP &&	[po 07/04/16 09:35:05 AM ]
*!*	Public Gcuserid, Gcpswd, GCPRIVLEGE
*!*	Gcuserid =	Space[20]
*!*	Gcpswd = Space[8]
*!*	If .T. And [PAD]$Id[]
*!*		If tlDev
*!*			Gcuserid =	[POHARA]
*!*		Else
*!*			Gcuserid =	[EWINNETT]	&& 	[RICHWHIT]
*!*		Endif
*!*		Gcpswd = [BERNIE16] &&	JILLIN16]
*!*	Endif
&&	[po 07/21/2016 07:16:38 PM ] _Screen.AddProperty('Gcuserid', Gcuserid ) &&	[po 07/19/2016 08:10:58 PM ] Space[20])&&	[po 06/20/16 08:52:01 AM ] Gcuserid =	
&&	[po 07/21/2016 07:16:38 PM ] _Screen.AddProperty([Gcpswd]  , Gcpswd ) &&	[po 07/19/2016 08:11:26 PM ] Space[8])&&	[po 06/20/16 08:52:53 AM ] Gcpswd = Space[8]
&&	[po 07/21/2016 07:16:38 PM ] _Screen.AddProperty([GCPRIVLEGE], Space[8])&&
&&	[po 07/21/2016 07:16:38 PM ] _Screen.AddProperty([lSuccess], .F.)	&&	[po 06/20/16 10:17:41 PM ]     FDAA NEEDS

llDontbail = .T.
*CD c:\dvstuff\alldir\dfpfic\fulldfpfic2016061900
*!*	If Not [GPPD] $ Set("Classlib" )
Set Classlib To GPPDSTDA.vcx	&&	[po 06/22/16 08:40:05 PM ] C:\DVSTUFF\
Do Form dfpformmain
Read Events


