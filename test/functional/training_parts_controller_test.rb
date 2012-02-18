require 'test_helper'

class TrainingPartsControllerTest < ActionController::TestCase
  setup do
    @training_part = training_parts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:training_parts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create training_part" do
    assert_difference('TrainingPart.count') do
      post :create, training_part: @training_part.attributes
    end

    assert_redirected_to training_part_path(assigns(:training_part))
  end

  test "should show training_part" do
    get :show, id: @training_part
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @training_part
    assert_response :success
  end

  test "should update training_part" do
    put :update, id: @training_part, training_part: @training_part.attributes
    assert_redirected_to training_part_path(assigns(:training_part))
  end

  test "should destroy training_part" do
    assert_difference('TrainingPart.count', -1) do
      delete :destroy, id: @training_part
    end

    assert_redirected_to training_parts_path
  end
end
