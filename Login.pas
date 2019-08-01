unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmLogin = class(TForm)
    ImgBack: TImage;
    EdtUsuarioNome: TEdit;
    EdtSenha: TEdit;
    EdtUsuario: TEdit;
    btnEntrar: TSpeedButton;
    btnFechar: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses MenuPrincipal, modulo;

procedure ChamarLogin();
begin
   if (Trim(FrmLogin.EdtUsuario.Text) = '') or (Trim(FrmLogin.EdtSenha.Text)  = '') then
      begin
          {ShowMessage('Preencha os campos!');}
          MessageDlg('Preencha os Campos!', mtInformation, mbOKCancel, 0);
      end
      else
      begin
        {Aqui entra o BackEnd do Login}
        {Recuperar nome do usuario logado}
        nomeUsuario := FrmLogin.EdtUsuario.Text;


        frmPrincipal := TfrmPrincipal.Create(FrmLogin);
        frmPrincipal.ShowModal;

      end;
end;

procedure TFrmLogin.btnEntrarClick(Sender: TObject);
begin
    ChamarLogin();
end;

procedure TFrmLogin.btnFecharClick(Sender: TObject);
begin
       FrmLogin.Close;
end;



procedure TFrmLogin.FormCreate(Sender: TObject);
begin
      {COR HEXADECIMAL= Inverter os codigos}
      {FrmLogin.Color := $663B15}
end;


procedure TFrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if key = 13 then
      ChamarLogin();
end;

end.
