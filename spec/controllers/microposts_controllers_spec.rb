require 'rails_helper'

describe MicropostsController, type: :controller do
  describe 'GET #index' do
    it "indexの確認" do
      get :index
      expect(response).to render_template :index
    end
  end
  #describe 'GET #new' do
    #it "render the :new template" do
      #get :new
      #expect(response).to render_template :new
    #end
  #end
end