class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    # if a member, they can manage their own posts or create a new one
    if user.role? :member
        can :manage, Post, :user_id => user.id
        can :manage, Comment, :user_id => user.id
    end

    #moderators can delete
    if user.role? :moderator
        can :destroy, Post
        can :destroy, Comment
    end

    #Admin can do anything
    if user.role? :admin
        can :manage, :all
    end

    can :read, :all

  end
end
