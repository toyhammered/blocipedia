require 'rails_helper'

RSpec.describe Wiki, type: :model do

  let(:wiki) { create(:wiki) }
  let(:user) { create(:user) }

  it { should belong_to(:user) }
  it { should have_many(:users) }
  it { should have_many(:collaborators) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }

  describe "attributes" do
    it 'should respond to title' do
      expect(wiki).to respond_to(:title)
    end

    it 'should respond to body' do
      expect(wiki).to respond_to(:body)
    end

    it 'should respond to private' do
      expect(wiki).to respond_to(:private)
    end
  end

end
