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

    respond_to do |format|
      if @produto.save
        format.html { redirect_to compra_produtos_path(@compra), notice: 'Produto cadastrado com sucesso!!' }
        format.json {
          render :status => 200,
           :json => { :success => true,
                      :info => "Produto adicionado com sucesso!",
                      :data => { :produto => @produto }
                    }
        }
      else
        format.html { render :action => "new" }
        format.json {
          render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => @produto.errors,
                        :data => {} }
        }
      end
    end
  end

  def update
    @produto = Produto.find(params[:id])

    respond_to do |format|
      if @produto.update_attributes(params[:produto])
        format.html { redirect_to compra_produtos_path(@compra), notice: 'Produto atualizado com sucesso!!' }
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

  # processa as requisiçoes para alterar o status do produto
  def nao_comprado
    @produto = @compra.produtos.find(params[:produto_id])
    @produto.nao_comprado!

    rescue ActiveRecord::RecordNotFound
      render  :status => 404,
              :json => { :success => false,
              :info => 'Not Found',
              :data => {} }
  end

  def comprado
    @produto = @compra.produtos.find(params[:produto_id])
    @produto.comprado!

    rescue ActiveRecord::RecordNotFound
      render  :status => 404,
              :json => { :success => false,
              :info => 'Not Found',
              :data => {} }
  end

  private

  def find_compra
    @compra = Compra.find(params[:compra_id])
  end

end
