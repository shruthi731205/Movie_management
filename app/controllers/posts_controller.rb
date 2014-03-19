class PostsController < ApplicationController
  layout "posts"
def new
   @post = Post.new
  end
 
  def create
  	@post = Post.new(post_params)
    if @post.save
    redirect_to @post
  else
    render 'new'
  end
end


  def show
  @post = Post.find(params[:id])
end

def index
  @posts = Post.all
  @posts = Post.page(params[:page]).order(:Name).per(5)

 respond_to do |format|
    format.html
    format.csv { send_data @posts.to_csv }
    format.xls # { send_data @products.to_csv(col_sep: "\t") }
  end
end

def edit
  @post = Post.find(params[:id])
end

def update
  @post = Post.find(params[:id])
 
  if @post.update(params[:post].permit(:Name,:Movie_Scree, :Price , :Description, :Language, :photo))
    redirect_to @post
  else
    render 'edit'
  end
end

def destroy
  @post = Post.find(params[:id])
  @post.destroy
 
  redirect_to posts_path
end

  private
  def post_params
    params.require(:post).permit(:Name ,:Movie_Scree, :Price , :Description, :Language, :photo)
  end

end
