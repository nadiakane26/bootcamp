class AuthorsController < ApplicationController
  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show] # "Signed-in"

  # GET /authors or /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/1 or /authors/1.json
  def show
    @author = Author.find(params[:id]) # Find the author
    @articles = Article.where(author_id: params[:id]) # Fetch articles by this author
  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
    @author = Author.find(params[:id])
  end

  # POST /authors or /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: "Author was successfully created." }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1 or /authors/1.json
  def update
    @author = Author.find(params[:id]) 
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: "Author was successfully updated." }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1 or /authors/1.json
  def destroy
    @author.destroy!

    respond_to do |format|
      format.html { redirect_to authors_path, status: :see_other, notice: "Author was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    # Only allow a list of trusted parameters through.
    def author_params
      params.expect(author: [ :name, :bio, :image ])
    end
end
