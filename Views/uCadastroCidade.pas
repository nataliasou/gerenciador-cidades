unit uCadastroCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uCidade, uDM;

type
  TfrmCadastroCidade = class(TForm)
    Label2: TLabel;
    editCidade: TEdit;
    btnSalvar: TButton;
    btnVoltar: TButton;
    cmbEstado: TComboBox;
    cmbPais: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    editCodigo: TEdit;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    unCidade: Cidade;
    unDM: TDataModule1;

  public
    { Public declarations }
    procedure conhecaObjeto(pCidade: Cidade; pDM: TDataModule1);
  end;

var
  frmCadastroCidade: TfrmCadastroCidade;

implementation

{$R *.dfm}

procedure TfrmCadastroCidade.btnSalvarClick(Sender: TObject);
var idPais, idEstado: integer;
begin
  unCidade.setCodigo(StrToInt(self.editCodigo.Text));
  unCidade.setDescricao(self.editCidade.Text);

  // Pegar id do País
  unDm.dSetPais.Close;
  unDM.dSetPais.SelectSQL.Text := 'select * from PAIS WHERE pais=''' + cmbPais.Text + '''';
  unDM.dSetPais.Open;
  idPais := unDM.dSetPaisIDPAIS.Value;

  //Pegar id do Estado
  unDm.dSetEstado.Close;
  unDM.dSetEstado.SelectSQL.Text := 'select * from ESTADO WHERE estado=''' + cmbEstado.Text + '''';
  unDM.dSetEstado.Open;
  idEstado := unDM.dSetEstadoIDESTADO.Value;

  // Verifica se tem transaction ativa
  if not unDM.trans.Active then
      // Ativa a transação
      unDM.trans.StartTransaction;

  if unCidade.getCodigo = 0 then
    unDM.dSetCidade.Insert
  else
    unDM.dSetCidade.Edit;

    unDM.dSetCidadeIDCIDADE.Value := StrToInt(self.editCodigo.Text);
    unDM.dSetCidadeCIDADE.Value := unCidade.getDescricao;
    unDM.dSetCidadeIDESTADO.Value := idEstado;
    unDM.dSetCidadeIDPAIS.Value := idPais;

    unDM.dSetCidade.Post;
    unDM.trans.Commit;
    unDM.dSetCidade.Open;
end;

procedure TfrmCadastroCidade.btnVoltarClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmCadastroCidade.conhecaObjeto(pCidade: Cidade; pDM: TDataModule1);
begin
  unCidade := pCidade;
  unDM := pDM;
end;

procedure TfrmCadastroCidade.FormActivate(Sender: TObject);
begin
  unDm.dSetPais.Close;
  unDM.dSetPais.SelectSQL.Text := 'select * from PAIS';
  unDM.dSetPais.Open;
  while not unDM.dSetPais.eof do
  begin
    cmbPais.Items.add(unDM.dSetPaisPAIS.value);
    unDM.dSetPais.Next;
  end;
  unDm.dSetEstado.Close;
  unDM.dSetEstado.SelectSQL.Text := 'select * from ESTADO';
  unDM.dSetEstado.Open;
  while not unDM.dSetEstado.eof do
  begin
    cmbEstado.Items.add(unDM.dSetEstadoESTADO.value);
    unDM.dSetEstado.Next;
  end;
end;

end.
