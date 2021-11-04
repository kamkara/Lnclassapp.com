require "test_helper"

class ExercicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercice = exercices(:one)
  end

  test "should get index" do
    get exercices_url
    assert_response :success
  end

  test "should get new" do
    get new_exercice_url
    assert_response :success
  end

  test "should create exercice" do
    assert_difference('Exercice.count') do
      post exercices_url, params: { exercice: { classroom_id: @exercice.classroom_id, name: @exercice.name, published: @exercice.published, slug: @exercice.slug } }
    end

    assert_redirected_to exercice_url(Exercice.last)
  end

  test "should show exercice" do
    get exercice_url(@exercice)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercice_url(@exercice)
    assert_response :success
  end

  test "should update exercice" do
    patch exercice_url(@exercice), params: { exercice: { classroom_id: @exercice.classroom_id, name: @exercice.name, published: @exercice.published, slug: @exercice.slug } }
    assert_redirected_to exercice_url(@exercice)
  end

  test "should destroy exercice" do
    assert_difference('Exercice.count', -1) do
      delete exercice_url(@exercice)
    end

    assert_redirected_to exercices_url
  end
end
