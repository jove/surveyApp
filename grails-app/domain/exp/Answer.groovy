package exp

class Answer {

    Question question
    String text

    static constraints = {
        text blank: true, maxSize: 2000
        question()
    }

    static mapping = {
        cache: 'read-only'
    }
}
