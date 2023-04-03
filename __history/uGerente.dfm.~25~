object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Painel principal'
  ClientHeight = 343
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 104
    Height = 13
    Caption = 'Cidades cadastradas:'
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 48
    Width = 321
    Height = 265
    DataSource = DataModule1.dsCidade
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDCIDADE'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CIDADE'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDESTADO'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDPAIS'
        Width = 60
        Visible = True
      end>
  end
  object MainMenu1: TMainMenu
    Left = 128
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
      object Cidade1: TMenuItem
        Caption = 'Cidade'
        OnClick = Cidade1Click
      end
      object Estado1: TMenuItem
        Caption = 'Estado'
        OnClick = Estado1Click
      end
      object Pas1: TMenuItem
        Caption = 'Pa'#237's'
        OnClick = Pas1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
