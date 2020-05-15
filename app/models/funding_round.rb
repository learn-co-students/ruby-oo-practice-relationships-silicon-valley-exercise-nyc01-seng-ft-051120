require 'pry'

class FundingRound
    attr_reader :startup, :venture_capitalist
    attr_accessor :type

    
    @@all = []

    def initialize(startup, venture_capitalist, type, investment)
        @startup = startup 
        @venture_capitalist = venture_capitalist
        @type = type
        @investment = investment
        @@all << self
    end

    def all
        @@all
    end

    
end
