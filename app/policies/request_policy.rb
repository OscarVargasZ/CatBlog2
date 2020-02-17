class RequestPolicy < ApplicationPolicy
    def index?
        user.present? && (user.has_role?(:editor)|| user.has_role?(:admin)) 
    end
    def accept?
        user.present? && (user.has_role?(:editor)|| user.has_role?(:admin)) 
    end
    def reject?
        user.present? && (user.has_role?(:editor)|| user.has_role?(:admin)) 
    end
  end