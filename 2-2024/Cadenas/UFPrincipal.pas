unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, UCCadena;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    CargarCadena1: TMenuItem;
    Cargarcadena2: TMenuItem;
    Cargarcadena3: TMenuItem;
    invertir1: TMenuItem;
    cantidadvocales1: TMenuItem;
    tomayuscula1: TMenuItem;
    tomayuscula2: TMenuItem;
    Cantpals1: TMenuItem;
    delpalsconsub1: TMenuItem;
    Eliminarpalabrasvocalesrepe1: TMenuItem;
    palabramaslarga1: TMenuItem;
    Sumarnumeros1: TMenuItem;
    Remplazarconpalabras1: TMenuItem;
    Obtenermaybinario1: TMenuItem;
    Sumarbinarios1: TMenuItem;
    sumarhoras1: TMenuItem;
    Obtenersemejantesnumero1: TMenuItem;
    procedure Cargarcadena2Click(Sender: TObject);
    procedure Cargarcadena3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure invertir1Click(Sender: TObject);
    procedure cantidadvocales1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tomayuscula1Click(Sender: TObject);
    procedure tomayuscula2Click(Sender: TObject);
    procedure Cantpals1Click(Sender: TObject);
    procedure delpalsconsub1Click(Sender: TObject);
    procedure Eliminarpalabrasvocalesrepe1Click(Sender: TObject);
    procedure palabramaslarga1Click(Sender: TObject);
    procedure Sumarnumeros1Click(Sender: TObject);
    procedure Remplazarconpalabras1Click(Sender: TObject);
    procedure Obtenermaybinario1Click(Sender: TObject);
    procedure Sumarbinarios1Click(Sender: TObject);
    procedure sumarhoras1Click(Sender: TObject);
    procedure Extraerdigitossemejantes1Click(Sender: TObject);
    procedure Obtenersemejantesnumero1Click(Sender: TObject);
  private
    c: cadena;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var x: string;
begin
  x := '1234';
  UpperCase(x); // HOLA
  LowerCase(x); // hola
  StrToInt(x); //1234 (int)

end;

procedure TForm1.cantidadvocales1Click(Sender: TObject);
begin
  label1.Caption := 'Tiene ' + IntToStr(c.cantVocales) + ' vocales';
end;

procedure TForm1.Cantpals1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(c.countWord));
end;

procedure TForm1.Cargarcadena2Click(Sender: TObject);
begin
  c.cargarCadena(Edit1.Text);
end;

procedure TForm1.Cargarcadena3Click(Sender: TObject);
begin
  Label1.Caption := c.mostrarCadena;
end;

procedure TForm1.delpalsconsub1Click(Sender: TObject);
var sub: string;
begin
  sub := inputBox('introduzca una subpalabra', 'sub', '');
  c.eliminarPalconSub(sub);
end;

procedure TForm1.Eliminarpalabrasvocalesrepe1Click(Sender: TObject);
begin
  C.elimPalVocRepe;
end;

procedure TForm1.Extraerdigitossemejantes1Click(Sender: TObject);
begin
  Label1.Caption := c.obtenerDigSemejantes;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  c := cadena.Create;
end;

procedure TForm1.invertir1Click(Sender: TObject);
begin
  c.invertir;
end;

procedure TForm1.Obtenermaybinario1Click(Sender: TObject);
begin
  label1.Caption :=	 c.obtenerMayBin;
end;

procedure TForm1.Obtenersemejantesnumero1Click(Sender: TObject);
begin
   label1.Caption := c.obtenerDigSemejantes;
end;

procedure TForm1.palabramaslarga1Click(Sender: TObject);
begin
  label1.Caption := c.getMaxLengthPal;
end;

procedure TForm1.Remplazarconpalabras1Click(Sender: TObject);
var s: string;
begin
  s := inputBox('introduzca palabras', 'palabras', '');
  c.reemplazarConPals(s);
end;

procedure TForm1.Sumarbinarios1Click(Sender: TObject);
begin
  Label1.Caption  := IntToStr(c.sumarBinarios);
end;

procedure TForm1.sumarhoras1Click(Sender: TObject);
begin
  C.sumarHoras;
end;

procedure TForm1.Sumarnumeros1Click(Sender: TObject);
begin
  C.sumarNumeros;
end;

procedure TForm1.tomayuscula1Click(Sender: TObject);
begin
  c.toUpper;
end;

procedure TForm1.tomayuscula2Click(Sender: TObject);
begin
  c.toLower;
end;

end.
