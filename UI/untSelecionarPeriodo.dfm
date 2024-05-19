object frmSelecionarPeriodo: TfrmSelecionarPeriodo
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Selecionar Per'#237'odo'
  ClientHeight = 91
  ClientWidth = 185
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
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 63
    Height = 13
    Caption = 'Per'#237'odo de...'
  end
  object Label2: TLabel
    Left = 96
    Top = 8
    Width = 17
    Height = 13
    Caption = 'At'#233
  end
  object edtDe: TMaskEdit
    Left = 8
    Top = 24
    Width = 81
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object edtAte: TMaskEdit
    Left = 96
    Top = 24
    Width = 81
    Height = 21
    EditMask = '!99/99/0000;1;_'
    MaxLength = 10
    TabOrder = 1
    Text = '  /  /    '
  end
  object btnCancelar: TButton
    Left = 8
    Top = 56
    Width = 81
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = btnCancelarClick
  end
  object btnConfirmar: TButton
    Left = 96
    Top = 56
    Width = 81
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 2
    OnClick = btnConfirmarClick
  end
end
