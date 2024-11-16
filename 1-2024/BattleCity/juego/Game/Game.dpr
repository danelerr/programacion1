program Game;

uses
  Vcl.Forms,
  UFPrincipal in 'UFPrincipal.pas' {frmPantalla},
  UCScenario in 'UCScenario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPantalla, frmPantalla);
  Application.Run;
end.
