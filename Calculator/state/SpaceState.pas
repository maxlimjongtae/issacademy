unit SpaceState;

interface

uses
  State, Tokenizer.Material, Calculator.Types;

type
  TSpaceState = class(TState)
  private
    function Handle(TokenizerMaterial: TTokenizerMaterial): TStateType; override;
    function GetType: TStateType; override;
  end;

implementation

{ TSpaceState }

function TSpaceState.GetType: TStateType;
begin
  Result := SPACE;
end;

function TSpaceState.Handle(TokenizerMaterial: TTokenizerMaterial): TStateType;
begin
  TokenizerMaterial.Next;

  Result := CONDITION;
end;

end.
