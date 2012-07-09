class QrsController < ApplicationController
  # GET /qrs
  # GET /qrs.json
  require 'rqrcode'
  def index
    @qrs = Qr.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @qrs }
    end
  end

  # GET /qrs/1
  # GET /qrs/1.json
  def show
    @qr = Qr.find(params[:id])
    #@qr_toshow = RQRCode::QRCode.new('hello world')

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @qr }
    end
  end

  # GET /qrs/new
  # GET /qrs/new.json
  def new
  @qr = Qr.new
 # @qr = RQRCode::QRCode.new('hello world')
  
  respond_to do |format|
   format.html
    format.svg { render :qrcode => request.url, :level => :l, :unit => 4 }
    format.png { render :qrcode => request.url }
    format.json { render json: @qr }
  end

  #respond_to do |format|
    #  format.html # new.html.erb
   # format.json { render json: @qr }
 # end

  end

  # GET /qrs/1/edit
  def edit
    @qr = Qr.find(params[:id])
  end

  # POST /qrs
  # POST /qrs.json
  def create
    #@qr = Qr.new(params[:qr])
    @qr=current_user.qrs.build(params[:qr])

    respond_to do |format|
      if @qr.save
        format.html { redirect_to @qr, notice: 'Qr was successfully created.' }
        format.json { render json: @qr, status: :created, location: @qr }
      else
        format.html { render action: "new" }
        format.json { render json: @qr.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /qrs/1
  # PUT /qrs/1.json
  def update
    @qr = Qr.find(params[:id])

    respond_to do |format|
      if @qr.update_attributes(params[:qr])
        format.html { redirect_to @qr, notice: 'Qr was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @qr.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /qrs/1
  # DELETE /qrs/1.json
  def destroy
    @qr = Qr.find(params[:id])
    @qr.destroy

    respond_to do |format|
      format.html { redirect_to qrs_url }
      format.json { head :no_content }
    end
  end
end
