class UpsController < ApplicationController
  before_action :set_up, only: [:show, :edit, :update, :destroy]
  include UpsHelper

  # GET /ups
  # GET /ups.json
  def index
    @ups = Up.all
  end

  # GET /ups/1
  # GET /ups/1.json
  def show
  end

  # GET /ups/new
  def new
    @up = Up.new
  end

  # GET /ups/1/edit
  def edit
  end

  # POST /ups
  # POST /ups.json
  def create
    @up = Up.new(up_params)

    archivo_adjunto = params[:up][:adjunto]
    if archivo_adjunto != nil
      @up.adjunto = archivo_adjunto.original_filename
    #  FileUtils.copy(archivo_adjunto.tempfile, Rails.root.join("public/#{archivo_adjunto.original_filename}"))
    end

    respond_to do |format|
      if @up.save
        Record_Cache(@up)
        Sendmail.send_email(archivo_adjunto).deliver_now
        format.html { redirect_to @up, notice: 'Up was successfully created.' }
        format.json { render :show, status: :created, location: @up }
      else
        format.html { render :new }
        format.json { render json: @up.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ups/1
  # PATCH/PUT /ups/1.json
  def update
    respond_to do |format|
      if @up.update(up_params)
        format.html { redirect_to @up, notice: 'Up was successfully updated.' }
        format.json { render :show, status: :ok, location: @up }
      else
        format.html { render :edit }
        format.json { render json: @up.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ups/1
  # DELETE /ups/1.json
  def destroy
    @up.destroy
    respond_to do |format|
      format.html { redirect_to ups_url, notice: 'Up was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_up
      @up = Up.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def up_params
      params.require(:up).permit(:usuario, :adjunto)
    end
end
