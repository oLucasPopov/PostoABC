unit untHelpersDB;

interface

uses FireDAC.Comp.Client, untDmConnection;

type
  THelperDB = class
    class function CriarQuery: TFDQuery;
  end;

implementation

{ TDBHelper }

class function THelperDB.CriarQuery: TFDQuery;
begin
  Result := TFDQuery.Create(dmConnection);

  Result.Connection := dmConnection.connection;
  Result.Transaction := dmConnection.transaction;
end;

end.
