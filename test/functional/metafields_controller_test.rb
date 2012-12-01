require 'test_helper'

class MetafieldsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_show
    get :show, :id => Metafield.first
    assert_template 'show'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Metafield.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end
  
  def test_create_valid
    Metafield.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to metafield_url(assigns(:metafield))
  end
  
  def test_edit
    get :edit, :id => Metafield.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Metafield.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Metafield.first
    assert_template 'edit'
  end
  
  def test_update_valid
    Metafield.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Metafield.first
    assert_redirected_to metafield_url(assigns(:metafield))
  end
  
  def test_destroy
    metafield = Metafield.first
    delete :destroy, :id => metafield
    assert_redirected_to metafields_url
    assert !Metafield.exists?(metafield.id)
  end
end
