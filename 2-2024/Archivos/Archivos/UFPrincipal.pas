unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  UCArchivoTexto,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Archivo1: TMenuItem;
    Archivo2: TMenuItem;
    OpenDialog1: TOpenDialog;
    Memo1: TMemo;
    SaveDialog1: TSaveDialog;
    Guardar1: TMenuItem;
    BuscarPalabra1: TMenuItem;
    BorrarPalabra1: TMenuItem;
    Input1: TMenuItem;
    Convertirmayusculas1: TMenuItem;
    Sumarnumeros1: TMenuItem;
    EliminarPalabrasconsub1: TMenuItem;
    Eliminarpalabrasvocalrepetida1: TMenuItem;
    ScrollBar1: TScrollBar;
    procedure Archivo2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Guardar1Click(Sender: TObject);
    procedure BuscarPalabra1Click(Sender: TObject);
    procedure BorrarPalabra1Click(Sender: TObject);
    procedure Input1Click(Sender: TObject);
    procedure Convertirmayusculas1Click(Sender: TObject);
    procedure Sumarnumeros1Click(Sender: TObject);
    procedure EliminarPalabrasconsub1Click(Sender: TObject);
    procedure Eliminarpalabrasvocalrepetida1Click(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
  private
    { Private declarations }
    MiArchivo : ArchivoTexto;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Archivo2Click(Sender: TObject);
Var
   lineas : TStringList;
  I: Integer;
begin
     If OpenDialog1.Execute Then
     Begin
          MiArchivo.Open(lectura, OpenDialog1.FileName);
          lineas:=MiArchivo.readLines;
          Memo1.Lines.Assign(lineas);
          MiArchivo.Close;
     End;
end;

procedure TfrmPrincipal.BorrarPalabra1Click(Sender: TObject);
begin
     MiArchivo.delWord(InputBox('Eliminar','Texto a Buscar',''),Memo1.Lines);
end;

procedure TfrmPrincipal.BuscarPalabra1Click(Sender: TObject);
Var
  r : String;
begin
     //MiArchivo.Open(lectura);
     r:=MiArchivo.findWord(InputBox('Buscar','Texto a Buscar',''),Memo1.Lines);
     If r='' Then
        Showmessage('No se encuenta')
     Else Showmessage(r);
     //MiArchivo.Close;
end;

procedure TfrmPrincipal.Convertirmayusculas1Click(Sender: TObject);
begin
     MiArchivo.mayuscula(memo1.Lines);
end;

procedure TfrmPrincipal.EliminarPalabrasconsub1Click(Sender: TObject);
var sub: string;
begin
  sub := inputbox('introduzca la subpalabr', '', '');
  MiArchivo.eliminarPalabrasConSub(memo1.Lines, sub);
end;

procedure TfrmPrincipal.Eliminarpalabrasvocalrepetida1Click(Sender: TObject);
begin
  MiArchivo.eliminarPalVocRep(Memo1.Lines);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
     MiArchivo := ArchivoTexto.Create;
end;

procedure TfrmPrincipal.Guardar1Click(Sender: TObject);
begin
     if SaveDialog1.Execute then
     Begin
          MiArchivo.Open(escritura,SaveDialog1.FileName);
          MiArchivo.saveLines(memo1.Lines);
          MiArchivo.Close;
     End;
end;

procedure TfrmPrincipal.Input1Click(Sender: TObject);
Var
  r : Word;
begin
     r:=MiArchivo.contarPalabras(memo1.Lines);
     ShowMessage('La cantidad de palabras es:'+IntToStr(r));
end;

procedure TfrmPrincipal.ScrollBar1Change(Sender: TObject);
begin
  Memo1.Font.Size	:= ScrollBar1.Position;
end;

procedure TfrmPrincipal.Sumarnumeros1Click(Sender: TObject);
begin
     ShowMessage('La suma es:'+FloatToStr(MiArchivo.Sumar(memo1.Lines)));
end;

end.
