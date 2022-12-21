unit uPrincipal;

interface

uses
    System.SysUtils, System.Types, System.UITypes, System.Classes,
    System.Variants,
    FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
    FMX.Grid.Style, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
    Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components, Data.Bind.Grid,
    Data.Bind.DBScope, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,
    Data.DB, MemDS, DBAccess, MyAccess, FMX.StdCtrls, Data.Bind.Controls,
    FMX.Layouts, FMX.Objects, FireDAC.Stan.Intf, FireDAC.Stan.Option,
    FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
    FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
    FireDAC.Phys.MySQLDef, FireDAC.FMXUI.Wait, FireDAC.Comp.Client,
    System.Actions, FMX.ActnList, FMX.ListBox, FMX.MultiView;

type
    TfrmPrincipal = class(TForm)
        layLateralEsq: TLayout;
        imgFechar: TImage;
        imgMinimizar: TImage;
        imgMaximizar: TImage;
        lblHora: TLabel;
        Timer1: TTimer;
        lblData: TLabel;
        btnAmbulatorio: TSpeedButton;
        btnEspecialidade: TSpeedButton;
        Layout1: TLayout;
        btnDataHora: TSpeedButton;
        rctDataHora: TRectangle;
        rctAmbulatorio: TRectangle;
        rctEspecialidade: TRectangle;
        imgSair: TImage;
        rdcUsuario: TRectangle;
        btnUsuario: TSpeedButton;
        Layout2: TLayout;
        StyleBook1: TStyleBook;
        ToolBar1: TToolBar;
        lblForm: TLabel;
        MultiView1: TMultiView;
        Rectangle1: TRectangle;
        SpeedButton1: TSpeedButton;
        procedure imgFecharClick(Sender: TObject);
        procedure recTopMouseDown(Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Single);
        procedure imgMaximizarClick(Sender: TObject);
        procedure imgMinimizarClick(Sender: TObject);
        procedure FormActivate(Sender: TObject);
        procedure Timer1Timer(Sender: TObject);
        procedure imgSairClick(Sender: TObject);
        procedure btnUsuarioClick(Sender: TObject);
        procedure btnDataHoraClick(Sender: TObject);
        procedure btnAmbulatorioClick(Sender: TObject);
        procedure btnEspecialidadeClick(Sender: TObject);
        procedure SpeedButton1Click(Sender: TObject);
        private
            { Private declarations }
        public
            { Public declarations }
    end;

var
      frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}


uses uLogin, uUsuarios, configuracao, uadicionarServico, uLocalServico;

procedure TfrmPrincipal.btnAmbulatorioClick(Sender: TObject);
begin
    FreeAndNil(frmAdicionarServico);
    FreeAndNil(frmConfiguracao);
    FreeAndNil(frmUsuarios);
    FreeAndNil(frmLocalServico);
    self.Layout2.RemoveObject(0);
end;

procedure TfrmPrincipal.btnDataHoraClick(Sender: TObject);
begin
    if not Assigned(frmConfiguracao) then
        Application.CreateForm(TfrmConfiguracao, frmConfiguracao);
    self.Layout2.RemoveObject(0);
    self.Layout2.AddObject(frmConfiguracao.layConfiguracao);
end;

procedure TfrmPrincipal.btnEspecialidadeClick(Sender: TObject);
begin
    if not Assigned(frmAdicionarServico) then
        Application.CreateForm(TfrmAdicionarServico, frmAdicionarServico);
    self.Layout2.RemoveObject(0);
    self.Layout2.AddObject(frmAdicionarServico.layAdicionarServicos);
end;

procedure TfrmPrincipal.btnUsuarioClick(Sender: TObject);
begin
    if not Assigned(frmUsuarios) then
        Application.CreateForm(TfrmUsuarios, frmUsuarios);
    self.Layout2.RemoveObject(0);
    self.Layout2.AddObject(frmUsuarios.layEdits);
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
    frmPrincipal.WindowState := TWindowState.wsMaximized;
end;

procedure TfrmPrincipal.imgFecharClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmPrincipal.imgMaximizarClick(Sender: TObject);
begin
    if (frmPrincipal.WindowState = TWindowState.wsMaximized) then
        frmPrincipal.WindowState := TWindowState.wsnormal
    else
        frmPrincipal.WindowState := TWindowState.wsMaximized;
end;

procedure TfrmPrincipal.imgMinimizarClick(Sender: TObject);
begin
    frmPrincipal.WindowState := TWindowState.wsMinimized;
end;

procedure TfrmPrincipal.imgSairClick(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TfrmPrincipal.recTopMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Single);
begin
    if (frmPrincipal.WindowState <> TWindowState.wsMaximized) then
        self.StartWindowDrag;
end;

procedure TfrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
    if not Assigned(frmLocalServico) then
        Application.CreateForm(TfrmLocalServico, frmLocalServico);
    self.Layout2.RemoveObject(0);
    self.Layout2.AddObject(frmLocalServico.layLocalServico);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
var
      days: array [1 .. 7] of string;
begin
    days[1] := 'Domingo';
    days[2] := 'Segunda-Feira';
    days[3] := 'Terça-Feira';
    days[4] := 'Quarta-Feira';
    days[5] := 'Quinta-Feira';
    days[6] := 'Sexta-Feira';
    days[7] := 'Sábado';

    lblHora.Text := timetostr(time);
    lblData.Text := days[DayOfWeek(Date)] +
      FormatDateTime(', dd "de" MMMM "de" yyyy', Date);
end;

end.
