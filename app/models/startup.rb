class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize
        Startup.all << self
    end

    def self.all
        @@all
    end

    def pivot(domain,name)
        self.domain = domain
        self.name = name
    end

    def find_by_founder(founder)
        Startup.all.find do |startup_instance|
            startup_instance.founder == founder
        end
    end

    def domains
        Startup.all.map do |startup_instance|
            startup_instance.domain
        end
    end

end
