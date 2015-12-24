require 'rails_helper'

RSpec.describe WikisController, type: :controller do

  let(:my_user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:my_wiki) { create(:wiki, user: my_user) }



  context 'my user doing CRUD on a wiki they own' do
    before(:each) do
      sign_in my_user
    end
    describe "GET index" do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end

      it 'assigns Wiki.all to wikis' do
        get :index
        expect(assigns(:wikis)).to eq (Wiki.all)
      end
    end

      describe "GET show" do
        it 'returns http success' do
          get :show, {id: my_wiki.id}
          expect(response).to have_http_status(:success)
        end

        it 'renders the #show view' do
          get :show, {id: my_wiki.id}
          expect(response).to render_template :show
        end

        it 'assigns my_wiki to @wiki' do
          get :show, {id: my_wiki.id}
          expect(assigns(:wiki)).to eq(my_wiki)
        end
      end

    describe "GET new" do
      it 'returns http success' do
        get :new
        expect(response).to have_http_status(:success)
      end

      it 'renders the #new view' do
        get :new
        expect(response).to render_template :new
      end

      it 'initializes @wiki' do
        get :new
        expect(assigns(:wiki)).not_to be_nil
      end
    end

    describe "POST create" do
      it 'increases the number of Wikis by 1' do
        expect { post :create, user_id: my_user.id, wiki: {title: Faker::Book.title, body: Faker::Hipster.paragraph} }.to change(Wiki, :count).by(1)
      end

      it 'assigns the new wiki to @wiki' do
        post :create, user_id: my_user.id, wiki: {title: Faker::Book.title, body: Faker::Hipster.paragraph}
        expect(assigns(:wiki)).to eq Wiki.last
      end

      it 'redirects to the new wiki on success' do
        post :create, user_id: my_user.id, wiki: {title: Faker::Book.title, body: Faker::Hipster.paragraph}
        expect(response).to redirect_to Wiki.last
      end

      it 'renders #new when error' do
        post :create, user_id: my_user.id, wiki: { title: "", body: ""}
        expect(response).to render_template(:new)
      end
    end

    describe "GET edit" do
      it 'returns http success' do
        get :edit, {id: my_wiki.id}
        expect(response).to have_http_status(:success)
      end

      it 'renders the #edit view' do
        get :edit, {id: my_wiki.id}
        expect(response).to render_template(:edit)
      end

      it 'assigns wiki to be updated to @wiki' do
        get :edit, {id: my_wiki.id}
        wiki_instance = assigns(:wiki)

        expect(wiki_instance.id).to eq my_wiki.id
        expect(wiki_instance.title).to eq my_wiki.title
        expect(wiki_instance.body).to eq my_wiki.body
      end
    end

    describe "PUT update" do
      it 'updates wiki with expected attributes' do
        new_title = Faker::Book.title
        new_body = Faker::Hipster.paragraph

        put :update, id: my_wiki.id, wiki: { title: new_title, body: new_body}

        updated_wiki = assigns(:wiki)
        expect(updated_wiki.id).to eq my_wiki.id
        expect(updated_wiki.title).to eq new_title
        expect(updated_wiki.body).to eq new_body
      end

      it 'redirects to the updated wiki' do
        new_title = Faker::Book.title
        new_body = Faker::Hipster.paragraph

        put :update, id: my_wiki.id, wiki: { title: new_title, body: new_body}
        expect(response).to redirect_to my_wiki
      end
    end

    describe "DELETE destroy" do
      it 'deletes the wiki' do
        my_wiki = create(:wiki, user: my_user)

        count = Wiki.where({id: my_wiki.id}).size
        expect(count).to eq 1

        delete :destroy, {id: my_wiki.id}

        count = Wiki.where({id: my_wiki.id}).size
        expect(count).to eq 0
      end

      it 'redirects to wiki index' do
        delete :destroy, {id: my_wiki.id}
        expect(response).to redirect_to wikis_path
      end
    end

  end # end of my user doing CRUD on wiki they own

  context 'other user doing CRUD on a wiki they do not own' do
    before(:each) do
      sign_in my_user
      my_wiki = create(:wiki, user: my_user)
      sign_out my_user
      sign_in other_user
    end

    describe "GET show" do
      # will be updated when there are public/private Wikis
    end

    describe "GET edit" do

    end

    describe "PUT update" do

    end

    describe "DELETE destroy" do

    end

  end

end
