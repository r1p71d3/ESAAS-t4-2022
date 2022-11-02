require 'rails_helper'

RSpec.describe "Breeders", type: :request do
  describe "GET /index" do
    # pending "add some examples (or delete) #{__FILE__}"
    it "should get index" do
      expect(get("/breeders")).to render_template("index")
    end
  end

  describe "GET /show" do
    it "should show breeder" do
      new_breeder = Breeder.create!(name:"Test Breeder", country:"United States")
      expect(get("/breeders/#{new_breeder.id}")).to render_template("show")
    end
  end

  describe "GET /new" do
    it "should render new breeder template" do
      Breeder.new
      expect(get("/breeders/new")).to render_template("new")
    end
  end

  describe "GET /edit" do
    it "should render edit breeder template" do
      new_breeder = Breeder.create!(name:"Test Breeder", country:"United States")
      get("/breeders/#{new_breeder.id}/edit")
      expect(assigns(:breeder)).to eql new_breeder
      expect(response).to render_template("edit")
    end
  end

  describe "POST /create" do
    it "should create a new breeder" do
      new_breeder = Breeder.create!(name:"Test Breeder", country:"United States")
      expect(Breeder.find_by(name: "Test Breeder")).not_to be_nil
    end

    it "cannot find nonexistent breeder" do
      expect(Breeder.find_by(name: "Not Exist")).to be_nil
    end

    it "create and redirect" do
      post("/breeders", breeder: {name:"Test Breeder", country:"United States"})
      expect(response).to redirect_to "/breeders/1"
    end

    it "redirect if cannot save" do
      allow_any_instance_of(Breeder).to receive(:valid?).and_return(false)

      post("/breeders", breeder: {name:"Test Breeder", country:"United States"})
      expect(response).to render_template("new")
    end
  end

  describe "PUT /update" do
    it "update the corresponding breeder" do
      new_breeder = Breeder.create!(name:"Test Breeder", country:"United States")
      put("/breeders/#{new_breeder.id}", breeder: {country: "England"})
      new_breeder.reload
      expect(new_breeder.country).to eq "England"
    end

    it "doesn't update and redirect if invalid id" do
      new_breeder = Breeder.create!(name:"Test Breeder", country:"United States")
      allow_any_instance_of(Breeder).to receive(:valid?).and_return(false)

      expect(put("/breeders/#{new_breeder.id}", breeder: {country: "England"})).to render_template("edit")
    end
  end

  describe "POST /delete" do
    it "delete a created breeder" do
      new_breeder = Breeder.create!(name:"Test Breeder", country:"United States")
      delete("/breeders/#{new_breeder.id}")
      expect(Breeder.find_by(name: "Test Breeder")).to be_nil
      expect(response).to redirect_to breeders_path
    end
  end
end
