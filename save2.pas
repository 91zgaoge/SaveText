unit save2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls,Shellapi,FileCtrl, Clipbrd,ComCtrls, IniFiles, ExtCtrls,
  ToolWin, ImgList, ActnList, Spin, OleCtrls;

type
  TForm2 = class(TForm)
    PopupMenu2: TPopupMenu;
    N1: TMenuItem;
    mcopy: TMenuItem;
    mpaste2: TMenuItem;
    N3: TMenuItem;
    msave: TMenuItem;
    mall: TMenuItem;
    SaveDialog1: TSaveDialog;
    mallclear: TMenuItem;
    mfile: TMenuItem;
    N2: TMenuItem;
    mcut: TMenuItem;
    mcopyclear: TMenuItem;
    PopupMenu1: TPopupMenu;
    listdel: TMenuItem;
    listmove: TMenuItem;
    mfont: TMenuItem;
    textmove: TMenuItem;
    ToolbarImages: TImageList;
    Timer1: TTimer;
    N4: TMenuItem;
    OpenDialog1: TOpenDialog;
    PopupMenu3: TPopupMenu;
    m2copy: TMenuItem;
    m2all: TMenuItem;
    N5: TMenuItem;
    m2clear: TMenuItem;
    N7: TMenuItem;
    mleiopen: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    mlei: TMenuItem;
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Splitter2: TSplitter;
    RichEdit2: TRichEdit;
    RichEdit3: TRichEdit;
    RichEdit1: TRichEdit;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    msave1: TToolButton;
    ToolButton3: TToolButton;
    mcut1: TToolButton;
    mcopy1: TToolButton;
    mpaste21: TToolButton;
    BIG5GB: TToolButton;
    mfile1: TToolButton;
    Panel4: TPanel;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
    ListBox1: TListBox;
    Splitter4: TSplitter;
    RichEdit4: TRichEdit;
    PopupMenu4: TPopupMenu;
    N6: TMenuItem;
    N11: TMenuItem;
    N16: TMenuItem;
    MainMenu1: TMainMenu;
    N21: TMenuItem;
    N26: TMenuItem;
    mhelp: TMenuItem;
    memail: TMenuItem;
    mhome1: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    GBBIG5: TToolButton;
    N29: TMenuItem;
    N30: TMenuItem;
    ToolButton1: TToolButton;
    mrename: TMenuItem;
    N32: TMenuItem;
    N31: TMenuItem;
    mreplace: TMenuItem;
    FileListBox1: TFileListBox;
    ToolBar2: TToolBar;
    BackTBtn: TToolButton;
    ShowTBtn: TToolButton;
    ShowFileLabel: TLabel;
    moption: TMenuItem;
    N33: TMenuItem;
    N19: TMenuItem;
    N22: TMenuItem;
    N12: TMenuItem;
    N10: TMenuItem;
    ToolButton2: TToolButton;
    procedure DisplayHint(Sender: TObject);
    procedure MymoveClick(Sender: TObject);
    procedure mcopyClick(Sender: TObject);
    procedure mpaste2Click(Sender: TObject);
    procedure msaveClick(Sender: TObject);
    procedure mallclearClick(Sender: TObject);
    procedure mallClick(Sender: TObject);
    procedure mfileClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mcutClick(Sender: TObject);
    procedure mcopyclearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure listdelClick(Sender: TObject);
    procedure listmoveClick(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure mfontClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure m2copyClick(Sender: TObject);
    procedure m2allClick(Sender: TObject);
    procedure m2clearClick(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
    procedure Splitter2Moved(Sender: TObject);
    procedure Splitter4Moved(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BIG5GBClick(Sender: TObject);
    procedure memailClick(Sender: TObject);
    procedure mhelpClick(Sender: TObject);
    procedure mhome1Click(Sender: TObject);
    procedure GBBIG5Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure mrenameClick(Sender: TObject);
    procedure mreplaceClick(Sender: TObject);
    procedure ShowTBtnClick(Sender: TObject);
    procedure BackTBtnClick(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure moptionClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure mleiClick(Sender: TObject);
    procedure RichEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ToolButton2Click(Sender: TObject);
    procedure RichEdit2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpinEdit1Click(Sender: TObject);

  
  private
    { Private declarations }

  public
    { Public declarations }
 
  end;

var
  Form2: TForm2;
  Allowedit:boolean;//判断要不要保存文本内容的变化（可能只是类别转换，而不是文本内容变化
 ccdjihao:integer;
 implementation

{$R *.DFM}
uses save1,save3,CVCode,Option,about;


function isBIG5(value: string): Boolean;
begin
  if (length(value)>=2) then
  begin
   if (value[1] < #161) then
     Result := false
   else
     if ((value[2] >= #64) and (value[2] <= #126)) or ((value[2] >= #161) and (value[2] <= #254)) then
       Result := true
     else
       Result := false
  end
  else
    Result := false
end;

function isGB(value: string): Boolean;
begin
  if (length(value)>=2) then
  begin
    if (value[1] <= #161) and (value[1] >= #247) then
      Result := false
    else
      if (value[2] <= #161) and (value[2] >= #254) then
        Result := false
      else
        Result := true
  end
  else
    Result := true;
end;
  procedure URLink(URL:pchar);
begin
try
ShellExecute(0, nil, URL, nil, nil, SW_NORMAL);
finally
end;
end;



procedure TForm2.MymoveClick(Sender: TObject);
 var temptext:string;
ctext:string;
ccdtext:string;
i:Integer;
 movename:string;
 movedir:string;
begin
if Form2.RichEdit2.SelText<>'' then
   temptext:= Form2.RichEdit2.SelText
   else
   temptext:= Form2.RichEdit2.Lines.Text ;
movename:=TMenuItem(Sender).Caption;
movedir:= myinifile.readstring('savesort',movename,ExtractFilePath(Paramstr(0)));//确定类目目录
if trim(form2.RichEdit1.Lines.Text)<>'' then
form2.RichEdit1.Lines.Text:=trim(form2.RichEdit1.Lines.Text)+#13#10+temptext
else
form2.RichEdit1.Lines.Text:=trim(form2.RichEdit1.Lines.Text)+temptext;
tempccd:=GetTempDirectory+movename+'temp.txt';
form2.RichEdit1.Lines.SaveToFile(tempccd);
form2.ListBox1.ItemIndex :=form2.ListBox1.Items.IndexOf(movename);
if ccdsave=true then
begin
if form2.RichEdit1.Text <>'' then
begin
ctext:=MakeFileName(form2.RichEdit1.Text);
ccdtext:=movedir +'\'+ctext+'.txt';
if fileexists(ccdtext) then
for i:=1 to 1000 do
    begin
 ccdtext:=movedir +'\'+ctext+'('+inttostr(i)+')'+'.txt';
 if fileexists(ccdtext)=false then break;
 end;
Form2.RichEdit1.Lines.SaveToFile (ccdtext);
end;  //如果文本不为''
end;//如果自动保存end
form2.RichEdit1.Lines.Clear;
end;


procedure TForm2.mcopyClick(Sender: TObject);
begin
Form2.RichEdit2.CopyToClipboard;
end;

procedure TForm2.mpaste2Click(Sender: TObject);

 begin
 if (Clipboard.HasFormat(CF_TEXT) or
 Clipboard.HasFormat(CF_OEMTEXT)) then         //处理剪贴板中内容

    begin
 Form2.RichEdit2.PasteFromClipboard;
  form2.RichEdit1.Lines.Clear;
 form2.RichEdit3.Lines.Clear ;
 end;
 end;

procedure TForm2.msaveClick(Sender: TObject);
var

ctext:string;



begin
if Form2.RichEdit2.Text <>'' then
begin
if Form2.RichEdit2.SelText<>'' then
   ctext:= MakeFileName(Form2.RichEdit2.SelText)
   else
ctext:=MakeFileName(form2.RichEdit2.Text);//有没有选中的内容
if form2.ListBox1.Itemindex>=0 then
form2.SaveDialog1.InitialDir :=myinifile.readstring('savesort',form2.ListBox1.Items.Strings[form2.ListBox1.Itemindex],ExtractFilePath(Paramstr(0)))
else
form2.SaveDialog1.InitialDir :=ccdsavedir;
form2.SaveDialog1.FileName :=ctext  ;
 if form2.SaveDialog1.Execute then
 form2.RichEdit2.Lines.SaveToFile(form2.SaveDialog1.FileName);
form2.FileListBox1.Update;
  end;
  end;






procedure TForm2.mallclearClick(Sender: TObject);
var tempccd2:string;
begin
Form2.RichEdit2.Text:='';
if form2.ListBox1.ItemIndex >=0 then
begin
tempccd2:=GetTempDirectory+form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex]+'temp.txt';  //分类保存
if fileexists(tempccd2) then
deletefile(tempccd2);
end
else
begin
tempccd2:=GetTempDirectory+'savetext\savetexttemp.txt';
if fileexists(tempccd2) then
deletefile(tempccd2);
end;
end;

procedure TForm2.mallClick(Sender: TObject);
begin
Form2.RichEdit2.SelectAll ;
end;

procedure TForm2.mfileClick(Sender: TObject);
var
i:integer;
i1:integer;
ccdlen:integer;
ccdnumb,ccdspace:integer;
ccdfile:widestring;
ccdtrue:widestring;
ccdce:widestring;
ccdce1:widestring;
//ccdTemp:pchar; //将字符转换为ASCII码
//ccdc,ccdc1:char;   //将字符转换为ASCII码
begin
form2.Cursor:= crHourGlass;
form2.RichEdit2.WordWrap:=false;
ccdlen:=0;
ccdtrue:=form2.SpinEdit1.Text;
if (ccdtrue<>'0')and (ord(ccdtrue[1])<58) then
ccdlen:=strtoint(form2.SpinEdit1.Text)*2;
if ccdlen=0 then
ccdlen:=65;
ccdnumb:=0;
for i:=0 to form2.RichEdit2.Lines.Count do
ccdnumb:=ccdnumb+(round(length(form2.richedit2.lines[i])/ccdlen)+1);
for i:=0 to ccdnumb do
begin
       i1:=i+1;
       form2.RichEdit2.Lines[i]:=form2.RichEdit2.Lines[i];
       if length(form2.RichEdit2.Lines[i])>ccdlen then
       begin

                form2.RichEdit3.text:=form2.RichEdit2.Lines[i];
                form2.RichEdit3.Selstart :=0;
                form2.RichEdit3.SelLength :=ccdlen ;
                form2.RichEdit3.SelText:=form2.RichEdit3.SelText+#13#10 ;
                form2.RichEdit2.Lines[i]:=form2.RichEdit3.Lines[0];
                ccdfile:=form2.RichEdit2.Lines[i1];
                if ccdfile<>'' then
                begin
                ccdce:=copy(ccdfile,1,1);
                ccdce1:=copy(ccdfile,2,1);
                if ((trim(ccdce1)='')and (trim(ccdce)=''))
                or
                ((ord(pchar(copy(form2.RichEdit2.Lines[i1],1,1))^)=161)
                and (ord(pchar(copy(form2.RichEdit2.Lines[i1],2,1))^)=161))
                then ccdspace:=2 else ccdspace:=0;
                end
                else ccdspace:=2;//
                 if ccdspace=2 then
                begin
                form2.RichEdit2.Lines[i1]:=form2.RichEdit3.Lines[1]+#13#10+form2.RichEdit2.Lines[i1];
                if (i1>=form2.RichEdit2.Lines.count)and (form2.RichEdit3.Lines[1]<>'') then
                form2.RichEdit2.Lines.Add(form2.RichEdit3.Lines[1]+#13#10);
                form2.RichEdit1.text:='';
                form2.RichEdit3.text:='';
                        form2.StatusBar1.Panels[1].Text:=form2.StatusBar1.Panels[1].Text+'■■■■■';
                        form2.StatusBar1.Update ;
                        form2.Update ;
                        if length(form2.StatusBar1.Panels[1].Text)*5>form2.StatusBar1.Panels[1].Width then
                        form2.StatusBar1.Panels[1].Text:='';
                end
                else
                begin
                form2.RichEdit2.Lines[i1]:=form2.RichEdit3.Lines[1]+form2.RichEdit2.Lines[i1];
               if (i1>=form2.RichEdit2.Lines.count)and (form2.RichEdit3.Lines[1]<>'') then
                form2.RichEdit2.Lines.Add(form2.RichEdit3.Lines[1]);
                form2.RichEdit1.text:='';
                form2.RichEdit3.text:='';
                        form2.StatusBar1.Panels[1].Text:=form2.StatusBar1.Panels[1].Text+'■■■■■';
                        form2.StatusBar1.Update ;
                        form2.Update ;
                        if length(form2.StatusBar1.Panels[1].Text)*2>form2.StatusBar1.Panels[1].Width then
                        form2.StatusBar1.Panels[1].Text:='';
                end;
      end
      else
                form2.RichEdit2.Lines[i]:=form2.RichEdit2.Lines[i];

end;
form2.StatusBar1.Panels[1].Text:='';
form2.RichEdit2.WordWrap:=true;
form2.Cursor:= crArrow;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ccdshow:=true;
  form1.mshow.Caption:=langtempini.ReadString('other','9009','打开编辑与设置窗口');

  end;

procedure TForm2.mcutClick(Sender: TObject);
begin
form2.RichEdit2.CutToClipboard ;
end;

procedure TForm2.mcopyclearClick(Sender: TObject);
begin
 Clipboard.Clear;
 form2.mcopyclear.Enabled:=false;
end;


procedure TForm2.FormShow(Sender: TObject);
var tempccd:string;
begin
form2.width:=myinifile.ReadInteger('option','f2w',700);
form2.height:=myinifile.ReadInteger('option','f2h',500);
form2.Top:=myinifile.ReadInteger('option','f2t',90);
form2.Left:=myinifile.ReadInteger('option','f2l',40);
form2.WindowState:=wsNormal;
myinifile.ReadSection('savesort',form2.ListBox1.Items) ;
if (seename<>'savetext\savetext') and (form2.ListBox1.Items.Count >0)
and (seename<>'') then
begin
 form2.ListBox1.ItemIndex :=form2.ListBox1.Items.IndexOf(seename) ;
 tempccd:=GetTempDirectory+form2.ListBox1.Items.Strings[form2.ListBox1.Itemindex]+'temp.txt';
  if fileexists(tempccd) then
 form2.RichEdit2.Lines.LoadFromFile (tempccd)
  else
 form2.RichEdit2.Lines.Clear ;
 form2.StatusBar1.Panels[0].Text:=
 langtempini.ReadString('other','9005','这是')
 +form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex]+
 langtempini.ReadString('other','9006','保存目录是')+
 myinifile.readstring('savesort',form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0)));
 form2.StatusBar1.Panels[0].Width :=length(form2.StatusBar1.Panels[0].Text)*7;

            //form2.FileListBox1.Directory :=myinifile.readstring('savesort',form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0)));
     try        //判断硬盘目录是否存在
            form2.FileListBox1.Directory :=myinifile.readstring('savesort',form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0)));
            except
            on EInOutError do
                 begin    //类别属性
            if not ForceDirectories(myinifile.readstring('savesort',form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0))))then
               messagebox(getactivewindow(),
pchar(langtempini.ReadString('other','9012','该类别对应目录已经取消。请用“类别管理”功能重新更改！')),
pchar(langtempini.ReadString('other','9004','错误')),mb_iconwarning) ;
                end;
     end;
end
else
begin
try        //判断硬盘目录是否存在
 form2.FileListBox1.Directory :=ccdsavedir;
 tempccd:=GetTempDirectory+'savetext'+'\savetexttemp.txt';
 if fileexists(tempccd) then
 form2.RichEdit2.Lines.LoadFromFile (tempccd)
 else
 form2.RichEdit2.Lines.Clear ;
            except
            on EInOutError do
                 begin
               if not ForceDirectories(ccdsavedir)then
               messagebox(getactivewindow(),
pchar(langtempini.ReadString('other','9012','该类别对应目录已经取消。请用“类别管理”功能重新更改！')),
pchar(langtempini.ReadString('other','9004','错误')),mb_iconwarning)
                end;
            end;
 form2.StatusBar1.Panels[0].Text:=
langtempini.ReadString('other','9013','这是默认根目录,') +
 langtempini.ReadString('other','9005','保存在')+ccdsavedir;
 form2.StatusBar1.Panels[0].Width :=length(form2.StatusBar1.Panels[0].Text)*7;
 end;
ccdshow:=false;
 form1.mshow.Caption:=langtempini.ReadString('other','9015','关闭编辑与设置窗口');
form2.SpinEdit1.text:=myinifile.readString('option','saveline','32');
form2.Panel2.Width :=myinifile.ReadInteger('option','saveslit1',65);
form2.RichEdit4.Height :=myinifile.ReadInteger('option','saveslit3',50);
form2.ListBox1.height :=myinifile.ReadInteger('option','saveslit4',200);
end;

procedure TForm2.listdelClick(Sender: TObject);//删除====================

begin
 if (form2.ListBox1.ItemIndex>=0 )and
 (form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex]<>'') then

begin
  //删除INI中的小节部分 -----------
 myinifile.DeleteKey('savesort',form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex]);
 form2.ListBox1.Items.Delete(form2.ListBox1.ItemIndex);
