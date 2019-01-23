unit save1;

interface

uses
  Menus, CoolTrayIcon, ActiveX, ComObj, Controls,Registry,
  StdCtrls, Graphics, Classes, Windows,SysUtils,Filectrl,Shellapi,
  mmsystem,Messages,Clipbrd,IniFiles,Forms,ExtCtrls, ImgList,
  OleServer, JCCATCHLib_TLB;

type  TForm1 = class(TForm)

    PopupMenu1: TPopupMenu;
    mpaste: TMenuItem;
    mshow: TMenuItem;
    N2: TMenuItem;
    mexit: TMenuItem;
    CoolTrayIcon1: TCoolTrayIcon;
    N4: TMenuItem;
    Image1: TImage;
    ListBox1: TListBox;
    Image3: TImage;
    Image5: TImage;
    Image6: TImage;
    mskin: TMenuItem;
    Image2: TImage;
    PubListBox: TListBox;
    N1: TMenuItem;
    lang1: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;


        procedure DoDroped(Sender:TObject;pt:tpoint);
    procedure DoDropover(Sender:TObject;pt:tpoint);
    procedure DoDropenter(Sender:TObject;pt:tpoint);
    procedure DoDropLeave(Sender:TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mexitClick(Sender: TObject);
    procedure mshowClick(Sender: TObject);
 procedure MylangClick(Sender: TObject);
    procedure MypasteClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
      procedure PopupMenu1Popup(Sender: TObject);
     procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1DblClick(Sender: TObject);
    procedure CoolTrayIcon1DblClick(Sender: TObject);
    procedure mphotowinClick(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure CoolTrayIcon1Click(Sender: TObject);
       private
    { Private declarations }
  public
//   Picts:TBitmap;   //各个图象

    { Public declarations }

  end;
  function GetHDSerialNumber(Drv : String): String;
  function pass(pstr:string):string;
     function replacing(S,source,target:string):string;
    function MakeFileName(FileText:widestring): wideString;
    function SearchFile(sFileName, sRootDir: string;
                    bFileOnly, bRecurse: boolean): TStringList;
     function GetTempDirectory: String;
     function formchange(var ccdini:tinifile): boolean;
     function Decode_UTF8(buf: PChar): String;
     Function CcdHtmlFind(regtext:widestring;var ccdurl:widestring;
var ccdtitle:widestring;var ccdhref:tstringlist):boolean;


    var
  Form1: TForm1;
  JetCarNetscape1:TJetCarNetscape;
          cdchange:Boolean;//判断FORM1的换肤菜单是否已经添加
          ccdhave1:Boolean;//判断类别中是否有同样的
         ccdform1top :integer;//form1.top
         seedir:string;   // 类目目录
         seename:string;    //类目名称
         seedir2:string;   // form2类目目录
         seename2:string;    //form2类目名称
      myinifile:Tinifile;
      langtempini:tinifile;
      skinini:Tinifile;
        ccdfound: TStringList;//skin
   ccdshow:Boolean;    //设置窗口form2是否可见
  ccdsave:boolean;   //是否自动保存
  ccdpaste:boolean;  //单键粘贴
  CcdTime:boolean;   // 记录时间
  CcdUrl:boolean;   //  记录URL
  ccdsound:boolean;     //  是否有声
  ccdwave:string;
  CcdTitle:boolean; //记录标题
  CcdSoft:boolean;//  软件下载
  Ccdhref:boolean;//  下载链接
  ccdsavedir,ccdregsave:string;//默认根目录和注册文字
 tempccd:string;//草稿
  Filename:string;
  Filenameskin:string;
   ccdfilename:widestring;
   ccddir:widestring;
  implementation
  {$R savebmp.res}
{$R *.DFM}
 uses  dragdrop,save2, option, save3, about ;
 var  dd:TTMyDrop ;
function GetHDSerialNumber(Drv : String): String;
var
  VolumeSerialNumber : DWORD;
  MaximumComponentLength : DWORD;
  FileSystemFlags : DWORD;
begin
  if Drv[Length(Drv)] =':' then Drv := Drv + '\';
  GetVolumeInformation(pChar(Drv),
                       nil,
                       0,
                       @VolumeSerialNumber,
                       MaximumComponentLength,
                       FileSystemFlags,
                       nil,
                       0);
  Result := IntToHex(HiWord(VolumeSerialNumber), 4) +
            '-' +
            IntToHex(LoWord(VolumeSerialNumber), 4);
end;
 function pass(pstr:string):string;
var str,str1,str2,str3:string;
i,j:integer;
begin
str:=pstr;
for i:=1 to length(str) do begin
//进行第一次变换
j:=(i*i*i mod (i+5))+(i*i mod (i+7))+i*2+1;
str1:=str1+inttostr(strtoint(str[i])+j); //第二次变换
j:=(i*i*i mod (i+3))+(i*i mod (i+4))+i*2+1;
str1:=str1+inttostr(strtoint(str[i])+j); end;
for i:=0 to (round(length(str1)/5)-1) do
begin
for j:=1 to 5 do
str2:=copy(copy(str1,(i*5)+1,5),j,1)+str2;
str3:=str3+str2+'-';
str2:='';
end;
pass:=str3+'ccd';
end;

function formchange(var ccdini:tinifile): boolean;
begin
if ccdini<>nil then
begin
//---form1
Form1.Caption :=ccdini.ReadString('formstyle1','1000','一拖即存');
Form1.mpaste.Caption :=ccdini.ReadString('formstyle1','1001','粘贴文字');
Form1.mshow.Caption :=ccdini.ReadString('formstyle1','1002','打开编辑与设置窗口');
Form1.mskin. Caption := ccdini.ReadString('formstyle1','1003','程序换肤');
form1.N1. Caption := ccdini.ReadString('formstyle1','1004','程序设置');
form1.N5. Caption := ccdini.ReadString('formstyle2','2038','关于');
Form1.mexit. Caption := ccdini.ReadString('formstyle1','1005','退出');
Form1.CoolTrayIcon1.Hint :=ccdini.ReadString('formstyle1','1006','高歌软件之一拖即存 ');
//---form2

Form2.Caption := ccdini.ReadString('formstyle2','2000','编辑窗　(版本号3.6a 高歌作坊　鸣巢出品　2001-05-15)');
Form2.RichEdit2.Hint :=ccdini.ReadString('formstyle2','2001', '|按右键可以编辑、保存内容、整理文件、调整界面等。');
Form2.ToolButton2.Hint :=ccdini.ReadString('formstyle2','2002', '打开无分类内容|在非分类状态下保存的内容。');
Form2.msave1.Hint :=ccdini.ReadString('formstyle2','2003', '保存内容');
Form2.BIG5GB.Caption :=ccdini.ReadString('formstyle2','2004', '内码转换');
Form2.mfile1.Hint :=ccdini.ReadString('formstyle2','2005', '段落重排|自行设置请先在右边填写每行字数。');
Form2.Panel4.Hint :=ccdini.ReadString('formstyle2','2045', '指重排时每行多少个全角汉字（相当两个英文字母）。');
Form2.Label3.Hint :=ccdini.ReadString('formstyle2','2045', '指重排时每行多少个全角汉字（相当两个英文字母）。');
Form2.Label3.Caption :=ccdini.ReadString('formstyle2','2006','每行字数：');
Form2.SpinEdit1.Hint :=ccdini.ReadString('formstyle2','2007', '选择你需要的每行字数。');
Form2.mcut1.Hint :=ccdini.ReadString('formstyle2','2008','剪切');
Form2.mcopy1.Hint :=ccdini.ReadString('formstyle2','2009', '复制');
Form2.mpaste21.Hint :=ccdini.ReadString('formstyle2','2010', '粘贴');
Form2.ToolButton3.Hint :=ccdini.ReadString('formstyle2','2011', '撤消');
Form2.ToolButton1.Hint :=ccdini.ReadString('formstyle2','2012', '全部清除' );
Form2.ListBox1.Hint :=ccdini.ReadString('formstyle2','2013', '类别框|按右键可以删除类别或调整类别上下顺序。' );
Form2.ShowFileLabel.Caption :=ccdini.ReadString('formstyle2','2014', '按保存顺序浏览');
Form2.BackTBtn.Hint :=ccdini.ReadString('formstyle2','2015', '后退浏览' );
Form2.ShowTBtn.Hint :=ccdini.ReadString('formstyle2','2016', '浏览当前保存内容');
Form2.msave.Caption :=ccdini.ReadString('formstyle2','2017', '保存');
Form2.mfile.Caption :=ccdini.ReadString('formstyle2','2018', '段落重排'   );
Form2.mfile.Hint :=ccdini.ReadString('formstyle2','2019', '把内容整理成每行30字数' );
Form2.textmove.Caption :=ccdini.ReadString('formstyle2','2020', '转移到' );
Form2.N4.Caption :=ccdini.ReadString('formstyle2','2011', '撤消');
Form2.mcopy.Caption :=ccdini.ReadString('formstyle2','2009', '复制' );
Form2.mpaste2.Caption :=ccdini.ReadString('formstyle2','2010', '粘贴' );
Form2.mcut.Caption :=ccdini.ReadString('formstyle2','2008', '剪切' );
Form2.mall.Caption :=ccdini.ReadString('formstyle2','2021', '全选' );
Form2.mfont.Caption :=ccdini.ReadString('formstyle2','2022', '字体设置');
Form2.mallclear.Caption :=ccdini.ReadString('formstyle2','2012', '全部清除' );
Form2.mcopyclear.Caption :=ccdini.ReadString('formstyle2','2023', '清除剪贴板内容' );
Form2.SaveDialog1.Filter :=ccdini.ReadString('formstyle2','2024', '文本文件 (*.TXT)|*.TXT|网页(*.htm)|*.htm' );
Form2.mleiopen.Caption :=ccdini.ReadString('formstyle2','2025', '浏览' );
Form2.mlei.Caption :=ccdini.ReadString('formstyle2','2037', '类别管理' );
Form2.listdel. Caption :=ccdini.ReadString('formstyle2','2027', '删除' );
Form2.listmove.Caption :=ccdini.ReadString('formstyle2','2028', '移至最高' );
Form2.OpenDialog1.Filter :=ccdini.ReadString('formstyle2','2024', '文本文件|*.txt|网页|*.htm|所有文件|*.*'  );
Form2.mrename.Caption :=ccdini.ReadString('formstyle2','2029', '以文字第一行重新命名' );
Form2.mreplace.Caption :=ccdini.ReadString('formstyle2','2030', '替换');
Form2.m2copy.Caption :=ccdini.ReadString('formstyle2','2009', '复制' );
Form2.m2clear.Caption :=ccdini.ReadString('formstyle2','2012', '全部清除'  );
Form2.N16.Caption :=ccdini.ReadString('formstyle2','2022', '字体设置' );
Form2.m2all.Caption :=ccdini.ReadString('formstyle2','2021', '全选' );
Form2.N6.Caption :=ccdini.ReadString('formstyle2','2031', '打开' );
Form2.N11.Caption :=ccdini.ReadString('formstyle2','2032', '完全删除');
Form2.N30.Caption :=ccdini.ReadString('formstyle2','2033', '删除到回收站' );
Form2.N21.Caption :=ccdini.ReadString('formstyle2','2034', '功能' );
Form2.N19.Caption :=ccdini.ReadString('formstyle2','2035', '文本合并'  );
Form2.N22.Caption :=ccdini.ReadString('formstyle2','2036', '程序换肤' );
 Form2.N10.Caption :=ccdini.ReadString('formstyle2','2037', '类别管理' );
Form2.moption.Caption :=ccdini.ReadString('formstyle1','1004', '程序设置');
Form2.N26. Caption :=ccdini.ReadString('formstyle2','2038', '关于' );
Form2. memail. Caption :=ccdini.ReadString('formstyle2','2039', '作者信箱' );
Form2. mhome1.Caption :=ccdini.ReadString('formstyle2','2040', '作者主页一');
//Form2.mhome2.Caption :=ccdini.ReadString('formstyle2','2041', '作者主页二' );
//Form2. mhome3. Caption :=ccdini.ReadString('formstyle2','2042', '作者主页三');
Form2. mhelp. Caption :=ccdini.ReadString('formstyle2','2043', '一拖即存帮助' );
Form2.N12.Caption :=ccdini.ReadString('formstyle2','2038', '关于' );
//---form3
Form3.Caption :=ccdini.ReadString('formstyle2','2038', '关于');
//Form3.Label1.Caption :=ccdini.ReadString('formstyle3','3001', '一拖即存3.6a版');
//Form3.Label2.Caption :=ccdini.ReadString('formstyle3','3002', '为女儿妍妍五个月而写' );
//Form3.Label3.Caption :=ccdini.ReadString('formstyle3','3003', '2000年5月15日' );
//Form3.Label4.Caption :=ccdini.ReadString('formstyle3','3004', '江西　南昌' );
//Form3.Label5.Caption :=ccdini.ReadString('formstyle3','30005', '作者：高歌'  );
//Form3.Memo1.text :=ccdini.ReadString('formstyle3','3006','3.6版新增功能：　1、可以保存网页的地址；2、可以选择性地保存网页里的链接；
//3、可以保存网页的标题...也就是说，拖存的网页源码已经完全得到了。4、可以自动调用FlashGet(网际快车)下载其中的软件链接。使用时，为了方便，
//请将FlashGet“工具”－“选项”－“其它”中的“确认”里面的“通过IE菜单项‘使用网际快车下载’添加任务”前面的勾去掉，并将你的一拖即存中
//的相关类别对应到FlashGet的下载软件存放目录。如果你的机器没有安装FlashGet(网际快车)，这项功能将被禁止。安装FlashGet(网际快车)后，请重新
//启动本程序进行设置。 5、可以设置为没有类别。增加系统根目录设置，自动建立对应目录。'  );
Form3.Button1.Caption :=ccdini.ReadString('formstyle3','3007', '关闭'  );
//---form4
OptionForm.Caption :=ccdini.ReadString('formstyle1','1004', '程序设置'  );
OptionForm.TabSheet2.Caption :=ccdini.ReadString('formstyle2','2026', '类别管理'  );
OptionForm.GroupBox1.Caption :=ccdini.ReadString('formstyle2','2026', '类别管理'  );
OptionForm.label1.Caption :=ccdini.ReadString('formstyle4','4002', '类别:'    );
OptionForm.Label3.Caption :=ccdini.ReadString('formstyle4','4003', '本类别对应目录：' );
OptionForm.Button7.Caption :=ccdini.ReadString('formstyle4','4004', '确定'  );
OptionForm.CheckBox1.Caption :=ccdini.ReadString('formstyle4','4005', '放在默认根目录下'   );
OptionForm.Button8.Caption :=ccdini.ReadString('formstyle4','4006', '浏览' );
OptionForm.GroupBox3.Caption :=ccdini.ReadString('formstyle4','4007', '默认根目录' );
OptionForm.label2.Caption :=ccdini.ReadString('formstyle4','4008', '默认拖存目录：'    );
OptionForm.Label5.Caption :=ccdini.ReadString('formstyle4','4009',  '根目录的意思就是：如默认目录为"C:\savetext"，建立新类别"新闻 "，则程序自动在默认根目录下生成这个类别的对应目录，即"c:\savetext\新闻"这个目录。'  );
OptionForm.Button1.Hint :=ccdini.ReadString('formstyle4','4010', '类别、目录改变|点击此处更改类别目录并自动添加新类别或对应目录。'  );
OptionForm.Button1.Caption :=ccdini.ReadString('formstyle4','4011', '浏览目录并确认...' );
OptionForm.TabSheet3.Caption :=ccdini.ReadString('formstyle4','4012', '文件合并'  );
OptionForm.Button4.Caption :=ccdini.ReadString('formstyle4','4013', '合并'  );
OptionForm.Button3.Caption :=ccdini.ReadString('formstyle4','4014', '清除合并列表'  );
OptionForm.Button2.Caption :=ccdini.ReadString('formstyle4','4015', '加入合并列表'  );
OptionForm.TabSheet4.Caption :=ccdini.ReadString('formstyle1','1004', '程序设置' );
OptionForm.GroupBox2.Caption :=ccdini.ReadString('formstyle4','4016', '拖存时' );
OptionForm.titlecheckbox. Caption :=ccdini.ReadString('formstyle4','4017', '记录网页标题'   );
OptionForm.UrlCheckBox. Caption :=ccdini.ReadString('formstyle4','4018', '记录网址'  );
OptionForm.softCheckBox. Caption :=ccdini.ReadString('formstyle4','4019', '软件自动下载'   );
OptionForm.TimeCheckBox.Caption :=ccdini.ReadString('formstyle4','4020', '记录时间' );
OptionForm.hrefCheckBox.Caption :=ccdini.ReadString('formstyle4','4021', '记录所选文字中的链接'  );
OptionForm. sound1. Caption :=ccdini.ReadString('formstyle4','4022', '使用系统默认声音提示(按“浏览”可自定义声音)'  );
OptionForm.savetf1. Caption :=ccdini.ReadString('formstyle4','4023', '每次自动保存(也可直接按小拖放窗口右侧的小竖木条)'  );
OptionForm.Button9. Caption :=ccdini.ReadString('formstyle4','4024', '浏览'  );
OptionForm.GroupBox4.Caption :=ccdini.ReadString('formstyle4','4025', '加入程序快捷方式到'  );
OptionForm.CheckBox2. Caption :=ccdini.ReadString('formstyle4','4026', '快速工具栏(左下角)' );
OptionForm.CheckBox3. Caption :=ccdini.ReadString('formstyle4','4027', '随系统启动而启动'  );
OptionForm. CheckBox4.Caption :=ccdini.ReadString('formstyle4','4028', '桌面'  );
OptionForm.TabSheet5.Caption :=ccdini.ReadString('formstyle4','4029', '程序换肤'   );
OptionForm. Button5. Caption :=ccdini.ReadString('formstyle4','4030', '恢复原状' );
OptionForm.ListBox3.Hint :=ccdini.ReadString('formstyle4','4031', '单击出现的皮肤进行程序换肤。'  );
OptionForm.Button6.Caption :=ccdini.ReadString('formstyle4','4032', '寻找Skin'  );
OptionForm.N12.Caption :=ccdini.ReadString('formstyle4','4033', '上移' );
OptionForm.N13. Caption :=ccdini.ReadString('formstyle4','4034', '下移' );
OptionForm.N14. Caption :=ccdini.ReadString('formstyle4','4035', '移到最高'  );
OptionForm. N15.Caption :=ccdini.ReadString('formstyle4','4036', '移到最低'  );
OptionForm.GroupBox5.Caption :=ccdini.ReadString('formstyle2','2022', '程序字体设置' );
OptionForm.Button10.Caption :=ccdini.ReadString('formstyle2','2022', '字体设置' );

//---form5
ReplaceForm.Caption :=ccdini.ReadString('formstyle5','5000', '替换');
ReplaceForm.Label1.Caption :=ccdini.ReadString('formstyle5','5001', '将' );
ReplaceForm.Label2.Caption :=ccdini.ReadString('formstyle5','5002', '替换为：' );
ReplaceForm.YBtn. Caption :=ccdini.ReadString('formstyle5','5003', '确定');
ReplaceForm. NBtn.Caption :=ccdini.ReadString('formstyle5','5004', '取消' );
result:=true;
end
else
result:=false;
end;


//在HTML中找出URL、标题和所有链接的函数
Function CcdHtmlFind(regtext:widestring;var ccdurl:widestring;
var ccdtitle:widestring;var ccdhref:tstringlist):boolean;
var ccd1,ccd2:integer;
ccdreg:widestring;
begin

if (pos('SourceURL:',PChar(regtext))<>0)
and (pos('<!DOCTYPE HTML',PChar(regtext))<>0) then
begin
ccd1:=pos('SourceURL:',PChar(regtext))+length('SourceURL:');
ccd2:=pos('<!DOCTYPE HTML',PChar(regtext));
ccdurl:=trim(copy(PChar(regtext),ccd1,(ccd2-ccd1)));
end;
if (pos('<TITLE>',PChar(regtext))<>0)
and (pos('</TITLE>',PChar(regtext))<>0) then
begin
ccd1:=pos('<TITLE>',PChar(regtext))+length('<TITLE>');
ccd2:=pos('</TITLE>',PChar(regtext));
ccdtitle:=trim(copy(PChar(regtext),ccd1,(ccd2-ccd1)));
end ;
if (pos('href="',PChar(regtext))<>0)
and (pos('"',(copy(PChar(regtext),pos('href="',PChar(regtext)),(length(PChar(regtext))-(pos('href="',PChar(regtext)))))))<>0) then
begin {source在S中出现的位置}
ccdhref:=tstringlist.Create;
ccdhref.Add('.');
ccdreg:=PChar(regtext);
repeat
begin
ccd1:=pos('href="',PChar(ccdreg))+length('href="');
 ccdreg:=copy(ccdreg,ccd1,(length(ccdreg)-ccd1+1));
ccd2:=pos('"',(ccdreg))-1;
if (copy(trim(copy(ccdreg,1,ccd2)),length(trim(copy(ccdreg,1,ccd2)))-2,3)<>'css') then
ccdhref.Add(trim(copy(ccdreg,1,ccd2)));
 ccdreg:=copy(ccdreg,ccd2,(length(ccdreg)-ccd2));
end;
until  pos('href="',PChar(ccdreg))=0;
end
else
begin
ccdhref:=tstringlist.Create;
ccdhref.Add('.');
end;


if (ccdurl<>'')and(ccdtitle<>'') then
begin
result:=true;
end
else
result:=false;
end;
//解UTF-8码的函数
function Decode_UTF8(buf: PChar): String;
var
 tmp: WideString;
  len: Integer;
begin
 len := MultiByteToWideChar(CP_UTF8,
            0,
                      PAnsiChar(buf),
                      -1,
                      PWideChar(tmp),
                      0);
 SetLength(tmp, len + 1);
 MultiByteToWideChar(CP_UTF8,
            0,
                      PAnsiChar(buf),
                      -1,
                      PWideChar(tmp),
                      len);
 result := WideCharToString(PWideChar(tmp));
end;

//取文章标题函数MakeFileName;
function MakeFileName(FileText:widestring): wideString;
  var
i,ccdtextnum,ccdnum:integer;
ctext:widestring;
begin
if FileText<>'' then

begin
          if length(filetext)>60 then
          ccdtextnum:=60
          else
          ccdtextnum:=length(filetext)-1;
          ctext:='';
          for i:=0 to ccdtextnum do
                begin
                ccdnum:= ord(FileText[i]);
                if ((ccdnum)=10) and (trim(ctext)<>'')then Break;
                          case ccdnum of
                          46:ctext:=ctext; //.
                          92:ctext:=ctext;//\
                          47:ctext:=ctext;///
                          58:ctext:=ctext;//:
                          42:ctext:=ctext; //*
                          63:ctext:=ctext; //?
                          34:ctext:=ctext; //"
                          60:ctext:=ctext;//<
                          62:ctext:=ctext; //>
                          124:ctext:=ctext;//|
                          else
                          if ccdnum<32 then
                          ctext:=ctext
                          else
                         ctext:=ctext+FileText[i];
                          end;
                end;
 if ctext='' then
 ctext:='savetext';
 result:=trim(ctext);
end
else
  result:='';

end;

 function replacing(S,source,target:string):string;
var site,StrLen:integer;
begin
{source在S中出现的位置}
repeat
begin
 site:=pos(source,s);
{source的长度}
StrLen:=length(source);
{删除source字符串}
delete(s,site,StrLen);
{插入target字符串到S中}
insert(target,s,site);
{返回新串}
replacing:=s;
end;
until  pos(source,s)=0;
end;

 {---------------------------------------
 文件查找函数 SearchFile

 参数说明:
     sFileName: 要查找的文件名称
     sRootDir:  指定在哪个目录中查找
     bFileOnly: 是否只查找文件
     bRecurse:  是否查找子目录

 返回值:
     FileList:  查找结果列表
----------------------------------------}
function SearchFile(sFileName, sRootDir: string;
                    bFileOnly, bRecurse: boolean): TStringList;
    //内嵌文件查找递归过程
    procedure DoSearchFile(sFileName, sRootDir: string;
                           bFileOnly, bRecurse: boolean;
                           var FileList: TStringList);
    var
      Found: integer;
      SearchRec: TSearchRec;
    begin
      //开始查找
      Found := FindFirst(sRootDir + '\*.*', faAnyFile, SearchRec);
      while Found = 0 do
      begin
        //遇到子目录时确定是否查找子目录和是否将符合条件的子目录加入查找结果
        if (SearchRec.Attr = faDirectory) and (SearchRec.Name <> '.') and
          (SearchRec.Name <> '..') then
        begin
          if (AnsiCompareText(sFileName, SearchRec.Name) = 0) and not bFileOnly then
            FileList.Add(sRootDir + '\' {+ SearchRec.Name});
          if bRecurse then
            DoSearchFile(sFileName, sRootDir + '\' + SearchRec.Name, bFileOnly, bRecurse, FileList);
        end
        //找到符合条件的文件时加入查找结果
        else if AnsiCompareText(sFileName, SearchRec.Name) = 0 then
          FileList.Add(sRootDir + '\'{ + SearchRec.Name});
        Found := FindNext(SearchRec);
      end;
      FindClose(SearchRec);
    end;
var
  FileList: TStringList;
begin
  FileList := TStringList.Create;
  FileList.Clear;
  DoSearchFile(sFileName, sRootDir, bFileOnly, bRecurse, FileList);
  Result := FileList;
end;

 function GetTempDirectory: String;
var
TempDir: array[0..255] of Char;
begin
GetTempPath(255, @TempDir);
Result := StrPas(TempDir);
end;


 procedure TForm1.FormCreate(Sender: TObject);

   var  LangID:integer;
ccdname:string;

begin
  OleInitialize(NIL);
  dd := TTMyDrop.Create;
  dd.OnDroped :=DoDroped ;
  dd.OnDropEnter := doDropEnter;
  dd.OnDropover := doDropover;
  dd.Onleave := doDropleave;
CoLockObjectExternal(dd, true, false);
RegisterDragDrop(form1.Handle, IDropTarget(dd));
// CF_HTML:=RegisterClipboardFormat('HTML Format');
     form1.Image1.Picture.Bitmap :=form1.Image6.Picture.Bitmap;
 form1.Width :=form1.image1.Picture.Bitmap.Width ;
 form1.Height :=form1.image1.Picture.Bitmap.height;
ShowWindow(Application.Handle,SW_Hide);;//在任务条中隐藏
SetWindowPos(form1.handle, HWND_TOPMOST,form1.Left, form1.Top, form1.Width, form1.Height,SWP_NOSIZE);//form TOP!!
Filename:=ExtractFilePath(Paramstr(0))+'savetext.ini';
myinifile:=Tinifile.Create(filename);
Filenameskin:=ExtractFilePath(Paramstr(0))+'skin.ini';//skin============
skinini:=Tinifile.Create(filenameskin);
//skin------------------
ForceDirectories(GetTempDirectory+'savetext');//创建临时目录




 ccdname:= myinifile.readString ('option','languageini','');
if ccdname<>'' then
begin
langtempini:=tinifile.Create (ccdname);
 //formchange(langtempini);
end
else
begin
Langid:=GetSystemDefaultLangID;
if LangID<> ((SUBLANG_CHINESE_SIMPLIFIED shl 10) or LANG_CHINESE) then
begin
if LangID= ((SUBLANG_CHINESE_TRADITIONAL shl 10) or (SUBLANG_CHINESE_HONGKONG shl 10)
or (SUBLANG_CHINESE_SINGAPORE shl 10) )then
langtempini:=tinifile.Create (ExtractFilePath(Paramstr(0))+'\language\savelang-big5.ini')
 else
langtempini:=tinifile.Create (ExtractFilePath(Paramstr(0))+'\language\savelang-en.ini');
end
else
langtempini:=tinifile.Create (ExtractFilePath(Paramstr(0))+'\language\savelang.ini');
end;


end;

procedure TForm1.mexitClick(Sender: TObject);
var tempccd:string;
i:integer;
ccdver:string;
      APath   : AnsiString;
      lpFileOp: TSHFileOpStruct;
begin
//*************删除临时目录
  begin  //删除
       APath := GetTempDirectory+'savetext'#0#0; // must end with double-#0
       with lpFileOp do
       begin
         Wnd := Self.Handle;
         wFunc := FO_DELETE;
         pFrom := pchar(APath);
         pTo := nil;
         fFlags :=FOF_NOCONFIRMATION;//
         hNameMappings := nil;
         lpszProgressTitle := nil;
         fAnyOperationsAborted := True;
       end;
       SHFileOperation(lpFileOp);
     {  if SHFileOperation(lpFileOp) = 0 then
         ShowMessage('SHFileOperation OK.')
       else
         ShowMessage('SHFileOperation Fail!!');}
end;
//*************创建、删除临时目录
if  form2.ListBox1.Items.Count>0 then
for i:=0 to form2.ListBox1.Items.Count-1 do
begin
tempccd:=GetTempDirectory+form2.ListBox1.Items.Strings[i]+'temp.txt';
deletefile(tempccd);
end;
SetWindowPos(form1.handle, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE );// 使其无最上层
form1.CoolTrayIcon1.Destroy;
ccdver:=myinifile.readString ('option','ver','');
if ccdver<>'3.6' then  myinifile.writestring('option','ver','3.6');
myinifile.WriteInteger ('option','f2w',form2.width);
myinifile.WriteInteger('option','f2h',form2.height);
myinifile.WriteInteger('option','f2t',form2.top);
myinifile.WriteInteger('option','f2l',form2.left);
myinifile.Destroy;
skinini.Destroy;
//ccdfound.Destroy;
form1.Close;
form2.Close;
end;

procedure TForm1.mshowClick(Sender: TObject);
begin
if ccdshow=true then
 form2.show
  else
 form2.Close;
end;

procedure TForm1.DoDroped(Sender:TObject;pt:tpoint);
  var
ctext:widestring;
ccdtext:widestring;
tempccd:string;
i:Integer;
begin
try
 if dd.text <>'' then
begin
//form2.DHTMLEdit1.BaseURL:= dd.URL;
//form2.DHTMLEdit1.DocumentHTML:= dd.regtext;
  form2.RichEdit1.Lines.Clear;
  form2.RichEdit1.Text:=dd.text+#10+ccdregsave;
//   form1.Image1.Visible :=true;
 form1.ListBox1.Visible :=false;
 form1.Width :=form1.Image1.Picture.Bitmap.Width ;
 form1.Height :=form1.Image1.Picture.Bitmap.Height;
  form1.Image1.Visible :=true;
  //－－－－－－－－－判断
if dd.href<>nil then
begin
 if (ccdhref=true) then
begin
for i:=0 to dd.href.Count-1 do
ctext:=ctext+dd.href.Strings[i] +#10;
  form2.RichEdit1.Text:=form2.RichEdit1.Text+#10+ctext;
  end;
  end;
 if ccdtime=true then
   form2.RichEdit1.Text:=form2.RichEdit1.Text+#10+
   langtempini.ReadString('other','9000','保存时间：')+DateTimeToStr(Now);
      if (ccdtitle=true)and (dd.Title <>'') then
  form2.RichEdit1.Text:=form2.RichEdit1.Text+#10+
  langtempini.ReadString('other','9001','原标题：')+dd.Title;
      if (ccdurl=true)and (dd.URL <>'') then
  form2.RichEdit1.Text:=form2.RichEdit1.Text+#10+
  langtempini.ReadString('other','9002','来自：')+dd.URL;

ctext:=MakeFileName(form2.RichEdit1.Text);
               if ccdsave=true then   //如果自动保存
                                          begin
                                       if copy(seedir,length(seedir),1)='\' then
                                        ccdtext:=seedir +ctext+'.txt'
                                        else
                                        ccdtext:=seedir +'\'+ctext+'.txt';
                                              if fileexists(ccdtext) then
                                              for i:=1 to 1000 do
                                                  begin
                                                  if copy(seedir,length(seedir),1)='\' then
                                                   ccdtext:=seedir +ctext+'('+inttostr(i)+')'+'.txt'
                                                   else
                                               ccdtext:=seedir +'\'+ctext+'('+inttostr(i)+')'+'.txt';
                                               if fileexists(ccdtext)=false then break;
                                               end;
                                         if not DirectoryExists(seedir) then
                                         begin
                                         if not ForceDirectories(seedir)then
                                         messagebox(getactivewindow(),
     pchar(langtempini.ReadString('other','9003','此类别对应目录不存在，导致本次拖存失败。请用“类别管理”功能重新更改本类别对应目录')),
        pchar( langtempini.ReadString('other','9004','错误')),mb_iconwarning)
                                         else
                                        begin
                                        Form2.RichEdit1.Lines.SaveToFile (ccdtext);
                                        form1.Image1.Hint :=
                                        langtempini.ReadString('other','9005','保存在')
                                        +seename+#13+
                                        langtempini.ReadString('other','9006','保存目录是')+seedir;
                                        end;
                                         end
                                         else
                                        begin
                                        Form2.RichEdit1.Lines.SaveToFile (ccdtext);
                                        form1.Image1.Hint :=
                                        langtempini.ReadString('other','9005','保存在')
                                        +seename+#13+
                                        langtempini.ReadString('other','9006','保存目录是')+seedir;

                                        end;
form1.PubListBox.Items.Add(ccdtext);
form2.ShowTBtn.Enabled:=true;
if form1.PubListBox.Items.Count>1 then
form2.BackTBtn.Enabled:=true;

                                end;//如果自动保存end
   ccdtext:=GetTempDirectory+'savetext\'+ctext+'.txt';
    if fileexists(ccdtext) then
    for i:=1 to 1000 do
        begin
     ccdtext:=GetTempDirectory+'savetext\'+ctext+'('+inttostr(i)+')'+'.txt';
     if fileexists(ccdtext)=false then break;
     end;

    Form2.RichEdit1.Lines.SaveToFile (ccdtext);


                  tempccd:=GetTempDirectory+seename+'temp.txt';  //分类保存
                  if fileexists(tempccd) then
                  begin
                  form2.RichEdit3.Lines.LoadFromFile(tempccd);
                  form2.RichEdit2.Text :=form2.RichEdit3.Text+#13#10+form2.RichEdit1.Text;
                  end
                  else
                  form2.RichEdit2.Text :=form2.RichEdit1.Text;
                  form2.RichEdit2.Lines.SaveToFile(tempccd);
                   //分类temp保存完－－－－－－－
                  form2.StatusBar1.Panels[0].Text:=
                  langtempini.ReadString('other','9005','这是')+seename+
                  langtempini.ReadString('other','9006','保存目录是')+seedir;

                  form2.RichEdit1.Lines.Clear ;
                  form2.RichEdit3.Lines.Clear ;
                  //音像------------------------------------------
                   ccdsound:=myinifile.Readbool('option','sound',true);
                   ccdwave:=myinifile.Readstring('option','wav','ccdwav');
                  if ccdsound then
                  begin
                  if ccdwave<>'ccdwav' then
                  playsound(pchar(ccdwave),hInstance,SND_ASYNC+SND_FILENAME)
                  else
                  playsound(pchar(ccdwave),hInstance,SND_ASYNC+SND_RESOURCE);
                  end;

                  end;//不为''

//*********
form2.ListBox1.ItemIndex :=form2.ListBox1.Items.IndexOf(seename) ;
form2.RichEdit2.Lines.LoadFromFile(tempccd);
form2.FileListBox1.Update;

if (ccdsoft=true) and (dd.href<>nil) then
begin
for i:=0 to dd.href.Count-1 do
begin
ctext:=dd.href.Strings[i];
if ((copy(ctext,length(ctext)-3,1)='.') or
(copy(ctext,length(ctext)-3,1)='.'))
and ((copy(ctext,1,7)='http://') or (copy(ctext,1,6)='ftp://'))
and (copy(ctext,length(ctext)-2,3)<>'htm')
and (copy(ctext,length(ctext)-3,4)<>'html')
and (copy(ctext,length(ctext)-2,3)<>'ico')
and (copy(ctext,length(ctext)-2,3)<>'cfm')
and (copy(ctext,length(ctext)-2,3)<>'asp')
and (copy(ctext,length(ctext)-2,3)<>'css')
and (copy(ctext,length(ctext)-2,3)<>'src')
and (copy(ctext,length(ctext)-2,3)<>'net')
and (copy(ctext,length(ctext)-2,3)<>'com')
then
begin
JetCarNetscape1:=TJetCarNetscape.Create(self);
JetCarNetscape1.AddUrl(ctext,form2.RichEdit1.text,dd.URL);
end;
end;
//JetCarNetscape1.AddUrlEx(ctext,dd.text,'',(seedir+''),0);
end;
     if (dd.href<>nil) then
      dd.href.Clear ;
      dd.URL :='';
      dd.Title:='';
      dd.regtext:='';
      dd.text:='';
except
 form1.Image1.Visible :=true;
 form1.ListBox1.Visible :=false;
 form1.Width :=form1.Image1.Picture.Bitmap.Width ;
 form1.Height :=form1.Image1.Picture.Bitmap.Height;
 form1.Top :=ccdform1top;
 messagebox(getactivewindow(),pchar(langtempini.ReadString('other','9008','由于目标目录不可写或其它未知错误，本次拖存被取消，请洽程序供应商。')),
 pchar(langtempini.ReadString('other','9004','错误')),mb_iconwarning);
 end;
end;











procedure TForm1.FormShow(Sender: TObject);
var
   i,ccdtop:integer;
   ccdleft:integer;
  Reg: TRegistry;
  ccdver:string;
  ccdvertemp:widestring;
 // ccdrega:tdatetime;
  ccdnumber:integer;
//  ccdregb:string;
 ccdreg:string;
ccdcab:pchar;
ccdabc:char;
ccdregint:string;


  begin
ShowWindow(application.Handle,SW_HIDE);//隐藏Taskbar的小框
ccdsave:= myinifile.readbool('option','autosave',true);
 form2.Visible:=false;
if ccdsave then
form1.image1.Picture.Bitmap:=form1.image6.Picture.Bitmap
else
form1.image1.Picture.Bitmap:=form1.image5.Picture.Bitmap;
form1.Width :=form1.Image1.Width ;
form1.Height :=form1.Image1.Height;
ccdver:=myinifile.readString ('option','ver','');
if (ccdver<>'3.6') and (fileexists(ExtractFilePath(Paramstr(0))+'savetext.ini')<>false) then
begin
//myinifile.writeString ('程序参数','ver','3.6');
form2.RichEdit3.Lines.Clear ;
form2.RichEdit3.Lines.LoadFromFile(ExtractFilePath(Paramstr(0))+'savetext.ini');
for i:=0 to form2.RichEdit3.Lines.Count do
begin
ccdvertemp:=form2.RichEdit3.Lines.Strings[i] ;
if pos('[程序参数]',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'[程序参数]','[option]');
if pos('每行字数',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'每行字数','saveline');
if pos('窗口顶部',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'窗口顶部','f1t');
if pos('窗口左边',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'窗口左边','f1l');
if pos('默认根目录',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'默认根目录','defaultsavedir');
if pos('滑杆1',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'滑杆1','saveslit1');
if pos('窗口2宽度',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'窗口2宽度','f2w');
if pos('窗口2高度',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'窗口2高度','f2h');
if pos('窗口2高',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'窗口2高','f2t');
if pos('窗口2左边',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'窗口2左边','f2l');
if pos('滑杆3',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'滑杆3','saveslit3');
if pos('是否自动保存',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'是否自动保存','autosave');
if pos('是否记录URL',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'是否记录URL','saveurl');
if pos('是否记录标题',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'是否记录标题','savetitle');
if pos('是否软件下载',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'是否软件下载','savesoft');
if pos('是否记录时间',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'是否记录时间','savetime');
if pos('是否记录链接',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'是否记录链接','savehref');
if pos('是否有声',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'是否有声','sound');
if pos('滑杆4',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'滑杆4','saveslit4');
if pos('启动',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'启动','startrun');
if pos('桌面',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'桌面','desktop');
if pos('快速工具栏',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'快速工具栏','Quick launch');
if pos('[类别]',form2.RichEdit3.Lines.Strings[i])<>0 then
form2.RichEdit3.Lines.Strings[i]:=replacing(form2.RichEdit3.Lines.Strings[i],'[类别]','[savesort]');
end;
form2.RichEdit3.Lines.SaveToFile(ExtractFilePath(Paramstr(0))+'savetext123.ini');
form2.RichEdit3.Lines.Clear ;
if fileexists((ExtractFilePath(Paramstr(0))+'savetext.ini')) then
begin
deletefile(ExtractFilePath(Paramstr(0))+'savetext.ini');
renamefile((ExtractFilePath(Paramstr(0))+'savetext123.ini'),(ExtractFilePath(Paramstr(0))+'savetext.ini'));
deletefile(ExtractFilePath(Paramstr(0))+'savetext123.ini');
end;
end;

formchange(langtempini);
  //---------------font
optionform.FontDialog1.Font.Charset:=myinifile.readinteger('formfontstyle','charset',1);
optionform.FontDialog1.Font.Color:=myinifile.readinteger('formfontstyle','color',(-2147483640));
optionform.FontDialog1.Font.size :=myinifile.readinteger('formfontstyle','size',9 );
optionform.FontDialog1.Font.Name :=myinifile.readString ('formfontstyle','name','宋体' );
form2.Font:=optionform.FontDialog1.Font;
form3.Font:=optionform.FontDialog1.Font;
optionform.Font:=optionform.FontDialog1.Font;
replaceform.Font:=optionform.FontDialog1.Font;

optionform.FontDialog1.Font.Charset:=myinifile.readinteger('fontstyle','charset',1);
optionform.FontDialog1.Font.Color:=myinifile.readinteger('fontstyle','color',(-2147483640));
optionform.FontDialog1.Font.size :=myinifile.readinteger('fontstyle','size',9 );
optionform.FontDialog1.Font.Name :=myinifile.readString ('fontstyle','name','宋体' );
form2.RichEdit2.Font:=optionform.FontDialog1.Font;
form2.RichEdit4.Font:=optionform.FontDialog1.Font;
  //---------------font
ccdsavedir:=myinifile.ReadString('option','defaultsavedir',ExtractFilePath(Paramstr(0)));
ccdsound:= myinifile.readbool('option','sound',true);
CcdTime:= myinifile.readbool('option','savetime',true);
CcdUrl:= myinifile.readbool('option','saveurl',true);
CcdSoft:= myinifile.readbool('option','savesoft',true);
CcdTitle:= myinifile.readbool('option','savetitle',true);
Ccdhref:= myinifile.readbool('option','savehref',true);
ccdtop:=myinifile.ReadInteger('option','f1t',300);
ccdleft:=myinifile.ReadInteger('option','f1l',400);
form1.Top:=ccdtop;
form1.Left:=ccdleft;
 ccdshow:=true ;
 form1.mshow.Caption:=langtempini.ReadString('other','9009','打开编辑与设置窗口');
ccdnumber:=myinifile.ReadInteger('option','amount',0);
ccdnumber:=ccdnumber+1;
myinifile.WriteInteger('option','amount',ccdnumber);
   Reg := TRegistry.Create;
    Reg.RootKey :=HKEY_CURRENT_USER;
  if  (Reg.OpenKeyReadOnly('\Software\JetCar\JetCar\General')=false)
    then
    begin
    optionform.softCheckBox.Enabled := false;
    ccdsoft:=false;
    optionform.softCheckBox.Checked :=false;
    myinifile.writebool('option','savesoft',OptionForm.softCheckBox.Checked );
    end;
    Reg.CloseKey;
begin //获得硬盘号
ccdreg:= GetHDSerialNumber('c:');
ccdregint:='';
if ccdreg<>'0000-0000' then
begin
for i:=1 to length(ccdreg) do
begin
ccdcab:=pchar(copy(ccdreg,i,1)) ;
ccdabc:=ccdcab^;
ccdregint:=inttostr(ord(ccdabc)*(3*i-1))+ccdregint;
form3.IDEdit.Text :=ccdregint;
end;
end;
ccdregint:=pass(form3.IDEdit.Text);
end;
if (myinifile.ReadString('Register','regcode','')<>ccdregint)
 then
   begin
//messagebox(getactivewindow(),
//pchar(langtempini.ReadString('other','9023','Please Register!')),
//pchar(langtempini.ReadString('other','9004','错误')),mb_iconwarning) ;
//ccdregsave:='*****这是试用版本**硂琌刚ノセ**please regiser**'+datetostr(date)+'******'+#10;
ccdregsave:='********一拖即存江西广电网络专用版本**'+datetostr(date)+'******'+#10;
end
end;

procedure TForm1.DoDropLeave(Sender:TObject);

begin
if form1.ListBox1.Items.Count>0 then
begin
 form1.Image1.Visible :=true;
 form1.ListBox1.Visible :=false;
 form1.Width :=form1.Image1.Picture.Bitmap.Width ;
 form1.Height :=form1.Image1.Picture.Bitmap.Height;
 form1.Top :=ccdform1top;
 end;
 end;


procedure TForm1.PopupMenu1Popup(Sender: TObject);
{var
addSubItem:TMenuItem;
    i:Integer;
      i1:integer;
     ccdname,ccdname1,ccdname2:widestring; }
 var
 langccdini:tinifile;
ccdname:string;
ccdbase:string;
ccdbase1:string;
addSubItem:TMenuItem;
    i:Integer;
begin
   form1.mpaste.Clear;
    form1.mpaste.Visible :=true;
   if (form2.ListBox1.Items.Count>0) then
       begin
   for i:=0 to form2.ListBox1.Items.Count-1 do //N等于要添加的动态菜单数目,需事先定义为数值型变量,并赋值
               begin
              addSubItem:= TMenuItem.Create(Self);
              addSubItem.Name := 'chen'+IntToStr(i);
              addSubItem.Caption := form2.ListBox1.Items.Strings[i];// 步骤1的SubMenuItemSource应先赋值
              form1.mpaste.Add(addSubItem );  //在名称为FileOpenItem的菜单项下添加子菜单
              addSubItem.OnClick:=MypasteClick;// 步骤2的MyClick(),自定义菜单要响应的事件
                end;
        end;

 begin          //语言
 form1.lang1.Clear;
 ccdbase:=form2.FileListBox1.Directory ;
 ccdbase1:=form2.FileListBox1.Mask ;
 form2.FileListBox1.Mask:='*.ini';
 form2.FileListBox1.Directory:= (ExtractFilePath(Paramstr(0))+'language');
 form2.FileListBox1.Update ;
 if form2.FileListBox1.Items<>nil then
 begin
// ccdtemplang:=tstrings.Create;
   for i:=0 to form2.FileListBox1.items.Count-1 do
  begin
  form2.FileListBox1.ItemIndex:=i;
   langccdini:=tinifile.Create(form2.FileListBox1.FileName);
   myinifile.WriteString('language',('language'+IntToStr(i)),form2.FileListBox1.FileName);
   ccdname:=langccdini.ReadString('Info','language','');
           form1.lang1.Visible:=true;
           addSubItem:= TMenuItem.Create(Self);
            addSubItem.Name := 'language'+IntToStr(i);
            addSubItem.Caption := ccdname;// 步骤1的SubMenuItemSource应先赋值
            form1.lang1.Add(addSubItem );  //在名称为FileOpenItem的菜单项下添加子菜单
        addSubItem.OnClick:=MylangClick;// 步骤2的MyClick(),自定义菜单要响应的事件
//myinifile.WriteString('程序皮肤设置',ccdname,ccdtemplang[i]);
//             ccdname:='';
             end;
end;
form2.FileListBox1.Mask:=ccdbase1;
form2.FileListBox1.Directory :=ccdbase;
end;


{if cdchange=false then
 begin
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
             form1.mskin.Visible:=true;
             addSubItem:= TMenuItem.Create(Self);
            addSubItem.Name := 'chen'+IntToStr(i);
            addSubItem.Caption := ccdname;// 步骤1的SubMenuItemSource应先赋值
            form1.mskin.Add(addSubItem );  //在名称为FileOpenItem的菜单项下添加子菜单
            addSubItem.OnClick:=MyClick;// 步骤2的MyClick(),自定义菜单要响应的事件
            skinini.WriteString('程序皮肤设置',ccdname,ccdfound[i]);
             ccdname:='';
             end;                           //skin------------
end;
cdchange:=true;
         //skin----------------- }

if (Clipboard.HasFormat(CF_TEXT) or
 Clipboard.HasFormat(CF_OEMTEXT)) then
    //处理剪贴板中内容
    begin
    form2.mpaste2.Enabled :=true;
        form2.mpaste21.Enabled :=true;
    form1.mpaste.Enabled :=true;
    end
else
begin
form2.mpaste2.Enabled :=false;
form2.mpaste21.Enabled :=false;
form1.mpaste.Enabled :=false;
end;
end;

    procedure TForm1.DoDropenter(Sender:TObject;pt:tpoint);
var
  i,MaxWidth: integer;
// ccdpoint:Tpoint;
  begin        //进入后变化窗口
  if form2.ListBox1.Items.Count>0 then
  begin
  ccdform1top:=form1.Top; //记录fom1.top以便复原
//  ccdpoint.x :=point.x -form1.ListBox1.left ;
 // ccdpoint.y:=point.y -form1.ListBox1.top;
 form1.ListBox1.Visible:=true;
  form1.Image1.Visible :=false;

 form1.ListBox1.Items :=form2.ListBox1.Items;
   MaxWidth := 0;
  for i := 0 to ListBox1.Items.Count - 1 do
  if MaxWidth < ListBox1.Canvas.TextWidth(ListBox1.Items.Strings[i]) then
    MaxWidth := ListBox1.Canvas.TextWidth(ListBox1.Items.Strings[i])+5;
form1.ListBox1.Top:=2;
form1.ListBox1.Left:=2;
form1.ListBox1.Height :=form1.ListBox1.ItemHeight*(form1.ListBox1.Items.Count+1)-6;
if form1.ListBox1.Height >300 then
begin
form1.ListBox1.Height :=300;
 form1.ListBox1.width:= MaxWidth +40;
 end
 else
  form1.ListBox1.width:= MaxWidth +8;
 form1.Width:=form1.ListBox1.Width+3;
form1.height:=form1.ListBox1.height+3;
  if form1.Left >(GetSystemMetrics(SM_CXFullScreen)-form1.Width )then
 form1.Left:=GetSystemMetrics(SM_CXFullScreen ) -form1.Width;
 if form1.Left <0 then form1.Left:=0;
 if form1.top <0 then form1.top:=0;
if form1.top >(GetSystemMetrics(SM_CyFullScreen) -form1.height) then
 form1.top:=GetSystemMetrics(SM_CyFullScreen ) -form1.height;
 //***** point.x:=form1.Left+5;
 //***** point.y:=form1.top+10;

 end;
 end;
procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  ClientPoint,ScreenPoint:TPoint;
 htcaption:integer;
   begin
  if Button=mbRight then
begin
ClientPoint.X:=X;
ClientPoint.Y:=Y;
ScreenPoint:=form1.ClientToScreen (ClientPoint);
form1.PopupMenu1.Popup(ScreenPoint.X,ScreenPoint.Y);
end;
  if Button=mbLeft then
  begin
   if (form1.Width -x)>10 then
   begin
   htcaption:=2;
   releasecapture;
   sendmessage(form1.handle,WM_NCLBUTTONDOWN,htcaption,0);
   myinifile.WriteInteger('option','f1t',form1.Top);
   myinifile.WriteInteger('option','f1l',form1.Left);
end
   else
   begin
if  optionform.savetf1.Checked=false then
begin
 optionform.savetf1.Checked:=true;
ccdsave:=true;
form1.image1.Picture.Bitmap:=form1.image6.Picture.Bitmap;
end
else
begin
 optionform.savetf1.Checked:=false;
ccdsave:=false;
form1.image1.Picture.Bitmap:=form1.image5.Picture.Bitmap;
end;
myinifile.writebool('option','autosave',ccdsave);
form1.Width :=form1.Image1.Width ;
form1.Height :=form1.Image1.Height;
end;  

end;     
 end;

procedure TForm1.Image1DblClick(Sender: TObject);
begin
 Allowedit:=false;
if ccdshow=true then
 form2.show
  else
 form2.Close;
end;

procedure TForm1.CoolTrayIcon1DblClick(Sender: TObject);
begin
 Allowedit:=false;
if ccdshow=true then
 form2.show
  else
 form2.Close;
end;

    procedure TForm1.DoDropover(Sender:TObject;pt:tpoint);
  var
  i: integer;
 ccdpoint:Tpoint;
  begin
  //移动鼠标的变化
if form2.ListBox1.Items.Count>0 then
begin
  ccdpoint.x :=dd.ccdpt.x -form1.left ;
  ccdpoint.y:=dd.ccdpt.y-form1.Top ;
 i:=form1.ListBox1.ItemAtPos(ccdpoint,true);   //取i的值

if ccdpoint.y>form1.Height-10 then
 i:=form1.ListBox1.Itemindex+1;
if i>form1.ListBox1.Items.Count-1 then
i:=form1.ListBox1.Items.Count-1;
if ccdpoint.y<7 then
 i:=form1.ListBox1.Itemindex-1;

      if i<0 then
        begin
        if (form1.Height-ccdpoint.y)<20 then
        i:=form1.ListBox1.Items.Count-1
        else
        i:=0;
        end;


  form1.ListBox1.ItemIndex :=i;
 seename:=form2.ListBox1.Items.Strings[form1.ListBox1.ItemIndex];   //确定类目名称
 seedir:= myinifile.readstring('savesort',seename,'C:\My Documents');//确定类目目录
end
else
 begin
 seename:='savetext\savetext';   //确定类目名称
 seedir:=ccdsavedir;//确定类目目录
 end;
 end;
procedure TForm1.mphotowinClick(Sender: TObject);
begin
if ccdsave=true then
form1.Image1.Picture :=form1.Image6.Picture
else
form1.Image1.Picture :=form1.Image5.Picture;
 form1.Width :=form1.image1.Picture.Width ;
 form1.Height :=form1.image1.Picture.height;

end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if x>29 then
form1.Hint :=langtempini.ReadString('other','9010','这是自动保存的锁定钮')
else
form1.Hint :=langtempini.ReadString('other','9011','这是文字和软件拖存窗口');
end;
{procedure tForm1.MyClick (Sender: TObject);//动态菜单OnClick事件响应
var ccdlu:string;
 begin
ccdlu :=skinini.readstring('程序皮肤设置',TMenuItem(Sender).Caption,'C:\My Documents');//确定图片目录
if fileexists( ccdlu+'1.bmp')
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
 end;       }



 procedure TForm1.MypasteClick (Sender: TObject);
 var
cdurl,cdtitle,ctext:widestring;
ccdtext:widestring;
cdhref:tstringlist;
tempccd:string;
i:Integer;
MyHandle: THandle;
    TextPtr: PChar;
begin

 seename:=TMenuItem(Sender).Caption;;   //确定类目名称
 seedir:= myinifile.readstring('savesort',seename,'C:\My Documents');//确定类目目录

form2.RichEdit1.Lines.Clear ;
form2.RichEdit3.Lines.Clear ;
    if (Clipboard.FormatCount > 0) then
    begin
      if Clipboard.HasFormat(CF_HTML) then
      begin
    MyHandle := Clipboard.GetAsHandle(CF_HTML);
    TextPtr := GlobalLock(MyHandle);
    ctext := Decode_UTF8(TextPtr);
    GlobalUnlock(MyHandle);
        ccdhtmlfind(ctext,cdurl,cdtitle,cdhref);
        ctext:='';
      end ;
       if Clipboard.HasFormat(CF_TEXT) then

form2.RichEdit1.PasteFromClipboard;
form2.RichEdit1.Text :=form2.RichEdit1.Text +#10+ccdregsave;
 if cdhref<>nil then
begin
 if (ccdhref=true) then
begin
for i:=0 to cdhref.Count-1 do
ctext:=ctext+cdhref.Strings[i] +#10;
  form2.RichEdit1.Text:=form2.RichEdit1.Text+#10+ctext;
  end;
  end;
 if ccdtime=true then
   form2.RichEdit1.Text:=form2.RichEdit1.Text+#10+
   langtempini.ReadString('other','9000','保存时间：')+DateTimeToStr(Now);
      if (ccdtitle=true)and (cdtitle <>'') then
  form2.RichEdit1.Text:=form2.RichEdit1.Text+#10+
  langtempini.ReadString('other','9001','原标题：')+cdtitle;
      if (ccdurl=true)and (cdurl <>'') then
  form2.RichEdit1.Text:=form2.RichEdit1.Text+#10+
  langtempini.ReadString('other','9002','来自：')+cdurl;

if form2.RichEdit1.Text <>'' then
begin
ctext:=MakeFileName(form2.RichEdit1.Text);
 if ccdsave=true then   //如果自动保存
  begin
          if copy(seedir,length(seedir),1)='\' then
            ccdtext:=seedir +ctext+'.txt'
            else
            ccdtext:=seedir +'\'+ctext+'.txt';
if fileexists(ccdtext) then
for i:=1 to 1000 do
    begin
  if copy(seedir,length(seedir),1)='\' then
   ccdtext:=seedir +ctext+'('+inttostr(i)+')'+'.txt'
   else
 ccdtext:=seedir +'\'+ctext+'('+inttostr(i)+')'+'.txt';
 if fileexists(ccdtext)=false then break;
 end;
if not DirectoryExists(seedir) then
                                         begin
                                         if not ForceDirectories(seedir)then
                                          messagebox(getactivewindow(),
        pchar( langtempini.ReadString('other','9003','此类别对应目录不存在，导致本次拖存失败。请用“类别管理”功能重新更改本类别对应目录')),
        pchar( langtempini.ReadString('other','9004','错误')),mb_iconwarning)
                                         else
                                        begin
                                        Form2.RichEdit1.Lines.SaveToFile (ccdtext);
                                       form1.Image1.Hint :=
                                        langtempini.ReadString('other','9005','保存在')
                                        +seename+#13+
                                        langtempini.ReadString('other','9006','保存目录是')+seedir;
                                        end;
                                         end
                                         else
                                        begin
                                        Form2.RichEdit1.Lines.SaveToFile (ccdtext);
                                        form1.Image1.Hint :=
                                        langtempini.ReadString('other','9005','保存在')
                                        +seename+#13+
                                        langtempini.ReadString('other','9006','保存目录是')+seedir;
                                        end;
 form1.PubListBox.Items.Add(ccdtext);    //记录
form2.ShowTBtn.Enabled:=true;
if form1.PubListBox.Items.Count>1 then
form2.BackTBtn.Enabled:=true;       // 记录
end;//如果自动保存end
    ccdtext:=GetTempDirectory+'savetext\'+ctext+'.txt';
    if fileexists(ccdtext) then
    for i:=1 to 1000 do
        begin
     ccdtext:=GetTempDirectory+'savetext\'+ctext+'('+inttostr(i)+')'+'.txt';
     if fileexists(ccdtext)=false then break;
     end;

    Form2.RichEdit1.Lines.SaveToFile (ccdtext);
tempccd:=GetTempDirectory+seename+'temp.txt';  //分类保存
 if fileexists(tempccd) then
                  begin
                  form2.RichEdit3.Lines.LoadFromFile(tempccd);
                  form2.RichEdit2.Text :=form2.RichEdit3.Text+#13#10+form2.RichEdit1.Text;
                  end
                  else
                  form2.RichEdit2.Text :=form2.RichEdit1.Text;
form2.RichEdit2.Lines.SaveToFile(tempccd);
 //分类temp保存完－－－－－－－
end;
form2.ListBox1.ItemIndex :=form2.ListBox1.Items.IndexOf(seename) ;
form2.StatusBar1.Panels[0].Text:=
                  langtempini.ReadString('other','9005','这是')+seename+
                  langtempini.ReadString('other','9006','保存目录是')+seedir;
form2.RichEdit1.Lines.Clear ;
form2.RichEdit3.Lines.Clear ;
//音像------------------------------------------
                   ccdsound:=myinifile.Readbool('option','sound',true);
                   ccdwave:=myinifile.Readstring('option','wav','ccdwav');
                  if ccdsound then
                  begin
                  if ccdwave<>'ccdwav' then
                  playsound(pchar(ccdwave),hInstance,SND_ASYNC+SND_FILENAME)
                  else
                  playsound(pchar(ccdwave),hInstance,SND_ASYNC+SND_RESOURCE);
                  end;
form2.FileListBox1.Update;
try
if (ccdsoft=true) and (cdhref<> nil ) then
begin
for i:=0 to cdhref.Count-1 do
begin
ctext:=cdhref.Strings[i];
if ((copy(ctext,length(ctext)-3,1)='.') or
(copy(ctext,length(ctext)-3,1)='.'))
and ((copy(ctext,1,7)='http://')or(copy(ctext,1,6)='ftp://'))
and (copy(ctext,length(ctext)-2,3)<>'htm')
and (copy(ctext,length(ctext)-3,4)<>'html')
and (copy(ctext,length(ctext)-2,3)<>'ico')
and (copy(ctext,length(ctext)-2,3)<>'cfm')
and (copy(ctext,length(ctext)-2,3)<>'asp')
and (copy(ctext,length(ctext)-2,3)<>'css')
and (copy(ctext,length(ctext)-2,3)<>'src')
and (copy(ctext,length(ctext)-2,3)<>'net')
and (copy(ctext,length(ctext)-2,3)<>'com')
then
begin
JetCarNetscape1:=TJetCarNetscape.Create(self);
JetCarNetscape1.AddUrl(ctext,form2.RichEdit1.text,cdurl);
end;
end;
end;
if (cdhref<>nil) then
cdhref.Clear ;
cdURL :='';
cdTitle:='';
except
end;
end;//如果有东西//如果文本不为''
end;






procedure TForm1.FormDestroy(Sender: TObject);
begin
  RevokeDragDrop(Handle);
  OleUninitialize;
end;
procedure TForm1.N1Click(Sender: TObject);
begin
optionform.Show;
end;
 procedure TForm1.MylangClick(Sender: TObject);
 var
ccdname:string;
 begin
ccdname:= myinifile.readstring('language',TMenuItem(Sender).name,'');
if ccdname<>'' then
begin
langtempini.Destroy; 
langtempini:=tinifile.Create (ccdname);
myinifile.WriteString ('option','languageini',ccdname);
 formchange(langtempini);
 end;
 end;
 procedure TForm1.N5Click(Sender: TObject);
begin
form3.Show;
end;

procedure TForm1.CoolTrayIcon1Click(Sender: TObject);
begin
form1.Show;
end;

end.
