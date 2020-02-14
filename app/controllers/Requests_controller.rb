class RequestsController < ApplicationController
    #callback
        #*what is callback: 
        #Las devoluciones de llamada son métodos que se llaman en ciertos 
        #momentos del ciclo de vida de un objeto. Con las devoluciones de llamada,
        #es posible escribir código que se ejecutará siempre que se cree, guarde,
        #actualice, elimine, valide o cargue un objeto Active Record desde la base de datos.

    #

    #method
        def index
            @articles = Article.all
        end
        #
     #private method
        private
        def comment_params #esta funcion se encarga de especificar que datos se pueden entregar por parametros
            params.require(:comment).permit(:body) #en este caso se requiere un comment y se permite que lleguen body
        end
        def request_load
            @article = Article.find(params[:article_id])
            @comment = @article.comments.find(params[:id]) #busca el comentario segun el id (se deben crear las modificaciones en el
                                                       #modelo atraves de uba migracion
        end
        def authorizer
            authorize #ahotoriza al usuario a comentar
            end
        end
    #