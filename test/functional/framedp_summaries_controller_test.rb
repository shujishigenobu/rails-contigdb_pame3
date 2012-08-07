require 'test_helper'

class FramedpSummariesControllerTest < ActionController::TestCase
  setup do
    @framedp_summary = framedp_summaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:framedp_summaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create framedp_summary" do
    assert_difference('FramedpSummary.count') do
      post :create, framedp_summary: { aalen: @framedp_summary.aalen, aaseq: @framedp_summary.aaseq, contig_id: @framedp_summary.contig_id, contig_name: @framedp_summary.contig_name, end_pos: @framedp_summary.end_pos, orf_name: @framedp_summary.orf_name, pred_type: @framedp_summary.pred_type, start_pos: @framedp_summary.start_pos, strand: @framedp_summary.strand }
    end

    assert_redirected_to framedp_summary_path(assigns(:framedp_summary))
  end

  test "should show framedp_summary" do
    get :show, id: @framedp_summary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @framedp_summary
    assert_response :success
  end

  test "should update framedp_summary" do
    put :update, id: @framedp_summary, framedp_summary: { aalen: @framedp_summary.aalen, aaseq: @framedp_summary.aaseq, contig_id: @framedp_summary.contig_id, contig_name: @framedp_summary.contig_name, end_pos: @framedp_summary.end_pos, orf_name: @framedp_summary.orf_name, pred_type: @framedp_summary.pred_type, start_pos: @framedp_summary.start_pos, strand: @framedp_summary.strand }
    assert_redirected_to framedp_summary_path(assigns(:framedp_summary))
  end

  test "should destroy framedp_summary" do
    assert_difference('FramedpSummary.count', -1) do
      delete :destroy, id: @framedp_summary
    end

    assert_redirected_to framedp_summaries_path
  end
end
