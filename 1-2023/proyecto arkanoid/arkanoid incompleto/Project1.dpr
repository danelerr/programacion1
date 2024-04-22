program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  UBarra in 'UBarra.pas',
  UBola in 'UBola.pas',
  AudioManager in 'AudioManager.pas',
  UBloque in 'UBloque.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
