unit uform;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Grids, Vcl.StdCtrls, Vcl.Menus, UCVector;
type
  TForm1 = class(TForm)
    StringGrid1: TStringGrid;
    ScrollBar1: TScrollBar;
    MainMenu1: TMainMenu;
    Vector1: TMenuItem;
    Vector2: TMenuItem;
    QuickSort1: TMenuItem;
    Mostrarvector1: TMenuItem;
    MergeSort1: TMenuItem;
    procedure ScrollBar1Change(Sender: TObject);
    procedure Vector2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QuickSort1Click(Sender: TObject);
    procedure Mostrarvector1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MergeSort1Click(Sender: TObject);
  private
    v: Vector;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
    var x: word;
begin
  //v.intercambiar(2, 6);
  //ShowMessage(FloatToStr(v.getElement(2)));
  x := v.pivote(1, v.Dim);
  ShowMessage(IntToStr(x));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 v := Vector.Create;

end;

procedure TForm1.MergeSort1Click(Sender: TObject);
begin
  v.MergeSort;
end;

procedure TForm1.Mostrarvector1Click(Sender: TObject);
var
  I: integer;
begin
   for I :=  1 to v.Dim do begin
     StringGrid1.Cells[i-1, 0] := FloatToStr(v.getElement(i));
   end;
end;

procedure TForm1.QuickSort1Click(Sender: TObject);
begin
  v.quickSort;
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
 StringGrid1.ColCount := ScrollBar1.Position;
end;

procedure TForm1.Vector2Click(Sender: TObject);
var
  i: Integer;
  e: real;
begin
  v.Dimensionar(StringGrid1.ColCount);
  for i := 1 to v.Dim do begin
    randomize;
    e := random(30) + 1;
    v.modElement(i, e);
    StringGrid1.Cells[i-1, 0] := FloatToStr(e);
  end;
end;

end.
