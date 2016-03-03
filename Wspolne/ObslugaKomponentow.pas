unit ObslugaKomponentow;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls;



type


  TTypLiczby = (csInteger, csCurrency);
  TTrybWycinania = (ttBackSpace, ttDelete);
  TOSMaskEditNumeryczny = class(TObject)
  private
    FSeparator: char;
    FEdit: TMemo;
    FMaska: string;
    FTypLiczby: TTypLiczby; //Je¿eli w masce przecinek lub kropka to wtedy Currency
    FCalk: byte; //Ile zer przed przecinkiem
    fUlamk: byte; //Ile zer po przecinku
    procedure OnKeyPress(Sender: TObject; var Key: Char);
    procedure OnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure WklejZnakInteger(Aznak: char);
    procedure WytnijZnakInteger(Atryb: TTrybWycinania);
    procedure WytnijZnakCurrency(Atryb: TTrybWycinania);
    procedure WklejZnakCurrency(Aznak: char);
  public
    constructor Create(AComponent: TMemo; AMaska: string);
    destructor Destroy(); override;
    function PodajWartosc: string;
  end;



implementation
//####################################################################################################################
//                              KOMPONENT NUMERYCZNY
//####################################################################################################################

//OBS£UGA WYWO£ANIA
//begin
//  AEditMask := TOSMaskEditNumeryczny.Create(Memo1, '00000000,000');
//end;


constructor TOSMaskEditNumeryczny.Create(AComponent: TMemo; AMaska: string);
var
  i: integer;
  xZnakMaski: char;
  xCzescCalkMaski: string;
  xCzescUlamkMaski: string;
  xTemp: string;
begin
  FEdit := AComponent;
  FEdit.Text := '';
  FMaska := AMaska;
  FEdit.Height := 20;
  FEdit.OnKeyPress := OnKeyPress;
  FEdit.OnKeyDown := OnKeyDown;
  FSeparator := ',';
  if pos(FSeparator, AMaska) <> 0 then begin
    FTypLiczby := csCurrency;
  end else begin
    FTypLiczby := csInteger;
  end;
  FCalk := 0; fUlamk := 0; xTemp := '';
  if FTypLiczby = csInteger then begin
    for i := 1 to length(AMaska) do begin
      xZnakMaski := amaska[i];
      if ((ord(xZnakMaski) >= ord('0')) and (ord(xZnakMaski) <= ord('9'))) then begin
        inc(FCalk);
      end;
    end;
    xTemp := '0';
  end else begin
    xCzescCalkMaski := copy(AMaska, 1, pos(FSeparator, AMaska) - 1);
    xCzescUlamkMaski := copy(AMaska, pos(FSeparator, AMaska) + 1, length(AMaska));
    FCalk := length(xCzescCalkMaski);
    fUlamk := length(xCzescUlamkMaski);
    xTemp := '0,';
    for i := 1 to fUlamk do begin
      xTemp := xTemp + '0';
    end;
  end;
  FEdit.Lines.Clear;
  FEdit.Lines.Add(xTemp);
  FEdit.SelStart := 1;

  FEdit.ControlStyle := FEdit.ControlStyle - [csSetCaption];
  if FTypLiczby = csCurrency then begin
    FEdit.Alignment := taRightJustify;
  end;
end;
//####################################################################################################################

destructor TOSMaskEditNumeryczny.Destroy();
begin

end;
//####################################################################################################################

