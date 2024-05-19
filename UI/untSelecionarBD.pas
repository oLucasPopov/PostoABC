unit untSelecionarBD;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.IniFiles,
  untHelpersMensagem, untHelpersConfigIni;

type
  TfrmSelecionarBD = class(TForm)
    edtCaminhoBD: TEdit;
    lblCaminhoBD: TLabel;
    btnSelecionarBD: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edtUsuarioBD: TEdit;
    edtSenhaBD: TEdit;
    btnSalvar: TButton;
    procedure btnSelecionarBDClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    procedure SelecionarBD;
  public
  end;

var
  frmSelecionarBD: TfrmSelecionarBD;

implementation

{$R *.dfm}

procedure TfrmSelecionarBD.SelecionarBD;
var
  dlg: TOpenDialog;
begin
  dlg := TOpenDialog.Create(Self);
  try
    dlg.Filter := 'Firebird Database|*.FDB|All files (*.*)|*.*';
    if dlg.Execute(Handle) then
      edtCaminhoBD.Text := dlg.FileName;
  finally
    dlg.Free;
  end;
end;

procedure TfrmSelecionarBD.btnSalvarClick(Sender: TObject);
var
  configIni: TIniBD;
begin
  configIni := TIniBD.CriarIni;
  try
    try
      configIni.GravarCaminhoBanco(edtCaminhoBD.Text);
      configIni.GravarUsuarioBanco(edtUsuarioBD.Text);
      configIni.GravarSenhaBanco(edtSenhaBD.Text);
      configIni.UpdateFile;

      Self.Close;
    except
      on E: Exception do
      begin
        TMensagemHelper.MensagemErro('Erro ao salvar configurações', E);
      end;
    end;
  finally
    configIni.Free;
  end;
end;

procedure TfrmSelecionarBD.btnSelecionarBDClick(Sender: TObject);
begin
  SelecionarBD;
end;

end.
