
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

   # @resources=Resource.find(params[:id])
   @resources=Resource.where(:qr_id => @qr.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @qr }
    end
  end

  def go
    @qr = Qr.find(params[:id])
    redirect_to @qr.default_resource
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


  #PRINTING IMAGES: Talks to js in qrs.js.cofee
  def export_as_image
    width = params[:width].to_i
    height = params[:height].to_i
    data = {}
     height.times do |y|
       if params["r#{y}"]
         row = params["r#{y}"].split(%r{,\s*})
       end
       row.size.times do |r|
         if row[r]
           pixel = row[r].to_s.split(':')
         end
         pixel[0] = pixel[0].to_s.rjust(6,'0')
         if pixel.size == 2
           pixel[1].to_i.times do
             (data[y] ||= []) << pixel[0]
           end
         else
           (data[y] ||= []) << pixel[0]
         end
       end
     end

     img =  Magick::Image.new(width , height )
     q = Array.new
     width.times do
       q << Magick::Pixel.new(0,0,0,0)
     end
     height.times do |y|
       width.times do |x|
    q[x].red   = data[y][x][0..1].hex
    q[x].green = data[y][x][2..3].hex
    q[x].blue  = data[y][x][4..5].hex
       end
       img.store_pixels(0, y, width, 1, q)
     end

     img.format = "PNG"

     send_data(img.to_blob , :disposition => 'inline', :type => 'image/png', :filename => "chart.png?#{rand(99999999).to_i}")

  end


end
