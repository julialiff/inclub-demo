class AvaliacaoFestaController < ApplicationController
  before_action :set_avaliacao_festum, only: [:show, :edit, :update, :destroy]

  # GET /avaliacao_festa
  # GET /avaliacao_festa.json
  def index
    @avaliacao_festa = AvaliacaoFestum.all
  end

  # GET /avaliacao_festa/1
  # GET /avaliacao_festa/1.json
  def show
  end

  # GET /avaliacao_festa/new
  def new
    @avaliacao_festum = AvaliacaoFestum.new
  end

  # GET /avaliacao_festa/1/edit
  def edit
  end

  # POST /avaliacao_festa
  # POST /avaliacao_festa.json
  def create
    @avaliacao_festum = AvaliacaoFestum.new(avaliacao_festum_params)

    respond_to do |format|
      if @avaliacao_festum.save
        format.html { redirect_to @avaliacao_festum, notice: 'Avaliacao festum was successfully created.' }
        format.json { render :show, status: :created, location: @avaliacao_festum }
      else
        format.html { render :new }
        format.json { render json: @avaliacao_festum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /avaliacao_festa/1
  # PATCH/PUT /avaliacao_festa/1.json
  def update
    respond_to do |format|
      if @avaliacao_festum.update(avaliacao_festum_params)
        format.html { redirect_to @avaliacao_festum, notice: 'Avaliacao festum was successfully updated.' }
        format.json { render :show, status: :ok, location: @avaliacao_festum }
      else
        format.html { render :edit }
        format.json { render json: @avaliacao_festum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /avaliacao_festa/1
  # DELETE /avaliacao_festa/1.json
  def destroy
    @avaliacao_festum.destroy
    respond_to do |format|
      format.html { redirect_to avaliacao_festa_url, notice: 'Avaliacao festum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avaliacao_festum
      @avaliacao_festum = AvaliacaoFestum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def avaliacao_festum_params
      params.fetch(:avaliacao_festum, {})
    end
end
