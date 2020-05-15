require 'pry'
require_relative './funding_round.rb'
require_relative './venture_capitalist.rb'

class Startup

   attr_accessor :name
   attr_reader :founder, :domain
   
   @@all = []
   def initialize(name, founder, domain)
      @name = name
      @founder = founder
      @domain = domain
      @@all << self
   end

   def self.all
      @@all   
   end

   def pivot(new_domain, name)
      @@all.each do |startup|
         startup.change_domain(new_domain) if startup.name == name
      end
   end


   def change_domain(new_domain)
      @domain = new_domain
   end

   def self.find_by_founder(founder)
      @@all.find {|company| company.founder == founder }
   end

   def self.domains
      @@all.map {|company| company.domain}
   end

   def sign_contract(venture_capitalist, type, amount)
      funding_round = FundingRound.new(self, venture_capitalist, type, amount)
   end

   def num_funding_rounds
      FundingRound.all.select{|round| round.startup == self}.count 
   end  

   def helper_method
      FundingRound.all.select do |startup|
         startup.name == self 
      end 
   end 
        
   end 
   
   def total_funds 
      if self.helper_method == true 
         return self.investment
      end 
   end 
   binding.pry
end
