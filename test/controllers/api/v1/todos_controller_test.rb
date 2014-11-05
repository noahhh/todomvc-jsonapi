require 'test_helper'

class Api::V1::TodosControllerTest < ActionController::TestCase
  setup do
    @todo = todos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should create todo" do
    assert_difference('Todo.count') do
      post :create, todo: { title: "Wring the cat", order: 1, completed: false }
      assert_response 201
    end
  end

  test "should update todo" do
    put :update, id: @todo, todo: { title: "Wring the cat", order: 1, completed: true }
    assert_response 204
  end

  test "should destroy todo" do
    assert_difference('Todo.count', -1) do
      delete :destroy, id: @todo
      assert_response 200
    end
  end
end
