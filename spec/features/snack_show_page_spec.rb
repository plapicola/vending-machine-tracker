require 'rails_helper'

RSpec.describe 'When I visit the snack show page' do
  context 'as a visitor' do
    before :each do
      @owner_1 = Owner.create(name: "Jim")
      @owner_2 = Owner.create(name: "John")
      @machine_1 = @owner_1.machines.create(location: "Classroom D")
      @machine_2 = @owner_2.machines.create(location: "Random Sea Turtle")
      @snack_1 = @machine_1.snacks.create(name: "Duffy Roll", price: 2.50)
      @snack_2 = @machine_1.snacks.create(name: "Honey Bun", price: 1.50)
      @machine_2.snacks << @snack_1
    end
    it 'I see a list of information about the snack' do
      visit snack_path(@snack_1)

      expect(page).to have_content(@snack_1.name)
      expect(page).to have_content(@snack_1.price)
    end
    it 'I also see a list of vending mahcines that carry the snack with information' do
      visit snack_path(@snack_1)

      save_and_open_page

      expect(page).to have_content("Locations:")
      expect(page).to have_content("#{@machine_1.location}, Kinds of Snacks: 2, Average Price: $2.00")
      expect(page).to have_content("#{@machine_2.location}, Kinds of Snacks: 1, Average Price: $2.50")
    end
  end
end
