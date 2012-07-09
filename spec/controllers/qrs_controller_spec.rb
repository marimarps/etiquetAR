require 'spec_helper'

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

describe QrsController do

  # This should return the minimal set of attributes required to create a valid
  # Qr. As you add validations to Qr, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # QrsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all qrs as @qrs" do
      qr = Qr.create! valid_attributes
      get :index, {}, valid_session
      assigns(:qrs).should eq([qr])
    end
  end

  describe "GET show" do
    it "assigns the requested qr as @qr" do
      qr = Qr.create! valid_attributes
      get :show, {:id => qr.to_param}, valid_session
      assigns(:qr).should eq(qr)
    end
  end

  describe "GET new" do
    it "assigns a new qr as @qr" do
      get :new, {}, valid_session
      assigns(:qr).should be_a_new(Qr)
    end
  end

  describe "GET edit" do
    it "assigns the requested qr as @qr" do
      qr = Qr.create! valid_attributes
      get :edit, {:id => qr.to_param}, valid_session
      assigns(:qr).should eq(qr)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Qr" do
        expect {
          post :create, {:qr => valid_attributes}, valid_session
        }.to change(Qr, :count).by(1)
      end

      it "assigns a newly created qr as @qr" do
        post :create, {:qr => valid_attributes}, valid_session
        assigns(:qr).should be_a(Qr)
        assigns(:qr).should be_persisted
      end

      it "redirects to the created qr" do
        post :create, {:qr => valid_attributes}, valid_session
        response.should redirect_to(Qr.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved qr as @qr" do
        # Trigger the behavior that occurs when invalid params are submitted
        Qr.any_instance.stub(:save).and_return(false)
        post :create, {:qr => {}}, valid_session
        assigns(:qr).should be_a_new(Qr)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Qr.any_instance.stub(:save).and_return(false)
        post :create, {:qr => {}}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested qr" do
        qr = Qr.create! valid_attributes
        # Assuming there are no other qrs in the database, this
        # specifies that the Qr created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Qr.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => qr.to_param, :qr => {'these' => 'params'}}, valid_session
      end

      it "assigns the requested qr as @qr" do
        qr = Qr.create! valid_attributes
        put :update, {:id => qr.to_param, :qr => valid_attributes}, valid_session
        assigns(:qr).should eq(qr)
      end

      it "redirects to the qr" do
        qr = Qr.create! valid_attributes
        put :update, {:id => qr.to_param, :qr => valid_attributes}, valid_session
        response.should redirect_to(qr)
      end
    end

    describe "with invalid params" do
      it "assigns the qr as @qr" do
        qr = Qr.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Qr.any_instance.stub(:save).and_return(false)
        put :update, {:id => qr.to_param, :qr => {}}, valid_session
        assigns(:qr).should eq(qr)
      end

      it "re-renders the 'edit' template" do
        qr = Qr.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Qr.any_instance.stub(:save).and_return(false)
        put :update, {:id => qr.to_param, :qr => {}}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested qr" do
      qr = Qr.create! valid_attributes
      expect {
        delete :destroy, {:id => qr.to_param}, valid_session
      }.to change(Qr, :count).by(-1)
    end

    it "redirects to the qrs list" do
      qr = Qr.create! valid_attributes
      delete :destroy, {:id => qr.to_param}, valid_session
      response.should redirect_to(qrs_url)
    end
  end

end
