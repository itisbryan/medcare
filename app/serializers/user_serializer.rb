class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :last_name, :first_name, :dob
end
