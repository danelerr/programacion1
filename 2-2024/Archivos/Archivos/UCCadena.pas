﻿unit UCCadena;

interface

uses sysutils;

Const
  MaxC =2048;
  vocales = ['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U', 'À'..'Ü', '�'..'�'] - ['�', '�'];
  numeros = ['0'..'9'];
  letras = ['a'..'z', 'A'..'Z', 'À'..'Ü', 'à'..'ü'];

  Separador=[' ',',',';','.'];
  Consonantes=letras-Vocales;
Type
    Cadena = Class
      Private
          Longitud : Word;
          Caracteres : Array[1..MaxC] Of Char;
      Public
          Function getLong:Word;
          procedure cargarCadena(s: string);
          function mostrarCadena: string;

          Function getChar(i:Word):Char;
          Procedure addChar(c:Char);
          Procedure delChar(p:Word);
          Procedure insChar(p:Word;c:Char);
          Procedure modChar(i:Word;c:Char);


          function cantVocales: cardinal;
          procedure invertir;

          //copias de funciones existentes
          procedure toUpper;
          procedure toLower;
          function getInt: cardinal;

          //manejo a nivel de palabras
          Function countWord:Word;
          Function nextWord(var i:Word):String;
          Function NumWordCons:Word;
          Function findWord(p:String):Word;
          procedure delWord(p: word);
          function nWord(p: cardinal): String;
          procedure insWord(s: string; p: word);
          procedure insWordPal(s: string; p: word);

          //ejercicios con palabras
          procedure eliminarPalconSub(sub: string);
          procedure elimPalVocRepe;
          function getMaxLengthPal: string;

          //ejercicios
          procedure sumarNumeros;
          procedure reemplazarConPals(s: string);
          function obtenerMayBin: string;
          function sumarBinarios: cardinal;
          procedure sumarHoras;
    End;

implementation

{ Cadena }

procedure Cadena.addChar(c: Char);
begin
     Longitud:=Longitud+1;
     Caracteres[Longitud]:=c;
end;

function Cadena.cantVocales: cardinal;
var i, c: word;
begin
  c := 0;
  for i := 1 to Longitud do begin
    //preguntar si es vocal
    if caracteres[i] in vocales then c := c + 1;
  end;
  result := c;
end;

procedure Cadena.cargarCadena(s: string);
var i: word;
begin
  longitud := length(s);
  for i := 1 to longitud do begin
    caracteres[i] := s[i];
  end;
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

procedure Cadena.delChar(p: Word);
var i: Word;
begin
     Begin
         for I := p to Longitud-1 do
            Caracteres[i]:=Caracteres[i+1];
         dec(Longitud);
     End;
end;

function Cadena.getChar(i: Word): Char;
begin
     Result:=Caracteres[i];
end;

function Cadena.getInt: cardinal;
var i, res: word;
begin
  res := 0;
  for i := 1 to Longitud do begin
      res := res * 10 + (ord(caracteres[i]) - 48);
  end;
  result := res;
end;

function Cadena.getLong: Word;
begin
     Result:=Longitud;
end;

function Cadena.getMaxLengthPal: string;
var i: word;
  pal, max: string;
begin
  i := 1;
  max := '';
  while i <= longitud do begin
    pal := nextWord(i);
    if length(pal) > length(max) then max := pal;
  end;
  result := max;
end;

procedure Cadena.insChar(p: Word; c: Char);
var
  I: Word;
begin
     Begin
         Inc(Longitud);
         for I := Longitud downto p+1 do
            Caracteres[i]:=Caracteres[i-1];
         Caracteres[p]:=c;
     End
end;

procedure Cadena.invertir;
var i, j: Word;
  x: char;
begin
  i := 1;
  j := longitud;
  while i <= j do begin
    x := caracteres[i];
    caracteres[i] := caracteres[j];
    caracteres[j] := x;
    i := i + 1;
    j := j - 1;
  end;
end;

procedure Cadena.modChar(i: Word; c: Char);
begin

end;

function Cadena.mostrarCadena: string;
var
  res: string;
  i: word;
begin
  res := '';
  for i := 1 to longitud do begin
    res := res + caracteres[i];
  end;
  result := res;
end;

procedure Cadena.toLower;
var i: word;
begin
  for i := 1 to Longitud do begin
    if caracteres[i] in (letras - ['a'..'z', 'à'..'ü'])  then begin
      caracteres[i] := chr(ord(caracteres[i]) + 32);
    end;
  end;
end;

procedure Cadena.toUpper;
var i: word;
begin
  for i := 1 to Longitud do begin
    if caracteres[i] in (letras - ['À'..'Ü', 'A'..'Z']) then begin
      caracteres[i] := chr(ord(caracteres[i]) - 32);
    end;
  end;
end;

function Cadena.countWord: Word;
Var
  i,c:Word;
begin
     i:=1;c:=0;
     if not (Caracteres[Longitud] in separador) then
        c:=1;
     while i<Longitud do
     Begin
        if Not (Caracteres[i] in separador)And(Caracteres[i+1] in separador) then
           c:=c+1;
        i:=i+1;
     End;
     Result:=c;
end;

function Cadena.nextWord(var i: Word): String;
Var
   p : String;
