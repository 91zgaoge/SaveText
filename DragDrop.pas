unit DragDrop;

interface

uses
  Windows, ActiveX,classes, ComObj,Dialogs,Sysutils;

type
  TDropEvent = procedure(Sender:TObject;pt:tpoint)of object;
   TEncodeFlags = (efUnknown, efAnsi, efUnicode, efUncodeBigEn, efUTF8);
    TUTF8Falg = packed record
    EF, BB, BF: Byte;
    end;
  TTMyDrop = class(TComObject, IDropTarget)
  private
    FOnDroped: TDropEvent;
    fOnDropEnter: TDropEvent;
    fOnLeave: TNotifyEvent;
    fOnDropover:TDropEvent;
        fTitle: wideString;
          fregtext:widestring;
    ftext:widestring;
    fhref:tstringlist;
     fURL: wideString;
     fccdpt:tpoint;
    procedure SetOnDroped(const Value: TDropEvent);
    procedure TextToUTF8Stream(const Text: string; var Stream: TStream);
  protected
    {Declare IDropTarget methods here}
    function DragEnter(const dataObj: IDataObject; grfKeyState: Longint;
      pt: TPoint; var dwEffect: Longint): HResult; stdcall;
    function DragOver(grfKeyState: Longint; pt: TPoint;
      var dwEffect: Longint): HResult; stdcall;
    function DragLeave: HResult; stdcall;
    function Drop(const dataObj: IDataObject; grfKeyState: Longint; pt: TPoint;
      var dwEffect: Longint): HResult; stdcall;

  public
        property URL: wideString Read fURL Write fURL;
    property Title: wideString Read fTitle Write fTitle;
    property regtext:widestring Read fregtext Write fregtext;
    property href: tStringlist Read fhref Write fhref;
    property text: wideString Read ftext Write ftext;
    property OnDroped:TDropEvent read FOnDroped write SetOnDroped;
    property OnDropEnter:TDropEvent read fOnDropEnter write fOnDropEnter;
    property OnLeave: TNotifyEvent read fOnLeave write fOnLeave;
    property ccdpt: Tpoint read fccdpt write fccdpt;
    property OnDropover:TDropEvent read fOnDropover write fOnDropover;
  end;

      function ChWideToAnsi(const StrW: WideString): AnsiString;
    function ChAnsiToWide(const StrA: AnsiString): WideString;
   function GetEncodeFromStream(const Stream: TStream): TEncodeFlags;
  var
  CF_HTML: UINT;
//  CF_GIF : UINT;
const
  Class_TMyDrop: TGUID = '{846C94F8-7649-11D2-9836-0000E82EA1B1}';
    Encode: TUTF8Falg = (EF: $EF; BB: $BB; BF: $BF);
implementation



uses ComServ,save1;

{ TTMyDrop }
function ChWideToAnsi(const StrW: WideString): AnsiString;
var
  nLen: integer;
begin
  Result := StrW;
  if Result <> '' then
  begin
    nLen := WideCharToMultiByte(936, 624, @StrW[1], -1, nil, 0, nil, nil);
    SetLength(Result, nLen - 1);
    if nLen > 1 then
      WideCharToMultiByte(936, 624, @StrW[1], -1, @Result[1], nLen - 1, nil, nil);
  end;
end;

function ChAnsiToWide(const StrA: AnsiString): WideString;
var
  nLen: integer;
begin
  Result := StrA;
  if Result <> '' then
  begin
    nLen := MultiByteToWideChar(936, 1, PAnsiChar(@StrA[1]), -1, nil, 0);
    SetLength(Result, nLen - 1);
    if nLen > 1 then
      MultiByteToWideChar(936, 1, PAnsiChar(@StrA[1]), -1, PWideChar(@Result[1]), nLen - 1);
  end;
end;

function UTF8ToWideString(const Stream: TStream): WideString;
var
  nLen: Cardinal;
begin
  try
    SetLength(Result, Stream.Size div SizeOf(WideChar) * 3);
    nLen := Utf8ToUnicode(@Result[1], Length(Result),
      Pointer(DWord(TMemoryStream(Stream).Memory) + Stream.Position),
      Stream.Size - Stream.Position);
    SetLength(Result, nLen);
  except
    SetLength(Result, 0);
  end;
end;

procedure TTMyDrop.TextToUTF8Stream(const Text: string; var Stream: TStream);
var
  StringW, StrW: WideString;
  nLen: Cardinal;
begin
  try
    if Text <> '' then
    begin
      StrW := ChAnsiToWide(Text);
      nLen := Length(StrW) * 3;
      SetLength(StringW, nLen);
      nLen := UnicodeToUtf8(@StringW[1], nLen, @StrW[1], Length(StrW));
      SetLength(StringW, nLen);
      Stream.Write(Encode, SizeOf(Encode));
      Stream.Write(StringW[1], Length(StringW));
    end
    else
      Stream.Write(Encode, SizeOf(Encode));
  except
    SetLength(StrW, 0);
    SetLength(StringW, 0);
  end;
