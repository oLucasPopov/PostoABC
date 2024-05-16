unit untDmConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, Data.DbxSqlite, Data.SqlExpr, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef;

type
  TdmConnection = class(TDataModule)
    connection: TFDConnection;
    transaction: TFDTransaction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConnection: TdmConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
