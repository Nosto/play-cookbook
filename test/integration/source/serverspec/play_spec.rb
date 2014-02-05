require 'spec_helper'

describe user('play') do
  it { should belong_to_group 'play' }
  it { should have_home_directory '/srv/play' }
  it { should have_login_shell '/bin/false' }
end

describe file('/etc/profile.d/play.sh') do
  it { should be_file }
end

describe file('/srv/play') do
  it { should be_directory }
end

describe file('/opt/play') do
  it { should be_directory }
end

describe command('play version') do
  it { should return_exit_status 0 }
end
