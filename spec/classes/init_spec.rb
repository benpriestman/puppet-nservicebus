require 'spec_helper'
describe 'nservicebus' do

  context 'with defaults for all parameters' do
    it { should contain_class('nservicebus') }
  end
end
