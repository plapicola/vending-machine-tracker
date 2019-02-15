require 'rails_helper'

describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it { should have_many :snacks}
  end

  describe 'instance_methods' do
    before :each do
      @owner = Owner.create(name: "Jim")
      @machine = @owner.machines.create(location: "Classroom D")
      @item_1 = @machine.snacks.create(name: "Duffy Roll", price: 2.50)
      @item_2 = @machine.snacks.create(name: "Honey Bun", price: 1.50)
    end
    it '.average_price' do
      expect(@machine.average_price).to eq(2.0)
    end

    it '.number_of_snacks' do
      expect(@machine.number_of_snacks).to eq(2)
    end
  end
end
