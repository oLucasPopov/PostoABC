unit untDmConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, Data.DbxSqlite, Data.SqlExpr, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, untSelecionarBD, untHelpersConfigIni, untHelpersMensagem;

type
  TdmConnection = class(TDataModule)
    connection: TFDConnection;
    transaction: TFDTransaction;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure ConfigurarConexao;
    function ConexaoConfigurada: Boolean;
    procedure AlimentarConfigConexao;
    procedure InicializaBD(forcarConfiguracao: Boolean = False);
    procedure HabilitarConexao;
  public
  end;

var
  dmConnection: TdmConnection;
  iniConexao: TIniBD;

implementation

uses vcl.Forms;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TdmConnection.ConexaoConfigurada: Boolean;
begin
  result := not (iniConexao.LerCaminhoBanco = emptyStr);
end;

procedure TdmConnection.ConfigurarConexao;
var
  frmSelecionarBD: TfrmSelecionarBD;
begin
  frmSelecionarBD := TfrmSelecionarBD.Create(Self);
  try
    frmSelecionarBD.ShowModal;
  finally
    frmSelecionarBD.Free;
  end;
end;

procedure TdmConnection.InicializaBD(forcarConfiguracao: Boolean = False);
begin
  if (not ConexaoConfigurada) or (forcarConfiguracao) then
  begin
    ConfigurarConexao;
    InicializaBD;
  end;

  AlimentarConfigConexao;
  HabilitarConexao;
end;

procedure TdmConnection.HabilitarConexao;
begin
  try
    connection.Connected := True;
  except
    on E:Exception do
    begin
      TMensagemHelper.MensagemErro('Erro ao conectar com banco de dados!', E);
      if TMensagemHelper.MensagemSimNao('Deseja configurar o banco de dados novamente?') then
        InicializaBD(True)
      else
        Application.Terminate;
    end;
  end;
end;

procedure TdmConnection.DataModuleCreate(Sender: TObject);
begin
  iniConexao := TIniBD.CriarIni;
  try
    inicializaBD;
  finally
    iniConexao.Free;
  end;
end;

procedure TdmConnection.AlimentarConfigConexao;
begin
  with connection.Params do
  begin
    Database := iniConexao.LerCaminhoBanco;
    UserName := iniConexao.LerUsuarioBanco;
    Password := iniConexao.LerSenhaBanco
  end;
end;

end.
