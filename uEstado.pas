unit uEstado;

interface
uses uPais;

type Estado = class
  private
    codigo: integer;
    descricao: string;
    uf: string;
    unPais: Pais;

  public
    constructor criaObjeto;

    procedure setCodigo(pCodigo: integer);
    procedure setDescricao(pDescricao: string);
    procedure setUf(pUf: string);
    procedure setPais(pPais: Pais);

    function getCodigo: integer;
    function getDescricao: string;
    function getUf: string;
    function getPais: Pais;

    destructor destroy;
end;

implementation

{ Estado }

constructor Estado.criaObjeto;
begin
  codigo := 0;
  descricao := '';
  uf := '';
  unPais := Pais.CriaObjeto;
end;

destructor Estado.destroy;
begin
  unPais.destroy;
end;

function Estado.getCodigo: integer;
begin
  result := codigo;
end;

function Estado.getDescricao: string;
begin
  result := descricao;
end;

function Estado.getPais: Pais;
begin
  result := unPais;
end;

function Estado.getUf: string;
begin
  result := uf;
end;

procedure Estado.setCodigo(pCodigo: integer);
begin
  codigo := pCodigo;
end;

procedure Estado.setDescricao(pDescricao: string);
begin
  descricao := pDescricao;
end;

procedure Estado.setPais(pPais: Pais);
begin
  unPais := pPais;
end;

procedure Estado.setUf(pUf: string);
begin
  uf := pUf;
end;

end.