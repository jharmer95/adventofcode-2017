import scala.io.Source

object Advent7_1 {
    def main(args: Array[String]) {
        val filename = args(0)
        for (line <- Source.fromFile(filename).getLines) {
            println(line)
        }
    }
}
