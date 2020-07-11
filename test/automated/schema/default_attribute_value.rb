require_relative '../automated_init'

context "Schema" do
  context "Default Attribute Value" do
    context "Attribute With Default Value Declaration" do
      context do
        example = Schema::Controls::Schema::DefaultValue::Example.new

        test "Has a default value" do
          assert(example.some_attribute == 'some default value')
        end
      end

      context "Default Value Is Proc" do
        example = Schema::Controls::Schema::DefaultValue::Proc::Example.new

        test "Has a default value set by executing proc" do
          assert(example.some_attribute == 'some default value')
        end
      end

      context "Assigned a nil value" do
        example = Schema::Controls::Schema::DefaultValue::Example.new

        example.some_attribute = nil

        test "Retains the nil value rather than reverting to the default value" do
          assert(example.some_attribute.nil?)
        end
      end
    end

    context "Attribute Without Default Value Declaration" do
      example = Schema::Controls::Schema::Example.new

      test "Has no default value" do
        assert(example.some_attribute.nil?)
      end
    end
  end
end
