describe ActivitiesController do
  describe "GET #generatecode" do
    it "renders the #generatecode view" do
      get :generatecode, id: Factory(:activity)
      response.should render_template :show
    end
  end
end

