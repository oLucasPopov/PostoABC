unit untRepositoriosNovoAbastecimento;

interface

uses untModelsAbastecimento, untDmConnection, untHelpersDB;

type

TRepositorioFBNovoAbastecimento = class
  class procedure Salvar(dados: TNovoAbastecimento);
end;

implementation

uses FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

{ TRepositorioFBNovoAbastecimento }

class procedure TRepositorioFBNovoAbastecimento.Salvar(dados: TNovoAbastecimento);
var
  qry: TFDQuery;
begin
  qry := THelperDB.CriarQuery;
  try
    qry.SQL.Text := 'INSERT INTO vendas_combustivel (id_bomba, litros, preco_litro)'
       +sLineBreak+ 'VALUES (:id_bomba, :litros, :preco_litro)';

    qry.ParamByName('id_bomba').AsInteger  := dados.idBomba;
    qry.ParamByName('litros').AsFloat      := dados.totalLitros;
    qry.ParamByName('preco_litro').AsFloat := dados.precoLitro;

    qry.ExecSQL;
  finally
    qry.Free;
  end;
end;

end.
