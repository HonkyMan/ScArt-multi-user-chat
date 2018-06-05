object Server: TServer
  Left = 197
  Top = 111
  Caption = 'Chat Server '
  ClientHeight = 420
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'System'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object StatusBar: TStatusBar
    Left = 0
    Top = 401
    Width = 621
    Height = 19
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    AutoHint = True
    Panels = <>
    SimplePanel = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 621
    Height = 41
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 68
      Height = 39
      Align = alLeft
      Caption = 'Server IP: '
      ExplicitHeight = 16
    end
    object LabelIP: TLabel
      Left = 69
      Top = 1
      Width = 76
      Height = 39
      Align = alLeft
      Caption = '192.168.0.1'
      ExplicitHeight = 16
    end
  end
  object Memo1: TMemo
    Left = 0
    Top = 41
    Width = 621
    Height = 360
    Align = alClient
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 176
    Top = 168
  end
end
