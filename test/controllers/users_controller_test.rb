require "test_helper"

describe UsersController do
  describe "index" do
    it "can render" do
      get users_path

      must_respond_with :ok
    end

    it "renders even if there are zero users" do
      User.destroy_all

      get users_path

      must_respond_with :ok
    end
  end

  # describe "show" do
  #   it "returns a 404 status code if the user doesn't exist" do
  #     user_id = "FAKE ID"

  #     get user_path(user_id)

  #     must_respond_with :not_found
  #   end

  #   it "works for a User instance that exists" do
  #     user = users(:one)
      
  #     get user_path(user)

  #     must_respond_with :ok
  #   end
  # end

  # describe "new" do
  #   it "retruns status code 200" do
  #     get new_user_path
  #     must_respond_with :ok
  #   end
  # end

  # describe "create" do
  #   it "creates a new user" do
  #     user_data = {
  #       user: {
  #         username: "newuser"
  #       },
  #     }

  #     expect {
  #       post users_path, params: user_data
  #     }.must_change "User.count", +1

  #     user = User.last

  #     must_respond_with :redirect
  #     must_redirect_to user_path(user.id)

  #     check_flash

  #     expect(user.username).must_equal work_data[:user][:username]
  #   end

  #   it "sends back bad_request if no user data is sent" do
  #     user_data = {
  #       user: {
  #         username: ""
  #       },
  #     }
  #     expect(User.new(user_data[:user])).wont_be :valid?

  #     expect {
  #       post users_path, params: user_data
  #     }.wont_change "User.count"

  #     must_respond_with :bad_request

  #     check_flash(:error)
  #   end
  # end

  # describe "edit" do
  #   it "responds with OK for an existing user" do
  #     get edit_user_path(users(:one))
  #     must_respond_with :ok
  #   end

  #   it "responds with NOT FOUND for a fake user" do
  #     user_id = User.last.id + 1
  #     get edit_user_path(user_id)
  #     must_respond_with :not_found
  #   end
  # end

  # describe "update" do
  #   let(:user_data) {
  #     {
  #       user: {
  #         username: "changed",
  #       },
  #     }
  #   }
  #   it "changes the data on the model" do
  #     user = users(:one)

  #     user.assign_attributes(user_data[:user])
  #     expect(user).must_be :valid?
  #     user.reload

  #     patch user_path(user), params: user_data

  #     must_respond_with :redirect
  #     must_redirect_to user_path(user)

  #     user.reload
  #     expect(user.username).must_equal(user_data[:user][:username])
  #   end

  #   it "responds with NOT FOUND for a fake user" do
  #     user_id = User.last.id + 1
  #     patch user_path(user_id), params: user_data
  #     must_respond_with :not_found
  #   end

  #   it "responds with BAD REQUEST for bad data" do
  #     user_data[:user][:username] = ""
  #     user = users(:one)
      
  #     user.assign_attributes(user_data[:user])
  #     expect(user).wont_be :valid?
  #     user.reload

  #     patch user_path(user), params: user_data

  #     must_respond_with :bad_request
  #   end
  # end

  # describe "destroy" do
  #   let(:user) { :one }
  #   it "removes the user from the database" do
  #     expect {
  #       delete user_path(user)
  #     }.must_change "User.count", -1

  #     must_respond_with :redirect
  #     must_redirect_to users_path

  #     after_user = User.find_by(id: user.id)
  #     expect(after_user).must_be_nil
  #   end

  #   it "returns a 404 if the user does not exist" do
  #     user_id = "FAKE ID"

  #     expect(User.find_by(id: user_id)).must_be_nil

  #     expect {
  #       delete user_path(user_id)
  #     }.wont_change "User.count"

  #     must_respond_with :not_found
  #   end
  # end
end
