class YourSpacePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end
  end

  def new
    true
  end

  def create?
    true
  end

  def update?
    record.flat.user == user || user.admin
  end
end
