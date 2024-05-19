object frmRelHistoricoAbastecimentosAgrupado: TfrmRelHistoricoAbastecimentosAgrupado
  Left = 0
  Top = 0
  Caption = 'frmRelHistoricoAbastecimentosAgrupado'
  ClientHeight = 749
  ClientWidth = 796
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rlRelatorio: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Transparent = False
    object bndTitulo: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 32
      BandType = btHeader
      Transparent = False
      object rlTitle: TRLLabel
        Left = 149
        Top = 4
        Width = 420
        Height = 24
        Align = faCenter
        Caption = 'Movimenta'#231#245'es do Per'#237'odo de %s at'#233' %s'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object grpDia: TRLGroup
      Left = 38
      Top = 70
      Width = 718
      Height = 147
      DataFields = 'DIA_VENDA'
      Transparent = False
      object grpTanque: TRLGroup
        Left = 0
        Top = 16
        Width = 718
        Height = 65
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = False
        Borders.DrawRight = True
        Borders.DrawBottom = True
        Borders.FixedBottom = True
        DataFields = 'DESCRICAO_TANQUE'
        Transparent = False
        BeforePrint = grpTanqueBeforePrint
        object bndAgrupamento: TRLBand
          Left = 1
          Top = 16
          Width = 716
          Height = 16
          BandType = btColumnHeader
          Color = clWhite
          ParentColor = False
          Transparent = False
          object RLDBText1: TRLDBText
            Left = 0
            Top = 0
            Width = 140
            Height = 16
            Align = faLeft
            DataField = 'DESCRICAO_TANQUE'
            DataSource = dsRelatorio
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Text = ''
            Transparent = False
          end
        end
        object bndDetalhes: TRLBand
          AlignWithMargins = True
          Left = 1
          Top = 32
          Width = 716
          Height = 16
          Transparent = False
          BeforePrint = bndDetalhesBeforePrint
          object RLDBText3: TRLDBText
            Left = 32
            Top = 0
            Width = 135
            Height = 16
            DataField = 'DESCRICAO_BOMBA'
            DataSource = dsRelatorio
            Text = ''
            Transparent = False
          end
          object RLDBText4: TRLDBText
            Left = 600
            Top = 0
            Width = 116
            Height = 16
            Margins.Right = 5
            Align = faRight
            Alignment = taRightJustify
            DataField = 'TOTAL_LIQUIDO'
            DataSource = dsRelatorio
            Text = ''
            Transparent = False
          end
          object RLDBText5: TRLDBText
            Left = 208
            Top = 0
            Width = 103
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'TOTAL_BRUTO'
            DataSource = dsRelatorio
            Text = ''
            Transparent = False
          end
          object RLDBText6: TRLDBText
            Left = 336
            Top = 0
            Width = 124
            Height = 16
            Alignment = taRightJustify
            DataField = 'TOTAL_IMPOSTO'
            DataSource = dsRelatorio
            Text = ''
            Transparent = False
          end
        end
        object bndSomatoriaAgrupado: TRLBand
          Left = 1
          Top = 48
          Width = 716
          Height = 17
          BandType = btColumnFooter
          Color = clBtnFace
          ParentColor = False
          Transparent = False
          BeforePrint = bndSomatoriaAgrupadoBeforePrint
          object lblSomatoriaBruto: TRLLabel
            Left = 208
            Top = 0
            Width = 103
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object lblSomatoriaImposto: TRLLabel
            Left = 336
            Top = 1
            Width = 124
            Height = 16
            Alignment = taRightJustify
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object lblSomatoriaTotLiq: TRLLabel
            Left = 600
            Top = 0
            Width = 116
            Height = 17
            Align = faRight
            Alignment = taRightJustify
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
        object bndCabecalho2: TRLBand
          Left = 1
          Top = 0
          Width = 716
          Height = 16
          BandType = btColumnHeader
          Color = clGradientInactiveCaption
          ParentColor = False
          Transparent = False
          object RLLabel2: TRLLabel
            Left = 208
            Top = 0
            Width = 103
            Height = 16
            AutoSize = False
            Caption = 'Total Bruto (R$)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel3: TRLLabel
            Left = 336
            Top = 0
            Width = 124
            Height = 16
            Caption = 'Total Impostos (R$)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
          object RLLabel4: TRLLabel
            Left = 600
            Top = 0
            Width = 116
            Height = 16
            Align = faRight
            Alignment = taRightJustify
            Caption = 'Total L'#237'quido (R$)'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            Transparent = False
          end
        end
      end
      object bndCabecalho1: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 16
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Color = clInactiveCaption
        ParentColor = False
        Transparent = False
        object lblDiaVenda: TRLDBText
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 78
          Height = 15
          Margins.Right = 5
          Align = faLeft
          Alignment = taCenter
          AutoSize = False
          DataField = 'DIA_VENDA'
          DataSource = dsRelatorio
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          Transparent = False
        end
      end
      object lblResultadoAgrupado: TRLBand
        AlignWithMargins = True
        Left = 0
        Top = 81
        Width = 718
        Height = 16
        GreenBarColor = clBtnShadow
        BandType = btFooter
        Color = clWhite
        ParentColor = False
        Transparent = False
        AfterPrint = lblResultadoAgrupadoAfterPrint
        BeforePrint = lblResultadoAgrupadoBeforePrint
        object lblBrutoAgrupado: TRLLabel
          Left = 208
          Top = 0
          Width = 103
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lblResultadosDia: TRLLabel
          Left = 0
          Top = 0
          Width = 101
          Height = 16
        end
        object lblImpostoAgrupado: TRLLabel
          Left = 336
          Top = 0
          Width = 124
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lblTotalLiqAgrupado: TRLLabel
          Left = 602
          Top = 0
          Width = 116
          Height = 16
          Align = faRight
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object bndDivider: TRLBand
        Left = 0
        Top = 97
        Width = 718
        Height = 13
        BandType = btFooter
        object shpDivider: TRLDraw
          Left = 0
          Top = 0
          Width = 718
          Height = 13
          Align = faClient
          Center = False
          DrawKind = dkLine
          Pen.Style = psDot
        end
      end
    end
    object bndSomatoriaTotal: TRLBand
      Left = 38
      Top = 217
      Width = 718
      Height = 96
      BandType = btSummary
      BeforePrint = bndSomatoriaTotalBeforePrint
      object pnlSomatoriaTotal: TRLPanel
        Left = 512
        Top = 0
        Width = 206
        Height = 96
        Align = faRight
        Borders.Sides = sdCustom
        Borders.DrawLeft = True
        Borders.DrawTop = True
        Borders.DrawRight = True
        Borders.DrawBottom = True
        object RLLabel5: TRLLabel
          Left = 1
          Top = 1
          Width = 204
          Height = 16
          Align = faTop
          Alignment = taCenter
          Caption = 'Resultados do Per'#237'odo'
          Color = clInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object lblBrutoPeriodo: TRLLabel
          Left = 112
          Top = 24
          Width = 89
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lblImpostoPeriodo: TRLLabel
          Left = 112
          Top = 48
          Width = 89
          Height = 16
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object lblLiqPeriodo: TRLLabel
          Left = 112
          Top = 72
          Width = 89
          Height = 17
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLLabel6: TRLLabel
          Left = 8
          Top = 24
          Width = 71
          Height = 16
          Caption = 'Total Bruto:'
        end
        object RLLabel7: TRLLabel
          Left = 8
          Top = 72
          Width = 77
          Height = 16
          Caption = 'Total L'#237'quido'
        end
        object RLLabel8: TRLLabel
          Left = 8
          Top = 48
          Width = 93
          Height = 16
          Caption = 'Total Impostos:'
        end
      end
    end
  end
  object dsRelatorio: TDataSource
    DataSet = qryRelatorio
    Left = 16
    Top = 160
  end
  object qryRelatorio: TFDQuery
    Active = True
    Connection = dmConnection.connection
    SQL.Strings = (
      'select dia_venda'
      '      ,descricao_bomba'
      '      ,descricao_tanque'
      '      ,cast(total_bruto as numeric(18,2)) as total_bruto'
      '      ,cast(total_imposto as numeric(18,2)) as total_imposto'
      '      ,cast(total_liquido as numeric(18, 2)) as total_liquido '
      '  from movimentacao_vendas_agrupado'
      ' where dia_venda between :inicio and :fim'
      '  order by dia_venda, descricao_tanque'
      '')
    Left = 16
    Top = 208
    ParamData = <
      item
        Name = 'INICIO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'FIM'
        DataType = ftDate
        ParamType = ptInput
      end>
    object qryRelatorioDIA_VENDA: TDateField
      FieldName = 'DIA_VENDA'
      Origin = 'DIA_VENDA'
    end
    object qryRelatorioDESCRICAO_BOMBA: TStringField
      FieldName = 'DESCRICAO_BOMBA'
      Origin = 'DESCRICAO_BOMBA'
      Size = 256
    end
    object qryRelatorioDESCRICAO_TANQUE: TStringField
      FieldName = 'DESCRICAO_TANQUE'
      Origin = 'DESCRICAO_TANQUE'
      Size = 256
    end
    object qryRelatorioTOTAL_LIQUIDO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_LIQUIDO'
      Origin = 'TOTAL_LIQUIDO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object qryRelatorioTOTAL_BRUTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_BRUTO'
      Origin = 'TOTAL_BRUTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object qryRelatorioTOTAL_IMPOSTO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_IMPOSTO'
      Origin = 'TOTAL_IMPOSTO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
    object qryRelatorioTotalLiquido: TAggregateField
      DefaultExpression = 'SUM(TOTAL_LIQUIDO)'
      FieldName = 'TotalLiquido'
      Active = True
      DisplayName = ''
    end
  end
end
