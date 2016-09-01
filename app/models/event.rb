class Event < ActiveRecord::Base
  belongs_to :user
  has_many  :activities, dependent: :destroy
  scope :visible_to, -> (user) { user ? all : where(@events.user = @user) }
end
