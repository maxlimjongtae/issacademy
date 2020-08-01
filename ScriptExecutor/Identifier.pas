unit Identifier;

interface

type
  TIdentifier = class
  private
    FValue: string;
  public
    constructor Create(Value: string);

    property V: string read FValue;
  end;

implementation

{ TIdentifier }

constructor TIdentifier.Create(Value: string);
begin
  FValue := Value;
end;

end.
