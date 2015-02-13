module Refile
  module Validators
    RSpec.describe ContentTypeConsistence do
      describe '#validate_each' do
        subject { described_class.new(options).validate_each(record, attribute, value) }

        context 'when ' do
          let(:record_errors) { double(:record_errors, add: nil) }
          let(:options)       { { attributes: double(:options_attributes) } }
          let(:record)        { double(:record, attach_attacher: nil, errors: record_errors) }
          let(:attribute)     { :attach }
          let(:value)         { }

          it 'y' do
            expect(record_errors).to receive(:add).with(attribute, :inconsistent_content_type)

            subject
          end
        end
      end
    end
  end
end
