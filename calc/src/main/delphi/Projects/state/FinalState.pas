unit FinalState;

interface

uses 
  SysUtils,
  State, Tokenizer.Material;

type
  TFinalState = class(TState)
  private
    function Handle(TokenizerMaterial: TTokenizerMaterial): TStateType; override;
    function GetType: TStateType; override;
  end;

implementation

{ TFinalState }

function TFinalState.GetType: TStateType;
begin
  Result := FINAL;
end;

function TFinalState.Handle(TokenizerMaterial: TTokenizerMaterial): TStateType;
begin
  raise Exception.Create('State is final.');
end;

end.
