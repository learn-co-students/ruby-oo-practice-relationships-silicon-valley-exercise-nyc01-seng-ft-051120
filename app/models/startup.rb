require 'pry'
require './tools/console.rb'
require_relative './venture_capitalist.rb'

class Startup
   
    attr_reader :founder
    attr_accessor :domain, :name
    
    @@all=[]
    
    def initialize(name, founder, domain)
        @name=name
        @founder=founder
        @domain=domain
        @@all << self

    end

    def self.all
        @@all
    end

    def pivot(name, domain)
        @name=name
        @domain=domain
    end

    def find_by_founder(founder)
        self.all.find do |startup|
            if startup.founder==founder
                startup.name
            end
        end
    end

    def domains
        self.all.map do |startup|
            startup.domain
        end
    end
    def self.sign_contract(vc, type, investment)
        FundingRound.new(self, vc ,  type, investment)
       
    end
 

     def num_funding_rounds
        counter=0
        FundingRound.all.each do |contract|
            if contract.startup==self
                counter +=1
            end
        end
        counter
     end

     def total_funds
        counter = 0
        FundingRound.all.each do |investment|
            if investment.startup == self
            counter += investment.investment
            end
        end
        counter
    end

    def investors
        FundingRound.all.map do |investor|
            if investor.startup == self
                investor.venture_capitalist
            end
        end.uniq
    end
    def big_investors
        investors.select do |vc|
             VentureCapitalist.tres_commas_club.include?(vc)
        end


        # FundingRound.all.select do |fund|
        #    if fund.startup==self && VentureCapitalist.tres_commas_club.include?(fund.venture_capitalist)
        #     return fund.venture_capitalist
        #    end
        # end
    end
    

end
