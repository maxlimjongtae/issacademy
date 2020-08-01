program ScriptExecutor;

uses
  SysUtils,
  Vcl.Forms,
  Main.FormView in 'Main.FormView.pas' {MainForm},
  DebugPrinter in 'DebugPrinter.pas',
  SyntaxValidator in 'SyntaxValidator.pas',
  Tokenizer in 'Tokenizer.pas',
  Token in 'Token.pas';

{$R *.res}

var
  Tokenizer: TTokenizer;
begin
  try
    ReportMemoryLeaksOnShutdown := True;

//    Application.Initialize;
//    Application.MainFormOnTaskbar := True;
//    Application.CreateForm(TMainForm, MainForm);
//    Application.Run;

    Tokenizer := TTokenizer.Create;
    try
      Tokenizer.Tokenize('var b: Integer = 10;');
    finally
      Tokenizer.Free;
    end;

  except
    on E: Exception do
      Print(E.ClassName + ': ' + E.Message);
  end;
end.
