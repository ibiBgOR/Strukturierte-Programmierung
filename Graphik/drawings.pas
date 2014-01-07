unit drawings;

interface

uses graph,wincrt;

procedure drawNikolaus();
procedure Luftballons(x,y:integer;Color1,Color2,Color3:integer);
procedure MyEllipse(x,y:integer);
procedure Spirale(x,y:Integer);
// procedure Huette(x,y:Integer);

implementation

(* Zum Ausmalen von Dreiecken, da "FloodFill" dies nicht richtig macht. *)
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

{ Das Haus vom Nikolaus }
procedure drawNikolaus();
Begin
  SetColor(blue);
  Line(90,90,90,150);
  Line(90,150,150,150);
  Line(150,150,150,90);
  Line(150,90,90,90);
  Line(90,90,150,150);
  Line(150,90,90,150);
  Line(90,90,120,60);
  Line(150,90,120,60);
End;

{ Luftballon mit Wimpel }
procedure Luftballons(x,y:integer;color1,color2,color3:integer);
Begin
  //Luftballon
  SetColor(Color1);
  Arc(x,y,0,180,25);
  Ellipse(x,y,360,180,25,50);
  SetFillStyle(SolidFill,Color1);
  Fill4(y+10,y+10,Color1,Color1);
  //Schnur
  SetColor(blue);
  Ellipse(x,y+70,270,90,10,20);
  Ellipse(x,y+110,0,90,10,20);
  Ellipse(x,y+110,270,360,10,20);
  //Wimpel
  SetColor(Color2);
  Line(x-9,y+80,x-24,y+75);
  Line(x-24,y+75,x-20,y+92);
  Line(x-20,y+92,x-9,y+80);
  SetColor(Color3);
  Line(x+9,y+100,x+19,y+85);
  Line(x+19,y+85,x+26,y+105);
  Line(x+26,y+105,x+9,y+100);
End;

procedure MyEllipse(x,y:integer);
Begin
  SetColor(Black);
  SetFillStyle(SolidFill,Green);
  FillEllipse(x,y,25,50);
  SetFillStyle(SolidFill,lightGreen);
  SetColor(lightGreen);
  FillEllipse(x+5,y-25,10,15);
End;

{ Fibonacci-Folge als Standpunkt für die Spirale }
function fib(n : integer) : int64;
var i:int64;
begin
    if n <= 2 then fib := 1
    else fib := fib(n-2) + fib(n-1);
end;

{ Spirale }
procedure Spirale(x,y:Integer);
var result,i,num:int64;
Begin
  SetColor(Blue);
  num:=10;
  for i:=1 to num do
  begin
    result:= fib(i);
    writeln(i, ' : ', result);
  end;
end;

{procedure Huette(x,y,height,width:Integer);
Var widthhalf:integer;
Begin
	SetColor(Yellow);
	Rectangle(x,y+10,height+x,width+x);
	{ Hier kommt noch die Implementation für das Dach.}
        widthhalf:=(int)width/2;
	Line(x+widthhalf,y,x,y+10);
	Line(x+widthhalf,y,x+width,y+10);
End;
}
end.

