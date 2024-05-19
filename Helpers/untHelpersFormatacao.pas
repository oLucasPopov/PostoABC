unit untHelpersFormatacao;

interface

uses System.SysUtils, Winapi.Windows, untHelpersConversao;

type

TFormatar = class
private
    class function SomenteNumeros(cTexto: String): string;
public
  class function Dinheiro(valor: string): string;
  class function Litro(valor: string): string;
end;

implementation

{ TFormatar }

class function TFormatar.Dinheiro(valor: string): string;
begin
  if valor = '' then
    valor := '0';

  try
    Result := FormatFloat('#,##0.00', TConvertString.toFloatLocale(SomenteNumeros(valor)) / 100);
  except
    Result := FormatFloat('#,##0.00', 0);
  end;
end;

class function TFormatar.Litro(valor: string): string;
begin
  if valor = '' then
    valor := '0';

  try
    Result := FormatFloat('#,##0.000', TConvertString.toFloatLocale(SomenteNumeros(valor)) / 1000);
  except
    Result := FormatFloat('#,##0.000', 0);
  end;
end;

class function TFormatar.SomenteNumeros(cTexto: string): string;
var
  x: integer;
begin
  Result := '';
  for x := 0 to Length(cTexto) - 1 do
    if CharInSet(cTexto.Chars[x], ['0' .. '9']) then
      Result := Result + cTexto.Chars[x];
end;

end.
