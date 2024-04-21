unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  UCVector,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    SGProductos: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    MyAlmacen:Almacen;
  public
    { Public declarations }
    Procedure VisualizarProductos;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
Var
  P : Producto;
begin
     P.Codigo:=StrToInt(Edit1.Text);
     P.Nombre:=Edit2.Text;
     P.Stock:=StrToFloat(Edit3.Text);
     P.Precio:=StrToFloat(Edit4.Text);
     MyAlmacen.AddProducto(P);
     VisualizarProductos;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  ShowMessage(MyAlmacen.mostrarNombres);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     SGProductos.Cells[0,0]:='Codigo';
     SGProductos.Cells[1,0]:='Nombre';
     SGProductos.Cells[2,0]:='Stock';
     SGProductos.Cells[3,0]:='Precio';
     MyAlmacen:=Almacen.Create;
end;

procedure TfrmPrincipal.VisualizarProductos;
Var
   I : Word;
begin
     SGProductos.RowCount:=MyAlmacen.Dim+1;
     for I := 1 to MyAlmacen.Dim do
     Begin
         SGProductos.Cells[0,i]:=IntToStr(MyAlmacen.GetProducto(i).Codigo);
         SGProductos.Cells[1,i]:=MyAlmacen.GetProducto(i).Nombre;
         SGProductos.Cells[2,i]:=FloatToStr(MyAlmacen.GetProducto(i).Stock);
         SGProductos.Cells[3,i]:=FloatToStr(MyAlmacen.GetProducto(i).Precio)
     End;

end;

end.
