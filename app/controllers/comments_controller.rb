class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        @comment.update(user_id:current_user.id)
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        if(@comment.user_id == current_user.id)
            @comment.destroy
        end
        redirect_to article_path(@article)
    end
    def edit
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        @comment = @article.comments.find(params[:id])
        if @article.comment.user_id == current_user.id
                if @comment.update(comment_params) 
                    redirect_to article_path(@article)
                end
            end
        redirect_to 'edit'
    end

      private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
end
