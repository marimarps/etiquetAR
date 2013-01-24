class ResourcesController < ApplicationController
  # GET /resources
  # GET /resources.json
  def index
    @resources = current_user.qrs.find(params[:qr_id]).resources

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

 



  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @qr = current_user.qrs.find(params[:qr_id])
    @resource = @qr.resources.build

     respond_to do |format|
      format.html # new.html.erb
       format.json { render json: @resource }
      end
  end

  # GET /resources/1/edit
  def edit
    @qr = current_user.qrs.find(params[:qr_id])
    @resource = Resource.find(params[:id])
  end

  # POST /resources
  # POST /resources.json
  def create
    #@qr_user=current_user.qrs.build(params[:qr])
    #@qr=Qr.find(params[:id])

    @qr=current_user.qrs.find(params[:qr_id])
    @resource = @qr.resources.build(params[:resource])
    #example, what we have done in Qrs
    #@qr = Qr.new(params[:qr])
    #@qr=current_user.qrs.build(params[:qr])

    respond_to do |format|
      if @resource.save
        format.html { redirect_to  current_user, notice: 'Resource was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { redirect_to  current_user, notice: 'Oooops! Something happened. Resource not saved.' }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @qr=current_user.qrs.find(params[:qr_id])
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        format.html { redirect_to  current_user, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Resource successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end