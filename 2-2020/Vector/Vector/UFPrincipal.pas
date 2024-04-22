unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids,UCVector, Vcl.Menus,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Promedio1: TMenuItem;
    ScrollBar1: TScrollBar;
    CargarVector1: TMenuItem;
    MostrarVector1: TMenuItem;
    BusquedaSecuencial1: TMenuItem;
    Ordenamientoporintercambio1: TMenuItem;
    ShellSort1: TMenuItem;
    Cargaaleatoria1: TMenuItem;
    MergeSort1: TMenuItem;
    QuickSort1: TMenuItem;
    Ordenardeparaimpar1: TMenuItem;
    Bubblesort1: TMenuItem;
    OrdenardeParaImpar2: TMenuItem;
    Busquedabinaria1: TMenuItem;
    Slectionsort1: TMenuItem;
    Insertionsort1: TMenuItem;
    CargarNombres1: TMenuItem;
    MostrarNombres1: TMenuItem;
    Eliminarnombreconsub1: TMenuItem;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Promedio1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure CargarVector1Click(Sender: TObject);
    procedure MostrarVector1Click(Sender: TObject);
    procedure BusquedaSecuencial1Click(Sender: TObject);
    procedure Ordenamientoporintercambio1Click(Sender: TObject);
    procedure ShellSort1Click(Sender: TObject);
    procedure Cargaaleatoria1Click(Sender: TObject);
    procedure MergeSort1Click(Sender: TObject);
    procedure QuickSort1Click(Sender: TObject);
    procedure Ordenardeparaimpar1Click(Sender: TObject);
    procedure Bubblesort1Click(Sender: TObject);
    procedure OrdenardeParaImpar2Click(Sender: TObject);
    procedure Busquedabinaria1Click(Sender: TObject);
    procedure Slectionsort1Click(Sender: TObject);
    procedure Insertionsort1Click(Sender: TObject);
    procedure CargarNombres1Click(Sender: TObject);
    procedure MostrarNombres1Click(Sender: TObject);
    procedure Eliminarnombreconsub1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    X : Vector;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Bubblesort1Click(Sender: TObject);
begin
  x.bubbleSort;
end;

procedure TForm1.Busquedabinaria1Click(Sender: TObject);
var valor: real;
p: word;
begin
  Valor:=StrToFloat(InputBox('Busquesda Binaria', 'Dame un elemento', '0'));
  p := x.BusquedaBinaria(valor);
  if p>0 then showmessage('Se encuentra en la posicion: '+IntToStr(p))
  else showmessage('No pille tu elemento crack');
end;

procedure TForm1.BusquedaSecuencial1Click(Sender: TObject);
Var
    Valor : Real;
    p  : Word;
begin
     Valor :=StrToFloat( InputBox('Busqueda','Digite valor a buscar','0'));
     P:=X.BusquedaSecuencial(Valor);
     if P>0 then showMessage('Se encuentra en la posicion['+IntToStr(P)+']')
     Else showMessage('No se encuentra');

end;



procedure TForm1.Button1Click(Sender: TObject);
begin
  X.acomodarPorPrimos;
 // if esPrimo(1) then ShowMessage('TRUE')
//  ELSE SHOWMESSAGE('FALSE');
end;

procedure TForm1.Cargaaleatoria1Click(Sender: TObject);
var a: real;
i: word;
begin
  X.Dimensionar(StringGrid1.ColCount);
  for i := 1 to x.Dim do begin
    randomize;
    a := random(2000);
    x.ModElement(i, a);
  end;
end;

procedure TForm1.CargarNombres1Click(Sender: TObject);
Var I : Word;
begin
     X.DimensionarNombre(StringGrid1.ColCount);
     for I := 1 to X.DimNombre do
     Begin
       X.ModNombre(I, StringGrid1.Cells[I-1,0]);
     End;

end;



procedure TForm1.CargarVector1Click(Sender: TObject);
Var
      I : Word;
begin
     X.Dimensionar(StringGrid1.ColCount);
     for I := 1 to X.Dim do
     Begin
           X.ModElement(I,StrToFloat(StringGrid1.Cells[I-1,0]));
     End;

end;

procedure TForm1.Eliminarnombreconsub1Click(Sender: TObject);
begin
  x.eliminarSubCad(inputbox('Eliminar nombres','Introduzca una cadena sub',''));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    X:=Vector.Create;
end;

procedure TForm1.Insertionsort1Click(Sender: TObject);
begin
 x.insertionSort;
end;

procedure TForm1.MergeSort1Click(Sender: TObject);
begin
   x.mergeSort;
end;

procedure TForm1.MostrarNombres1Click(Sender: TObject);
Var i: Word;
begin
     StringGrid1.ColCount:=X.DimNombre;
     for I := 1 to X.DimNombre do
     Begin
          StringGrid1.Cells[I-1,0]:=X.getNombre(I);
     End;

end;

procedure TForm1.MostrarVector1Click(Sender: TObject);
Var
      I : Word;
begin
     StringGrid1.ColCount:=X.Dim;
     for I := 1 to X.Dim do
     Begin
          StringGrid1.Cells[I-1,0]:=FloatTostr(X.getElement(I));
     End;

end;

procedure TForm1.Ordenamientoporintercambio1Click(Sender: TObject);
begin
     X.OrdenacionIntercambio;
end;

procedure TForm1.Ordenardeparaimpar1Click(Sender: TObject);
begin
  x.quickSort;
  x.intercalarParEImpar;
end;

procedure TForm1.OrdenardeParaImpar2Click(Sender: TObject);
begin
  x.mergeSort;
  x.ordenarDeParAImpar;
end;

procedure TForm1.Promedio1Click(Sender: TObject);
begin
  showmessage('El promedio es: '+ FloatToStr(X.getAVG));
end;

procedure TForm1.QuickSort1Click(Sender: TObject);
begin
  x.quickSort;
end;


procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
     StringGrid1.ColCount:=ScrollBar1.Position;
end;

procedure TForm1.ShellSort1Click(Sender: TObject);
var h, m, s, mm: word;
h2, m2, s2, mm2: word;
begin
 DecodeTime(gettime, h, m, s, mm);
 x.sellSort;
 DecodeTime(gettime, h2, m2, s2, mm2);
 h := h2 - h;
 m := m2 - m;
 s := s2 - s;
 mm := mm2 - mm;
end;

procedure TForm1.Slectionsort1Click(Sender: TObject);
begin
 x.selectionSort;
end;

end.
