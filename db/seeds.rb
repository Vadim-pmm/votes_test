# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

qb = QuestionBox.create(name: 'Первый опросник')
qb.questions.create(name: "Первый вопрос Первого опросника")
qb.questions.create(name: "Второй вопрос Первого опросника")
qb.questions.create(name: "Третий вопрос Первого опросника")

qb = QuestionBox.create(name: 'Второй опросник')
qb.questions.create(name: "Первый вопрос Второго опросника")
qb.questions.create(name: "Второй вопрос Второго опросника")
qb.questions.create(name: "Третий вопрос Второго опросника")
qb.questions.create(name: "Четвертый вопрос Второго опросника")
qb.questions.create(name: "Пятый вопрос Второго опросника")
qb.questions.create(name: "Шестой вопрос Второго опросника")
qb.questions.create(name: "Седьмой вопрос Второго опросника")
qb.questions.create(name: "Восьмой вопрос Второго опросника")
qb.questions.create(name: "Девятый вопрос Второго опросника")
qb.questions.create(name: "Десятый вопрос Второго опросника")

qb = QuestionBox.create(name: 'Третий опросник')
qb.questions.create(name: "Первый вопрос Третьего опросника")
qb.questions.create(name: "Второй вопрос Третьего опросника")
qb.questions.create(name: "Третий вопрос Третьего опросника")
qb.questions.create(name: "Четвертый вопрос Третьего опросника")
qb.questions.create(name: "Пятый вопрос Третьего опросника")

