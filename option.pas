unit option;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls,ShlObj,ActiveX,ComObj, FileCtrl,Registry, ComCtrls, Menus;

type
  TOptionForm = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    TabSheet3: TTabSheet;
    ListBox2: TListBox;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Button5: TButton;
    ListBox3: TListBox;
    Button4: TButton;
    Button3: TButton;
    Button2: TButton;
    Button6: TButton;
    PopupMenu5: TPopupMenu;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    GroupBox2: TGroupBox;
    titlecheckbox: TCheckBox;
    UrlCheckBox: TCheckBox;
    softCheckBox: TCheckBox;
    TimeCheckBox: TCheckBox;
    hrefCheckBox: TCheckBox;
    sound1: TCheckBox;
    savetf1: TCheckBox;
    Label3: TLabel;
    Edit3: TEdit;
    GroupBox3: TGroupBox;
    Edit2: TEdit;
    Label2: TLabel;
    Button1: TButton;
    Button7: TButton;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    Button8: TButton;
    edit1: TComboBox;
    Edit4: TEdit;
    Button9: TButton;
    Memo1: TMemo;
    Bevel1: TBevel;
    GroupBox4: TGroupBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Bevel2: TBevel;
    Bevel3: TBevel;
    GroupBox5: TGroupBox;
    Button10: TButton;
    Edit5: TEdit;
    FontDialog1: TFontDialog;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sound1Click(Sender: TObject);
    procedure savetf1Click(Sender: TObject);
    procedure UrlCheckBoxClick(Sender: TObject);
    procedure titlecheckboxClick(Sender: TObject);
    procedure softCheckBoxClick(Sender: TObject);
    procedure TimeCheckBoxClick(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure hrefCheckBoxClick(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure edit1Click(Sender: TObject);
    procedure edit1Change(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OptionForm: TOptionForm;

implementation

{$R *.DFM}
uses save1,save2, about, save3;

//－－－－－－－－－－－－－－　文件合并

procedure TOptionForm.Button3Click(Sender: TObject);
begin                 //清除
OptionForm.ListBox2.Items.Clear;
end;

procedure TOptionForm.Button4Click(Sender: TObject);
var
i:integer;
f,f1:textfile;
filestr,filestr1,fileccd:string;
begin                                      //合并***********************************
filestr:='';
if OptionForm.ListBox2.Items.Count>0 then
begin
filestr1:=GetTempDirectory+'savetext\addtemp.txt';
assignfile(f1,filestr1);
rewrite(f1);
closefile(f1);
for i:=0 to OptionForm.ListBox2.Items.Count-1 do
      begin
      filestr:= OptionForm.ListBox2.Items.Strings[i];
      assignfile(f,filestr);
      Reset(f);
            append(f1);
              while not eof(f) do
              begin
              readln(f,fileccd);
              writeln(f1,fileccd);
              end;
      closefile(f);
      closefile(f1);
       end;
  end;
  if Form2.ListBox1.ItemIndex>=0 then
Form2.SaveDialog1.InitialDir :=myinifile.readstring('savesort',Form2.ListBox1.Items.Strings[Form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0)));
if Form2.SaveDialog1.Execute then
renamefile(filestr1,Form2.SaveDialog1.FileName);

end;

procedure TOptionForm.Button2Click(Sender: TObject);
var             //加入
temp1dir:string;
begin
Form2.OpenDialog1.Options := [ofallowmultiselect];
if temp1dir<>'' then
Form2.OpenDialog1.InitialDir :=temp1dir
else
if Form2.ListBox1.ItemIndex>=0 then
Form2.OpenDialog1.InitialDir :=myinifile.readstring('savesort',Form2.ListBox1.Items.Strings[Form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0)));
if Form2.OpenDialog1.Execute then
OptionForm.ListBox2.Items.AddStrings (Form2.OpenDialog1.Files);
 temp1dir:= Form2.OpenDialog1.InitialDir;

end;
 //-------------　类别设置

 procedure TOptionForm.Button1Click(Sender: TObject);
begin //------------设置根目录
if SelectDirectory(langtempini.ReadString('other','9014','浏览'),'',ccdsavedir) then
begin
optionform.edit2.text:= ccdsavedir;
myinifile.WriteString('option','defaultsavedir',ccdsavedir);
end;

end;

 //－－－－－－－－－程序换肤
 procedure TOptionForm.ListBox3Click(Sender: TObject);
var ccdlu:string;            //换肤
begin
if OptionForm.ListBox3.ItemIndex>=0 then
      begin
ccdlu :=skinini.readstring('skins',OptionForm.ListBox3.Items.Strings[OptionForm.ListBox3.ItemIndex],ExtractFilePath(Paramstr(0)));//确定图片目录
if fileexists(ccdlu +'1.bmp')
 and fileexists(ccdlu +'2.bmp')
 then
 begin
 form1.Image5.Picture.LoadFromFile (ccdlu +'1.bmp');
 form1.Image6.Picture.LoadFromFile (ccdlu +'2.bmp');
if ccdsave then
form1.image1.Picture.Bitmap:=form1.image6.Picture.Bitmap
else
form1.image1.Picture.Bitmap:=form1.image5.Picture.Bitmap;
form1.Width :=form1.Image1.Width ;
form1.Height :=form1.Image1.Height;
  end;
end;

end;

procedure TOptionForm.Button5Click(Sender: TObject);
begin            //恢复原状

form1.image6.Picture.Bitmap:=form1.image2.Picture.Bitmap;
form1.image5.Picture.Bitmap:=form1.image3.Picture.Bitmap;
if OptionForm.savetf1.Checked=false then
form1.image1.Picture.Bitmap:=form1.image5.Picture.Bitmap
else
form1.image1.Picture.Bitmap:=form1.image6.Picture.Bitmap;
form1.Width :=form1.Image1.Width ;
form1.Height :=form1.Image1.Height;
end;
{var
i:integer;
begin
ccdhave1:=true;
if OptionForm.ListBox1.Items.Count>0 then
for i:=0 to OptionForm.ListBox1.Items.Count-1 do
if OptionForm.Edit1.Text=OptionForm.ListBox1.Items.Strings[i] then
begin
if OptionForm.Edit2.Text=myinifile.readstring('savesort',OptionForm.Edit1.Text,ExtractFilePath(Paramstr(0)))
then
begin
   ccdhave1:=false;
   break;
end;
   end;
if (ccdhave1=true)and (OptionForm.Edit2.Text <>'')and (OptionForm.Edit1.Text <>'') then
begin
   myinifile.writestring('savesort',OptionForm.Edit1.Text,OptionForm.Edit2.Text);
   OptionForm.ListBox1.Items.Add(OptionForm.Edit1.Text);
  OptionForm.StatusBar1.Panels[0].Text:='这是'+OptionForm.Edit1.Text+'保存目录是'+OptionForm.edit2.Text ;
    form1.ListBox1.Items :=OptionForm.ListBox1.Items;
end
else
begin
if (ccdhave1=false)then
messagebox(getactivewindow(),'已有此类别。','错误',mb_iconwarning);
if (OptionForm.Edit2.Text ='') then
messagebox(getactivewindow(),'没有指定目录。','错误',mb_iconwarning);
if (OptionForm.Edit2.Text ='') then
messagebox(getactivewindow(),'没有类别名。','错误',mb_iconwarning);
end;
OptionForm.Label1.Caption :='类别：';
OptionForm.Label2.Caption :='默认目录：' ;
OptionForm.StatusBar1.Panels[0].Text:='';
OptionForm.StatusBar1.Font.Color:=clblack;
OptionForm.Label1.Enabled:=false;
OptionForm.Label2.Enabled:=false;
OptionForm.edit1.Enabled:=false;
OptionForm.edit2.Enabled:=false;

   end; }

procedure TOptionForm.Button6Click(Sender: TObject);
   var
     i,i1:integer;
     ccdname,ccdname1,ccdname2:widestring;
begin
 ccdname:='';
OptionForm.ListBox3.Items.Clear;
ccdfound:=(SearchFile('1.bmp',ExtractFileDir(Application.Exename), True, True));
 for i:=0 to ccdfound.Count-1 do
 begin
           ccdname2:=ccdfound[i];
           for i1:=length(ccdname2)-1 downto 1 do
            begin
           ccdname1:=copy(ccdname2,i1,1);
           if ccdname1='\' then break
           else
           ccdname:=ccdname1+ccdname;
          end;
 OptionForm.ListBox3.Items.Add(ccdname);
skinini.WriteString('skins',ccdname,ccdfound[i]);
 end;

end;
//-------------------------窗体----


procedure TOptionForm.FormShow(Sender: TObject);
begin
optionform.Button8.Visible:=false;
optionform.Edit3.Enabled :=false;
optionform.Label3.Enabled :=false;
optionform.CheckBox1.Checked:=true;
optionform.edit1.Items :=form2.ListBox1.Items;
optionform.edit1.ItemIndex :=form2.ListBox1.ItemIndex ;
//optionform.Edit3.Text:=myinifile.readstring('savesort',
//optionform.edit1.Items.Strings[optionform.edit1.ItemIndex],ExtractFilePath(Paramstr(0)));
if optionform.Edit3.Text<>(ccdsavedir+optionform.Edit1.Text) then
optionform.CheckBox1.Checked :=false;
ccdsave:= myinifile.readbool('option','autosave',true);
OptionForm.savetf1.Checked :=ccdsave;
ccdsound:= myinifile.readbool('option','sound',true);
OptionForm.sound1.Checked:=ccdsound;
CcdTime:= myinifile.readbool('option','savetime',true);
OptionForm.TimeCheckBox.Checked:=CcdTime;
CcdUrl:= myinifile.readbool('option','saveurl',true);
OptionForm.UrlCheckBox.Checked:=CcdUrl;
CcdSoft:= myinifile.readbool('option','savesoft',true);
OptionForm.softCheckBox.Checked:=CcdSoft;
CcdTitle:= myinifile.readbool('option','savetitle',true);
OptionForm.titlecheckbox.Checked:=CcdTitle;
Ccdhref:= myinifile.readbool('option','savehref',true);
OptionForm.hrefcheckbox.Checked:=Ccdhref;
optionform.Edit2.Text:=ccdsavedir;
OptionForm.CheckBox4.Checked :=myinifile.readbool('option','desktop',false);
OptionForm.CheckBox3.Checked:=myinifile.readbool('option','startrun',false );
OptionForm.CheckBox2.Checked:=myinifile.readbool('option','Quick Launch',false );
//--------------------程序设置－－－－－－－－－－

end;



procedure TOptionForm.sound1Click(Sender: TObject);
begin
//判断是否要声音＝＝＝＝＝＝＝
if OptionForm.sound1.Checked =true then
begin
ccdsound:=true;
OptionForm.Button9.Visible :=true;
OptionForm.Edit4.Visible :=true;
OptionForm.Edit4.Text:=myinifile.ReadString ('option','wav','');
end
else
begin
ccdsound:=false;
OptionForm.Button9.Visible :=false;
OptionForm.Edit4.Visible :=false;
end;
myinifile.writebool('option','sound',OptionForm.sound1.Checked );
end;

procedure TOptionForm.savetf1Click(Sender: TObject);
begin
 if OptionForm .savetf1.Checked then
begin
ccdsave:=true;
form1.image1.Picture.Bitmap:=form1.image6.Picture.Bitmap;
 end
else
begin
ccdsave:=false;
form1.image1.Picture.Bitmap:=form1.image5.Picture.Bitmap;
end;
myinifile.writebool('option','autosave',ccdsave);
form1.Width :=form1.Image1.Width ;
form1.Height :=form1.Image1.Height;
end;

procedure TOptionForm.UrlCheckBoxClick(Sender: TObject);
begin
if OptionForm.UrlCheckBox.Checked =true then
ccdurl:=true
else
ccdurl:=false;
myinifile.writebool('option','saveurl',OptionForm.UrlCheckBox.Checked );
end;

procedure TOptionForm.titlecheckboxClick(Sender: TObject);
begin
 if OptionForm.titlecheckbox.Checked =true then
ccdTitle:=true
else
ccdTitle:=false;
myinifile.writebool('option','savetitle',OptionForm.titlecheckbox.Checked );
end;

procedure TOptionForm.softCheckBoxClick(Sender: TObject);
begin
 if OptionForm.softCheckBox.Checked =true then
ccdSoft:=true
else
ccdSoft:=false;
myinifile.writebool('option','savesoft',OptionForm.softCheckBox.Checked );
end;

procedure TOptionForm.TimeCheckBoxClick(Sender: TObject);
begin
if OptionForm.TimeCheckBox.Checked =true then
ccdTime:=true
else
ccdTime:=false;
myinifile.writebool('option','savetime',OptionForm.TimeCheckBox.Checked );
end;



procedure TOptionForm.N12Click(Sender: TObject);
var          //上移
ccdii:integer;
begin
ccdii:=OptionForm.ListBox2.ItemIndex;
if OptionForm.ListBox2.ItemIndex >0 then
ListBox2.Items.Move(ListBox2.ItemIndex, ccdii-1);
OptionForm.ListBox2.Update;
end;

procedure TOptionForm.N13Click(Sender: TObject);
var
ccdii:integer;     //下移
begin
ccdii:=OptionForm.ListBox2.ItemIndex;
if (OptionForm.ListBox2.ItemIndex >=0) and (OptionForm.ListBox2.ItemIndex <OptionForm.ListBox2.Items.Count-1) then
ListBox2.Items.Move(ListBox2.ItemIndex, ccdii+1);
OptionForm.ListBox2.Update;
end;

procedure TOptionForm.N14Click(Sender: TObject);
begin        //移最高
if (OptionForm.ListBox2.ItemIndex >0) and (OptionForm.ListBox2.ItemIndex <=OptionForm.ListBox2.Items.Count-1) then
ListBox2.Items.Move(ListBox2.ItemIndex, 0);
OptionForm.ListBox2.Update;
end;

procedure TOptionForm.N15Click(Sender: TObject);
begin        //移最低
if (OptionForm.ListBox2.ItemIndex >=0) and (OptionForm.ListBox2.ItemIndex <OptionForm.ListBox2.Items.Count-1) then
ListBox2.Items.Move(ListBox2.ItemIndex, OptionForm.ListBox2.Items.Count-1);
OptionForm.ListBox2.Update;
end;

procedure TOptionForm.hrefCheckBoxClick(Sender: TObject);
begin
if OptionForm.hrefCheckBox.Checked =true then
ccdhref:=true
else
ccdhref:=false;
myinifile.writebool('option','savehref',OptionForm.hrefCheckBox.Checked );
end;

procedure TOptionForm.Button7Click(Sender: TObject);
var i:integer;
testdir:string;
ccdtfdir:boolean;
begin
ccdtfdir:=false;
 testdir:= optionform.Edit3.Text+'test0001savetext';
if ForceDirectories(testdir)=false then
messagebox(getactivewindow(),
pchar(langtempini.ReadString('other','9019','无法建立目录，请重新更改本类别对应目录。')),
pchar(langtempini.ReadString('other','9004','错误')),mb_iconwarning)
else
begin
if not DirectoryExists(optionform.Edit3.Text) then
ForceDirectories(optionform.Edit3.Text);
rmdir(testdir);
ccdtfdir:=true;
end;

if (trim(optionform.Edit1.Text) <>'') then
begin

 //添加类别=========================
if Form2.ListBox1.Items.Count>0 then
for i:=0 to Form2.ListBox1.Items.Count-1 do
if OptionForm.Edit1.Text=Form2.ListBox1.Items.Strings[i] then
begin
   ccdhave1:=true;
   break;
end
else
   ccdhave1:=false;

if (ccdtfdir )and (ccdhave1=false)and (OptionForm.Edit3.Text <>'')and (OptionForm.Edit1.Text <>'') then
begin
   myinifile.writestring('savesort',OptionForm.Edit1.Text,OptionForm.Edit3.Text);
   Form2.ListBox1.Items.Add(OptionForm.Edit1.Text);
    form1.ListBox1.Items :=Form2.ListBox1.Items;
    messagebox(getactivewindow(),
pchar(langtempini.ReadString('other','9020','成功命名！')),'OK',MB_ICONINFORMATION) ;
optionform.Close;
if  form2.ListBox1.ItemIndex>=0 then
form2.StatusBar1.Panels[0].Text:=
langtempini.ReadString('other','9007','这是')
+form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex]
+langtempini.ReadString('other','9006','  保存目录是')
+myinifile.readstring('savesort',
form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0)));
end
else
begin
if (ccdtfdir )and (ccdhave1=true)and (OptionForm.Edit3.Text <>'')and (OptionForm.Edit1.Text <>'')then
begin
myinifile.writestring('savesort',OptionForm.Edit1.Text,OptionForm.Edit3.Text);
form1.ListBox1.Items :=Form2.ListBox1.Items;
messagebox(getactivewindow(),
pchar(langtempini.ReadString('other','9020','成功命名！')),'OK',MB_ICONINFORMATION) ;
optionform.Close;
if  form2.ListBox1.ItemIndex>=0 then
form2.StatusBar1.Panels[0].Text:=
langtempini.ReadString('other','9007','这是')
+form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex]
+langtempini.ReadString('other','9006','  保存目录是')
+myinifile.readstring('savesort',
form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0)));

