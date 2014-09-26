class ArticlePolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      if user.nil?
        scope.where(published: true)
      elsif user.editor?
        scope.all
      elsif user.author?
        scope.where(author: user)
      end
    end
  end

  def publish?
    user.editor?
  end

  def update?
    user.editor? || user.author? if user
  end
end
