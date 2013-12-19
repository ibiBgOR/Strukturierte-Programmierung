program uebung1;

type 
	link = ^node;
	node = Record
		left:link;
		right:link;
		key_name:String;
	End;

var
	root:link; i:Integer; test:String;

(* Ein Element in den Baum einfügen. *)
procedure insertNode(var n:link; name:String);
	Begin
		IF n = NIL Then
			Begin
				new(n);
				n^.left:=NIL;
				n^.right:=NIL;
				n^.key_name:=name;
			End
		ELSE
			Begin
				IF name < n^.key_name Then
					Begin
						insertNode(n^.left, name);
					End
				ELSE IF name > n^.key_name Then
					Begin
						insertNode(n^.right, name);
					End
				ELSE
					writeln('Schluessel schon vorhanden');
			End;
	End;
	
(* Den Baum ausgeben. (Ebenfalls ein Traversierungsalgorithmus, jedoch preorder) *)
procedure printTree(var start:link; name:String);
	Begin
		writeln(name + ' ' + start^.key_name);
		IF NOT (start^.left = NIL) Then
			printTree(start^.left,'Linker Teilbaum von ' + start^.key_name);
		IF NOT (start^.right = NIL) Then
			printTree(start^.right,'Rechter Teilbaum von ' + start^.key_name);
	End;

(* Die 10 Namen direkt von dem Nutzer in den Baum einfügen. *)
procedure insertUsersInput();
	var
		name:String;
	Begin
		writeln('Geben Sie einen Namen ein (Nachname Vorname): ');
		readln(name);
		insertNode(root, name)
	End;
	
(* In dem Baum nach einem Namen suchen. *)
function searchName(var name:String; lnk:link):String;
	Begin
		IF name = lnk^.key_name Then
			Begin
				searchName:=name + ' ist enthalten.';
			End
		ELSE IF name < lnk^.key_name Then
			Begin
				IF NOT (lnk^.left = NIL) Then
					searchName(name, lnk^.left)
				ELSE
					searchName:=name + ' ist nicht enthalten.'
			End
		ELSE IF name > lnk^.key_name Then
			Begin
				IF NOT (lnk^.right = NIL) Then
					searchName(name, lnk^.right)
				ELSE
					searchName:=name + ' ist nicht enthalten.'			
			End;
	End;
	
(* Den Baum traversieren. (Jeden Knoten durchgehen) (inorder) *)
procedure traverseTreeInorder(lnk:link);
	Begin
		IF NOT (lnk = NIL) THEN
			BEGIN
				traverseTreeInorder(lnk^.left);
				writeln(lnk^.key_name);
				traverseTreeinorder(lnk^.right);
			END;
	End;

(* Mainprogram *)	
Begin		
	(* 10 Nutzereingaben für den Baum *)
	FOR i:=0 TO 10 DO
		insertUsersInput();
		
	(* Baum ausgeben *)
	printTree(root, 'root'); 
	
	(* Einen Namen suchen. *)
	test:='Haller';
	insertNode(root, 'Heller Hans');
	writeln(searchName(test, root));
	
	(* Traversieren inorder *)
	traverseTreeInorder(root);
End.