end ;

end;
end;//edit1<>''
end;
procedure TOptionForm.CheckBox1Click(Sender: TObject);
begin
if not optionform.CheckBox1.Checked then
begin
optionform.Button8.Visible:=true;
optionform.Edit3.Enabled :=true;
optionform.Label3.Enabled :=true;
end
else
begin
optionform.Button8.Visible:=false;
optionform.Edit3.Enabled :=false;
optionform.Label3.Enabled :=false;
if optionform.Edit1.Text<>'' then
optionform.Edit3.Text:=ccdsavedir+optionform.Edit1.Text ;
end;
end;

procedure TOptionForm.edit1Click(Sender: TObject);
begin
if optionform.Edit3.Text=(ccdsavedir+optionform.Edit1.Text) then
optionform.CheckBox1.Checked :=true
else
begin
optionform.CheckBox1.Checked :=false;
optionform.Edit3.Text:=myinifile.readstring('savesort',
optionform.edit1.Items.Strings[optionform.edit1.ItemIndex],ExtractFilePath(Paramstr(0)));
end;
end;

procedure TOptionForm.edit1Change(Sender: TObject);
begin
if optionform.Edit3.Text<>(ccdsavedir+optionform.Edit1.Text) then
optionform.CheckBox1.Checked :=false
else
optionform.CheckBox1.Checked :=true;
end;

