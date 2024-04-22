unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls,UCMatriz,
  Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    SGMatriz: TStringGrid;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    CargarMatriz1: TMenuItem;
    MostrarMatriz1: TMenuItem;
    CargarRandomico1: TMenuItem;
    Button1: TButton;
    Bubblesort1: TMenuItem;
    Busquedabinaria1: TMenuItem;
    Matrizchar1: TMenuItem;
    CargarMatriz2: TMenuItem;
    MostrarMatriz2: TMenuItem;
    Buscarcadena1: TMenuItem;
    Button3: TButton;
    Button2: TButton;
    sumapresicion1: TMenuItem;
    devolvermenorbinarioendecima1: TMenuItem;
    QuickSort1: TMenuItem;
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure CargarMatriz1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MostrarMatriz1Click(Sender: TObject);
    procedure CargarRandomico1Click(Sender: TObject);
    procedure Bubblesort1Click(Sender: TObject);
    procedure Busquedabinaria1Click(Sender: TObject);
    procedure CargarMatriz2Click(Sender: TObject);
    procedure Buscarcadena1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure sumapresicion1Click(Sender: TObject);
    procedure devolvermenorbinarioendecima1Click(Sender: TObject);
    procedure QuickSort1Click(Sender: TObject);
  private
    { Private declarations }
    M : Matriz;

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Bubblesort1Click(Sender: TObject);
begin
  m.bubbleSort;
end;

procedure TfrmPrincipal.Buscarcadena1Click(Sender: TObject);
var x: boolean;
begin
  x := m.buscarCadena(inputbox('sopa de letras', 'introduzca una palabra', ''));
  if x then showmessage('la pille crack')
  else showmessage('No se encuentra la palabra en la matriz');
end;

procedure TfrmPrincipal.Busquedabinaria1Click(Sender: TObject);
var x: string;
r: word;
begin
 // M.bubbleSort;
  x := inputbox('Busqueda binaria','introduzca el elemento a buscar','0');
  r := M.busquedaBinaria(StrToFloat(x));
  if r>0 then showmessage('Se encuentra en la posicion '+ IntToStr(r))
  else showmessage('No lo pille hdp >:(')
end;



procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(M.getNumeroMayor));
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  M.Redimensionar(SGMatriz.RowCount,SGMatriz.ColCount);
  M.numeros_vivora;
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  M.ordenarPorColumnas;
end;

procedure TfrmPrincipal.CargarMatriz1Click(Sender: TObject);
Var
    i,j : Word;
begin
      M.Redimensionar(SGMatriz.RowCount,SGMatriz.ColCount);
      for I := 1 to M.Filas do
        for J := 1 to M.Columnas do
            M.ModElement(I,J,StrToFloat(SGMatriz.Cells[J-1,I-1]));
end;

procedure TfrmPrincipal.CargarMatriz2Click(Sender: TObject);
var i,j : Word;
begin
      M.Redimensionar(SGMatriz.RowCount,SGMatriz.ColCount);
      for I := 1 to M.Filas do
        for J := 1 to M.Columnas do
            M.ModCaracter(I,J, SGMatriz.Cells[J-1,I-1][1]);
end;

procedure TfrmPrincipal.CargarRandomico1Click(Sender: TObject);
Var
    i,j : Word;
begin
      Randomize;
      M.Redimensionar(SGMatriz.RowCount,SGMatriz.ColCount);
      for I := 1 to M.Filas do
        for J := 1 to M.Columnas do
            M.ModElement(I,J,Random(10));

end;

procedure TfrmPrincipal.devolvermenorbinarioendecima1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(M.devolverMenorBinEnDec));
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
      M := Matriz.Create;
end;

procedure TfrmPrincipal.MostrarMatriz1Click(Sender: TObject);
Var
    i,j : Word;
begin
      SGMatriz.RowCount:=M.Filas;
      SGMatriz.ColCount:=M.Columnas;
      for I := 1 to M.Filas do
        for J := 1 to M.Columnas do
            SGMatriz.Cells[J-1,I-1]:=FloatToStr(M.ObtElement(I,J));

end;

procedure TfrmPrincipal.QuickSort1Click(Sender: TObject);
begin
  M.quickSort;
end;

procedure TfrmPrincipal.ScrollBar1Change(Sender: TObject);
begin
     SGMatriz.ColCount:=ScrollBar1.Position;
end;

procedure TfrmPrincipal.ScrollBar2Change(Sender: TObject);
begin
     SGMatriz.RowCount:=ScrollBar2.Position;
end;
procedure TfrmPrincipal.sumapresicion1Click(Sender: TObject);
var p: word;
begin
  p := StrToInt(inputbox('Introduzca la presicion', '', ''));
  ShowMessage(FloatToStr(M.getSumaPresicion(p)));
end;

end.