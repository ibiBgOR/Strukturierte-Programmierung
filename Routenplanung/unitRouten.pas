unit unitRouten;

interface
procedure findWay(var zeit:integer);
function getDistance():Integer;

implementation

(* Findet den besten Weg bei einer gegebenen Zeit. *)
procedure findWay(var zeit:integer);
	type Huette = Record
		name: String;
		wege: Integer;
		weglaenge: Integer;
		abstiegname: String;
	End;
	var huetten: array[0..4] of Huette = ((name:'Huette 1';wege:2;weglaenge:11;abstiegname:'Abstieg A'),
				(name:'Huette 2';wege:1;weglaenge:5;abstiegname:''),
				(name:'Huette 3';wege:2;weglaenge:11;abstiegname:'Ausstieg B'),
				(name:'Huette 4';wege:2;weglaenge:5;abstiegname:'Ausstieg C'),
				(name:'Huette 5';wege:1;weglaenge:0;abstiegname:'Ausstieg D'));
		timecounter:integer;
		iDerzHuette:integer;
		iTemp:integer;
	
	Begin
		(* Bei weniger als 2 Tegen reicht die Zeit nicht aus um zu einer Hütte zu gehen und wieder runter zu steigen. *)
		if(zeit < 2) then
			Writeln('Die Zeit reicht nicht aus!')
		(* Wenn die Zeit als größer als 1 ist, kann ein Weg berechnet werden. *)
		else
			Begin
				(* Sollten nur drei Tage vorhanden sein, so ist nur ein Ein- und Ausstieg und Tagestouren möglich *)
				if(zeit = 3)then
					Begin
						writeln('Einstieg A -> Huette 1 -> Ausstieg A');
						writeln('Einstieg B -> Huette 3 -> Ausstieg B');
						writeln('Einstieg C -> Huette 4 -> Ausstieg C');
					end
				(* Bei mehr als 6 Tagen sind zu viele Tage möglich *)
				else if(zeit >= 6) then
					Begin
						iTemp:=5;
						findWay(iTemp);
						writeln('Ebenfalls haben Sie Zeit, sich laenger in bestimmten Huetten aufzuhalten.');
					End
				(* Bei weniger als 6 und mehr als 2 Tagen. *)
				else
					Begin
						writeln('Einstieg A -> Huette 1');
						timecounter := zeit-1;
						iDerzHuette := 1;
						(* Solange ich noch mehr als 1 Tag Zeit habe: *)
						while (timecounter > 1) do
							Begin
								(* Solange ich nicht zu weit gehe: *)
								if(iDerzHuette <= 4) then
								Begin
										writeln('-> ',huetten[iDerzHuette].name);
										iDerzHuette := iDerzHuette + 1;
										timecounter := timecounter - 1;									
								End;
							End;
						write('-> ',huetten[iDerzHuette].abstiegname);
						writeln('');
					End;
			End;
	End;
	
(* TODO: Abstand zwischen zwei Hütten. *)
function getDistance():Integer;
	Begin
		
	End;
End.
