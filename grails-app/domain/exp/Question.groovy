package exp

class Question {

    String text
    List options
    String type
    String defaultValue

    static hasMany = [options: String]

    static constraints = {
        text blank: false, unique: false
        options()
        type nullable: true, unique: false
        defaultValue nullable: true, unique: false
    }
}
