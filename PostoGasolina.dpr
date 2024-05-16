program PostoGasolina;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal},
  untCadAbastecimento in 'UI\untCadAbastecimento.pas' {frmCadAbastecimento},
  untDmConnection in 'DataModules\untDmConnection.pas' {dmConnection: TDataModule},
  untControllerNovoAbastecimento in 'Controllers\untControllerNovoAbastecimento.pas',
  untModelsAbastecimento in 'Models\untModelsAbastecimento.pas',
  untRepositoriosNovoAbastecimento in 'Repositories\untRepositoriosNovoAbastecimento.pas',
  untHelpersConversao in 'Helpers\untHelpersConversao.pas',
  untHelpersDB in 'Helpers\untHelpersDB.pas',
  untHelpersFormatacao in 'Helpers\untHelpersFormatacao.pas',
  untHelpersMensagem in 'Helpers\untHelpersMensagem.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConnection, dmConnection);
  Application.Run;
end.
