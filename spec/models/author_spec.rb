require "rails_helper"

RSpec.describe Author, :type => :model do
  it "requires a first name" do
    author = Fabricate.build(:author, first_name: nil)

    expect(author).not_to be_valid
    expect(author.errors[:first_name].any?).to be_truthy #should expect author's first name to have error
  end

  it "requires a last name" do
    author = Fabricate.build(:author, last_name: nil)

    expect(author).not_to be_valid
    expect(author.errors[:last_name].any?).to be_truthy
  end

  describe "#full_name" do
    it "returns the full name of the author" do
      author = Fabricate(:author, first_name: "Kanye", last_name: "West")

      expect(author.full_name).to eq("Kanye West")
    end
  end
end
