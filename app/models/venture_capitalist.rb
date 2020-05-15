class VentureCapitalist
    attr_reader :name

    @@all = []

    def initialize
        VentureCapitalist.all << self
    end

    def total_worth
        total_worth
    end

    def self.all
        @@all
    end

    def tres_commas_club
        VentureCapitalist.all.map do |venture_capitalist_instance|
            venture_capitalist_instance.total_worth > 1,000,000,000
        end
    end

end
