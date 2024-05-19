unit untCadAlterarPrecos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls,
  Vcl.DBCtrls, Data.DB, FireDAC.Comp.Client, Vcl.Mask,
  untHelpersMensagem, untHelpersFormatacao, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet;

type
  TfrmCadAlterarPrecos = class(TForm)
    dsTanque: TDataSource;
    qryTanque: TFDQuery;
    cmbTanque: TDBLookupComboBox;
    lblBomba: TLabel;
    qryTanqueID: TIntegerField;
    qryTanqueDESCRICAO_TANQUE: TStringField;
    qryTanquePRECO_LITRO: TFMTBCDField;
    edtPreco: TDBEdit;
    lblPrecoCombustivel: TLabel;
    btnConfirmar: TButton;
    procedure btnConfirmarClick(Sender: TObject);
    procedure edtPrecoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadAlterarPrecos: TfrmCadAlterarPrecos;

implementation

{$R *.dfm}

procedure TfrmCadAlterarPrecos.btnConfirmarClick(Sender: TObject);
begin
  try
    if qryTanque.State = dsEdit then
    begin
      if cmbTanque.KeyValue = Null then
      begin
        TMensagemHelper.Mensagem('Aviso', 'Nenhum Tanque Selecionado!');
        Exit;
      end;

      qryTanque.Post;
      TMensagemHelper.MensagemOK('Sucesso!', 'Preço alterado com sucesso!');
    end;

    Self.Close;
  except
    on E:Exception do
    begin
      TMensagemHelper.MensagemErro('Erro ao alterar preço', E);
    end;
  end;
end;

procedure TfrmCadAlterarPrecos.edtPrecoChange(Sender: TObject);
begin
  edtPreco.Text := TFormatar.Dinheiro(edtPreco.Text);
  edtPreco.SelStart := Length(edtPreco.Text);
end;

end.


