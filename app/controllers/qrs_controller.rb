
class QrsController < ApplicationController
  # GET /qrs
  # GET /qrs.json
 

  def index
    @qrs = Qr.all
    #In case we want to paginate the qr codes
    @qrs = Qr.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @qrs }
    end
  end

  def index_resources
    @qr = Qr.find(params[:id])

    @resources=Resource.find(params[:id])

    respond_to do |format|
      format.html {render 'index'}# index.html.erb
      format.json { render json: @resources }
    end
  end

  # GET /qrs/1
  # GET /qrs/1.json
  def show
    @qr = Qr.find(params[:id])
    @qr_uri = "www.etiquetar.com.es/qrs/"+params[:id]

    @resources=Resource.where(:qr_id => @qr.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @qr }
    end
  end

  def go
    @qr = Qr.find(params[:id])
    if params[:p] != nil
      session[:profile] = params[:p]
    end

    if session[:profile] == nil 
      render
    else
      redirect_to @qr.resources.first.uri
    end
  end

  def download
    @qr = Qr.find(params[:id])
    url = "http://chart.apis.google.com/chart?cht=qr&chl=#{@qr.default_resource}&chs=120x120&choe=UTF-8"
    image = open(url).read

    send_data(image, :filename => "qr.png", :type => 'image/png')
  end

  # GET /qrs/new
  # GET /qrs/new.json
  def new
      @qr = Qr.new
      #We add a resource if it isn't one
      #if @qr.resources.empty?
      @resource = @qr.resources.build 
       #@qr.resources.build
      #end

      #p @qr
      #p @qr.resources
      respond_to do |format|
       format.html
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
   
    @qr = current_user.qrs.build(params[:qr])

    #We create a default resource for the QR.    
    respond_to do |format|
      if @qr.save 
        format.html { redirect_to current_user, notice: 'Qr was successfully created.' }
        format.json { render json: @qr, status: :created, location: @qr }
      else
        format.html { redirect_to current_user, notice: 'Oooops! Something went wrong while creating. Try again.'  }
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
        format.html { redirect_to current_user, notice: 'Qr was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to current_user, notice: 'Oooops! Something went wrong while updating. Try again.'  }
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
        format.html { redirect_to current_user, notice: 'Qr was successfully removed.' }
        format.json { head :no_content }
    end
  end


end
