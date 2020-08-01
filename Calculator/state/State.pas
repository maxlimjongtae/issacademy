unit State;

interface

uses
  Tokenizer.Material;

type
  TStateType = (INIT, FINAL, OPERAND, OPERATOR, OPEN_BRACKET, CLOSE_BRACKET, CONDITION, SPACE);

  IState = interface['{1B03FBA3-E3FD-4767-9AB8-DDB79B802995}']
    function Handle(TokenizerMaterial: TTokenizerMaterial): TStateType;
    function GetType: TStateType;
  end;

  TState = class abstract(TInterfacedObject, IState)
  protected
    function Handle(TokenizerMaterial: TTokenizerMaterial): TStateType; virtual; abstract;
    function GetType: TStateType; virtual; abstract;
  end;

implementation

end.
