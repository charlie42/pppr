require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe SpecialistsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Specialist. As you add validations to Specialist, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SpecialistsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all specialists as @specialists" do
      specialist = Specialist.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:specialists)).to eq([specialist])
    end
  end

  describe "GET #show" do
    it "assigns the requested specialist as @specialist" do
      specialist = Specialist.create! valid_attributes
      get :show, {:id => specialist.to_param}, valid_session
      expect(assigns(:specialist)).to eq(specialist)
    end
  end

  describe "GET #new" do
    it "assigns a new specialist as @specialist" do
      get :new, {}, valid_session
      expect(assigns(:specialist)).to be_a_new(Specialist)
    end
  end

  describe "GET #edit" do
    it "assigns the requested specialist as @specialist" do
      specialist = Specialist.create! valid_attributes
      get :edit, {:id => specialist.to_param}, valid_session
      expect(assigns(:specialist)).to eq(specialist)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Specialist" do
        expect {
          post :create, {:specialist => valid_attributes}, valid_session
        }.to change(Specialist, :count).by(1)
      end

      it "assigns a newly created specialist as @specialist" do
        post :create, {:specialist => valid_attributes}, valid_session
        expect(assigns(:specialist)).to be_a(Specialist)
        expect(assigns(:specialist)).to be_persisted
      end

      it "redirects to the created specialist" do
        post :create, {:specialist => valid_attributes}, valid_session
        expect(response).to redirect_to(Specialist.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved specialist as @specialist" do
        post :create, {:specialist => invalid_attributes}, valid_session
        expect(assigns(:specialist)).to be_a_new(Specialist)
      end

      it "re-renders the 'new' template" do
        post :create, {:specialist => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested specialist" do
        specialist = Specialist.create! valid_attributes
        put :update, {:id => specialist.to_param, :specialist => new_attributes}, valid_session
        specialist.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested specialist as @specialist" do
        specialist = Specialist.create! valid_attributes
        put :update, {:id => specialist.to_param, :specialist => valid_attributes}, valid_session
        expect(assigns(:specialist)).to eq(specialist)
      end

      it "redirects to the specialist" do
        specialist = Specialist.create! valid_attributes
        put :update, {:id => specialist.to_param, :specialist => valid_attributes}, valid_session
        expect(response).to redirect_to(specialist)
      end
    end

    context "with invalid params" do
      it "assigns the specialist as @specialist" do
        specialist = Specialist.create! valid_attributes
        put :update, {:id => specialist.to_param, :specialist => invalid_attributes}, valid_session
        expect(assigns(:specialist)).to eq(specialist)
      end

      it "re-renders the 'edit' template" do
        specialist = Specialist.create! valid_attributes
        put :update, {:id => specialist.to_param, :specialist => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested specialist" do
      specialist = Specialist.create! valid_attributes
      expect {
        delete :destroy, {:id => specialist.to_param}, valid_session
      }.to change(Specialist, :count).by(-1)
    end

    it "redirects to the specialists list" do
      specialist = Specialist.create! valid_attributes
      delete :destroy, {:id => specialist.to_param}, valid_session
      expect(response).to redirect_to(specialists_url)
    end
  end

end