procedure TOSMaskEditNumeryczny.OnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  xZnak: string;
begin
  case key of
    VK_BACK: begin
        if FTypLiczby = csInteger then begin
          WytnijZnakInteger(ttBackSpace);
        end else begin
          xZnak := copy(PodajWartosc, FEdit.Selstart, 1);
          if ord(xZnak[1]) <> ord(FSeparator) then begin
            WytnijZnakCurrency(ttBackSpace);
          end else begin
            FEdit.SelStart := FEdit.SelStart - 1;
          end;
        end;
        key := 0;
      end;
    VK_DELETE: begin
        if FTypLiczby = csInteger then begin
          WytnijZnakInteger(ttDelete);
        end else begin
          xZnak := copy(PodajWartosc, FEdit.Selstart + 1, 1);
          if ord(xZnak[1]) <> ord(FSeparator) then begin
            WytnijZnakCurrency(ttDelete);
          end else begin
            FEdit.SelStart := FEdit.SelStart - 1;
          end;
        end;
        key := 0;
      end;
    VK_UP: if (Shift = []) then begin
        //Formatka.Perform(WM_NEXTDLGCTL, -1, 0);
        Key := 0;
      end;
    VK_DOWN: if (Shift = []) then begin
        //Formatka.Perform(WM_NEXTDLGCTL, 0, 0);
        Key := 0;
      end;
    VK_TAB: begin
      //ignorujemy tabulator
        Key := 0;
      end;
    VK_LEFT: begin
        if FEdit.SelStart = 0 then begin
          Key := 0;
        end;
      end;
    VK_RIGHT: begin
        if FEdit.SelStart = length(PodajWartosc) then begin
          Key := 0;
        end;
      end;
    VK_END: begin
        if Shift = [] then begin
        //Jak bez Shiftu to zwyk³e przejœcie na koniec tekstu
          FEdit.SelStart := Length(Trim(PodajWartosc));
        end else begin
        //Jak z Shiftem to trzeba zaznaczyæ tekst
          FEdit.SelLength := Length(Trim(PodajWartosc)) - FEdit.SelStart;
        end;
        Key := 0;
      end;
  end;
end;
//####################################################################################################################

procedure TOSMaskEditNumeryczny.OnKeyPress(Sender: TObject; var Key: Char);
var
  xZnak: string;
begin
  if not ((ord(key) >= ord('0')) and (ord(key) <= ord('9'))) then begin
    key := #0;
  end else begin
    if FTypLiczby = csInteger then begin
      WklejZnakInteger(Key);
    end else begin
      xZnak := copy(PodajWartosc, FEdit.Selstart, 1);
      if ord(xZnak[1]) <> ord(FSeparator) then begin
        WklejZnakCurrency(Key);
      end;
    end;
    key := #0;
  end;
end;
//####################################################################################################################

function TOSMaskEditNumeryczny.PodajWartosc: string;
begin
  result := trim(FEdit.Lines[0]);
end;
//####################################################################################################################

procedure TOSMaskEditNumeryczny.WklejZnakCurrency(Aznak: char);
var
  xLinia, xLiniaCalk, xLiniaUlamk: string;
  xPosZnaczek: byte;
  xSelStart: integer;
begin
  xLinia := trim(FEdit.Lines[0]);
  //FEdit.Lines[0] := '';
  xPosZnaczek := pos(FSeparator, xLinia);
  xLiniaCalk := copy(xLinia, 1, xPosZnaczek - 1);
  xLiniaUlamk := copy(xLinia, xPosZnaczek + 1, length(xLinia));
  xSelStart := FEdit.SelStart;
  if FEdit.selstart < xPosZnaczek then begin
    if xLiniaCalk = '0' then begin
      xLiniaCalk := '';
    end;
    if length(xLiniaCalk + Aznak) <= fcalk then begin
      xLiniaCalk := xLiniaCalk + Aznak;
    end;
    FEdit.Lines[0] := xLiniaCalk + FSeparator + xLiniaUlamk;
    FEdit.SelStart := length(xLiniaCalk);
  end else begin //Tutaj czêœæ U³amkowa bêdzie zawsze widoczna
    delete(xLinia, fedit.SelStart, 1);
    insert(Aznak, xLinia, fedit.SelStart);
    FEdit.Lines[0] := xLinia;
    FEdit.SelStart := xSelStart;
  end;
end;
//####################################################################################################################

procedure TOSMaskEditNumeryczny.WklejZnakInteger(Aznak: char);
var
  xLinia: string;
