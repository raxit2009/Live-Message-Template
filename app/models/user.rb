class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :conversations, :foreign_key => :sender_id
  scope :online, lambda{ where("last_request_at > ?", 10.second.ago) }
  def online?
    last_request_at > 10.second.ago
  end
end
