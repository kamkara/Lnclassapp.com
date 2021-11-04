require "application_system_test_case"

class ExercicesTest < ApplicationSystemTestCase
  setup do
    @exercice = exercices(:one)
  end

  test "visiting the index" do
    visit exercices_url
    assert_selector "h1", text: "Exercices"
  end

  test "creating a Exercice" do
    visit exercices_url
    click_on "New Exercice"

    fill_in "Classroom", with: @exercice.classroom_id
    fill_in "Name", with: @exercice.name
    check "Published" if @exercice.published
    fill_in "Slug", with: @exercice.slug
    click_on "Create Exercice"

    assert_text "Exercice was successfully created"
    click_on "Back"
  end

  test "updating a Exercice" do
    visit exercices_url
    click_on "Edit", match: :first

    fill_in "Classroom", with: @exercice.classroom_id
    fill_in "Name", with: @exercice.name
    check "Published" if @exercice.published
    fill_in "Slug", with: @exercice.slug
    click_on "Update Exercice"

    assert_text "Exercice was successfully updated"
    click_on "Back"
  end

  test "destroying a Exercice" do
    visit exercices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exercice was successfully destroyed"
  end
end
