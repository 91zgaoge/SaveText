object OptionForm: TOptionForm
  Left = 231
  Top = 132
  Width = 451
  Height = 383
  BorderStyle = bsSizeToolWin
  Caption = #31243#24207#35774#32622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020040000000000E80200001600000028000000200000004000
    0000010004000000000000020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF007788
    880088000000000000000000000077788880088000000000000000000000F777
    8888008800000000000000000000FF777888800880000000000000000000FFF7
    7788880088000000000000000000FFFF77788880088000000000000000000FFF
    F77788880088000000000000000000FFFF77788880088000000000000000000F
    FFF77788880088888888888000000000FFFF7778888008888888888800000000
    0FFFF77788880000000000088000000000FFFF77788888888888888088000000
    000FFFF77788888888888888088000000000FFFF777888888888888880880000
    00000FFFF77777777777778888080000000000FFFFFFFFFFFFFFFF7888800000
    0000000FFF88880000007FF7888000000000000FF7888088000007F788800000
    0000000FF788808800000077888000000000000FF78880880000000788800000
    0000000FF788808800000007888000000000000FF78880880000000788800000
    0000000FF788808800000007888000000000000FF78880888000000F88800000
    0000000FF788880888888000F78000000000000FF7888880888888000FF00000
    0000000FFF788888000008800000000000000000FFF788888888808800000000
    000000000FFF788888888808800000000000000000FFF7777777788080000000
    00000000000FFFFFFFFFF780800000000000000000000000000000008000003F
    FFFF001FFFFF000FFFFF0007FFFF0003FFFF0001FFFF0000FFFF80007FFFC000
    001FE000000FF0000007F8000003FC000001FE000000FF000000FF800000FFC0
    0000FFC00F00FFC00F80FFC00FC0FFC00FC0FFC00FC0FFC00FC0FFC007C0FFC0
    0060FFC00030FFC00018FFE0000FFFF00007FFF80007FFFC0007FFFE0007}
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 443
    Height = 356
    ActivePage = TabSheet2
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object TabSheet2: TTabSheet
      Caption = #31867#21035#31649#29702
      ImageIndex = 1
      object Label4: TLabel
        Left = 0
        Top = 315
        Width = 435
        Height = 13
        Align = alBottom
        Alignment = taCenter
        Transparent = True
        WordWrap = True
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 425
        Height = 153
        Caption = #31867#21035#31649#29702
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 17
          Width = 27
          Height = 13
          Caption = #31867#21035':'
        end
        object Label3: TLabel
          Left = 16
          Top = 48
          Width = 96
          Height = 13
          Caption = #26412#31867#21035#23545#24212#30446#24405#65306
          Enabled = False
        end
        object Bevel3: TBevel
          Left = 16
          Top = 96
          Width = 393
          Height = 9
          Shape = bsBottomLine
        end
        object Edit3: TEdit
          Left = 16
          Top = 64
          Width = 329
          Height = 21
          Enabled = False
          TabOrder = 0
        end
        object Button7: TButton
          Left = 280
          Top = 112
          Width = 49
          Height = 25
          Caption = #30830#23450
          TabOrder = 1
          OnClick = Button7Click
        end
        object CheckBox1: TCheckBox
          Left = 168
          Top = 40
          Width = 249
          Height = 25
          Caption = #25918#22312#40664#35748#26681#30446#24405#19979
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = CheckBox1Click
        end
        object Button8: TButton
          Left = 360
          Top = 64
          Width = 57
          Height = 25
          Caption = #27983#35272
          TabOrder = 3
          Visible = False
          OnClick = Button8Click
        end
        object edit1: TComboBox
          Left = 64
          Top = 16
          Width = 353
          Height = 21
          ItemHeight = 13
          TabOrder = 4
          OnChange = Edit1Change
          OnClick = edit1Click
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 168
        Width = 425
        Height = 153
        Caption = #40664#35748#26681#30446#24405'         '
        TabOrder = 1
        DesignSize = (
          425
          153)
        object Label2: TLabel
          Left = 10
          Top = 17
          Width = 84
          Height = 13
          Caption = #40664#35748#25302#23384#30446#24405#65306
        end
        object Label5: TLabel
          Left = 8
          Top = 64
          Width = 405
          Height = 39
          Caption = 
            #12288#12288#26681#30446#24405#30340#24847#24605#23601#26159#65306#22914#40664#35748#30446#24405#20026'"C:\savetext"'#65292#24314#31435#26032#31867#21035'"'#26032#38395'"'#65292#21017#31243#24207#33258#21160#22312#40664#35748#26681#30446#24405#19979#29983#25104#36825#20010#31867#21035#30340#23545#24212#30446#24405 +
            #65292#21363'"c:\savetext\'#26032#38395'"'#36825#20010#30446#24405#12290
          WordWrap = True
        end
        object Edit2: TEdit
          Left = 8
          Top = 37
          Width = 409
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          TabOrder = 0
        end
        object Button1: TButton
          Left = 288
          Top = 11
          Width = 129
          Height = 22
          Hint = #31867#21035#12289#30446#24405#25913#21464'|'#28857#20987#27492#22788#26356#25913#31867#21035#30446#24405#24182#33258#21160#28155#21152#26032#31867#21035#25110#23545#24212#30446#24405#12290
          Caption = #27983#35272#30446#24405#24182#30830#35748'...'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Default'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = Button1Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #25991#20214#21512#24182
      ImageIndex = 2
      object Bevel2: TBevel
        Left = 16
        Top = 280
        Width = 393
        Height = 9
        Shape = bsBottomLine
      end
      object ListBox2: TListBox
        Left = 8
        Top = 8
        Width = 417
        Height = 273
        ItemHeight = 13
        PopupMenu = PopupMenu5
        TabOrder = 0
      end
      object Button4: TButton
        Left = 152
        Top = 296
        Width = 81
        Height = 25
        Caption = #21512#24182
        TabOrder = 1
        OnClick = Button4Click
      end
      object Button3: TButton
        Left = 264
        Top = 296
        Width = 89
        Height = 25
        Caption = #28165#38500#21512#24182#21015#34920
        TabOrder = 2
        OnClick = Button3Click
      end
      object Button2: TButton
        Left = 51
        Top = 296
        Width = 94
        Height = 25
        Caption = #21152#20837#21512#24182#21015#34920
        TabOrder = 3
        OnClick = Button2Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = #31243#24207#35774#32622
      ImageIndex = 3
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 409
        Height = 153
        Caption = #25302#23384#26102
        TabOrder = 0
        object titlecheckbox: TCheckBox
          Left = 128
          Top = 24
          Width = 153
          Height = 17
          Caption = #35760#24405#32593#39029#26631#39064
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = titlecheckboxClick
        end
        object UrlCheckBox: TCheckBox
          Left = 8
          Top = 24
          Width = 105
          Height = 17
          Caption = #35760#24405#32593#22336
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = UrlCheckBoxClick
        end
        object softCheckBox: TCheckBox
          Left = 8
          Top = 40
          Width = 217
          Height = 17
          Caption = #36719#20214#33258#21160#19979#36733'('#38656#23433#35013'FlashGet)'
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = softCheckBoxClick
        end
        object TimeCheckBox: TCheckBox
          Left = 296
          Top = 24
          Width = 89
          Height = 17
          Caption = #35760#24405#26102#38388
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = TimeCheckBoxClick
        end
        object hrefCheckBox: TCheckBox
          Left = 8
          Top = 56
          Width = 337
          Height = 17
          Caption = #21333#29420#35760#24405#25152#36873#25991#23383#20013#30340#38142#25509
          Checked = True
          State = cbChecked
          TabOrder = 4
          OnClick = hrefCheckBoxClick
        end
        object sound1: TCheckBox
          Left = 8
          Top = 96
          Width = 393
          Height = 17
          Caption = #20351#29992#31995#32479#40664#35748#22768#38899#25552#31034'('#25353#8220#27983#35272#8221#21487#33258#23450#20041#22768#38899')'
          Checked = True
          State = cbChecked
          TabOrder = 5
          OnClick = sound1Click
        end
        object savetf1: TCheckBox
          Left = 8
          Top = 72
          Width = 393
          Height = 25
          Caption = #27599#27425#33258#21160#20445#23384'('#20063#21487#25353#23567#25302#25918#31383#21475#21491#20391#30340#23567#31446#26408#26465')'
          Checked = True
          State = cbChecked
          TabOrder = 6
          OnClick = savetf1Click
        end
        object Edit4: TEdit
          Left = 8
          Top = 112
          Width = 329
          Height = 21
          ReadOnly = True
          TabOrder = 7
        end
        object Button9: TButton
          Left = 344
          Top = 114
          Width = 57
          Height = 23
          Caption = #27983#35272
          TabOrder = 8
          OnClick = Button9Click
        end
      end
      object GroupBox4: TGroupBox
        Left = 8
        Top = 168
        Width = 409
        Height = 97
        Caption = #21152#20837#31243#24207#24555#25463#26041#24335#21040
        TabOrder = 1
        object CheckBox2: TCheckBox
          Left = 8
          Top = 64
          Width = 217
          Height = 17
          Caption = #24555#36895#24037#20855#26639'('#24038#19979#35282')'
          TabOrder = 0
          OnClick = CheckBox2Click
        end
        object CheckBox3: TCheckBox
          Left = 8
          Top = 16
          Width = 201
          Height = 17
          Caption = #38543#31995#32479#21551#21160#32780#21551#21160
          TabOrder = 1
          OnClick = CheckBox3Click
        end
        object CheckBox4: TCheckBox
          Left = 8
          Top = 40
          Width = 145
          Height = 17
          Caption = #26700#38754
          TabOrder = 2
          OnClick = CheckBox4Click
        end
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 272
        Width = 409
        Height = 49
        Caption = #31243#24207#23383#20307#35774#32622
        TabOrder = 2
        object Button10: TButton
          Left = 328
          Top = 16
          Width = 65
          Height = 25
          Caption = #23383#20307#35774#32622
          TabOrder = 0
          OnClick = Button10Click
        end
        object Edit5: TEdit
          Left = 8
          Top = 16
          Width = 305
          Height = 21
          TabOrder = 1
          Text = 'abcABC'
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #31243#24207#25442#32932
      ImageIndex = 4
      object Bevel1: TBevel
        Left = 16
        Top = 184
        Width = 393
        Height = 9
        Shape = bsBottomLine
      end
      object Button5: TButton
        Left = 304
        Top = 64
        Width = 65
        Height = 25
        Caption = #24674#22797#21407#29366
        TabOrder = 0
        OnClick = Button5Click
      end
      object ListBox3: TListBox
        Left = 40
        Top = 16
        Width = 241
        Height = 153
        Hint = #21333#20987#20986#29616#30340#30382#32932#36827#34892#31243#24207#25442#32932#12290
        ItemHeight = 13
        TabOrder = 1
        OnClick = ListBox3Click
      end
      object Button6: TButton
        Left = 304
        Top = 24
        Width = 65
        Height = 25
        Caption = #23547#25214'Skin'
        TabOrder = 2
        OnClick = Button6Click
      end
      object Memo1: TMemo
        Left = 8
        Top = 200
        Width = 401
        Height = 105
        BorderStyle = bsNone
        Color = clScrollBar
        ReadOnly = True
        TabOrder = 3
      end
    end
  end
  object PopupMenu5: TPopupMenu
    Left = 369
    Top = 104
    object N12: TMenuItem
      Caption = #19978#31227
      OnClick = N12Click
    end
    object N13: TMenuItem
      Caption = #19979#31227
      OnClick = N13Click
    end
    object N14: TMenuItem
      Caption = #31227#21040#26368#39640
      OnClick = N14Click
    end
    object N15: TMenuItem
      Caption = #31227#21040#26368#20302
      OnClick = N15Click
    end
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'System'
    Font.Style = []
    Left = 324
    Top = 224
  end
end
