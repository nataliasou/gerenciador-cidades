unit uConsultaPais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, uCadastroPais, uPais, uDM;

type
  TfrmConsultaPais = class(TForm)
    Label1: TLabel;
    editConsulta: TEdit;
    btnBuscar: TButton;
    dbgridPais: TDBGrid;
    btnIncluir: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnVoltar: TButton;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
  private
    { Private declarations }
    unPais: Pais;
    unDM:  TDataModule1;
    unTfrmCadastroPais: TfrmCadastroPais;
    procedure mostrarFormularioDeCadastro;
  public
    { Public declarations }
    procedure conhecaObjeto(pPais:Pais; pDm:  TDataModule1);
  end;

var
  frmConsultaPais: TfrmConsultaPais;

implementation

{$R *.dfm}

procedure TfrmConsultaPais.btnBuscarClick(Sender: TObject);
begin
  unDm.dSetPais.Close;
  if editConsulta.Text = '' then
    unDM.dSetPais.SelectSQL.Text := 'select * from PAIS'
  else
    unDM.dSetPais.SelectSQL.Text := 'select * from PAIS WHERE pais=''' + editConsulta.Text + '''';
  unDM.dSetPais.Open;

  self.dbgridPais.DataSource := unDM.dsPais;
end;

procedure TfrmConsultaPais.btnEditarClick(Sender: TObject);
begin
  self.mostrarFormularioDeCadastro;
end;

procedure TfrmConsultaPais.btnExcluirClick(Sender: TObject);
var idDeletar: integer;
begin
  idDeletar := dbgridPais.Fields[0].Value;
  unDM.dSetPais.Close;
  unDM.dSetPais.Open;

  // Verifica se tem transaction ativa
  if not unDM.trans.Active then
      // Ativa a transa��o
      unDM.trans.StartTransaction;

  unDM.dSetPais.First;
  while not unDM.dSetPais.EOF do
  begin
  if unDM.dSetPais['IDPAIS'] = idDeletar then
    unDM.dSetPais.Delete
  else
    unDM.dSetPais.Next;
  end;
end;

procedure TfrmConsultaPais.btnIncluirClick(Sender: TObject);
begin
  self.mostrarFormularioDeCadastro;
end;

procedure TfrmConsultaPais.btnVoltarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmConsultaPais.conhecaObjeto(pPais: Pais; pDm:  TDataModule1);
begin
  unPais := pPais;
  unDM := pDm;
end;

procedure TfrmConsultaPais.FormShow(Sender: TObject);
begin
  unDm.dSetPais.Close;
  unDM.dSetPais.SelectSQL.Text := 'select * from PAIS';
  unDM.dSetPais.Open;

  self.dbgridPais.DataSource := unDM.dsPais;

end;

procedure TfrmConsultaPais.mostrarFormularioDeCadastro;
begin
  unTfrmCadastroPais := TfrmCadastroPais.Create(nil);
  unTfrmCadastroPais.conhecaObjeto(unPais, unDM);
  unTfrmCadastroPais.showModal;
end;

end.
