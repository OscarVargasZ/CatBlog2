class CommentsController < ApplicationController
#incluid authorizacion function
  include Pundit
#endregion

#callback
    #*what is callback: 
        #Las devoluciones de llamada son métodos que se llaman en ciertos 
        #momentos del ciclo de vida de un objeto. Con las devoluciones de llamada,
        #es posible escribir código que se ejecutará siempre que se cree, guarde,
        #actualice, elimine, valide o cargue un objeto Active Record desde la base de datos.
    before_action :article_comment_load, except: [:create , :show]
    before_action :authenticate_user!, only: [:edit, :create, :update, :destroy]
    before_action :authorizer, except: [:create, :new]
#

#method
    def create
        authorize Comment
        @article = Article.find(params[:article_id])
        @comment = @article.comments.new(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to article_path(@article)
    end

    def destroy
        @comment.destroy
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
#

#private method
    
    private
    def comment_params #esta funcion se encarga de especificar que datos se pueden entregar por parametros
        params.require(:comment).permit(:body) #en este caso se requiere un comment y se permite que lleguen body
    end
    def article_comment_load
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id]) #busca el comentario segun el id (se deben crear las modificaciones en el
                                                       #modelo atraves de uba migracion
    end
    def authorizer
        authorize @comment #ahotoriza al usuario a comentar
    end
#

end