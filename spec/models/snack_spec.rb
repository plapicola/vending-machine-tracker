require 'rails_helper'

RSpec.describe Snack, type: :model do
  it {should have_many :machine_snacks}
  it {should have_many :machines}
  it {should validate_presence_of :name}
  it {should validate_presence_of :price}
end
