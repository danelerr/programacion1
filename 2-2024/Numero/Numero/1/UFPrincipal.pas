unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, UCNumero;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Numero1: TMenuItem;
    Cambiarvalor1: TMenuItem;
    Obtenervalor1: TMenuItem;
    Cantidaddedigitos1: TMenuItem;
    Moddigit1: TMenuItem;
    Insdigit1: TMenuItem;
    Deldigit1: TMenuItem;
    Ontenerenbasen1: TMenuItem;
    Obtenerenbase101: TMenuItem;
    Genmenor3cifras1: TMenuItem;
    Ordenar1: TMenuItem;
    Ordenarparimparord1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Cambiarvalor1Click(Sender: TObject);
    procedure Obtenervalor1Click(Sender: TObject);
    procedure Cantidaddedigitos1Click(Sender: TObject);
    procedure Moddigit1Click(Sender: TObject);
    procedure Insdigit1Click(Sender: TObject);
    procedure Deldigit1Click(Sender: TObject);
    procedure Ontenerenbasen1Click(Sender: TObject);
    procedure Obtenerenbase101Click(Sender: TObject);
    procedure Genmenor3cifras1Click(Sender: TObject);
    procedure Ordenar1Click(Sender: TObject);
    procedure Ordenarparimparord1Click(Sender: TObject);
  private
    n: numero;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Cambiarvalor1Click(Sender: TObject);
begin
  n.cambiarValor(StrToInt(Edit1.Text));
end;

procedure TForm2.Cantidaddedigitos1Click(Sender: TObject);
begin
  Label1.Caption := 'La cantidad es ' + IntToStr(n.getNumDigit);
end;

procedure TForm2.Deldigit1Click(Sender: TObject);
var p: cardinal;
begin
  p := StrToInt(inputbox('Introduzca la posicion', 'Posicion', '1'));
  n.delDigit(p);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  n := numero.Create;
end;

procedure TForm2.Genmenor3cifras1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(n.obtenerMen3Cifras));
end;

procedure TForm2.Insdigit1Click(Sender: TObject);
var p, d: cardinal;
begin
  p := StrToInt(inputbox('Introduzca la posicion', 'Posicion', '1'));
  d := StrToInt(inputbox('Introduzca el digito', 'Digito', '1'));
  n.insDigit(p, d);
end;

procedure TForm2.Moddigit1Click(Sender: TObject);
var p, d: cardinal;
begin
  p := StrToInt(inputbox('Introduzca la posicion', 'Posicion', '1'));
  d := StrToInt(inputbox('Introduzca el digito', 'Digito', '1'));
  n.modDigit(p, d);
end;

procedure TForm2.Obtenerenbase101Click(Sender: TObject);
var b: cardinal;
begin
  b := StrToInt(inputbox('Introduzca la base', 'Base', '2'));
  label1.Caption := IntToStr( n.obtenerEnBase10(b));
end;

procedure TForm2.Obtenervalor1Click(Sender: TObject);
begin
  label1.Caption := IntToStr( n.obtenerValor);
end;

procedure TForm2.Ontenerenbasen1Click(Sender: TObject);
var b: cardinal;
begin
  b := StrToInt(inputbox('Introduzca la base', 'Base', '2'));
  label1.Caption := IntToStr( n.obtenerEnBaseN(b));
end;

procedure TForm2.Ordenar1Click(Sender: TObject);
begin
  n.ordenarDigDescente;
end;

procedure TForm2.Ordenarparimparord1Click(Sender: TObject);
begin
  n.ordenarParOrdImparOrd;
end;

end.
