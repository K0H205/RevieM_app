require 'rails_helper'

describe SessionsController, type: :controller do
    describe 'render check' do
        it "render the :new template" do
           get :new
          expect(response).to render_template :new
        end
    end
end