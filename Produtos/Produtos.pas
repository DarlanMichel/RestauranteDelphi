unit Produtos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ExtDlgs;

type
  TfrmProdutos = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtBuscarNome: TEdit;
    edtNome: TEdit;
    edtValor: TEdit;
    cbxFornecedor: TComboBox;
    DBGrid1: TDBGrid;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    edtQtd: TEdit;
    Label4: TLabel;
    imgProduto: TImage;
    btnAddFoto: TButton;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure btnAddFotoClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;
  caminhoImg: string;

implementation

{$R *.dfm}

procedure HabilitarCampos();
begin
  with frmProdutos do
  begin
    edtNome.Enabled := True;
    edtDescricao.Enabled := True;
    edtValor.Enabled := True;
    cbxFornecedor.Enabled := True;
    btnAddFoto.Enabled := True;
  end;
end;

procedure LimparCampos();
begin
  with frmProdutos do
  begin
    edtNome.Text := '';
    edtDescricao.Text := '';
    edtValor.Text := '';
  end;
end;

procedure DesabilitarCampos();
begin
  with frmProdutos do
  begin
    LimparCampos();
    edtNome.Enabled := False;
    edtDescricao.Enabled := False;
    edtValor.Enabled := False;
    cbxFornecedor.Enabled := False;
    btnAddFoto.Enabled := False;
  end;
end;

procedure CarregarImgPadrao();
begin
  caminhoImg  := ExtractFileDir(GetCurrentDir) + '\Debug\img\logo2.png';
  frmProdutos.imgProduto.Picture.LoadFromFile(caminhoImg);
end;

procedure TfrmProdutos.btnAddFotoClick(Sender: TObject);
begin
   OpenPictureDialog1.Execute();
   imgProduto.Picture.LoadFromFile(OpenPictureDialog1.FileName);
end;

procedure TfrmProdutos.btnEditarClick(Sender: TObject);
begin
  if (edtNome.Text <> '') and (edtValor.Text <> '') then
  begin
    { SALVAR DADOS }
    MessageDlg('Alterado com Sucesso', mtInformation, mbOKCancel, 0);
    DesabilitarCampos();
    CarregarImgPadrao();
    btnEditar.Enabled := False;
    btnExcluir.Enabled := False;
  end
  else
  begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
    edtNome.SetFocus;
  end;
end;

procedure TfrmProdutos.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Deseja Excluir o Registro?', mtConfirmation, mbYesNo, 0) = mrYes
  then
  begin
    if edtCodigo.Text <> '' then
    begin
      { SALVAR DADOS }
      MessageDlg('Exclu�do com Sucesso', mtInformation, mbOKCancel, 0);
      DesabilitarCampos();
      CarregarImgPadrao();
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
    end
    else
    begin
      MessageDlg('Selecione um registro para exclus�o!', mtInformation,
        mbOKCancel, 0);
      edtNome.SetFocus;
    end;
  end;
end;

procedure TfrmProdutos.btnNovoClick(Sender: TObject);
begin
  HabilitarCampos();
  LimparCampos();
  btnSalvar.Enabled := True;
  edtNome.SetFocus;
end;

procedure TfrmProdutos.btnSalvarClick(Sender: TObject);
begin
  if (edtNome.Text <> '') and (edtValor.Text <> '') then
  begin
    { SALVAR DADOS }
    MessageDlg('Salvo com Sucesso', mtInformation, mbOKCancel, 0);
    DesabilitarCampos();
    CarregarImgPadrao();
    btnSalvar.Enabled := False;
  end
  else
  begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
    edtNome.SetFocus;
  end;
end;

procedure TfrmProdutos.DBGrid1CellClick(Column: TColumn);
begin
  HabilitarCampos();
  btnExcluir.Enabled := True;
  btnEditar.Enabled := True;
end;

procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  CarregarImgPadrao();
end;

end.
