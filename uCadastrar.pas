unit uCadastrar;

interface

uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
    FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.TabControl,
    System.Actions, FMX.ActnList, Data.DB;

type
    TfrmCadastrar = class(TForm)
        TabControl1: TTabControl;
        TabItemNome: TTabItem;
        TabItemCpf: TTabItem;
        TabItemSenha: TTabItem;
        Layout3: TLayout;
        edtNome: TEdit;
        Layout5: TLayout;
        Rectangle3: TRectangle;
        lblNome: TLabel;
        Layout2: TLayout;
        edtCpf: TEdit;
        Layout4: TLayout;
        Rectangle1: TRectangle;
        lblCpf: TLabel;
        Layout7: TLayout;
        edtSenha: TEdit;
        Layout8: TLayout;
        Rectangle2: TRectangle;
        lblFinalizar: TLabel;
        Layout10: TLayout;
        edtSenha1: TEdit;
        ActionList1: TActionList;
        ChangeTabActionCPF: TChangeTabAction;
        ChangeTabActionSenha: TChangeTabAction;
        TabItemEmail: TTabItem;
        Layout12: TLayout;
        Label12: TLabel;
        Label13: TLabel;
        Label16: TLabel;
        Label17: TLabel;
        Layout9: TLayout;
        Label9: TLabel;
        Label14: TLabel;
        Label15: TLabel;
        Label18: TLabel;
        Layout1: TLayout;
        Label1: TLabel;
        Label2: TLabel;
        Label3: TLabel;
        Label19: TLabel;
        Layout6: TLayout;
        edtEmail: TEdit;
        Layout13: TLayout;
        Rectangle4: TRectangle;
        lblEmail: TLabel;
        ChangeTabActionNome: TChangeTabAction;
        Layout14: TLayout;
        Rectangle5: TRectangle;
        Label6: TLabel;
        Layout15: TLayout;
        Rectangle6: TRectangle;
        Label7: TLabel;
        TabItemSUS: TTabItem;
        Layout16: TLayout;
        Label8: TLabel;
        Label20: TLabel;
        Label21: TLabel;
        Label22: TLabel;
        Label23: TLabel;
        Layout17: TLayout;
        edtSus: TEdit;
        Layout18: TLayout;
        Rectangle7: TRectangle;
        lblSus: TLabel;
        ChangeTabActionSUS: TChangeTabAction;
        Label24: TLabel;
        Layout11: TLayout;
        Label4: TLabel;
        Label5: TLabel;
        Label10: TLabel;
        Label11: TLabel;
        Label25: TLabel;
        Layout19: TLayout;
        Label26: TLabel;
        Label27: TLabel;
        Label28: TLabel;
        Label29: TLabel;
        Label30: TLabel;
        Label31: TLabel;
        Label32: TLabel;
        procedure FormActivate(Sender: TObject);
        procedure lblCpfClick(Sender: TObject);
        procedure lblNomeClick(Sender: TObject);
        procedure lblFinalizarClick(Sender: TObject);
        procedure lblEmailClick(Sender: TObject);
        procedure Label6Click(Sender: TObject);
        procedure lblSusClick(Sender: TObject);
        private
            { Private declarations }
        public
            { Public declarations }
    end;

var
      frmCadastrar: TfrmCadastrar;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

uses Loading, uAbertura;

function ValidarEMail(aStr: string): Boolean;
begin
    aStr := Trim(UpperCase(aStr));
    if Pos('@', aStr) > 1 then
        begin
            Delete(aStr, 1, Pos('@', aStr));
            Result := (Length(aStr) > 0) and (Pos('.', aStr) > 2);
        end
    else
        Result := False;
end;



procedure TfrmCadastrar.FormActivate(Sender: TObject);
begin
    TabControl1.TabPosition := TTabPosition.None;
    TabControl1.ActiveTab := TabItemEmail;
end;

procedure TfrmCadastrar.lblSusClick(Sender: TObject);
var
      tam: integer;
begin
{    tam := Length(edtSus.Text);
    if (tam < 15) then
        begin
            TLoading.Show(frmCadastrar, 'Aguarde...');
            ShowMessage('Número de SUS Incompleto');
            TThread.CreateAnonymousThread(procedure
                begin
                    sleep(2000);

                    TThread.Synchronize(nil, procedure
                        begin
                            TLoading.Hide;
                            exit;
                        end);

                end).Start;
        end
    else
        begin
            TLoading.Show(frmCadastrar, 'Aguarde...');
            qrySus.Close;
            qrySus.Params.ParamByName('numsus').Value := edtSus.Text;
            qrySus.Open;
            if (qrySus.RecordCount = 0) then
                begin
                    TThread.CreateAnonymousThread(procedure
                        begin
                            sleep(2000);

                            TThread.Synchronize(nil, procedure
                                begin
                                    TLoading.Hide;
                                    ChangeTabActionSenha.Execute
                                end);

                        end).Start;

                end
            else
                begin
                    ShowMessage('CPF já cadastrado!');
                    TLoading.Hide;
                end;
        end;    }

end;

