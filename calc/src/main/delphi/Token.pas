unit Token;

interface

type
  TToken = class abstract
  public
    function ToString(): string; virtual; abstract;
  end;

implementation

end.
