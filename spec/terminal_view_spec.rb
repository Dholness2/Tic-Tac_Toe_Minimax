require 'spec_helper'

describe TerminalView do
  let(:test_view) { TerminalView.new }

it "creates a view object with welcome mesaage and game key" do
    @output = StringIO.new("Whats your next move?")

  end

  it "it display inputs to the user terminal" do
    test_view.output = StringIO.new()
    test_view.display "test string"
    expect(test_view.output.string).to eq("test_out_put")
  end
  it "gets the users input and returns the string  equilent interger value -1" do
    test_view.input = StringIO.new("1")
    expect(test_view.get_move).to eq(0)
  end
  it "validates the users input and returns invalid if input is not matching key[1-9] " do
    test_view.input = StringIO.new("k")
    test_view.output = StringIO.new
    expect(test_view.get_move).to eq(nil)
    expect(test_view.output.string).to eq("Error\n")
  end
end
