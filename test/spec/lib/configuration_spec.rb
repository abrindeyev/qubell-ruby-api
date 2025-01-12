# Encoding: utf-8
require File.dirname(__FILE__) + '/../spec_helper'

module Qubell
  describe Configuration do
    describe '#domain' do
      it 'default value is https://express.qubell.com' do
        expect(Qubell::Configuration.new.domain).to eq('https://express.qubell.com')
      end
      it 'can set value' do
        config = Qubell::Configuration.new
        config.domain = 'test'
        expect(config.domain).to eq('test')
      end
    end
    describe '#api_version' do
      it 'default value is 1' do
        expect(Qubell::Configuration.new.api_version).to eq('1')
      end
      it 'can set value' do
        config = Qubell::Configuration.new
        config.api_version = '2'
        expect(config.api_version).to eq('2')
      end
    end
    describe '#username' do
      it 'default value is nil' do
        expect(Qubell::Configuration.new.username).to eq(nil)
      end
      it 'can set value' do
        config = Qubell::Configuration.new
        config.username = 'username'
        expect(config.username).to eq('username')
      end
    end
    describe '#password' do
      it 'default value is nil' do
        expect(Qubell::Configuration.new.password).to eq(nil)
      end
      it 'can set value' do
        config = Qubell::Configuration.new
        config.password = 'password'
        expect(config.password).to eq('password')
      end
    end
    describe '#endpoint' do
      it 'default return value is https://express.qubell.com/api/1' do
        expect(Qubell::Configuration.new.endpoint).to eq('https://express.qubell.com/api/1')
      end
      it 'dependens on @domain' do
        config = Qubell::Configuration.new
        config.domain = 'test'
        expect(config.endpoint).to eq('test/api/1')
      end
      it 'dependens on @api_version' do
        config = Qubell::Configuration.new
        config.api_version = '2'
        expect(config.endpoint).to eq('https://express.qubell.com/api/2')
      end
    end
    describe '#to_s' do
      it 'return json string' do
        config = Qubell::Configuration.new
        config.username = 'username'
        config.password = 'password'
        expect(config.to_s).to eq('{"domain": "https://express.qubell.com",' \
                                      '"api_version": "1",' \
                                      '"username": "username",' \
                                      '"password": "password"}')
      end
    end
  end
end
