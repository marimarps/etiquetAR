
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
    @qr_uri = "http://etiquetar.herokuapp.com/qrs/"+params[:id]

    @resources=Resource.where(:qr_id => @qr.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @qr }
    end
  end

  def go
    @qr = Qr.find(params[:id])
    @owner = @qr.user
    if @qr.resources.count > 0 #hay recursos, los mostramos
        if @qr.resources.count > 0 #check si existe algun recurso con profile para este qr?
            render
        else
          #redirect_to @qr.resources.first.uri
          redirect_to url_for(action: :go, controller: :resources, res_id: @qr.resources.first.id, qr_id: @qr.id)
        end
    else #no hay recursos
       redirect_to root_path, notice: 'Ooops! No resources asociated to this TAG'
    end



  

    #if params[:p]!= nil
      #session["profile-#{@owner.id}"] = params[:p]
    ##end

    #if session["profile-#{@owner.id}"] == nil 
     # render
    #else
      #Con cookies!!!!!!!!!!
      #We redirect to the profile
      #resource = @qr.resources.where({:profile_id => session["profile-#{@owner.id}"]}).first
      #if resource == nil
        #There is no resource matching that profile - redirecting to first unspecified.
       # resource = @qr.resources.where({:profile_id => nil}).first
      #end
      #-------------

    
  end

  def download
    @qr = Qr.find(params[:id])
    url = "http://chart.apis.google.com/chart?cht=qr&chl=#{url_for(:action => :go, :controller => :qrs, :id => @qr.id, :only_path => false)}&chs=120x120&choe=UTF-8"
    image = open(url).read

    send_data(image, :filename => "qr.png", :type => 'image/png')
  end

  # GET /qrs/new
  # GET /qrs/new.json
  def new
      @qr = Qr.new

      @qr.resources.build 

      respond_to do |format|
       format.html
       format.json { respond_with_bip(@qr) }
      end
  end

  # GET /qrs/1/edit
  def edit
    @qr = Qr.find(params[:id])
    @collections = Collection.where("user_id = ?", current_user.id)
    return render :layout => "modal" if params[:ajax] == "1"
  end

  # POST /qrs
  # POST /qrs.json
  def create
    @collection = Collection.find(params[:collection_id])
    @qr = @collection.qrs.build(params[:qr])
    @qr.user = current_user

    
    #We create a default resource for the QR.    
    respond_to do |format|
      if @qr.save 
        format.html { redirect_to @collection, notice: 'Qr was successfully created.' }
        format.json { respond_with_bip(@qr) } 
      else
        p @qr.errors
        format.html { redirect_to @collection, notice: 'Oooops! Something went wrong while creating. Try again.'  }
        format.json { respond_with_bip(@qr) }
      end
    end
  end

  # PUT /qrs/1
  # PUT /qrs/1.json
  def update
    @qr = Qr.find(params[:id])

    respond_to do |format|
      if @qr.update_attributes(params[:qr])
        format.html { redirect_to @qr.collection, notice: 'Qr was successfully updated.' }
        format.json { respond_with_bip(@qr) }
      else
        format.html { redirect_to @qr.collection, notice: 'Oooops! Something went wrong while updating. Try again.'  }
        format.json { respond_with_bip(@qr) }
      end
    end

  end

  # DELETE /qrs/1
  # DELETE /qrs/1.json
  def destroy
    @qr = Qr.find(params[:id])
    @qr.destroy

    respond_to do |format|
        format.html { redirect_to @qr.collection, notice: 'Qr was successfully removed.' }
        format.json { head :no_content }
    end
  end



end
