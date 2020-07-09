unit Tokenizer;

interface

uses
  SysUtils, System.Generics.Collections,
  Token, Calculator.Types;

function Tokenize(Input: string): TObjectList<TToken>;

implementation

function IsOperator(C: Char): Boolean;
begin
  case C of
    '+', '-', '*', '/', '(', ')': Result := True;
    else Result := False;
  end;
end;

function Tokenize(Input: string): TObjectList<TToken>;
var 
  C: Char;
  InfixTokenList: TObjectList<TToken>;
  Operand: string;
begin
  Input := StringReplace(Input, ' ', string.Empty, [rfReplaceAll]);
  InfixTokenList := TObjectList<TToken>.Create;

  for C in Input do
  begin
    if IsOperator(C) then
    begin
      if Operand.Length > 0 then
      begin
        InfixTokenList.Add(TOperandToken.Create(Operand));
        Operand := string.Empty;
      end;
        
      InfixTokenList.Add(TOperatorToken.Create(C));
    end
    else
    begin
      Operand := Operand + C;  
    end;
  end;

  InfixTokenList.Add(TOperandToken.Create(Operand));

  Result := InfixTokenList;
end;

end.
