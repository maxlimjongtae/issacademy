unit Tokenizer;

interface

uses
  System.Generics.Collections;

type
  TTokenizer = class
  public
    function Tokenize(Line: string): TList<string>;
  end;

implementation

{ TTokenizer }

function TTokenizer.Tokenize(Line: string): TList<string>;
begin
  Result := nil;
end;

end.
