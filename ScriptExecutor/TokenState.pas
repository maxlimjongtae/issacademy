unit TokenState;

interface

uses
  SysUtils,
  TokenBuilder;

type
  TTokenStateType = (Init, Final, Branch, Identifier, Concat, Literal);

  ITokenState = interface
    ['{67F5ED01-EAA2-4F70-A48A-927C24DA2EDD}']
    function GetType: TTokenStateType;
    function Handle(TokenBuilder: TTokenBuilder): TTokenStateType;
  end;

  TTokenState = class abstract(TInterfacedObject, ITokenState)
  protected
    function GetType: TTokenStateType; virtual; abstract;
    function Handle(TokenBuilder: TTokenBuilder): TTokenStateType;
      virtual; abstract;
  end;

  TInitTokenState = class(TTokenState)
  private
    function GetType: TTokenStateType; override;
    function Handle(TokenBuilder: TTokenBuilder): TTokenStateType; override;
  end;

  TFinalTokenState = class(TTokenState)
  private
    function GetType: TTokenStateType; override;
    function Handle(TokenBuilder: TTokenBuilder): TTokenStateType; override;
  end;

  TBranchTokenState = class(TTokenState)
  private
    function GetType: TTokenStateType; override;
    function Handle(TokenBuilder: TTokenBuilder): TTokenStateType; override;
  end;

  TIdentifierTokenState = class(TTokenState)
  private
    function GetType: TTokenStateType; override;
    function Handle(TokenBuilder: TTokenBuilder): TTokenStateType; override;
  end;

  TConcatTokenState = class(TTokenState)
  private
    function GetType: TTokenStateType; override;
    function Handle(TokenBuilder: TTokenBuilder): TTokenStateType; override;
  end;

  TLiteralTokenState = class(TTokenState)
  private
    function GetType: TTokenStateType; override;
    function Handle(TokenBuilder: TTokenBuilder): TTokenStateType; override;
  end;

implementation

function IsIdentifier(C: Char): Boolean;
begin
  case C of
    ' ', ';', '=', ':', '''', '+', '(', ')':
      Result := True;
  else
    Result := False;
  end;
end;

function IsSingleQuote(C: Char): Boolean;
begin
  Result := '''' = C;
end;

{ TInitState }

function TInitTokenState.GetType: TTokenStateType;
begin
  Result := Init;
end;

function TInitTokenState.Handle(TokenBuilder: TTokenBuilder): TTokenStateType;
begin
  Result := Branch;
end;

{ TIdentifierState }

function TIdentifierTokenState.GetType: TTokenStateType;
begin
  Result := Identifier;
end;

function TIdentifierTokenState.Handle(TokenBuilder: TTokenBuilder)
  : TTokenStateType;
begin
  TokenBuilder.AddToken;

  if IsSingleQuote(TokenBuilder.Peek) then
    Result := Literal
  else
  begin
    TokenBuilder.Concat;
    TokenBuilder.AddToken;
    Result := Branch;
  end;

end;

{ TFinalState }

function TFinalTokenState.GetType: TTokenStateType;
begin
  Result := Final;
end;

function TFinalTokenState.Handle(TokenBuilder: TTokenBuilder): TTokenStateType;
begin
  raise Exception.Create('State is ended!');
end;

{ TBranchState }

function TBranchTokenState.GetType: TTokenStateType;
begin
  Result := Branch;
end;

function TBranchTokenState.Handle(TokenBuilder: TTokenBuilder): TTokenStateType;
var
  C: Char;
begin
  C := TokenBuilder.Peek;
  if C <> #0 then
  begin
    if IsIdentifier(C) then
      Result := Identifier
    else
      Result := Concat;
  end
  else
    Result := Final;
end;

{ TConcatState }

function TConcatTokenState.GetType: TTokenStateType;
begin
  Result := Concat;
end;

function TConcatTokenState.Handle(TokenBuilder: TTokenBuilder): TTokenStateType;
begin
  TokenBuilder.Concat;
  Result := Branch;
end;

{ TLiteralState }

function TLiteralTokenState.GetType: TTokenStateType;
begin
  Result := Literal;
end;

function TLiteralTokenState.Handle(TokenBuilder: TTokenBuilder)
  : TTokenStateType;
begin
  TokenBuilder.Concat;

  while not IsSingleQuote(TokenBuilder.Peek) do
    TokenBuilder.Concat;

  TokenBuilder.Concat;

  if IsSingleQuote(TokenBuilder.Peek) then
    Result := Literal
  else
    Result := Branch;
end;

end.
