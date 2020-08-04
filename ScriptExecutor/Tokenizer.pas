unit Tokenizer;

interface

uses
  System.Generics.Collections,
  Line, TokenBuilder, TokenState;

type
  TTokenizer = class
  private
    FTokenStateMap: TDictionary<TTokenStateType, ITokenState>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Tokenize(const Line: TLine);
  end;

implementation

{ TTokenizer }

constructor TTokenizer.Create;
begin
  FTokenStateMap := TDictionary<TTokenStateType, ITokenState>.Create;
  FTokenStateMap.Add(TTokenStateType.Init, TInitTokenState.Create);
  FTokenStateMap.Add(TTokenStateType.Final, TFinalTokenState.Create);
  FTokenStateMap.Add(TTokenStateType.Branch, TBranchTokenState.Create);
  FTokenStateMap.Add(TTokenStateType.Identifier, TIdentifierTokenState.Create);
  FTokenStateMap.Add(TTokenStateType.Concat, TConcatTokenState.Create);
end;

destructor TTokenizer.Destroy;
begin
  FTokenStateMap.Free;
  inherited;
end;

procedure TTokenizer.Tokenize(const Line: TLine);
const
  INIT_STATE = TTokenStateType.Init;
var
  TokenBuilder: TTokenBuilder;
  CurrentState: ITokenState;
begin
  TokenBuilder := TTokenBuilder.Create(Line);
  CurrentState := FTokenStateMap.Items[INIT_STATE];

  try
    while CurrentState.GetType <> TTokenStateType.Final do
      CurrentState := FTokenStateMap.Items[CurrentState.Handle(TokenBuilder)];

    TokenBuilder.PrintTokenList;
  finally
    TokenBuilder.Free;
  end;
end;

end.