form2.StatusBar1.Panels[0].Text:='';
end;
end;

procedure TForm2.listmoveClick(Sender: TObject);
var
myinifile1:Tinifile;
i:integer;
begin
if form2.ListBox1.ItemIndex >=0 then
begin
ListBox1.Items.Move(ListBox1.ItemIndex, 0);
form2.RichEdit3.Lines.Clear;
form2.RichEdit3.Lines.LoadFromFile(Filename);
form2.RichEdit3.Lines.SaveToFile (ExtractFilePath(Paramstr(0))+'savetexttemp.ini');
myinifile1:=Tinifile.Create(ExtractFilePath(Paramstr(0))+'savetexttemp.ini');
myinifile.EraseSection('savesort');
for i:=0 to form2.ListBox1.Items.Count -1 do
myinifile.WriteString ('savesort',form2.ListBox1.Items.Strings[i],myinifile1.ReadString('savesort',form2.ListBox1.Items.Strings[i],ExtractFilePath(Paramstr(0)) ));
form2.RichEdit3.Lines.Clear;
deletefile(ExtractFilePath(Paramstr(0))+'savetexttemp.ini');
myinifile1.Destroy ;
end;
end;

procedure TForm2.DisplayHint(Sender: TObject);
 begin
  form2.StatusBar1.Panels[1].Text:=GetLongHint(Application.Hint);
  form2.StatusBar1.Panels[1].Width :=length(form2.StatusBar1.Panels[0].Text)*7;
