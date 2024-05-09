require 'rails_helper'

describe Note, type: :model do
  describe "validations" do
    it "validates presence of title" do
      note = Note.new(content: "text", public: false)
      expect(note).not_to be_valid
      expect(note.errors[:title]).to include("can't be blank")
    end
    it "validates presence of content" do
      note = Note.new(title: "Title", public: false)
      expect(note).not_to be_valid
      expect(note.errors[:content]).to include("can't be blank")
    end
    it "validates inclusion of public" do
      note = Note.new(title: "Title", content: "text", public: true)
      expect(note).to be_valid
      note.public = false
      expect(note).to be_valid
      note.public = nil
      expect(note).not_to be_valid
      expect(note.errors[:public]).to include("is not included in the list")
    end
  end
  describe "associations" do
    it "should have many user_notes" do
      association = described_class.reflect_on_association(:user_notes)
      expect(association.macro).to eq(:has_many)
    end
    it "should have many users through user_notes" do
      association = described_class.reflect_on_association(:users)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:through]).to eq(:user_notes)
    end
    it "should accept nested attributes for user_notes" do
      expect(Note.new).to respond_to(:user_notes_attributes=)
    end
  end
end
