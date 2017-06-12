class AvaliacaoBaladasController < ApplicationController
  before_action :set_avaliacao_balada, only: [:show, :edit, :update, :destroy]

  # GET /avaliacao_baladas
  # GET /avaliacao_baladas.json
  def index
    @avaliacao_baladas = AvaliacaoBalada.all
  end

  # GET /avaliacao_baladas/1
  # GET /avaliacao_baladas/1.json
  def show
  end

  # GET /avaliacao_baladas/new
  def new
    @avaliacao_balada = AvaliacaoBalada.new
  end

  # GET /avaliacao_baladas/1/edit
  def edit
  end

  # POST /avaliacao_baladas
  # POST /avaliacao_baladas.json
  def create
    @avaliacao_balada = AvaliacaoBalada.new(avaliacao_balada_params)

    respond_to do |format|
      if @avaliacao_balada.save
        format.html { redirect_to @avaliacao_balada, notice: 'Avaliacao balada was successfully created.' }
        format.json { render :show, status: :created, location: @avaliacao_balada }
      else
        format.html { render :new }
        format.json { render json: @avaliacao_balada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avaliacao_baladas/1
  # PATCH/PUT /avaliacao_baladas/1.json
  def update
    respond_to do |format|
      if @avaliacao_balada.update(avaliacao_balada_params)
        format.html { redirect_to @avaliacao_balada, notice: 'Avaliacao balada was successfully updated.' }
        format.json { render :show, status: :ok, location: @avaliacao_balada }
      else
        format.html { render :edit }
        format.json { render json: @avaliacao_balada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliacao_baladas/1
  # DELETE /avaliacao_baladas/1.json
  def destroy
    @avaliacao_balada.destroy
    respond_to do |format|
      format.html { redirect_to avaliacao_baladas_url, notice: 'Avaliacao balada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliacao_balada
      @avaliacao_balada = AvaliacaoBalada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaliacao_balada_params
      params.fetch(:avaliacao_balada, {})
    end
end
