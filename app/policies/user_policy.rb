class UserPolicy < ApplicationPolicy


  def show?
    user.admin? || user_match
  end

private

  def user_match
    user.id == record.id
  end


end
