unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,UCVector, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Grids, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    SGVector: TStringGrid;
    ScrollBar1: TScrollBar;
    Metodos1: TMenuItem;
    CargarVector1: TMenuItem;
    CargarVector2: TMenuItem;
    procedure ScrollBar1Change(Sender: TObject);
    procedure CargarVector1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CargarVector2Click(Sender: TObject);
  private
    { Private declarations }
    V : Vector;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.CargarVector1Click(Sender: TObject);
Var
   i : Word;
begin
     V.Redimensionar(SGVector.ColCount);
     for I := 1  to V.Dim do
        V.modElemento(i,StrToFloat(SGVector.Cells[i-1,0]));
end;

procedure TfrmPrincipal.CargarVector2Click(Sender: TObject);
Var
   i : Word;
begin
     SGVector.ColCount:=V.Dim;
     for I := 1  to V.Dim do
        SGVector.Cells[i-1,0]:=FloatToStr(V.getElemento(i));


end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
    V := Vector.Create;
end;

procedure TfrmPrincipal.ScrollBar1Change(Sender: TObject);
begin
     SGVector.ColCount:=ScrollBar1.Position;
end;

end.
