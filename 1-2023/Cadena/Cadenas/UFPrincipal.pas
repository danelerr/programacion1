unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCCadena, Vcl.Menus, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Metodos2: TMenuItem;
    CargarCadena1: TMenuItem;
    CargarCadena2: TMenuItem;
    Palabramayor1: TMenuItem;
    Examen1a1: TMenuItem;
    Sinonimo1: TMenuItem;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Metodos2Click(Sender: TObject);
    procedure CargarCadena1Click(Sender: TObject);
    procedure CargarCadena2Click(Sender: TObject);
    procedure Palabramayor1Click(Sender: TObject);
    procedure Examen1a1Click(Sender: TObject);
    procedure Sinonimo1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    C : Cadena;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  C.deleteChars(3, 3);
end;

procedure TfrmPrincipal.CargarCadena1Click(Sender: TObject);
begin
     C.addStr(Edit1.Text);
end;

procedure TfrmPrincipal.CargarCadena2Click(Sender: TObject);
begin
     Label1.Caption:='Numero de palabras: '+IntToStr(C.getNumWord);
end;

procedure TfrmPrincipal.Examen1a1Click(Sender: TObject);
begin
  Label1.Caption := C.examen1a;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     C := Cadena.Create;
end;

procedure TfrmPrincipal.Metodos2Click(Sender: TObject);
begin
     Label1.Caption:=C.getStr;
end;

procedure TfrmPrincipal.Palabramayor1Click(Sender: TObject);
begin
     Label1.Caption:='Palabra mayor: '+C.maxWord;
end;

procedure TfrmPrincipal.Sinonimo1Click(Sender: TObject);
var s: string;
begin
    s := inputBox('Introduzca una cadena', '', '');
    Label1.Caption:= C.Sinonimo(s);
//      Label1.Caption := C.nextWordTest;
end;

end.
