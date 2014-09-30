class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.editor?
        scope.all
      elsif user.author?
        scope.where(author: user)
      else
        scope.where(published: true)
      end
    end
  end

  def publish?
    user.editor?
  end

  def update?
    user.editor? || user.author?
  end

  def destroy?
    user.editor?
  end

  def create?
    user.editor? || user.author?
  end
end
