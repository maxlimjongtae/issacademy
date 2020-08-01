unit OperandState;

interface

uses
  State, Calculator.Types, Tokenizer.Material;

type
  TOperandState = class(TState)
  private
    function Handle(TokenizerMaterial: TTokenizerMaterial): TStateType; override;
    function GetType: TStateType; override;
  end;

implementation

{ TOperandState }

function IsOperand(C: Char): Boolean;
begin
  case C of
    '0'..'9': Result := True; // shr shl
    else Result := False;
  end;
end;

function TOperandState.GetType: TStateType;
begin
  Result := OPERAND;
end;

function TOperandState.Handle(TokenizerMaterial: TTokenizerMaterial): TStateType;
var
  Operand: string;
  C: Char;
begin
  C := TokenizerMaterial.Peek;
  Operand := '';

  repeat
    Operand := Operand + C;
    TokenizerMaterial.Next;
    C := TokenizerMaterial.Peek;
  until not IsOperand(C);

  TokenizerMaterial.TokenList.Add(TOperandToken.Create(Operand));

  Result := CONDITION;
end;

end.
