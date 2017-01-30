require 'holder_rails'
require 'minitest/autorun'

class HolderRailsTest < ActionView::TestCase
  include HolderRails::Helpers

  test "size" do
    assert_dom_equal '<img data-src="holder.js/100x100?" />', holder_tag(100)
    assert_dom_equal '<img data-src="holder.js/200x300?" />', holder_tag('200x300')
    assert_dom_equal '<img data-src="holder.js/100px75?" />', holder_tag('100px75')
  end

  test "text" do
    assert_dom_equal '<img data-src="holder.js/200x300?text=Lorem ipsum" />', holder_tag('200x300', 'Lorem ipsum')
  end

  test "theme" do
    assert_dom_equal '<img data-src="holder.js/200x300?text=Lorem ipsum&amp;theme=social" />', holder_tag('200x300', 'Lorem ipsum', 'social')
  end

  test "html_options" do
    assert_dom_equal '<img class="special" data-src="holder.js/500x800?text=Example text&amp;theme=gray" id="new" />',
      holder_tag('500x800', 'Example text', 'gray', id: 'new', class: 'special')
  end

  test "holder_options" do
    assert_dom_equal '<img class="special" data-src="holder.js/500x800?font=Helvetica&amp;text=Example text&amp;theme=gray" id="new" />',
      holder_tag('500x800', 'Example text', 'gray', { id: 'new', class: 'special' }, { font: 'Helvetica' })
  end
end
