class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text
  belongs_to :user
end
