class AuthorsController < ApplicationController
  def index
    @authors = Author.all
  end
  
  def show
    @author = Author.find(params[:id])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
# binding.pry
    if @author.valid?
      # binding.pry
      @author.save

      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
  end


  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end
