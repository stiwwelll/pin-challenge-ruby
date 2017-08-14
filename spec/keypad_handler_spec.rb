require_relative "../lib/keypad_handler"
require_relative "../constants/keymap"


RSpec.describe KeypadHandler do

  describe "#get_next_sequence_digit" do

    context "when user selects keyboard one using demo input" do
      let(:service){ described_class.new(KEYPAD_MAP_1) }

      context "when position is 5" do
        context "when the sequence is 'ULLL'" do
          let(:current_digit){ 5 }
          let(:move){ ["U", "L", "L", "L"] }

          it "returns 1" do
            expect(service.get_next_sequence_digit(current_digit, move)).to eq(1)
          end
        end

        context "when position is 1" do
          context "when the sequence is 'RRDDD'" do
            let(:current_digit){ 1 }
            let(:move){ ["R", "R", "D", "D", "D"] }

            it "returns 9" do
              expect(service.get_next_sequence_digit(current_digit, move)).to eq(9)
            end
          end
        end

        context "when position is 9" do
          context "when the sequence is 'LURDL'" do
            let(:current_digit){ 9 }
            let(:move){ ["L", "U", "R", "D", "L"] }

            it "returns 8" do
              expect(service.get_next_sequence_digit(current_digit, move)).to eq(8)
            end
          end
        end

        context "when position is 8" do
          context "when the sequence is 'UUUUD'" do
            let(:current_digit){ 8 }
            let(:move){ ["U", "U", "U", "U", "D"] }

            it "returns 5" do
              expect(service.get_next_sequence_digit(current_digit, move)).to eq(5)
            end
          end
        end

      end
    end

    context "when user selects keyboard two using demo input" do
      let(:service){ described_class.new(KEYPAD_MAP_2) }

      context "when position is 5" do
        context "when the sequence is 'ULLL'" do
          let(:current_digit){ 5 }
          let(:move){ ["U", "L", "L", "L"] }

          it "returns 5" do
            expect(service.get_next_sequence_digit(current_digit, move)).to eq(5)
          end
        end

        context "when position is 5" do
          context "when the sequence is 'RRDDD'" do
            let(:current_digit){ 5 }
            let(:move){ ["R", "R", "D", "D", "D"] }

            it "returns 'D'" do
              expect(service.get_next_sequence_digit(current_digit, move)).to eq('D')
            end
          end
        end

        context "when position is 'D'" do
          context "when the sequence is 'LURDL'" do
            let(:current_digit){ 'D' }
            let(:move){ ["L", "U", "R", "D", "L"] }

            it "returns 'B'" do
              expect(service.get_next_sequence_digit(current_digit, move)).to eq('B')
            end
          end
        end

        context "when position is 'B'" do
          context "when the sequence is 'UUUUD'" do
            let(:current_digit){ 'B' }
            let(:move){ ["U", "U", "U", "U", "D"] }

            it "returns 3" do
              expect(service.get_next_sequence_digit(current_digit, move)).to eq(3)
            end
          end
        end
      end
    end
  end
end
