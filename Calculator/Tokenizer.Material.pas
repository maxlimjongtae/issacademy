unit Tokenizer.Material;

interface

uses
  System.Generics.Collections,
  Token;

type
  TTokenizerMaterial = class
  private const
    DEFAULT_INDEX = 1;
  private var
    FTokenList: TList<TToken>;
    FInputPointer: PChar;
    FInput: string;
  private
    function GetTokenList: TList<TToken>;
    function GetInputPointer: PChar;
    function GetInput: string;
  public
     constructor Create(Input: string);
     destructor Destory;

     procedure Next;
     function Peek: Char;

     property TokenList: TList<TToken> read GetTokenList write FTokenList;
     property InputPointer: PChar read GetInputPointer write FInputPointer;
     property Input: string read GetInput write FInput;
  end;

implementation

{ TTokenMaterial }

constructor TTokenizerMaterial.Create(Input: string);
begin
  FTokenList := TObjectList<TToken>.Create;
  FInput := Input;
  FInputPointer := Addr(FInput[DEFAULT_INDEX]);
end;

destructor TTokenizerMaterial.Destory;
begin
  FTokenList.Free;
  inherited;
end;

function TTokenizerMaterial.GetInput: string;
begin
  Result := FInput;
end;

function TTokenizerMaterial.GetInputPointer: PChar;
begin
  Result := FInputPointer;
end;

function TTokenizerMaterial.GetTokenList: TList<TToken>;
begin
  Result := FTokenList;
end;

procedure TTokenizerMaterial.Next;
begin
  Inc(FInputPointer);
end;

function TTokenizerMaterial.Peek: Char;
begin
  Result := FInputPointer^;
end;

end.
