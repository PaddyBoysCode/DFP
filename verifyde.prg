*	verifyDE.prg				[po 20160629]
Parameters toDefFrm&&	[po 06/29/16 10:48:04 PM ] toPeDf
TEXT TO lcreadme NOSHOW TEXTMERGE
vrfy all city
and give gridnav for them to pick

same for streets
ENDTEXT
Local llAllGood, loNominate, llBAIL, llDontTurnRed, llDontTurnOrange 
llAllGood = .T.
For Each loNominate In toDefFrm.Controls
	*	bad addy or poor nominatin'
	If loNominate.BaseClass = [Container] and loNominate.Visible	&&	[po 07/03/16 03:23:16 PM ]  skip ctrsignaR ctrsignaS
		If loNominate.lBadAddy
			Loop
		Endif loNominate.lBadAddy
		* inspect D/E from Nominated line
		llDontTurnRed = Not Empty[loNominate.cvotecity] And	Seek[upper[padr[loNominate.cvotecity, len [City.votecity]]], 'CITY']&&	[po 06/30/16 06:42:58 AM ]
		If llDontTurnRed
			loNominate.txtVotecity.BackColor  = Rgb[255,255,255]
			llDontTrim = loNominate.txtvotestreetname.ReadOnly 	&&	[po 07/01/16 11:40:54 PM ] 
			llDontTurnRed =  Not Empty[ loNominate.cVoteStreetName]	And Seek[ padr[ upper[loNominate.cvotecity], Len [CITYSTREET.votecity]]+;
				UPPER[IIF[llDontTrim, loNominate.cvotestreetname, ALLT[loNominate.cvotestreetname]]],'CITYSTREET']			&&	[po 06/30/16 06:43:05 AM ]			&&	[po 06/29/16 10:54:21 PM ] NEED 2 TRIM STREET! PADR[ UPPER[loNominate.cvotestreetname], Len [CITYSTREET.votestreet]]
			If llDontTurnRed
				If NOT	llDontTrim AND	verifyDEMulti[ loNominate.cvotestreetname, 'CITYSTREET', 'VOTESTREET']	&&	[po 06/30/16 03:59:53 PM ] 
					loNominate.txtVotestreetname.BackColor  = Rgb[0,255,0]
					llAllGood = .F.
					llDontTurnRed = .F.
				Else
					loNominate.txtVotestreetname.BackColor  = Rgb[255,255,255]
				Endif
			Else
				llAllGood = .F.
				loNominate.txtVotestreetname.BackColor  = Rgb[255,80,50]
			Endif llDontTurnRed
			IF NOT llDontTurnRed
				verifyDEneedRevueButton[ loNominate.txtVotestreetname]
			ENDIF NOT llDontTurnRed
		Else
			loNominate.txtVotecity.BackColor  = Rgb[255,80,50]
			llAllGood = .F.
			verifyDEneedRevueButton[ loNominate.txtVotecITY]
		Endif  llDontTurnRed
		IF llDontTurnRed  		
			#IF .F.
			llDontTurnOrange = 	not empty[this.cVotePreDirection 	= space[2]&&	[po 07/03/16 03:40:14 PM ]  
			this.cVoteStreetType	= space[4]&&	[po 07/03/16 03:40:14 PM ]  
			#ENDIF
		endIF llDontTurnRed  		
		*			If loTxt.BaseClass = [Checkbox]
		llAllGood = llAllGood And llDontTurnRed

		&&	[po 06/18/16 09:51:45 PM ] 		lcvfox = [insert into ( tcCrs) (]+ lcflds + [) values (]+   lcvfox + [)]
	Endif loNominate.BaseClass = [Container]
	If 	llBAIL
		Exit
	Endif

Endfor Each loNominate In toDefFrm.Controls

Return llAllGood

  