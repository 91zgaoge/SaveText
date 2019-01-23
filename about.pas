unit about;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,{registry, }ExtCtrls,shellapi, jpeg;

type
  TForm3 = class(TForm)
    Image1: TImage;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    Label15: TLabel;
    GroupBox3: TGroupBox;
    Label16: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Button1: TButton;
    Button3: TButton;
    Edit1: TEdit;
    regEdit: TEdit;
    IDEdit: TEdit;
    Button2: TButton;
    regLabel: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Image2: TImage;
    lbl1: TLabel;
    procedure Label8Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure lbl1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.DFM}
uses save1,save2;
  procedure URLink(URL:pchar);
begin
try
ShellExecute(0, nil, URL, nil, nil, SW_NORMAL);
finally
end;
end;
procedure TForm3.Label8Click(Sender: TObject);
begin
  URLink('http://soft.91z.net');
end;

procedure TForm3.Image1Click(Sender: TObject);
begin
   URLink('mailto:soft@91z.net');
   
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  URLink('mailto:soft@91z.net?subject=Register-for-the-Savetext');
end;

procedure TForm3.Button3Click(Sender: TObject);
// var Reg: TRegistry;
begin  //注册
if form3.regEdit.Text=pass(form3.idedit.text) then
begin
 {  Reg := TRegistry.Create;
    Reg.RootKey :=HKEY_USERS;
     if   reg.openKey('.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt',true) then
   reg.Writeinteger('register',1);
      Reg.CloseKey;
        Reg.Free;  }
myinifile.WriteString('Register','user',form3.edit1.text);
myinifile.WriteString('Register','regcode',form3.regedit.text);
form3.Label2.Caption :=myinifile.readString('Register','user',form3.edit1.text);
form3.Height :=form3.GroupBox2.Height +25;
ccdregsave:='';
end;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
form3.Close ;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
if (myinifile.ReadString('Register','regcode',''))=(pass(form3.IDEdit.Text)) then
begin
form3.Label2.Caption := myinifile.readString('Register','user','');
form3.GroupBox3.Destroy ;
//form3.GroupBox1.Destroy;
//form3.Memo1.Destroy;
form3.Height :=form3.GroupBox2.Height +25;
end;
end;

procedure TForm3.Label2Click(Sender: TObject);
begin
   URLink('http://soft.91z.net');
end;

procedure TForm3.Image2Click(Sender: TObject);
begin
 form3.Edit1.Text:='高歌软件十周年纪念赠送版';
form3.regEdit.Text:=pass(form3.idedit.text);
end;

procedure TForm3.lbl1Click(Sender: TObject);
begin
 URLink('http://item.taobao.com/auction/item_detail.jhtml?item_id=23c5300b734a1edc636aac6b0acfba86&x_id=0db2');
end;

end.
