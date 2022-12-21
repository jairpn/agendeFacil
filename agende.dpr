program agende;

uses
  System.StartUpCopy,
  FMX.Forms,
  uAbertura in 'uAbertura.pas' {frmAbertura},
  uCadastrar in 'uCadastrar.pas' {frmCadastrar},
  Loading in 'Loading.pas',
  uLogin in 'uLogin.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.FormFactor.Orientations := [TFormOrientation.Portrait];
  Application.CreateForm(TfrmAbertura, frmAbertura);
  Application.Run;
end.
