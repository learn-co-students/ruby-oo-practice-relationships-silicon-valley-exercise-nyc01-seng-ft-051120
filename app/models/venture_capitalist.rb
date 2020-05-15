class VentureCapitalist
    attr_reader :name, 
    attr_accessor :funding_round

    @@all = []

    def initialize
        VentureCapitalist.all << self
    end

    def total_worth
        total_worth
    end

    def self.all
        @@all
    end

    def tres_commas_club
        VentureCapitalist.all.map do |venture_capitalist_instance|
            venture_capitalist_instance.total_worth > 1,000,000,000
        end
    end

    def offer_contract(startup,type, amount)
        FundingRound.new(startup,self,type,amount)
    end

    def funding_rounds
        FundingRound.all.map do |funding_round_instance|
            funding_round_instance.venture_capitalist == self
        end
    end

    def portfolio
        funding_round.map do |funding_round_instance|
            funding_round_instance.startup
        end.uniq
    end

    def biggest_investment
        funding_rounds.max_by do |funding_round_instance|
        funding_round_instance.amount
        end
    end

    def invested(domain)
        funding_rounds.map do |funding_round_instance|
        funding_round_instance.startup.domain == domain
        amount += funding_round_instance.amount
        end
        amount
    end

end
