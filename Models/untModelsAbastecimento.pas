unit untModelsAbastecimento;

interface

type
TNovoAbastecimento = record
  idBomba: Integer;
  precoLitro: Real;
  totalLitros: Real;
end;

THelperNovoAbastecimento = record helper for TNovoAbastecimento
  procedure Gerar(idBomba: Integer; precoLitro, totalLitros: Real);
end;

implementation

{ TNovoAbastecimentoHelper }

procedure THelperNovoAbastecimento.Gerar(idBomba: Integer; precoLitro,
  totalLitros: Real);
begin
  Self.idBomba     := idBomba;
  Self.precoLitro  := precoLitro;
  Self.totalLitros := totalLitros;
end;

end.
