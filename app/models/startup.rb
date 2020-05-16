require 'pry'
# require_relative './funding_round.rb'
# require_relative './venture_capitalist.rb'

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

   # def pivot(new_domain, new_name)
   #    @@all.each do |startup|
   #       if startup == self
   #          startup.change_domain(new_domain)

   #    end
   #    self
   # end

   # def change_domain(new_domain)
   #    @domain = new_domain
   # end

   # def change_name(new_name)
   #    @name = new_name
   # end

   def pivot(new_domain, new_name)
      @domain = new_domain
      @name = new_name
      self
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

   def all_funding_round_by_startup
      FundingRound.all.select { |round| round.startup == self }
   end 
        

   def num_funding_rounds
      self.all_funding_round_by_startup.count 
   end  
        
   
   def total_funds 
      self.all_funding_round_by_startup.inject(0) do |note, round| 
         note += round.investment
         note
      end
   end 

   def investors
      self.all_funding_round_by_startup.map { |round| round.venture_capitalist}.uniq
   end

   def big_investors
      self.investors.select { |investor| VentureCapitalist.tres_commas_club.include?(investor)}
   end
end
