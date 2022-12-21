unit configuracao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls;

type
  TfrmConfiguracao = class(TForm)
    layConfiguracao: TLayout;
    edtNomeEmpresa: TEdit;
    lneNomeEmpresa: TLine;
    Label1: TLabel;
    edtTipoNegocio: TEdit;
    Line1: TLine;
    edtHoraFuncionamento: TEdit;
    Line2: TLine;
    edtDataFuncionamento: TEdit;
    Line3: TLine;
    edtEndereco: TEdit;
    Line4: TLine;
    edtTelefone: TEdit;
    Line5: TLine;
    btnSalvar: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfiguracao: TfrmConfiguracao;

implementation

{$R *.fmx}

end.
