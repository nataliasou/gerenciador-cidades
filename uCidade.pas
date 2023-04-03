unit uCidade;

interface
uses uEstado, uPais;

type cidade = class
  private
    codigo: integer;
    descricao: string;
    unEstado: Estado;
    unPais: Pais;
  public
  constructor criaObjeto;

  procedure setCodigo(pCodigo: integer);
  procedure setDescricao(pDescricao: string);
  procedure setUnEstado(pEstado: Estado);
  procedure setUnPais(pPais: Pais);

  function getCodigo : integer;
  function getDescricao: string;
  function getEstado: Estado;
  function getPais: Pais;

  destructor destroy;
end;
implementation

{ cidade }

constructor cidade.criaObjeto;
begin
  codigo := 0;
  descricao := '';
  unEstado := Estado.CriaObjeto;
  unPais := Pais.CriaObjeto;
end;

destructor cidade.destroy;
begin
  unEstado.destroy;
  unPais.destroy;
end;

function cidade.getCodigo: integer;
begin
  result := codigo;
end;

function cidade.getDescricao: string;
begin
  result := descricao;
end;

function cidade.getEstado: Estado;
begin
  result := unEstado;
end;

function cidade.getPais: Pais;
begin
  result := unPais;
end;

procedure cidade.setCodigo(pCodigo: integer);
begin
  codigo := pCodigo;
end;

procedure cidade.setDescricao(pDescricao: string);
begin
  descricao := pDescricao;
end;

procedure cidade.setUnEstado(pEstado: Estado);
begin
  unEstado := pEstado;
end;

procedure cidade.setUnPais(pPais: Pais);
begin
  unPais := pPais;
end;

end.
