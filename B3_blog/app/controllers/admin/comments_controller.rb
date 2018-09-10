class Admin::CommentsController < Admin::BaseController

#实现管理员删除文章的功能
  def destroy
    @comment=Comment.find_by(params[:id1])

    @comment.destroy

    redirect_to admin_post_path
  end

    private
     def comment_params
       params.require(:comment).permit(:author,:content)
     end

     def set_comment
       @comment = Comment.find(params[:id])
     end
end
