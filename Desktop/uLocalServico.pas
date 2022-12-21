unit uLocalServico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListBox,
  FMX.Objects, FMX.Edit, System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid;

type
  TfrmLocalServico = class(TForm)
    Label1: TLabel;
    layLocalServico: TLayout;
    edtNomeEmpresa: TEdit;
    lneNomeEmpresa: TLine;
    cbxServicos: TComboBox;
    btnSalvar: TSpeedButton;
    Grid1: TGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalServico: TfrmLocalServico;

implementation

{$R *.fmx}

end.
