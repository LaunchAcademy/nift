require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    MyUploader.enable_processing = true
    @uploader = MyUploader.new(@user, :avatar)
    @uploader.store!(File.open(path_to_file))
  end

  after do
    MyUploader.enable_processing = false
    @uploader.remove!
  end

  context 'thumbnail' do
    it 'should have the right dimensions'
  end

  context 'small' do
    it 'should have the right dimensions'
  end

  context 'full size' do
    it 'should have the right dimensions'
  end
end
