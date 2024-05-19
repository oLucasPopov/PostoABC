unit untLstHistoricoAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  untDmConnection, FireDAC.Phys.Intf, FireDAC.DApt.Intf;

type
  TfrmHistoricoAbastecimentos = class(TForm)
    grdVendas: TDBGrid;
    qryVendas: TFDQuery;
    dsVendas: TDataSource;
    qryVendasID: TIntegerField;
    qryVendasLITROS: TFMTBCDField;
    qryVendasPRECO_LITRO: TFMTBCDField;
    qryVendasDESCRICAO_TANQUE: TStringField;
    qryVendasDESCRICAO_BOMBA: TStringField;
    qryVendasTOTAL_BRUTO: TFMTBCDField;
    qryVendasDEDUCAO_IMPOSTO: TFMTBCDField;
    qryVendasTOTAL_LIQUIDO: TFMTBCDField;
    qryVendasDATAHORA_TRANSACAO: TSQLTimeStampField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoricoAbastecimentos: TfrmHistoricoAbastecimentos;

implementation

{$R *.dfm}

end.
