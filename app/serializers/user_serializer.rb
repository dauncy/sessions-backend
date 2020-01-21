class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :username, :bio, :location
  has_many :messages
end
