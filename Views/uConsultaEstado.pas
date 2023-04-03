unit uConsultaEstado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, uCadastroEstado, uEstado, uDM;

type
  TfrmConsultaEstado = class(TForm)
    Label1: TLabel;
    editConsulta: TEdit;
    btnBuscar: TButton;
    dbgridEstado: TDBGrid;
    btnIncluir: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnVoltar: TButton;
    procedure btnIncluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    unEstado: Estado;
    unDM: TDataModule1;
    unTfrmCadastroEstado: TfrmCadastroEstado;
    procedure mostrarFormularioDeCadastro;
  public
    { Public declarations }
    procedure conhecaObjeto(pEstado: Estado; pDM: TDataModule1);
  end;

var
  frmConsultaEstado: TfrmConsultaEstado;

implementation

{$R *.dfm}

procedure TfrmConsultaEstado.btnBuscarClick(Sender: TObject);
begin
  unDm.dSetEstado.Close;
  if editConsulta.Text = '' then
    unDM.dSetEstado.SelectSQL.Text := 'select * from ESTADO'
  else
    unDM.dSetEstado.SelectSQL.Text := 'select * from ESTADO WHERE estado=''' + editConsulta.Text + '''';
  unDM.dSetEstado.Open;

  self.dbgridEstado.DataSource := unDM.dsEstado;
end;

procedure TfrmConsultaEstado.btnEditarClick(Sender: TObject);
begin
  self.mostrarFormularioDeCadastro;
end;

procedure TfrmConsultaEstado.btnExcluirClick(Sender: TObject);
var idDeletar: integer;
begin
  idDeletar := dbgridEstado.Fields[0].Value;
  unDM.dSetEstado.Close;
  unDM.dSetEstado.Open;

  // Verifica se tem transaction ativa
  if not unDM.trans.Active then
      // Ativa a transa��o
      unDM.trans.StartTransaction;

  unDM.dSetEstado.First;
  while not unDM.dSetEstado.EOF do
  begin
  if unDM.dSetEstado['IDESTADO'] = idDeletar then
    unDM.dSetEstado.Delete
  else
    unDM.dSetEstado.Next;
  end;
end;

procedure TfrmConsultaEstado.btnIncluirClick(Sender: TObject);
begin
  self.mostrarFormularioDeCadastro;
end;

procedure TfrmConsultaEstado.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConsultaEstado.conhecaObjeto(pEstado: Estado; pDM: TDataModule1);
begin
  unEstado := pEstado;
  unDM := pDM;
end;

procedure TfrmConsultaEstado.FormShow(Sender: TObject);
begin
  unDM.dSetEstado.Close;
  unDM.dSetEstado.SelectSQL.Text := 'SELECT * FROM ESTADO';
  unDM.dSetEstado.Open;

  self.dbgridEstado.DataSource := unDM.dsEstado;
end;

procedure TfrmConsultaEstado.mostrarFormularioDeCadastro;
begin
  unTfrmCadastroEstado := TfrmCadastroEstado.Create(nil);
  unTfrmCadastroEstado.conhecaObjeto(unEstado, unDM);
  unTfrmCadastroEstado.ShowModal;
end;

end.
