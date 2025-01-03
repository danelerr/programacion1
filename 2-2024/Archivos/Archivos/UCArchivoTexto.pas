unit UCArchivoTexto;

interface
Uses System.Classes, UCCadena, SysUtils;

Type
    Tmodo=(lectura,escritura);

    ArchivoTexto = Class
      Private
          Nombre : String;
          PF     : TextFile;
      Public
          Constructor Create();
          Procedure Open(mode:Tmodo;path : String);
          Procedure setName(path : String);
          Procedure Close;
          function palMasRepetida(l: TStrings): String;
          Function readLines:TStringList;
          Procedure saveLines(l: TStrings);
          Function findWord(p:String;l:TStrings):String;
          Procedure delWord(p:String;l:TStrings);
          Procedure findandreplace(pb,pr:String;l:TStrings);
          Function sumValues(l:TStrings):Real;
          Function mostrepeatedWord(l:TStrings):String;
          Function searchNumber(name:String;l:TStrings):String;
          Function contarPalabras(l:TStrings):Word;
          Procedure mayuscula(l:TStrings);
          Function Sumar(l:TStrings):Real;

          //mis metdos
          procedure eliminarPalabrasConSub(l: TStrings; sub: string);
          procedure eliminarPalVocRep(l: TStrings);
    End;

implementation

{ ArchivoTexto }

procedure ArchivoTexto.Close;
begin
     CloseFile(PF);
end;

function ArchivoTexto.contarPalabras(l: TStrings): Word;
Var
  C: Cadena;
  s: String;
  i,R: Word;
begin
     C:=Cadena.Create;
     i:=0; R:=0;
     while i<l.Count do
     Begin
         C.cargarCadena(l[i]);
         R:=R+C.countWord;
         i:=i+1;
     End;
     Result:=R;
end;

constructor ArchivoTexto.Create();
begin
end;

procedure ArchivoTexto.delWord(p: String;l:TStrings);
Var
    C : Cadena; j,i:Word;
begin
     C:=Cadena.Create;
     i:=0;
     while (i<l.Count) do
     begin
         C.cargarCadena(l[i]);
         repeat
           j:=C.findWord(p);
           if j>0 then C.delWord(j)
         until j=0 ;
         l[i]:=C.mostrarCadena;
         i:=i+1;
     end;
end;


{Como utilizar la clase cadena}
procedure ArchivoTexto.eliminarPalabrasConSub(l: TStrings; sub: string);
var
  c: Cadena;  //1. crear la variable
  i: word;
begin
  c := Cadena.Create; //2. llamar al consturctor
  i := 0;
  while (i<l.Count) do Begin

          C.cargarCadena(l[i]);

          //llamar al metodo
          c.eliminarPalconSub(sub);

          l[i]:=C.mostrarCadena;

          i:=i+1;
     End;
end;

procedure ArchivoTexto.eliminarPalVocRep(l: TStrings);
var c: cadena;
  i: word;
begin
  c := Cadena.Create;
  i := 0;
  while (i < l.count) do begin
    c.cargarCadena(l[i]);
    c.elimPalVocRepe;
    l[i] := c.mostrarCadena;
    i := i + 1;
  end;
end;


//nota: no debe estar funcionando bien
procedure ArchivoTexto.findandreplace(pb, pr: String;l:TStrings);
Var
    C : Cadena; j,i:Word;
begin
     C:=Cadena.Create;
     i:=0;
     while (i<l.Count) do
     begin
         C.cargarCadena(l[i]);
         repeat
           j:=C.findWord(pb);
           if j>0 then
           begin
                C.delWord(j);
                C.InsWord(pr, j);
           end;
         until j=0 ;
         l[i]:=C.mostrarCadena;
         i:=i+1;
     end;

end;

function ArchivoTexto.findWord(p: String;l:TStrings): String;
Var
    //R: TStringList;
    C : Cadena; j,i:Word;
    Pos : String;
begin
     C:=Cadena.Create;
     i:=0;Pos:='';
     //R:=readLines;
     while (i<l.Count)And(Pos='') do
     begin
         C.cargarCadena(l[i]);
         j:=C.findWord(p);
         if j>0 then Pos:=IntToStr(i+1)+'-'+IntToStr(j);
         i:=i+1;
     end;
     Result:=Pos;
end;

procedure ArchivoTexto.mayuscula(l: TStrings);
Var
  C : Cadena;
  i : Word;
begin
     C:=Cadena.Create;
     i:=0;
     while (i<l.Count) do
     Begin
          C.cargarCadena(l[i]);
          C.toUpper;
          l[i]:=C.mostrarCadena;
          i:=i+1;
     End;
end;

function ArchivoTexto.mostrepeatedWord(l: TStrings): String;
begin

end;

procedure ArchivoTexto.Open(mode :TModo; path: String);
begin
     AssignFile(PF,path);
     case mode of
         lectura:Reset(PF);
         escritura:Rewrite(PF);
     end;
end;

function ArchivoTexto.palMasRepetida(l: TStrings): String;
Var
  C : Cadena;S:String; i:Word;
Begin
     C:=Cadena.Create;
     i:=0;s:='';
     while (i<l.Count) do
     begin
         s:=s+' '+l[i]; i:=i+1;
     end;
     C.cargarCadena(s);
     Result:= 'ccxcc';
end;

function ArchivoTexto.readLines: TStringList;
Var
  s : String;
  Lineas : TStringList;
begin
     Lineas:=TStringList.Create;
     while not EOF(PF) do
     Begin
        Readln(PF,s);
        Lineas.Add(s);
     End;
     Result:=Lineas;
end;

procedure ArchivoTexto.saveLines(l: TStrings);
Var
  s:String;
  I: Integer;
begin
    for s in l do
     Writeln(PF,s);
end;

function ArchivoTexto.searchNumber(name: String; l: TStrings): String;
Var
    C : Cadena; j,i,t:Word;
    Pos,Nro : String;
begin
     C:=Cadena.Create;
     i:=0;Pos:='';
     while (i<l.Count)And(Pos='') do
     begin
         C.cargarCadena(l[i]);t:=1;
         Nro:=C.nextWord(t);
         if C.nextWord(t)=name then
            Pos:=Nro;
     end;
     Result:=Pos;

end;

procedure ArchivoTexto.setName(path: String);
begin
     Nombre:=Path;
end;

function ArchivoTexto.Sumar(l: TStrings): Real;
Var
   n : Real;i:Word;
begin
     i:=0;n:=0;
     while (i<l.Count) do
     Begin
           if Length(l[i])>0 then
              n:=n+StrToFloat(l[i]);
           i:=i+1;
     End;
     Result:=n;
end;

function ArchivoTexto.sumValues(l:TStrings): Real;
begin

end;

end.