end;

procedure TForm2.PopupMenu2Popup(Sender: TObject);
 var
addSubItem:TMenuItem;
    i:Integer;
begin
   form2.textmove.Clear;
    form2.textmove.Visible :=false;
   if (trim(form2.RichEdit2.Lines.Text) <>'')
   and
   (form2.ListBox1.Items.Count>1) then
       begin
      form2.textmove.Visible :=true;
   for i:=0 to form2.ListBox1.Items.Count-1 do //N等于要添加的动态菜单数目,需事先定义为数值型变量,并赋值
if form2.ListBox1.Itemindex<0 then
              begin
              addSubItem:= TMenuItem.Create(Self);
              addSubItem.Name := 'ccdmove'+IntToStr(i);
              addSubItem.Caption := form2.ListBox1.Items.Strings[i];// 步骤1的SubMenuItemSource应先赋值
              form2.textmove.Add(addSubItem );  //在名称为FileOpenItem的菜单项下添加子菜单
              addSubItem.OnClick:=MymoveClick;// 步骤2的MyClick(),自定义菜单要响应的事件
                end
                else
              if  form2.ListBox1.Items.Strings[i]<>form2.ListBox1.Items.Strings[form2.ListBox1.Itemindex] then
              begin
              addSubItem:= TMenuItem.Create(Self);
              addSubItem.Name := 'ccdmove'+IntToStr(i);
              addSubItem.Caption := form2.ListBox1.Items.Strings[i];// 步骤1的SubMenuItemSource应先赋值
              form2.textmove.Add(addSubItem );  //在名称为FileOpenItem的菜单项下添加子菜单
              addSubItem.OnClick:=MymoveClick;// 步骤2的MyClick(),自定义菜单要响应的事件
                end;
        end
