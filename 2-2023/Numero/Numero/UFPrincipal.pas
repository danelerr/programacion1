unit UFPrincipal;

interface

uses
  UCNumero,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Numerodedigitos1: TMenuItem;
    AdicionarDigito1: TMenuItem;
    ModificarDigito1: TMenuItem;
    InsertarDigito1: TMenuItem;
    BorrarDigito1: TMenuItem;
    CambiarValor1: TMenuItem;
    Obtenervalor1: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Ordenarmayormenor1: TMenuItem;
    Ordenaradentroafuera1: TMenuItem;
    Button1: TButton;
    obtenercombinacionsumadig1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CambiarValor1Click(Sender: TObject);
    procedure Obtenervalor1Click(Sender: TObject);
    procedure Numerodedigitos1Click(Sender: TObject);
    procedure AdicionarDigito1Click(Sender: TObject);
    procedure ModificarDigito1Click(Sender: TObject);
    procedure InsertarDigito1Click(Sender: TObject);
    procedure BorrarDigito1Click(Sender: TObject);
    procedure Ordenarmayormenor1Click(Sender: TObject);
    procedure Ordenaradentroafuera1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure obtenercombinacionsumadig1Click(Sender: TObject);
  private
    { Private declarations }
    N : Numero;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AdicionarDigito1Click(Sender: TObject);
begin
     N.addDigitF(StrToInt(Edit1.Text));
end;

procedure TfrmPrincipal.BorrarDigito1Click(Sender: TObject);
begin
  N.delDigit(StrToInt(Edit1.Text));
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  N.encontrarCombinacion(55);
end;

procedure TfrmPrincipal.CambiarValor1Click(Sender: TObject);
begin
     N.setValue(StrToInt(Edit1.Text));
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     N:=Numero.Create;
end;

procedure TfrmPrincipal.InsertarDigito1Click(Sender: TObject);
begin
  N.insDigit(StrToInt(Edit1.text), StrToInt(edit2.Text));
end;

procedure TfrmPrincipal.ModificarDigito1Click(Sender: TObject);
begin
     N.modDigit(StrToInt(Edit1.Text),StrToInt(Edit2.Text));
end;

procedure TfrmPrincipal.Numerodedigitos1Click(Sender: TObject);
begin
     Label1.Caption:='La cantidad de digito es :' + IntToStr(N.countDigit);
end;

procedure TfrmPrincipal.obtenercombinacionsumadig1Click(Sender: TObject);
var k: cardinal;
begin
  k := StrToInt(Edit2.text);
  Label1.Caption :=  IntToStr(n.encontrarCombinacion(k));
end;

procedure TfrmPrincipal.Obtenervalor1Click(Sender: TObject);
begin
     Label1.Caption:='El valor es : ' + IntToStr(N.getValue);
end;

procedure TfrmPrincipal.Ordenaradentroafuera1Click(Sender: TObject);
begin
  N.ordenarAdentroAfuera;
end;

procedure TfrmPrincipal.Ordenarmayormenor1Click(Sender: TObject);
begin
  N.ordenarMayorAMenor;
end;

end.
