class WelcomeController < ApplicationController
    before_action :a
    
    def def index
    end

    private
    def a
        @articles = Article.all
    end
end
