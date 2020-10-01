// Use foldLeft to compute the total size of a list of strings.
val strings = List("Hello", "there", "good", "friend", "!")

strings.foldLeft(0)((sum, value) => sum + value.length)

// Write a Censor trait with a method that will replace the curse words Shoot
// and Darn with Pucky and Beans alternatives. Use a map to store the
// curse words and their alternatives.
trait Censor{  
    val badToGoodWords = Map("Shoot" -> "Pucky", "Darn" -> "Beans")
    def replaceBadWords(string: String): String = string.split(" ")
                                                    .map(word => badToGoodWords.getOrElse(word,word)).mkString(" ")
}  

object Test extends Censor

println(Test.replaceBadWords("Gosh Darn it and Shoot"))

// Load the curse words and alternatives from a file.
import scala.io.Source
import scala.collection.mutable.HashMap

def readFromFile(filename: String): HashMap[String, String] = {
    val badToGoodWords = new HashMap[String, String]
    for (line <- Source.fromFile(filename).getLines) {
        val words = line.split(" ") 
        badToGoodWords += words(0) -> words(1)
    }
    return badToGoodWords
}

def replaceBadWords(string: String): String = string.split(" ")
                                                   .map(word => badToGoodWords.getOrElse(word,word)).mkString(" ")

val badToGoodWords = readFromFile("cursewords.txt")
println(replaceBadWords("What a disgusting and ugly meal. Tastes like bollocks"))