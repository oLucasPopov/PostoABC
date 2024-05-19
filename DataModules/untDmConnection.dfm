object dmConnection: TdmConnection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 294
  object connection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\lucas\Documents\Embarcadero\Studio\Projects\Po' +
        'stoABC\bd\POSTO.FDB'
      'User_Name=sysdba'
      'Password=123456789'
      'DriverID=FB')
    ConnectedStoredUsage = [auRunTime]
    Connected = False
    LoginPrompt = False
    Left = 32
    Top = 56
  end
  object transaction: TFDTransaction
    Connection = connection
    Left = 88
    Top = 56
  end
end
