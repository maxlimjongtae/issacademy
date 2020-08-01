unit DebugPrinter;

interface

procedure Print(Msg: string);

implementation

uses
  Winapi.Windows;

procedure Print(Msg: string);
begin
  OutputDebugString(PChar(Msg));
end;

end.
