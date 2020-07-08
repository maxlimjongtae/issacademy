unit Calculator.Types;

interface

uses
  SysUtils,
  Token;

type
  TOperatorPriority = (PLUS_MINUS, MULTIPLY_DIVIDE, BRACKET);
  TOperation = reference to function(L, R: Integer): Integer;

  TOperatorToken = class(TToken)
  private
    FValue: string;
    FOperation: TOperation;
    FOperationPriority: TOperatorPriority;
  public
    Constructor Create(const S: string);
    function ToString(): string; override;
  end;

  TOperandToken = class(TToken)
  private
    FValue: Integer;
  public
    Constructor Create(const S: string);
    function ToString(): string; override;
  end;

implementation

{ TOperand }

constructor TOperandToken.Create(const S: string);
begin
  try
    FValue := Integer.Parse(S);
  except
    raise Exception.Create('Cannot parse string to integer');
  end;
end;

function TOperandToken.ToString: string;
begin
  Result := IntToStr(FValue);
end;

{ TOperatorToken }

constructor TOperatorToken.Create(const S: string);
begin
  FValue := S;

  case S[1] of
    '+':
    begin
      FOperation :=
      function(L, R:Integer):Integer
      begin
        Result := L + R;
      end;

      FOperationPriority := PLUS_MINUS;
    end;
    '-':
    begin
      FOperation :=
      function(L, R:Integer):Integer
      begin
        Result := L - R;
      end;

      FOperationPriority := PLUS_MINUS;
    end;
    '*':
      begin
        FOperation :=
        function(L, R:Integer):Integer
        begin
          Result := L * R;
        end;

        FOperationPriority := MULTIPLY_DIVIDE;
      end;
    '/':
      begin
        FOperation :=
        function(L, R:Integer):Integer
        begin
          Result := L div R;
        end;

        FOperationPriority := MULTIPLY_DIVIDE;
      end
    else raise Exception.Create('Invalid Operator');
  end;
end;

function TOperatorToken.ToString: string;
begin
  Result := FValue;
end;

end.
