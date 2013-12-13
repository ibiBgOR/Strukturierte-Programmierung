program Stack;

type
  link = ^node;

  node = record
    key: integer;
    Next: link;
  end;

var
  A, Z: Link;

  procedure stackinit();
  begin
    new(A);
    new(Z);
    A^.Next := Z;
    Z^.Next := Z;
  end;

  procedure push(v: integer);
  var
    t: link;
  begin
    new(t);
    t^.key := v;
    t^.Next := A^.Next;
    A^.Next := t;
  end;

  function pop(): integer;
  var
    t: link;
  begin
    t := A^.Next;
    pop := t^.key;
    A^.Next := A^.next^.next;
    dispose(t);
  end;

  function isEmpty(): boolean;
  begin
    isEmpty := (A^.Next = Z);
  end;

  (* TODO: Pop() ersetzen, damit die Elemente in der Liste bleiben. *)
  procedure outStack();
  begin
    repeat
      writeln(pop());
    until isEmpty();
  end;

  procedure clearStack();
  begin
    repeat
      pop();
    until isEmpty();
  end;

begin
  stackinit();
  push(1);
  push(2);
  push(3);
  push(4);
  writeln(pop());
  writeln(pop());
  push(5);
  outStack();
  readln();
end.
