program Agende;

uses
  System.StartUpCopy,
  FMX.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uLogin in 'uLogin.pas' {frmLogin},
  uDados in 'uDados.pas' {dmDados: TDataModule},
  uUsuarios in 'uUsuarios.pas' {frmUsuarios},
  configuracao in 'configuracao.pas' {frmConfiguracao},
  uAdicionarServico in 'uAdicionarServico.pas' {frmAdicionarServico},
  uLocalServico in 'uLocalServico.pas' {frmLocalServico};

{$R *.res}


begin
    Application.Initialize;
    Application.CreateForm(TdmDados, dmDados);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmLocalServico, frmLocalServico);
  Application.Run;

end.
