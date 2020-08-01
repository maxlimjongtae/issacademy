unit ConditionState;

interface

uses
  State, Tokenizer.Material;

type
  TConditionState = class(TState)
  private
    function Handle(TokenizerMaterial: TTokenizerMaterial): TStateType; override;
    function GetType: TStateType; override;
  end;

implementation

function IsOperator(C: Char): Boolean;
begin
  case C of
    '+', '-', '*', '/': Result := True; // shr shl
    else Result := False;
  end;
end;

function IsOpenBracket(C: Char): Boolean;
begin
  Result := C = '(';
end;

function IsCloseBracket(C: Char): Boolean;
begin
  Result := C = ')';
end;

function IsSpace(C: Char): Boolean;
begin
  Result := C = ' ';
end;

{ TConditionState }

function TConditionState.GetType: TStateType;
begin
  Result := CONDITION;
end;

function TConditionState.Handle(TokenizerMaterial: TTokenizerMaterial): TStateType;
var C: Char;
begin
  C := TokenizerMaterial.Peek;

  if C <> #0 then
  begin
    if IsOperator(C) then
      Result := OPERATOR
    else if IsSpace(C) then
      Result := SPACE
    else if IsCloseBracket(C) then
      Result := CLOSE_BRACKET
    else if IsOpenBracket(C) then
      Result := OPEN_BRACKET
    else
      Result := OPERAND;
  end
  else
    Result := FINAL;
end;

end.
