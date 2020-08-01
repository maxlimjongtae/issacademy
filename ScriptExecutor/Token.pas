unit Token;

interface

uses
 SysUtils, System.Rtti;

type
  TTokenType = (Declaration, Variable, WhiteSpace, TypeDefinition, TypeValue,
    Definition, Value, Concat, EndOfStatement, OpenBracket, CloseBracket,
    StringQuote, StringType, IntegerType, FunctionType);

  TIdentifier = class
  private
    FValue: string;
    FTokenType: TTokenType;
  public
    constructor Create(Value: string; TokenType: TTokenType);

    property V: string read FValue;
    property T: TTokenType read FTokenType;
  end;

  TPosition = class
  private
    FRow, FCol: Integer;
  public
    constructor Create(Row, Col: Integer);

    function ToString: string; override;

    property R: Integer read FRow;
    property C: Integer read FCol;
  end;

  TToken = class
  private
    FPosition: TPosition;
    FIdentifier: TIdentifier;

    function GetIdentifierValue: string;
    function GetTokenType: TTokenType;
  public
    constructor Create(Position: TPosition; Identifier: TIdentifier);
    destructor Destroy; override;

    function ToString: string; override;

    property Position: TPosition read FPosition;
    property V: string read GetIdentifierValue;
    property T: TTokenType read GetTokenType;
  end;

implementation

{ TIdentifier }

constructor TIdentifier.Create(Value: string; TokenType: TTokenType);
begin
  FValue := Value;
  FTokenType := TokenType;
end;

{ TPosition }

constructor TPosition.Create(Row, Col: Integer);
begin
  FRow := Row;
  FCol := Col;
end;

function TPosition.ToString: string;
begin
  Result := 'Line: '+ IntToStr(R) + ', Position: ' + IntToStr(C);
end;

{ TToken }

function TToken.GetIdentifierValue: string;
begin
  Result := FIdentifier.V;
end;

function TToken.ToString: string;
begin
  Result := 'Value: ' + V + ', Type: ' + TRttiEnumerationType.GetName<TTokenType>(T) + '\n' +Position.ToString;
end;

function TToken.GetTokenType: TTokenType;
begin
  Result := FIdentifier.T;
end;

constructor TToken.Create(Position: TPosition; Identifier: TIdentifier);
begin
  FPosition := Position;
  FIdentifier := Identifier;
end;

destructor TToken.Destroy;
begin
  FIdentifier.Free;
  FPosition.Free;
  inherited;
end;

end.
