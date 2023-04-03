object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 375
  Width = 428
  object Banco: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Users\programacao04\Desktop\DB\DB_PAISES.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252')
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 56
    Top = 48
  end
  object trans: TIBTransaction
    Active = True
    DefaultDatabase = Banco
    Left = 128
    Top = 48
  end
  object dSetPais: TIBDataSet
    Database = Banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PAIS'
      'where'
      '  IDPAIS = :IDPAIS')
    InsertSQL.Strings = (
      'insert into PAIS'
      '  (PAIS)'
      'values'
      '  (:PAIS)')
    RefreshSQL.Strings = (
      'Select '
      '  IDPAIS,'
      '  PAIS'
      'from PAIS '
      'where'
      '  IDPAIS = :IDPAIS')
    SelectSQL.Strings = (
      'select * from PAIS')
    ModifySQL.Strings = (
      'update PAIS'
      'set'
      '  PAIS = :PAIS'
      'where'
      '  IDPAIS = :IDPAIS')
    ParamCheck = True
    UniDirectional = False
    Active = True
    Left = 56
    Top = 112
    object dSetPaisIDPAIS: TIntegerField
      FieldName = 'IDPAIS'
      Origin = 'PAIS.IDPAIS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dSetPaisPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'PAIS.PAIS'
      Size = 100
    end
  end
  object dsPais: TDataSource
    DataSet = dSetPais
    Left = 128
    Top = 112
  end
  object dSetEstado: TIBDataSet
    Database = Banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ESTADO'
      'where'
      '  IDESTADO = :OLD_IDESTADO')
    InsertSQL.Strings = (
      'insert into ESTADO'
      '  (ESTADO, UF, IDPAIS)'
      'values'
      '  (:ESTADO, :UF, :IDPAIS)')
    RefreshSQL.Strings = (
      'Select '
      '  IDESTADO,'
      '  ESTADO,'
      '  UF,'
      '  IDPAIS'
      'from ESTADO '
      'where'
      '  IDESTADO = :IDESTADO')
    SelectSQL.Strings = (
      'select *  from ESTADO')
    ModifySQL.Strings = (
      'update ESTADO'
      'set'
      '  ESTADO = :ESTADO,'
      '  UF = :UF,'
      '  IDPAIS = :IDPAIS'
      'where'
      '  IDESTADO = :OLD_IDESTADO')
    ParamCheck = True
    UniDirectional = False
    Active = True
    Left = 56
    Top = 176
    object dSetEstadoIDESTADO: TIntegerField
      FieldName = 'IDESTADO'
      Origin = 'ESTADO.IDESTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dSetEstadoESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'ESTADO.ESTADO'
      Size = 100
    end
    object dSetEstadoUF: TIBStringField
      FieldName = 'UF'
      Origin = 'ESTADO.UF'
      Size = 2
    end
    object dSetEstadoIDPAIS: TIntegerField
      FieldName = 'IDPAIS'
      Origin = 'ESTADO.IDPAIS'
      Required = True
    end
  end
  object dsEstado: TDataSource
    DataSet = dSetEstado
    Left = 128
    Top = 176
  end
  object dSetCidade: TIBDataSet
    Database = Banco
    Transaction = trans
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CIDADE'
      'where'
      '  IDCIDADE = :OLD_IDCIDADE')
    InsertSQL.Strings = (
      'insert into CIDADE'
      '  (CIDADE, IDESTADO, IDPAIS)'
      'values'
      '  (:CIDADE, :IDESTADO, :IDPAIS)')
    RefreshSQL.Strings = (
      'Select '
      '  IDCIDADE,'
      '  CIDADE,'
      '  IDESTADO,'
      '  IDPAIS'
      'from CIDADE '
      'where'
      '  IDCIDADE = :IDCIDADE')
    SelectSQL.Strings = (
      'select *  from CIDADE')
    ModifySQL.Strings = (
      'update CIDADE'
      'set'
      '  CIDADE = :CIDADE,'
      '  IDESTADO = :IDESTADO,'
      '  IDPAIS = :IDPAIS'
      'where'
      '  IDCIDADE = :OLD_IDCIDADE')
    ParamCheck = True
    UniDirectional = False
    Active = True
    Left = 56
    Top = 240
    object dSetCidadeIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      Origin = 'CIDADE.IDCIDADE'
      Required = True
    end
    object dSetCidadeCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE.CIDADE'
      Size = 100
    end
    object dSetCidadeIDESTADO: TIntegerField
      FieldName = 'IDESTADO'
      Origin = 'CIDADE.IDESTADO'
      Required = True
    end
    object dSetCidadeIDPAIS: TIntegerField
      FieldName = 'IDPAIS'
      Origin = 'CIDADE.IDPAIS'
      Required = True
    end
    object dSetCidadePais: TStringField
      FieldKind = fkLookup
      FieldName = 'Pais'
      LookupDataSet = dSetPais
      LookupKeyFields = 'IDPAIS'
      LookupResultField = 'PAIS'
      KeyFields = 'IDPAIS'
      Size = 60
      Lookup = True
    end
    object dSetCidadeEstado: TStringField
      FieldKind = fkLookup
      FieldName = 'Estado'
      LookupDataSet = dSetEstado
      LookupKeyFields = 'IDESTADO'
      LookupResultField = 'ESTADO'
      KeyFields = 'IDESTADO'
      Size = 60
      Lookup = True
    end
  end
  object dsCidade: TDataSource
    DataSet = dSetCidade
    Left = 128
    Top = 240
  end
end
