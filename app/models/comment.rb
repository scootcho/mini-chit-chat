class Comment < ActiveRecord::Base
  belongs_to :user

  validate :body, presences: true, length: {maximum: 2000}
end
