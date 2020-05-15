require 'pry'
require './tools/console.rb'

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

    def all
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
binding.pry
end
