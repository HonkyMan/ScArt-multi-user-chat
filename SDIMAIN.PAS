unit SDIMAIN;

interface

uses Winapi.Windows, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.Menus, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.ImgList, Vcl.StdActns, Vcl.ActnList, Vcl.ToolWin, winsock,
  System.ImageList, System.Actions, ScktComp, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdSocksServer;

type
  TServer = class(TForm)
    StatusBar: TStatusBar;
    Panel1: TPanel;
    Label1: TLabel;
    LabelIP: TLabel;
    Memo1: TMemo;
    ServerSocket1: TServerSocket;
    procedure HelpAbout1Execute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Server: TServer;

implementation

uses About, Client;

{$R *.dfm}

Function GetLocalIP:String; const WSVer=$101;
var   	wsaData: TWSAData;
		P: PHostEnt;
		Buff : array[0..127] of char;
Begin
	result:='';
	if WSAStartup(WSVer,wsaData)=0 then
	begin
		if GetHostName(@Buff,128)=0 then
		begin
			P:=GetHostByName(@Buff);
			if P<>nil then
				Result:= iNet_ntoa(PInAddr(p^.h_addr_list^)^);
		end;
		WSACleanup;
	end
End;


procedure TServer.FormCreate(Sender: TObject);
begin
  ServerSocket1.Port:=41276;
  ServerSocket1.Active:=True;
  LabelIP.Caption:=GetLocalIp;
  Memo1.Text := '';
  Form1.ShowModal();
end;

procedure TServer.HelpAbout1Execute(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TServer.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
   Memo1.Lines.Add('Connected :'+Socket.RemoteAddress+';');
end;

procedure TServer.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  Memo1.Lines.Add('Disconnected :'+Socket.RemoteAddress+';');
end;

procedure TServer.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var   i : integer ;   mes : string;
begin
  mes:=socket.ReceiveText;
  memo1.Lines.Add('Say :' + mes +';');
  for i := 0 to ServerSocket1.Socket.ActiveConnections-1 do
  begin
    Serversocket1.Socket.Connections[i].SendText(mes);
  end;
end;

end.
