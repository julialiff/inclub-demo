class FestaController < ApplicationController
  before_action :set_festum, only: [:show, :edit, :update, :destroy]

  # GET /festa
  # GET /festa.json
  def index
    @festa = Festum.all
  end

  # GET /festa/1
  # GET /festa/1.json
  def show
  end

  # GET /festa/new
  def new
    @festum = Festum.new
  end

  # GET /festa/1/edit
  def edit
  end

  # POST /festa
  # POST /festa.json
  def create
    @festum = Festum.new(festum_params)

    respond_to do |format|
      if @festum.save
        format.html { redirect_to @festum, notice: 'Festum was successfully created.' }
        format.json { render :show, status: :created, location: @festum }
      else
        format.html { render :new }
        format.json { render json: @festum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /festa/1
  # PATCH/PUT /festa/1.json
  def update
    respond_to do |format|
      if @festum.update(festum_params)
        format.html { redirect_to @festum, notice: 'Festum was successfully updated.' }
        format.json { render :show, status: :ok, location: @festum }
      else
        format.html { render :edit }
        format.json { render json: @festum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /festa/1
  # DELETE /festa/1.json
  def destroy
    @festum.destroy
    respond_to do |format|
      format.html { redirect_to festa_url, notice: 'Festum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_festum
      @festum = Festum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def festum_params
      params.fetch(:festum, {})
    end
end
