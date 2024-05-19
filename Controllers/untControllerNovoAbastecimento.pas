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
    raise Exception.Create('Bomba n�o selecionada!');

  if dados.totalLitros = 0 then
    raise Exception.Create('Litros Abastecidos deve ser maior que zero!');

  if dados.totalLitros < 0 then
    raise Exception.Create('Litros Abastecidos n�o pode ser negativo!');

  if dados.precoLitro = 0 then
    raise Exception.Create('O Pre�o do litro n�o pode ser zero!');

  if dados.precoLitro < 0 then
    raise Exception.Create('O pre�o do litro n�o pode estar negativo!');

  TRepositorioFBNovoAbastecimento.Salvar(dados)
end;

end.
