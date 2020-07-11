program ConsoleCalculator;

uses
  Vcl.Forms,
  SysUtils,

  Calculator.Types in 'Calculator.Types.pas',
  Calculator.FormView in 'Calculator.FormView.pas' {CalculatorView},
  Postfixer in 'Postfixer.pas',
  Stack in 'Stack.pas',
  Token in 'Token.pas',
  Tokenizer in 'Tokenizer.pas',
  Calculator in 'Calculator.pas',
  DebugPrinter in 'DebugPrinter.pas';

{$R *.res}

begin
  try
    ReportMemoryLeaksOnShutdown := True;

    Application.Initialize;
    Application.CreateForm(TCalculatorView, CalculatorView);
    Application.Run;

  except
    on E: Exception do
      Print(E.ClassName + ': ' + E.Message);
  end;
end.
