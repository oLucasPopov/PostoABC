unit untHelpersConversao;

interface
uses
  System.SysUtils, Winapi.Windows, system.MaskUtils, vcl.Controls;

type
  TConvertString = class
    class function toFloatLocale(valor: string): Real;
  end;

  THelperVariant = record helper for System.Variant
    function ToIntDef(default: Integer): Integer;
  end;

  THelperMaskedText = record helper for TMaskedText
    function toFloatLocale: Real;
  end;

  THelperCaption = record helper for TCaption
    function toFloatLocale: Real;
  end;

implementation

uses System.Variants;

{ THelperVariant }

function THelperVariant.ToIntDef(default: Integer): Integer;
begin
  if self = Null then
  begin
    Result := default;
    exit;
  end;

  try
    Result := self;
  except
    Result := default;
  end;
end;

{ THelperMaskedText }

function THelperMaskedText.toFloatLocale: Real;
begin
  Result := TConvertString.toFloatLocale(Self);
end;

{ THelperCaption }

function THelperCaption.toFloatLocale: Real;
begin
  Result := TConvertString.toFloatLocale(Self);
end;

{ TConvertString }

class function TConvertString.toFloatLocale(valor: string): Real;
var
  formatSettings : TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, formatSettings);
  Result := StrToFloat(valor, formatSettings);
end;

end.
