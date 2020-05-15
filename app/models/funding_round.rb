class FundingRound

    attr_reader :startup, :venture_capitalist
    attr_accessor :type, :amount

    @@all = []

    def initialize(startup,venture_capitalist,type,amount)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @amount = amount
        FundingRound.all << self
    end

    def self.all
        @@all
    end

    def startup
        self.startup 
    end

    def venture_capitalist
        VentureCapitalist.all.find do |venture_capitalist|
        venture_capitalist.funding_round == self
        end
    end

    def type
       self.type
    end

    def investment
        total_investment = 0
        venture_capitalist.each do |venture_capitalist_instance|
        total_investment += venture_capitalist_instance.amount.to_f
        end
    end

end
