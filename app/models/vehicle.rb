class Vehicle < ActiveRecord::Base
  belongs_to :client

  def self.years_for_select
    Time.now.year.downto(1900).inject([]) { |arr, n| arr << [n,n]; arr }
  end
end
