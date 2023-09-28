class ApplicationController < ActionController::Base

    def current_user
        @current_student = current_student.present? ? current_student : nil
    end

    def after_sign_in_path_for(resource)
        if current_student.present?
            @student = Student.find(current_student.id)
            if @student.studFName.present?
                root_path
            else
                "/student/#{current_student.id}/edit"
            end    
        end
    end
end
