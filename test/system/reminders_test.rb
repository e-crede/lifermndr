require "application_system_test_case"

class RemindersTest < ApplicationSystemTestCase
  setup do
    @reminder = reminders(:one)
  end

  test "visiting the index" do
    visit reminders_url
    assert_selector "h1", text: "Reminders"
  end

  test "should create reminder" do
    visit reminders_url
    click_on "New reminder"

    check "Active" if @reminder.active
    fill_in "Date", with: @reminder.date
    fill_in "Hour", with: @reminder.hour
    fill_in "Name", with: @reminder.name
    fill_in "Period", with: @reminder.period
    fill_in "Recurrence", with: @reminder.recurrence
    click_on "Create Reminder"

    assert_text "Reminder was successfully created"
    click_on "Back"
  end

  test "should update Reminder" do
    visit reminder_url(@reminder)
    click_on "Edit this reminder", match: :first

    check "Active" if @reminder.active
    fill_in "Date", with: @reminder.date
    fill_in "Hour", with: @reminder.hour
    fill_in "Name", with: @reminder.name
    fill_in "Period", with: @reminder.period
    fill_in "Recurrence", with: @reminder.recurrence
    click_on "Update Reminder"

    assert_text "Reminder was successfully updated"
    click_on "Back"
  end

  test "should destroy Reminder" do
    visit reminder_url(@reminder)
    click_on "Destroy this reminder", match: :first

    assert_text "Reminder was successfully destroyed"
  end
end
