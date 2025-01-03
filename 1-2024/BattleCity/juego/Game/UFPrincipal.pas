unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCScenario, System.ImageList, Vcl.ImgList,
  Vcl.ExtCtrls;

type
  TfrmPantalla = class(TForm)
    ImageList1: TImageList;
    Image1: TImage;
    procedure FormDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    Esc : Escenario;
  public
    { Public declarations }
  end;

var
  frmPantalla: TfrmPantalla;

implementation

{$R *.dfm}

procedure TfrmPantalla.FormCreate(Sender: TObject);
begin
     Esc := Escenario.Create;
     Esc.Dimensionar(18,30);
     Esc.CargarNivel(1);
end;

procedure TfrmPantalla.FormDblClick(Sender: TObject);
begin
     Application.Terminate;
end;

procedure TfrmPantalla.FormPaint(Sender: TObject);
var
  I,J,X,Y: Integer;
begin
     Y:=0;
     for I := 1 to Esc.Filas do
     Begin
      X:=0;
      for J := 1 to Esc.Columnas do
      Begin
         ImageList1.Draw(Canvas,X,Y,Esc.GetCelda(I,J));
         X:=X+48;
      End;
      Y:=Y+48;
     End;
end;

end.
