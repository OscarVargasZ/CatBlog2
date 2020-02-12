class ArticlesController < ApplicationController
#incluid authorizacion function
  include Pundit
#endregion

#declaracion de acciones, pre ejecucion de las llamadas del controlador
    before_action :article_load, except: [ :create, :new] #carga un articulo segun id
    before_action :authenticate_user!, only: [:edit, :create, :update, :destroy] #llamada divese para authenticar el usuario
    before_action :authorizer, except: [:create, :new] #se encarga de confirmar las credenciales de un usuario
#endregion

#controller call
      def new     
        authorize Article
        @article = Article.new
      end

      def show
        authorize Article
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
        if @article.update(article_params) 
          redirect_to @article
        else
          render 'edit'
        end
      end

      def destroy
        @article.destroy
        redirect_to welcome_index_path
      end
#endregion

#private method
    private
      def article_params
        params.require(:article).permit(:title, :text)
      end
      def article_load
        @article = Article.find(params[:id])
      end
      def authorizer
        authorize @article
      end
#endregion
end
