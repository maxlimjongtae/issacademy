unit Tokenizer;

interface

uses
  SysUtils, System.Generics.Collections,
  Token, Tokenizer.Material, Calculator.Types,
  State, InitState, FinalState, OperandState, OperatorState, OpenBracketState, CloseBracketState, ConditionState;

type
  TTokenizer = class
  private const
    DEFAULT_STATE_TYPE = INIT;
  private var
    FStateMap: TDictionary<TStateType, IState>;
  public
    constructor Create;
    destructor Destroy; override;

    function Tokenize(Input: string): TList<TToken>;
  end;
implementation

{ TTokenizer }

constructor TTokenizer.Create;
begin
  FStateMap := TDictionary<TStateType, IState>.Create;
  FStateMap.Add(INIT, TInitState.Create);
  FStateMap.Add(FINAL, TFinalState.Create);
  FStateMap.Add(OPERAND, TOperandState.Create);
  FStateMap.Add(OPERATOR, TOperatorState.Create);
  FStateMap.Add(OPEN_BRACKET, TOpenBracketState.Create);
  FStateMap.Add(CLOSE_BRACKET, TCloseBracketState.Create);
  FStateMap.Add(CONDITION, TConditionState.Create);
end;

destructor TTokenizer.Destroy;
begin
  FStateMap.Free;
  inherited;
end;

function TTokenizer.Tokenize(Input: string): TList<TToken>;
var
  CurrentState: IState;
  TokenizerMaterial: TTokenizerMaterial;
begin
  CurrentState := FStateMap.Items[DEFAULT_STATE_TYPE];
  TokenizerMaterial := TTokenizerMaterial.Create(Input);

  try
    repeat
      CurrentState := FStateMap.Items[CurrentState.Handle(TokenizerMaterial)];
    until CurrentState.GetType = FINAL;

    Result := TokenizerMaterial.TokenList;
  finally
    TokenizerMaterial.Free;
  end;
end;

end.
