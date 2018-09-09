module Types
  class BaseInputObject < GraphQL::Schema::InputObject

    def ms_to_time(ms)
      Time.at(ms / 1000.0).utc
    end

  end
end
