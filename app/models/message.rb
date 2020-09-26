class Message < ApplicationRecord
  validates :message, presense: true

  belongs_to :admin
end
