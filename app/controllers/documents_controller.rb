class DocumentsController < ApplicationController
  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all

    respond_to do |format|
       #format.html # show.html.erb
      format.html { render json: @documents }
      format.json { render json: @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @document = Document.find(params[:id])

    respond_to do |format|
      #format.html # show.html.erb
      format.html { render json: @document }
      format.json { render json: @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new

    respond_to do |format|
      format.html # show.html.erb
      #format.html { render json: @document }
      format.json { render json: @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(params[:document])    
    puts @document
    

    respond_to do |format|
      if @document.save
        #format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.html { render json: @document, status: :created, location: @document }
        format.json { render json: @document, status: :created, location: @document }
      else
        #format.html { render action: "new" }
        format.html { render json: @document.errors, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])

    respond_to do |format|
      if @document.update_attributes(params[:document])
        #format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.html { head :no_content }
        format.json { head :no_content }
      else
        #format.html { render action: "edit" }
        format.html { render json: @document.errors, status: :unprocessable_entity }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      #format.html { redirect_to documents_url }
      format.html { head :no_content }
      format.json { head :no_content }
    end
  end
end
