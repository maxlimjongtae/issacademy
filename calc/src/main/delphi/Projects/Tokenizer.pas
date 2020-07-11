unit Tokenizer;

interface

uses
  SysUtils, System.Generics.Collections,
  Token, Calculator.Types;

function Tokenize(Input: string): TList<TToken>;

implementation

function IsOperator(C: Char): Boolean;
begin
  case C of
    '+', '-', '*', '/', '(', ')': Result := True; // shr shl
    else Result := False;
  end;
end;

function Tokenize(Input: string): TList<TToken>;
var 
  C: Char;
  Operand: string;
begin
  Input := Input.Replace(' ', ''); //  StringReplace(Input, ' ', string.Empty, [rfReplaceAll]);
  Result := TObjectList<TToken>.Create;

  for C in Input do
  begin
    if IsOperator(C) then
    begin
      if Operand.Length > 0 then
      begin
        Result.Add(TOperandToken.Create(Operand));
        Operand := string.Empty;
      end;
        
      Result.Add(TOperatorToken.Create(C));
    end
    else
    begin
      Operand := Operand + C;  
    end;
  end;

  Result.Add(TOperandToken.Create(Operand));
end;

end.
