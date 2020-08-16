# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new # guest user (not logged in)
    case user.type
    when 'SuperAdmin'
      can :manage, :all
    when 'Teacher'
      can :manage, Course, teacher_id: user.id
      can :manage, User, id: user.id
      cannot :approved, Course
      can :manage, Comment, user_id: user.id
      can :approve, CourseJoinRequest
      can :read, :all
    when 'Student'
      can :read, :all
      can :manage, User, id: user.id
      can :manage, Comment, user_id: user.id
      can :send_request, CourseJoinRequest
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
