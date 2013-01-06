package exp

class Survey {

    String name
    List questions
    String shortname

    static hasMany = [questions: Question]

    static constraints = {
        name blank: false, unique: true
        questions minSize: 1
        shortname nullable: true, unique: true
    }
    static mapping = {
        cache: true
        questions(cache: true)
    }
}
