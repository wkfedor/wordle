require "application_system_test_case"

class WordsTest < ApplicationSystemTestCase
  setup do
    @word = words(:one)
  end

  test "visiting the index" do
    visit words_url
    assert_selector "h1", text: "Words"
  end

  test "should create word" do
    visit words_url
    click_on "New word"

    fill_in "A", with: @word.a
    fill_in "Anynum", with: @word.anynum
    fill_in "B", with: @word.b
    fill_in "C", with: @word.c
    fill_in "Codeword", with: @word.codeword
    fill_in "D", with: @word.d
    fill_in "E", with: @word.e
    fill_in "Word", with: @word.word
    click_on "Create Word"

    assert_text "Word was successfully created"
    click_on "Back"
  end

  test "should update Word" do
    visit word_url(@word)
    click_on "Edit this word", match: :first

    fill_in "A", with: @word.a
    fill_in "Anynum", with: @word.anynum
    fill_in "B", with: @word.b
    fill_in "C", with: @word.c
    fill_in "Codeword", with: @word.codeword
    fill_in "D", with: @word.d
    fill_in "E", with: @word.e
    fill_in "Word", with: @word.word
    click_on "Update Word"

    assert_text "Word was successfully updated"
    click_on "Back"
  end

  test "should destroy Word" do
    visit word_url(@word)
    click_on "Destroy this word", match: :first

    assert_text "Word was successfully destroyed"
  end
end
