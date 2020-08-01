unit ScriptException;

interface

uses
  SysUtils;

type
  TScriptException = class(Exception)
  private
    FLine, FPosition: Integer;

  public
    constructor Create(Line, Position: Integer);
  end;

implementation


{ TScriptException }

constructor TScriptException.Create(Line, Position: Integer);
begin
  FLine := Line;
  FPosition := Position;
end;

end.
