unit Token;

interface

uses
 SysUtils, System.Rtti;

type
  TTokenType = (Declaration, Variable, WhiteSpace, TypeDefinition, TypeValue,
    Definition, Value, Concat, StatementEnd, OpenBracket, CloseBracket,
    StringQuote, StringLiteral, StringType, IntegerType, FunctionType, Unknown);

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
    FValue: string;
  public
    constructor Create(Value: string; Row, Col: Integer);
    destructor Destroy; override;

    function ToString: string; override;

    property Position: TPosition read FPosition;
    property V: string read FValue;
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

function TToken.ToString: string;
begin
  Result := 'Value: '''+ V + ''', ' + Position.ToString;
end;

constructor TToken.Create(Value: string; Row, Col:Integer);
begin
  FValue := Value;
  FPosition := TPosition.Create(Row, Col);
end;

destructor TToken.Destroy;
begin
  FPosition.Free;
  inherited;
end;

end.
