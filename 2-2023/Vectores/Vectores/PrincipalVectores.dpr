program PrincipalVectores;

uses
  Vcl.Forms,
  UCVectores in 'UCVectores.pas',
  UFVectores in 'UFVectores.pas' {VECTORES};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TVECTORES, VECTORES);
  Application.Run;
end.
