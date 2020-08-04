program ScriptExecutor;

uses
  SysUtils,
  Vcl.Forms,
  Main.FormView in 'Main.FormView.pas' {MainForm},
  DebugPrinter in 'DebugPrinter.pas',
  SyntaxValidator in 'SyntaxValidator.pas',
  Token in 'Token.pas',
  Tokenizer in 'Tokenizer.pas',
  TokenBuilder in 'TokenBuilder.pas',
  TokenState in 'TokenState.pas';

{$R *.res}

var
  Tokenizer: TTokenizer;
begin
  try
    ReportMemoryLeaksOnShutdown := TRUE;

    Application.Initialize;
    Application.MainFormOnTaskbar := True;
    Application.CreateForm(TMainForm, MainForm);
    Application.Run;

  except
    on E: Exception do
      Print(E.ClassName + ': ' + E.Message);
  end;
end.
