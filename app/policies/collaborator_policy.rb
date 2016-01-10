class CollaboratorPolicy < ApplicationPolicy

  def create?
    user.admin? || user.owns?(record.wiki)
  end

  def destroy?
    user.admin? || user.owns?(record.wiki)
  end

end
