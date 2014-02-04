require 'spec_helper'

describe 'play::source' do

  let(:dir) { '/opt/play'}
  let(:git_url) { 'git://github.com/playframework/play.git' }

  let(:chef_run) {
  	chef_run = ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')
    chef_run.node.set['play']['dir'] = dir
  	chef_run.node.set['play']['git_url'] = git_url
  	chef_run.converge(described_recipe)
  }

  it 'includes the `user` recipe' do
    expect(chef_run).to include_recipe('play::user')
  end

  it 'installs ant' do
    expect(chef_run).to install_package('ant')
  end

  it 'creates the dir' do
    expect(chef_run).to create_directory("#{dir}")
  end

  it 'checkouts the git repository' do
    expect(chef_run).to sync_git("#{dir}").with(repository: "#{git_url}")
  end

  it 'builds play' do
    expect(chef_run).to run_bash('play-install')
  end

end
