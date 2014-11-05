class TodoSerializer < ActiveModel::Serializer
  attributes :title, :order, :completed
end
