class MessageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text
  belongs_to :session
end
