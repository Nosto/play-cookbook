require 'spec_helper'

describe 'play::default' do

  let(:dir)       { '/opt/play' }
  let(:version)   { '1.3.1' }

  let(:chef_run) {
    chef_run = ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')
    chef_run.node.set['play']['dir'] = dir
    chef_run.node.set['play']['version'] = version
    chef_run.converge(described_recipe)
  }

  it 'includes the `user` recipe' do
    expect(chef_run).to include_recipe('play::user')
  end

  it 'installs unzip' do
    expect(chef_run).to install_package('unzip')
  end

  it 'downloads the zip' do
    expect(chef_run).to create_remote_file_if_missing("/var/chef/cache/play-#{version}.zip").with(owner: 'root')
  end

  it 'has 0644 permissions' do
    download = chef_run.remote_file("/var/chef/cache/play-#{version}.zip")
    expect(download.mode).to eq(0644)
  end

  it 'deletes a directory and notifies install' do
    expect(chef_run).to delete_directory("#{dir}")
    expect(chef_run.directory("#{dir}")).to notify('bash[play-install]').immediately
  end

  it 'installs `play`' do
    expect(chef_run).to run_bash("play-install")
  end

end