end;

function GetEncodeFromStream(const Stream: TStream): TEncodeFlags;
var
  FEncode: TUTF8Falg;
begin
  Result := efUnknown;
  Stream.Read(FEncode, SizeOf(FEncode));
  if (FEncode.EF = Encode.EF) and (FEncode.BB = Encode.BB)
    and (FEncode.BF = Encode.BF) then Result := efUTF8;
end;

function TTMyDrop.DragEnter(const dataObj: IDataObject;
  grfKeyState: Integer; pt: TPoint; var dwEffect: Integer): HResult;
var
  enumFormatEtc: IEnumFormatEtc;
  f:TFORMATETC;
  count:Integer;
  Found:boolean;
begin
  CF_HTML:=RegisterClipboardFormat('HTML Format');
  dataObj.EnumFormatEtc(DATADIR_GET,enumFormatEtc);
  ccdpt:=pt;
  Found:=false;
  while (enumFormatEtc.Next(1,f,@count)=S_OK)and (count>0) do
  begin
    if  (f.cfFormat=CF_TEXT) then
    begin
      Found:=true;
      Break;
    end;
    end;
  if Found then
  begin
       dwEffect := dwEffect and not DROPEFFECT_LINK;
      if Assigned(fOnDropenter) then
    begin
      fOnDropenter(Self,pt);
          end;
       Result:=S_OK;
          ccdpt:=pt;
        end
  else
  begin
    result:=E_INVALIDARG;
    dwEffect:=DROPEFFECT_NONE;
  end;

end;

function TTMyDrop.DragLeave: HResult;
begin
      if Assigned(fOnDropenter) then
      fOnleave(Self);
  result := S_OK;
end;

function TTMyDrop.DragOver(grfKeyState: Integer; pt: TPoint;
  var dwEffect: Integer): HResult;
begin
   result := S_OK;
         if Assigned(fOnDropOver) then
    begin
      fOnDropOver(Self,pt);
            end;
     ccdpt:=pt;
end;

function TTMyDrop.Drop(const dataObj: IDataObject; grfKeyState: Integer;
  pt: TPoint; var dwEffect: Integer): HResult;
var
  enumFormatEtc: IEnumFormatEtc;
  f:TFORMATETC;
  count:Integer;
  Found:boolean;
  tmpText:pchar;
  medium: TStgMedium;
  encoding: TEncoding;
  buff: Tbytes;
begin
  CF_HTML:=RegisterClipboardFormat('HTML Format');
//  CF_GIF := RegisterClipboardFormat('GIF Image');
  dataObj.EnumFormatEtc(DATADIR_GET,enumFormatEtc);
  Found:=false;
  while (enumFormatEtc.Next(1,f,@count)=S_OK) and (count>0) do
  begin
 //   if (f.cfFormat=CF_HTML) OR  (f.cfFormat=CF_TEXT) then
    if  (f.cfFormat=CF_TEXT) then
    begin

   dataObj.GetData(f,medium);
 //ftext:= PansiChar(GlobalLock(medium.hglobal));
 //tmpText:=UTF8ToString(ftext);
 tmpText:= GlobalLock(medium.hglobal);
//buff:=encoding.GetBytes(tmpText);
 if length(tmpText)>0 then
  begin
   ftext:= Decode_UTF8(PChar(GlobalLock(medium.hglobal)));
  end
  else
  begin
     ftext:= PansiChar(GlobalLock(medium.hglobal));
  end;
  regtext:=PChar(Decode_UTF8(GlobalLock(medium.hglobal)));
 // ftext:=  regtext;
  ccdHtmlFind(regtext,furl,ftitle,fhref);
//       dataObj.GetData(f,medium);
//ftext:=PAnsiChar(GlobalLock(medium.hglobal));
//ftext:= Decode_UTF8(PChar(ftext))+ IntToStr(count)+ 'BBBB-BBBBB'+ IntToStr(count)+ 'AAAAAAAAAAAAAAAA';
      Found:=true;
     // Break;

    end;
  end;
  if not Found then
  begin
    result:=E_INVALIDARG;
    dwEffect:=DROPEFFECT_NONE;
    Exit;
  end
  else
 // dataObj.GetData(f,medium);
 // if medium.tymed =1 then
  begin
    if Assigned(fOnDroped) then
    begin
     fOnDroped(Self,pt);
     GlobalUnLock(medium.hglobal);
     end;
 result := S_OK;
  end;
end;

procedure TTMyDrop.SetOnDroped(const Value: TDropEvent);
begin
  FOnDroped := Value;
end;

initialization
  TComObjectFactory.Create(ComServer, TTMyDrop, Class_TMyDrop,
    'TMyDrop', '', ciMultiInstance{, tmApartment});
end.

