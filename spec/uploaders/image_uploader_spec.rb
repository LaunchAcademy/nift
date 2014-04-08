require 'carrierwave/test/matchers'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  before do
    ImageUploader.enable_processing = true
    @image = ImageUploader.new(@user, :avatar)
    @image.store!(File.open(path_to_file))
  end

  after do
    ImageUploader.enable_processing = false
    @image.remove!
  end

  context 'thumbnail' do
    it 'should have the right dimensions' do
      expect(@image.thumb).to have_dimensions(50, 50)
    end
  end

  context 'small' do
    it 'should have the right dimensions'
      expect(@image.small).to be_no_larger_than(200, 200)
  end


  it 'should make the image readable only to the owner and not executable' do
    expect(@image).to have_permissions(0600)
  end
end
