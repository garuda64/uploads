require "application_system_test_case"

class AppConfigurationsTest < ApplicationSystemTestCase
  setup do
    @app_configuration = app_configurations(:one)
  end

  test "visiting the index" do
    visit app_configurations_url
    assert_selector "h1", text: "App Configurations"
  end

  test "creating a App configuration" do
    visit app_configurations_url
    click_on "New App Configuration"

    fill_in "Sorteo banner url", with: @app_configuration.sorteo_banner_url
    fill_in "Sorteo timeout", with: @app_configuration.sorteo_timeout
    fill_in "Sorteo type", with: @app_configuration.sorteo_type
    click_on "Create App configuration"

    assert_text "App configuration was successfully created"
    click_on "Back"
  end

  test "updating a App configuration" do
    visit app_configurations_url
    click_on "Edit", match: :first

    fill_in "Sorteo banner url", with: @app_configuration.sorteo_banner_url
    fill_in "Sorteo timeout", with: @app_configuration.sorteo_timeout
    fill_in "Sorteo type", with: @app_configuration.sorteo_type
    click_on "Update App configuration"

    assert_text "App configuration was successfully updated"
    click_on "Back"
  end

  test "destroying a App configuration" do
    visit app_configurations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "App configuration was successfully destroyed"
  end
end
