object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 375
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 300
    Height = 200
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'var a: Integer;'
      'var b: Integer = 10;'
      'var c: string = '#39'asdfasdf'#39';'
      'var d: string;'
      'var e: Integer;')
    ParentFont = False
    TabOrder = 0
  end
  object Console: TMemo
    Left = 0
    Top = 200
    Width = 300
    Height = 150
    Color = clDefault
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Console')
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object ExecuteButton: TButton
    Left = 0
    Top = 350
    Width = 150
    Height = 25
    Caption = 'Execute'
    TabOrder = 2
    OnClick = ExecuteButtonClick
  end
  object CancelButton: TButton
    Left = 150
    Top = 350
    Width = 150
    Height = 25
    Caption = 'Cancel'
    TabOrder = 3
  end
end
