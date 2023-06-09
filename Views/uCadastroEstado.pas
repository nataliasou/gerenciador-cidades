unit uCadastroEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uCidade, uEstado, uDM;

type
  TfrmCadastroEstado = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    editCodigo: TEdit;
    editEstado: TEdit;
    btnSalvar: TButton;
    btnVoltar: TButton;
    editUf: TEdit;
    Label3: TLabel;
    cmbPais: TComboBox;
    Label4: TLabel;
    procedure btnVoltarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    unCidade: Cidade;
    unEstado: Estado;
    unDM: TDataModule1;
  public
    { Public declarations }
    procedure conhecaObjeto(pEstado: Estado; pDM:  TDataModule1);
  end;

var
  frmCadastroEstado: TfrmCadastroEstado;

implementation

{$R *.dfm}

procedure TfrmCadastroEstado.btnSalvarClick(Sender: TObject);
var idPais: integer;
begin
  unEstado.setCodigo(StrToInt(self.editCodigo.Text));
  unEstado.setDescricao(self.editEstado.Text);
  unEstado.setUf(self.editUf.Text);

  // Pegar id do Pa�s
  unDm.dSetPais.Close;
  unDM.dSetPais.SelectSQL.Text := 'select * from PAIS WHERE pais=''' + cmbPais.Text + '''';
  unDM.dSetPais.Open;

  idPais := unDM.dSetPaisIDPAIS.Value;

  // Verifica se tem transaction ativa
  if not unDM.trans.Active then
      // Ativa a transa��o
      unDM.trans.StartTransaction;

  if unEstado.getCodigo = 0 then
    unDM.dSetEstado.Insert
  else
    unDM.dSetEstado.Edit;

    unDM.dSetEstadoIDESTADO.Value := unEstado.getCodigo;
    unDM.dSetEstadoESTADO.Value := unEstado.getDescricao;
    unDM.dSetEstadoUF.Value := unEstado.getUf;
    unDM.dSetEstadoIDPAIS.Value := idPais;

    unDM.dSetEstado.Post;
    unDM.trans.Commit;
    unDM.dSetEstado.Open;
end;

procedure TfrmCadastroEstado.btnVoltarClick(Sender: TObject);
begin
  Close;
end;


procedure TfrmCadastroEstado.conhecaObjeto(pEstado: Estado; pDM: TDataModule1);
begin
  unEstado := pEstado;
  unDM := pDM;
end;

procedure TfrmCadastroEstado.FormActivate(Sender: TObject);
begin
  unDm.dSetPais.Close;
  unDM.dSetPais.SelectSQL.Text := 'select * from PAIS';
  unDM.dSetPais.Open;
  while not unDM.dSetPais.eof do
  begin
    cmbPais.Items.add(unDM.dSetPaisPAIS.value);
    unDM.dSetPais.Next;
  end;
end;

end.
