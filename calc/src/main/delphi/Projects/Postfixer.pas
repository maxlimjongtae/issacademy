unit Postfixer;

interface

uses
  System.SysUtils, System.Generics.Collections, Winapi.Windows,
  Token, Stack, Calculator.Types;

  function postfix(const InfixTokenList: TObjectList<TToken>): TObjectList<TToken>;

implementation

  procedure Print(Msg: String);
  begin
    OutputDebugString(PChar(Msg));
  end;

  function IsLeftHigherThanRight(L, R: TOperatorToken): Boolean;
  begin
    Result := L.Priority > R.Priority;
  end;

  function postfix(const InfixTokenList: TObjectList<TToken>): TObjectList<TToken>;
  var
    I: Integer;
    Token: TToken;
    OperatorToken: TOperatorToken;
    PostfixTokenList: TObjectList<TToken>;
    OperatorTokenStack: TStack<TOperatorToken>;
  begin
    OperatorTokenStack := TStack<TOperatorToken>.Create;
    PostfixTokenList := TObjectList<TToken>.Create;

    try
      for I := 0 to InfixTokenList.Count - 1 do
      begin
        Token := InfixTokenList.Items[I];
        if Token is TOperatorToken then
        begin
          OperatorToken := TOperatorToken(Token);

          if OperatorTokenStack.IsEmpty then
          begin
            OperatorTokenStack.Push(OperatorToken);
          end
          else
          begin
            if OperatorToken.isCloseBracket then
            begin
              while not(OperatorTokenStack.Peek.IsOpenBracket) do
                PostfixTokenList.Add(OperatorTokenStack.Pop);

              OperatorTokenStack.Pop;
            end
            else
            begin
              if not(OperatorTokenStack.Peek.IsOpenBracket) then
              begin
                while not(OperatorTokenStack.IsEmpty) and IsLeftHigherThanRight(OperatorTokenStack.Peek, OperatorToken) do
                  PostfixTokenList.Add(OperatorTokenStack.Pop);
              end;

               OperatorTokenStack.Push(OperatorToken);
            end;

          end;
        end
        else if Token is TOperandToken then
        begin
          PostfixTokenList.Add(TOperandtoken(Token));
        end
        else
        begin
          raise Exception.Create('Invalid token.');
        end;

      end;

      while not(OperatorTokenStack.IsEmpty) do
        PostfixTokenList.Add(OperatorTokenStack.Pop);

    finally
      OperatorTokenStack.Free;
    end;

    Result := PostfixTokenList;
  end;
end.
