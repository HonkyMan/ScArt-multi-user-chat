unit Client;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
  ClientSocket1: TClientSocket;
  Panel1: TPanel;
  Panel2: TPanel;
  ButCon: TButton;
  ButDis: TButton;
    EditIP: TEdit;
  Edit1: TEdit;
  ButSend: TButton;
  Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure ButConClick(Sender: TObject);
    procedure ButDisClick(Sender: TObject);
    procedure ButSendClick(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
  var Nick: string;
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButConClick(Sender: TObject);
begin
  ClientSocket1.Port:=41276;
  ClientSocket1.Host:=EditIP.Text;
  //192.168.0.48
  EditIP.Clear;
  butSend.Visible:=True;
  Edit1.Visible:=True;
  butDis.Visible:=True;
  butCon.Visible:=False;
  EditIP.Visible:=False;
  ClientSocket1.Active:=true;
end;

procedure TForm1.ButDisClick(Sender: TObject);
begin
  butSend.Visible:=False;
  butDis.Visible:=False;
  Edit1.Visible:=False;
  butCon.Visible:=True;
  EditIP.Visible:=True;
  Memo1.Clear;
  ClientSocket1.Active:=False;
end;

procedure TForm1.ButSendClick(Sender: TObject);
begin
  clientsocket1.Socket.SendText(Nick + ': ' + Edit1.Text);
  edit1.Clear;
end;

procedure TForm1.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
var   mes : string;
begin
  mes:=socket.ReceiveText;
  Memo1.Lines.Add(mes);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Nick:=InputBox('Введите имя пользователя', 'Логин','Пользователь1');
  ClientSocket1.Port := 41276;
  ClientSocket1.Host := '10.17.43.88';
  ClientSocket1.Active:=true;
end;



end.
