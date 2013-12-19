program uebung1;

type 
	link = ^node;
	node = Record
		left:link;
		right:link;
		key_nachname:String;
		key_vorname:String;
	End;

var
	root:link; i:Integer;

(* Ein Element in den Baum einfügen. *)
procedure insertNode(var n:link; nachname:String; vorname:String);
	Begin
		IF n = NIL Then
			Begin
				new(n);
				n^.left:=NIL;
				n^.right:=NIL;
				n^.key_nachname:=nachname;
				n^.key_vorname:=vorname;
			End
		ELSE
			Begin
				IF nachname < n^.key_nachname Then
					Begin
						insertNode(n^.left, nachname, vorname);
					End
				ELSE IF nachname > n^.key_nachname Then
					Begin
						insertNode(n^.right, nachname, vorname);
					End
				ELSE
					writeln('Schluessel schon vorhanden');
			End;
	End;
	
(* Den Baum ausgeben. *)
procedure printTree(var start:link; name:String);
	Begin
		writeln(name + ' ' + start^.key_nachname);
		IF NOT (start^.left = NIL) Then
			printTree(start^.left,'Linker Teilbaum von ' + start^.key_nachname);
		IF NOT (start^.right = NIL) Then
			printTree(start^.right,'Rechter Teilbaum von ' + start^.key_nachname);
	End;

(* Die 10 Namen direkt von dem Nutzer in den Baum einfügen. *)
procedure insertUsersInput();
	var
		nachname, vorname:String;
	Begin
		writeln('Geben Sie einen Nachnamen ein: ');
		readln(nachname);
		writeln('Nun geben Sie einen Vornamen ein: ');
		readln(vorname);
		insertNode(root, nachname, vorname)
	End;

(* Mainprogram *)	
Begin
	(* 10 Nutzereingaben für den Baum *)
	FOR i:=0 TO 10 DO
		insertUsersInput();
		
	(* Baum ausgeben *)
	printTree(root, 'root');
End.