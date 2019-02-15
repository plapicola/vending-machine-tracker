RSpec.describe 'when I visit the vending machine show page' do
  context 'as a visitor' do
    before :each do
      @owner = Owner.create(name: "Jim")
      @machine = @owner.machines.create(location: "Classroom D")
      @item_1 = @machine.snacks.create(name: "Duffy Roll", price: 2.50)
      @item_2 = @machine.snacks.create(name: "Honey Bun", price: 1.50)
    end

    it 'I see a list of all snacks associated with the vending machine and prices' do
      visit machine_path(@machine)

      expect(page).to have_content("Snacks")
      expect(page).to have_content("#{@item_1.name}: $#{@item_1.price}")
      expect(page).to have_content("#{@item_2.name}: $#{@item_2.price}")
    end

    it 'I also see an average price for all snacks within the machine' do
      visit machine_path(@machine)

      expect(page).to have_content("Average Price: $2.00")
    end
  end
end
