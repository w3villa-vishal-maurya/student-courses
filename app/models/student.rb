class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one_attached :profile_image       
    # validates :studFName, presence: true
    has_many :teachers 
    has_many :courses , through: :teachers

    validates :studFName, :studLName, :yearOfEnroll , presence: true
    validates :studFName, :studLName, length: {minimum: 2, maximum: 10}
    validates :studPhone, presence: true, numericality: true

    after_commit :display_student_created

    def display_student_created
      if self.studFName.present?
        puts "========= New User has been created!============"
      else
        puts "============== User is still not created, Some errors has been ocurred!========="  
      end
    end  
end
