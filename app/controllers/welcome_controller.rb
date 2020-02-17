class WelcomeController < ApplicationController
    #callback
    #
    #method
    def index
        @articles = Article.all #rellena la variable global articles con todos los datos que contenga el modelo article
    end
    #
    #private method
    #
end
