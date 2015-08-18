require 'spec_helper'

describe TerminalView do
  let(:test_view) { TerminalView.new }
  # before do
  #     @input = StringIO.new("1")
  #     test_view.input = @input
  #     @user_move = test_view.get_move
  #   end

  it "creates a view object with welcome mesaage and game key" do
        @output = StringIO.new("Whats your next move?")

  end

  it "it display inputs to the user terminal" do


  end
  it "gets the users input and returns the string value" do
      test_view.input = StringIO.new("1")
      @user_move = test_view.get_move
      expect(@user_move).to eq(1)
  end
 it "validates the users input and returns invalid if input is not matching key[1-9] " do
      test_view.input = StringIO.new("k")
      test_view.output = StringIO.new
      test_view.get_move
      expect(@user_move).to eq(nil)
      expect(test_view.output.string).to eq("Invalid move\n")
  end
end




