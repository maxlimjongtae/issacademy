program Calculator;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, System.Generics.Collections,
  Stack in 'Stack.pas',
  Token in 'Token.pas',
  Postfixer in 'Postfixer.pas',
  Calculator.Types in 'Calculator.Types.pas',
  Tokenizer in 'Tokenizer.pas';

const
  INPUT = '10 + 20 * 30';
var
  Stack: TStack<TToken>;
  Node: TToken;
  C: Char;

  InfixTokenList: TObjectList<TToken>;
begin
  try
    InfixTokenList := TTokenizer.Tokeinize(INPUT);

    for Node in InfixTokenList do
    begin
      WriteLn(Node.ToString());
    end;

    Stack := TStack<TToken>.Create;
    try
      Stack.Push(TOperandToken.Create('123'));

      Node := Stack.Pop;
      try
        WriteLn(Node.ToString());
      finally
        Node.Free;
      end;
      
    finally
      Stack.Free;
    end;
  except
    on E: Exception do
      Writeln(E.Message);
  end;

  ReadLn;
end.
