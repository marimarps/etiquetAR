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
    @collection = current_user.collections.find(params[:collection_id])
    @qr = @collection.qrs.find(params[:qr_id])
    @resource = Resource.find(params[:id])
  end

  # POST /resources
  # POST /resources.json
  def create
    #@qr_user=current_user.qrs.build(params[:qr])
    #@qr=Qr.find(params[:id])
    @qr=current_user.qrs.find(params[:qr_id])
    @collection = @qr.collection
    @resource = @qr.resources.build(params[:resource])

    if @resource[:uri] == nil or @resource[:uri] == ''
      return render action: "new"
    else
    #example, what we have done in Qrs
    #@qr = Qr.new(params[:qr])
    #@qr=current_user.qrs.build(params[:qr])

      respond_to do |format|
        if @resource.save
          format.html { redirect_to  @qr.collection, notice: 'Resource was successfully created.' }
          format.json { render json: @resource, status: :created, location: @resource }
        else
          format.html { redirect_to  @qr.collection, notice: 'Oooops! Something happened. Resource not saved.' }
          format.json { render json: @resource.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @qr=current_user.qrs.find(params[:qr_id])
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource]) and @resource[:uri] != ''
        format.html { redirect_to  @qr.collection, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @qr.collection, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to @qr.collection, notice: 'Resource successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def comments
    @res = Resource.find(params[:id])
    @comments = @res.comments
    @comment = Comment.new
    render
  end

  def post_comment
    @res = Resource.find(params[:id])
    @comment = @res.comments.build(params[:comment])
    if @comment.save
      redirect_to url_for(controller: :resources, action: :comments, id: @comment.resource_id)
    else
      @res = Resource.find(params[:id])
      @comments = @res.comments
      render :comments
    end
  end

  def comment_toggle_visibility
    @comment = Comment.find(params[:id])
    if @comment.resource.qr.collection.user == current_user
      #p "--------------------1----------------"
      if @comment.is_visible?
        @comment.visible = false
      else
        @comment.visible = true
      end
    end
    @comment.save
    redirect_to url_for(controller: :resources, action: :comments, id: @comment.resource_id)

  end

  def go
    @qr = Qr.find(params[:qr_id])
    @resource = @qr.resources.find(params[:res_id])
    @comments = @resource.comments
  end
end