class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  before_filter :safecheck
     def safecheck
       if session[:manager_id]==nil   #用户必须先登录才能跳转到该页面
         redirect_to admin_login_path,:notice=>'please login first'
     end
  end

  # GET /posts
  # GET /posts.json
  #管理员以月份的升序查看反馈信息
  def recent
    @feedbacks=Feedback.order(created_at: :asc)
  end
#管理员以文章分类看文章
   def posttag
     if session[:manager_id]==nil
       redirect_to admin_login_path
     end
     @posts=Post.order(created_at: :asc)
   end
#管理员以科学为分类查看文章
   def postscience
     @posts=Post.all
   end
   #管理员以文化为分类查看文章
   def postculture
     @posts=Post.all
   end
   #管理员以艺术为分类查看文章
   def postart
     @posts=Post.all
   end

    def update
      @post.update(post_params)
      redirect_to admin_post_path(@post)
    end

  def shouye
  end

  def index
    if session[:manager_id]==nil
      redirect_to admin_login_path

    else
      @posts = Post.all
    end
    end


  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new


  # GET /posts/1/edit

  # POST /posts
  # POST /posts.json
=begin
  def create
    @post = Post.new(title: params[:title], content: params[:content], published_at:params[:published_at])
    @post.user_id = session[:user_id]
     @post.save
     redirect_to check2_admin_posts_path
   end
=end
=begin
    @post = Post.new(post_params)


    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
=end
  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json

  def set_post
    @post = Post.find(params[:id])
  end


  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :author, :published_at, :id, :verify)
    end
end
