unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, UCCadena;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Cadena1: TMenuItem;
    Cadena2: TMenuItem;
    Mostrarcadena1: TMenuItem;
    Edit1: TEdit;
    Label1: TLabel;
    Invertir1: TMenuItem;
    Mayuscula1: TMenuItem;
    oentero1: TMenuItem;
    Cantidaddepalabras1: TMenuItem;
    Operarcadean1: TMenuItem;
    delword1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Cadena2Click(Sender: TObject);
    procedure Mostrarcadena1Click(Sender: TObject);
    procedure Invertir1Click(Sender: TObject);
    procedure Mayuscula1Click(Sender: TObject);
    procedure oentero1Click(Sender: TObject);
    procedure Cantidaddepalabras1Click(Sender: TObject);
    procedure Operarcadean1Click(Sender: TObject);
    procedure delword1Click(Sender: TObject);
  private
    c: cadena;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Cadena2Click(Sender: TObject);
begin
  c.addCadena(Edit1.text);


end;

procedure TForm1.Cantidaddepalabras1Click(Sender: TObject);
begin
  label1.Caption := IntToStr(c.cantPals);
end;

procedure TForm1.delword1Click(Sender: TObject);
begin
  c.delWord(StrToInt(inputBox('Ingrese la posicion de la palbra', '', '')));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  c := cadena.Create;
end;

procedure TForm1.Invertir1Click(Sender: TObject);
begin
  c.invertir;
end;

procedure TForm1.Mayuscula1Click(Sender: TObject);
begin
  c.toMayuscula;
end;

procedure TForm1.Mostrarcadena1Click(Sender: TObject);
begin
   label1.caption :=   c.getCadena;
end;

procedure TForm1.oentero1Click(Sender: TObject);
begin
  Label1.Caption := IntTOStr(c.toEntero div 2);
end;

procedure TForm1.Operarcadean1Click(Sender: TObject);
begin
  Label1.caption := IntToStr(c.operarCadena);
end;

end.
