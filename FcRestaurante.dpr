program FcRestaurante;

uses
  Vcl.Forms,
  Login in 'Login.pas' {FrmLogin},
  MenuPrincipal in 'MenuPrincipal.pas' {frmPrincipal},
  Funcionarios in 'Cadastros\Funcionarios.pas' {frmFuncionarios},
  Produtos in 'Produtos\Produtos.pas' {frmProdutos},
  Cargo in 'Cadastros\Cargo.pas' {frmCargo},
  modulo in 'modulo.pas' {DataModulo: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TfrmFuncionarios, frmFuncionarios);
  Application.CreateForm(TfrmProdutos, frmProdutos);
  Application.CreateForm(TfrmCargo, frmCargo);
  Application.CreateForm(TDataModulo, DataModulo);
  Application.Run;
end.
