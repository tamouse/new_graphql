module Types
  class BaseObject < GraphQL::Schema::Object
    def created_at_ms
      (object.created_at.to_f * 100).to_i
    end
    def updated_at_ms
      (object.updated_at.to_f * 100).to_i
    end
  end
end
