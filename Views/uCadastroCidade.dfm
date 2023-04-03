object frmCadastroCidade: TfrmCadastroCidade
  Left = 0
  Top = 0
  Caption = 'Cadastro cidade'
  ClientHeight = 168
  ClientWidth = 699
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 193
    Top = 40
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object Label3: TLabel
    Left = 336
    Top = 40
    Width = 37
    Height = 13
    Caption = 'Estado:'
  end
  object Label4: TLabel
    Left = 504
    Top = 40
    Width = 23
    Height = 13
    Caption = 'Pa'#237's:'
  end
  object Label1: TLabel
    Left = 40
    Top = 40
    Width = 37
    Height = 13
    Caption = 'C'#243'digo:'
  end
  object editCidade: TEdit
    Left = 193
    Top = 59
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btnSalvar: TButton
    Left = 216
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = btnSalvarClick
  end
  object btnVoltar: TButton
    Left = 352
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 2
    OnClick = btnVoltarClick
  end
  object cmbEstado: TComboBox
    Left = 336
    Top = 59
    Width = 145
    Height = 21
    TabOrder = 3
    Text = 'Estado'
  end
  object cmbPais: TComboBox
    Left = 504
    Top = 59
    Width = 145
    Height = 21
    TabOrder = 4
    Text = 'Pa'#237's'
  end
  object editCodigo: TEdit
    Left = 40
    Top = 59
    Width = 121
    Height = 21
    TabOrder = 5
  end
end
