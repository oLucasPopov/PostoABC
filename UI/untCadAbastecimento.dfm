object frmCadAbastecimento: TfrmCadAbastecimento
  Left = 0
  Top = 0
  Caption = 'Cadastro de Abastecimentos'
  ClientHeight = 85
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  DesignSize = (
    504
    85)
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
    Left = 240
    Top = 8
    Width = 27
    Height = 13
    Caption = 'Pre'#231'o'
  end
  object Label1: TLabel
    Left = 152
    Top = 8
    Width = 26
    Height = 13
    Caption = 'Litros'
  end
  object lblTotal: TLabel
    Left = 384
    Top = 8
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object edtPreco: TDBEdit
    Left = 240
    Top = 24
    Width = 137
    Height = 21
    TabStop = False
    Color = clInactiveCaption
    DataField = 'preco_litro'
    DataSource = dsBomba
    ReadOnly = True
    TabOrder = 2
    OnChange = edtPrecoChange
  end
  object btnConfirmar: TButton
    Left = 425
    Top = 54
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Confirmar'
    TabOrder = 4
    OnClick = btnConfirmarClick
  end
  object btnCancelar: TButton
    Left = 337
    Top = 54
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object cmbBomba: TDBLookupComboBox
    Left = 8
    Top = 24
    Width = 137
    Height = 21
    KeyField = 'id'
    ListField = 'descricao_bomba'
    ListSource = dsBomba
    TabOrder = 0
  end
  object edtTotal: TEdit
    Left = 384
    Top = 24
    Width = 113
    Height = 21
    TabStop = False
    Color = clInactiveCaption
    ReadOnly = True
    TabOrder = 3
  end
  object edtLitros: TEdit
    Left = 152
    Top = 24
    Width = 81
    Height = 21
    TabOrder = 1
    Text = '0,000'
    OnChange = edtLitrosChange
  end
  object dsBomba: TDataSource
    DataSet = qryBomba
    Left = 48
    Top = 56
  end
  object qryBomba: TFDQuery
    Connection = dmConnection.connection
    SQL.Strings = (
      'select bc.id, bc.DESCRICAO_BOMBA, tc.PRECO_LITRO '
      'from BOMBAS_COMBUSTIVEL bc '
      'inner join TANQUES_COMBUSTIVEL tc on tc.ID = bc.ID_TANQUE')
    Left = 8
    Top = 56
    object qryBombaid: TIntegerField
      FieldName = 'id'
    end
    object qryBombapreco_litro: TFMTBCDField
      FieldName = 'preco_litro'
      Size = 2
    end
    object qryBombadescricao_bomba: TStringField
      FieldName = 'descricao_bomba'
      Size = 256
    end
  end
end
