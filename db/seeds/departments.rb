# In this file will create one campus and its departments for example use

# Create a campus by default
@campus = Campu.create(
  name:        'Instituto Tecnológico de Estudios Superior de Monterrey',
  code:        'QRO',
  status:      true,
  state:       'Querétaro',
  description: 'Campus úbicado en el estado de Querétaro',
)

# Create 5 departments associated to the previous campus
5.times do
  @department = FactoryGirl.create(:department, campu_id: @campus.id)

  # Create 5 careers into the department
  5.times do
    @career = FactoryGirl.create(:career, department_id: @department.id)

    # Create 3 study_programs per career
    3.times do
      @study = FactoryGirl.create(:study_program, career_id: @career.id)

      # Create 60 courses per study program
      60.times do
        @course = FactoryGirl.create(:course)
        CourseProgram.create(study_program_id: @study.id, course_id: @course.id)
      end
    end
  end
end
