require 'rails_helper'

RSpec.describe "Animals", type: :request do
  before(:each) do
    breeder_test = Breeder.create!("name": "Ragdoll Breeder",
                                   "city": "Boston",
                                   "country": "United States",
                                   "price_level": "$$$",
                                   "address": "Hello Street, Boston, MA")
  end

  describe "GET /index" do
    # pending "add some examples (or delete) #{__FILE__}"
    it "should get index" do
      get("/animals")
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it "should show animal" do
      new_animal = Animal.create!("name": "Hello Kitty",
                                  "animal_type": "Cat",
                                  "breed": "Ragdoll",
                                  "price": 100,
                                  "anticipated_birthday": "2023-09-01",
                                  "breeder_id": 1)
      get("/animals/#{new_animal.id}")
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /new" do
    it "should render new animal template" do
      Animal.new
      get("/animals/new")
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /edit" do
    it "should render edit animal template" do
      new_animal = Animal.create!("name": "Hello Kitty",
                                  "animal_type": "Cat",
                                  "breed": "Ragdoll",
                                  "price": 100,
                                  "anticipated_birthday": "2023-09-01",
                                  "breeder_id": 1)
      get("/animals/#{new_animal.id}/edit")
      expect(response).to have_http_status(200)

      visit "/animals/#{new_animal.id}/edit"
      expect(page).to have_content("Edit Animal")
    end
  end

  describe "POST /create" do
    it "should create a new animal" do
      new_animal = Animal.create!("name": "Hello Kitty",
                                  "animal_type": "Cat",
                                  "breed": "Ragdoll",
                                  "price": 100,
                                  "anticipated_birthday": "2023-09-01",
                                  "breeder_id": 1)
      expect(Animal.find_by(name: "Hello Kitty")).not_to be_nil
    end

    it "cannot find nonexistent animal" do
      expect(Animal.find_by(name: "Not Exist")).to be_nil
    end

    it "create and redirect" do
      post("/animals", params: {
        animal: {"name": "Hello Kitty",
                  "animal_type": "Cat",
                  "breed": "Ragdoll",
                  "price": 100,
                  "anticipated_birthday": "2023-09-01",
                  "breeder_id": 1}
      })
      expect(response).to redirect_to "/animals/1"
    end

    it "redirect if cannot save" do
      allow_any_instance_of(Animal).to receive(:valid?).and_return(false)

      post("/animals", params: {
        animal: {"name": "Hello Kitty",
                 "animal_type": "Cat",
                 "breed": "Ragdoll",
                 "price": 100,
                 "anticipated_birthday": "2023-09-01",
                 "breeder_id": 1}
      })
      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /update" do
    it "update the corresponding animal" do
      new_animal = Animal.create!("name": "Hello Kitty",
                                  "animal_type": "Cat",
                                  "breed": "Ragdoll",
                                  "price": 100,
                                  "anticipated_birthday": "2023-09-01",
                                  "breeder_id": 1)
      put("/animals/#{new_animal.id}", params: {
        animal: {animal_type: "Dog"}
      })
      new_animal.reload
      expect(new_animal.animal_type).to eq "Dog"
    end

    it "doesn't update and redirect if invalid id" do
      new_animal = Animal.create!("name": "Hello Kitty",
                                  "animal_type": "Cat",
                                  "breed": "Ragdoll",
                                  "price": 100,
                                  "anticipated_birthday": "2023-09-01",
                                  "breeder_id": 1)
      allow_any_instance_of(Animal).to receive(:valid?).and_return(false)

      put("/animals/#{new_animal.id}", params: {
        animal: {animal_type: "Dog"}
      })
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /delete" do
    it "delete a created breeder" do
      new_animal = Animal.create!("name": "Hello Kitty",
                                  "animal_type": "Cat",
                                  "breed": "Ragdoll",
                                  "price": 100,
                                  "anticipated_birthday": "2023-09-01",
                                  "breeder_id": 1)
      delete("/animals/#{new_animal.id}")
      expect(Animal.find_by(name: "Kitty")).to be_nil
      expect(response).to redirect_to animals_url
    end
  end
end
