program vectorL;

uses
  Vcl.Forms,
  interx in 'interx.pas' {Form1},
  codev in 'codev.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
