unit JCCATCHLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.88  $
// File generated on 00-9-21 3:10:04 from Type Library described below.

// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
// ************************************************************************ //
// Type Lib: C:\PROGRAM FILES\FLASHGET\JCCATCH.DLL (1)
// IID\LCID: {79DE8D41-161C-11D3-8B9B-DF77640BA112}\0
// Helpfile: 
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\SYSTEM\StdOle2.tlb)
//   (2) v4.0 StdVCL, (C:\WINDOWS\SYSTEM\STDVCL40.DLL)
// Errors:
//   Error creating palette bitmap of (TIeCatch) : Server C:\PROGRAM FILES\FLASHGET\JCCATCH.DLL contains no icons
//   Error creating palette bitmap of (TJetCarNetscape) : Server C:\PROGRAM FILES\FLASHGET\JCCATCH.DLL contains no icons
//   Error creating palette bitmap of (TIeCatch2) : Server C:\PROGRAM FILES\FLASHGET\JCCATCH.DLL contains no icons
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  JCCATCHLibMajorVersion = 1;
  JCCATCHLibMinorVersion = 0;

  LIBID_JCCATCHLib: TGUID = '{79DE8D41-161C-11D3-8B9B-DF77640BA112}';

  CLASS_IeCatch: TGUID = '{FB5DA722-162B-11D3-8B9B-AA70B4B0B524}';
  IID_IJetCarNetscape: TGUID = '{FB5DA723-162B-11D3-8B9B-AA70B4B0B524}';
  CLASS_JetCarNetscape: TGUID = '{FB5DA724-162B-11D3-8B9B-AA70B4B0B524}';
  IID_IIeCatch2: TGUID = '{A5366672-E8CA-11D3-9CD9-0090271D075B}';
  CLASS_IeCatch2: TGUID = '{A5366673-E8CA-11D3-9CD9-0090271D075B}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IJetCarNetscape = interface;
  IJetCarNetscapeDisp = dispinterface;
  IIeCatch2 = interface;
  IIeCatch2Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  IeCatch = IUnknown;
  JetCarNetscape = IJetCarNetscape;
  IeCatch2 = IIeCatch2;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  POleVariant1 = ^OleVariant; {*}


// *********************************************************************//
// Interface: IJetCarNetscape
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FB5DA723-162B-11D3-8B9B-AA70B4B0B524}
// *********************************************************************//
  IJetCarNetscape = interface(IDispatch)
    ['{FB5DA723-162B-11D3-8B9B-AA70B4B0B524}']
    function  Initialize(const pProtocol: WideString; const pUrl: WideString): WordBool; safecall;
    procedure Open(const pUrl: WideString); safecall;
    procedure AddUrl(const pUrl: WideString; const pInfo: WideString; const pReferer: WideString); safecall;
    procedure AddUrlList(var pList: OleVariant); safecall;
    function  IsUrlExist(const pUrl: WideString): WordBool; safecall;
    function  AddUrlEx(const pUrl: WideString; const pInfo: WideString; const pReferer: WideString; 
                       const pSaveTo: WideString; uFlags: Integer): WordBool; safecall;
    function  AddUrlListEx(var pList: OleVariant; const pSaveTo: WideString; uFlags: Integer): Integer; safecall;
  end;

// *********************************************************************//
// DispIntf:  IJetCarNetscapeDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {FB5DA723-162B-11D3-8B9B-AA70B4B0B524}
// *********************************************************************//
  IJetCarNetscapeDisp = dispinterface
    ['{FB5DA723-162B-11D3-8B9B-AA70B4B0B524}']
    function  Initialize(const pProtocol: WideString; const pUrl: WideString): WordBool; dispid 1;
    procedure Open(const pUrl: WideString); dispid 2;
    procedure AddUrl(const pUrl: WideString; const pInfo: WideString; const pReferer: WideString); dispid 3;
    procedure AddUrlList(var pList: OleVariant); dispid 4;
    function  IsUrlExist(const pUrl: WideString): WordBool; dispid 5;
    function  AddUrlEx(const pUrl: WideString; const pInfo: WideString; const pReferer: WideString; 
                       const pSaveTo: WideString; uFlags: Integer): WordBool; dispid 6;
    function  AddUrlListEx(var pList: OleVariant; const pSaveTo: WideString; uFlags: Integer): Integer; dispid 7;
  end;

// *********************************************************************//
// Interface: IIeCatch2
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A5366672-E8CA-11D3-9CD9-0090271D075B}
// *********************************************************************//
  IIeCatch2 = interface(IDispatch)
    ['{A5366672-E8CA-11D3-9CD9-0090271D075B}']
  end;

// *********************************************************************//
// DispIntf:  IIeCatch2Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A5366672-E8CA-11D3-9CD9-0090271D075B}
// *********************************************************************//
  IIeCatch2Disp = dispinterface
    ['{A5366672-E8CA-11D3-9CD9-0090271D075B}']
  end;

