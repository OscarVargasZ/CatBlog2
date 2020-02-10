class ArticlesController < ApplicationController
    before_action :article_load, except: [ :create, :new]
    before_action :authorization, only: [:edit,:destroy, :update]    
      def new
        @article = Article.new
      end

      def show
        @comment = Comment.new
      end

      def edit
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
        if(@article.user_id == current_user.id)
          if @article.update(article_params) 
            redirect_to @article
          elsif @article.user_id==current_user.id
            #se debe agregar aqui una pantalla de error
            render 'edit'
          else
            render 'edit'
          end
        
        end
      end
      def destroy
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
        def article_load
          @article = Article.find(params[:id])
        end
        def authorization
          if(@article.user_id != current_user.id)
            flash[:notice] = "Usted no es dueño de este articulo"
            redirect_to '/welcome/index'
          end
      end
end
