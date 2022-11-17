require 'rails_helper'

RSpec.describe "Animals", type: :request do
  before(:each) do
    breeder_test = Breeder.create!("name": "Ragdoll Breeder",
                                   "city": "Boston",
                                   "country": "United States",
                                   "price_level": "$$$",
                                   "address": "Hello Street, Boston, MA",
                                   "email": "breeder@email.com")
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
                                  "breeder_id": 1,
                                  "image_link": "/test/image/jpg")
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
                                  "breeder_id": 1,
                                  "image_link": "/test/image/jpg")
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
                                  "breeder_id": 1,
                                  "image_link": "/test/image/jpg")
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
                  "breeder_id": 1,
                 "image_link": "/test/image/jpg"}
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
                 "breeder_id": 1,
                 "image_link": "/test/image/jpg"}
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
                                  "breeder_id": 1,
                                  "image_link": "/test/image/jpg")
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
                                  "breeder_id": 1,
                                  "image_link": "/test/image/jpg")
      allow_any_instance_of(Animal).to receive(:valid?).and_return(false)

      put("/animals/#{new_animal.id}", params: {
        animal: {animal_type: "Dog"}
      })
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /delete" do
    it "delete a created animal" do
      new_animal = Animal.create!("name": "Hello Kitty",
                                  "animal_type": "Cat",
                                  "breed": "Ragdoll",
                                  "price": 100,
                                  "anticipated_birthday": "2023-09-01",
                                  "breeder_id": 1,
                                  "image_link": "/test/image/jpg")
      delete("/animals/#{new_animal.id}")
      expect(Animal.find_by(name: "Kitty")).to be_nil
      expect(response).to redirect_to animals_url
    end
  end

  # describe "POST /animals/api/sort_location" do
  #   it "sort animald by location" do
  #     animal1 = Animal.create!("name": "Hello Kitty",
  #                                 "animal_type": "Cat",
  #                                 "breed": "Ragdoll",
  #                                 "price": 100,
  #                                 "anticipated_birthday": "2023-09-01",
  #                                 "breeder_id": 1,
  #                                 "image_link": "/test/image2.jpg")
  #
  #     animal2 = Animal.create!("name": "Hello Doggy",
  #                                "animal_type": "Dog",
  #                                "breed": "Boxer",
  #                                "price": 150,
  #                                "anticipated_birthday": "2023-09-02",
  #                                "breeder_id": 1,
  #                                "image_link": "/test/image2.jpg")
  #
  #     animal3 = Animal.create!("name": "Hello Ducky",
  #                                "animal_type": "Duck",
  #                                "breed": "Rubber",
  #                                "price": 150,
  #                                "anticipated_birthday": "2023-09-03",
  #                                "breeder_id": 2,
  #                                "image_link": "/test/image3.jpg")
  #
  #     breeder1 = Animal.get_breeder(1)
  #     breeder2 = Animal.get_breeder(3)
  #     city1 = breeder1.city
  #     city2 = breeder2.city
  #
  #     json_file = post("/animals/api/sort_location", params: {
  #       city: city1,
  #       country: "Any Country",
  #       sorting_method: "Any"
  #     })
  #
  #
  #
  #     expect animals length = 2
  #     expect animals[0] == Doggy
  #
  #   end
  # end

  # describe "GET /animals/api/sort_location" do
  #   it "returns http success" do
  #     get :sort_location
  #     expect(response).to have_http_status(:success)
  #   end
  #
  #   it "refines animals by location" do
  #     city = "Any City"
  #     country = "Any Country"
  #     sorting_method = "name"
  #     animals = Animal.location_refine city, country
  #     animals = animals.order(:name)
  #     breeders = Array.new
  #     animals.each do |each_animal|
  #       breeders.push(Animal.get_breeder(each_animal.id))
  #     end
  #     expect(animals).to eq(animals)
  #     expect(breeders).to eq(breeders)
  #   end
  # end


  # describe "POST /animals/api/sort_location" do
  #   let(:city) { "Any City" }
  #   let(:country) { "Any Country" }
  #   let(:sorting_method) { "Any" }
  #
  #   it "returns a list of animals sorted by name" do
  #     animals = Animal.location_refine(city, country)
  #     animals = animals.order(:name)
  #     breeders = Array.new
  #
  #     animals.each do |each_animal|
  #       breeders.push(Animal.get_breeder(each_animal.id))
  #     end
  #
  #     expect(subject.sort_location(city, country, sorting_method)).to eq({animals: animals, breeders: breeders})
  #   end
  # end

  # describe "POST /animals/api/sort_location" do
  #   it "returns animals sorted by location" do
  #     breeder1 = Breeder.create!("name": "Ragdoll Breeder",
  #                                    "city": "New York",
  #                                    "country": "United States",
  #                                    "price_level": "$$$",
  #                                    "address": "Hello Street, New York, MA",
  #                                    "email": "breeder1@email.com")
  #     breeder2 = Breeder.create!("name": "Pup Breeder",
  #                                    "city": "Boston",
  #                                    "country": "United States",
  #                                    "price_level": "$$",
  #                                    "address": "Hello Street, Boston, MA",
  #                                    "email": "breeder2@email.com")
  #     animal1 = Animal.create!("name": "Hello Kitty",
  #                              "animal_type": "Cat",
  #                              "breed": "Ragdoll",
  #                              "price": 100,
  #                                "anticipated_birthday": "2023-09-01",
  #                                "breeder_id": 1,
  #                                "image_link": "/test/image2.jpg")
  #
  #     animal2 = Animal.create!("name": "Hello Doggy",
  #                                "animal_type": "Dog",
  #                                "breed": "Boxer",
  #                                "price": 150,
  #                                "anticipated_birthday": "2023-09-02",
  #                                "breeder_id": 1,
  #                                "image_link": "/test/image2.jpg")
  #
  #     animal3 = Animal.create!("name": "Hello Ducky",
  #                                "animal_type": "Duck",
  #                                "breed": "Rubber",
  #                              "price": 150,
  #                                 "anticipated_birthday": "2023-09-03",
  #                                 "breeder_id": 2,
  #                                 "image_link": "/test/image3.jpg")
  #     city = "New York"
  #     country = "Any Country"
  #     # animals = Animal.location_refine city, country
  #     # animals = animals.order(:name)
  #     # breeders = Array.new
  #     # animals.each do |each_animal|
  #     #   breeders.push(Animal.get_breeder(each_animal.id))
  #     # end
  #     post("/animals/api/sort_location", params: {
  #             city: "New York",
  #             country: "Any Country",
  #             sorting_method: "name"
  #           })
  #
  #     # expect(response.body).to eq({animals: animals, breeders: breeders}.to_json)
  #     expect(JSON.parse(response.body)).to eq({animals: [animal1, animal2]})
  #   end
  # end

  describe "POST /animals/api/sort_location" do
    it "returns animals sorted by location" do
      new_animal = Animal.create!("name": "Hello Kitty",
                                  "animal_type": "Cat",
                                  "breed": "Ragdoll",
                                  "price": 100,
                                  "anticipated_birthday": "2023-09-01",
                                  "breeder_id": 1,
                                  "image_link": "/test/image/jpg")
      post("/animals/api/sort_location", params: { city: "Any City", country: "Any Country", sorting: "name" })
      expect(response).to have_http_status(:success)
      expect(response.body).to eq(@animals.to_json)
    end
  end
end
