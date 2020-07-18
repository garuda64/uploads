require "application_system_test_case"

class AppCsvConfigurationsTest < ApplicationSystemTestCase
  setup do
    @app_csv_configuration = app_csv_configurations(:one)
  end

  test "visiting the index" do
    visit app_csv_configurations_url
    assert_selector "h1", text: "App Csv Configurations"
  end

  test "creating a App csv configuration" do
    visit app_csv_configurations_url
    click_on "New App Csv Configuration"

    fill_in "Ruta", with: @app_csv_configuration.ruta
    click_on "Create App csv configuration"

    assert_text "App csv configuration was successfully created"
    click_on "Back"
  end

  test "updating a App csv configuration" do
    visit app_csv_configurations_url
    click_on "Edit", match: :first

    fill_in "Ruta", with: @app_csv_configuration.ruta
    click_on "Update App csv configuration"

    assert_text "App csv configuration was successfully updated"
    click_on "Back"
  end

  test "destroying a App csv configuration" do
    visit app_csv_configurations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "App csv configuration was successfully destroyed"
  end
end
