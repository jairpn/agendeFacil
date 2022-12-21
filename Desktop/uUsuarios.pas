unit uUsuarios;

interface

uses
    System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
    FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, System.Rtti,
    System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.EngExt,
    FMX.Bind.DBEngExt, Data.Bind.Components, FMX.Edit, Data.Bind.Controls,
    FMX.Bind.Navigator, Data.Bind.DBScope, FMX.Grid.Style, FMX.ScrollBox,
    FMX.Grid;

type
    TfrmUsuarios = class(TForm)
        layEdits: TLayout;
        edtCPF: TEdit;
        Line4: TLine;
        edtEmail: TEdit;
        Line3: TLine;
        SpeedButton1: TSpeedButton;
        edtUsuario: TEdit;
        Line1: TLine;
        edtSenha: TEdit;
        Line6: TLine;
        Label1: TLabel;
        Grid1: TGrid;
        procedure imgFecharClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure edtCPFKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
            Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
        private
            { Private declarations }
        public
            { Public declarations }
    end;

var
      frmUsuarios: TfrmUsuarios;

implementation

{$R *.fmx}


uses uDados;

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

procedure TfrmUsuarios.edtCPFKeyDown(Sender: TObject; var Key: Word;
    var KeyChar: Char; Shift: TShiftState);
begin
    if not(KeyChar in ['0' .. '9', ',', '.']) and (ord(KeyChar) <> 8) and (KeyChar <> #0) then
        KeyChar := #0;
end;

procedure TfrmUsuarios.FormShow(Sender: TObject);
begin
    frmUsuarios.WindowState := TWindowState.wsMaximized;
end;

procedure TfrmUsuarios.imgFecharClick(Sender: TObject);
var
      i: Integer;
begin
    for i := 0 to frmUsuarios.ComponentCount - 1 do
        begin
            if frmUsuarios.Components[i] is TEdit then
                TEdit(frmUsuarios.Components[i]).Text := '';
        end;
    close;
end;

procedure TfrmUsuarios.SpeedButton1Click(Sender: TObject);
begin
    if (ValidarEMail(edtEmail.Text) = False) then
        begin
            ShowMessage('Email inválido!');
            exit;
        end;
end;

end.
