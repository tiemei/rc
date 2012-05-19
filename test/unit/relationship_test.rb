require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase
  test "should contact other and cancle contact" do
    one, two = users(:one), users(:two)
    Relationship.add_contact(one.id, two.id)
    assert Relationship.is_contact?(one.id, two.id)
    assert Relationship.is_contacted?(two.id, one.id)
    assert !Relationship.is_contact?(two.id, one.id)
    Relationship.cancel_contact(one.id, two.id)  
    assert !Relationship.is_contact?(one.id, two.id)
    assert !Relationship.is_contacted?(two.id, one.id)
  end
end
