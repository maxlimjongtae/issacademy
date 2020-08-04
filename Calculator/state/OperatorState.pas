unit OperatorState;

interface

uses
  State, Tokenizer.Material, Calculator.Types;

type
  TOperatorState = class(TState)
  private
    function Handle(TokenizerMaterial: TTokenizerMaterial): TStateType; override;
    function GetType: TStateType; override;
  end;

implementation

{ TOperatorState }

function TOperatorState.GetType: TStateType;
begin
  Result := OPERATOR;
end;

function TOperatorState.Handle(TokenizerMaterial: TTokenizerMaterial): TStateType;
begin
  TokenizerMaterial.TokenList.Add(TOperatorToken.Create(TokenizerMaterial.Peek));
  TokenizerMaterial.Next;

  Result := CONDITION;
end;

end.
