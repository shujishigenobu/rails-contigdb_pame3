require 'test_helper'

class FramedpModelsControllerTest < ActionController::TestCase
  setup do
    @framedp_model = framedp_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:framedp_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create framedp_model" do
    assert_difference('FramedpModel.count') do
      post :create, framedp_model: { gff: @framedp_model.gff, name: @framedp_model.name, nuc: @framedp_model.nuc, pep: @framedp_model.pep }
    end

    assert_redirected_to framedp_model_path(assigns(:framedp_model))
  end

  test "should show framedp_model" do
    get :show, id: @framedp_model
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @framedp_model
    assert_response :success
  end

  test "should update framedp_model" do
    put :update, id: @framedp_model, framedp_model: { gff: @framedp_model.gff, name: @framedp_model.name, nuc: @framedp_model.nuc, pep: @framedp_model.pep }
    assert_redirected_to framedp_model_path(assigns(:framedp_model))
  end

  test "should destroy framedp_model" do
    assert_difference('FramedpModel.count', -1) do
      delete :destroy, id: @framedp_model
    end

    assert_redirected_to framedp_models_path
  end
end