procedure TOptionForm.Button8Click(Sender: TObject);
var ccdtempdir:string;
begin
 if SelectDirectory(
langtempini.ReadString('other','9014', '浏览'),'',ccdtempdir) then
optionform.edit3.text:= ccdtempdir;
end;

procedure TOptionForm.Button9Click(Sender: TObject);
begin
form2.OpenDialog1.Filter:=
langtempini.ReadString('other','9021','声音文件|*.wav|所有文件|*.*');
if form2.OpenDialog1.Execute then
optionform.Edit4.Text :=form2.OpenDialog1.FileName;
myinifile.writestring('option','wav',optionform.Edit4.Text);
end;

procedure TOptionForm.CheckBox3Click(Sender: TObject);
begin
if Checkbox3.checked then
  begin
      with TRegistry.Create do
        try
          begin
            RootKey:=HKEY_LOCAL_MACHINE;
            if OpenKey('Software\Microsoft\Windows\CurrentVersion\run', false) then
            WriteString('Autowall',Application.ExeName);//
          end;
        finally
          CloseKey;
          free;
        end;
  end else
    begin
        with TRegistry.Create do
        try
          begin
            RootKey:=HKEY_LOCAL_MACHINE;
            if OpenKey('Software\Microsoft\Windows\CurrentVersion\run', false) then
            DeleteValue('Autowall');
          end;
        finally
          CloseKey;
          free;
        end;
    end;
