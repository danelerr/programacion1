unit UCCadena;

interface
Uses SysUtils;

Const
    MaxC=1024;
    separadores = [' ', ',', ':', #13, #10];
Type
    Cadena = class
      Private
        Longitud   : Word;
        Caracteres : Array[1..MaxC] of Char;
      Public
        Function Size:Word;
        Function getChar(p:word):char;
        Procedure addChar(c:char);
        Procedure delChar(p:Word);
        Procedure insChar(p:Word; c:Char);
        Procedure modChar(p:Word; c:Char);
        function getCadena: string;
        procedure addCadena(cad: string);
        procedure invertir;
        procedure toMayuscula;
        procedure toMinuscula;
        function toEntero: cardinal;
        function cantPals: cardinal;
        //funciones agregadas
        function nextWord(var p: cardinal): String;
        procedure delWord(p: word);
        function nWord(p: cardinal): String;
        function countWord: Word;
        function bigLong: String;
        procedure findAndReplace(sBuscar, sRemplazar: string);
        procedure insWord(s: string; p: word);
        procedure deleteChars(i, f: word);
        function getCodeMinPeso: string;
        function modeloSinonimo(s: string): string;
        function operarCadena: integer;
    End;

implementation

{ Cadena }


function Cadena.operarCadena: integer;
var num, res, i: integer;
op: char;
begin
  op:='k';
  num := 0;
  res := 0;
  for i := 1 to longitud do begin
    if caracteres[i] in ['0'..'9'] then
          num := num*10+StrToInt(caracteres[i]);

    if (i > 1) and not (caracteres[i] in ['0'..'9']) and (caracteres[i-1] in ['0'..'9']) then begin
        if op = '+' then res := res + num
        else if op = '-' then  res := res - num
        else res := num;
        op:='k';
        num := 0;
    end;

    if caracteres[i] in ['+', '-'] then op := caracteres[i];
  end;
  if caracteres[longitud] in ['0'..'9'] then begin
    if op = '+' then res := res + num
    else if op = '-' then  res := res - num;
  end;
  result := res;
end;

function Cadena.nextWord(var p: cardinal): String;
Var
  s : String;
begin
     While(p<=Longitud)And(Caracteres[p] in separadores) do
        p:=p+1;
     s:='';
     While(p<=Longitud)And not(Caracteres[p] in separadores) do
     Begin
          s:=s+Caracteres[p];
          p:=p+1;
     End;
     Result:=s;
end;



procedure Cadena.delWord(p: word);
var i, c: word;
pal: string;
begin
  if (p>0) and (p<=countWord) then begin
   i:=1; c:=1;
   while c<>p do begin
      if not (Caracteres[i] in separadores) And (Caracteres[i+1] in separadores)  then c:=c+1;
      i:=i+1;
   end;
   while Caracteres[i] in separadores do i:=i+1;
   while not (Caracteres[i] in separadores) and (i<=Longitud)do
    delChar(i);
  end else raise Exception.Create('Error: posicion no valida');
end;


procedure Cadena.findAndReplace(sBuscar, sRemplazar: string);
var i, j: cardinal;
pal: string;
begin
  i := 1;
  j := 1;
  while i <= longitud do begin
    while caracteres[j] in separadores do j:=j+1;
    pal := nextWord(i);
    if lowerCase(pal) = lowerCase(sBuscar) then begin
      deleteChars(j, length(pal));
      insWord(sRemplazar, j);
    end;
    j := i;
  end;


end;






function Cadena.nWord(p: cardinal): String;
Var
   k,c: cardinal;
   pal : String;
begin
     if (p>0) and (p<=countWord) then
     Begin
          k:=1;
          while p>0 do
          begin
               Pal:=nextWord(k);
               p:=p-1;
           end;
           result:=Pal;
     End
     Else raise Exception.Create('La posicion no es valida');
end;


function Cadena.countWord: Word;
Var
  i,c:Word;
begin
     i:=1;c:=0;
     if not (Caracteres[Longitud] in separadores) then
        c:=1;
     while i<Longitud do
     Begin
        if Not (Caracteres[i] in separadores)And(Caracteres[i+1] in separadores) then
           c:=c+1;
        i:=i+1;
     End;
     Result:=c;
end;


function Cadena.bigLong: String;
var i, lm: cardinal;
p, pm: string;
begin
     i:=1; lm:=0;
     while i<=Longitud do
     Begin
          p:=nextWord(i);
          if Length(p)>Lm then
          Begin
               lm:=Length(p);
               pm:=p;
          End;
     End;
     Result:=pm;
end;

procedure Cadena.addCadena(cad: string);
var i: integer;
begin
    longitud := length(cad);
    for I := 1 to length(cad) do begin
    caracteres[i] := cad[i];
    end;
end;

procedure Cadena.addChar(c: Char);
begin
     Inc(Longitud);
     Caracteres[Longitud]:=c;
end;

function Cadena.cantPals: cardinal;
var i, cant: cardinal;
begin
  cant := 0;
  for i := 1 to longitud-1 do begin
     if (caracteres[i] in separadores) and not (caracteres[i+1] in separadores) then
        cant := cant+1;
  end;
  if not (caracteres[longitud] in separadores) then cant:=cant+1;

  result := cant;
end;

procedure Cadena.delChar(p: Word);
var
  I: Word;
begin
     if (p>0) And (p<=Longitud) then
     Begin
         for I := p to Longitud-1 do
            Caracteres[i]:=Caracteres[i+1];
         dec(Longitud);
     End
     Else raise Exception.Create('Posicion fuera de rango');
end;

procedure Cadena.deleteChars(i, f: word);
var j: word;
begin
  if (i>0) And (i<=Longitud) then begin
    for j := i to longitud-1 do
        caracteres[j] := caracteres[j+f];
    longitud := longitud - (f - i + 1);
  end;
end;

function Cadena.getCadena: string;
var x: string;
i: integer;
begin
  x := '';
  for i := 1 to longitud do  begin
    x := x + Caracteres[i];
  end;
  result := x;
end;

function Cadena.getChar(p: word): char;
begin
     if (p>0) And (p<=Longitud) then
       Result:=Caracteres[p]
     Else raise Exception.Create('Posicion fuera de rango');
end;
{
1.
AA-34k, OAS-100g, IOP-13K

2.

input = monitor

cod = 5
codSin = 7
input = monitor





}

function getNum(s: string): cardinal;
begin
  s := copy(s, pos('-', s)+1, length(s));
  result := StrToInt(copy(s, 1, length(s)-1));
end;

function getPeso(s: string): cardinal;
begin
  if s[length(s)] in ['k', 'K'] then result := getNum(s)*1000
  else result := getNum(s);
end;

function getCode(s: string): string;
begin
  result := copy(s, 1, pos('-', s)-1);
end;


//copy(cad, posI, posF);
//cad = "abcdef";
//copy(cad, 2, 3) = bcd;






function Cadena.getCodeMinPeso: string;
var i: cardinal;
  pal, res: string;
begin
  i := 1;
  res := nextWord(i);
  while i <= longitud do begin
    pal := nextWord(i);
    if (pal <> '') and (getPeso(pal) < getPeso(res)) then res := pal;
  end;
  result := getCode(res);
end;

procedure Cadena.insChar(p: Word; c: Char);
var
  I: Word;
begin
     if (p>0) And (p<=Longitud) then
     Begin
         Inc(Longitud);
         for I := Longitud downto p+1 do
            Caracteres[i]:=Caracteres[i-1];
         Caracteres[p]:=c;
     End
     Else raise Exception.Create('Posicion fuera de rango');
end;

procedure Cadena.insWord(s: string; p: word);
var i: word;
begin
  if (p>0) And (p<=Longitud) then begin
     longitud := longitud + length(s);
     for i := longitud downto p+length(s) do begin
       Caracteres[i]:=Caracteres[i-length(s)];
     end;
     for i := p to p+length(s)-1 do begin
        caracteres[i] := s[i-p+1];
     end;
  end;
end;



procedure Cadena.invertir;
var i, f: integer;
aux: char;
begin
  i := 1;
  f := longitud;
  while i <= f do begin
    aux := caracteres[i];
    caracteres[i] := caracteres[f];
    caracteres[f] := aux;
    i := i+1;
    f := f-1;
  end;
end;

procedure Cadena.modChar(p: Word; c: Char);
begin
     if (p>0) And (p<=Longitud) then
        Caracteres[p]:=c
     else raise Exception.Create('Posicion fuera de rango');
end;
//7 computadora->5, 5 monitor->7, 2 gato->9, 9 felino->2

function Cadena.modeloSinonimo(s: string): string;
var i, codSinPal, codSinPal2, codPal, codPal2: cardinal;
  pal, pal2: string;
  find: boolean;
begin
  i := 1;
  find := false;
  while i <= longitud do begin
    codPal := StrToInt(nextWord(i));
    pal := nextWord(i);
    codSinPal := StrToInt(copy(pal, pos('>', pal)+1, length(pal)));
    pal := copy(pal, 1, pos('-', pal)-1);
    if pal = s then begin
       find := true;
       break;
    end;
  end;
  i:=1;
  while (find) and (i <= longitud) do begin
    codPal2 := StrToInt(nextWord(i));
    pal2 := nextWord(i);
    codSinPal2 := StrToInt(copy(pal2, pos('>', pal2)+1, length(pal2)));
    pal2 := copy(pal2, 1, pos('-', pal2)-1);
    if (codSinPal2 = codPal) and (codPal2 = codSinPal) then exit(pal2);
  end;
  exit('no encontre el sinomino de ' + s);
end;

function Cadena.Size: Word;
begin
     Result:=Longitud;
end;

function Cadena.toEntero: cardinal;
var i, x: integer;
begin
    x := 0;
  for i := 1 to longitud do begin
     x := x *10 + (ord(caracteres[i]) - 48);
  end;
  result := x;
end;

procedure Cadena.toMayuscula;
var i: integer;
begin
  for i := 1 to longitud do begin
    if caracteres[i] in ['a'..'z'] then
      caracteres[i] := chr(ord(caracteres[i])-32);
  end;
end;

procedure Cadena.toMinuscula;
var i: integer;
begin
  for i := 1 to longitud do begin
    if caracteres[i] in ['A'..'Z'] then
      caracteres[i] := chr(ord(caracteres[i])+32);
  end;
end;

end.

