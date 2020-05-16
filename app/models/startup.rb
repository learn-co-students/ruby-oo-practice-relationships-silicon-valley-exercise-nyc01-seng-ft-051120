class Startup
  @@all = []
  attr_reader :founder, :domain
  attr_accessor :name

  def initialize(name, founder, domain)
    @name = name
    @founder = founder
    @domain = domain
    Startup.all << self
  end

  def self.all
    @@all
  end

  def self.find_by_founder(founders_name)
    Startup.all.find{ |startup| startup.founder  == founders_name }
  end

  def self.domains
    Startup.all.map { |s| s.domain }
  end

  def pivot(domain, name)
    self.domain = domain
    self.name = name
  end

  def sign_contract(venture_capitalist, type_of_investment, amount_invested)
   FundingRound.new(self, venture_capitalist, type_of_investment, amount_invested)
  end

  def funding_rounds
   FundingRound.all.select { |f| f.startup == self }
  end

  def num_funding_rounds
   self.funding_rounds.count
  end

  def total_funds
   self.funding_rounds.map { |f| f.investment }.sum
  end

  def investors
   self.funding_rounds.map { |f| f.venture_capitalist }
  end

  def big_investors
    self.investors.select { |i|
      i.total_worth >= 1000000000
     }
  end

  private

   def domain=(domain_name)
     @domain = domain_name
   end


end
