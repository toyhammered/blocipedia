require 'rails_helper'

RSpec.describe WikiPolicy do
  let(:my_user) { create(:user) }
  let(:scope) { WikiPolicy::Scope.new(my_user, Wiki) }
  let(:public_wiki) { create(:wiki, user: my_user) }
  let(:private_wiki) { create(:wiki, user: my_user, private: true) }


  before(:each) do
    public_wiki
    private_wiki
  end

  describe "#my_public_wiki" do
    it 'returns all public wikis' do
      expect(scope.my_public_wiki).to eq([public_wiki])
    end
  end

  describe "#my_private_wiki" do
    it 'returns all private wikis' do
      expect(scope.my_private_wiki).to eq([private_wiki])
    end
  end

  # not sure how to test my_editor_wiki

end # end of Wiki Policy
