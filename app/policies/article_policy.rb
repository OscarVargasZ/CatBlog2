class ArticlePolicy <  ApplicationPolicy
    def index?
      true
    end
    def show?
      true
    end
    def new?
      create?
    end
    def create?
      user.present?
    end
  
    def update?
        user.present? && article.user == user
    end
  
    def edit?
      update?
    end
  
    def destroy?
      user.present? && article.user == user
    end
  
    private

    def article
      record
    end
  end
  