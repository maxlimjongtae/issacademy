unit DebugPrinter;

interface

uses
  Winapi.Windows;

procedure Print(Msg: string);

implementation

procedure Print(Msg: string);
begin
  OutputDebugString(PChar(Msg));
end;

end.
