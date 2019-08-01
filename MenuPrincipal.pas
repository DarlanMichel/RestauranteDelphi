unit MenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Menus, Vcl.Buttons, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    imgFundoPrincipal: TImage;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Produtos1: TMenuItem;
    Movimentaes1: TMenuItem;
    Pedidos1: TMenuItem;
    Relatrios1: TMenuItem;
    Reservas1: TMenuItem;
    Sair1: TMenuItem;
    Clientes1: TMenuItem;
    Fornecedores1: TMenuItem;
    Mesas1: TMenuItem;
    CadastrodeProdutos1: TMenuItem;
    EntradasdeProdutos1: TMenuItem;
    NiveldoEstoque1: TMenuItem;
    Vendas1: TMenuItem;
    EntradaseSadas1: TMenuItem;
    Gastos1: TMenuItem;
    Pagamentos1: TMenuItem;
    eladePedidos1: TMenuItem;
    NovaReserva1: TMenuItem;
    ConsultarReservas1: TMenuItem;
    Logout1: TMenuItem;
    btnProdutos: TSpeedButton;
    btnMovimentacoes: TSpeedButton;
    btnPedidos: TSpeedButton;
    btnReservas: TSpeedButton;
    btnRelatorios: TSpeedButton;
    Pratos1: TMenuItem;
    Cargo1: TMenuItem;
    NovoPedido1: TMenuItem;
    StatusdosPedidos1: TMenuItem;
    lblUsuario: TLabel;
    procedure Clientes1Click(Sender: TObject);
    procedure CadastrodeProdutos1Click(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cargo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses Funcionarios, Produtos, modulo, Login, Cargo;



procedure TfrmPrincipal.btnProdutosClick(Sender: TObject);
begin
  frmProdutos := TfrmProdutos.Create(self);
  frmProdutos.ShowModal;
end;

procedure TfrmPrincipal.CadastrodeProdutos1Click(Sender: TObject);
begin
  frmProdutos := TfrmProdutos.Create(self);
  frmProdutos.ShowModal;
end;

procedure TfrmPrincipal.Cargo1Click(Sender: TObject);
begin
    frmCargo := TfrmCargo.Create(self);
    frmCargo.ShowModal;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
    frmFuncionarios := TfrmFuncionarios.Create(self);
    frmFuncionarios.ShowModal;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Application.Terminate;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  lblUsuario.Caption :=  nomeUsuario;
end;

procedure TfrmPrincipal.Logout1Click(Sender: TObject);
begin
  frmLogin := TfrmLogin.Create(self);
  Hide();
  frmLogin.ShowModal;
end;

end.
