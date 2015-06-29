# Helper methods defined here can be accessed in any controller or view in the application

module Tod
  class App
    module AuthHelper

      def with_admin_role(&block)

        if session[:user] && session[:user].role.is_admin?
          block.call
        else
          status 401 #Unauthorized
          body  t('admin.conference.fail')
        end

      end

      def set_as_admin_if_eligible
        AdminManager.set_as_admin_if_eligible session[:user]
      end

    end
    helpers AuthHelper
  end
end
