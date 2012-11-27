class ProdutosController < ApplicationController
  
  before_filter :authenticate_user!
  
  #buscando a compra selecionada
  before_filter :find_compra

  respond_to :html, :json

  def index
    @produtos = @compra.produtos

    respond_with @produtos
  end

  def show
    @produto = @compra.produtos.find(params[:id])

    respond_with @produto
  end

  def new
    @produto = @compra.produtos.build 

    respond_with @produto

  end

  def edit
    @produto = @compra.produtos.find(params[:id])
  end

  def create
    @produto = @compra.produtos.build(params[:produto])
    @produto.save

    if @produto.save
      redirect_to compra_produtos_path(@compra)
    else
      render :action => "new"
    end
  end

  def update
    @produto = Produto.find(params[:id])

    respond_to do |format|
      if @produto.update_attributes(params[:produto])
        format.html { redirect_to compra_produtos_path(@compra), notice: 'Produto was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @produto = Produto.find(params[:id])
    @produto.destroy

    respond_to do |format|
      format.html { redirect_to compra_produtos_path(@compra) }
      format.json { head :no_content }
    end
  end

  private

  def find_compra
    @compra = Compra.find(params[:compra_id])
  end

end
