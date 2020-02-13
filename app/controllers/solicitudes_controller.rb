class SolicitudesController < ApplicationController
    def index
        @articles = Article.all #rellena la variable global articles con todos los datos que contenga el modelo article
    end
end
