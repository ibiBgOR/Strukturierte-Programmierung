unit unitVerwaltung;

interface
procedure addHuette(name:String,wege:integer,weglaenge:integer,abstiegname:String);

implementation
	
	const FileName:='Huetten.txt';
	
	type Huette = Record
		name: String;
		wege: Integer;
		weglaenge: Integer;
		abstiegname: String;
	End;
	
	procedure addHuette(name:String,wege:integer,weglaenge:integer,abstiegname:String);
		var 
		Begin
			
		End;

		
	procedure saveToDat(huette:Huette);
		var FileVar: TextFile;
		Begin
			Assign(FileVar, FileName);
			Append(FileName);
			Writeln(FileVar,huette.name+'#'+huette.wege+'#'+huette.weglaenge+'#'+huette.abstiegname);
			Close;
		End;
		
	function loadFromDat();
		var FileVar:TextFile;
		Begin
			Assign(FileVar, FileName);
			Reset(FileName);
			Close;
		End;
		
	
End.