require 'pry'
#require_relative './startup.rb'

class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = [] 

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        all.select do |vc|
        vc.total_worth >  1000000000
       end
    end

    def offer_contract(startup, type, amount)
        # VentureCapitalist#offer_contract
        # given a startup object, type of investment (as a string), and the amount invested (as a float), 
        #creates a new funding round and associates it with that startup and venture capitalist.
        FundingRound.new(startup, self, type, amount)

    end
    
    def funding_rounds
        # VentureCapitalist#funding_rounds
        # returns an array of all funding rounds for that venture capitalist
        FundingRound.all.select do |fr|
            fr.venture_capitalist==self
        end
    end

    def portfolio
    # VentureCapitalist#portfolio
    # Returns a unique list of all startups this venture capitalist has funded
    funding_rounds.map do |fr|
        fr.startup
    end
    end

    def biggest_investment
        # VentureCapitalist#biggest_investment
        # returns the largest funding round given by this venture capitalist
        biggest_investment=0
        funding_rounds.each do |fr|
            if fr.investment >biggest_investment
                biggest_investment=fr.investment
            end
        end
        biggest_investment
    end
    
    def invested
        # VentureCapitalist#invested
        # given a domain string, returns the total amount invested in that domain
        invested=0
        funding_rounds.each do |fr|
            invested +=fr.investment
        end
        invested
    end
    binding.pry
end