procedure TfrmCadastrar.Label6Click(Sender: TObject);
begin
    edtEmail.Text := '';
    edtCpf.Text := '';
    edtSenha.Text := '';
    edtSenha1.Text := '';
    edtNome.Text := '';
    edtSus.Text := '';

    if not(Assigned(frmAbertura)) then
        Application.CreateForm(TfrmAbertura, frmAbertura);
    frmAbertura.Show;
end;

procedure TfrmCadastrar.lblFinalizarClick(Sender: TObject);
begin


    if ((edtSenha.Text <> edtSenha1.Text) or (edtSenha.Text.Trim.IsEmpty)) then
        begin
            TLoading.Show(frmCadastrar, 'Conferindo dados. Aguarde...');
            ShowMessage('Senhas não conferem!!');
            TThread.CreateAnonymousThread(procedure
                begin
                    sleep(2000);
                    TThread.Synchronize(nil, procedure
                        begin
                            TLoading.Hide;
                            exit;
                        end);

                end).Start;
        end
    else
        begin
            TLoading.Show(frmCadastrar, 'Salvando os dados. Aguarde...');
            TThread.CreateAnonymousThread(procedure
                begin
                    sleep(2000);
{                    qryUsuario.Open;
                    qryUsuario.Insert;
                    qryUsuarionome_usuario.Value := edtNome.Text;
                    qryUsuariocpf.Value := edtCpf.Text;
                    qryUsuariosenha.Value := edtSenha.Text;
                    qryUsuarioemail.Value := edtEmail.Text;
                    qryUsuarionum_sus.Value := edtSus.Text;
                    qryUsuariodata_cadastro.Value := Now;        }
                    try
//                        qryUsuario.Post;
//                        conConexao.Commit;
                    except
//                        conConexao.Rollback;
                    end;

                    TThread.Synchronize(nil, procedure
                        begin
                            TLoading.Hide;
                            frmAbertura.Show;
                        end);

                end).Start;
        end;
end;

procedure TfrmCadastrar.lblCpfClick(Sender: TObject);
var
      tamanho: integer;
begin
    tamanho := Length(edtCpf.Text);
    if (tamanho < 11) then
        begin
            TLoading.Show(frmCadastrar, 'Aguarde...');
            ShowMessage('CPF Incompleto');
            TThread.CreateAnonymousThread(procedure
                begin
                    sleep(2000);

                    TThread.Synchronize(nil, procedure
                        begin
                            TLoading.Hide;
                            exit;
                        end);

                end).Start;
        end
    else
        begin
            TLoading.Show(frmCadastrar, 'Aguarde...');
//            qryCpf.Close;
//            qryCpf.Params.ParamByName('cpf').Value := edtCpf.Text;
//            qryCpf.Open;
{            if (qryCpf.RecordCount = 0) then
                begin
                    TThread.CreateAnonymousThread(procedure
                        begin
                            sleep(2000);

                            TThread.Synchronize(nil, procedure
                                begin
                                    TLoading.Hide;
                                    ChangeTabActionSUS.Execute
                                end);

                        end).Start;

                end
            else
                begin
                    ShowMessage('CPF já cadastrado!');
                    TLoading.Hide;
                end; }
        end;
end;

procedure TfrmCadastrar.lblEmailClick(Sender: TObject);
var
      valEmail: Boolean;
begin

    valEmail := ValidarEMail(edtEmail.Text);

//    qryEmail.Close;
//    qryEmail.Params.ParamByName('email').Value := edtEmail.Text;
//    qryEmail.Open;

{    if (qryEmail.RecordCount >= 1) then
        begin
            ShowMessage('E-mail já registrado!');
            exit;
        end;

    if ((edtEmail.Text.Trim.IsEmpty) or (valEmail = False)) then
        begin
            TLoading.Show(frmCadastrar, 'Aguarde...');
            ShowMessage('E-mail inválido!');
            TThread.CreateAnonymousThread(procedure
                begin
                    sleep(2000);

                    TThread.Synchronize(nil, procedure
                        begin
                            TLoading.Hide;
                            exit;
                        end);

                end).Start;
        end
    else
        begin
            TLoading.Show(frmCadastrar, 'Aguarde...');
            TThread.CreateAnonymousThread(procedure
                begin
                    sleep(2000);

                    TThread.Synchronize(nil, procedure
                        begin
                            ChangeTabActionNome.Execute;
                            TLoading.Hide;
                        end);

                end).Start;
        end; }
end;

procedure TfrmCadastrar.lblNomeClick(Sender: TObject);
begin

    if (edtNome.Text.Trim.IsEmpty) then
        begin
            TLoading.Show(frmCadastrar, 'Aguarde...');
            ShowMessage('Preencha seu nome');
            TThread.CreateAnonymousThread(procedure
                begin
                    sleep(2000);

                    TThread.Synchronize(nil, procedure
                        begin
                            TLoading.Hide;
                            exit;
                        end);

                end).Start;
        end
    else
        begin
            TLoading.Show(frmCadastrar, 'Aguarde...');
            TThread.CreateAnonymousThread(procedure
                begin
                    sleep(2000);

                    TThread.Synchronize(nil, procedure
                        begin
                            ChangeTabActionCPF.Execute;
                            TLoading.Hide;
                        end);

                end).Start;
        end;

end;

end.
