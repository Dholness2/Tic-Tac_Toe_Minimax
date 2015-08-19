require 'spec_helper'
describe TerminalView do
  let(:test_view){TerminalView.new }

  it " TerminalView.new returns a new terminal object" do
    expect(test_view).to be_a TerminalView
  end

  it "puts welcome mesaage " do
    test_view.output = StringIO.new()
    test_view.welcome
    expect(test_view.output.string).to eq("DON's TIC TAC TOE\n")
  end

  it " puts game move key"  do
    test_view.output =StringIO.new()
    test_view.key
    expect(test_view.output.string).to eq("Move key:\n1|2|3\n4|5|6\n7|8|9\n \n")
  end

  it "it display inputs to the user terminal" do
    test_view.output = StringIO.new()
    test_view.display "test string"
    expect(test_view.output.string).to eq("test string\n")
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
