require 'test_helper'

class ExcavationsControllerTest < ActionController::TestCase
  setup do
    @excavation = excavations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:excavations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create excavation" do
    assert_difference('Excavation.count') do
      post :create, excavation: { dai_gazetter_id: @excavation.dai_gazetter_id, name: @excavation.name, shortcut: @excavation.shortcut }
    end

    assert_redirected_to excavation_path(assigns(:excavation))
  end

  test "should show excavation" do
    get :show, id: @excavation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @excavation
    assert_response :success
  end

  test "should update excavation" do
    patch :update, id: @excavation, excavation: { dai_gazetter_id: @excavation.dai_gazetter_id, name: @excavation.name, shortcut: @excavation.shortcut }
    assert_redirected_to excavation_path(assigns(:excavation))
  end

  test "should destroy excavation" do
    assert_difference('Excavation.count', -1) do
      delete :destroy, id: @excavation
    end

    assert_redirected_to excavations_path
  end
end