else
 form2.textmove.Visible :=false;


//*****************************
if trim(form2.RichEdit2.Text)='' then
begin
form2.msave.Enabled :=false;
form2.mfile.Enabled :=false;
form2.mcopy.Enabled :=false;
form2.mcut.Enabled :=false;
form2.msave1.Enabled :=false;
form2.mfile1.Enabled :=false;
form2.mcopy1.Enabled :=false;
form2.mcut1.Enabled :=false;
form2.mall.Enabled :=false;
form2.mallclear.Enabled :=false;
end
else
begin
form2.msave.Enabled :=true;
form2.mfile.Enabled :=true;
form2.mcopy.Enabled :=true;
form2.mpaste2.Enabled :=true;
form2.mcut.Enabled :=true;
form2.msave1.Enabled :=true;
form2.mfile1.Enabled :=true;
form2.mcopy1.Enabled :=true;
form2.mpaste21.Enabled :=true;
form2.mcut1.Enabled :=true;
form2.mall.Enabled :=true;
form2.mallclear.Enabled :=true;
end;
if trim(form2.RichEdit2.SelText)='' then
begin
form2.mcopy.Enabled :=false;
form2.mcut.Enabled :=false;
form2.mcopy1.Enabled :=false;
form2.mcut1.Enabled :=false;
end
else
begin
form2.mcopy.Enabled :=true;
form2.mcut.Enabled :=true;
form2.mcopy1.Enabled :=true;
form2.mcut1.Enabled :=true;
end;
if (Clipboard.HasFormat(CF_TEXT) or
 Clipboard.HasFormat(CF_OEMTEXT)) then
    //处理剪贴板中内容
    begin
    form2.mpaste2.Enabled :=true;
    form2.mpaste21.Enabled :=true;
    form1.mpaste.Enabled :=true;
     form2.mcopyclear.Enabled:=true;
    end
