unit uAbertura;

interface

uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
    FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl,
    System.Actions, FMX.ActnList, Data.Bind.EngExt, FMX.Bind.DBEngExt,
    System.Rtti, System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
    Data.Bind.DBScope, FMX.ListBox, Data.DB, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView;

type
    TfrmAbertura = class(TForm)
        Layout1: TLayout;
        Rectangle1: TRectangle;
        Label1: TLabel;
        Layout2: TLayout;
        Label2: TLabel;
        Layout3: TLayout;
        Rectangle2: TRectangle;
        Label3: TLabel;
        Layout4: TLayout;
        Label4: TLabel;
        Layout5: TLayout;
        Rectangle3: TRectangle;
        Label5: TLabel;
        Layout6: TLayout;
        Image1: TImage;
        TabControl1: TTabControl;
        TabItemAcesso: TTabItem;
        TabItemAmbulatorio: TTabItem;
        ActionList1: TActionList;
        ChangeTabActionEspecilaidade: TChangeTabAction;
        ChangeTabActionAmbulatorio: TChangeTabAction;
        TabItemEspecialidade: TTabItem;
        Layout8: TLayout;
        Rectangle4: TRectangle;
        Label7: TLabel;
        Layout7: TLayout;
        Layout9: TLayout;
        Label6: TLabel;
        ToolBar1: TToolBar;
        SpeedButton1: TSpeedButton;
        SpeedButton2: TSpeedButton;
        Layout10: TLayout;
        ListView2: TListView;
        Layout11: TLayout;
        Rectangle5: TRectangle;
        Label8: TLabel;
        Layout12: TLayout;
        Label9: TLabel;
        procedure Label5Click(Sender: TObject);
        procedure Label3Click(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
            Shift: TShiftState);
        procedure ListView1ItemClick(const Sender: TObject;
            const AItem: TListViewItem);
        procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
        private
            { Private declarations }
        public
            { Public declarations }
    end;

var
      frmAbertura: TfrmAbertura;

implementation

{$R *.fmx}


uses uCadastrar, uLogin;
{$R *.LgXhdpiPh.fmx ANDROID}


procedure TfrmAbertura.FormCreate(Sender: TObject);
begin
    TabControl1.TabPosition := TTabPosition.None;
    TabControl1.ActiveTab := TabItemAcesso;
    // TabControl1.ActiveTab := TabItemEspecialidade;
end;

procedure TfrmAbertura.FormKeyUp(Sender: TObject; var Key: Word;
    var KeyChar: Char; Shift: TShiftState);
begin
    Key := 0;
end;

procedure TfrmAbertura.Label3Click(Sender: TObject);
begin
    if not Assigned(frmLogin) then
        Application.CreateForm(TfrmLogin, frmLogin);
    frmLogin.Show
end;

procedure TfrmAbertura.Label5Click(Sender: TObject);
begin
    if not Assigned(frmCadastrar) then
        Application.CreateForm(tfrmCadastrar, frmCadastrar);

    frmCadastrar.edtEmail.Text := '';
    frmCadastrar.edtCpf.Text := '';
    frmCadastrar.edtSenha.Text := '';
    frmCadastrar.edtSenha1.Text := '';
    frmCadastrar.edtNome.Text := '';
    frmCadastrar.edtSus.Text := '';
    frmCadastrar.Show
end;

procedure TfrmAbertura.ListView1ItemClick(const Sender: TObject;
    const AItem: TListViewItem);
begin
{    qryAmbulatorio.Close;
    qryAmbulatorio.Params.ParamByName('idespecialidade').Value := qryEspecialidadeid_especialidade.Value;
    qryAmbulatorio.Open;
    ChangeTabActionAmbulatorio.Execute;     }
end;

procedure TfrmAbertura.SpeedButton1Click(Sender: TObject);
begin
    ChangeTabActionEspecilaidade.Execute;
end;

procedure TfrmAbertura.SpeedButton2Click(Sender: TObject);
begin
     Close;
end;

end.