begin
  xLinia := trim(FEdit.Lines[0]);
  FEdit.Lines[0] := '';
  if xLinia = '0' then begin
    xLinia := '';
  end;
  if length(xLinia + Aznak) <= fcalk then begin
    xLinia := xLinia + Aznak;
  end;
  FEdit.Lines[0] := xLinia;
  FEdit.SelStart := length(xLinia);
end;
//####################################################################################################################

procedure TOSMaskEditNumeryczny.WytnijZnakCurrency(Atryb: TTrybWycinania);
var
  xLinia, xLiniaCalk, xLiniaUlamk: string;
  xPosZnaczek: byte;
  xSelstart: integer;
begin
  xLinia := trim(FEdit.Lines[0]);
  xPosZnaczek := pos(FSeparator, xLinia);
  xLiniaCalk := copy(xLinia, 1, xPosZnaczek - 1);
  xLiniaUlamk := copy(xLinia, xPosZnaczek + 1, length(xLinia));
  xSelstart := FEdit.SelStart;
  if Atryb = ttBackSpace then begin
    if FEdit.selstart < xPosZnaczek then begin
      if length(xLiniaCalk) > 1 then begin
        delete(xLiniaCalk, FEdit.SelStart, 1);
        FEdit.Lines[0] := xLiniaCalk + FSeparator + xLiniaUlamk;
        FEdit.SelStart := length(xLiniaCalk);
      end else begin
        xLiniaCalk := '0';
        FEdit.Lines[0] := xLiniaCalk + FSeparator + xLiniaUlamk;
        FEdit.SelStart := 1;
      end;
    end else begin //Tutaj czêœæ U³amkowa bêdzie zawsze widoczna
      delete(xLinia, fedit.SelStart, 1);
      insert('0', xLinia, fedit.SelStart);
      FEdit.Lines[0] := xLinia;
      FEdit.SelStart := xSelstart - 1;
    end;
  end else begin
    if FEdit.selstart < xPosZnaczek then begin
      if length(xLiniaCalk) > 1 then begin
        delete(xLiniaCalk, FEdit.SelStart + 1, 1);
        FEdit.Lines[0] := xLiniaCalk + FSeparator + xLiniaUlamk;
        FEdit.SelStart := xSelstart; //length(xLiniaCalk);
      end else begin
        xLiniaCalk := '0';
        FEdit.Lines[0] := xLiniaCalk + FSeparator + xLiniaUlamk;
        FEdit.SelStart := 1;
      end;
    end else begin //Tutaj czêœæ U³amkowa bêdzie zawsze widoczna
      if FEdit.SelStart <= length(xLinia) then begin
        delete(xLinia, fedit.SelStart + 1, 1);
        insert('0', xLinia, fedit.SelStart + 1);
        FEdit.Lines[0] := xLinia;
        FEdit.SelStart := xSelstart;
      end;
    end;
  end;
end;
//####################################################################################################################

procedure TOSMaskEditNumeryczny.WytnijZnakInteger(Atryb: TTrybWycinania);
var
  xTekst: string;
begin
  xTekst := trim(FEdit.Lines[0]);
  if Atryb = ttBackSpace then begin
    if length(xTekst) > 1 then begin
      delete(xTekst, FEdit.SelStart, 1);
      FEdit.Lines[0] := xTekst;
      FEdit.SelStart := length(xTekst);
    end else begin
      xTekst := '0';
      FEdit.Lines[0] := xTekst;
      FEdit.SelStart := 1;
    end;
  end else begin
    if length(xTekst) > 1 then begin
      if FEdit.SelStart + 1 <= FCalk then begin
        delete(xTekst, FEdit.SelStart + 1, 1);
        FEdit.Lines[0] := xTekst;
        FEdit.SelStart := length(xTekst);
      end;
    end else begin
      if FEdit.SelStart + 1 <= FCalk then begin
        xTekst := '0';
        FEdit.Lines[0] := xTekst;
        FEdit.SelStart := 1;
      end;
    end;
  end;
end;
//####################################################################################################################


end.

