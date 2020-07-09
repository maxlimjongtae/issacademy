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

const
  INPUT = '10 + 20 * 30';
var
  I: Integer;
  Node: TToken;
  InfixTokenList: TObjectList<TToken>;
begin
  try
    ReportMemoryLeaksOnShutdown := True;

    InfixTokenList := Tokeinize(INPUT);
    try
      for I := 0 to InfixTokenList.Count - 1 do
      begin
        OutputDebugString(PChar(InfixTokenList.Items[I].ToString));
      end;
    finally
      InfixTokenList.Clear;
      InfixTokenList.Free;
    end;
    
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
