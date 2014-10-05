class CommentsController < ApplicationController
  before_action :set_article

  def create
    @comment = @article.comments.build(comment_params)

    if @comment.save
      flash[:notice] = 'Comment created! Approval pending.'
      redirect_to article_path(@article)
    else
      render 'posts/show'
    end
  end

  def update
    @comment = Comment.find(params[:id])
    authorize @comment

    if @comment.update(comment_params)
      flash[:notice] = 'Comment approved!'
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
      :approved
      )
  end

  def set_article
    @article = Article.find(params[:article_id])
  end
end
