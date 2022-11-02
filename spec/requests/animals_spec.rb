require 'rails_helper'

RSpec.describe "Animals", type: :request do
  describe "GET /index" do
    # pending "add some examples (or delete) #{__FILE__}"
    it "should get index" do
      expect(get("/animals")).to render_template("index")
    end
  end

  describe "GET /show" do
    it "should show breeder" do
      new_animal = Animal.create!(name:"Kitty", animal_type:"Cat")
      expect(get("/animals/#{new_animal.id}")).to render_template("show")
    end
  end

  describe "GET /new" do
    it "should render new breeder template" do
      Animal.new
      expect(get("/animals/new")).to render_template("new")
    end
  end

  describe "GET /edit" do
    it "should render edit breeder template" do
      new_animal = Animal.create!(name:"Kitty", animal_type:"Cat")
      get("/animals/#{new_animal.id}/edit")
      expect(assigns(:animal)).to eql new_animal
      expect(response).to render_template("edit")
    end
  end

  describe "POST /create" do
    it "should create a new breeder" do
      new_animal = Animal.create!(name:"Kitty", animal_type:"Cat")
      expect(Animal.find_by(name: "Kitty")).not_to be_nil
    end

    it "cannot find nonexistent breeder" do
      expect(Animal.find_by(name: "Not Exist")).to be_nil
    end

    it "create and redirect" do
      post("/animals", animal: {name:"Kitty", animal_type:"Cat"})
      expect(response).to redirect_to "/animals/1"
    end

    it "redirect if cannot save" do
      allow_any_instance_of(Animal).to receive(:valid?).and_return(false)

      post("/animals", animal: {name:"Kitty", animal_type:"Cat"})
      expect(response).to render_template("new")
    end
  end

  describe "PUT /update" do
    it "update the corresponding breeder" do
      new_animal = Animal.create!(name:"Kitty", animal_type:"Cat")
      put("/animals/#{new_animal.id}", animal: {animal_type: "Dog"})
      new_animal.reload
      expect(new_animal.animal_type).to eq "Dog"
    end

    it "doesn't update and redirect if invalid id" do
      new_animal = Animal.create!(name:"Kitty", animal_type:"Cat")
      allow_any_instance_of(Animal).to receive(:valid?).and_return(false)

      expect(put("/animals/#{new_animal.id}", animal: {animal_type: "Dog"})).to render_template("edit")
    end
  end

  describe "POST /delete" do
    it "delete a created breeder" do
      new_animal = Animal.create!(name:"Kitty", animal_type:"Cat")
      delete("/animals/#{new_animal.id}")
      expect(Animal.find_by(name: "Kitty")).to be_nil
      expect(response).to redirect_to animals_path
    end
  end
end
