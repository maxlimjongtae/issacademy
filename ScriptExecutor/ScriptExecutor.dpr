program ScriptExecutor;

uses
  SysUtils,
  Vcl.Forms,
  Main.FormView in 'Main.FormView.pas' {MainForm},
  ScriptException in 'ScriptException.pas',
  DebugPrinter in 'DebugPrinter.pas',
  Identifier in 'Identifier.pas',
  SyntaxValidator in 'SyntaxValidator.pas',
  Tokenizer in 'Tokenizer.pas';

{$R *.res}

begin
  try
    ReportMemoryLeaksOnShutdown := True;

    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TMainForm, MainForm);
    Application.Run;
  except
    on E: Exception do
      Print(E.ClassName + ': ' + E.Message);
  end;
end.
