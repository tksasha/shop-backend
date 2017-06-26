class UserPolicy < ApplicationPolicy
  def index?
    user.present? && user.roles?(:admin)
  end

  def new?
    !user.present?
  end

  def edit?
    user.present? && user.roles?(:admin)
  end

  def show?
    user.present? && user.id == resource.id
  end
end
