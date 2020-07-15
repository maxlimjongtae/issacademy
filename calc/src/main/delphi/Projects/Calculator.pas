unit Calculator;

interface

function Calculate(const Input: string): Integer;

implementation

uses
  System.SysUtils, System.Generics.Collections, DebugPrinter,
  Token, Tokenizer, Stack, Calculator.Types, Postfixer;

function CalculatePostfix(const PostfixTokenList: TList<TToken>): Integer;
var
  I, R, L: Integer;
  Token: TToken;
  OperatorToken: TOperatorToken;
  OperandToken: TOperandToken;
  OperandStack: System.Generics.Collections.TStack<Integer>;
begin
  OperandStack := System.Generics.Collections.TStack<Integer>.Create;

  try
    for I := 0 to PostfixTokenList.Count - 1 do
    begin
      Token := PostfixTokenList[I];
      if Token is TOperatorToken then
      begin
        OperatorToken := TOperatorToken(Token);

        R := OperandStack.Pop;
        L := OperandStack.Pop;

        OperandStack.Push(TBinaryOperation.Operation(OperatorToken.Value, L, R));
      end
      else if Token is TOperandToken then
      begin
        OperandToken := TOperandToken(Token);
        OperandStack.Push(OperandToken.Value);
      end
      else
      begin
        raise Exception.Create('Invalid token.');
      end;
    end;

    Result := OperandStack.Pop;
  finally
    OperandStack.Free;
  end;
end;

function Calculate(const Input: string): Integer;
var
  InfixTokenList: TList<TToken>;
  PostfixTokenList: TList<TToken>;
  Tokenizer: TTokenizer;
  i: Integer;
begin
  Tokenizer := TTokenizer.Create;
  InfixTokenList := Tokenizer.Tokenize(INPUT.Replace(' ', ''));
  PostfixTokenList := Postfix(InfixTokenList);

  for i := 0 to PostfixTokenList.Count -1 do
  begin
    Print(PostfixTokenList[i].ToString);
  end;

  try
    Result := CalculatePostfix(PostfixTokenList);
  finally
    PostfixTokenList.Free;
    InfixTokenList.Free;
    Tokenizer.Free;
  end;
end;

end.
