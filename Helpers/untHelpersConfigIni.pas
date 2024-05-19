unit untHelpersConfigIni;

interface

uses System.IniFiles, System.SysUtils, vcl.Forms;

type

  {O ideal seria criptografar as informações ao salvar}
  TIniBD = class(TIniFile)
  public
    class function CriarIni: TIniBD;
    function LerCaminhoBanco: String;
    function LerUsuarioBanco: String;
    function LerSenhaBanco: String;

    procedure GravarCaminhoBanco(valor: String);
    procedure GravarUsuarioBanco(valor: String);
    procedure GravarSenhaBanco(valor: String);
  end;

implementation

const
  SESSAO_INI  = 'BD';
  CAMINHO_INI = 'CAMINHO';
  USUARIO_INI = 'USUARIO';
  SENHA_INI   = 'SENHA';

{ TIniBD }

procedure TIniBD.GravarCaminhoBanco(valor: string);
begin
  if Trim(valor) = EmptyStr then
    raise Exception.Create('O Caminho do Banco de Dados deve ser preenchido!');

  Self.WriteString(SESSAO_INI, CAMINHO_INI, valor);
end;

procedure TIniBD.GravarSenhaBanco(valor: string);
begin
  if Trim(valor) = EmptyStr then
    raise Exception.Create('A Senha do Banco de Dados deve ser preenchida!');

  Self.WriteString(SESSAO_INI, SENHA_INI, valor);
end;

procedure TIniBD.GravarUsuarioBanco(valor: string);
begin
  if Trim(valor) = EmptyStr then
    raise Exception.Create('O Usuário do Banco de Dados deve ser preenchido!');

  Self.WriteString(SESSAO_INI, USUARIO_INI, valor);
end;

function TIniBD.LerCaminhoBanco: String;
begin
  Result := Trim(Self.ReadString(SESSAO_INI, CAMINHO_INI, ''))
end;

function TIniBD.LerSenhaBanco: String;
begin
  Result := Self.ReadString(SESSAO_INI, SENHA_INI, '')
end;

function TIniBD.LerUsuarioBanco: String;
begin
  Result := Self.ReadString(SESSAO_INI, USUARIO_INI, '')
end;

class function TIniBD.CriarIni: TIniBD;
begin
  Result := TIniBD.Create(ExpandFileName(ExtractFileDir(Application.ExeName)) +'\config.ini');
end;

end.
