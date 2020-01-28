import scala.io.Source

object Advent7_1 {
    class program(name: String, weight: Int, supported_programs: List[String]) {
        

        def get_name(): String ={
            return name
        }

        def get_weight(): Int ={
            return weight
        }

        def get_list(): List[String] ={
            return supported_programs
        }
    }

    class program_list(list: List[program]) {
        def find_bottom(): String ={
            val bottom = new StringBuilder
            bottom ++= list(0).get_name()
            for (i <- 0 to list.size) {
                for (pg <- list) {
                    if (pg.get_list().size > 0) {
                        for (ref <- pg.get_list()) {
                            if (ref == bottom.toString) {
                                bottom.setLength(0)
                                bottom ++= pg.get_name()
                            }
                        }
                    }
                }
            }

            return bottom.toString
        }
    }

    def main(args: Array[String]) {
        val filename = args(0)
        var pg_buf = new scala.collection.mutable.ListBuffer[program]()
        for (line <- Source.fromFile(filename).getLines) {
            var split = line.split(" ")
            if (split.size > 1) {
                var pg_str = split(0)
                var wt_str = split(1).replaceAll("[()]", "")

                if (split.size > 3) {
                    var buf = new scala.collection.mutable.ListBuffer[String]()
                    for (i <- 3 to split.size - 1) {
                        buf += split(i).replaceAll("[,]", "")
                    }
                    var sp_lst = buf.toList
                    var pg = new program(pg_str, wt_str.toInt, sp_lst)
                    pg_buf += pg
                }
                else {
                    var pg = new program(pg_str, wt_str.toInt, List[String]())
                    pg_buf += pg
                }
            }            
        }
        var pg_list = new program_list(pg_buf.toList)
        println(pg_list.find_bottom())
    }
}
