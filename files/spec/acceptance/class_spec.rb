if ENV['BEAKER'] == 'true'
  # running in BEAKER test environment
  require 'spec_helper_acceptance'
else
  # running in non BEAKER environment
  require 'serverspec'
  set :backend, :exec
end

describe 'profile_jenkins class' do

  context 'default parameters' do
    if ENV['BEAKER'] == 'true'
      # Using puppet_apply as a helper
      it 'should work with no errors' do
        pp = <<-EOS
        class { 'profile_jenkins': }
        EOS

        apply_manifest(pp, :catch_failures => true, :future_parser => true)
      end
    end


  
# a profile class should test if the included packages and services are installed, enabled and running. Please adept to your needs. See examples below:
    describe package('jenkins') do
      it { is_expected.to be_installed }
    end

    describe service('jenkins') do
      it { is_expected.to be_enabled }
      it { is_expected.to be_running }
    end

    describe port(8080) do
      it {
        sleep(10) # Jenkins takes a while to start up
        should be_listening
      }
    end  

  end
end
