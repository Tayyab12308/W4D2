class CatsController < ApplicationController
  def index
    @cats = Cat.all
  end

  def create
    cat = Cat.new(cat_params)
    debugger
    if cat.save
      redirect_to cats_url
    else
      render json: cat.errors.full_messages, status: 422
    end

  end

  def new
    
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
  end

  def show
    @cat = Cat.find_by(id: params[:id])
  end

  def update
    cat.find_by(id: params[:id])

    if cat.update(cat_params)
      redirect_to cat_url(cat.id)
    else
      render json: cat.full.error_messages, status: 422
    end

  end

  def destroy
    cat = Cat.find_by(id: params[:id])

    if cat
      cat.destroy
    else
      render json: "Cat does not exist", status: 404
    end
  end



  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end