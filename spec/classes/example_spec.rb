require 'spec_helper'

describe 'profile_jenkins' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge({
            :concat_basedir => "/foo"
          })
        end

        context "profile_jenkins class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('profile_jenkins') }
          it { is_expected.to contain_package('jenkins') }
          it { is_expected.to contain_service('jenkins') }
          it { is_expected.to contain_user('jenkins') }
          it { is_expected.to contain_class('docker') }
        end
      end
    end
  end
end
