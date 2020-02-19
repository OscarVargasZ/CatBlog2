class RequestsController < ApplicationController
    include Pundit
    #callback
        #*what is callback: 
        #Las devoluciones de llamada son métodos que se llaman en ciertos 
        #momentos del ciclo de vida de un objeto. Con las devoluciones de llamada,
        #es posible escribir código que se ejecutará siempre que se cree, guarde,
        #actualice, elimine, valide o cargue un objeto Active Record desde la base de datos.
        before_action :request_load
        before_action :authenticate_user!, only: [:edit, :create, :update, :destroy]
        before_action :authorizer
    #
    #method
        def index
        end
        def accept
            @request = Request.find(params[:id])
            
            if (!@request.approved?) && (!@request.article.active?)
                @request.approve!
                @request.article.activate!
                redirect_to request_path
            else
                redirect_to welcome_index_path
            end
        end
        def reject
            @request = Request.find(params[:id])
            
            if (!@request.rejected?)
                @request.reject!
                if !@request.article.inactive?
                    @request.article.inactived!
                end
                redirect_to request_path
            else
                redirect_to welcome_index_path
            end
        end
    #
     #private method
        private
        def request_load
            @requests = Request.all
        end
        def authorizer
            authorize @requests
        end
    #
end
        
    