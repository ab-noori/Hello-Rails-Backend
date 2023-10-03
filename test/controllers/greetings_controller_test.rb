require 'test_helper'

class GreetingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @greeting = greetings(:one)
  end

  test 'should get index' do
    get greetings_url, as: :json
    assert_response :success
  end

  test 'should create greeting' do
    assert_difference('Greeting.count') do
      post greetings_url, params: { greeting: { message: @greeting.message } }, as: :json
    end

    assert_response :created
  end

  test 'should show greeting' do
    get greeting_url(@greeting), as: :json
    assert_response :success
  end

  test 'should update greeting' do
    patch greeting_url(@greeting), params: { greeting: { message: @greeting.message } }, as: :json
    assert_response :success
  end

  test 'should destroy greeting' do
    assert_difference('Greeting.count', -1) do
      delete greeting_url(@greeting), as: :json
    end

    assert_response :no_content
  end
end