else
begin
form2.mpaste2.Enabled :=false;
form2.mpaste21.Enabled :=false;
form1.mpaste.Enabled :=false;
end;
end;

procedure TForm2.PopupMenu1Popup(Sender: TObject);
begin
if form2.ListBox1.Items.Count<0  then
  begin
form2.listmove.Enabled :=false;
form2.listdel.Enabled :=false;
end
else
begin
if form2.ListBox1.ItemIndex >=0 then
begin
form2.listdel.Enabled :=true;
form2.listmove.Enabled :=true;

if form2.ListBox1.Itemindex=0 then
form2.listmove.Enabled :=false
else
form2.listmove.Enabled :=true;
 end
 else
 begin
 form2.listmove.Enabled :=false;
form2.listdel.Enabled :=false;
 end;
 end;
end;
procedure TForm2.mfontClick(Sender: TObject);
begin
if optionform.FontDialog1.Execute then
begin
myinifile.Writeinteger('fontstyle','charset',optionform.FontDialog1.Font.Charset);
myinifile.Writeinteger('fontstyle','color',optionform.FontDialog1.Font.Color);
myinifile.Writeinteger('fontstyle','size',optionform.FontDialog1.Font.Size );
myinifile.WriteString ('fontstyle','name',optionform.FontDialog1.Font.Name );
form2.RichEdit2.Font:=optionform.FontDialog1.Font;
form2.RichEdit4.Font:=optionform.FontDialog1.Font;
end;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
 //********************
//SetWindowPos(form1.handle, HWND_TOPMOST,form1.Left, form1.Top, form1.Width, form1.Height,SWP_NOSIZE);//form TOP!!
 if trim(form2.RichEdit2.Text)='' then
begin
form2.msave.Enabled :=false;
form2.mfile.Enabled :=false;
form2.mcopy.Enabled :=false;
form2.mcut.Enabled :=false;
form2.msave1.Enabled :=false;
form2.mfile1.Enabled :=false;
form2.mcopy1.Enabled :=false;
form2.mcut1.Enabled :=false;
form2.mall.Enabled :=false;
form2.mallclear.Enabled :=false;
end
else
begin
form2.msave.Enabled :=true;
form2.mfile.Enabled :=true;
form2.mcopy.Enabled :=true;
form2.mpaste2.Enabled :=true;
form2.mcut.Enabled :=true;
form2.msave1.Enabled :=true;
form2.mfile1.Enabled :=true;
form2.mcopy1.Enabled :=true;
form2.mpaste21.Enabled :=true;
form2.mcut1.Enabled :=true;
form2.mall.Enabled :=true;
form2.mallclear.Enabled :=true;
end;
if trim(form2.RichEdit2.SelText)='' then
begin
form2.mcopy.Enabled :=false;
form2.mcut.Enabled :=false;
form2.mcopy1.Enabled :=false;
form2.mcut1.Enabled :=false;
end
else
begin
form2.mcopy.Enabled :=true;
form2.mcut.Enabled :=true;
form2.mcopy1.Enabled :=true;
form2.mcut1.Enabled :=true;
end;
if (Clipboard.HasFormat(CF_TEXT) or
 Clipboard.HasFormat(CF_OEMTEXT)) then
    //处理剪贴板中内容
    begin
    form2.mpaste2.Enabled :=true;
    form2.mpaste21.Enabled :=true;
    form1.mpaste.Enabled :=true;
     form2.mcopyclear.Enabled:=true;
    end
else
begin
form2.mpaste2.Enabled :=false;
form2.mpaste21.Enabled :=false;
form1.mpaste.Enabled :=false;
end;
end;

