unit Cargo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TfrmCargo = class(TForm)
    Image1: TImage;
    btnNovo: TButton;
    btnSalvar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    DBGrid1: TDBGrid;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCargo: TfrmCargo;

implementation

{$R *.dfm}

uses modulo;

procedure TfrmCargo.btnEditarClick(Sender: TObject);
begin
if (edtNome.Text <> '') then
  begin
    { SALVAR DADOS }
    DataModulo.tbCargo.Edit;
    MessageDlg('Alterado com Sucesso', mtInformation, mbOKCancel, 0);
    edtNome.Enabled := False;
    btnEditar.Enabled := False;
    btnExcluir.Enabled := False;
  end
  else
  begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
    edtNome.SetFocus;
  end;
end;

procedure TfrmCargo.btnExcluirClick(Sender: TObject);
begin
if MessageDlg('Deseja Excluir o Registro?', mtConfirmation, mbYesNo, 0) = mrYes
  then
  begin
    if edtCodigo.Text <> '' then
    begin
      { EXCLUIR DADOS }
      DataModulo.tbCargo.Delete;
      MessageDlg('Exclu�do com Sucesso', mtInformation, mbOKCancel, 0);
      edtNome.Enabled := False;
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

procedure TfrmCargo.btnNovoClick(Sender: TObject);
begin
  edtNome.Enabled := True;
  edtNome.Text := '';
  btnSalvar.Enabled := True;
  edtNome.SetFocus;
  DataModulo.tbCargo.Insert;
end;

procedure TfrmCargo.btnSalvarClick(Sender: TObject);
begin
if (edtNome.Text <> '') then
  begin
    { SALVAR DADOS }

    DataModulo.tbCargo.Post;
    MessageDlg('Salvo com Sucesso', mtInformation, mbOKCancel, 0);
    edtNome.Enabled := False;
    btnSalvar.Enabled := False;
  end
  else
  begin
    MessageDlg('Preencha os Campos', mtInformation, mbOKCancel, 0);
    edtNome.SetFocus;
  end;
end;

procedure TfrmCargo.DBGrid1CellClick(Column: TColumn);
begin
  edtNome.Enabled := True;
  btnExcluir.Enabled := True;
  btnEditar.Enabled := True;
end;

end.
