module SignhostHelper
  def load_signhost_fixture(fixture)
    File.read(File.expand_path("../../fixtures/#{fixture}.json", __FILE__))
  end
end

