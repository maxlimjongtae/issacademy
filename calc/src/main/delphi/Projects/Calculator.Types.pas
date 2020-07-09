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
    FPriority: TOperatorPriority;

    function GetPriority: TOperatorPriority;
    function GetOperation: TOperation;
    function GetValue: string;
  public
    Constructor Create(const C: Char);
    Destructor Destroy; override;

    function ToString: string; override;
    function IsOpenBracket: Boolean;
    function isCloseBracket: Boolean;

    property Priority: TOperatorPriority read GetPriority write FPriority;
    property Operation: TOperation read GetOperation write FOperation;
    property Value: string read GetValue write FValue;
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

{ TOperand }

constructor TOperandToken.Create(const S: string);
begin
  try
    FValue := Integer.Parse(S);
  except
    raise Exception.Create('Cannot parse string to integer');
  end;
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
  FValue := C;

  case C of
    '+':
    begin
      FOperation :=
      function(L, R:Integer):Integer
      begin
        Result := L + R;
      end;

      FPriority := PLUS_MINUS;
    end;
    '-':
    begin
      FOperation :=
      function(L, R:Integer):Integer
      begin
        Result := L - R;
      end;

      FPriority := PLUS_MINUS;
    end;
    '*':
    begin
      FOperation :=
      function(L, R:Integer):Integer
      begin
        Result := L * R;
      end;

      FPriority := MULTIPLY_DIVIDE;
    end;
    '/':
    begin
      FOperation :=
      function(L, R:Integer):Integer
      begin
        Result := L div R;
      end;

      FPriority := MULTIPLY_DIVIDE;
    end;
    '(', ')':
    begin
      FPriority := BRACKET;
    end;
    else raise Exception.Create('Invalid operator.');
  end;
end;

destructor TOperatorToken.Destroy;
begin
  FOperation := nil;
  inherited;
end;

function TOperatorToken.GetOperation: TOperation;
begin
  Result := FOperation;
end;

function TOperatorToken.GetPriority: TOperatorPriority;
begin
  Result := FPriority;
end;

function TOperatorToken.GetValue: string;
begin
  Result := FValue;
end;

function TOperatorToken.isCloseBracket: Boolean;
begin
  if FValue.Equals(')') then
    Result := True
  else
    Result := False;
end;

function TOperatorToken.IsOpenBracket: Boolean;
begin
  if FValue.Equals('(') then
    Result := True
  else
    Result := False;
end;

function TOperatorToken.ToString: string;
begin
  Result := FValue;
end;

end.
