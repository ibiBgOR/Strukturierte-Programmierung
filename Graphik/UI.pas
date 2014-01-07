program UI;

uses graph,wincrt,drawings;

var
  gd, gm: smallint;

Begin
   { Initialisierung des Grafikfensters }
  gd := D8bit;
  gm := m640x480;
  initgraph(gd,gm,'');

  SetBkColor(white);
  ClearViewPort;

  { Der Main-Teil des Projektes }
  drawNikolaus();
  Delay(20);
  Luftballons(200,90,blue,green,red);
  Luftballons(250,70,red,blue,green);
  Luftballons(300,100,blue,red,green);
  Luftballons(350,120,green,red,blue);
  MyEllipse(600,55);
  //Spirale(500,300);

  Huette(200,300,50,50);

  { Schließen des Fensters bei Tastendruck }
  repeat until KeyPressed;
  closegraph;
End.
