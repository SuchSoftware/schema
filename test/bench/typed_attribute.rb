require_relative './bench_init'

context "Attribute Definition" do
  example = Schema::Controls::Schema::Typed::Example.new

  context "Attribute value is not of the same type as the attribute's declared interface" do
    test "Incorrect" do
      assert proc { example.some_attribute = 'some value' } do
        raises_error? Schema::TypeError
      end
    end
  end

  context "Attribute value is of the same type as the attribute's declared interface" do
    test "Correct" do
      something = Schema::Controls::Schema::Typed::SomeType.new
      example.some_attribute = something
    end
  end
end
