object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 346
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 305
    Width = 635
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitLeft = 8
    object Edit1: TEdit
      Left = 16
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object ButSend: TButton
      Left = 496
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Send'
      TabOrder = 1
      OnClick = ButSendClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    TabOrder = 1
    object ButCon: TButton
      Left = 240
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Connect'
      TabOrder = 0
      OnClick = ButConClick
    end
    object ButDis: TButton
      Left = 496
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Diconnect'
      TabOrder = 1
      OnClick = ButDisClick
    end
    object EditIP: TEdit
      Left = 16
      Top = 8
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'EditIP'
      TextHint = 'Adress...'
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 635
    Height = 264
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnRead = ClientSocket1Read
    Left = 200
    Top = 144
  end
end