myinifile.writebool('option','startrun',OptionForm.CheckBox3.Checked );
end;

procedure TOptionForm.CheckBox4Click(Sender: TObject);
 var
  Pidl: PItemIDList;
//  handle : THandle;
  ShLink: IShellLink;
  PFile: IPersistFile;
  FileNameccd: String;
  FileNameccd1: widestring;
begin
if (SUCCEEDED(SHGetSpecialFolderLocation(form1.handle, CSIDL_DESKTOP, Pidl)))
then //other placeid is  CSIDL_APPDATA  CSIDL_DESKTOP,CSIDL_NETHOOD,CSIDL_PRINTHOOD,
//CSIDL_PROGRAMS,CSIDL_SENDTO,CSIDL_STARTMENU,CSIDL_STARTUP
begin
  SetLength(FileNameccd, MAX_PATH);
  SHGetPathFromIDList(Pidl, PChar(FileNameccd));
  SetLength(FileNameccd, StrLen(PChar(FileNameccd)));
 // result := LinkDir+'\Microsoft\Internet Explorer\Quick Launch\';
  FileNameccd1 := FileNameccd + '\'+
  langtempini.ReadString('other','9022','一拖即存')+'.lnk';
//
  end;
if (OptionForm.CheckBox4.Checked) then
begin
 if FileExists(FileNameccd1) then Exit;
  ShLink := CreateComObject (CLSID_ShellLink) as IShellLink;
  PFile := ShLink as IPersistFile;
  ShLink.SetPath(PChar(Application.ExeName));
  ShLink.SetWorkingDirectory(PChar(ExtractFilePath(Application.ExeName)));
  PFile.Save(pwchar(FileNameccd1), False);
