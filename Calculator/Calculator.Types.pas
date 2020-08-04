unit Calculator.Types;

interface

uses
  SysUtils, System.Rtti, TypInfo,
  Token;

type
  TOperatorPriority = (PLUS_MINUS, MULTIPLY_DIVIDE, BRACKET);
  TOperatorType = (PLUS, MINUS, MULTIPLY, DIVIDE, OPEN_BRACKET, CLOSE_BRACKET);

  TBinaryOperation = class
    public class function Operation(OperatorType: TOperatorType; L, R: Integer): Integer; static;
  end;

  TOperatorToken = class(TToken)
  private
    FValue: TOperatorType;
    FPriority: TOperatorPriority;

    function GetPriority: TOperatorPriority;
    function GetValue: TOperatorType;
  public
    Constructor Create(const C: Char);

    function ToString: string; override;
    function IsOpenBracket: Boolean;
    function IsCloseBracket: Boolean;

    property Priority: TOperatorPriority read GetPriority write FPriority;
    property Value: TOperatorType read GetValue write FValue;
  end;

  TOperandToken = class(TToken)
  private
    FValue: Integer;

    function GetValue: Integer;
  public
    Constructor Create(const S: string);

    function ToString: string; override;

    property Value: Integer read GetValue write FValue;
  end;

implementation

function OperatorTypeToStr(Value: TOperatorType): String;
begin
  Result := TRttiEnumerationType.GetName<TOperatorType>(Value);
end;

{ TOperand }

constructor TOperandToken.Create(const S: string);
begin
  if not TryStrToInt(S, FValue) then
    raise Exception.Create('Cannot parse string to integer');
end;

function TOperandToken.GetValue: Integer;
begin
  Result := FValue;
end;

function TOperandToken.ToString: string;
begin
  Result := IntToStr(FValue);
end;

{ TOperatorToken }

constructor TOperatorToken.Create(const C: Char);
begin
  case C of
    '+':
    begin
      FValue := PLUS;
      FPriority := PLUS_MINUS;
    end;
    '-':
    begin
      FValue := MINUS;
      FPriority := PLUS_MINUS;
    end;
    '*':
    begin
      FValue := MULTIPLY;
      FPriority := MULTIPLY_DIVIDE;
    end;
    '/':
    begin
      FValue := DIVIDE;
      FPriority := MULTIPLY_DIVIDE;
    end;
    '(':
    begin
      FValue := OPEN_BRACKET;
      FPriority := BRACKET;
    end;
    ')':
    begin
      FValue := CLOSE_BRACKET;
      FPriority := BRACKET;
    end
    else raise Exception.Create('Invalid operator.');
  end;
end;

function TOperatorToken.GetPriority: TOperatorPriority;
begin
  Result := FPriority;
end;

function TOperatorToken.GetValue: TOperatorType;
begin
  Result := FValue;
end;

function TOperatorToken.ToString: string;
begin
  Result := OperatorTypeToStr(FValue);
end;

function TOperatorToken.IsCloseBracket: Boolean;
begin
  Result := FValue = CLOSE_BRACKET;
end;

function TOperatorToken.IsOpenBracket: Boolean;
begin
  Result := FValue = OPEN_BRACKET;
end;

{ TOperation }

class function TBinaryOperation.Operation(OperatorType: TOperatorType; L, R: Integer): Integer;
begin
  case OperatorType of
    PLUS:
      Result := L + R;
    MINUS:
      Result := L - R;
    MULTIPLY:
      Result := L * R;
    DIVIDE:
      Result := L div R;
    else raise Exception.Create('Invalid operator type.');
  end;
end;

end.
