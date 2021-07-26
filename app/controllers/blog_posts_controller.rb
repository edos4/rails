class BlogPostsController < ApplicationController
  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.create(blog_post_params)
    redirect_to @blog_post
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end


  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  end
end
