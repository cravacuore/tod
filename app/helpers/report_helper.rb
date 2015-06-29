# Helper methods defined here can be accessed in any controller or view in the application

module Tod
  class App
    module ReportHelper
      def user_is_revisor?()
        if session[:user].nil?
         return false
        end
        user= session[:user]
        user= user.role
        user.to_s == "revisor"
      end
    end
    helpers ReportHelper
  end
end