begin
     while (i<=Longitud)And(Caracteres[i] in Separador) do
          i:=i+1;
     p:='';
     while (i<=Longitud)And not(Caracteres[i] in Separador) do
     Begin
          p:=p+Caracteres[i];
          i:=i+1;
     End;
     Result:=p;
end;


function Cadena.NumWordCons: Word;
Var
  p : String;
  i,c : Word;
begin
     c:=0;i:=1;
     while (i<=Longitud) do
     Begin
        p:=NextWord(i);
        if (p[1] in Consonantes)
        And(p[length(p)] in Consonantes) then
          c:=c+1;
     End;

end;


function Cadena.findWord(p: String): Word;
Var
  Pos,i : Word;
begin
      i:=1;Pos:=0;
      while (i<Longitud)And(Pos=0) do
      Begin
          if NextWord(i)=p then
              Pos:=i-Length(p);
      End;
      Result:=Pos;
end;


procedure Cadena.delWord(p: word);
var i, c: word;
pal: string;
begin
  if (p>0) and (p<=countWord) then begin
   i:=1; c:=1;
   while c<>p do begin
      if not (Caracteres[i] in separador) And (Caracteres[i+1] in separador)  then c:=c+1;
      i:=i+1;
   end;
   while Caracteres[i] in separador do i:=i+1;
   while not (Caracteres[i] in separador) and (i<=Longitud)do
    delChar(i);
  end else raise Exception.Create('Error: posicion no valida');
end;


procedure Cadena.insWordPal(s: string; p: word);
var i, c, j: word;
begin
  if (p>0) and (p<=countWord) then begin
   i:=1; c:=1;
   while c<>p do begin
      if not (Caracteres[i] in separador) And (Caracteres[i+1] in separador)  then c:=c+1;
      i:=i+1;
   end;

   insChar(i, ' ');
   insChar(i, ' ');
   i := i + 1;
   for j := 1 to length(s) do begin
    inschar(i+j, s[j]);
   end;
  end else raise Exception.Create('Error: posicion no valida');
end;


procedure Cadena.eliminarPalconSub(sub: string);
var
  i: word;
  pal: string;
begin
  i := 1;
  while i <= countWord do begin
    pal := nWord(i);
    if pos(sub, pal) > 0 then delWord(i)
    else  i := i + 1;
  end;
end;

procedure Cadena.elimPalVocRepe;
var
  i, k: word;
  pal, aux: string;
  b: boolean;
begin
  i := 1;
  b := false;
  while (longitud > 0) and (i <= countWord) do begin
    pal := nWord(i);
    pal := lowerCase(pal);
    aux := '';
    b := false;
    for k := 1 to length(pal) do begin
      if pal[k] in vocales then begin
         if pos(pal[k], aux) = 0 then aux := aux + pal[k]
         else begin
          b := true;
          break;
         end;
      end;
    end;
    if b then delWord(i)
    else i := i + 1;
  end;
end;

function Cadena.nWord(p: cardinal): String;
Var
   k: word;
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

function Cadena.obtenerMayBin: string;
var i: word;
  cad, may: string;
begin
  i := 1;
  may := '';
  while i <= longitud do begin
    cad := nextWord(i);
    if length(cad) > length(may) then may := cad
    else if (length(cad) = length(may)) and (cad > may) then may := cad;
  end;
  result := may;
end;

procedure Cadena.reemplazarConPals(s: string);
var i, j: word;
  cad: string;
  x: Cadena;
begin
  i := 1; j := 1;
  x := cadena.Create;
  x.cargarCadena(s);	
  
  while i <= CountWord do begin
    cad := nword(i);
    if cad = '{?}' then begin
      delWord(i);
      insWordPal(x.nextWord(j), i);
    end;
    i := i+1;
  end;
end;

function BintoDecimal(n: cardinal): cardinal;
var res, d, k: cardinal;
begin
  k := 1;
  res := 0;
  while n > 0 do begin
    d := n mod 10;
    n := n div 10;
    res := d*k + res;
    k := k * 2;
  end;
  result := res;
end;


function Cadena.sumarBinarios: cardinal;
var sum: cardinal;
i: word;
cad: string;
begin
  i := 1;
  sum := 0;
  while i <= longitud do begin
    cad := nextWord(i);
    sum := sum + BintoDecimal(StrToInt(cad));
  end;
  result := sum;
end;

procedure Cadena.sumarHoras;
var i, h, m, s: word;
cad: string;
begin
  i := 1; h := 0; m := 0; s := 0;
  while i <= longitud do begin
    cad := nextWord(i);
    h := h + StrToInt(cad[1]+cad[2]);
    m := m + StrToInt(cad[4]+cad[5]);
    s := s + StrToInt(cad[7]+cad[8]);
  end;
  m := m + s div 60;
  s := s mod 60;
  h := h + m div 60;
  m := m mod 60;
  cad := '';
  cad := cad + IntToStr(h) + ':' + IntToStr(m) + ':' + intToStr(s);
  cargarCadena(cad);
end;

procedure Cadena.sumarNumeros;
var aux: cardinal;
  I:word;
  cad: string;
begin
  i := 1;
  aux := 0;
  while i<=longitud do begin
    cad := nextWord(i);
    aux := aux + StrToInt(cad);
  end;
  //equivalente a hacer result
  cargarCadena(IntToStr(aux));
end;

end.
