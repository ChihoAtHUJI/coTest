require 'rails_helper'

RSpec.describe Content, type: :model do
  it "is valid with a title and body" do
  content = Content.new(title: "Test", body: "test")
  expect(content).to be_valid
  end

  it "is invalid without a title" do
    content = Content.new(body: "test")
    expect(content).to_not be_valid
  end

  it "is invalid without a body" do
    content = Content.new(title: "test")
    expect(content).to_not be_valid
  end
end
