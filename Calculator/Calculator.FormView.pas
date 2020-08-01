unit Calculator.FormView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, System.Generics.Collections,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Calculator;

type
  TCalculatorView = class(TForm)
    Memo: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CalculatorView: TCalculatorView;

implementation

{$R *.dfm}

procedure TCalculatorView.FormCreate(Sender: TObject);
var
  TestCaseMap: TDictionary<string, Integer>;
  Expression: string;
  Expected, Returned: Integer;
  Success, Failed: Integer;
  Pointer: PChar;
  Input: string;
begin
  TestCaseMap := TDictionary<string, Integer>.Create;

  try
    TestCaseMap.Add('1 + ( 1 - 5 * 1 ) + ( ( 2 - 3 ) - 3 * 4 ) + 2 * 4', -8);
    TestCaseMap.Add('1 * 2 * 4 + 8 * 4 / 2 + 4', 28);
    TestCaseMap.Add('2 + 3 * 4', 14);

    for Expression in TestCaseMap.Keys do
    begin
      Expected := TestCaseMap.Items[Expression];
      Returned := Calculate(Expression);

      if Expected = Returned then
        Inc(Success)
      else
        Inc(Failed);

      Memo.Lines.Add(Expression + ' is Expected: ' + IntToStr(Expected));
      Memo.Lines.Add('Result is ' + IntToStr(Failed));
      Memo.Lines.Add('====================');
    end;

    Memo.Lines.Add('====================');
    Memo.Lines.Add('Success count: ' + IntToStr(Success));
    Memo.Lines.Add('Failed count: ' + IntToStr(Failed));
    Memo.Lines.Add('====================');
    Memo.Lines.Add('====================');
  finally
    TestCaseMap.Free;
  end;

end;

end.
