object frmConsultaEstado: TfrmConsultaEstado
  Left = 0
  Top = 0
  Caption = 'Consultar estado'
  ClientHeight = 259
  ClientWidth = 380
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 42
    Height = 13
    Caption = 'Consulta'
  end
  object editConsulta: TEdit
    Left = 24
    Top = 43
    Width = 217
    Height = 21
    TabOrder = 0
  end
  object btnBuscar: TButton
    Left = 269
    Top = 41
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 1
    OnClick = btnBuscarClick
  end
  object dbgridEstado: TDBGrid
    Left = 24
    Top = 86
    Width = 320
    Height = 120
    DataSource = DataModule1.dsEstado
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDESTADO'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ESTADO'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UF'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IDPAIS'
        Width = 65
        Visible = True
      end>
  end
  object btnIncluir: TButton
    Left = 24
    Top = 212
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 3
    OnClick = btnIncluirClick
  end
  object btnEditar: TButton
    Left = 105
    Top = 212
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 4
    OnClick = btnEditarClick
  end
  object btnExcluir: TButton
    Left = 186
    Top = 212
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = btnExcluirClick
  end
  object btnVoltar: TButton
    Left = 267
    Top = 212
    Width = 75
    Height = 25
    Caption = 'Voltar'
    TabOrder = 6
    OnClick = btnVoltarClick
  end
end
