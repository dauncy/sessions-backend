class SessionSerializer
  include FastJsonapi::ObjectSerializer
  attributes 
  has_many :messages
end
