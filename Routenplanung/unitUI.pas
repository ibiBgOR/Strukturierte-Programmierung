unit unitUI;

interface

uses graph, wincrt,forms;
procedure initUI(screen:Integer);


implementation

(* Zum ausmalen von Dreiecken, da "FloodFill dies nicht richtig macht. *)
procedure fill4(x,y:Integer; oldColor:Integer; newColor:Integer);
	Begin
		if (getPixel(x, y) = oldColor) Then
			Begin
			putPixel(x, y, newColor);
			
			fill4(x, y + 1, oldColor, newColor); (* unten 	*)
			fill4(x - 1, y, oldColor, newColor); (* links 	*)
			fill4(x, y - 1, oldColor, newColor); (* oben 	*)
			fill4(x + 1, y, oldColor, newColor); (* rechts 	*)
			End;
	End;


(* Eine Hütte auf das UI zeichnen. *)
procedure drawHuette(x:Integer;y:Integer);
	Begin
		(* Body *)
		SetColor(Brown);
		Rectangle(x+2,y+75,x+52,y+25);
		SetFillStyle(SolidFill,Brown);
		FloodFill (x+27,y+50,Brown);
		(* Dach *)
		SetColor(Red);
			(* Groundline *)
		Line(x,y+25,x+54,y+25);
			(* Linke linie *)
		Line(x,y+25,x+27,y);
			(* Rechte Linie *)
		Line(x+54,y+25,x+27,y);
		fill4 (x+25,y+10,black,Red);
	End;

(* Einen Button auf das UI legen. *)
procedure addButton(x:Integer;y:Integer;height:Integer;width:Integer;name:String);
	Begin
		
    End;

(* Das sichtbare Fenster. *)
procedure initWindow(screen:Integer);
	var
		gd, gm: smallint;
	Begin
		gd := D8bit;
		gm := m640x480;
		initgraph(gd,gm,'');

		SetBkColor(white);
		ClearViewPort;
		
		(* Alle Hütten aus der Huetten.txt zeichnen. *)
		drawHuette(50,50);
	End;
	
(* Baut die Grafische Oberfläche auf. (screen: 1 = Login | 2 = Routenplanung | 3 = Hüttenverwaltung *)
procedure initUI(screen:Integer);
	Begin
		initWindow(screen);
		
		(* Schließbedingung: Wenn ESC gedrückt wird beende das Programm. *)
		repeat until ReadKey=#27;
		closegraph;
	End;
End.
