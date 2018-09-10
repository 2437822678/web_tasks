class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

   before_filter :safecheck
      def safecheck
        if session[:user_id]==nil   #用户必须先登录才能跳转到该页面
          redirect_to login_path
      end
   end

  def tag      #按月份的升序给文章按月份分类
    @posts=Post.order(published_at: :asc)
  end
#把文章分为三类，科学、文化、艺术
  def postscience   #分类为科学的文章
    @posts=Post.all
  end

  def postculture   #分类为文化的文章
    @posts=Post.all
  end

  def postart      #分类为艺术的文章
    @posts=Post.all
  end

  def recent
    if session[:user_id]==nil   #用户必须先登录才能跳转到该页面
      redirect_to login_path
    end
  end

  def recent1
      @feedback=Feedback.create(content: params[:content])
      redirect_to recent2_posts_path
    end
#显示所有反馈信息
def recent2
  if session[:user_id]==nil      #用户必须先登录才能跳转到该页面
    redirect_to login_path
  end
  @feedbacks=Feedback.all
end
#显示所有文章
  def index
    if session[:user_id]!=nil
     @posts = Post.all
     else
       redirect_to login_path
    end

    end


  def show
  end

  def new
    if session[:user_id]!=nil

     @post = Post.new
     else
       redirect_to login_path
    end

  end

  # GET /posts/1/edit
  #编辑文章
  def edit
    if session[:user_id]==nil
      redirect_to login_path
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]


    respond_to do |format|
      if @post.save
        flash[:success]="你的文章将会被审核，请稍候刷新页面，如果审核通过文章将会显示在页面"
          format.html { redirect_to @post }
          format.json { render :show, status: :created, location: @post }
    #  elsif @post.check==true&&@post.save==true
        else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  #更新文章
  def update

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  #删除文章
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :author, :published_at, :category)
    end
end
