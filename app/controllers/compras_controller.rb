class ComprasController < ApplicationController

  respond_to :html, :json

  before_filter :authenticate_user!

  before_filter :find_compra, :only => [:show, :edit, :update, :destroy]

  #Action  que realiza o convite de particiapntes
  def convidar
    @compra = Compra.find(params[:compra_id])

    if params[:user_select]
      user_select = params[:user_select]

      user = User.find_by_nome(user_select)

      @compra.users << user

      redirect_to compra_produtos_path(@compra), notice: "#{user.nome} adicionado a sua lista de compras com sucesso!!"
    end
  end

  # #Action  que excluir o participante da lista
  # def remove_participante
  #   @compra = Compra.find(params[:compra_id])

  #   if params[:user_id]
  #     user_id = params[:user_id]

  #     @compra.users.destroy(user_id)

  #     redirect_to compra_produtos_path(@compra), notice: "Participante removido da sua lista de compras com sucesso!!"
  #   end
  # end

  def index
    @compras = current_user.compras

    respond_with @compras
  end

  def show
    respond_with @compras
  end

  def new
    @compra = Compra.new

    respond_with @compra
  end

  def edit
  end

  def create
    @compra = Compra.new(params[:compra])

    @compra.users << current_user

    respond_to do |format|
      if @compra.save
        format.html { redirect_to compra_produtos_path(@compra), notice: 'Compra cadastrada com sucesso!!' }
        format.json { render json: compra_produtos_path(@compra), status: :created, location: @compra }
      else
        format.html { render action: "new" }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @compra.update_attributes(params[:compra])
        format.html { redirect_to @compra, notice: 'Compra atualizada com sucesso!!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @compra.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @compra.destroy

    respond_to do |format|
      format.html { redirect_to compras_url }
      format.json { head :no_content }
    end
  end

  private
  def find_compra
    @compra = Compra.find(params[:id])
  end
end