unit untHelpersMensagem;

interface

uses
  Vcl.Dialogs, Vcl.Forms, System.SysUtils, System.UITypes,
  Winapi.Windows;

type
  TMensagemHelper = class
    class function MensagemSimNao(cMensagem: String): boolean;
    class procedure MensagemErro(cTitulo: string; E: Exception);
  end;

implementation

{ TMessagemHelper }

class procedure TMensagemHelper.MensagemErro(cTitulo: string; E: Exception);
begin
  Application.MessageBox(PWideChar(E.Message), PWideChar(cTitulo), MB_ICONERROR + MB_OK);
end;

class function TMensagemHelper.MensagemSimNao(cMensagem: String): boolean;
begin
  Result := Application.MessageBox(PWideChar(cMensagem), 'Pergunta', MB_ICONQUESTION + MB_YESNO) = ID_YES;
end;

end.
