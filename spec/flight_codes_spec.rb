require 'flight_codes'

describe CountryCodes do
  let(:dummy_class) { Class.new { include CountryCodes} }
  let(:subject) { dummy_class.new }

  describe '#generate_code' do
    it 'generates a random country code, mainly for initializing plane with' do
      expect(subject.country_codes.include?(subject.generate_code)).to eq true
    end
  end

  describe '#generate_name' do
    it 'generates a random country code' do
      expect(subject.full_names.include?(subject.generate_name)).to be true
    end
  end

  describe '#search_by_name' do
    it 'raises an error if the name is invalid' do
      expect{subject.search_by_name('abcd')}.to raise_error('country not in list')
    end

    it 'returns a country code, given the full name' do
      expect(subject.search_by_name('United_Kingdom')).to eq 'GB'
    end
  end

  describe '#search_by_code' do
    it 'raises an error if the code is invalid' do
      expect{subject.search_by_code('abcd')}.to raise_error('code not in list')
    end

    it 'returns a country\'s full name, given it\'s code' do
      expect(subject.search_by_code('GB')).to eq 'United_Kingdom'
    end
  end
end