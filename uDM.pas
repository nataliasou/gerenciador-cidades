unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBCustomDataSet, IBX.IBDatabase;

type
  TDataModule1 = class(TDataModule)
    Banco: TIBDatabase;
    trans: TIBTransaction;
    dSetPais: TIBDataSet;
    dsPais: TDataSource;
    dSetEstado: TIBDataSet;
    dsEstado: TDataSource;
    dSetCidade: TIBDataSet;
    dsCidade: TDataSource;
    dSetEstadoIDESTADO: TIntegerField;
    dSetEstadoESTADO: TIBStringField;
    dSetEstadoUF: TIBStringField;
    dSetEstadoIDPAIS: TIntegerField;
    dSetCidadeIDCIDADE: TIntegerField;
    dSetCidadeCIDADE: TIBStringField;
    dSetCidadeIDESTADO: TIntegerField;
    dSetCidadeIDPAIS: TIntegerField;
    dSetPaisIDPAIS: TIntegerField;
    dSetPaisPAIS: TIBStringField;
    dSetCidadePais: TStringField;
    dSetCidadeEstado: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
