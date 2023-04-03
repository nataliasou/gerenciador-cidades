unit uPais;

interface

type Pais = class

  private
    codigo: integer;
    descricao: string[100];

  public
    constructor CriaObjeto;

    procedure setCodigo(pCodigo: integer);
    procedure setDescricao(pDescricao: string);

    function getCodigo: integer;
    function getDescricao: string;

    destructor destroy;




end;
implementation

{ Pais }

constructor Pais.CriaObjeto;
begin
  codigo := 0;
  descricao := '';
end;

destructor Pais.destroy;
begin

end;

function Pais.getCodigo: integer;
begin
  result := codigo;
end;

function Pais.getDescricao: string;
begin
  result := descricao;
end;

procedure Pais.setCodigo(pCodigo: integer);
begin
  codigo := pCodigo;
end;

procedure Pais.setDescricao(pDescricao: string);
begin
  descricao := pDescricao;
end;


end.

