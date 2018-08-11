# Seed file to create the base structure with random objects for each model
# that represent the system
# In this file will create one campus and its departments for example use

# Create a campus by default
@campus = Campu.find_or_create_by(
  name:        'Instituto Tecnológico de Estudios Superior de Monterrey',
  code:        'QRO',
  status:      true,
  state:       'Querétaro',
  description: 'Campus úbicado en el estado de Querétaro',
)

# Create 4 departments associated to the previous campus
2.times do
  @department = FactoryBot.create(:department, campu_id: @campus.id)

  # Create 4 careers into the department
  3.times do
    @career = FactoryBot.create(:career, department_id: @department.id)

    # Create 3 study_programs per career
    2.times do
      @study = FactoryBot.create(:study_program, career_id: @career.id)

      # Create 60 courses per study program
      (0..9).each do |i|
        6.times do
          @course = FactoryBot.create(:course)
          # Add the course and the study program to the model associated to both
          StudyProgramCourse.create(study_program_id: @study.id, course_id: @course.id, semester_number: i)
        end
      end
    end
  end
end
