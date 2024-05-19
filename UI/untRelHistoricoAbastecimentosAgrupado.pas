unit untRelHistoricoAbastecimentosAgrupado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, untDmConnection, untHelpersMensagem,
  untSelecionarPeriodo;

type
  TfrmRelHistoricoAbastecimentosAgrupado = class(TForm)
    rlRelatorio: TRLReport;
    dsRelatorio: TDataSource;
    qryRelatorio: TFDQuery;
    bndTitulo: TRLBand;
    rlTitle: TRLLabel;
    qryRelatorioDIA_VENDA: TDateField;
    qryRelatorioDESCRICAO_BOMBA: TStringField;
    qryRelatorioDESCRICAO_TANQUE: TStringField;
    qryRelatorioTOTAL_LIQUIDO: TFMTBCDField;
    qryRelatorioTOTAL_BRUTO: TFMTBCDField;
    qryRelatorioTOTAL_IMPOSTO: TFMTBCDField;
    grpDia: TRLGroup;
    grpTanque: TRLGroup;
    bndAgrupamento: TRLBand;
    RLDBText1: TRLDBText;
    bndDetalhes: TRLBand;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    bndSomatoriaAgrupado: TRLBand;
    bndCabecalho2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    bndCabecalho1: TRLBand;
    lblDiaVenda: TRLDBText;
    lblSomatoriaBruto: TRLLabel;
    lblResultadoAgrupado: TRLBand;
    lblSomatoriaImposto: TRLLabel;
    lblSomatoriaTotLiq: TRLLabel;
    lblBrutoAgrupado: TRLLabel;
    lblResultadosDia: TRLLabel;
    bndDivider: TRLBand;
    shpDivider: TRLDraw;
    lblImpostoAgrupado: TRLLabel;
    lblTotalLiqAgrupado: TRLLabel;
    bndSomatoriaTotal: TRLBand;
    qryRelatorioTotalLiquido: TAggregateField;
    pnlSomatoriaTotal: TRLPanel;
    RLLabel5: TRLLabel;
    lblBrutoPeriodo: TRLLabel;
    lblImpostoPeriodo: TRLLabel;
    lblLiqPeriodo: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    procedure grpTanqueBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure bndDetalhesBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure bndSomatoriaAgrupadoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure lblResultadoAgrupadoBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure lblResultadoAgrupadoAfterPrint(Sender: TObject);
    procedure bndSomatoriaTotalBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    dataInicio: TDate;
    dataFim: TDate;
    totalBrutoAgrupado: Real;
    totalBruto: Real;
    totalImposto: Real;
    totalImpostoAgrupado: Real;
    totalLiquido: Real;
    totalLiquidoAgrupado: Real;

    totalBrutoPeriodo: Real;
    totalLiquidoPeriodo:Real;
    totalImpostoPeriodo: Real;
    procedure ConfigurarPeriodo;
  public
    procedure Imprimir;
    constructor Create(AOwner: TComponent); override;
  end;

var
  frmRelHistoricoAbastecimentosAgrupado: TfrmRelHistoricoAbastecimentosAgrupado;

implementation

{$R *.dfm}

{ TfrmRelHistoricoAbastecimentosAgrupado }

procedure TfrmRelHistoricoAbastecimentosAgrupado.bndDetalhesBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  totalBruto   := totalBruto   + qryRelatorioTOTAL_BRUTO.AsFloat;
  totalImposto := totalImposto + qryRelatorioTOTAL_IMPOSTO.AsFloat;
  totalLiquido := totalLiquido + qryRelatorioTOTAL_LIQUIDO.AsFloat;
end;

procedure TfrmRelHistoricoAbastecimentosAgrupado.grpTanqueBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  totalBruto   := 0;
  totalImposto := 0;
  totalLiquido := 0;
end;

procedure TfrmRelHistoricoAbastecimentosAgrupado.Imprimir;
const
  FORMATO_DATA = 'dd/MM/yyyy';
