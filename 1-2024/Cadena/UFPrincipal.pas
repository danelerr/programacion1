unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCCadena, Vcl.Menus, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Metodos2: TMenuItem;
    Adicionarstring1: TMenuItem;
    Mostrarcadena1: TMenuItem;
    Adicionarcaracter1: TMenuItem;
    AdcionarCaracter1: TMenuItem;
    InstertarCaracter1: TMenuItem;
    EliminarCaracter1: TMenuItem;
    ObtenerCaracter1: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Invertircaracteres1: TMenuItem;
    Contarpalabras1: TMenuItem;
    Palabrasdeinicianyterminarenvocal1: TMenuItem;
    Sumarnumeros1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Metodos2Click(Sender: TObject);
    procedure Adicionarstring1Click(Sender: TObject);
    procedure Mostrarcadena1Click(Sender: TObject);
    procedure InstertarCaracter1Click(Sender: TObject);
    procedure Invertircaracteres1Click(Sender: TObject);
    procedure Contarpalabras1Click(Sender: TObject);
    procedure Sumarnumeros1Click(Sender: TObject);
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

procedure TfrmPrincipal.Adicionarstring1Click(Sender: TObject);
begin
     C.addStr(Edit1.Text);
end;

procedure TfrmPrincipal.Contarpalabras1Click(Sender: TObject);
begin
     Label1.Caption:=IntToStr(C.countWord);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     C := Cadena.Create;
end;

procedure TfrmPrincipal.InstertarCaracter1Click(Sender: TObject);
begin
     C.insChar(StrToInt(Edit2.Text),Edit3.Text[1])
end;

procedure TfrmPrincipal.Invertircaracteres1Click(Sender: TObject);
begin
     C.invertChar;
end;

procedure TfrmPrincipal.Metodos2Click(Sender: TObject);
begin
     label1.Caption:='La longitud es: '+IntToStr(C.Long);
end;

procedure TfrmPrincipal.Mostrarcadena1Click(Sender: TObject);
begin
     Label1.Caption:=C.getStr;
end;

procedure TfrmPrincipal.Sumarnumeros1Click(Sender: TObject);
begin
     label1.Caption:='La suma es:'+FloatToStr(C.sumNumber);
end;

end.
