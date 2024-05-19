object frmSelecionarBD: TfrmSelecionarBD
  Left = 0
  Top = 0
  Caption = 'Configurar Banco de Dados'
  ClientHeight = 108
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    447
    108)
  PixelsPerInch = 96
  TextHeight = 13
  object lblCaminhoBD: TLabel
    Left = 8
    Top = 8
    Width = 136
    Height = 13
    Caption = 'Caminho do Banco de Dados'
  end
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 52
    Height = 13
    Caption = 'Usu'#225'rio BD'
  end
  object Label2: TLabel
    Left = 136
    Top = 56
    Width = 46
    Height = 13
    Caption = 'Senha BD'
  end
  object edtCaminhoBD: TEdit
    Left = 8
    Top = 24
    Width = 361
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    Color = clWhite
    TabOrder = 0
  end
  object btnSelecionarBD: TButton
    Left = 374
    Top = 23
    Width = 67
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Selecionar'
    TabOrder = 1
    OnClick = btnSelecionarBDClick
  end
  object edtUsuarioBD: TEdit
    Left = 8
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'SYSDBA'
  end
  object edtSenhaBD: TEdit
    Left = 136
    Top = 72
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
  end
  object btnSalvar: TButton
    Left = 366
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = btnSalvarClick
  end
end
