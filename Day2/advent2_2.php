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
                $nums_cpy = $nums;

                foreach($nums as $val)
                {
                    $breakout = false;

                    foreach($nums_cpy as $val2)
                    {
                        if ($val2 == $val)
                        {
                            continue;
                        }

                        if (intval($val2) % intval($val) == 0)
                        {
                            $sum += (intval($val2) / intval($val));
                            $breakout = true;
                            break;
                        }
                        elseif (intval($val) % intval($val2) == 0)
                        {
                            $sum += (intval($val) / intval($val2));
                            $breakout = true;
                            break;
                        }
                    }

                    if ($breakout == true)
                    {
                        break;
                    }
                }
            }

            echo '<p>Result: ' . $sum . '</p><br>';
        ?>
    </body>
</html>
