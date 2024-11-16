program BattleCity;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UCTanque in 'UCTanque.pas',
  UCBala in 'UCBala.pas',
  UCPared in 'UCPared.pas',
  UCEscenario in 'UCEscenario.pas',
  AudioManager in 'AudioManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
