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
  DebugPrinter in 'DebugPrinter.pas',
  State in 'state\State.pas',
  OperandState in 'state\OperandState.pas',
  OperatorState in 'state\OperatorState.pas',
  OpenBracketState in 'state\OpenBracketState.pas',
  CloseBracketState in 'state\CloseBracketState.pas',
  FinalState in 'state\FinalState.pas',
  InitState in 'state\InitState.pas',
  SpaceState in 'state\SpaceState.pas',
  ConditionState in 'state\ConditionState.pas',
  Tokenizer.Material in 'Tokenizer.Material.pas';

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