end
else
if FileExists(FileNameccd1) then deletefile(FileNameccd1);
myinifile.writebool('option','desktop',OptionForm.CheckBox4.Checked );
end;

procedure TOptionForm.CheckBox2Click(Sender: TObject);
 var
  Pidl: PItemIDList;
//  handle : THandle;
  ShLink: IShellLink;
  PFile: IPersistFile;
  FileNameccd: String;
  FileNameccd1: widestring;
begin
if (SUCCEEDED(SHGetSpecialFolderLocation(form1.handle, CSIDL_APPDATA, Pidl)))
then //other placeid is  CSIDL_APPDATA  CSIDL_DESKTOP,CSIDL_NETHOOD,CSIDL_PRINTHOOD,
//CSIDL_PROGRAMS,CSIDL_SENDTO,CSIDL_STARTMENU,CSIDL_STARTUP
begin
  SetLength(FileNameccd, MAX_PATH);
  SHGetPathFromIDList(Pidl, PChar(FileNameccd));
  SetLength(FileNameccd, StrLen(PChar(FileNameccd)));
 // result := LinkDir+'\Microsoft\Internet Explorer\Quick Launch\';
  FileNameccd1 := FileNameccd +'\Microsoft\Internet Explorer\Quick Launch\'+
  langtempini.ReadString('other','9022','一拖即存')+'.lnk';
  end;
