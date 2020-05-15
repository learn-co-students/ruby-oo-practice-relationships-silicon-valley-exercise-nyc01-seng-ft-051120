require 'pry'

class VentureCapitalist

   attr_accessor :name, :total_worth

   @@all = []

   def initialize(name, total_worth)
      @name = name
      @total_worth = total_worth
      @@all << self
   end

   def self.tres_commas_club
      @@all.select {|investor| investor.total_worth > 1_000_000_000}
   end

   binding.pry

end
