program Numeros;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {Form2},
  UCNumero in 'UCNumero.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
