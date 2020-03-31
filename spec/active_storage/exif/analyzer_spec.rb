# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ActiveStorage::Exif::Analyzer do # rubocop:disable Metrics/BlockLength
  let(:blob) { fake_blob(io: File.open('spec/fixtures/image_with_exif.jpeg')) }
  let(:logger) { double.as_null_object }

  before { ActiveStorage.logger = logger }

  describe '.metadata' do
    subject { ActiveStorage::Exif::Analyzer.new(blob).metadata[:exif] }

    it { expect(subject['DateTime']).to eq '2008:11:01 21:15:08' }
    it { expect(subject['Make']).to eq 'NIKON' }
    it { expect(subject['Model']).to eq 'COOLPIX P6000' }

    it 'extracts location data' do
      expect(subject).to include(
        'GPSInfo' => '926',
        'GPSLatitude' => '43/1, 28/1, 149399999/100000000',
        'GPSLatitudeRef' => 'N',
        'GPSLongitude' => '11/1, 53/1, 433799999/100000000',
        'GPSLongitudeRef' => 'E',
        'GPSMapDatum' => 'WGS-84   ',
        'GPSSatellites' => '06',
        'GPSTimeStamp' => '14/1, 36/1, 4723/100'
      )
    end

    context 'an image without EXIF' do
      let(:blob) { fake_blob(io: File.open('spec/fixtures/image.jpeg')) }
      it { is_expected.to be_empty }
    end

    context 'not an image' do
      let(:blob) { fake_blob(io: File.open('README.md')) }
      it { is_expected.to be_empty }
    end
  end

  private

  def fake_blob(io:)
    dbl = double
    allow(dbl).to receive(:open).and_yield(io)

    dbl
  end
end
