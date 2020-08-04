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

  TLine = class
  private
    FLineNumber: Integer;
    FInput: string;
  public
    constructor Create(LineNumber: Integer; Input: string);

    property RowNumber: Integer read FLineNumber;
    property Input: string read FInput;
  end;

  TLinePos = class
  private
    FLine, FPos: Integer;
  public
    constructor Create(Row, Col: Integer);

    function ToString: string; override;

    property Line: Integer read FLine;
    property Pos: Integer read FPos;
  end;

  TToken = class
  private
    FPosition: TLinePos;
    FValue: string;
  public
    constructor Create(Value: string; Row, Col: Integer);
    destructor Destroy; override;

    function ToString: string; override;

    property Position: TLinePos read FPosition;
    property V: string read FValue;
  end;

implementation

{ TIdentifier }

constructor TIdentifier.Create(Value: string; TokenType: TTokenType);
begin
  FValue := Value;
  FTokenType := TokenType;
end;

{ TLine }

constructor TLine.Create(LineNumber: Integer; Input: string);
begin
  FLineNumber := LineNumber;
  FInput := Input;
end;

{ TLinePos }

constructor TLinePos.Create(Row, Col: Integer);
begin
  FLine := Row;
  FPos := Col;
end;

function TLinePos.ToString: string;
begin
  Result := 'Line: '+ IntToStr(Line) + ', Pos: ' + IntToStr(Pos);
end;

{ TToken }

function TToken.ToString: string;
begin
  Result := 'Value: '''+ V + ''', ' + Position.ToString;
end;

constructor TToken.Create(Value: string; Row, Col:Integer);
begin
  FValue := Value;
  FPosition := TLinePos.Create(Row, Col);
end;

destructor TToken.Destroy;
begin
  FPosition.Free;
  inherited;
end;

end.
