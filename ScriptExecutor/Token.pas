unit Token;

interface

uses
  Identifier;

type
  TPosition = class
  private
    FRow, FCol: Integer;
  public
    constructor Create(Row, Col);

    property R: Integer read FRow;
    property C: Integer read FCol;
  end;

  TToken = class
  private
    FPosition: TPosition;
    FIdentifier: TIdentifier;
    function GetIdentifierValue: string;
  public
    constructor Create(Position: TPosition; Identifier: TIdentifier);
    destructor Destroy; override;

    property Position: TPosition read FPosition;
    property V: string read GetIdentifierValue;
  end;

implementation

{ TPosition }

constructor TPosition.Create(Row, Col: Integer);
begin
  FRow := Row;
  FCol := Col;
end;

{ TToken }

function TToken.GetIdentifierValue;
begin
  Result := FIdentifier.V;
end;

constructor TToken.Create(Position: TPosition; Identifier: TIdentifier);
begin
  FPosition := Position;
  FIdentifier := Identifier;
end;

end.
