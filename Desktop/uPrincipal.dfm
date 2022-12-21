object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form2'
  ClientHeight = 450
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 603
    Height = 185
    DataSource = dsMedico
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome_medico'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'distrito'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_cadastro'
        Width = 120
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 496
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object conexao: TMyConnection
    Database = 'japas165_agendamento'
    Username = 'japas165_jairpn'
    Server = 'japasoft.com.br'
    LoginPrompt = False
    Left = 240
    Top = 240
    EncryptedPassword = '95FF9EFF8FFF9EFFCFFFCEFFCFFFCEFF'
  end
  object qryMedico: TMyQuery
    Connection = conexao
    SQL.Strings = (
      'select * from tb_medico')
    Left = 312
    Top = 240
    object qryMedicoid_medico: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'id_medico'
      Origin = 'tb_medico.id_medico'
    end
    object qryMediconome_medico: TStringField
      FieldName = 'nome_medico'
      Origin = 'tb_medico.nome_medico'
      Size = 100
    end
    object qryMedicodata_cadastro: TDateField
      FieldName = 'data_cadastro'
      Origin = 'tb_medico.data_cadastro'
    end
    object qryMedicodistrito: TStringField
      FieldName = 'distrito'
      Origin = 'tb_medico.distrito'
    end
    object qryMedicoid_especialidade: TIntegerField
      FieldName = 'id_especialidade'
      Origin = 'tb_medico.id_especialidade'
    end
  end
  object dsMedico: TDataSource
    DataSet = qryMedico
    Left = 408
    Top = 240
  end
end
