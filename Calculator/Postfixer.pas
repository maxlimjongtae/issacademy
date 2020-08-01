unit Postfixer;

interface

uses
  System.SysUtils, System.Generics.Collections,
  Token, Stack, Calculator.Types;

function Postfix(const InfixTokenList: TList<TToken>): TList<TToken>;

implementation

function IsLeftHigherThanRight(L, R: TOperatorToken): Boolean;
begin
  Result := L.Priority > R.Priority;
end;

function postfix(const InfixTokenList: TList<TToken>): TList<TToken>;
var
  I: Integer;
  Token: TToken;
  OperatorToken: TOperatorToken absolute Token;
  OperatorTokenStack: TStack<TOperatorToken>;
begin
  OperatorTokenStack := TStack<TOperatorToken>.Create;
  Result := TList<TToken>.Create;

  try
    for I := 0 to InfixTokenList.Count - 1 do
    begin
      Token := InfixTokenList.Items[I];

      if Token is TOperatorToken then
      begin
        if OperatorTokenStack.IsEmpty then
        begin
          OperatorTokenStack.Push(OperatorToken);
        end
        else
        begin
          if OperatorToken.IsCloseBracket then
          begin
            while not OperatorTokenStack.Peek.IsOpenBracket do
              Result.Add(OperatorTokenStack.Pop);

            OperatorTokenStack.Pop;
          end
          else
          begin
            if not OperatorTokenStack.Peek.IsOpenBracket then
            begin
              while (not OperatorTokenStack.IsEmpty) and IsLeftHigherThanRight(OperatorTokenStack.Peek, OperatorToken) do
                Result.Add(OperatorTokenStack.Pop);
            end;

             OperatorTokenStack.Push(OperatorToken);
          end;

        end;
      end
      else if Token is TOperandToken then
      begin
        Result.Add(Token);
      end
      else
      begin
        raise Exception.Create('Invalid token.');
      end;

    end;

    while not(OperatorTokenStack.IsEmpty) do
      Result.Add(OperatorTokenStack.Pop);
  finally
    OperatorTokenStack.Free;
  end;
end;

end.
