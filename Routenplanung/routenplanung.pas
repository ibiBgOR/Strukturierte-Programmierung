program routenplanung;
uses unitLogin,unitRouten;
var eing:integer;

(* Die Hauptfunktion *)
Begin
	//login();
	writeln('Wie viele Tage haben Sie Zeit?');
	readln(eing);
	findWay(eing);
End.