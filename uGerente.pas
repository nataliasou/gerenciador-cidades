unit uGerente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCidade, uEstado, uPais, Vcl.StdCtrls, Vcl.Menus,
  uCadastroCidade, uCadastroPais, uCadastroEstado, uConsultaPais, uDM, uConsultaEstado,
  uConsultaCidade, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Cidade1: TMenuItem;
    Estado1: TMenuItem;
    Pas1: TMenuItem;
    Sair1: TMenuItem;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    //procedure btnGravarClick(Sender: TObject);
    //procedure btnRecuperarClick(Sender: TObject);
    procedure Cidade1Click(Sender: TObject);
    procedure Pas1Click(Sender: TObject);
    procedure Estado1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    unCidade : Cidade;
    unEstado: Estado;
    unPais: Pais;

    unTfrmConsultaPais: TfrmConsultaPais;
    unTfrmConsultaEstado: TfrmConsultaEstado;
    unTfrmConsultaCidade: TfrmConsultaCidade;

    unDM:  TDataModule1;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{procedure TForm1.btnGravarClick(Sender: TObject);
begin
  unCidade := Cidade.CriaObjeto;
  unCidade.setCodigo(StrToInt(Self.editCodigo.Text));
  unCidade.setDescricao(Self.editDescricao.Text);

  unCidade.getEstado.setCodigo(StrToInt(Self.editCodigoEstado.Text));
  unCidade.getEstado.setDescricao(Self.editDescricaoEstado.Text);
  unCidade.getEstado.setUf(Self.editUf.Text);

  unCidade.getEstado.getPais.setCodigo(StrToInt(Self.editCodigoPais.Text));
  unCidade.getEstado.getPais.setDescricao(Self.editDescricaoPais.Text);

end;

procedure TForm1.btnRecuperarClick(Sender: TObject);
begin
  self.editCodigo2.Text := IntToStr(unCidade.getCodigo);
  self.editDescricao2.Text := unCidade.getDescricao;

  self.editCodigoEstado2.Text := IntToStr(unCidade.getEstado.getCodigo);
  self.editDescricaoEstado2.Text := unCidade.getEstado.getDescricao;
  self.editUf2.Text := unCidade.getEstado.getUf;

  self.editCodigoPais2.Text := IntToStr(unCidade.getEstado.getPais.getCodigo);
  self.editDescricaoPais2.Text := unCidade.getEstado.getPais.getDescricao;
  unCidade.destroy;
end; }

procedure TForm1.Cidade1Click(Sender: TObject);
begin
  unTfrmConsultaCidade.ConhecaObjeto(unCidade, unDM);
  unTfrmConsultaCidade.ShowModal;
end;

procedure TForm1.Estado1Click(Sender: TObject);
begin
  unTfrmConsultaEstado.ConhecaObjeto(unEstado, unDM);
  unTfrmConsultaEstado.ShowModal;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  unCidade.destroy;
  unEstado.destroy;
  unPais.destroy;

  unTfrmConsultaPais.Destroy;
  unTfrmConsultaEstado.Destroy;
  unTfrmConsultaCidade.Destroy;
  unDM.Destroy;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
// Cria��o das inst�ncias
  unCidade := Cidade.CriaObjeto;
  unEstado := Estado.CriaObjeto;
  unPais := Pais.CriaObjeto;

  unTfrmConsultaPais := TfrmConsultaPais.Create(nil);
  unTfrmConsultaEstado := TfrmConsultaEstado.Create(nil);
  unTfrmConsultaCidade := TfrmConsultaCidade.Create(nil);
  unDM :=  TDataModule1.Create(nil);
end;

procedure TForm1.Pas1Click(Sender: TObject);
begin
  unTfrmConsultaPais.ConhecaObjeto(unPais, unDM);
  unTfrmConsultaPais.ShowModal;
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