procedure TForm2.ToolButton3Click(Sender: TObject);

begin
RichEdit2.Perform(EM_UNDO,0,0);
form2.RichEdit2.CutToClipboard ;

end;

procedure TForm2.m2copyClick(Sender: TObject);
begin
Form2.RichEdit4.CopyToClipboard;
end;

procedure TForm2.m2allClick(Sender: TObject);
begin
 Form2.RichEdit4.SelectAll ;
end;

procedure TForm2.m2clearClick(Sender: TObject);
begin
Form2.RichEdit4.Text:='';
end;

procedure TForm2.Splitter1Moved(Sender: TObject);
begin
myinifile.WriteInteger('option','saveslit1',form2.Panel2.Width );
end;

procedure TForm2.ListBox1Click(Sender: TObject);
var tempccd:string;
begin
if form2.ListBox1.ItemIndex>=0 then
      begin
 tempccd:=GetTempDirectory+form2.ListBox1.Items.Strings[form2.ListBox1.Itemindex]+'temp.txt'
;
 if fileexists(tempccd) then
 form2.RichEdit2.Lines.LoadFromFile (tempccd)
  else
 form2.RichEdit2.Lines.Clear ;
//form2.Edit1.Text :=form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex]; //确定类目名称
//form2.Edit2.Text :=myinifile.readstring('savesort',form2.Edit1.Text,ExtractFilePath(Paramstr(0)));//确定类目目录
form2.StatusBar1.Panels[0].Text:=
langtempini.ReadString('other','9007','这是')+
form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex]+
langtempini.ReadString('other','9006','  保存目录是')+myinifile.readstring('savesort',
form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0)));
form2.StatusBar1.Panels[0].Width :=length(form2.StatusBar1.Panels[0].Text)*7;

            try        //判断硬盘目录是否存在
            form2.FileListBox1.Directory :=myinifile.readstring('savesort',form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0)));
            except
            on EInOutError do
                 begin    //类别属性
            if not ForceDirectories(myinifile.readstring('savesort',form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0))))then
messagebox(getactivewindow(),
pchar(langtempini.ReadString('other','9012','该类别对应目录已经取消。请用“类别管理”功能重新更改！')),
pchar(langtempini.ReadString('other','9004','错误')),mb_iconwarning);
                optionform.Show;
              optionform.PageControl1.ActivePageIndex :=0;
              optionform.Edit1.text:=form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex];
                end;
            end;
            end;
end;
procedure TForm2.FileListBox1Click(Sender: TObject);
begin
form2.FileListBox1.Cursor:=crHourGlass;
if form2.FileListBox1.FileName<>'' then
begin
form2.RichEdit4.Lines.LoadFromFile(form2.FileListBox1.FileName);
form2.FileListBox1.Hint:=form2.FileListBox1.FileName;
end;
ccddir:= form2.FileListBox1.Directory;
ccdfilename:=form2.FileListBox1.FileName;
form2.FileListBox1.Cursor:=crDefault;
end;

procedure TForm2.Splitter2Moved(Sender: TObject);
begin
myinifile.WriteInteger('option','saveslit3',form2.RichEdit4.Height);
end;

procedure TForm2.Splitter4Moved(Sender: TObject);
begin
myinifile.WriteInteger('option','saveslit4',form2.ListBox1.height );
end;

procedure TForm2.N11Click(Sender: TObject);

begin
if form2.FileListBox1.FileName <>'' then
//case messagebox(getactivewindow(),'删除后不可恢复，确认要删除吗？','确认删除',mb_okcancel)
 //of idok:
 begin
 if form2.FileListBox1.ItemIndex>=0 then
ccdjihao:=form2.FileListBox1.ItemIndex;
 deletefile(form2.FileListBox1.FileName);//messagebox(getactivewindow(),'您按下的是“确定”按钮','结果',mb_ok);
 form2.RichEdit4.Text:='';
 //end;
//  idcancel://messagebox(getactivewindow(),'取消','结果',mb_ok);
 end;
 if form2.ListBox1.ItemIndex>=0 then
 form2.FileListBox1.Directory :=myinifile.readstring('savesort',form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0)))
 else
 form2.FileListBox1.Directory :=ccdsavedir;
form2.FileListBox1.Update;
if (ccdjihao>0) and (ccdjihao<(form2.FileListBox1.Items.Count-1)) then
begin
form2.FileListBox1.ItemIndex:=ccdjihao;
form2.FileListBox1.Cursor:=crHourGlass;
if form2.FileListBox1.FileName<>'' then
begin
form2.RichEdit4.Lines.LoadFromFile(form2.FileListBox1.FileName);
form2.FileListBox1.Hint:=form2.FileListBox1.FileName;
end;
form2.FileListBox1.Cursor:=crDefault;
end;


 // messagebox(getactivewindow(),'显示警告图标','例子', mb_iconwarning);
  end;
procedure TForm2.FormCreate(Sender: TObject);
begin
Application.OnHint := DisplayHint;
form2.Visible:=false;
end;

procedure TForm2.BIG5GBClick(Sender: TObject);
 var
value:string;
begin
if form2.RichEdit2.SelText<>'' then
value:=form2.RichEdit2.SelText
else
value:=form2.RichEdit2.Text;
//确定是否是选定的文本
form2.RichEdit3.Text:=BIG5toGB(value);
if form2.RichEdit2.SelText<>'' then
form2.RichEdit2.SelText:=form2.RichEdit3.Text
else
form2.RichEdit2.Text:=form2.RichEdit3.Text;

