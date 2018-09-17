require "application_system_test_case"

class BalancesTest < ApplicationSystemTestCase
  setup do
    @balance = balances(:one)
  end

  test "visiting the index" do
    visit balances_url
    assert_selector "h1", text: "Balances"
  end

  test "creating a Balance" do
    visit balances_url
    click_on "New Balance"

    fill_in "Balance", with: @balance.balance
    fill_in "Is Positive", with: @balance.is_positive
    fill_in "Primary User", with: @balance.primary_user
    fill_in "Sub User", with: @balance.sub_user
    click_on "Create Balance"

    assert_text "Balance was successfully created"
    click_on "Back"
  end

  test "updating a Balance" do
    visit balances_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @balance.balance
    fill_in "Is Positive", with: @balance.is_positive
    fill_in "Primary User", with: @balance.primary_user
    fill_in "Sub User", with: @balance.sub_user
    click_on "Update Balance"

    assert_text "Balance was successfully updated"
    click_on "Back"
  end

  test "destroying a Balance" do
    visit balances_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Balance was successfully destroyed"
  end
end
