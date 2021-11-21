# frozen_string_literal: true

class CardPolicy
  attr_reader :user, :card

  def initialize(user, card)
    @user = user
    @card = card
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user
  end
  
  def new?
    create?
  end

  def update?
    user.has_role?(:admin) || user.id == card.user_id
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
