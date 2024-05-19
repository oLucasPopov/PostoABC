unit untControllerNovoAbastecimento;

interface
uses System.SysUtils, untModelsAbastecimento, untRepositoriosNovoAbastecimento;

type
TControllerNovoAbastecimento = class
public
  procedure Cadastrar(dados: TNovoAbastecimento);
end;

implementation

{ TControllerNovoAbastecimento }

procedure  TControllerNovoAbastecimento.Cadastrar(
  dados: TNovoAbastecimento);
begin
  if dados.idBomba = -1 then
    raise Exception.Create('Bomba não selecionada!');

  if dados.totalLitros = 0 then
    raise Exception.Create('Litros Abastecidos deve ser maior que zero!');

  if dados.totalLitros < 0 then
    raise Exception.Create('Litros Abastecidos não pode ser negativo!');

  if dados.precoLitro = 0 then
    raise Exception.Create('O Preço do litro não pode ser zero!');

  if dados.precoLitro < 0 then
    raise Exception.Create('O preço do litro não pode estar negativo!');

  TRepositorioFBNovoAbastecimento.Salvar(dados)
end;

end.