form2.RichEdit3.Text:='';
end;


procedure TForm2.memailClick(Sender: TObject);
begin
try
 ShellExecute(handle, pchar('open'),
 pchar('mailto:soft@91z.net?subject=Report for the Savetext'), pchar(''), pchar(''),
  SW_SHOWNORMAL);
 finally
end;

end;

procedure TForm2.mhelpClick(Sender: TObject);
var strtemp:array[0..79] of Char;  //字符串转换为PChar
begin
 try
strpcopy(strtemp,ExtractFilePath(Paramstr(0))+'savetext.chm');
URLink(strtemp);
 finally
end;

end;

procedure TForm2.mhome1Click(Sender: TObject);
begin
try
  URLink('http://soft.91z.net');
  finally
end;

end;

procedure TForm2.GBBIG5Click(Sender: TObject);
 var
 tempccd:string;
value:string;
begin
if form2.RichEdit2.SelText<>'' then
value:=form2.RichEdit2.SelText
else
value:=form2.RichEdit2.Text;
//确定是否是选定的文本
form2.RichEdit3.Text:=GBtoBIG5(value);
if form2.RichEdit2.SelText<>'' then
form2.RichEdit2.SelText:=form2.RichEdit3.Text
else
form2.RichEdit2.Text:=form2.RichEdit3.Text;
if form2.ListBox1.Itemindex>=0 then
tempccd:=GetTempDirectory+form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex]+'temp.txt' //分类保存
else
tempccd:=GetTempDirectory+'savetext\savetexttemp.txt';
//准备存盘
if fileexists(tempccd) then
form2.RichEdit2.Lines.SaveToFile(tempccd);
   //   存盘
form2.RichEdit3.Text:='';
end;
procedure TForm2.N30Click(Sender: TObject);
Var T:TSHFileOpStruct;
P:String;
begin
if form2.FileListBox1.FileName <>'' then
begin
 if form2.FileListBox1.ItemIndex>=0 then
ccdjihao:=form2.FileListBox1.ItemIndex;
P:=form2.FileListBox1.FileName;
With T do
Begin
Wnd:=0;
wFunc:=FO_DELETE;
pFrom:=Pchar(P);
pTo := nil ;
fFlags := FOF_ALLOWUNDO;
hNameMappings := nil;
lpszProgressTitle := nil;
fAnyOperationsAborted := True;

End;
SHFileOperation(T);
end;
if form2.ListBox1.ItemIndex>=0 then
form2.FileListBox1.Directory :=myinifile.readstring('savesort',form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0)))
else
form2.FileListBox1.Directory :=ccdsavedir;
form2.FileListBox1.Update;
if (ccdjihao>0) and (ccdjihao<(form2.FileListBox1.Items.Count-1)) then
begin
form2.FileListBox1.ItemIndex:=ccdjihao;
form2.FileListBox1.Cursor:=crHourGlass;
if form2.FileListBox1.FileName<>'' then
begin
form2.RichEdit4.Lines.LoadFromFile(form2.FileListBox1.FileName);
form2.FileListBox1.Hint:=form2.FileListBox1.FileName;
end;
form2.FileListBox1.Cursor:=crDefault;
end;
End;

procedure TForm2.mrenameClick(Sender: TObject);
  var

ctext:widestring;
ccdtext:widestring;
ccdfilenameYN:boolean;
begin
ccdfilenameYN:=true;
if (ccddir='') or (ccdfilename='') then
ccdfilenameYN:=false;
ccdjihao:=form2.FileListBox1.ItemIndex;
if form2.RichEdit4.Text<>'' then
   begin
ctext:=MakeFileName(form2.RichEdit4.Text);
if ccdfilenameYN=false then//判断是由点击还是自己写的
begin
 form2.SaveDialog1.FileName:=ctext;
if form2.SaveDialog1.Execute then
Form2.RichEdit4.Lines.SaveToFile (form2.SaveDialog1.FileName);
end
else //判断是由点击还是自己写的
begin //是点击的
  if copy(ccddir,length(ccddir),1)='\' then
      ccdtext:=ccddir +ctext+'.txt'
      else
      ccdtext:=ccddir +'\'+ctext+'.txt';
      deletefile(ccdfilename);
      Form2.RichEdit4.Lines.SaveToFile (ccdtext);
      form2.FileListBox1.Update;
      form2.FileListBox1.ItemIndex:=form2.FileListBox1.Items.IndexOf(extractfilename(ccdtext));
end; //判断是由点击还是自己写的
     end;  //不为''
end;

procedure TForm2.mreplaceClick(Sender: TObject);
begin
ReplaceForm.show;
ReplaceForm.SourceEdit.Text :=form2.RichEdit4.SelText;
end;

