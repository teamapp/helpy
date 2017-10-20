module OmniAuth
  module Strategies
    class TeamApp < OmniAuth::Strategies::OAuth2
      # See: https://github.com/intridea/omniauth-oauth2

      option :name, "team_app"

      option :client_options, {
        site: ENV['TA_AUTH_URL'],
        authorize_path: "/oauth/authorize",
      }

      uid { raw_info['id'] }

      info do
        {
          id: raw_info['id'],
          name: raw_info['name'],
          email: raw_info['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/oauth_users/current/clubs.json').parsed
      end
    end
  end
end