// *********************************************************************//
// The Class CoIeCatch provides a Create and CreateRemote method to          
// create instances of the default interface IUnknown exposed by              
// the CoClass IeCatch. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoIeCatch = class
    class function Create: IUnknown;
    class function CreateRemote(const MachineName: string): IUnknown;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TIeCatch
// Help String      : IeCatch Class
// Default Interface: IUnknown
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TIeCatchProperties= class;
{$ENDIF}
  TIeCatch = class(TOleServer)
  private
    FIntf:        IUnknown;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TIeCatchProperties;
    function      GetServerProperties: TIeCatchProperties;
{$ENDIF}
    function      GetDefaultInterface: IUnknown;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IUnknown);
    procedure Disconnect; override;
    property  DefaultInterface: IUnknown read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TIeCatchProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TIeCatch
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TIeCatchProperties = class(TPersistent)
  private
    FServer:    TIeCatch;
    function    GetDefaultInterface: IUnknown;
    constructor Create(AServer: TIeCatch);
  protected
  public
    property DefaultInterface: IUnknown read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoJetCarNetscape provides a Create and CreateRemote method to          
// create instances of the default interface IJetCarNetscape exposed by              
// the CoClass JetCarNetscape. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoJetCarNetscape = class
    class function Create: IJetCarNetscape;
    class function CreateRemote(const MachineName: string): IJetCarNetscape;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TJetCarNetscape
// Help String      : JetCarNetscape Class
// Default Interface: IJetCarNetscape
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TJetCarNetscapeProperties= class;
{$ENDIF}
  TJetCarNetscape = class(TOleServer)
  private
    FIntf:        IJetCarNetscape;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TJetCarNetscapeProperties;
    function      GetServerProperties: TJetCarNetscapeProperties;
{$ENDIF}
    function      GetDefaultInterface: IJetCarNetscape;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IJetCarNetscape);
    procedure Disconnect; override;
    function  Initialize(const pProtocol: WideString; const pUrl: WideString): WordBool;
    procedure Open(const pUrl: WideString);
    procedure AddUrl(const pUrl: WideString; const pInfo: WideString; const pReferer: WideString);
    procedure AddUrlList(var pList: OleVariant);
    function  IsUrlExist(const pUrl: WideString): WordBool;
    function  AddUrlEx(const pUrl: WideString; const pInfo: WideString; const pReferer: WideString; 
                       const pSaveTo: WideString; uFlags: Integer): WordBool;
    function  AddUrlListEx(var pList: OleVariant; const pSaveTo: WideString; uFlags: Integer): Integer;
    property  DefaultInterface: IJetCarNetscape read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TJetCarNetscapeProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TJetCarNetscape
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TJetCarNetscapeProperties = class(TPersistent)
  private
    FServer:    TJetCarNetscape;
    function    GetDefaultInterface: IJetCarNetscape;
    constructor Create(AServer: TJetCarNetscape);
  protected
  public
    property DefaultInterface: IJetCarNetscape read GetDefaultInterface;
  published
  end;
{$ENDIF}


// *********************************************************************//
// The Class CoIeCatch2 provides a Create and CreateRemote method to          
// create instances of the default interface IIeCatch2 exposed by              
// the CoClass IeCatch2. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoIeCatch2 = class
    class function Create: IIeCatch2;
    class function CreateRemote(const MachineName: string): IIeCatch2;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TIeCatch2
// Help String      : IeCatch2 Class
// Default Interface: IIeCatch2
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TIeCatch2Properties= class;
{$ENDIF}
  TIeCatch2 = class(TOleServer)
  private
    FIntf:        IIeCatch2;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TIeCatch2Properties;
    function      GetServerProperties: TIeCatch2Properties;
{$ENDIF}
    function      GetDefaultInterface: IIeCatch2;
  protected
    procedure InitServerData; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: IIeCatch2);
    procedure Disconnect; override;
    property  DefaultInterface: IIeCatch2 read GetDefaultInterface;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TIeCatch2Properties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TIeCatch2
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TIeCatch2Properties = class(TPersistent)
  private
    FServer:    TIeCatch2;
    function    GetDefaultInterface: IIeCatch2;
    constructor Create(AServer: TIeCatch2);
  protected
  public
    property DefaultInterface: IIeCatch2 read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

implementation

uses ComObj;

class function CoIeCatch.Create: IUnknown;
begin
  Result := CreateComObject(CLASS_IeCatch) as IUnknown;
end;

class function CoIeCatch.CreateRemote(const MachineName: string): IUnknown;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_IeCatch) as IUnknown;
end;

