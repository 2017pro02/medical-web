module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    protected

      # this checks whether a user is authenticated with devise
      def find_verified_user
        env["warden"].user || reject_unauthorized_connection
      end
  end
end
