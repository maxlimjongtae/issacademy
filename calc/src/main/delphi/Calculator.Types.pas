unit Calculator.Types;

interface

uses
  SysUtils,
  Token;

type
  TOperand = class(TToken)
    private var
      Value: Integer;
    protected
      function ToString(): string; override;
    public
      Constructor Create(S: string);
  end;

implementation

{ TOperand }


constructor TOperand.Create(S: string);
begin
  Value := Integer.Parse(S);
end;

function TOperand.ToString: string;
begin
  Result := IntToStr(Value);
end;

end.
