unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, untCadAbastecimento,
  Vcl.Buttons, untRelHistoricoAbastecimentosAgrupado;

type
  TfrmPrincipal = class(TForm)
    btnCadastrarAbastecimento: TButton;
    btnRelatorio: TButton;
    procedure btnCadastrarAbastecimentoClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCadastrarAbastecimentoClick(Sender: TObject);
var
  formAbastecimento: TfrmCadAbastecimento;
begin
  formAbastecimento := TfrmCadAbastecimento.Create(Self);
  try
    formAbastecimento.showModal;
  finally
    formAbastecimento.Free
  end;
end;

procedure TfrmPrincipal.btnRelatorioClick(Sender: TObject);
var
  relatorio: TfrmRelHistoricoAbastecimentosAgrupado;
begin
  relatorio := TfrmRelHistoricoAbastecimentosAgrupado.Create(Self);
  try
    relatorio.Imprimir;
  finally
    relatorio.Free;
  end;
end;

end.
