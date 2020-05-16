class VentureCapitalist
  @@all = []
  attr_reader :name
  attr_accessor :total_worth

  def initialize(name, total_worth)
  @name = name
  @total_worth = total_worth
  VentureCapitalist.all << self
  end

  def self.all
  @@all
  end

  def self.tres_commas_club
   VentureCapitalist.all.select{ |v| v.total_worth >= 1000000000 }
  end

  def offer_contract(startup_object, type_of_investment, amount_invested)
   FundingRound.new(startup_object, self, type_of_investment, amount_invested)
  end

  def funding_rounds
   FundingRound.all.select { |f| f.venture_capitalist == self }
  end

  def portfolio
   self.funding_rounds.map { |f| f.startup }.uniq
  end

  def biggest_investment
   self.funding_rounds.max_by { |f| f.investment }
  end

  def invested(domain_name)
    self.funding_rounds.select { |f| f.startup.domain == domain_name }.map { |f| f.investment }.sum
  end

end
