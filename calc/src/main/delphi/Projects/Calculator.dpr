program Calculator;

uses
  System.SysUtils, System.Generics.Collections, Winapi.Windows,
  Calculator.Types in 'Calculator.Types.pas',
  CalculatorForm in 'CalculatorForm.pas' {Form1},
  Postfixer in 'Postfixer.pas',
  Stack in 'Stack.pas',
  Token in 'Token.pas',
  Tokenizer in 'Tokenizer.pas';

{$R *.res}

procedure Print(Msg: string);
begin
  OutputDebugString(PChar(Msg));
end;

function CalculatePostfix(const PostfixTokenList: TObjectList<TToken>): Integer;
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
      Print(Token.ToString);

      if Token is TOperatorToken then
      begin
        OperatorToken := TOperatorToken(Token);

        R := OperandStack.Pop;
        L := OperandStack.Pop;

        OperandStack.Push(OperatorToken.Operation(L, R));
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
    PostfixTokenList.Free;
  end;
end;

procedure Calculate(const Input: string);
var
  InfixTokenList: TObjectList<TToken>;
begin
  InfixTokenList := Tokenize(INPUT);
  try
    Print('Result: ' + IntToStr(CalculatePostfix(Postfix(InfixTokenList))));
  finally
    InfixTokenList.Clear;
    InfixTokenList.Free;
  end;
end;

const
  INPUT = '1 + ( 1 - 5 * 1 ) + ( ( 2 - 3 ) - 3 * 4 ) + 2 * 4';
begin
  try
    ReportMemoryLeaksOnShutdown := True;

    Calculate(INPUT);
  except
    on E: Exception do
      Print(E.ClassName + ': ' + E.Message);
  end;
end.
