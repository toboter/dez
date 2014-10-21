require 'test_helper'

class ArtefactsControllerTest < ActionController::TestCase
  setup do
    @artefact = artefacts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:artefacts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create artefact" do
    assert_difference('Artefact.count') do
      post :create, artefact: { condition_comment: @artefact.condition_comment, creator_id: @artefact.creator_id, dimensions: @artefact.dimensions, dimensions_type: @artefact.dimensions_type, updater_id: @artefact.updater_id, weight: @artefact.weight }
    end

    assert_redirected_to artefact_path(assigns(:artefact))
  end

  test "should show artefact" do
    get :show, id: @artefact
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @artefact
    assert_response :success
  end

  test "should update artefact" do
    patch :update, id: @artefact, artefact: { condition_comment: @artefact.condition_comment, creator_id: @artefact.creator_id, dimensions: @artefact.dimensions, dimensions_type: @artefact.dimensions_type, updater_id: @artefact.updater_id, weight: @artefact.weight }
    assert_redirected_to artefact_path(assigns(:artefact))
  end

  test "should destroy artefact" do
    assert_difference('Artefact.count', -1) do
      delete :destroy, id: @artefact
    end

    assert_redirected_to artefacts_path
  end
end
