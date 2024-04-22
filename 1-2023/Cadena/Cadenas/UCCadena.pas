unit UCCadena;

interface
Uses SysUtils;
  Const
    MaxC = 2048;
    Sep  = [' ',',',';','.'];
  Type
      Cadena= Class
        Private
            Longitud : Word;
            Caracteres : Array[1..MaxC] of Char;
        Public
            Function Long:Word;
            Function getChar(p:Word):Char;
            Function getStr:String;
            Function getNumWord:Word;
            Function nextWord( var p:Word):String;
            Function maxWord:String;
            Procedure addStr(s:String);
            Procedure addChar(c:Char);
            Procedure modChar(p:Word;c:Char);
            Procedure insChar(p:Word;c:Char);
            Procedure delChar(p:Word);
            procedure insWord(s: string; p: word);
            procedure deleteChars(i, f: word);
            //palabras con pesos y codigos
            function examen1a: string;
            //la vaina de los sinonimos
            function Sinonimo(pal: string): string;

            function nextWordTest: string;

      End;

implementation

{ Cadena }

function Cadena.nextWordTest: string;
var s: string;
i: word;
begin
  s := '';
  i := 1;
  while i<=Longitud do s := s + nextWord(i) + #13#10;
  result := s;
end;


function Cadena.Sinonimo(pal: string): string;
var
  npal: string;
  cod, codSin, i: word;
  cod2, codSin2: word;
  find: boolean;
begin
  i := 1;
  find := false;
  pal := LowerCase(pal);
  while i<=Longitud do begin
    cod := StrToInt(nextWord(i));
    npal := LowerCase(nextWord(i));
    codSin := StrToInt( copy(npal, pos('>', npal)+1, length(npal)) );
    npal := copy(npal, 1, pos('-', npal)-1);
    if pal = npal then begin
      find := true;
      break;
    end;
  end;
  if not find then exit('no encontre esa palabra');
  i := 1;
  while i<=Longitud do begin
    cod2 := StrToInt(nextWord(i));
    npal := LowerCase(nextWord(i));
    codSin2 := StrToInt( copy(npal, pos('>', npal)+1, length(npal)) );
    npal := copy(npal, 1, pos('-', npal)-1);
    if (codSin = cod2) and (codSin2 = cod) then exit(npal);
  end;
  exit('No encontre el sinonimo de ' + pal);
 end;





procedure Cadena.addChar(c: Char);
begin
     inc(Longitud);
     Caracteres[Longitud]:=c;
end;

procedure Cadena.addStr(s: String);
var
  I: Integer;
begin
     Longitud:=Length(s);
     for I := 1 to Length(s) do
      Caracteres[i]:=s[i];
end;

procedure Cadena.delChar(p: Word);
var
  I: Word;
begin
     if (p>0)And(p<=Longitud) then
     Begin
         for I := p to Longitud-1 do
            Caracteres[i]:=Caracteres[i+1];
         Dec(Longitud);
     End Else raise Exception.Create('Error Message');
end;

procedure Cadena.deleteChars(i, f: word);
var
  j: Word;
begin
  if (i>0)And(i<=Longitud) then begin
         for j := i to Longitud-1 do
            Caracteres[j] := Caracteres[j+f];
         longitud := longitud -  (f - i + 1);
     End Else raise Exception.Create('Error Message');
end;

function Cadena.getChar(p: Word): Char;
var
  I: Word;
begin
     if (p>0)And(p<=Longitud) then
     Begin
          Result:=Caracteres[p];

     End Else raise Exception.Create('Error Message');


end;

function Cadena.getNumWord: Word;
Var
   i,r:Word;
begin
     i:=1;r:=0;
     While(i<Longitud) do
     Begin
          if not(Caracteres[i] in Sep)And(Caracteres[i+1] in Sep) Then
             r:=r+1;
          i:=i+1;
     End;
     if not (Caracteres[i] in Sep) then
        r:=r+1;
     Result:=r;
end;

function Cadena.getStr: String;
var
  I: Integer;
  s: String;
begin
     s:='';
     for I := 1 to Longitud do
        s:=s+Caracteres[i];
     Result:=s;
end;

procedure Cadena.insChar(p: Word; c: Char);
var
  I: Word;
begin
     if (p>0)And(p<=Longitud) then
     Begin
         inc(Longitud);
         for I := Longitud downto p+1 do
            Caracteres[i]:=Caracteres[i-1];
         Caracteres[p]:=c;
     End Else raise Exception.Create('Error Message');
end;

procedure Cadena.insWord(s: string; p: word);
var
  I: Word;
begin
  if (p>0)And(p<=Longitud) then Begin
    longitud := longitud + length(s);
    for I := Longitud downto p+length(s) do
      Caracteres[i]:=Caracteres[i-length(s)];
    for i := p to p+length(s)-1 do
      caracteres[i] := s[i+1-p];
  End Else raise Exception.Create('Error Message');
end;

function Cadena.Long: Word;
begin
     Result:=Longitud;
end;

function Cadena.maxWord: String;
Var
  i,Lm : Word;
  p,pm : String;
begin
     i:=1;Lm:=0;
     while i<=Longitud do
     Begin
           p:=nextWord(i);
           if Length(p)>Lm then
           Begin
                Lm:=Length(p);
                Pm:=p;
           End;
     End;
     Result:=Pm;
end;

procedure Cadena.modChar(p: Word; c: Char);
var
  I: Word;
begin
     if (p>0)And(p<=Longitud) then
     Begin
          Caracteres[p]:=c;

     End Else raise Exception.Create('Error Message');
end;

function Cadena.nextWord(var p: Word): String;
Var
  s : String;
begin
     While(p<=Longitud)And(Caracteres[p] in Sep) do
        p:=p+1;
     s:='';
     While(p<=Longitud)And not(Caracteres[p] in Sep) do
     Begin
          s:=s+Caracteres[p];
          p:=p+1;
     End;
     Result:=s;
end;


function getCode(s: string): string;
begin
  result := copy(s, 1, pos('-', s)-1);
end;

function getNum(s: string): word;
begin
  s := copy(s, pos('-', s)+1, length(s));
  result := StrToInt(copy(s, 1, length(s)-1));
end;

function getPeso(s: string): longword;
begin
  if s[length(s)] in ['k', 'K']  then result := getNum(s)*1000
  else result := getNum(s);
end;

function Cadena.examen1a: string;
var
  i: word;
  pal, res: string;
begin
  i:=1;
  res := nextWord(i);
  while i<=Longitud do begin
    pal := nextWord(i);
    if (getPeso(pal) < getPeso(res)) then res:=pal;
  end;
  result := getCode(res);
end;

end.
