require 'pry'
require_relative './funding_round.rb'
require_relative './startup.rb'

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

   def self.all
      @@all
   end

   def offer_contract(startup, type, investment)
      FundingRound.new(startup, self, type, investment)
   end

   def round_list
      FundingRound.all.select { |round| round.venture_capitalist == self}
   end

   def funding_rounds
      self.round_list.count
   end

   def portfolio
      self.round_list.map { |round| round.startup }.uniq
   end

   def biggest_investment
      self.round_list.inject(0) {|note, round| note < round.investment ? round.investment : note }
   end

   def invested(domain)
      self.round_list.inject(0) do |note, round|
         note += round.investment if round.startup.domain == domain
         note
      end
   end
end
