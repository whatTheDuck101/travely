class ItemPolicy < ApplicationPolicy
  def destroy?
    user == record.user
  end

  def create?
    true
  end
end
