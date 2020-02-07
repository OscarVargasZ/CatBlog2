class ArticlesController < ApplicationController
    def _index
        @articles = Article.all
      end
    
      def new
        @article = Article.new
      end

      def show
        @article = Article.find(params[:id])
      end
      def edit
        @article = Article.find(params[:id])
      end
     
      def create
        @article = Article.new(article_params)
        @article.update(user_id:current_user.id)
     
        if @article.save
          redirect_to welcome_index_path
        else
          render 'new'
        end
      end
     
      def update
        @article = Article.find(params[:id])
     
        if @article.update(article_params) 
          redirect_to @article
        elsif @article.user_id==current_user.id
          #se debe agregar aqui una pantalla de error
          render 'edit'
        else
          render 'edit'
        end
      end
     
      def destroy
        @article = Article.find(params[:id])
        if @article.user_id==current_user.id
          @article.destroy
          redirect_to welcome_index_path
        else
          redirect_to welcome_index_path
        end
      end
     
      private
        def article_params
          params.require(:article).permit(:title, :text)
        end
end
