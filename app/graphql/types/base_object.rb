module Types
  class BaseObject < GraphQL::Schema::Object

    def created_at
      time_to_ms(object.created_at)
    end

    def updated_at
      time_to_ms(object.updated_at)
    end

    def time_to_ms(time)
      (time.to_f * 1000).to_i
    end

  end
end
