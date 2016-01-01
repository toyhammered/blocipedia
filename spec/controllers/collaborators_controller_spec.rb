require 'rails_helper'

RSpec.describe CollaboratorsController, type: :controller do

  let(:my_user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:my_premium_user) { create(:user, role: :premium) }
  let(:other_premium_user) { create(:user, role: :premium) }
  let(:my_admin_user) { create(:user, role: :admin) }
  let(:my_public_wiki) { create(:wiki, user: my_user) }
  let(:premium_private_wiki) { create(:wiki, user: my_premium_user, private: true) }


  context 'my user adding or deleting collaborator to public wiki they own' do
    before(:each) do
      sign_in my_user

    end

    describe "POST create" do
      it 'increases the number of Collaborators by 1' do
        my_public_wiki = create(:wiki, user: my_user)
        expect { post :create, wiki_id: my_public_wiki.id, user_id: my_user.id, collaborator: {user_id: other_user.id, wiki_id: my_public_wiki.id } }.to change(Collaborator, :count).by(1)
      end
    end

    describe "DELETE destroy" do

    end
  end # end of my user adding collaborator to public wiki they own

  context 'other user adding or deleting collaborator to public wiki they do not own' do

  end

  context 'premium user adding or deleting collaborator to private wiki they own' do

  end

  context 'other premium user adding or deleting collaborator to private wiki they do not own' do

  end

  context 'admin user adding or deleting collaborator to any wiki' do

  end

end