if (OptionForm.CheckBox2.Checked) then
begin
  if FileExists(FileNameccd1) then Exit;
  ShLink := CreateComObject (CLSID_ShellLink) as IShellLink;
  PFile := ShLink as IPersistFile;
  ShLink.SetPath(PChar(Application.ExeName));
  ShLink.SetWorkingDirectory(PChar(ExtractFilePath(Application.ExeName)));
  PFile.Save(pwchar(FileNameccd1), False);
end
else
if FileExists(FileNameccd1) then deletefile(FileNameccd1);
myinifile.writebool('option','Quick Launch',OptionForm.CheckBox2.Checked );
end;
procedure TOptionForm.Button10Click(Sender: TObject);
begin
if optionform.FontDialog1.Execute then
begin
optionform.Edit5.Font:=optionform.FontDialog1.Font;
myinifile.Writeinteger('formfontstyle','charset',optionform.FontDialog1.Font.Charset);
myinifile.Writeinteger('formfontstyle','color',optionform.FontDialog1.Font.Color);
myinifile.Writeinteger('formfontstyle','size',optionform.FontDialog1.Font.Size );
myinifile.WriteString ('formfontstyle','name',optionform.FontDialog1.Font.Name );
form2.Font:=optionform.FontDialog1.Font;
form3.Font:=optionform.FontDialog1.Font;
optionform.Font:=optionform.FontDialog1.Font;
replaceform.Font:=optionform.FontDialog1.Font;
end;
end;

end.
