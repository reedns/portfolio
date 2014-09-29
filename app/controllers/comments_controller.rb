class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params)

    if @comment.save
      flash[:notice] = "Comment created! Approval pending."
      redirect_to article_path(@article)
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :author,
      :author_email,
      :content,
      )
  end
end
