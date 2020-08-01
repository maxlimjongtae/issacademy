unit CloseBracketState;

interface

uses
  State, Tokenizer.Material, Calculator.Types;

type
  TCloseBracketState = class(TState)
  private
    function Handle(TokenizerMaterial: TTokenizerMaterial): TStateType; override;
    function GetType: TStateType; override;
  end;

implementation

{ TCloseBracketState }

function TCloseBracketState.GetType: TStateType;
begin
  Result := State.CLOSE_BRACKET;
end;

function TCloseBracketState.Handle(TokenizerMaterial: TTokenizerMaterial): TStateType;
begin
  TokenizerMaterial.TokenList.Add(TOperatorToken.Create(TokenizerMaterial.Peek));
  TokenizerMaterial.Next;

  Result := CONDITION;
end;

end.
