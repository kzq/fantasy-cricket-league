require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'POST #create' do
    # Routing
    it { should route(:post, "/users").to(action: :create, format: :json)  }
    
    context 'with valid attributes' do
      before(:each) do
        post :create, params: { user: FactoryGirl.attributes_for(:user) }, format: :json  
      end
      
      # Strong parameters
      it do
        params= { user: FactoryGirl.attributes_for(:user) }
        
        should permit(:email, :password, :password_confirmation, :firstname, :surname).for(:create, params: { user: FactoryGirl.attributes_for(:user) }).on(:user)
      end
      
      # Response
      it { should respond_with(:created) }
      
      it 'shoud get response with content type json' do
        expect(response.content_type).to eq('application/json')
      end
        
      # Behaviour
      it 'creates a new user' do
        expect {
          post :create, params: { user: FactoryGirl.attributes_for(:user, email: 'new_email@yahoo.com') }   
        }.to change(User, :count).by(1)  
      end
    end
     
    context 'with invalid attributes' do
      before(:each) do
        post :create, params: { user: FactoryGirl.attributes_for(:invalid_user) }    
      end
      
      it 'does not save new user' do
        expect {
          post :create, params: { user: FactoryGirl.attributes_for(:invalid_user) }  
        }.to_not change(User, :count) 
      end
      
      it { should respond_with(:unprocessable_entity) }
    end
  end
end
