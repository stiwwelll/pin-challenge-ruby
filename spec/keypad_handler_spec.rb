require_relative '../lib/keypad_handler'


RSpec.describe KeypadHandler do

  describe "#get_next_sequence_digit" do
    context "when user selects keyboard one" do
      let(:service){ described_class.new(KEYPAD_MAP_1) }
      context "when position is 1" do
        context "when the sequence is 'LUDR'" do
          let(:current_digit){ 1 }
          let(:move){ ["L", "U", "D", "R"] }

          it "returns 5" do
            expect(service.get_next_sequence_digit(current_digit, move)).to eq(5)
          end

        end

      end
    end

    context "when user selects keyboard two" do
      let(:service){ described_class.new(KEYPAD_MAP_2) }
      context "when position is 5" do
        context "when the sequence is 'DLRD'" do
          let(:current_digit){ 7 }
          let(:move){ ["D", "L", "R", "D"] }

          it "returns 'D'" do
            expect(service.get_next_sequence_digit(current_digit, move)).to eq('D')
          end

        end

      end
    end
  end
end
