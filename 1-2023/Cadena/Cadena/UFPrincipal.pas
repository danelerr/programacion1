unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCCadena, Vcl.Menus, Vcl.StdCtrls, Math;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Cargar1: TMenuItem;
    Mostrarcadena1: TMenuItem;
    InsertarCaracter1: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Invertircaracteres1: TMenuItem;
    Longitud1: TMenuItem;
    ContarPalabras1: TMenuItem;
    SiguientePalabra1: TMenuItem;
    nPalabra1: TMenuItem;
    Obtenerhoramenor1: TMenuItem;
    Eliminarcomienzaconsonante1: TMenuItem;
    FormatearHora1: TMenuItem;
    Eliminarpalabrasconvocalrepetida1: TMenuItem;
    Eliminarpalabrasub1: TMenuItem;
    Button1: TButton;
    Sumarrealesyredondear1: TMenuItem;
    ejemplox1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Cargar1Click(Sender: TObject);
    procedure Mostrarcadena1Click(Sender: TObject);
    procedure InsertarCaracter1Click(Sender: TObject);
    procedure Invertircaracteres1Click(Sender: TObject);
    procedure Longitud1Click(Sender: TObject);
    procedure ContarPalabras1Click(Sender: TObject);
    procedure SiguientePalabra1Click(Sender: TObject);
    procedure nPalabra1Click(Sender: TObject);
    procedure Obtenerhoramenor1Click(Sender: TObject);
    procedure Eliminarcomienzaconsonante1Click(Sender: TObject);
    procedure FormatearHora1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Eliminarpalabrasconvocalrepetida1Click(Sender: TObject);
    procedure Eliminarpalabrasub1Click(Sender: TObject);
    procedure Sumarrealesyredondear1Click(Sender: TObject);
    procedure ejemplox1Click(Sender: TObject);
  private
    { Private declarations }
    C : Cadena;
    t : word;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var x: string;
begin
  x := Inputbox('Eliminar una palabra de la posicion p', 'p: ', '');
  C.delWord(StrToInt(x));
end;

procedure TfrmPrincipal.Cargar1Click(Sender: TObject);
begin
     C.AddStr(Edit1.Text);
end;

procedure TfrmPrincipal.ContarPalabras1Click(Sender: TObject);
begin
      Label1.Caption:='La cantidad de palabras es:'+IntToStr(C.countWord);
end;

procedure TfrmPrincipal.ejemplox1Click(Sender: TObject);
begin
  ShowMessage(IntToStr(c.contarPalabrasMas2Voc));
end;

procedure TfrmPrincipal.Eliminarcomienzaconsonante1Click(Sender: TObject);
begin
  C.eliminarComienzaTeriminaConsonante;
end;

procedure TfrmPrincipal.Eliminarpalabrasconvocalrepetida1Click(Sender: TObject);
begin
  C.ElimPalConVocRepetidas;
end;

procedure TfrmPrincipal.Eliminarpalabrasub1Click(Sender: TObject);
var x: string;
begin
  x := Inputbox('ingrse una subcadena', 'Sub: ', '');
  C.eliminarPalabraSub(x);
end;

procedure TfrmPrincipal.FormatearHora1Click(Sender: TObject);
begin
  Label1.Caption := C.FormatearHora2;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
      C := Cadena.Create;
      t:=1;
end;

procedure TfrmPrincipal.InsertarCaracter1Click(Sender: TObject);
begin
     C.insChar(StrToInt(Edit2.Text),Edit1.Text[1]);
end;

procedure TfrmPrincipal.Invertircaracteres1Click(Sender: TObject);
begin
     C.invChars;
end;

procedure TfrmPrincipal.Longitud1Click(Sender: TObject);
begin
     Label1.Caption:=IntToStr(C.getLong);
end;

procedure TfrmPrincipal.Mostrarcadena1Click(Sender: TObject);
begin
     Label1.Caption:=C.getStr;
end;

procedure TfrmPrincipal.nPalabra1Click(Sender: TObject);
begin
     showmessage(C.nWord(StrToInt(Edit1.Text)));
end;

procedure TfrmPrincipal.Obtenerhoramenor1Click(Sender: TObject);
begin
  showmessage(C.devolverHoraMenor);
end;

procedure TfrmPrincipal.SiguientePalabra1Click(Sender: TObject);
begin
     Label1.Caption:=C.nextWord(t);
end;

procedure TfrmPrincipal.Sumarrealesyredondear1Click(Sender: TObject);
var x: string;
begin
  x := Inputbox('Introduzca la presicion', 'presicion: ', '');
  Label1.Caption:= FloatToStr(C.SumarReales(StrToInt(x)));
end;

end.
