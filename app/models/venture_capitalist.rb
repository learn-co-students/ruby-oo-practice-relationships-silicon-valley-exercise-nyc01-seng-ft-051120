require 'pry'

class VentureCapitalist
   @@all = []
   attr_accessor :name, :total_worth
   
   def initialize(name, total_worth)
      @name = name
      @total_worth = total_worth
      @@all << self
   end

   def self.all
      @@all
   end

   def self.tres_commas_club
      @@all.select {|vcapitalist| vcapitalist.total_worth >= 1_000_000_000}
   end

   def offer_contract(startup, type, investment)
      FundingRound.new(startup, self, type, investment)
   end

   def funding_rounds
      FundingRound.all.select {|fundings| fundings.venture_capitalist == self}
   end

   def portfolio
      self.funding_rounds.map {|fundings| fundings.startup}
      .uniq
   end

   def biggest_investment
      self.funding_rounds.max_by {|fundings| fundings.investment}
   end

   def invested(domain)
      all_investments = []
      sum = 0
      funding_by_domain = self.funding_rounds.select { |fundings| fundings.startup.domain == domain}
      funding_by_domain.map do |funding|
         all_investments << funding.investment
         sum = all_investments.inject(0, :+)
      end
      sum
   end
end