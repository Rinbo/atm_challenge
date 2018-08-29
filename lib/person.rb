class Person

    attr_accessor :name

    def initialize(name = {})
        set_name(name[:name])
    end

    def set_name(name)
        name.nil? ? missing_name : @name = name
    end

    def missing_name
        raise ArgumentError, "A name is missing"
    end


end