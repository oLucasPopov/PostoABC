object frmHistoricoAbastecimentos: TfrmHistoricoAbastecimentos
  Left = 0
  Top = 0
  Caption = 'Hist'#243'rico de Abastecimentos'
  ClientHeight = 268
  ClientWidth = 756
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object grdVendas: TDBGrid
    Left = 0
    Top = 0
    Width = 756
    Height = 268
    Align = alClient
    DataSource = dsVendas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_TANQUE'
        Title.Alignment = taCenter
        Width = 94
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_BOMBA'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LITROS'
        Title.Alignment = taCenter
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_LITRO'
        Title.Alignment = taCenter
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_BRUTO'
        Title.Alignment = taCenter
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEDUCAO_IMPOSTO'
        Title.Alignment = taCenter
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_LIQUIDO'
        Title.Alignment = taCenter
        Width = 74
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATAHORA_TRANSACAO'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end>
  end
  object qryVendas: TFDQuery
    Active = True
    Connection = dmConnection.connection
    SQL.Strings = (
      'select vc.ID'
      '      ,tc.DESCRICAO_TANQUE '
      '      ,bc.DESCRICAO_BOMBA  '
      '      ,vc.LITROS '
      '      ,vc.PRECO_LITRO'
      '      ,vc.TOTAL_BRUTO '
      '      ,vc.DEDUCAO_IMPOSTO '
      '      ,vc.TOTAL_LIQUIDO '
      '      ,vc.DATAHORA_TRANSACAO'
      '  from VENDAS_COMBUSTIVEL vc '
      '  inner join BOMBAS_COMBUSTIVEL bc on bc.ID = vc.ID_BOMBA '
      '  inner join TANQUES_COMBUSTIVEL tc on tc.id = bc.ID_TANQUE '
      '  order by DATAHORA_TRANSACAO desc;')
    Left = 128
    Top = 72
    object qryVendasID: TIntegerField
      DisplayLabel = 'C'#243'd. Opera'#231#227'o'
      DisplayWidth = 12
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object qryVendasDESCRICAO_TANQUE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Tanque'
      DisplayWidth = 19
      FieldName = 'DESCRICAO_TANQUE'
      Origin = 'DESCRICAO_TANQUE'
      ProviderFlags = []
      ReadOnly = True
      Size = 256
    end
    object qryVendasDESCRICAO_BOMBA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Bomba'
      DisplayWidth = 17
      FieldName = 'DESCRICAO_BOMBA'
      Origin = 'DESCRICAO_BOMBA'
      ProviderFlags = []
      ReadOnly = True
      Size = 256
    end
    object qryVendasLITROS: TFMTBCDField
      DisplayLabel = 'Litros'
      DisplayWidth = 19
      FieldName = 'LITROS'
      Origin = 'LITROS'
      DisplayFormat = '##0.000'
      Precision = 18
      Size = 3
    end
    object qryVendasPRECO_LITRO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o do Litro'
      DisplayWidth = 19
      FieldName = 'PRECO_LITRO'
      Origin = 'PRECO_LITRO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryVendasTOTAL_BRUTO: TFMTBCDField
      DisplayLabel = 'Total Bruto'
      DisplayWidth = 19
      FieldName = 'TOTAL_BRUTO'
      Origin = 'TOTAL_BRUTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryVendasDEDUCAO_IMPOSTO: TFMTBCDField
      DisplayLabel = 'Imposto'
      DisplayWidth = 19
      FieldName = 'DEDUCAO_IMPOSTO'
      Origin = 'DEDUCAO_IMPOSTO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryVendasTOTAL_LIQUIDO: TFMTBCDField
      DisplayLabel = 'Total L'#237'quido'
      DisplayWidth = 19
      FieldName = 'TOTAL_LIQUIDO'
      Origin = 'TOTAL_LIQUIDO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryVendasDATAHORA_TRANSACAO: TSQLTimeStampField
      DisplayLabel = 'Data/Hora Da Venda'
      DisplayWidth = 34
      FieldName = 'DATAHORA_TRANSACAO'
      Origin = 'DATAHORA_TRANSACAO'
      Required = True
    end
  end
  object dsVendas: TDataSource
    DataSet = qryVendas
    Left = 208
    Top = 64
  end
end
