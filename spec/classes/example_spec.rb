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

  

        end
      end
    end
  end
end
