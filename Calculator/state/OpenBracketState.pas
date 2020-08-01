unit OpenBracketState;

interface

uses
  State, Tokenizer.Material, Calculator.Types;

type
  TOpenBracketState = class(TState)
  private
    function Handle(TokenizerMaterial: TTokenizerMaterial): TStateType; override;
    function GetType: TStateType; override;
  end;

implementation

{ TOpenBracketState }

function TOpenBracketState.GetType: TStateType;
begin
  Result := State.OPEN_BRACKET;
end;

function TOpenBracketState.Handle(TokenizerMaterial: TTokenizerMaterial): TStateType;
begin
  TokenizerMaterial.TokenList.Add(TOperatorToken.Create(TokenizerMaterial.Peek));
  TokenizerMaterial.Next;

  Result := CONDITION;
end;

end.
