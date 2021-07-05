class Startup

    attr_accessor :name, :domain
    attr_reader :founder

    @@all = []

    def initialize(name,domain,founder)
        @name = name
        @domain = domain
        @founder = founder
        Startup.all << self
    end

    def self.all
        @@all
    end

    def pivot(domain,name)
        self.domain = domain
        self.name = name
    end

    def self.find_by_founder(founder)
        Startup.all.find do |startup_instance|
            startup_instance.founder == founder
        end
    end

    def self.domains
        Startup.all.map do |startup_instance|
            startup_instance.domain
        end
    end

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self,venture_capitalist,type,investment)
    end

    def funding_round
        FundingRound.all.select do |funding_round_instance|
            funding_round_instance.startup == self
        end
    end

    def num_funding_rounds
        funding_round.count
    end

    def total_funds
        total_funds = 0
        funding_round.each do |funding_round_for_startup|  
        total_funds += funding_round_for_startup.investment
        end
        total_funds
    end

    def investors
        funding_round.map do |funding_round_instance|
            funding_round_instance.venture_capitalist
        end.uniq
    end

    def big_investors
        investors.select do |investor|
            VentureCapitalist.tres_commas_club.include?(investor)
        end
    end
end
