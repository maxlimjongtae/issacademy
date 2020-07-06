program Calculator;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Stack in 'Stack.pas',
  Token in 'Token.pas',
  Postfixer in 'Postfixer.pas',
  Calculator.Types in 'Calculator.Types.pas';

var
  Stack: TStack<TToken>;
  Node: TToken;
begin
  ReportMemoryLeaksOnShutdown := true;
  try
    WriteLn('Program ConsoleTest is running.');

    Stack := TStack<TToken>.Create;
    Stack.Push(TOperand.Create('123'));

    Node := Stack.Pop();

    WriteLn(Node.ToString());

    Node.Free;
    Stack.Free;

    WriteLn('Press the ENTER key to stop');
  except
    on E: Exception do
      Writeln(E.Message);
  end;

  ReadLn;
end.
