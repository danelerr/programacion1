unit UFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,UCNumero, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Metodos1: TMenuItem;
    Metodos2: TMenuItem;
    CambiarValor1: TMenuItem;
    CambiarValor2: TMenuItem;
    Insertardigito1: TMenuItem;
    Insertardigito2: TMenuItem;
    Label1: TLabel;
    Edit1: TEdit;
    Adddigizq1: TMenuItem;
    obtenerenbasen1: TMenuItem;
    Romano1: TMenuItem;
    Obtenerenbase101: TMenuItem;
    Delposicionesprimas1: TMenuItem;
    Ordenardescendente1: TMenuItem;
    eliminardigitosalladodepar1: TMenuItem;
    Getmenorcombinacion1: TMenuItem;
    EncontrarCombinacion1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Metodos2Click(Sender: TObject);
    procedure CambiarValor1Click(Sender: TObject);
    procedure Insertardigito2Click(Sender: TObject);
    procedure Adddigizq1Click(Sender: TObject);
    procedure obtenerenbasen1Click(Sender: TObject);
    procedure Romano1Click(Sender: TObject);
    procedure Obtenerenbase101Click(Sender: TObject);
    procedure CambiarValor2Click(Sender: TObject);
    procedure Delposicionesprimas1Click(Sender: TObject);
    procedure Ordenardescendente1Click(Sender: TObject);
    procedure eliminardigitosalladodepar1Click(Sender: TObject);
    procedure Getmenorcombinacion1Click(Sender: TObject);
    procedure EncontrarCombinacion1Click(Sender: TObject);
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

procedure TfrmPrincipal.Adddigizq1Click(Sender: TObject);
begin
    N.addDigitIzq(StrToInt(Edit1.Text));
end;

procedure TfrmPrincipal.CambiarValor1Click(Sender: TObject);
begin
     N.setValue(StrToInt(Edit1.Text));
end;

procedure TfrmPrincipal.CambiarValor2Click(Sender: TObject);
var x: string;
begin
  x := InputBox('Introduce un digito', 'digito', '0');
  N.addDigit(StrToInt(x));
end;

procedure TfrmPrincipal.Delposicionesprimas1Click(Sender: TObject);
begin
  N.delPosPrimo;
end;

procedure TfrmPrincipal.eliminardigitosalladodepar1Click(Sender: TObject);
begin
  N.eliminarDigitosAlLadodeUnPar3;
end;

procedure TfrmPrincipal.EncontrarCombinacion1Click(Sender: TObject);
begin
  N.ImparIzqParDe_Ordenado;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
    N := Numero.Create;
end;

procedure TfrmPrincipal.Getmenorcombinacion1Click(Sender: TObject);
begin
  n.getMenorCombinacion;
end;

procedure TfrmPrincipal.Insertardigito2Click(Sender: TObject);
begin
  Label1.Caption  := 'La cantidad es: ' + IntToStr(N.Size);
end;

procedure TfrmPrincipal.Metodos2Click(Sender: TObject);
begin
     Label1.Caption:='El valor es:'+IntToStr(N.getValue);
end;

procedure TfrmPrincipal.Obtenerenbase101Click(Sender: TObject);
var x: cardinal;
begin
  x := N.toBase10(StrToInt(Edit1.Text));
  Label1.Caption := IntToStr(x);

end;

procedure TfrmPrincipal.obtenerenbasen1Click(Sender: TObject);
var x: cardinal;
begin
  x := N.toBaseN(StrToInt(Edit1.Text));
  Label1.Caption := IntToStr(x);
end;

procedure TfrmPrincipal.Ordenardescendente1Click(Sender: TObject);
begin
  N.ordernarDesc;
end;

procedure TfrmPrincipal.Romano1Click(Sender: TObject);
begin
  Label1.Caption := N.toRomano;
end;

end.
