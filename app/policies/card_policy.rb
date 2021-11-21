# frozen_string_literal: true

class CardPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    update?
  end

  def new?
    update?
  end

  def update?
    @user.has_any_role?(:user, :admin)
  end

  def edit?
    update?
  end

  def destroy?
    update?
    #need to make admin able to delete and edit books, currently not working on other users cards
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end

    private

    attr_reader :user, :scope
  end
end
