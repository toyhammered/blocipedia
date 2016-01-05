class CollaboratorPolicy < ApplicationPolicy
  def create?
    wiki = Wiki.find_by(user_id: user.id)

    !(Collaborator.exists?(user_id: record.user_id, wiki_id: record.wiki_id)) && (wiki.user_id != record.user_id) && ((user.id == wiki.user_id) || user.admin?)

    # error message occurs when you return false
  end

  def destroy?

  end

end
