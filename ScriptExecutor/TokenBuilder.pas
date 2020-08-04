unit TokenBuilder;

interface

uses
  SysUtils, System.Generics.Collections,
  Token, DebugPrinter;

type
  TTokenBuilder = class
  private const
    POSITION_START_INDEX: Integer = 0;
    POINTER_START_INDEX: Integer = 1;
  private
  var
    FPointer: PChar;
    FLine: TLine;
    FString: string;
    FTokenList: TList<TToken>;
    FPosition: Integer;
  public
    constructor Create(const Line: TLine);
    destructor Destroy; override;

    procedure Next;
    function Peek: Char;
    procedure Concat;
    procedure AddToken;
    procedure PrintTokenList;

    property TokenList: TList<TToken> read FTokenList;
  end;

implementation

{ TStringConsumer }

procedure TTokenBuilder.Concat;
begin
  FString := FString + Peek;
  Next;
end;

procedure TTokenBuilder.AddToken;
begin
  if not string.Empty.Equals(FString) then
  begin
    TokenList.Add(TToken.Create(FString, FLine.RowNumber,
      FPosition - FString.Length));
    FString := string.Empty;
  end;
end;

constructor TTokenBuilder.Create(const Line: TLine);
begin
  FLine := Line;
  FPosition := POSITION_START_INDEX;
  FPointer := Addr(FLine.Input[POINTER_START_INDEX]);
  FString := string.Empty;
  FTokenList := TList<TToken>.Create;
end;

destructor TTokenBuilder.Destroy;
begin
  FTokenList.Free;
  inherited;
end;

procedure TTokenBuilder.Next;
begin
  Inc(FPosition);
  Inc(FPointer);
end;

function TTokenBuilder.Peek: Char;
begin
  Result := FPointer^;
end;

procedure TTokenBuilder.PrintTokenList;
var
  I: Integer;
begin
  for I := 0 to TokenList.Count - 1 do
  begin
    Print('============================================================');
    Print(TokenList.Items[I].ToString);
  end;
end;

end.
