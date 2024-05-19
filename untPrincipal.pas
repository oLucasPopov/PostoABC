unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, untCadAbastecimento,
  Vcl.Buttons, untRelHistoricoAbastecimentosAgrupado, untCadAlterarPrecos,
  untLstHistoricoAbastecimentos;

type
  TfrmPrincipal = class(TForm)
    btnCadastrarAbastecimento: TButton;
    btnRelatorio: TButton;
    btnAlterarPrecos: TButton;
    btnHistoricoAbastecimentos: TButton;
    procedure btnCadastrarAbastecimentoClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure btnAlterarPrecosClick(Sender: TObject);
    procedure btnHistoricoAbastecimentosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnAlterarPrecosClick(Sender: TObject);
var
  frmCadAlterarPrecos: TfrmCadAlterarPrecos;
begin
 frmCadAlterarPrecos := TfrmCadAlterarPrecos.Create(Self);
 try
   frmCadAlterarPrecos.ShowModal;
 finally
   frmCadAlterarPrecos.Free;
 end;
end;

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

procedure TfrmPrincipal.btnHistoricoAbastecimentosClick(Sender: TObject);
var
  frmHistoricoAbastecimentos: TfrmHistoricoAbastecimentos;
begin
  frmHistoricoAbastecimentos := TfrmHistoricoAbastecimentos.Create(Self);
  try
    frmHistoricoAbastecimentos.ShowModal;
  finally
    frmHistoricoAbastecimentos.Free;
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
