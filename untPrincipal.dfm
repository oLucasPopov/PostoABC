object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Posto de Gasolinas ABC'
  ClientHeight = 252
  ClientWidth = 607
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
  object btnCadastrarAbastecimento: TButton
    Left = 8
    Top = 8
    Width = 193
    Height = 57
    Caption = 'Cadastrar Abastecimento'
    TabOrder = 0
    OnClick = btnCadastrarAbastecimentoClick
  end
  object btnRelatorio: TButton
    Left = 8
    Top = 72
    Width = 193
    Height = 57
    Caption = 'Relat'#243'rio por Per'#237'odo'
    TabOrder = 1
    OnClick = btnRelatorioClick
  end
  object btnAlterarPrecos: TButton
    Left = 208
    Top = 8
    Width = 193
    Height = 57
    Caption = 'Alterar Pre'#231'os'
    TabOrder = 2
    OnClick = btnAlterarPrecosClick
  end
  object btnHistoricoAbastecimentos: TButton
    Left = 408
    Top = 8
    Width = 193
    Height = 57
    Caption = 'Hist'#243'rico de Abastecimentos'
    TabOrder = 3
    OnClick = btnHistoricoAbastecimentosClick
  end
end
