class YourSpacePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def new
      true
    end

    def create?
      true
    end

    def update?
      record.user == user || user.admin
    end
  end
end
