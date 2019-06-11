with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Strings.Bounded;

procedure advent3_1 is
    package SB is new Ada.Strings.Bounded.Generic_Bounded_Length (Max => 100);
    use SB;

    num : Integer := 1;
    xPos : Integer := 0;
    yPos : Integer := 0;
    sqSize : Integer := 0;
    inputStr : SB.Bounded_String;
    inputNum : Integer;

begin
    inputStr := SB.To_Bounded_String(Argument(1));
    inputNum := Integer'Value(To_String(inputStr));

    main_loop: loop
        for i in 0..sqSize loop
            if num = inputNum then
                put_line(Integer'Image(abs xPos + abs yPos));
                return;
            end if;
            xPos := xPos + 1;
            num := num + 1;
        end loop;

        for j in 0..sqSize loop
            if num = inputNum then
                put_line(Integer'Image(abs xPos + abs yPos));
                return;
            end if;
            yPos := yPos - 1;
            num := num + 1;
        end loop;

        sqSize := sqSize + 1;

        for k in 0..sqSize loop
            if num = inputNum then
                put_line(Integer'Image(abs xPos + abs yPos));
                return;
            end if;
            xPos := xPos - 1;
            num := num + 1;
        end loop;

        for m in 0..sqSize loop
            if num = inputNum then
                put_line(Integer'Image(abs xPos + abs yPos));
                return;
            end if;
            yPos := yPos + 1;
            num := num + 1;
        end loop;

        sqSize := sqSize + 1;
    end loop main_loop;
end advent3_1;
