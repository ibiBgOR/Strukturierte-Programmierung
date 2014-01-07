unit unitVerwaltung;

interface
uses sysutils;
procedure addHuette(name:String;wege:integer;weglaenge:integer;abstiegname:String);
procedure initHuetten();

implementation
	
	const FileName = 'Huetten.txt';
	
	type Huette = Record
		name: String;
		wege: Integer;
		weglaenge: Integer;
		abstiegname: String;
	End;
	
	(* Eine gegebene Hütte in die Huetten.txt speichern. *)
	procedure saveToDat(huette:Huette);
		var FileVar: TextFile;
		Begin
			Assign(FileVar, FileName);
			Append(FileVar);
			Write(FileVar,chr(10)+huette.name+'#'+intToStr(huette.wege)+'#'+intToStr(huette.weglaenge)+'#'+huette.abstiegname);
			Close(FileVar);
		End;
		
	(* Lädt eine Hütte aus der Datei Huetten.txt. *)
	function loadFromDat():Huette;
		var FileVar:TextFile; return:Huette;
		Begin
			Assign(FileVar, FileName);
			Reset(FileVar);
			Close(FileVar);
			loadFromDat:=return;
		End;
		
	(* Öffentliche Methode zum hinzufügen von Hütten. *)
	procedure addHuette(name:String;wege:integer;weglaenge:integer;abstiegname:String);
		var saveHuette:Huette;
		Begin
			saveHuette.name:=name;
			saveHuette.wege:=wege;
			saveHuette.weglaenge:=weglaenge;
			saveHuette.abstiegname:=abstiegname;
			saveToDat(saveHuette);
		End;
		
	(* TODO: Öffentliche Methode zum laden von allen Hütten aus der Datei. *)
	procedure initHuetten();
		Begin
			
		End;
End.
