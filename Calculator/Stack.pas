unit Stack;

interface

uses
  SysUtils,
  System.classes, System.Generics.Collections;

type
  TStack<T: class> = class
  private const
    UNDERFLOW = -1;
    LIST_MAX_SIZE = 128;
  private
    FTop: Integer;
    FList: TArray<T>;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Push(const Node: T);
    function Pop: T;
    function Peek: T;
    function IsEmpty: Boolean;
  end;

implementation

{ TStack<T> }

constructor TStack<T>.Create;
begin
  FTop := UNDERFLOW;
  SetLength(FList, LIST_MAX_SIZE);
end;

destructor TStack<T>.Destroy;
begin
  SetLength(FList, 0);
  inherited;
end;

function TStack<T>.IsEmpty: Boolean;
begin
  Result := FTop <= UNDERFLOW;
end;

function TStack<T>.Peek: T;
begin
  if IsEmpty then
  begin
    raise Exception.Create('Stack is empty.');
  end
  else
  begin
    Result := FList[FTop];
  end;
end;

function TStack<T>.Pop: T;
begin
  Result := Peek;
  Dec(FTop);
end;

procedure TStack<T>.Push(const Node: T);
begin
  Inc(FTop);
  FList[FTop] := Node;
end;

end.
