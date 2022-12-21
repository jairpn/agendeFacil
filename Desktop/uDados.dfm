object dmDados: TdmDados
  OldCreateOrder = False
  Height = 273
  Width = 446
  object conMysql: TMyConnection
    Database = 'japas165_agendamento'
    Username = 'japas165_jairpn'
    Server = 'japasoft.com.br'
    Connected = True
    OnConnectionLost = conMysqlConnectionLost
    LoginPrompt = False
    Left = 64
    Top = 40
    EncryptedPassword = '95FF9EFF8FFF9EFFCFFFCEFFCFFFCEFF'
  end
  object qryUsuario: TMyQuery
    Connection = conMysql
    SQL.Strings = (
      
        'select * from tb_usuario where nome_usuario = :nome and senha = ' +
        ':senha')
    Left = 152
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nome'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'senha'
        Value = nil
      end>
    object qryUsuarioid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object qryUsuarionome_usuario: TStringField
      FieldName = 'nome_usuario'
      Size = 50
    end
    object qryUsuariocpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
    object qryUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 4
    end
    object qryUsuariodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryUsuarioemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object qryUsuarioativo: TStringField
      FieldName = 'ativo'
      FixedChar = True
      Size = 1
    end
  end
  object qryCadastraUsuario: TMyQuery
    Connection = conMysql
    SQL.Strings = (
      'select * from tb_usuario')
    Left = 264
    Top = 40
    object qryCadastraUsuarioid_usuario: TIntegerField
      FieldName = 'id_usuario'
    end
    object qryCadastraUsuarionome_usuario: TStringField
      FieldName = 'nome_usuario'
      Size = 50
    end
    object qryCadastraUsuariocpf: TStringField
      FieldName = 'cpf'
      Size = 11
    end
    object qryCadastraUsuariosenha: TStringField
      FieldName = 'senha'
      Size = 4
    end
    object qryCadastraUsuariodata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qryCadastraUsuarioemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object qryCadastraUsuarioativo: TStringField
      FieldName = 'ativo'
      FixedChar = True
      Size = 1
    end
  end
end
