require_relative '../spec_helper'
require 'pry'

module FreckleIO
  describe Client do
    context 'with configuration', :vcr do
      before do
        FreckleIO.reset
        FreckleIO.configure do |config|
          config.token = ENV['FRECKLE_TOKEN']
          config.auth_type = :freckle_token
        end
      end

      let(:client) { FreckleIO::Client.new }
      let!(:users) { client.get('/v2/users') }
      let(:user_info) do
        [
          "id",
          "email",
          "first_name",
          "last_name",
          "profile_image_url",
          "state",
          "role",
          "entries",
          "expenses",
          "created_at",
          "updated_at",
          "url",
          "entries_url",
          "expenses_url",
          "activate_url",
          "deactivate_url",
          "give_access_to_projects_url",
          "revoke_access_to_projects_url",
          "revoke_access_to_all_projects_url"
        ]
      end

      describe 'with header' do
        it 'set user agent' do
          ua = users.env.request_headers["User-Agent"]

          expect(ua).to eq "MyFreckleBot/1.0"
        end
      end

      describe "with freckle token authentication" do
        it 'set X-FreckleToken' do
          header_token = users.env.request_headers["X-FreckleToken"]

          expect(header_token).not_to be nil
        end
      end

      describe "#get" do
        it 'returns an array of users' do
          expect(users.body).to be_a Array
        end

        it 'returns an user' do
          expect(users.body.first.keys).to eq(user_info)
        end
      end

      describe '#next' do
        it 'returns an array of users' do
          expect(client.next.body).to be_a Array
        end

        it 'returns an user' do
          expect(users.body.first.keys).to eq(user_info)
        end
      end

      describe '#prev' do
        before do
          client.next
        end

        it 'returns an array of users' do
          expect(client.prev.body).to be_a Array
        end

        it 'returns an user' do
          expect(users.body.first.keys).to eq(user_info)
        end

      end

      describe '#last' do
        it 'returns an array of users' do
          expect(client.last.body).to be_a Array
        end

        it 'returns an user' do
          expect(users.body.first.keys).to eq(user_info)
        end
      end

      describe '#first' do
        before do
          client.last
        end

        it 'returns an array of users' do
          expect(client.first.body).to be_a Array
        end

        it 'returns an user' do
          expect(users.body.first.keys).to eq(user_info)
        end
      end
    end
  end
end
