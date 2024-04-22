unit UCCadena;

interface
Uses SysUtils;
Const
    MaxC=2048;
    Separador=[' ',',',';','.'];
    Vocales=['A','E','I','O','U'];
    Numero=['0'..'9','.','-'];
Type
    Cadena = Class
      Private
          Longitud : Word;
          Caracteres : Array[1..MaxC] of Char;
      Public
          Function Long:Word;
          Function getChar(p:Word):Char;
          Function getStr:String;
          Function countWord:Word;
          Function nextWord(Var i:Word):String;
          Function nextNumber(Var i:Word):String;

          Function countWordVocal:Word;
          Procedure addChar(c:Char);
          Procedure addStr(s:String);
          Procedure modChar(p:word;c:char);
          Procedure insChar(p:word;c:char);
          Procedure delChar(p:Word);
          Procedure invertChar;
          Procedure Intercambiar(i,f:Word);
          Function sumNumber:Real;

          function getPalMayorLong: string;
          procedure elimEntreParentesis;
          procedure aMinuscula;
          procedure aMayuscula;
          function StrToEntero: word;
          procedure delWord(p: word);
          function nWord(p: Word): String;



    End;


implementation

{ Cadena }


procedure Cadena.delWord(p: word);
var i, c: word;
pal: string;
begin
  if (p>0) and (p<=countWord) then begin
   i:=1; c:=1;
   while c<>p do begin
      if not (Caracteres[i] in Separador) And (Caracteres[i+1] in Separador)  then c:=c+1;
      i:=i+1;
   end;
   while Caracteres[i] in Separador do i:=i+1;
   while not (Caracteres[i] in Separador) and (i<=Longitud)do
    delChar(i);
  end else raise Exception.Create('Error: posicion no valida');
end;


function Cadena.nWord(p: Word): String;
Var
   k,c: Word;
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

function Cadena.StrToEntero: word;
var i, res: word;
begin
  res := 0;
  for i := 1 to Longitud do
    res := res*10 + (ord(Caracteres[i]) - 48);
  result := res;
end;
procedure Cadena.aMayuscula;
var i: word;
begin
  for i := 1 to Longitud do begin
    if caracteres[i] in ['a'..'z', '�'..'�'] then
      //transormate a mayuscula
      Caracteres[i] := chr(ord(caracteres[i]) - 32);
  end;
end;


procedure Cadena.aMinuscula;
var i: word;
begin
  for i := 1 to Longitud do begin
    if caracteres[i] in ['A'..'Z', '�'..'�'] then
      Caracteres[i] := chr(ord(caracteres[i]) + 32);
  end;
end;


procedure Cadena.elimEntreParentesis;
var i, j: word;
begin
  for i := 1 to Longitud do begin

    if caracteres[i] = '(' then begin
      j := i;
      while (caracteres[j] <> ')') and (j <= longitud) do begin
        delChar(j);
      end;
      if j <= longitud then delChar(j);
    end;

  end;
end;
function Cadena.getPalMayorLong: string;
var res, aux: string;
    i: word;
begin
  res := '';
  i := 1;
  while i<=longitud do begin
    aux := nextWord(i);
    if length(aux) > length(res) then res := aux;
  end;
  result := res;
end;

procedure Cadena.addChar(c: Char);
begin
     Inc(Longitud);
     Caracteres[Longitud]:=c;
end;

procedure Cadena.addStr(s: String);
var
  I: Integer;
begin
     Longitud:=Length(s);
     for I := 1 to Longitud do
        Caracteres[i]:=S[i];
end;

function Cadena.countWord: Word;
Var
  i,C : Word;
begin
     i:=1;C:=0;
     while i<Longitud do
     Begin
          if Not (Caracteres[i] in Separador)And(Caracteres[i+1] in Separador) then
             C:=C+1;
          i:=i+1;
     End;
     if (i<=Longitud) And (Not (Caracteres[i] in Separador)) Then
        C:=C+1;
     Result:=C;
end;

function Cadena.countWordVocal: Word;
Var
  i,C : Word;
  p : String;
begin
     i:=1;C:=0;
     while i<=Longitud do
     Begin
          p:=nextWord(i);
          if (Upcase(p[1]) in Vocales)And(Upcase(p[length(p)]) in Vocales) then
             C:=C+1;
     End;
     Result:=C;
end;

procedure Cadena.delChar(p: Word);
var
  I: Word;
begin
     if (p>0)and(p<=Longitud) then
     Begin
          for I := p to Longitud-1 do
              Caracteres[i]:=Caracteres[i+1];
          Dec(Longitud);
     End
     Else raise Exception.Create('Error Message');
end;

function Cadena.getChar(p: Word): Char;
begin
     if (p>0)and(p<=Longitud) then
     Begin
          Result:=Caracteres[p];
     End
     Else raise Exception.Create('Error Message');
end;

function Cadena.getStr: String;
Var
  s :  String;
  I: Integer;
begin
     s:='';
     for I := 1 to Longitud do
        s:=s+Caracteres[i];
     Result:=s;
end;

procedure Cadena.insChar(p: word; c: char);
Var
  I : Word;
begin
     if (p>0)and(p<=Longitud) then
     Begin
          Inc(Longitud);
          for I := Longitud downto p+1 do
              Caracteres[i]:=Caracteres[i-1];
          Caracteres[p]:=c;
     End
     Else raise Exception.Create('Error Message');
end;

procedure Cadena.Intercambiar(i, f: Word);
Var
  c: Char;
begin
     c:=Caracteres[i];
     Caracteres[i]:=Caracteres[f];
     Caracteres[f]:=c;
end;

procedure Cadena.invertChar;
Var
  i,f : Word;
begin
     i:=1;f:=Longitud;
     while (i<f) do
     Begin
          Intercambiar(i,f);
          inc(i);dec(f);
     End;
end;

function Cadena.Long: Word;
begin
     Result:=Longitud;
end;

procedure Cadena.modChar(p: word; c: char);
begin
    if (p>0)and(p<=Longitud) then
     Begin
         Caracteres[p]:=c;
     End
     Else raise Exception.Create('Error Message');
end;

function Cadena.nextNumber(var i: Word): String;
Var
  s: String;
begin
     While(i<=Longitud)And(Caracteres[i] in Separador) do
         i:=i+1;
     s:='';
     While(i<=Longitud)And (Caracteres[i] in Numero) do
     Begin
          s:=s+Caracteres[i];
          i:=i+1;
     End;
     Result:=s;
end;

function Cadena.nextWord(Var i: Word): String;
Var
  s: String;
begin
     While(i<=Longitud)And(Caracteres[i] in Separador) do
         i:=i+1;
     s:='';
     While(i<=Longitud)And not (Caracteres[i] in Separador) do
     Begin
          s:=s+Caracteres[i];
          i:=i+1;
     End;
     Result:=s;
end;

function Cadena.sumNumber: Real;
//Var
//  i : Word;
//  R,n : Real;
//begin
//    i:=1;R:=0;
//     while i<=Longitud do
//     Begin
//         n:=StrToFloat(nextNumber(i));
//         R:=R+n;
//     End;
//     Result:=R;
//end;

var
i: word;
numStr: string;
sum: real;
begin
 i := 1;
 sum := 0.0;
 while i <= longitud do
 begin
  numStr := nextNumber(i);
  if numStr <> '' then
    sum := sum + StrToFloat(numStr);
 end;
 result := sum;

end;

end.
