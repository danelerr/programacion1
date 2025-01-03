unit UFPrincipal;

interface

uses
  UCMatriz,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    SGMatriz: TStringGrid;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    Metodos1: TMenuItem;
    Metodos2: TMenuItem;
    MostrarMatriz1: TMenuItem;
    CargarAleatorio1: TMenuItem;
    Cargarserie1: TMenuItem;
    Obtenermayor1: TMenuItem;
    Ordenarcolumna1: TMenuItem;
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Metodos2Click(Sender: TObject);
    procedure MostrarMatriz1Click(Sender: TObject);
    procedure CargarAleatorio1Click(Sender: TObject);
    procedure Cargarserie1Click(Sender: TObject);
    procedure Obtenermayor1Click(Sender: TObject);
    procedure Ordenarcolumna1Click(Sender: TObject);
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

procedure TfrmPrincipal.CargarAleatorio1Click(Sender: TObject);
begin
      M.redim(SGMatriz.RowCount,SGMatriz.ColCount);
      M.cargarRandom;
end;

procedure TfrmPrincipal.Cargarserie1Click(Sender: TObject);
begin
 M.redim(SGMatriz.RowCount,SGMatriz.ColCount);
 M.llenarForma3;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
      M := Matriz.Create;
end;

procedure TfrmPrincipal.Metodos2Click(Sender: TObject);
var
  I: Integer;
  J: Integer;
begin
     M.redim(SGMatriz.RowCount,SGMatriz.ColCount);
     for I := 1 to M.Rows do
        for J := 1 to M.Columns do
          M.setValue(i,j,StrToFloat(SGMatriz.Cells[j-1,i-1]))
end;

procedure TfrmPrincipal.MostrarMatriz1Click(Sender: TObject);
var
  I: Integer;
  J: Integer;
begin
     SGMatriz.RowCount:=M.Rows;
     SGMatriz.ColCount:=M.Columns;
     for I := 1 to M.Rows do
        for J := 1 to M.Columns do
          SGMatriz.Cells[j-1,i-1]:=FloatToStr(M.getElement(I,J));

end;

procedure TfrmPrincipal.Obtenermayor1Click(Sender: TObject);
begin
  ShowMessage(FloatToStr(M.obtenerMayorNum));
end;

procedure TfrmPrincipal.Ordenarcolumna1Click(Sender: TObject);
var c: string;
begin
  c := inputBox('Intruzca el inde de la columma que va a modifar', '', '');
  M.ordernarColumna(StrToInt(c));
end;

procedure TfrmPrincipal.ScrollBar1Change(Sender: TObject);
begin
     SGMatriz.ColCount:=ScrollBar1.Position;
end;

procedure TfrmPrincipal.ScrollBar2Change(Sender: TObject);
begin
     SGMatriz.RowCount:=ScrollBar2.Position;
end;

end.
