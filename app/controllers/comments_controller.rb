class CommentsController < ApplicationController
    before_action :article_comment_load, except: [:create , :show]
    before_action :authorization, only: [:edit]
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        @comment.update(user_id:current_user.id)
        redirect_to article_path(@article)
    end

    def destroy
        if(@comment.user_id == current_user.id)
            @comment.destroy
        end
        redirect_to article_path(@article)
    end
    def edit

    end
    def update     
        if @comment.update(comment_params) 
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
    def article_comment_load
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
    end
    def authorization
        if(@comment.user_id != current_user.id)
            redirect_to '/welcome/index'
        end
    end
end