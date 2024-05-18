require "application_system_test_case"

class GlossariesTest < ApplicationSystemTestCase
  setup do
    @glossary = glossaries(:one)
  end

  test "visiting the index" do
    visit glossaries_url
    assert_selector "h1", text: "Glossaries"
  end

  test "creating a Glossary" do
    visit glossaries_url
    click_on "New Glossary"

    click_on "Create Glossary"

    assert_text "Glossary was successfully created"
    click_on "Back"
  end

  test "updating a Glossary" do
    visit glossaries_url
    click_on "Edit", match: :first

    click_on "Update Glossary"

    assert_text "Glossary was successfully updated"
    click_on "Back"
  end

  test "destroying a Glossary" do
    visit glossaries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Glossary was successfully destroyed"
  end
end
