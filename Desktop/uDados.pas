unit uDados;

interface

uses
    System.SysUtils, System.Classes, Data.DB, DBAccess, MyAccess, MemDS, MemData;

type
    TdmDados = class(TDataModule)
        conMysql: TMyConnection;
        qryUsuario: TMyQuery;
        qryCadastraUsuario: TMyQuery;
    qryUsuarioid_usuario: TIntegerField;
    qryUsuarionome_usuario: TStringField;
    qryUsuariocpf: TStringField;
    qryUsuariosenha: TStringField;
    qryUsuariodata_cadastro: TDateField;
    qryUsuarioemail: TStringField;
    qryUsuarioativo: TStringField;
    qryCadastraUsuarioid_usuario: TIntegerField;
    qryCadastraUsuarionome_usuario: TStringField;
    qryCadastraUsuariocpf: TStringField;
    qryCadastraUsuariosenha: TStringField;
    qryCadastraUsuariodata_cadastro: TDateField;
    qryCadastraUsuarioemail: TStringField;
    qryCadastraUsuarioativo: TStringField;
        procedure conMysqlConnectionLost(Sender: TObject; Component: TComponent;
            ConnLostCause: TConnLostCause; var RetryMode: TRetryMode);
        private
            { Private declarations }
        public
            { Public declarations }
    end;

var
      dmDados: TdmDados;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


procedure TdmDados.conMysqlConnectionLost(Sender: TObject;
    Component: TComponent; ConnLostCause: TConnLostCause;
    var RetryMode: TRetryMode);
begin
    RetryMode := rmReconnect;
end;

end.
