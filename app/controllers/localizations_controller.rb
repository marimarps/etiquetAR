class LocalizationsController < ApplicationController
  # GET /localizations
  # GET /localizations.json
  def index
    @localizations = Localization.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @localizations }
    end
  end

  # GET /localizations/1
  # GET /localizations/1.json
  def show
    @localization = Localization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @localization }
    end
  end

  # GET /localizations/new
  # GET /localizations/new.json
  def new
    @localization = Localization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @localization }
    end
  end

  # GET /localizations/1/edit
  def edit
    @localization = Localization.find(params[:id])
  end

  # POST /localizations
  # POST /localizations.json
  def create
    @localization = Localization.new(params[:localization])

    respond_to do |format|
      if @localization.save
        format.html { redirect_to @localization, notice: 'Localization was successfully created.' }
        format.json { render json: @localization, status: :created, location: @localization }
      else
        format.html { render action: "new" }
        format.json { render json: @localization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /localizations/1
  # PUT /localizations/1.json
  def update
    @localization = Localization.find(params[:id])

    respond_to do |format|
      if @localization.update_attributes(params[:localization])
        format.html { redirect_to @localization, notice: 'Localization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @localization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /localizations/1
  # DELETE /localizations/1.json
  def destroy
    @localization = Localization.find(params[:id])
    @localization.destroy

    respond_to do |format|
      format.html { redirect_to localizations_url }
      format.json { head :no_content }
    end
  end
end
