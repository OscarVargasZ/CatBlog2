class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
      user.present? && (comment.user == user || user.has_role?(:admin)) 
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && (comment.user == user || user.has_role?(:admin)) 
  end

  private

  def comment
    record
  end
end
