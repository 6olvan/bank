require 'rails_helper'

RSpec.describe AuthController, type: :controller do
		describe 'GET login page' do
			it 'get success response' do
				get :login
				assert_response 200
			end
		end

		describe 'POST login page' do
			it 'should redirect to main page' do
				user = login_user
				expect(response).to redirect_to(accounts_path)
				expect(session[:logged_user_id]).to eq (user.id)
			end
		end

		describe 'POST logout page' do
			it 'should redirect to main page' do
				user = login_user
				
				expect(session[:logged_user_id]).to eq (user.id)
				post :logout
				expect(response).to redirect_to(login_path)
				expect(session[:logged_user_id]).to eq (nil)
			end
		end

		def login_user
			user = User.create({name: 'Arti', password: 'tt'})

			post :login , {params: {name: 'Arti', password: 'tt'}}
			user
		end
end
