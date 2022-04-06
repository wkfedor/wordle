require "application_system_test_case"

class TemporariesTest < ApplicationSystemTestCase
  setup do
    @temporary = temporaries(:one)
  end

  test "visiting the index" do
    visit temporaries_url
    assert_selector "h1", text: "Temporaries"
  end

  test "should create temporary" do
    visit temporaries_url
    click_on "New temporary"

    fill_in "A", with: @temporary.a
    fill_in "Anylike", with: @temporary.anylike
    fill_in "B", with: @temporary.b
    fill_in "C", with: @temporary.c
    fill_in "D", with: @temporary.d
    fill_in "Dontlike", with: @temporary.dontlike
    fill_in "E", with: @temporary.e
    click_on "Create Temporary"

    assert_text "Temporary was successfully created"
    click_on "Back"
  end

  test "should update Temporary" do
    visit temporary_url(@temporary)
    click_on "Edit this temporary", match: :first

    fill_in "A", with: @temporary.a
    fill_in "Anylike", with: @temporary.anylike
    fill_in "B", with: @temporary.b
    fill_in "C", with: @temporary.c
    fill_in "D", with: @temporary.d
    fill_in "Dontlike", with: @temporary.dontlike
    fill_in "E", with: @temporary.e
    click_on "Update Temporary"

    assert_text "Temporary was successfully updated"
    click_on "Back"
  end

  test "should destroy Temporary" do
    visit temporary_url(@temporary)
    click_on "Destroy this temporary", match: :first

    assert_text "Temporary was successfully destroyed"
  end
end
