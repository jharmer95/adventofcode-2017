with Ada.Strings.Hash;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Strings.Bounded;
with Ada.Containers.Hashed_Maps;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure advent3_2 is
    package SB is new Ada.Strings.Bounded.Generic_Bounded_Length (Max => 100);
    use SB;

    type XY_Coord is record
        xCoord : Integer := 0;
        yCoord : Integer := 0;
    end record;

    function Equivalent_Key(Left, Right : XY_Coord) return Boolean is
    begin
        return Left = Right;
    end Equivalent_Key;

    function ID_Hashed (id: XY_Coord) return Ada.Containers.Hash_Type is
    begin
        return Ada.Strings.Hash(Integer'Image(id.xCoord) & "," & Integer'Image(id.yCoord));
    end ID_Hashed;

    package CoordMap is new Ada.Containers.Hashed_Maps(
        Key_Type => XY_Coord,
        Element_Type => Integer,
        Hash => ID_Hashed,
        Equivalent_Keys => Equivalent_Key);

    num : Integer := 1;
    tmpNum : Integer;
    nums : CoordMap.Map;
    sqSize : Integer := 0;
    curPos : XY_Coord;
    tmpPos : XY_Coord;
    inputStr : SB.Bounded_String;
    inputNum : Integer;

begin
    inputStr := SB.To_Bounded_String(Argument(1));
    inputNum := Integer'Value(To_String(inputStr));
    nums.Insert(curPos, num);

    main_loop: loop
        for i in 0..sqSize loop
            num := 0;
            curPos.xCoord := curPos.xCoord + 1;
            tmpPos := curPos;

            -- Check up and down
            tmpPos.yCoord := curPos.yCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;

            -- Check Left, then diagonals
            tmpPos.yCoord := curPos.yCoord;
            tmpPos.xCoord := curPos.xCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;

            -- Check Right, then diagonals
            tmpPos.yCoord := curPos.yCoord;
            tmpPos.xCoord := curPos.xCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;

            if num > inputNum then
                put_line(Integer'Image(num));
                return;
            end if;

            nums.Insert(curPos, num);
        end loop;

        for j in 0..sqSize loop
            num := 0;
            curPos.yCoord := curPos.yCoord - 1;
            tmpPos := curPos;

            -- Check up and down
            tmpPos.yCoord := curPos.yCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;

            -- Check Left, then diagonals
            tmpPos.yCoord := curPos.yCoord;
            tmpPos.xCoord := curPos.xCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;

            -- Check Right, then diagonals
            tmpPos.yCoord := curPos.yCoord;
            tmpPos.xCoord := curPos.xCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;

            if num > inputNum then
                put_line(Integer'Image(num));
                return;
            end if;

            nums.Insert(curPos, num);
        end loop;

        sqSize := sqSize + 1;

        for k in 0..sqSize loop
            num := 0;
            curPos.xCoord := curPos.xCoord - 1;
            tmpPos := curPos;

            -- Check up and down
            tmpPos.yCoord := curPos.yCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;

            -- Check Left, then diagonals
            tmpPos.yCoord := curPos.yCoord;
            tmpPos.xCoord := curPos.xCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;

            -- Check Right, then diagonals
            tmpPos.yCoord := curPos.yCoord;
            tmpPos.xCoord := curPos.xCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;

            if num > inputNum then
                put_line(Integer'Image(num));
                return;
            end if;

            nums.Insert(curPos, num);
        end loop;

        for m in 0..sqSize loop
            num := 0;
            curPos.yCoord := curPos.yCoord + 1;
            tmpPos := curPos;

            -- Check up and down
            tmpPos.yCoord := curPos.yCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;

            -- Check Left, then diagonals
            tmpPos.yCoord := curPos.yCoord;
            tmpPos.xCoord := curPos.xCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;

            -- Check Right, then diagonals
            tmpPos.yCoord := curPos.yCoord;
            tmpPos.xCoord := curPos.xCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord - 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;
            tmpPos.yCoord := curPos.yCoord + 1;
            if nums.Contains(tmpPos) then
                tmpNum := nums.Element(tmpPos);
                num := tmpNum + num;
            end if;

            if num > inputNum then
                put_line(Integer'Image(num));
                return;
            end if;

            nums.Insert(curPos, num);
        end loop;

        sqSize := sqSize + 1;
    end loop main_loop;
end advent3_2;
