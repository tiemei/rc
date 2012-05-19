require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  # TODO 需要增加错误提示消息
  test 'should form comment then redirect back' do
    @request.env['HTTP_REFERER'] = 'http://test.host/products/:id'
    post "new", {id: products(:one).id, body: 'comments_body'}
    assert_redirected_to :back, 'not redirect back not loined'

    session[:current_user_id] = users(:one).id
    post "new", {id: products(:one).id, body: 'comments_body'}
    assert_redirected_to :back, 'not redirect back logined'
    
  end
  
end
