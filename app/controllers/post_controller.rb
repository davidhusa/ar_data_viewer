class PostController < ApplicationController
  def view
  	@posts = Post.all
  	respond_to do |x|
  		x.html
  		x.json { render json: @posts }
  	end
  end

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

 # JSON only:

  def new
    @post = Post.new

    render json: @post
  end

  def edit
    @post = Post.find(params[:id])
  end


  def create
    @post = Post.new(params[:post])
	if @post.save
		render json: @post, status: :created, location: @post
	else
        render json: @post.errors, status: :unprocessable_entity
	end
  end

  def update
    @post = Post.find(params[:id])

	if @post.update_attributes(params[:post])
		head :no_content
	else
		render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    head :no_content 
  end
end
