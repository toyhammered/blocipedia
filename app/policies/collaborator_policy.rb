class CollaboratorPolicy < ApplicationPolicy
  def create?
    wiki = Wiki.find_by(user_id: user.id)
    # first part checks if user does not exists. (don't want to add the same editor twice)
    # second part checks if the wiki creator and the collaborator to be added are the same (adding yourself as an editor, no point in doing that)
    # third part checks if Person logged in is the Wiki creator, or if the Person logged in is an admin (prevent anyone from editing anyones wiki)
    !(Collaborator.exists?(user_id: record.user_id, wiki_id: record.wiki_id)) && (wiki.user_id != record.user_id) && ((user.id == wiki.user_id) || user.admin?)

    # error message occurs when you return false
  end

  def destroy?
    wiki_owner = User.find(record.wiki.user_id)

    user.admin? || user.id == wiki_owner.id
  end

end
