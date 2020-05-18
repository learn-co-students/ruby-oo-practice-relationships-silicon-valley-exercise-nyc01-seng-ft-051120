require 'pry'
class Startup
   @@all = []
   attr_reader :founder
   attr_accessor :name, :domain
   def initialize(name, founder, domain)
      @name = name
      @founder = founder
      @domain = domain
      @@all << self
   end

   def pivot(domain, name)
      self.domain = domain
      self.name = name
   end

   def self.all
      @@all
   end

   def self.find_by_founder(founder)
      self.all.find {|startup| startup.founder == founder}
   end
   def self.domains
      domains = []
      self.all.map {|startup| domains << startup.domain}
   end

   def sign_contract(venture_capitalist, type, amount)
      FundingRound.new(self, venture_capitalist, type, amount)
   end

   def fundings
      FundingRound.all.select {|fundings| fundings.startup == self}
   end

   def num_funding_rounds
      self.fundings.count
   end

   def total_funds
      sum = 0
      all_investments = []
      self.fundings.map do |fundings| 
         all_investments << fundings.investment
         sum = all_investments.inject(0, :+)
      end
      sum
   end

   def investors
      self.fundings.map {|fundings| fundings.venture_capitalist}
      .uniq
   end

   def big_investors
      big_investors = []
      self.investors.map do |investor| 
         if investor.total_worth >= 1_000_000_000
            big_investors << investor
         end
      end
      big_investors.uniq
   end

      
end
