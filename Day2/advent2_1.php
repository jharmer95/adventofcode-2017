<html>
    <head>
        <title>Advent of Code 2017 Day 2: Part 1</title>
    </head>
    <body>
        <?php
            $myFile = fopen("input/advent2.txt", "r") or die("Unable to open file!");
            $text = fread($myFile, filesize("input/advent2.txt"));
            fclose($myFile);

            $rows = explode("\n", $text);
            $sum = 0;

            foreach($rows as $row)
            {
                $nums = explode("\t", $row);
                $maxVal = PHP_INT_MIN;
                $minVal = PHP_INT_MAX;

                foreach($nums as $val)
                {
                    if (intval($val) > $maxVal)
                    {
                        $maxVal = intval($val);
                    }
                    
                    if (intval($val) < $minVal)
                    {
                        $minVal = intval($val);
                    }
                }

                $sum = $sum + ($maxVal - $minVal);
            }

            echo '<p>Result: ' . $sum . '</p><br>';
        ?>
    </body>
</html>
