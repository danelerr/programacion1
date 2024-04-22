unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus,UCNumero;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    ObtenerValor1: TMenuItem;
    CambiarValor1: TMenuItem;
    EliminarDigito1: TMenuItem;
    ObtenerDigito1: TMenuItem;
    CamtidaddeDigitos1: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    InsertarDigito1: TMenuItem;
    ModificarDigito1: TMenuItem;
    LlevaraBaseB1: TMenuItem;
    Binarioadecimal1: TMenuItem;
    Obtenerenhexadecimal1: TMenuItem;
    Hexadecimaladecimal1: TMenuItem;
    oromano1: TMenuItem;
    Parcial1: TMenuItem;
    Eliminardigitosrepetidso1: TMenuItem;
    Mostrarmenorde3cifras1: TMenuItem;
    Intercalarprimonoprimo1: TMenuItem;
    Eliminarmayorrepetido1: TMenuItem;
    Adentroafuera1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ObtenerValor1Click(Sender: TObject);
    procedure CambiarValor1Click(Sender: TObject);
    procedure CamtidaddeDigitos1Click(Sender: TObject);
    procedure ObtenerDigito1Click(Sender: TObject);
    procedure EliminarDigito1Click(Sender: TObject);
    procedure InsertarDigito1Click(Sender: TObject);
    procedure ModificarDigito1Click(Sender: TObject);
    procedure Binarioadecimal1Click(Sender: TObject);
    procedure LlevaraBaseB1Click(Sender: TObject);
    procedure Obtenerenhexadecimal1Click(Sender: TObject);
    procedure Hexadecimaladecimal1Click(Sender: TObject);
    procedure oromano1Click(Sender: TObject);
    procedure Eliminardigitosrepetidso1Click(Sender: TObject);
    procedure Mostrarmenorde3cifras1Click(Sender: TObject);
    procedure Intercalarprimonoprimo1Click(Sender: TObject);
    procedure Eliminarmayorrepetido1Click(Sender: TObject);
    procedure Adentroafuera1Click(Sender: TObject);
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

procedure TfrmPrincipal.Adentroafuera1Click(Sender: TObject);
begin
  N.ordenarAdentroAfuera;
end;

procedure TfrmPrincipal.Binarioadecimal1Click(Sender: TObject);
begin
  N.BaseBToDec(StrToInt(Edit1.Text));
end;

procedure TfrmPrincipal.CambiarValor1Click(Sender: TObject);
begin
     N.setValue(StrToInt(Edit1.Text));
end;

procedure TfrmPrincipal.CamtidaddeDigitos1Click(Sender: TObject);
begin
      Label1.Caption:='La cantidad de digitos es: '+IntToStr(N.numDigit);
end;

procedure TfrmPrincipal.EliminarDigito1Click(Sender: TObject);
begin
  n.delDigit(StrToInt(Edit1.Text));
end;

procedure TfrmPrincipal.Eliminardigitosrepetidso1Click(Sender: TObject);
begin
N.ElimDigRepetido;
end;

procedure TfrmPrincipal.Eliminarmayorrepetido1Click(Sender: TObject);
begin
  N.EliminarDigitoMayorRepetido;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     N := Numero.Create;
end;

procedure TfrmPrincipal.Hexadecimaladecimal1Click(Sender: TObject);
begin
  Label1.Caption := N.HexToDec(Edit1.Text);
end;

procedure TfrmPrincipal.InsertarDigito1Click(Sender: TObject);
begin
  N.insDigit(9, StrToInt(Edit1.Text));
end;

procedure TfrmPrincipal.Intercalarprimonoprimo1Click(Sender: TObject);
begin
  N.ordenarPrimoNoPrimo;
end;

procedure TfrmPrincipal.LlevaraBaseB1Click(Sender: TObject);
begin
  N.DecToBaseB(StrToInt(Edit1.Text));
end;

procedure TfrmPrincipal.ModificarDigito1Click(Sender: TObject);
begin
  N.modDigit(StrToInt(Edit1.Text), 9);
end;

procedure TfrmPrincipal.Mostrarmenorde3cifras1Click(Sender: TObject);
begin
  Label1.Caption := IntToStr(N.getMenor3Cifras);
end;

procedure TfrmPrincipal.ObtenerDigito1Click(Sender: TObject);
begin
     Label1.Caption := IntToStr(N.getDigit(StrToInt(Edit1.Text)));
end;

procedure TfrmPrincipal.Obtenerenhexadecimal1Click(Sender: TObject);
begin
  Label1.Caption := n.getNumEnHex;
end;

procedure TfrmPrincipal.ObtenerValor1Click(Sender: TObject);
begin
     Label1.Caption:=IntToStr(N.getValue);
end;

procedure TfrmPrincipal.oromano1Click(Sender: TObject);
begin
  Label1.Caption := n.aRomano;
end;


end.
