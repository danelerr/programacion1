unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCNumero, Vcl.Menus, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Metodos2: TMenuItem;
    Obtenerndigito1: TMenuItem;
    Adicionardigitoinicio1: TMenuItem;
    Adicionardigitofin1: TMenuItem;
    Adicionardigitofin2: TMenuItem;
    Label1: TLabel;
    edValor: TEdit;
    Obtenervalor1: TMenuItem;
    Cambiarvalor1: TMenuItem;
    Invertir1: TMenuItem;
    aRomano1: TMenuItem;
    Dosdigitos1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Metodos2Click(Sender: TObject);
    procedure Adicionardigitoinicio1Click(Sender: TObject);
    procedure Obtenervalor1Click(Sender: TObject);
    procedure Cambiarvalor1Click(Sender: TObject);
    procedure Invertir1Click(Sender: TObject);
    procedure aRomano1Click(Sender: TObject);
    procedure Dosdigitos1Click(Sender: TObject);
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

procedure TfrmPrincipal.Adicionardigitoinicio1Click(Sender: TObject);
begin
     N.addDigitFirst(StrToInt(edValor.Text));
end;

procedure TfrmPrincipal.aRomano1Click(Sender: TObject);
begin
     label1.Caption:=N.toRoman;
end;

procedure TfrmPrincipal.Cambiarvalor1Click(Sender: TObject);
begin
     N.setValue(StrToInt(edValor.Text));
end;

procedure TfrmPrincipal.Dosdigitos1Click(Sender: TObject);
begin
     label1.Caption:=N.toLiteral2D(N.getValue);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     N:=Numero.Create;
end;

procedure TfrmPrincipal.Invertir1Click(Sender: TObject);
begin
     N.invertir;
end;

procedure TfrmPrincipal.Metodos2Click(Sender: TObject);
begin
     label1.Caption:='Numero de digitos:'+IntToStr(N.getNumDigit);
end;

procedure TfrmPrincipal.Obtenervalor1Click(Sender: TObject);
begin
     Label1.Caption:=IntToStr(N.getValue);
end;

end.
