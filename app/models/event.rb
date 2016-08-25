class Event < ActiveRecord::Base
  belongs_to :user
  scope :visible_to, -> (user) { user ? all : where(@events.user = @user) }
end
