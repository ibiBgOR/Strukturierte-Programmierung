unit unitLogin;

interface
function login() : Boolean;

implementation

(* Die Funktion zum Einloggen *)
function login() : Boolean;
	var logInvar:Boolean; userinDB:Boolean; sEingPsw:String; i:Integer;sEingName:String;
	const sEingNameame= 'test'; sPasswort='qwertzui1';
	Begin
		logInvar := false;
		userinDB := false;
		Repeat
			Begin
				Repeat 
					Begin
						writeln ('Geben Sie Ihren Nutzernamen ein.');
						readln(sEingName);
						if (sEingName <> sEingNameame) then
							Begin
								writeln ('User nicht in der Datenbank vorhanden');
							End
						else
							userinDB := true;
					End;
				Until userinDB = true;
				Begin
					for i:=0 to 3 do
						Begin
							writeln('Geben Sie das Passwort ein.');
							readln(sEingPsw);
							if (sEingPsw = sPasswort) then
								Begin
									logInvar := true;
									break;
								End
							else
								writeln('Das eingegebene Passwort ist falsch.');
						End;
				End;
				break;
			End
		Until (logInvar = true);
		if(loginvar = true) then
			Begin
				writeln('Sie sind eingeloggt.');
			End
		else
			writeln('Sie sind nicht eingeloggt.');
	End;
End.