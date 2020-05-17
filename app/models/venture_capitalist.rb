class VentureCapitalist
    attr_reader :name, :total_worth
    attr_accessor :funding_round

    @@all = []

    def initialize(name,total_worth)
        @name = name
        @total_worth = total_worth
        VentureCapitalist.all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select do |venture_capitalist_instance|
            venture_capitalist_instance.total_worth > 1000000000
        end
    end

    def offer_contract(startup,type, amount)
        FundingRound.new(startup,self,type,amount)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round_instance|
            funding_round_instance.venture_capitalist == self       
        end
    end

    def portfolio
        funding_rounds.map do |funding_round_instance|
            funding_round_instance.startup
        end.uniq
    end

    def biggest_investment
        funding_rounds.max_by do |funding_round_instance|
        funding_round_instance.amount
        end
    end

    def invested(domain)
        amount = 0
        funding_rounds.map do |funding_round_instance|
        funding_round_instance.domain == domain
        amount += funding_round_instance.amount
        end
        amount
    end

end
