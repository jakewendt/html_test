require 'test_helper'

class Html::Test::ControllerTest < ActionController::TestCase

	include ::Html::Test::Assertions	#	20140721 - apparently needed now?

	def setup
		@controller = TestController.new
#		@request		= ActionController::TestRequest.new
#		@response	 = ActionController::TestResponse.new
		
		ActionController::Base.validate_all = false
#		ActionController::Base.check_urls = true	#	NOT YET
		ActionController::Base.check_redirects = true
		Html::Test::Validator.tidy_ignore_list = []
		Html::Test::UrlChecker.any_instance.stubs(:rails_public_path).returns(File.join(File.dirname(__FILE__), "public"))
	end
	
	def test_assert_validates_success
		get :valid
		assert_response :success
#		assert_validates # Should validate tidy, w3c, and xmllint
		assert_w3c
		assert_xmllint
skip "Not using or testing tidy"
	end
	
	def test_assert_tidy_failure
		get :untidy
		assert_response :success
#		assert_raise(Test::Unit::AssertionFailedError) do
skip "Not using or testing tidy"
		assert_raise(MiniTest::Assertion) do
			assert_tidy
		end
		assert_w3c
		assert_xmllint
	end
	
	def test_assert_w3c_failure
		get :invalid
		assert_response :success
#		assert_raise(Test::Unit::AssertionFailedError) do
		assert_raise(MiniTest::Assertion) do
			assert_w3c
		end
#		assert_raise(Test::Unit::AssertionFailedError) do
		assert_raise(MiniTest::Assertion) do
			assert_xmllint
		end
skip "Not using or testing tidy"
		assert_tidy
	end
	
	def test_url_no_route
skip "Not using or testing check_url just yet"
		assert_raise(Html::Test::InvalidUrl) do
			get :url_no_route
		end
	end

	def test_url_no_action
skip "Not using or testing check_url just yet"
		assert_raise(Html::Test::InvalidUrl) do
			get :url_no_action
		end
	end
 
 # TODO: figure out why those tests don't work 
#	def test_url_rhtml_template_exists
#		get :rhtml_template
#	end
	
#	def test_url_rxml_template_exists
#		get :rxml_template		
#	end

	def test_url_action_no_template
		get :action_no_template
	end

	def test_redirect_no_action
skip "Not using or testing check_url just yet"
		assert_raise(Html::Test::InvalidUrl) do
			get :redirect_no_action
		end		
	end
	
	def test_redirect_valid_action
		get :redirect_valid_action
		assert_response :redirect
	end

	def test_redirect_external
		get :redirect_external
		assert_response :redirect
	end

	def test_redirect_valid_with_host
		get :redirect_valid_with_host
		assert_response :redirect		
	end

	def test_image_file_exists
		get :image_file_exists
		assert_response :success
	end

	def test_image_does_not_exist
skip "Not using or testing check_url just yet"
		assert_raise(Html::Test::InvalidUrl) do
			get :image_file_does_not_exist
		end
	end

	def test_urls_to_resolve
skip "Not using or testing check_url just yet"
		checker = Html::Test::UrlChecker.new(@controller)
		checker.stubs(:response_body).returns(<<-HTML
			<a href="anchor_url">hej</a>
			Some text and <div>markup</div>
			<img src="image_url"/>
			Some more text
			<form action="form_url">
				Some text
			</form>
		HTML
		)
		assert_equal(%w(anchor_url form_url image_url), checker.send(:urls_to_check).sort)
	end
end
