require "rails_helper"

RSpec.describe "Exercises", type: :request do
  describe "GET /exercises/:id/edit" do
    it "redirects unauthenticated users" do
      exercise = create(:exercise)

      get edit_exercise_path(exercise)

      expect(response).to redirect_to(new_user_session_path)
    end

    # FIXME, fails: error on sign_in method
    it "allows authenticated users to edit" do
        user = create(:user)
        exercise = create(:exercise, author: user)

        sign_in user

        get edit_exercise_path(exercise)

        expect(response).to have_http_status(:ok)
    end
  end
end