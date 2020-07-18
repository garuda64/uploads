require 'test_helper'

class AppCsvConfigurationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_csv_configuration = app_csv_configurations(:one)
  end

  test "should get index" do
    get app_csv_configurations_url
    assert_response :success
  end

  test "should get new" do
    get new_app_csv_configuration_url
    assert_response :success
  end

  test "should create app_csv_configuration" do
    assert_difference('AppCsvConfiguration.count') do
      post app_csv_configurations_url, params: { app_csv_configuration: { ruta: @app_csv_configuration.ruta } }
    end

    assert_redirected_to app_csv_configuration_url(AppCsvConfiguration.last)
  end

  test "should show app_csv_configuration" do
    get app_csv_configuration_url(@app_csv_configuration)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_csv_configuration_url(@app_csv_configuration)
    assert_response :success
  end

  test "should update app_csv_configuration" do
    patch app_csv_configuration_url(@app_csv_configuration), params: { app_csv_configuration: { ruta: @app_csv_configuration.ruta } }
    assert_redirected_to app_csv_configuration_url(@app_csv_configuration)
  end

  test "should destroy app_csv_configuration" do
    assert_difference('AppCsvConfiguration.count', -1) do
      delete app_csv_configuration_url(@app_csv_configuration)
    end

    assert_redirected_to app_csv_configurations_url
  end
end
