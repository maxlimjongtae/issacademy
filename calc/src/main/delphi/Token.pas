unit Token;

interface

type
  TToken = class abstract
    protected
    function ToString(): string; virtual; abstract;
  end;

implementation

end.
