class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    # Hyphotetical scenario where user has the role string attribute
    # and the available options for it are admin, business_owner, business_employee
    # ["admin", "business_owner"].include?(user.role)

    #############################
    ##### REAL DEAL #############
    #############################
    true
  end

  def edit?
    update?
  end

  def update?
    # Hyphotetical Scenario
    # user.role == "admin" || (user.role == "business_employee")


    #############################
    ##### REAL DEAL #############
    #############################
    is_owner_or_admin? # refactor to dry up the code
  end

  def destroy?
    is_owner_or_admin? # refactor to dry up the code
  end

  def is_owner_or_admin?
    # user which is the current_user from devise
    # record which is the instance that we send in the authorize method in the controller
    record.user == user || user.admin # read it as @restaurant.user == current_user || current_user.admin == true
  end
end
