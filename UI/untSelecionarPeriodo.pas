unit untSelecionarPeriodo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  TfrmSelecionarPeriodo = class(TForm)
    edtDe: TMaskEdit;
    edtAte: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    btnCancelar: TButton;
    btnConfirmar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    dataInicio: TDate;
    dataFim: TDate;
    confirmado: Boolean;
  end;

var
  frmSelecionarPeriodo: TfrmSelecionarPeriodo;

implementation

{$R *.dfm}

procedure TfrmSelecionarPeriodo.btnCancelarClick(Sender: TObject);
begin
  confirmado := False;
  Close;
end;

procedure TfrmSelecionarPeriodo.btnConfirmarClick(Sender: TObject);
var
  fs: TFormatSettings;
begin
  confirmado := False;
  
  fs := TFormatSettings.Create();
  fs.DateSeparator := '/';
  fs.ShortDateFormat := 'dd/MM/yyyy';

  try
    dataInicio := StrToDateTime(edtDe.Text, fs);;
  except
    on E:Exception do
    begin
      edtDe.SetFocus;
      raise Exception.Create('Data de Início Inválida!');
    end;
  end;


  try  
    dataFim := StrToDateTime(edtAte.Text, fs);
  except    
    on E:Exception do
    begin
      edtAte.SetFocus;
      raise Exception.Create('Data Final Inválida!');
    end;
  end;   
     
  confirmado := True;
  Self.Close
end;

end.
