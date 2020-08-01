unit Tokenizer;

interface

uses
  SysUtils, System.Generics.Collections,
  DebugPrinter, Token;

type
  TTokenizer = class
  private
    FIdentifierMap: TDictionary<String, TIdentifier>;

    function IsIdentifier(S: string): Boolean;
    function IsNotEmpty(S: string): Boolean;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Tokenize(Line: string);
  end;

implementation

{ TTokenizer }

constructor TTokenizer.Create;
var
  IdentifierList: TList<TIdentifier>;
  I: Integer;
begin
  FIdentifierMap := TObjectDictionary<String, TIdentifier>.Create;
  IdentifierList := TList<TIdentifier>.Create;

  try
    IdentifierList.Add(TIdentifier.Create('var', TTokenType.Declaration));
    IdentifierList.Add(TIdentifier.Create(' ', TTokenType.WhiteSpace));
    IdentifierList.Add(TIdentifier.Create(';', TTokenType.StatementEnd));
    IdentifierList.Add(TIdentifier.Create('=', TTokenType.Definition));
    IdentifierList.Add(TIdentifier.Create(':', TTokenType.TypeDefinition));
    IdentifierList.Add(TIdentifier.Create('''', TTokenType.StringQuote));
    IdentifierList.Add(TIdentifier.Create('Integer', TTokenType.IntegerType));
    IdentifierList.Add(TIdentifier.Create('string', TTokenType.StringType));
    IdentifierList.Add(TIdentifier.Create('Write', TTokenType.FunctionType));
    IdentifierList.Add(TIdentifier.Create('WriteLn', TTokenType.FunctionType));
    IdentifierList.Add(TIdentifier.Create('+', TTokenType.Concat));
    IdentifierList.Add(TIdentifier.Create('(', TTokenType.OpenBracket));
    IdentifierList.Add(TIdentifier.Create(')', TTokenType.CloseBracket));

    for I := 0 to IdentifierList.Count - 1 do
    begin
      FIdentifierMap.Add(IdentifierList.Items[I].V, IdentifierList.Items[I]);
    end;
  finally
    IdentifierList.Free;
  end;
end;

destructor TTokenizer.Destroy;
begin
  FIdentifierMap.Free;
  inherited;
end;

function TTokenizer.IsIdentifier(S: string): Boolean;
begin
  Result := FIdentifierMap.ContainsKey(S);
end;

function TTokenizer.IsNotEmpty(S: string): Boolean;
begin
  Result := not string.Empty.Equals(S);
end;

procedure TTokenizer.Tokenize(Line: string);
const
  TEMP_ROW = 1;
var
  TokenList: TList<TToken>;
  CharArr: TArray<Char>;
  S: string;
  C: Char;
  I: Integer;
begin
  TokenList := TObjectList<TToken>.Create;
  try
    CharArr := Line.ToCharArray;
    S := string.Empty;

    for I := 0 to Length(CharArr) - 1 do
    begin
      C := CharArr[I];

      if IsIdentifier(C) then
      begin
        if IsNotEmpty(S) then
        begin
          if IsIdentifier(S) then
            TokenList.Add(TToken.Create(TEMP_ROW, I - S.Length, FIdentifierMap.Items[S]))
          else
            TokenList.Add(TToken.Create(TEMP_ROW, I - S.Length, TIdentifier.Create(S, TTokenType.Unknown)));

          S := string.Empty;
        end;
        TokenList.Add(TToken.Create(TEMP_ROW, I, FIdentifierMap.Items[C]))
      end
      else
        S := S + C;
    end;

    for I := 0 to TokenList.Count - 1 do
    begin
      Print('================================================================');
      Print(TokenList.Items[I].ToString);
    end;
  finally
    TokenList.Free;
  end;
end;

end.
