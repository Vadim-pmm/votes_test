qb = QuestionBox.create(name: 'Первый опросник')
qb.questions.create(name: "Первый вопрос Первого опросника")
qb.questions.create(name: "Второй вопрос Первого опросника")
qb.questions.create(name: "Третий вопрос Первого опросника")

qb = QuestionBox.create(name: 'Второй опросник')
100.times { |i| qb.questions.create(name: Faker::Lorem.sentence + ' ?') }

qb = QuestionBox.create(name: 'Третий опросник')
qb.questions.create(name: "Первый вопрос Третьего опросника")
qb.questions.create(name: "Второй вопрос Третьего опросника")
qb.questions.create(name: "Третий вопрос Третьего опросника")
qb.questions.create(name: "Четвертый вопрос Третьего опросника")
qb.questions.create(name: "Пятый вопрос Третьего опросника")

