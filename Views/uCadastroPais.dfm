object frmCadastroPais: TfrmCadastroPais
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pa'#237's'
  ClientHeight = 176
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 96
    Top = 32
    Width = 59
    Height = 13
    Caption = 'C'#243'digo pa'#237's:'
  end
  object Label2: TLabel
    Left = 241
    Top = 32
    Width = 23
    Height = 13
    Caption = 'Pa'#237's:'
  end
  object editCodigo: TEdit
    Left = 96
    Top = 51
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object editPais: TEdit
    Left = 241
    Top = 51
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnSalvar: TButton
    Left = 120
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = btnSalvarClick
  end
  object btnVoltar: TButton
    Left = 256
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 3
    OnClick = btnVoltarClick
  end
end
