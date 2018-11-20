class RequestPolicy < ApplicationPolicy

  def create?
    user != record.listing.item.user
  end

  def update?
    user == record.listing.item.user
  end
end
