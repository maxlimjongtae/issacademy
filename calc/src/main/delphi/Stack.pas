unit Stack;

interface

uses
  SysUtils,
  System.classes, System.Generics.Collections;

type
  TStack<T: class> = class
    private const
      UNDERFLOW = -1;
    var
      FTop: Integer;
      FList: TArray<T>;
    public
      procedure Push(Node: T);
      function Pop(): T;
      function Peek(): T;
      function IsEmpty(): boolean;

      constructor Create;
      destructor Destroy; override;
  end;

implementation

{ TStack<T> }

constructor TStack<T>.Create;
begin
  Ftop := UNDERFLOW;
  SetLength(FList, 128);
end;

destructor TStack<T>.Destroy;
begin
  SetLength(FList, 0);
  inherited;
end;

function TStack<T>.IsEmpty: boolean;
begin
  Result := FTop > UNDERFLOW;
end;

function TStack<T>.Peek: T;
begin
  if not(IsEmpty()) then
  begin
    raise Exception.Create('Stack is empty');
  end
  else
  begin
    Result := FList[FTop];
  end;
end;

function TStack<T>.Pop: T;
var
  Node: T;
begin
  Node := self.Peek();

  //FList[FTop];
  Dec(FTop);

  Result := Node;
end;

procedure TStack<T>.Push(Node: T);
begin
  Inc(FTop);

  FList[FTop] := Node;
end;

end.
