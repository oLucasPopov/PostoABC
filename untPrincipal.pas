unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, untCadAbastecimento,
  Vcl.Buttons, untRelHistoricoAbastecimentosAgrupado, untCadAlterarPrecos;

type
  TfrmPrincipal = class(TForm)
    btnCadastrarAbastecimento: TButton;
    btnRelatorio: TButton;
    btnAlterarPrecos: TButton;
    procedure btnCadastrarAbastecimentoClick(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure btnAlterarPrecosClick(Sender: TObject);
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
