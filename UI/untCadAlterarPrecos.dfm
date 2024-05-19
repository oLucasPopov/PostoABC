object frmCadAlterarPrecos: TfrmCadAlterarPrecos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Alterar Pre'#231'os'
  ClientHeight = 90
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblBomba: TLabel
    Left = 8
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Bomba'
  end
  object lblPrecoCombustivel: TLabel
    Left = 152
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Pre'#231'o'
  end
  object cmbTanque: TDBLookupComboBox
    Left = 8
    Top = 24
    Width = 137
    Height = 21
    KeyField = 'id'
    ListField = 'DESCRICAO_TANQUE'
    ListSource = dsTanque
    TabOrder = 0
  end
  object edtPreco: TDBEdit
    Left = 152
    Top = 24
    Width = 81
    Height = 21
    Color = clWhite
    DataField = 'PRECO_LITRO'
    DataSource = dsTanque
    TabOrder = 1
    OnChange = edtPrecoChange
  end
  object btnConfirmar: TButton
    Left = 160
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
  object dsTanque: TDataSource
    DataSet = qryTanque
    Left = 96
    Top = 8
  end
  object qryTanque: TFDQuery
    Active = True
    Connection = dmConnection.connection
    SQL.Strings = (
      'select tc.id, tc.descricao_tanque, tc.PRECO_LITRO '
      'from TANQUES_COMBUSTIVEL tc')
    Left = 56
    Top = 8
    object qryTanqueID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryTanqueDESCRICAO_TANQUE: TStringField
      FieldName = 'DESCRICAO_TANQUE'
      Origin = 'DESCRICAO_TANQUE'
      Required = True
      Size = 256
    end
    object qryTanquePRECO_LITRO: TFMTBCDField
      FieldName = 'PRECO_LITRO'
      Origin = 'PRECO_LITRO'
      Required = True
      Precision = 18
      Size = 2
    end
  end
end
