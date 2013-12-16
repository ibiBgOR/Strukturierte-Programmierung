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
		repeat
			begin
				repeat 
					begin
						writeln ('Geben Sie Ihren Nutzernamen ein.');
						readln(sEingName);
						if (sEingName <> sEingNameame) then
							begin
								writeln ('User nicht in der Datenbank vorhanden');
							end
						else
							userinDB := true;
					end;
				until userinDB = true;
				begin
					for i:=0 to 3 do
						begin
							writeln('Geben Sie das Passwort ein.');
							readln(sEingPsw);
							if (sEingPsw = sPasswort) then
								begin
									logInvar := true;
									break;
								end
							else
								writeln('Das eingegebene Passwort ist falsch.');
						end;
				end;
				break;
			end
		until (logInvar = true);
		if(loginvar = true) then
			begin
				writeln('Sie sind eingeloggt.');
			end
		else
			writeln('Sie sind nicht eingeloggt.');
	end;
	
End.
