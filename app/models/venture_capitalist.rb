require 'pry'

class VentureCapitalist
    attr_accessor :name, :total_worth

    @@all = [] 

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def all
        @@all
    end

    def tres_commas_club
       all.select do |vc|
        vc.total_worth >  1000000000
       end
    end

end
