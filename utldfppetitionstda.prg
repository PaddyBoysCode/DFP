*utldfpPETITION.prg
Parameters toDefFrm, tcCrs
Select ( tcCrs)
Local lcvfox, loNominate, loTxt
For Each loNominate In toDefFrm.Controls
	If loNominate.BaseClass = [Container] AND loNominate.Visible 	&&	[po 07/05/16 09:09:31 PM ] 
		lcvfox = []
		lcflds = []
		* gather D/E from Nominated line
		For Each loTxt In loNominate.Controls
			If loTxt.BaseClass = [Textbox] And Not Empt[ loTxt.ControlSource]
				lcvfox = lcvfox + Iif[ empty[ lcvfox ], '', ','] +loTxt.ControlSource
				lcflds = lcflds + Iif[ empty[ lcflds], '', ','] +;
					ICASE(Justext[ loTxt.ControlSource] = [cvotehousenumber], [votehousen],;
					justext[ loTxt.ControlSource] = [cvotestreetname], [votestreet],;
					justext[ loTxt.ControlSource] = [cvotecity], [votecity],;
					justext[ loTxt.ControlSource] = [clst], [cName],;
					justext[ loTxt.ControlSource] = [cName], [cName],;
					chr[200];
					)&& 20 corrected
			Endif loTxt.BaseClass = [Textbox]
			If loTxt.BaseClass = [Textbox] And  Empt[ loTxt.ControlSource]
				LILINENO = int[val[tran[loTxt.Value]]]
			ENDIf loTxt.BaseClass = [Textbox] And  Empt[ loTxt.ControlSource]
		Endfor Each loTxt In loNominate
&&	[po 06/18/16 09:51:45 PM ] 		lcvfox = [insert into ( tcCrs) (]+ lcflds + [) values (]+   lcvfox + [)]
		lcvfox = [insert into ( tcCrs) (]+ lcflds + [) values (]+  strtran[ lcvfox, 'this.parent','loNominate',1,16,1] + [)]&& 24 crrctd
		*!* Step On
		&lcvfox
		REPLACE IN  ( tcCrs) TDATAENTRY	 WITH DATETIME[],;
			iLineNo WITH LILINENO ,;
			csheet WITH justfname[LCNEXTPDF ],;
			cuserid WITH Gcuserid 	&&	[po 06/19/16 08:37:02 AM ] logistics now done
*!*			Exit
		lcflds = []
	Endif loNominate.BaseClass = [Container]
Endfor Each loNominate In toDefFrm.Controls
*_CLIPTEXT = lcvfox
*!* Step On
