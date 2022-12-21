unit uLogin;

interface

uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
    FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts, IdHashMessageDigest,
    FMX.TabControl, System.Actions, FMX.ActnList;

type
    TfrmLogin = class(TForm)
        Layout1: TLayout;
        Rectangle1: TRectangle;
        Label1: TLabel;
        TabControl1: TTabControl;
        TabItemCPF: TTabItem;
        TabItemSenha: TTabItem;
        Layout3: TLayout;
        edtcpf: TEdit;
        Layout5: TLayout;
        Rectangle3: TRectangle;
        Label5: TLabel;
        Layout7: TLayout;
        edtSenha: TEdit;
        ActionList1: TActionList;
        ChangeTabActionCPF: TChangeTabAction;
        ChangeTabActionSenha: TChangeTabAction;
        Layout4: TLayout;
        Rectangle2: TRectangle;
        Label3: TLabel;
        TabItemEmail: TTabItem;
        ChangeTabActionEmail: TChangeTabAction;
        Layout6: TLayout;
        edtRecuperarSenha: TEdit;
        Layout8: TLayout;
        Rectangle4: TRectangle;
        lblEnviarEmail: TLabel;
        Layout9: TLayout;
        lblRecuperarSenha: TLabel;
        Layout10: TLayout;
        Rectangle5: TRectangle;
        Label4: TLabel;
        Layout2: TLayout;
        Label2: TLabel;
        Layout11: TLayout;
        Label6: TLabel;
        procedure Label5Click(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure Label3Click(Sender: TObject);
        procedure Label2Click(Sender: TObject);
        procedure lblEnviarEmailClick(Sender: TObject);
        procedure Label4Click(Sender: TObject);
        private
            { Private declarations }
        public
            { Public declarations }
    end;

var
      frmLogin: TfrmLogin;

implementation

{$R *.fmx}


uses uCadastrar, Loading, uAbertura;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
    TabControl1.ActiveTab := TabItemCPF;
    TabControl1.TabPosition := TTabPosition.None;
end;

procedure TfrmLogin.Label2Click(Sender: TObject);
begin
    lblRecuperarSenha.Text := '';
    edtRecuperarSenha.Text := '';
    ChangeTabActionEmail.Execute;
end;

procedure TfrmLogin.Label3Click(Sender: TObject);
begin
{    if (edtSenha.Text.Trim.IsEmpty) then
        begin
            ShowMessage('Preencha os campos.');
            exit;
        end
    else
        begin
            TLoading.Show(frmLogin, 'Conferindo Senha. Aguarde...');

            TThread.CreateAnonymousThread(procedure
                begin
                    sleep(2000);
                    TThread.Synchronize(nil, procedure
                        begin
                            qrySenha.Close;
                            qrySenha.Params.ParamByName('senha').Value := edtSenha.Text;
                            qrySenha.Params.ParamByName('nome').Value := edtcpf.Text;
                            qrySenha.open;
                            if (qrySenha.RecordCount = 1) then
                                begin
                                    edtcpf.Text := '';
                                    edtSenha.Text := '';
                                    edtRecuperarSenha.Text := '';
                                    TLoading.Hide;
                                    frmAbertura.TabControl1.ActiveTab := frmAbertura.TabItemEspecialidade;
                                    frmAbertura.Show;
                                end
                            else
                                begin
                                    ShowMessage('Senha não confere!!');
                                    TLoading.Hide;
                                    exit;
                                end;
                        end);

                end).Start;

        end;     }
end;

procedure TfrmLogin.Label4Click(Sender: TObject);
begin
    edtcpf.Text := '';
    edtSenha.Text := '';
    edtRecuperarSenha.Text := '';
    if not(Assigned(frmAbertura)) then
        Application.CreateForm(TfrmAbertura, frmAbertura);
    frmAbertura.Show;
end;

procedure TfrmLogin.Label5Click(Sender: TObject);
begin
    if (edtcpf.Text.Trim.IsEmpty) then
        begin
            ShowMessage('Preencha os campos.');
            exit;
        end
    else
        begin
            TLoading.Show(frmLogin, 'Conferindo CPF. Aguarde...');

            TThread.CreateAnonymousThread(procedure
                begin
                    sleep(2000);
                    TThread.Synchronize(nil, procedure
                        begin
//                            qryCpf.Close;
//                            qryCpf.Params.ParamByName('cpf').Value := edtcpf.Text;
//                            qryCpf.open;
//                            if (qryCpf.RecordCount = 1) then
//                                begin
                                    TLoading.Hide;
                                    ChangeTabActionSenha.Execute;
                             //   end
//                            else
//                               begin
//                                    ShowMessage('CPF não encontrado!!');
//                                    TLoading.Hide;
//                                    exit;
//                                end;
                        end);

                end).Start;

        end;

end;

procedure TfrmLogin.lblEnviarEmailClick(Sender: TObject);
begin
{    if (edtRecuperarSenha.Text.IsEmpty) then
        begin
            ShowMessage('E-mail inválido!');
            exit;
        end
    else
        begin
            TLoading.Show(frmLogin, 'Aguarde...');
            TThread.CreateAnonymousThread(procedure
                begin
                    sleep(2000);
                    TThread.Synchronize(nil, procedure
                        begin
                            qryRecuperarSenha.Close;
                            qryRecuperarSenha.Params.ParamByName('email').Value := edtRecuperarSenha.Text;
                            qryRecuperarSenha.open;
                            if (qryRecuperarSenha.RecordCount = 1) then
                                begin
                                    edtRecuperarSenha.Text := '';
                                    TLoading.Hide;
                                    lblRecuperarSenha.Text := 'Sua senha é ' + qryRecuperarSenhasenha.Value;
                                    // ChangeTabActionSenha.Execute;
                                end
                            else
                                begin
                                    ShowMessage('E-mail não encontrado!!');
                                    TLoading.Hide;
                                    exit;
                                end;
                        end);

                end).Start;

        end;    }

end;

end.
