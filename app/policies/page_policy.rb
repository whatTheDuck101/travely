class PagePolicy < ApplicationPolicy
  def home?
    true
  end

  def dashboard?
    true
  end
end
