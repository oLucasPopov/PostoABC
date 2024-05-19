unit untCadAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, untDmConnection, Data.FMTBcd, Data.SqlExpr;

type
  TfrmCadAbastecimento = class(TForm)
    lblBomba: TLabel;
    edtPreco: TDBEdit;
    lblPrecoCombustivel: TLabel;
    Label1: TLabel;
    lblTotal: TLabel;
    btnConfirmar: TButton;
    btnCancelar: TButton;
    dsBomba: TDataSource;
    qryBomba: TFDQuery;
    qryBombaid: TIntegerField;
    qryBombapreco_litro: TFMTBCDField;
    qryBombadescricao_bomba: TStringField;
    cmbBomba: TDBLookupComboBox;
    edtTotal: TEdit;
    edtLitros: TEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edtLitrosChange(Sender: TObject);
    procedure edtPrecoChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure Totalizar;
    function ConfirmaCancelamento: Boolean;
    procedure LimparCampos;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAbastecimento: TfrmCadAbastecimento;


implementation

uses untModelsAbastecimento, untHelpersMensagem, untHelpersFormatacao,
untControllerNovoAbastecimento, untHelpersConversao;

{$R *.dfm}


function TfrmCadAbastecimento.ConfirmaCancelamento: Boolean;
begin
  Result := TMensagemHelper.MensagemSimNao('Deseja realmente cancelar o cadastro?');
end;

procedure TfrmCadAbastecimento.btnCancelarClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCadAbastecimento.edtLitrosChange(Sender: TObject);
begin
  edtLitros.Text := TFormatar.Litro(edtLitros.Text);
  edtLitros.SelStart := Length(edtLitros.Text);

  Totalizar;
end;

procedure TfrmCadAbastecimento.edtPrecoChange(Sender: TObject);
begin
  Totalizar;
end;

procedure TfrmCadAbastecimento.Totalizar;
var
  litros: Real;
begin
  litros := StrToFloat(edtLitros.Text);
  edtTotal.Text := FormatFloat('#,##0.00', qryBomba.FieldByName('preco_litro').AsFloat * litros);
end;

procedure TfrmCadAbastecimento.LimparCampos;
begin
  cmbBomba.KeyValue := null;
  edtLitros.Text    := '0';
end;

procedure TfrmCadAbastecimento.btnConfirmarClick(Sender: TObject);
const
  sucesso = 'Cadastro realizado com sucesso!'
+sLineBreak+'Deseja manter o cadastro aberto para cadastrar outro abastecimento?';
var
  NovoAbastecimento: TNovoAbastecimento;
  ControllerNovoAbastecimento: TControllerNovoAbastecimento;
begin
  try
    NovoAbastecimento.Gerar(cmbBomba.KeyValue.ToIntDef(-1)
                           ,edtPreco.Text.toFloatLocale
                           ,edtLitros.Text.toFloatLocale);

    ControllerNovoAbastecimento.Cadastrar(NovoAbastecimento);

    if not TMensagemHelper.MensagemSimNao(sucesso) then
    begin
      Self.OnCloseQuery := nil;
      Self.Close;
    end;


    LimparCampos;
    cmbBomba.SetFocus;
  except
    on E:Exception do
    begin
      TMensagemHelper.MensagemErro('Erro ao cadastrar abastecimento', E);
    end;
  end;
end;

procedure TfrmCadAbastecimento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := ConfirmaCancelamento;
end;

procedure TfrmCadAbastecimento.FormCreate(Sender: TObject);
begin
qryBomba.Active := True;
end;

end.
