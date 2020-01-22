class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :username, :bio, :location
  has_many :sessions
  has_many :messages, through: :sessions
end
