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

    def type
       self.type
    end

    def investment
        #amount invested
    end

end
