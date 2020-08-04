unit Main.FormView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.TabNotBk,
  Vcl.StdCtrls,
  DebugPrinter, Tokenizer, Token;

type
  TMainForm = class(TForm)
    Memo: TMemo;
    Console: TMemo;
    ExecuteButton: TButton;
    CancelButton: TButton;
    procedure ExecuteButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.ExecuteButtonClick(Sender: TObject);
var
  I: Integer;
  Line: TLine;
  Tokenizer: TTokenizer;
begin
  Tokenizer := TTokenizer.Create;
  try
    for I := 0 to Memo.Lines.Count - 1 do
    begin
      Line := TLine.Create(I, Memo.Lines.Strings[I]);
      try
        Tokenizer.Tokenize(Line);
      finally
        Line.Free;
      end;
    end;
  finally
    Tokenizer.Free;
  end;
end;

end.