procedure TIeCatch.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{FB5DA722-162B-11D3-8B9B-AA70B4B0B524}';
    IntfIID:   '{00000000-0000-0000-C000-000000000046}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TIeCatch.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IUnknown;
  end;
end;

procedure TIeCatch.ConnectTo(svrIntf: IUnknown);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TIeCatch.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TIeCatch.GetDefaultInterface: IUnknown;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TIeCatch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TIeCatchProperties.Create(Self);
{$ENDIF}
end;

destructor TIeCatch.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TIeCatch.GetServerProperties: TIeCatchProperties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TIeCatchProperties.Create(AServer: TIeCatch);
begin
  inherited Create;
  FServer := AServer;
end;

function TIeCatchProperties.GetDefaultInterface: IUnknown;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoJetCarNetscape.Create: IJetCarNetscape;
begin
  Result := CreateComObject(CLASS_JetCarNetscape) as IJetCarNetscape;
end;

class function CoJetCarNetscape.CreateRemote(const MachineName: string): IJetCarNetscape;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_JetCarNetscape) as IJetCarNetscape;
end;

procedure TJetCarNetscape.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{FB5DA724-162B-11D3-8B9B-AA70B4B0B524}';
    IntfIID:   '{FB5DA723-162B-11D3-8B9B-AA70B4B0B524}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TJetCarNetscape.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IJetCarNetscape;
  end;
end;

procedure TJetCarNetscape.ConnectTo(svrIntf: IJetCarNetscape);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TJetCarNetscape.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TJetCarNetscape.GetDefaultInterface: IJetCarNetscape;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TJetCarNetscape.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TJetCarNetscapeProperties.Create(Self);
{$ENDIF}
end;

destructor TJetCarNetscape.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TJetCarNetscape.GetServerProperties: TJetCarNetscapeProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function  TJetCarNetscape.Initialize(const pProtocol: WideString; const pUrl: WideString): WordBool;
begin
  Result := DefaultInterface.Initialize(pProtocol, pUrl);
end;

procedure TJetCarNetscape.Open(const pUrl: WideString);
begin
  DefaultInterface.Open(pUrl);
end;

procedure TJetCarNetscape.AddUrl(const pUrl: WideString; const pInfo: WideString; 
                                 const pReferer: WideString);
begin
  DefaultInterface.AddUrl(pUrl, pInfo, pReferer);
end;

procedure TJetCarNetscape.AddUrlList(var pList: OleVariant);
begin
  DefaultInterface.AddUrlList(pList);
end;

function  TJetCarNetscape.IsUrlExist(const pUrl: WideString): WordBool;
begin
  Result := DefaultInterface.IsUrlExist(pUrl);
end;

function  TJetCarNetscape.AddUrlEx(const pUrl: WideString; const pInfo: WideString; 
                                   const pReferer: WideString; const pSaveTo: WideString; 
                                   uFlags: Integer): WordBool;
begin
  Result := DefaultInterface.AddUrlEx(pUrl, pInfo, pReferer, pSaveTo, uFlags);
end;

function  TJetCarNetscape.AddUrlListEx(var pList: OleVariant; const pSaveTo: WideString; 
                                       uFlags: Integer): Integer;
begin
  Result := DefaultInterface.AddUrlListEx(pList, pSaveTo, uFlags);
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TJetCarNetscapeProperties.Create(AServer: TJetCarNetscape);
begin
  inherited Create;
  FServer := AServer;
end;

function TJetCarNetscapeProperties.GetDefaultInterface: IJetCarNetscape;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

class function CoIeCatch2.Create: IIeCatch2;
begin
  Result := CreateComObject(CLASS_IeCatch2) as IIeCatch2;
end;

class function CoIeCatch2.CreateRemote(const MachineName: string): IIeCatch2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_IeCatch2) as IIeCatch2;
end;

procedure TIeCatch2.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{A5366673-E8CA-11D3-9CD9-0090271D075B}';
    IntfIID:   '{A5366672-E8CA-11D3-9CD9-0090271D075B}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TIeCatch2.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as IIeCatch2;
  end;
end;

procedure TIeCatch2.ConnectTo(svrIntf: IIeCatch2);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TIeCatch2.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TIeCatch2.GetDefaultInterface: IIeCatch2;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TIeCatch2.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TIeCatch2Properties.Create(Self);
{$ENDIF}
end;

destructor TIeCatch2.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TIeCatch2.GetServerProperties: TIeCatch2Properties;
begin
  Result := FProps;
end;
{$ENDIF}

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TIeCatch2Properties.Create(AServer: TIeCatch2);
begin
  inherited Create;
  FServer := AServer;
end;

function TIeCatch2Properties.GetDefaultInterface: IIeCatch2;
begin
  Result := FServer.DefaultInterface;
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents('ActiveX',[TIeCatch, TJetCarNetscape, TIeCatch2]);
end;

end.
