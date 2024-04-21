unit UFVectores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,UCVectores, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Grids;

type
  TVECTORES = class(TForm)
    SGVector: TStringGrid;
    ScrollBar1: TScrollBar;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    MainMenu1: TMainMenu;
    Vectores1: TMenuItem;
    Obtenerelemento1: TMenuItem;
    Aadirelemento1: TMenuItem;
    Insertarelemento1: TMenuItem;
    Modificarelemento1: TMenuItem;
    Eliminarelemento1: TMenuItem;
    Dimension1: TMenuItem;
    Sumarelementos1: TMenuItem;
    Encontrarelemento1: TMenuItem;
    Elementomenor1: TMenuItem;
    Busqueda1: TMenuItem;
    Busqueda2: TMenuItem;
    RCantidadText: TEdit;
    RCantidad: TLabel;
    RInicio: TLabel;
    RFinal: TLabel;
    RInicioText: TEdit;
    RFinalText: TEdit;
    CheckBox1: TCheckBox;
    Button3: TButton;
    Ordenacin1: TMenuItem;
    Ordenacnintercambio1: TMenuItem;
    OrdenacinporSeleccin1: TMenuItem;
    OrdenacinporBurbuja1: TMenuItem;
    OrdenacinporShell1: TMenuItem;
    Intercambiar1: TMenuItem;
    OrdenacionporQuickSort1: TMenuItem;
    procedure ScrollBar1Change(Sender: TObject);
    procedure Cargar1Click(Sender: TObject);
    procedure Mostrar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Obtenerelemento1Click(Sender: TObject);
    procedure Aadirelemento1Click(Sender: TObject);
    procedure Insertarelemento1Click(Sender: TObject);
    procedure Modificarelemento1Click(Sender: TObject);
    procedure Eliminarelemento1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Dimension1Click(Sender: TObject);
    procedure Sumarelementos1Click(Sender: TObject);
    procedure Encontrarelemento1Click(Sender: TObject);
    procedure Elementomenor1Click(Sender: TObject);
    procedure Busqueda2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Ordenacnintercambio1Click(Sender: TObject);
    procedure OrdenacinporSeleccin1Click(Sender: TObject);
    procedure OrdenacinporBurbuja1Click(Sender: TObject);
    procedure OrdenacinporShell1Click(Sender: TObject);
    procedure Intercambiar1Click(Sender: TObject);
    procedure OrdenacionporQuickSort1Click(Sender: TObject);
    //procedure FormCreate(Sender: TObject);
  private
     V:Vector;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VECTORES: TVECTORES;


implementation

{$R *.dfm}


procedure TVECTORES.Aadirelemento1Click(Sender: TObject);
begin
  V.AddElemnt(StrtoFloat(InputBox('','Elemento a a�adir','')));
end;

procedure TVECTORES.Busqueda2Click(Sender: TObject);
begin
  label1.Caption:= IntToStr(V.BusquedaSecuencial(StrToFloat(InputBox('Introducir','Elemento a encontrar',''))))
end;

procedure TVECTORES.Button1Click(Sender: TObject);
var
  I: Integer;

begin
  SGVector.ColCount:=V.Dim;
  for I := 1 to V.Dim do
    SGVector.Cells[i-1,0]:= FloatToStr(V.GetElement(i));
end;

procedure TVECTORES.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  V.Redimensionar(SGVector.ColCount);
  for I := 1 to V.Dim do
    V.ModElement(i,StrToFloat(SGVector.Cells[i-1,0]));
end;
procedure TVECTORES.Button3Click(Sender: TObject);
begin
  V.ARandom(StrToInt(RCantidadText.text),StrToInt(RInicioText.text),StrToInt(RFinalText.text),CheckBox1.Checked)
end;

procedure TVECTORES.Cargar1Click(Sender: TObject);
var
  I: Integer;
begin
  V.Redimensionar(SGVector.ColCount);
  for I := 1 to V.Dim do
    V.ModElement(i,StrToFloat(SGVector.Cells[i-1,0]));
end;

procedure TVECTORES.Dimension1Click(Sender: TObject);
begin
  label1.Caption:= 'La dimension del vector es: '+FloatToStr(V.Dim);
end;

procedure TVECTORES.Elementomenor1Click(Sender: TObject);
begin
  label1.Caption:= 'El elemento menor es: ' + floatToStr(V.MenorElement);
end;

procedure TVECTORES.Eliminarelemento1Click(Sender: TObject);
begin
  v.DelElement(StrToInt(InputBox('','Posici�n','')));
end;

procedure TVECTORES.Encontrarelemento1Click(Sender: TObject);
begin
  label1.Caption:= 'Elemento econtrado en la celda: ' + v.FindElement(StrtoFloat(InputBox('','Elemento a acontrar','')));
end;

procedure TVECTORES.FormCreate(Sender: TObject);
begin
  V:= Vector.create;
end;

procedure TVECTORES.Insertarelemento1Click(Sender: TObject);
begin
  V.InsElement(StrToInt(InputBox('','Posici�n','')),StrToFloat(InputBox('','Elemento','')));
end;

procedure TVECTORES.Intercambiar1Click(Sender: TObject);
begin
  V.Intercambiar(2,5);
end;

procedure TVECTORES.Modificarelemento1Click(Sender: TObject);
begin
  V.ModElement(StrToInt(InputBox('','Posici�n','')),StrToFloat(InputBox('','Elemento','')));
end;

procedure TVECTORES.Mostrar1Click(Sender: TObject);
var
  I: Integer;
begin
  SGVector.ColCount:=V.Dim;
  for I := 1 to V.Dim do
    SGVector.Cells[i-1,0]:= FloatToStr(V.GetElement(i));
end;

procedure TVECTORES.Obtenerelemento1Click(Sender: TObject);
begin
  showmessage(FloatToStr(V.GetElement(StrToInt(InputBox('Posici�n','Nro','')))))
end;

procedure TVECTORES.OrdenacinporBurbuja1Click(Sender: TObject);
begin
  V.OrdBurbuja;
end;

procedure TVECTORES.OrdenacinporSeleccin1Click(Sender: TObject);
begin
  V.OrdSelec;
end;

procedure TVECTORES.OrdenacinporShell1Click(Sender: TObject);
begin
  V.OrdShell
end;

procedure TVECTORES.OrdenacionporQuickSort1Click(Sender: TObject);
begin
  V.QuickSort;
end;

procedure TVECTORES.Ordenacnintercambio1Click(Sender: TObject);
begin
  V.OrdInter;
end;

procedure TVECTORES.ScrollBar1Change(Sender: TObject);
begin
  SGVector.ColCount:= Scrollbar1.Position;
end;

procedure TVECTORES.Sumarelementos1Click(Sender: TObject);
begin
  Label1.Caption:= 'La suma de todos los elementos son: ' + FloatToStr(V.SumElements);
end;

end.
