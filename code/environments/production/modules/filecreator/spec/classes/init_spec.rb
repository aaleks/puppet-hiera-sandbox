require 'spec_helper'
describe 'filecreator' do
  context 'with default values for all parameters' do
    it { should contain_class('filecreator') }
  end
end
