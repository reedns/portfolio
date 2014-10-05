class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.editor? || user.author?
        scope.all
      else
        scope.where(approved: true)
      end
    end
  end

  def update?
    user.editor? || user.author?
  end
end
