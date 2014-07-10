class MicropostSerializer < ActiveModel::Serializer

  def poster
    object.user.name
  end

  attributes :content, :id, :created_at, :updated_at, :poster
end
