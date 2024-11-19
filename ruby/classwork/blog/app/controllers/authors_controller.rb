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
        flash[:notice] = "Author was successfully created."
      redirect_to @author
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
        flash[:notice] = "Author was successfully updated."
        redirect_to @author
      else
        render :edit
      end
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    redirect_to @author, status: :see_other
  end

  private

    # Only allow a list of trusted parameters through.
    def author_params
      params.expect(author: [ :name, :bio, :image])
    end
end
