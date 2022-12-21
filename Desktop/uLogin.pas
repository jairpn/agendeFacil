unit uLogin;

interface

uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
    FMX.Layouts, FMX.Ani, FMX.Controls.Presentation, FMX.StdCtrls, FMX.platform.win, winapi.windows,
    FMX.Edit, MemDS,
    DBAccess, MyAccess, Data.DB;

type
    TfrmLogin = class(TForm)
        Layout1: TLayout;
        Rectangle1: TRectangle;
        lblLogin: TLabel;
        imgFechar: TImage;
        lblAcessarSistema: TLabel;
        lotEsquerdo: TLayout;
        edtUsuario: TEdit;
        Line1: TLine;
        Line2: TLine;
        edtSenha: TEdit;
        sbtnAcessar: TSpeedButton;
        lblAviso: TLabel;
        Rectangle2: TRectangle;
        Rectangle3: TRectangle;
        procedure edtUsuarioEnter(Sender: TObject);
        procedure edtSenhaEnter(Sender: TObject);
        procedure imgFecharClick(Sender: TObject);
        procedure sbtnAcessarClick(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure edtUsuarioTyping(Sender: TObject);
        procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Single);
        private
            { Private declarations }
        public
            { Public declarations }
    end;

var
      frmLogin: TfrmLogin;

implementation

{$R *.fmx}


uses uPrincipal, uDados;

procedure TfrmLogin.edtSenhaEnter(Sender: TObject);
begin
    if (edtSenha.TextPrompt = 'SENHA') then
        edtSenha.TextPrompt := '';
end;

procedure TfrmLogin.edtUsuarioEnter(Sender: TObject);
begin
    if (edtUsuario.TextPrompt = 'USUÁRIO') then
        edtUsuario.TextPrompt := '';
end;

procedure TfrmLogin.edtUsuarioTyping(Sender: TObject);
begin
    lblAviso.Visible := False;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
    lblAviso.Text := '';
    lblAviso.Visible := False;
end;

procedure TfrmLogin.FormMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Single);
begin
    Self.StartWindowDrag;
end;

procedure TfrmLogin.imgFecharClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmLogin.sbtnAcessarClick(Sender: TObject);
var
      minusculo: string;
begin

    if (edtUsuario.Text = '') or (edtSenha.Text = '') then
        begin
            lblAviso.Text := '';
            lblAviso.TextSettings.FontColor := TAlphaColorRec.White;
            lblAviso.Text := 'Preencha os dados!';
            lblAviso.Visible := True;
            exit;
        end;

    dmDados.qryUsuario.Close;
    dmDados.qryUsuario.Params.ParamByName('nome').Value := edtUsuario.Text;
    dmDados.qryUsuario.Params.ParamByName('senha').Value := edtSenha.Text;
    dmDados.qryUsuario.Open();

    if (dmDados.qryUsuario.RecordCount = 1) then
        begin
            if not(assigned(frmPrincipal)) then
                Application.CreateForm(Tfrmprincipal, frmPrincipal);
            frmPrincipal.show;
            frmLogin.Hide;
        end
    else
        begin
            lblAviso.Text := '';
            lblAviso.TextSettings.FontColor := TAlphaColorRec.red;
            lblAviso.Text := 'Combinação Usuário/Senha inválido!!';
            lblAviso.Visible := True;
        end;
end;

end.
