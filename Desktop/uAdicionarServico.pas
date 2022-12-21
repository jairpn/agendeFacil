unit uAdicionarServico;

interface

uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
    FMX.StdCtrls, FMX.Objects, FMX.Edit, FMX.Controls.Presentation, FMX.Layouts,
    System.Rtti, FMX.Grid.Style, FMX.ScrollBox, FMX.Grid;

type
    TfrmAdicionarServico = class(TForm)
        Label1: TLabel;
        edtNomeEmpresa: TEdit;
        lneNomeEmpresa: TLine;
        btnSalvar: TSpeedButton;
        cbxDuracao: TComboBox;
        layAdicionarServicos: TLayout;
        Label2: TLabel;
        Grid1: TGrid;
        procedure FormCreate(Sender: TObject);
        private
            { Private declarations }
        public
            { Public declarations }
    end;

var
      frmAdicionarServico: TfrmAdicionarServico;

implementation

{$R *.fmx}


procedure TfrmAdicionarServico.FormCreate(Sender: TObject);
begin
    cbxDuracao.Items.Clear;
    cbxDuracao.Items.Add('15 Min.');
    cbxDuracao.Items.Add('30 Min.');
    cbxDuracao.Items.Add('45 Min.');
    cbxDuracao.Items.Add('1 hora');
    cbxDuracao.ItemIndex := 0;
end;

end.
