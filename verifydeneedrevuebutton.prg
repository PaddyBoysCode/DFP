*verifyDEneedRevueButton.prg
Parameters toctrl2nrrw
Local lcbtn, lobtn
lcbtn = [awcmd]-Strtran[toctrl2nrrw.name,'txt']
lcvfox = 'lobtn = toctrl2nrrw.Parent.'- lcbtn
&lcvfox

If toctrl2nrrw.Left +toctrl2nrrw.Width > lobtn.Left
	toctrl2nrrw.Width = toctrl2nrrw.Width - 25 	&&	22	[po 07/01/16 05:19:31 PM ] 
Endif toctrl2nrrw.Left +toctrl2nrrw.Width > lobtn.Left
lobtn.Visible = .T.