unit codev;

interface
uses SysUtils,strutils,math;
const e=1024;
Type
    lista = Class
      Private
          nombre  : String;
          recorrido  : cardinal;
          dia  : word;
          numero: cardinal;
      Public
          Function getrecorrido:cardinal;
          Function getNombre:String;
          Function getnumero:cardinal;
          Function getdia:word;

          Procedure setrecorrido(r:cardinal);
          Procedure setNombre(n:String);
          Procedure setdia(d:word);
          procedure setnumero(n:cardinal);


    End;

    vector = class
      
      private
          dim:word;
          elem: array [1..e] of lista;
      public
          function getd:word;
         function getv(p:word):lista;
         procedure mode( p:word; e:lista);
         procedure redim(d:word);

         function mayrecorrido: string;

         function buscarn(n:cardinal):string;
         function existe(n:cardinal; i : byte):boolean;
    end;


implementation

{ Notas }

function lista.getdia: word;
begin
     result:=dia;
end;

function lista.getNombre: String;
begin
   result:=nombre;
end;

function lista.getnumero: cardinal;
begin
    result:=numero;
end;

function lista.getrecorrido: cardinal;
begin
    result:=recorrido;
end;

procedure lista.setdia(d: word);
begin
    dia:=d;
end;

procedure lista.setNombre(n: String);
begin
   nombre:=n;
end;

procedure lista.setnumero(n: cardinal);
begin
   numero:=n;
end;

procedure lista.setrecorrido(r: cardinal);
begin
    recorrido:=r;
end;

{ vector }
function vector.existe(n:cardinal; i:byte):boolean;
var nn,m,k,valor:cardinal;
begin
  nn:=trunc(log10(n))+1;
  k:=trunc(intpower(10,nn));
  valor:=elem[i].numero;
 while valor > 0 do begin

  m:=valor mod k;
  valor:=valor div 10;
  if m=n then
  begin
   result:=true;
   break;
  end;
  result:=false;
 end;
end;

function vector.buscarn(n: cardinal): string;
var i,j,p:word;
    r,nom,nn:string;
begin
   r:='';         nom:=''; nn:=''; p:=0;
    for i := 1 to dim do begin
       nom:= elem[i].nombre;
       //nn:= inttostr(elem[i].numero);
       if existe(n,i) {pos(inttostr(n),nn) >0}  then begin
          r:=r+ elem[i].nombre +': ' + inttostr(elem[i].numero) + ', ';
       end;
    end;
    p:=length(r);
    if r[p] = ',' then
         delete(r,p,1);

    if r= '' then
        r:='no existe';
    result:=r;
end;


function vector.getd: word;
begin
   result:=dim;
end;

procedure vector.mode( p: word; e: lista);
begin
      Elem[p]:=e;
end;

procedure vector.redim(d: word);
begin
   dim:=d;
end;

function vector.getv(p: word): lista;
begin
    result:=elem[p];
end;

function Vector.mayrecorrido: string;
var //i,k,p:word; km,t:real;
//mio
   i,j,km, maykm:word;
     n1,nr:string;
begin
     maykm := 0;
     nr:='';
     i:=1;
  while i <= dim do begin
     n1:= elem[i].nombre;
     km:=elem[i].recorrido;
    for j := i+1 to dim do begin
      if n1 = elem[j].nombre then
         km:= km + elem[j].recorrido;
    end;
      if maykm<km then begin
         maykm:=km;
         nr:= n1;
      end;
      inc(i);
  end;
  result:=nr;

{t:=0;
for k := 1 to dim do
 begin
  for i := 1 to dim do
   begin
    if elem[k].nombre=elem[i].nombre then
     begin
      km:=elem[i].recorrido +km;
     end;
    if km>t then
     begin
      t:=km;
      p:=k;
     end;
   end;
 end;
 result:=elem[p].nombre;}
end;
end.
