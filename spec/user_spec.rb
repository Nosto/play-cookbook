require 'spec_helper'

describe 'play::user' do

  let(:user) { 'play' }
  let(:group) { 'group' }
  let(:home) { 'home' }

  let(:chef_run) {
    chef_run = ChefSpec::Runner.new(platform: 'ubuntu', version: '12.04')
    chef_run.node.set['play']['user'] = user
    chef_run.node.set['play']['group'] = group
    chef_run.node.set['play']['home'] = home
    chef_run.converge(described_recipe)
  }

  it 'creates a `play` user' do
    expect(chef_run).to create_user("#{user}")
  end

  it 'creates a `play` group' do
    expect(chef_run).to create_group("#{group}")
  end

  it 'creates a `play` group' do
    expect(chef_run).to create_group("#{group}")
  end

  it 'creates a dir' do
    expect(chef_run).to create_directory("#{home}").with(
      user:   user,
      group:  group,
      mode:   0755
    )
  end

  it 'creates a template' do
    expect(chef_run).to create_template('/etc/profile.d/play.sh').with(
      user:   'root',
      group:  'root',
      mode:   0644
    )
  end

end
