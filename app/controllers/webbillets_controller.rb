class WebbilletsController < ApplicationController
  before_action :set_webbillet, only: %i[ show edit update destroy ]

  # GET /webbillets or /webbillets.json
  def index
    @webbillets = Webbillet.all
  end

  # GET /webbillets/1 or /webbillets/1.json
  def show
  end

  # GET /webbillets/new
  def new
    @webbillet = Webbillet.new
  end

  # GET /webbillets/1/edit
  def edit
  end

  # POST /webbillets or /webbillets.json
  def create
    @webbillet = Webbillet.new(webbillet_params)

    respond_to do |format|
      if @webbillet.save
        format.html { redirect_to webbillet_url(@webbillet), notice: "Webbillet was successfully created." }
        format.json { render :show, status: :created, location: @webbillet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @webbillet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webbillets/1 or /webbillets/1.json
  def update
    respond_to do |format|
      if @webbillet.update(webbillet_params)
        format.html { redirect_to webbillet_url(@webbillet), notice: "Webbillet was successfully updated." }
        format.json { render :show, status: :ok, location: @webbillet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @webbillet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webbillets/1 or /webbillets/1.json
  def destroy
    @webbillet.destroy

    respond_to do |format|
      format.html { redirect_to webbillets_url, notice: "Webbillet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webbillet
      @webbillet = Webbillet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def webbillet_params
      params.require(:webbillet).permit(:flyer, :url, :title)
    end
end
