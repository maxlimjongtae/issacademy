unit InitState;

interface

uses
  SysUtils,
  State, Tokenizer.Material;

type
  TInitState = class(TState)
  private
    function Handle(TokenizerMaterial: TTokenizerMaterial): TStateType; override;
    function GetType: TStateType; override;
  end;

implementation

{ TInitState }

function TInitState.GetType: TStateType;
begin
  Result := INIT;
end;

function TInitState.Handle(TokenizerMaterial: TTokenizerMaterial): TStateType;
begin
  if Length(TokenizerMaterial.Input) < 1 then
    raise Exception.Create('Input is empty.')
  else
    Result := CONDITION;
end;

end.
