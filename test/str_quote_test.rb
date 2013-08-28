require 'test/unit'
require 'str_quote'

class StrQuoteTest < Test::Unit::TestCase
  def test_truth
    assert_kind_of Module, StrQuote
  end

  def test_quote
    assert_equal 'Hello'.quote, '"Hello"'
    assert_equal 'Hello world'.quote, '"Hello world"'
    assert_equal 'Embed"ded'.quote, '"Embed\"ded"'
    assert_equal "zz zz".quote("'"), "'zz zz'"
    assert_equal "gr&t".quote('&','#'), '&gr#&t&'
  end
  
  def test_dequote
    assert_equal 'foobar', '"foobar"'.dequote
    assert_equal '"Hello world"'.unquote, 'Hello world'
    assert_equal '"Embed\"ded"'.unquote, 'Embed"ded'
    assert_equal "'zz zz'".unquote("'"), "zz zz"
    assert_equal '&gr#&t&'.dequote('&', '#'), "gr&t"
  end
end
