require "test_helper"

class ConceptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @concept = concepts(:one)
  end

  test "should get index" do
    get concepts_url
    assert_response :success
  end

  test "should get new" do
    get new_concept_url
    assert_response :success
  end

  test "should create concept" do
    assert_difference('Concept.count') do
      post concepts_url, params: { concept: {  } }
    end

    assert_redirected_to concept_url(Concept.last)
  end

  test "should show concept" do
    get concept_url(@concept)
    assert_response :success
  end

  test "should get edit" do
    get edit_concept_url(@concept)
    assert_response :success
  end

  test "should update concept" do
    patch concept_url(@concept), params: { concept: {  } }
    assert_redirected_to concept_url(@concept)
  end

  test "should destroy concept" do
    assert_difference('Concept.count', -1) do
      delete concept_url(@concept)
    end

    assert_redirected_to concepts_url
  end
end