procedure TForm2.ShowTBtnClick(Sender: TObject);
begin
form1.PubListBox.Itemindex:=form1.PubListBox.Items.Count-1;
form2.FileListBox1.Directory:=Extractfiledir(form1.PubListBox.Items.Strings[(form1.PubListBox.Items.count-1)]);
form2.ShowFileLabel.Caption :=
langtempini.ReadString('other','9017','当前目录:')+form2.FileListBox1.Directory;
form2.FileListBox1.ItemIndex:=
form2.FileListBox1.Items.IndexOf(extractfilename(form1.PubListBox.Items.Strings[(form1.PubListBox.Items.count-1)]));
begin //将文件读出来
form2.FileListBox1.Cursor:=crHourGlass;
if form2.FileListBox1.FileName<>'' then
begin
form2.RichEdit4.Lines.LoadFromFile(form2.FileListBox1.FileName);
form2.FileListBox1.Hint:=form2.FileListBox1.FileName;
end;
ccddir:= form2.FileListBox1.Directory;
ccdfilename:=form2.FileListBox1.FileName;
form2.FileListBox1.Cursor:=crDefault;
end;//将文件读出来
end;

procedure TForm2.BackTBtnClick(Sender: TObject);
begin
form1.PubListBox.Itemindex:=form1.PubListBox.Itemindex-1;
if form1.PubListBox.Itemindex<0 then
form1.PubListBox.Itemindex:=form1.PubListBox.Items.Count-1;
form2.FileListBox1.Directory:=
Extractfiledir(form1.PubListBox.Items.Strings[form1.PubListBox.Itemindex]);
form2.ShowFileLabel.Caption :=
langtempini.ReadString('other','9017','当前目录:')+form2.FileListBox1.Directory;
form2.FileListBox1.ItemIndex:=
form2.FileListBox1.Items.IndexOf(extractfilename(form1.PubListBox.Items.Strings[form1.PubListBox.Itemindex]));

begin //将文件读出来
form2.FileListBox1.Cursor:=crHourGlass;
if form2.FileListBox1.FileName<>'' then
begin
form2.RichEdit4.Lines.LoadFromFile(form2.FileListBox1.FileName);
form2.FileListBox1.Hint:=form2.FileListBox1.FileName;
end;
ccddir:= form2.FileListBox1.Directory;
ccdfilename:=form2.FileListBox1.FileName;
form2.FileListBox1.Cursor:=crDefault;
end;//将文件读出来
end;

procedure TForm2.N18Click(Sender: TObject);
begin     //关form2
form2.Visible :=false;
ccdshow:=false;
end;

procedure TForm2.N19Click(Sender: TObject);
begin   //文本合并
 optionform.visible:=true;
 optionform.PageControl1.ActivePageIndex :=1;
end;

procedure TForm2.N22Click(Sender: TObject);
begin     //程序换肤
 optionform.visible:=true;
 optionform.PageControl1.ActivePageIndex :=3;
end;

procedure TForm2.moptionClick(Sender: TObject);
begin       //程序设置
 optionform.visible:=true;
 optionform.PageControl1.ActivePageIndex :=2;
end;

procedure TForm2.N12Click(Sender: TObject);
begin
form3.show;
end;

procedure TForm2.mleiClick(Sender: TObject);
begin //类别管理
optionform.Show;
optionform.PageControl1.ActivePageIndex :=0;
if form2.ListBox1.Itemindex >0 then
begin
optionform.Edit1.Text:=form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex];
optionform.Edit3.Text:=myinifile.readstring('savesort',
form2.ListBox1.Items.Strings[form2.ListBox1.ItemIndex],ExtractFilePath(Paramstr(0)));
end;
end;

procedure TForm2.RichEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
   var tempccd:string;
  begin
  if form2.ListBox1.Itemindex>=0 then
 tempccd:=GetTempDirectory+form2.ListBox1.Items.Strings[form2.ListBox1.Itemindex]+'temp.txt'
 else
 tempccd:=GetTempDirectory+'savetext'+'\savetexttemp.txt';
  if trim(form2.RichEdit2.Text)='' then
deletefile(tempccd)
else
 form2.RichEdit2.Lines.SaveToFile(tempccd); //存在分类temp保存完－
end;

procedure TForm2.ToolButton2Click(Sender: TObject);
   var tempccd:string;
begin
 tempccd:=GetTempDirectory+'savetext'+'\savetexttemp.txt';
form2.FileListBox1.Directory :=ccdsavedir;
form2.StatusBar1.Panels[0].Text:=
langtempini.ReadString('other','9013','这是默认根目录')+
langtempini.ReadString('other','9005','　保存在')+ccdsavedir;
form2.StatusBar1.Panels[0].Width :=length(form2.StatusBar1.Panels[0].Text)*7;
form2.FileListBox1.Update ;
 if fileexists(tempccd) then
 form2.RichEdit2.Lines.LoadFromFile (tempccd);
end;

procedure TForm2.RichEdit2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
   var tempccd:string;
  begin
  if form2.ListBox1.Itemindex>=0 then
 tempccd:=GetTempDirectory+form2.ListBox1.Items.Strings[form2.ListBox1.Itemindex]+'temp.txt'
 else
 tempccd:=GetTempDirectory+'savetext'+'\savetexttemp.txt';
  if trim(form2.RichEdit2.Text)='' then
deletefile(tempccd)
else
 form2.RichEdit2.Lines.SaveToFile(tempccd); //存在分类temp保存完－
end;

procedure TForm2.SpinEdit1Click(Sender: TObject);
begin
myinifile.WriteString('option','saveline',form2.SpinEdit1.text );
end;

end.
