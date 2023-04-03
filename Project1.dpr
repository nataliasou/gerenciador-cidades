program Project1;

uses
  Vcl.Forms,
  uGerente in 'uGerente.pas' {Form1},
  uPais in 'uPais.pas',
  uEstado in 'uEstado.pas',
  uCidade in 'uCidade.pas',
  uCadastroCidade in 'Views\uCadastroCidade.pas' {frmCadastroCidade},
  uCadastroPais in 'Views\uCadastroPais.pas' {frmCadastroPais},
  uCadastroEstado in 'Views\uCadastroEstado.pas' {frmCadastroEstado},
  uConsultaPais in 'Views\uConsultaPais.pas' {frmConsultaPais},
  uDM in 'uDM.pas' {DataModule1: TDataModule},
  uConsultaEstado in 'Views\uConsultaEstado.pas' {frmConsultaEstado},
  uConsultaCidade in 'Views\uConsultaCidade.pas' {frmConsultaCidade};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmCadastroCidade, frmCadastroCidade);
  Application.CreateForm(TfrmCadastroPais, frmCadastroPais);
  Application.CreateForm(TfrmCadastroEstado, frmCadastroEstado);
  Application.CreateForm(TfrmConsultaPais, frmConsultaPais);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmConsultaEstado, frmConsultaEstado);
  Application.CreateForm(TfrmConsultaCidade, frmConsultaCidade);
  Application.Run;
end.
