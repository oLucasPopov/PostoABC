unit untHelpersFormatacao;

interface

uses System.SysUtils, Winapi.Windows, untHelpersConversao;

type

TFormatar = class
public
//  class function SomenteNumero(valor: string ): string;
  class function Dinheiro(valor: string): string;
  class function Litro(valor: string): string;
//  class function StrToFloatLocale(valor: string): Real;
end;

implementation

{ TFormatar }

class function TFormatar.Dinheiro(valor: string): string;
begin
  if valor = '' then
    valor := '0';

  try
    Result := FormatFloat('#,##0.00', TConvertString.toFloatLocale(valor) / 100);
  except
    Result := FormatFloat('#,##0.00', 0);
  end;
end;

class function TFormatar.Litro(valor: string): string;
begin
  if valor = '' then
    valor := '0';

  try
    Result := FormatFloat('#,##0.000', TConvertString.toFloatLocale(valor) / 1000);
  except
    Result := FormatFloat('#,##0.000', 0);
  end;
end;

//class function TFormatar.StrToFloatLocale(valor: string): Real;
//var
//  formatSettings : TFormatSettings;
//begin
//  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, formatSettings);
//  Result := strToFloat(valor, formatSettings);
//end;

end.
