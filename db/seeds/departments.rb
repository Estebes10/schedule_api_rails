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

@department = Department.create(
  name: "Departamento de Tecnologías de Información y Robotica",
  code: "DTIR",
  campu_id: @campus.id
)

@career1 = Career.create(
  name: "INGENIERO EN SISTEMAS COMPUTACIONALES",
  code: "ISC",
  department_id: @department.id
)

@career2 = Career.create(
  name: "INGENIERO EN SISTEMAS DIGITALES Y ROBÓTICA",
  code: "ISDR",
  department_id: @department.id
)

@study_program = StudyProgram.create(
  name: "ISC11",
  career_id: @career1.id
)

#load courses to assign to study program
@rem1 = Course.find_by(code: 'TC0R01')
@rem2 = Course.find_by(code: 'TC0R02')
@rem3 = Course.find_by(code: 'TC0R03')
@rem4 = Course.find_by(code: 'TC0R04')
@rem5 = Course.find_by(code: 'TC0R05')
@rem6 = Course.find_by(code: 'TC0R06')
@rem7 = Course.find_by(code: 'TC0R07')
@rem8 = Course.find_by(code: 'TC0R08')
@rem9 = Course.find_by(code: 'TC0R09')

#regular courses
@course1 = Course.find_by(code: 'TC0101')
@course2 = Course.find_by(code: 'TC0102')
@course3 = Course.find_by(code: 'TC0103')
@course4 = Course.find_by(code: 'TC0104')
@course5 = Course.find_by(code: 'TC0105')
@course6 = Course.find_by(code: 'TC0106')
@course7 = Course.find_by(code: 'TC0107')
@course8 = Course.find_by(code: 'TC0108')
@course9 = Course.find_by(code: 'TC0109')
@course10 = Course.find_by(code: 'TC0110')
@course11 = Course.find_by(code: 'TC0111')
@course12 = Course.find_by(code: 'TC0112')
@course13 = Course.find_by(code: 'TC0113')
@course14 = Course.find_by(code: 'TC0114')
@course15 = Course.find_by(code: 'TC0115')
@course16 = Course.find_by(code: 'TC0116')
@course17 = Course.find_by(code: 'TC0117')
@course18 = Course.find_by(code: 'TC0118')
@course19 = Course.find_by(code: 'TC0119')
@course20 = Course.find_by(code: 'TC0120')
@course21 = Course.find_by(code: 'TC0121')
@course22 = Course.find_by(code: 'TC0122')
@course23 = Course.find_by(code: 'TC0123')
@course24 = Course.find_by(code: 'TC0124')
@course25 = Course.find_by(code: 'TC0125')
@course26 = Course.find_by(code: 'TC0126')
@course27 = Course.find_by(code: 'TC0127')
@course28 = Course.find_by(code: 'TC0128')
@course29 = Course.find_by(code: 'TC0129')
@course30 = Course.find_by(code: 'TC0130')
@course31 = Course.find_by(code: 'TC0131')
@course32 = Course.find_by(code: 'TC0132')
@course33 = Course.find_by(code: 'TC0133')
@course34 = Course.find_by(code: 'TC0134')
@course35 = Course.find_by(code: 'TC0135')
@course36 = Course.find_by(code: 'TC0136')
@course37 = Course.find_by(code: 'TC0137')
@course38 = Course.find_by(code: 'TC0138')
@course39 = Course.find_by(code: 'TC0139')
@course40 = Course.find_by(code: 'TC0140')
@course41 = Course.find_by(code: 'TC0141')
@course42 = Course.find_by(code: 'TC0142')
@course43 = Course.find_by(code: 'TC0143')
@course44 = Course.find_by(code: 'TC0144')
@course45 = Course.find_by(code: 'TC0145')
@course46 = Course.find_by(code: 'TC0146')
@course47 = Course.find_by(code: 'TC0147')
@course48 = Course.find_by(code: 'TC0148')
@course49 = Course.find_by(code: 'TC0149')
@course50 = Course.find_by(code: 'TC0150')
@course51 = Course.find_by(code: 'TC0151')
@course52 = Course.find_by(code: 'TC0152')
@course53 = Course.find_by(code: 'TC0153')
@course54 = Course.find_by(code: 'TC0154')
@course55 = Course.find_by(code: 'TC0155')
@course56 = Course.find_by(code: 'TC0156')
@course57 = Course.find_by(code: 'TC0157')


# Load 60 courses per study program
(0..9).each do |i|
  if i == 0
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @rem1.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @rem2.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @rem3.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @rem4.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @rem5.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @rem6.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @rem7.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @rem8.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @rem9.id, semester_number: i)
    puts "===============================# Remedials loaded #==============================="
  elsif i == 1
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course1.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course2.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course3.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course4.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course5.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course6.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course7.id, semester_number: i)
    puts "===============================# Semestre 1 loaded #==============================="
  elsif i == 2
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course8.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course9.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course10.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course11.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course12.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course13.id, semester_number: i)
    puts "===============================# Semestre 2 loaded #==============================="
  elsif i == 3
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course14.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course15.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course16.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course17.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course18.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course19.id, semester_number: i)
    puts "===============================# Semestre 3 loaded #==============================="
  elsif i == 4
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course20.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course21.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course22.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course23.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course24.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course25.id, semester_number: i)
    puts "===============================# Semestre 4 loaded #==============================="
  elsif i == 5
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course26.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course27.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course28.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course29.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course30.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course31.id, semester_number: i)
    puts "===============================# Semestre 5 loaded #==============================="
  elsif i == 6
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course32.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course33.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course34.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course35.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course36.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course37.id, semester_number: i)
    puts "===============================# Semestre 6 loaded #==============================="
  elsif i == 7
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course38.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course39.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course40.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course41.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course42.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course43.id, semester_number: i)
    puts "===============================# Semestre 7 loaded #==============================="
  elsif i == 8
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course44.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course45.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course46.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course47.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course48.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course49.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course50.id, semester_number: i)
    puts "===============================# Semestre 8 loaded #==============================="
  elsif i == 9
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course51.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course52.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course53.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course54.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course55.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course56.id, semester_number: i)
    StudyProgramCourse.create(study_program_id: @study_program.id, course_id: @course57.id, semester_number: i)
    puts "===============================# Semestre 9 loaded #==============================="
  end
end