begin
  try
    rlTitle.Caption := Format(rlTitle.Caption
                             ,[FormatDateTime(FORMATO_DATA, dataInicio)
                              ,FormatDateTime(FORMATO_DATA, dataFim)]);

    qryRelatorio.Open('', [dataInicio, dataFim]);
    if qryRelatorio.IsEmpty then
    begin
      TMensagemHelper.Mensagem('Aviso', 'Nenhuma movimentação encontrada para o período selecionado!');
      exit;
    end;

    rlRelatorio.PreviewModal;
  except
    on E:Exception do
    begin
      TMensagemHelper.MensagemErro('Erro ao imprimir relatório!', E);
    end;
  end;
end;

procedure TfrmRelHistoricoAbastecimentosAgrupado.bndSomatoriaTotalBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  lblBrutoPeriodo.Caption   := FormatFloat('(+) #,##0.00', totalBrutoPeriodo);
  lblImpostoPeriodo.Caption := FormatFloat('(-) #,##0.00', totalImpostoPeriodo);
  lblLiqPeriodo.Caption     := FormatFloat('(=) #,##0.00', totalLiquidoPeriodo);
end;

procedure TfrmRelHistoricoAbastecimentosAgrupado.bndSomatoriaAgrupadoBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  lblSomatoriaBruto.Caption   := FormatFloat('(+) #,##0.00',totalBruto);
  lblSomatoriaImposto.Caption := FormatFloat('(-) #,##0.00',totalImposto);
  lblSomatoriaTotLiq.Caption  := FormatFloat('(=) #,##0.00',totalLiquido);

  totalBrutoAgrupado := totalBrutoAgrupado + totalBruto;
  totalImpostoAgrupado := totalImpostoAgrupado + totalImposto;
  totalLiquidoAgrupado := totalLiquidoAgrupado + totalLiquido;
end;

procedure TfrmRelHistoricoAbastecimentosAgrupado.lblResultadoAgrupadoAfterPrint(
  Sender: TObject);
begin
  totalBrutoPeriodo    := totalBrutoPeriodo   + totalBrutoAgrupado  ;
  totalLiquidoPeriodo  := totalLiquidoPeriodo + totalLiquidoAgrupado;
  totalImpostoPeriodo  := totalImpostoPeriodo + totalImpostoAgrupado;

  totalBrutoAgrupado   := 0;
  totalImpostoAgrupado := 0;
  totalLiquidoAgrupado := 0;
end;

procedure TfrmRelHistoricoAbastecimentosAgrupado.lblResultadoAgrupadoBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  lblResultadosDia.Caption    := 'Resultados para o Dia ' + lblDiaVenda.Caption;
  lblBrutoAgrupado.Caption    := FormatFloat('(+) #,##0.00', totalBrutoAgrupado);
  lblImpostoAgrupado.Caption  := FormatFloat('(-) #,##0.00', totalImpostoAgrupado);
  lblTotalLiqAgrupado.Caption := FormatFloat('(=) #,##0.00', totalLiquidoAgrupado);
end;

procedure TfrmRelHistoricoAbastecimentosAgrupado.ConfigurarPeriodo;
var
  frmSelecionarPeriodo: TfrmSelecionarPeriodo;
begin
  frmSelecionarPeriodo := TfrmSelecionarPeriodo.Create(Self);
  try
    frmSelecionarPeriodo.ShowModal;
    try
      if not frmSelecionarPeriodo.confirmado then
        self.Close;

      self.dataInicio := frmSelecionarPeriodo.dataInicio;
      Self.dataFim    := frmSelecionarPeriodo.dataFim;
    except
      on E:Exception do
      begin
        TMensagemHelper.MensagemErro('Erro ao imprimir relatório!', E);
      end;
    end;
  finally
    frmSelecionarPeriodo.Free;
  end;
end;

constructor TfrmRelHistoricoAbastecimentosAgrupado.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  totalBrutoPeriodo    := 0;
  totalLiquidoPeriodo  := 0;
  totalImpostoPeriodo  := 0;

  ConfigurarPeriodo;
end;

end.
