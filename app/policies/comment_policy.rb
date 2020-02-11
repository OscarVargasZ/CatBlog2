class CommentPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
      user.present? && comment.user == user
  end

  def edit?
    update?
  end

  def destroy?
    user.present? && comment.user == user
  end

  private

  def comment
    record
  end
end
