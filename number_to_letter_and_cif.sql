/*==============================================================================
Author: Manuel A. Berni
Creation date: 16/10/2025
Description: This package contains two functions, one converts a number to letters,
and the other is an equivalent function from the rfunc library.

num_to_letters: This function converts numbers to letters, according to the mode,
which can be feminine or masculine, and the language. It currently supports two
languages: Spanish = 1 and English = 2; more languages ​​can be added
, and anyone is free to do so.

cif: This function is equivalent to the cif function from the RFUNC library.
It returns the string a or b it receives as parameters according to the first
parameter.

The algorithms can of course be improved; I leave it up to anyone to modify it
as they see fit.
==============================================================================*/
CREATE TABLE TEXTS_NUMBERS (
    ROWNUMBER  SMALLINT NOT NULL,
    TEXT_0     VARCHAR(100) NOT NULL,
    TEXT_1     VARCHAR(100) NOT NULL,
    TEXT_2     VARCHAR(100) NOT NULL,
    TEXT_3     VARCHAR(100) NOT NULL,
    TEXT_4     VARCHAR(100) NOT NULL,
    TEXT_5     VARCHAR(100) NOT NULL,
    TEXT_6     VARCHAR(100) NOT NULL,
    TEXT_7     VARCHAR(100) NOT NULL,
    TEXT_8     VARCHAR(100) NOT NULL,
    TEXT_9     VARCHAR(100) NOT NULL,
    LANGUAGE   SMALLINT NOT NULL
);

COMMENT ON TABLE TEXTS_NUMBERS IS
'Description: This table contains the texts of numbers in letters, that is, the texts that will be used
to convert numbers to letters.
languague = 1 -> spanish
languague = 2 -> english';

CREATE GLOBAL TEMPORARY TABLE TEXTS_NUMBERS_TEMP (
    ROWNUMBER  SMALLINT NOT NULL,
    TEXT_0     VARCHAR(100) NOT NULL,
    TEXT_1     VARCHAR(100) NOT NULL,
    TEXT_2     VARCHAR(100) NOT NULL,
    TEXT_3     VARCHAR(100) NOT NULL,
    TEXT_4     VARCHAR(100) NOT NULL,
    TEXT_5     VARCHAR(100) NOT NULL,
    TEXT_6     VARCHAR(100) NOT NULL,
    TEXT_7     VARCHAR(100) NOT NULL,
    TEXT_8     VARCHAR(100) NOT NULL,
    TEXT_9     VARCHAR(100) NOT NULL
) ON COMMIT DELETE ROWS;

COMMENT ON TABLE TEXTS_NUMBERS_TEMP IS
'Description: This table contains the texts of numbers in letters, that is, the texts
that will be used to convert numbers to letters, which are temporarily loaded depending on the mode,
masculine or feminine, and the language.';

INSERT INTO TEXTS_NUMBERS (ROWNUMBER, TEXT_0, TEXT_1, TEXT_2, TEXT_3, TEXT_4, TEXT_5, TEXT_6, TEXT_7, TEXT_8, TEXT_9, LANGUAGE)
                   VALUES (0, 'Una ', 'Dos ', 'Tres ', 'Cuatro ', 'Cinco ', 'Seis ', 'Siete ', 'Ocho ', 'Nueve ', 'Un ', 1);
INSERT INTO TEXTS_NUMBERS (ROWNUMBER, TEXT_0, TEXT_1, TEXT_2, TEXT_3, TEXT_4, TEXT_5, TEXT_6, TEXT_7, TEXT_8, TEXT_9, LANGUAGE)
                   VALUES (1, 'Once ', 'Doce ', 'Trece ', 'Catorce ', 'Quince ', 'Dieciseis ', 'Diecisiete ', 'Dieciocho ', 'Diecinueve ', 'un ', 1);
INSERT INTO TEXTS_NUMBERS (ROWNUMBER, TEXT_0, TEXT_1, TEXT_2, TEXT_3, TEXT_4, TEXT_5, TEXT_6, TEXT_7, TEXT_8, TEXT_9, LANGUAGE)
                   VALUES (2, 'Diez ', 'Veinte ', 'Treinta ', 'Cuarenta ', 'Cincuenta ', 'Sesenta ', 'Setenta ', 'Ochenta ', 'Noventa ', 'Veinti', 1);
INSERT INTO TEXTS_NUMBERS (ROWNUMBER, TEXT_0, TEXT_1, TEXT_2, TEXT_3, TEXT_4, TEXT_5, TEXT_6, TEXT_7, TEXT_8, TEXT_9, LANGUAGE)
                   VALUES (3, 'Cien ', 'Doscientas ', 'Trescientas ', 'Cuatrocientas ', 'Quinientas ', 'Seiscientas ', 'Setecientas ', 'Ochocientas ', 'Novecientas ', 'Ciento ', 1);
INSERT INTO TEXTS_NUMBERS (ROWNUMBER, TEXT_0, TEXT_1, TEXT_2, TEXT_3, TEXT_4, TEXT_5, TEXT_6, TEXT_7, TEXT_8, TEXT_9, LANGUAGE)
                   VALUES (4, 'Cien ', 'Doscientos ', 'Trescientos ', 'Cuatrocientos ', 'Quinientos ', 'Seiscientos ', 'Setecientos ', 'Ochocientos ', 'Novecientos ', 'Ciento ', 1);
INSERT INTO TEXTS_NUMBERS (ROWNUMBER, TEXT_0, TEXT_1, TEXT_2, TEXT_3, TEXT_4, TEXT_5, TEXT_6, TEXT_7, TEXT_8, TEXT_9, LANGUAGE)
                   VALUES (5, 'Mil ', 'Millon ', 'Millones ', 'Cero ', 'y ', 'Uno ', 'Dos ', 'Con ', 'Billon ', 'Billones ', 1);
INSERT INTO TEXTS_NUMBERS (ROWNUMBER, TEXT_0, TEXT_1, TEXT_2, TEXT_3, TEXT_4, TEXT_5, TEXT_6, TEXT_7, TEXT_8, TEXT_9, LANGUAGE)
                   VALUES (0, 'One ', 'Two ', 'Three ', 'Four ', 'Five ', 'Six ', 'Seven ', 'Eight ', 'Nine ', 'One ', 2);
INSERT INTO TEXTS_NUMBERS (ROWNUMBER, TEXT_0, TEXT_1, TEXT_2, TEXT_3, TEXT_4, TEXT_5, TEXT_6, TEXT_7, TEXT_8, TEXT_9, LANGUAGE)
                   VALUES (1, 'Eleven ', 'Twelve ', 'Thirteen ', 'Fourteen ', 'Fifteen ', 'Sixteen ', 'Sixteen ', 'Eighteen ', 'Nineteen ', 'one ', 2);
INSERT INTO TEXTS_NUMBERS (ROWNUMBER, TEXT_0, TEXT_1, TEXT_2, TEXT_3, TEXT_4, TEXT_5, TEXT_6, TEXT_7, TEXT_8, TEXT_9, LANGUAGE)
                   VALUES (2, 'Ten ', 'Twenty ', 'Thirty', 'Forty', 'Fifty', 'Sixty', 'Seventy', 'Eighty', 'Ninety', 'Twenty', 2);
INSERT INTO TEXTS_NUMBERS (ROWNUMBER, TEXT_0, TEXT_1, TEXT_2, TEXT_3, TEXT_4, TEXT_5, TEXT_6, TEXT_7, TEXT_8, TEXT_9, LANGUAGE)
                   VALUES (3, 'One Hundred ', 'Two Hundred ', 'Three Hundred ', 'Four Hundred ', 'Five Hundred ', 'Six Hundred ', 'Seven Hundred ', 'Eight Hundred ', 'Nine Hundred ', 'One Hundred ', 2);
INSERT INTO TEXTS_NUMBERS (ROWNUMBER, TEXT_0, TEXT_1, TEXT_2, TEXT_3, TEXT_4, TEXT_5, TEXT_6, TEXT_7, TEXT_8, TEXT_9, LANGUAGE)
                   VALUES (4, 'One Hundred ', 'Two Hundred ', 'Three Hundred ', 'Four Hundred ', 'Five Hundred ', 'Six Hundred ', 'Seven Hundred ', 'Eight Hundred ', 'Nine Hundred ', 'One Hundred ', 2);
INSERT INTO TEXTS_NUMBERS (ROWNUMBER, TEXT_0, TEXT_1, TEXT_2, TEXT_3, TEXT_4, TEXT_5, TEXT_6, TEXT_7, TEXT_8, TEXT_9, LANGUAGE)
                   VALUES (5, 'Thousand ', 'Millon ', 'Millon ', 'Zero ', '-', 'One ', 'Two ', 'With ', 'Billon ', 'Trillon ', 2);

SET TERM ^ ;

CREATE OR ALTER PACKAGE TOOLS
AS
begin
  function num_to_letters (num double precision, mode smallint, language smallint) returns varchar (1000);
  function cif (len smallint, string_a varchar(1024), string_b varchar (1024)) returns varchar (2048);
end^

RECREATE PACKAGE BODY TOOLS
AS
begin
  /*==============================================================================
  Loads texts, mode, and language values into the temporary table
  ==============================================================================*/
  procedure load_texts (mode smallint, language smallint)
  as
  begin

    delete
    from texts_numbers_temp;

    insert into texts_numbers_temp (rownumber, text_0, text_1, text_2, text_3, text_4, text_5, text_6, text_7, text_8, text_9)
    select tn.rownumber, tn.text_0, tn.text_1, tn.text_2, tn.text_3, tn.text_4,
    tn.text_5, tn.text_6, tn.text_7, tn.text_8, tn.text_9
    from texts_numbers tn
    where tn.language = :language;

    if (:mode = 1) then
    begin
      update texts_numbers_temp tn1
      set tn1.text_0 =
      (
        select tn2.text_5
        from texts_numbers_temp tn2
        where tn2.rownumber = 5
      )
      where tn1.rownumber = 0;

      update texts_numbers_temp tn1
      set tn1.text_1 =
      (
        select tn2.text_6
        from texts_numbers_temp tn2
        where tn2.rownumber = 5
      )
      where tn1.rownumber = 0;

      update texts_numbers_temp tn1
      set tn1.text_0 =
      (
        select tn2.text_0
        from texts_numbers_temp tn2
        where tn2.rownumber = 4
      )
      where tn1.rownumber = 3;

      update texts_numbers_temp tn1
      set tn1.text_1 =
      (
        select tn2.text_1
        from texts_numbers_temp tn2
        where tn2.rownumber = 4
      )
      where tn1.rownumber = 3;

      update texts_numbers_temp tn1
      set tn1.text_2 =
      (
        select tn2.text_2
        from texts_numbers_temp tn2
        where tn2.rownumber = 4
      )
      where tn1.rownumber = 3;

      update texts_numbers_temp tn1
      set tn1.text_3 =
      (
        select tn2.text_3
        from texts_numbers_temp tn2
        where tn2.rownumber = 4
      )
      where tn1.rownumber = 3;

      update texts_numbers_temp tn1
      set tn1.text_4 =
      (
        select tn2.text_4
        from texts_numbers_temp tn2
        where tn2.rownumber = 4
      )
      where tn1.rownumber = 3;

      update texts_numbers_temp tn1
      set tn1.text_5 =
      (
        select tn2.text_5
        from texts_numbers_temp tn2
        where tn2.rownumber = 4
      )
      where tn1.rownumber = 3;

      update texts_numbers_temp tn1
      set tn1.text_6 =
      (
        select tn2.text_6
        from texts_numbers_temp tn2
        where tn2.rownumber = 4
      )
      where tn1.rownumber = 3;

      update texts_numbers_temp tn1
      set tn1.text_7 =
      (
        select tn2.text_7
        from texts_numbers_temp tn2
        where tn2.rownumber = 4
      )
      where tn1.rownumber = 3;

      update texts_numbers_temp tn1
      set tn1.text_8 =
      (
        select tn2.text_8
        from texts_numbers_temp tn2
        where tn2.rownumber = 4
      )
      where tn1.rownumber = 3;

      update texts_numbers_temp tn1
      set tn1.text_9 =
      (
        select tn2.text_9
        from texts_numbers_temp tn2
        where tn2.rownumber = 4
      )
      where tn1.rownumber = 3;
    end
  end

  /*==============================================================
  Returns the integer value of the number it receives in character
  ==============================================================*/
  function which_num(c char(1)) returns smallint
  as
    declare variable d smallint = 0;
  begin
    d = case c
          when '0' then 0
          when '1' then 1
          when '2' then 2
          when '3' then 3
          when '4' then 4
          when '5' then 5
          when '6' then 6
          when '7' then 7
          when '8' then 8
          when '9' then 9
        end;

    return d;
  end

  /*============================================================================
  Returns the text loaded into the temporary table based on the column that is
  the number parameter, and the row that is the pos parameter
  ============================================================================*/
  function which_text (number smallint, pos smallint) returns varchar(100)
  as
    declare variable return_text varchar(100) = '';
    declare variable sql_statement varchar (256);
  begin
    sql_statement = 'select tnt.text_' || cast(:number as char(1)) || ' from texts_numbers_temp tnt ' ||
                    'where tnt.rownumber = ' || cast(:pos as char(1));

    execute statement :sql_statement into :return_text;

    return :return_text;
  end

  /*============================================================================
  Returns the hundred in text of the number received as a parameter
  =============================================================================*/
  function hundred (text_number varchar (15), pos smallint, letter_number varchar (1000)) returns varchar(1000)
  as
    declare variable ipos smallint;
    declare variable text_aux varchar (100);
    declare variable which_num_aux smallint;
  begin
    if (substring(:text_number from :pos for 1) <> '0') then
    begin
      if (:pos <= 9) then
        ipos = 4;
      else
        ipos = 3;

      if ((substring(:text_number from :pos for 1) = '1') and (substring(:text_number from :pos + 1 for 2) <> '00')) then
        select tnt.text_9
        from texts_numbers_temp tnt
        where tnt.rownumber = :ipos
        into :text_aux;
      else
      begin
        which_num_aux = which_num(substring(:text_number from :pos for 1));
        which_num_aux = :which_num_aux - 1;
        text_aux = which_text(:which_num_aux, :ipos);
      end

      if (trim(:letter_number) <> '') then
        letter_number = :letter_number || :text_aux;
      else
        letter_number = :text_aux;
    end

    return :letter_number;
  end

  /*=================================================================
  Returns the tenth in text of the number received as a parameter
  =================================================================*/
  function tenth (text_number varchar (15), pos smallint, letter_number varchar (1000), language smallint) returns varchar(1000)
  as
    declare variable which_num_aux smallint;
    declare variable text_aux varchar (100);
  begin
    if (substring(:text_number from :pos for 1) <> '0') then
    begin
      if (substring(:text_number from :pos + 1 for 1) = '0') then
      begin
        which_num_aux = which_num(substring(:text_number from :pos for 1));
        which_num_aux = :which_num_aux - 1;
        text_aux = which_text(:which_num_aux, 2);
        letter_number = :letter_number || :text_aux;
      end
      else
      begin
        if (substring(:text_number from :pos for 1) = '1') then
        begin
          which_num_aux = which_num(substring(:text_number from :pos + 1 for 1));
          which_num_aux = :which_num_aux - 1;
          text_aux = which_text(:which_num_aux, 1);
          letter_number = :letter_number || :text_aux;
        end
        else
        begin
          if (substring(:text_number from :pos for 1) = '2') then
          begin
            text_aux = which_text(9, 2);
            letter_number = :letter_number || :text_aux;

            if (:language = 2) then
            begin
              text_aux = which_text(4, 5);
              letter_number = :letter_number || :text_aux;
            end
          end
          else
          begin
            which_num_aux = which_num(substring(:text_number from :pos for 1));
            which_num_aux = :which_num_aux - 1;
            text_aux = which_text(:which_num_aux, 2);
            letter_number = :letter_number || :text_aux;
            text_aux = which_text(4, 5);
            letter_number = :letter_number || :text_aux;
          end
        end
      end
    end

    return :letter_number;
  end

  /*=================================================================
  Returns the unit in text of the number received as a parameter
  =================================================================*/
  function unit (text_number varchar (15), pos smallint, letter_number varchar (1000), language smallint) returns varchar(1000)
  as
    declare variable text_aux varchar (100);
    declare variable which_num_aux smallint;
  begin
    if (not (((substring(:text_number from :pos for 1) = '0') or (substring(:text_number from :pos - 1 for 1) = '1')) or
        ((substring(:text_number from :pos - 1 for 3) = '001') and ((:pos = 6) or (:pos = 12))))) then
    begin
      if ((substring(:text_number from :pos for 1) = '1') and (:pos <= 9)) then
      begin
        if (substring(:text_number from :pos - 1 for 1) = '2') then
        begin
          text_aux = which_text(9, 1);
          letter_number = :letter_number || :text_aux;
        end
        else
        begin
          if (:pos = 9) then
          begin
            text_aux = which_text(9, 0);
            letter_number = :letter_number || :text_aux;
          end
        end
      end
      else
      begin
        if (:pos = 12) then
        begin
          if (substring(:text_number from :pos for 1) = '1') then
          begin
            if (substring(:text_number from :pos - 1 for 1) = '2') then
            begin
              text_aux = which_text(9, 1);
              letter_number = :letter_number || :text_aux;
            end
            else
            begin
              if (substring(:text_number from :pos - 1 for 1) <> '0') then
              begin
                text_aux = which_text(9, 0);
                letter_number = :letter_number || :text_aux;
              end
            end
          end
          else
          begin
            if (substring(:text_number from :pos - 1 for 1) = '2') then
            begin
              which_num_aux = which_num(substring(:text_number from :pos for 1));
              which_num_aux = :which_num_aux - 1;
              text_aux = which_text(:which_num_aux, 0);
              letter_number = :letter_number || lower(:text_aux);
            end
            else
            begin
              which_num_aux = which_num(substring(:text_number from :pos for 1));
              which_num_aux = :which_num_aux - 1;
              text_aux = which_text(:which_num_aux, 0);
              letter_number = :letter_number || :text_aux;
            end
          end
        end
        else
        begin
          if (substring(:text_number from :pos - 1 for 1) = '2') then
          begin
            which_num_aux = which_num(substring(:text_number from :pos for 1));
            which_num_aux = :which_num_aux - 1;
            text_aux = which_text(:which_num_aux, 0);
            letter_number = :letter_number || lower(:text_aux);
          end
          else
          begin
            which_num_aux = which_num(substring(:text_number from :pos for 1));
            which_num_aux = :which_num_aux - 1;
            text_aux = which_text(:which_num_aux, 0);
            letter_number = :letter_number || :text_aux;
          end
        end
      end
    end

    if (:pos = 3) then
    begin
      if (substring(:text_number from 3 for 1) = '1') then
      begin
        text_aux = which_text(9, 0);
        letter_number = :letter_number || :text_aux;

        if (:language = 1) then
          text_aux = which_text(8, 5);
        else
          text_aux = which_text(9, 5);
      end
      else
        text_aux = which_text(9, 5);

      letter_number = :letter_number || :text_aux;
    end

    if ((:pos = 6) or (:pos = 12)) then
    begin
      if (substring(:text_number from :pos - 1 for 3) <> '000') then
      begin
        if (substring(:text_number from :pos for 1) = '1') then
        begin
          if (substring(:text_number from :pos - 1 for 1) = '0') then
          begin
            text_aux = which_text(9, 0);
            letter_number = :letter_number || :text_aux;

            if (:language = 1) then
              text_aux = which_text(0, 5);
            else
            begin
              if (:pos = 6) then
                text_aux = which_text(8, 5);
              else
                text_aux = which_text(0, 5);
            end

            letter_number = :letter_number || :text_aux;
          end
          else
          begin
            text_aux = which_text(0, 5);
            letter_number = :letter_number || :text_aux;
          end
        end
        else
        begin
          if (:language = 1) then
          begin
            text_aux = which_text(0, 5);
            letter_number = :letter_number || :text_aux;
          end
          else
          begin
            if (:pos = 6) then
            begin
              text_aux = which_text(8, 5);
              letter_number = :letter_number || :text_aux;
            end
            else
            begin
              text_aux = which_text(0, 5);
              letter_number = :letter_number || :text_aux;
            end
          end
        end
      end
      else
      begin
        if (substring(:text_number from :pos - 2 for 3) <> '000') then
        begin
          if (:language = 1) then
          begin
            text_aux = which_text(0, 5);
            letter_number = :letter_number || :text_aux;
          end
          else
          begin
            if (:pos = 6) then
            begin
              text_aux = which_text(8, 5);
              letter_number = :letter_number || :text_aux;
            end
            else
            begin
              text_aux = which_text(0, 5);
              letter_number = :letter_number || :text_aux;
            end
          end
        end
      end
    end

    if (:pos = 9) then
    begin
      if (substring(:text_number from 1 for 9) = '000000001') then
      begin
        text_aux = which_text(1, 5);
        letter_number = :letter_number || :text_aux;
      end
      else
      begin
        if (substring(:text_number from 1 for 4) <> '0010') then
        begin
          if (substring(:text_number from 1 for 4) <> '0100') then
          begin
            if (substring(:text_number from 1 for 4) <> '1000') then
            begin
              if (substring(:text_number from 1 for 7) = '0000010') then
              begin
                if (:language = 1) then
                begin
                  text_aux = which_text(2, 5);
                  letter_number = :letter_number || :text_aux;
                end
              end
              else
              begin
                if (:language = 1) then
                begin
                  text_aux = which_text(2, 5);
                  letter_number = :letter_number || :text_aux;
                end
                else
                begin
                  if ((substring(:text_number from 1 for 7) <> '0000100') and
                      (substring(:text_number from 1 for 7) <> '0001000') and
                      (substring(:text_number from 1 for 7) <> '0010000') and
                      (substring(:text_number from 1 for 7) <> '0100000') and
                      (substring(:text_number from 1 for 7) <> '1000000')) then
                  begin
                    text_aux = which_text(2, 5);
                    letter_number = :letter_number || :text_aux;
                  end
                end
              end
            end
          end
        end
      end
    end

    return :letter_number;
  end

  /*============================================================================
  Function that converts the number passed to the equivalent in letters,
  the mode parameter is whether it will be converted to male or female
  and the language.
  ==============================================================================*/
  function num_to_letters (num double precision, mode smallint, language smallint) returns varchar (1000)
  as
    declare variable text_number varchar (15);
    declare variable text_number_aux varchar (15);
    declare variable letter_number varchar (1000);
    declare variable i smallint;
    declare variable length_aux smallint;
    declare variable is_significant_digit smallint;
    declare variable pos_gen smallint;
  begin
    if ((:num > 999999999999999) or (:num < 0)) then
      return 'The number cannot be less than 0 or greater than 999,999,999,999,999';

    if ((:mode < 1) or (:mode > 2)) then
      return 'The mode parameter value must be 1 for male, 2 for female';

    execute procedure load_texts (:mode, :language);

    select trim(trailing '.' from trim(trailing '0' from cast(:num as varchar(17))))
    from rdb$database
    into :text_number_aux;

    length_aux = char_length (:text_number_aux);

    if ((15 - :length_aux) > 0) then
    begin
      i = 1;
      text_number = '';

      while (i <= (15 - length_aux)) do
      begin
        text_number = :text_number ||  '0';
        i = i + 1;
      end

      text_number = :text_number || :text_number_aux;
    end
    else
      text_number = :text_number_aux;

    is_significant_digit = 0;
    pos_gen = 1;
    letter_number = '';

    while (:pos_gen <= 15) do
    begin
      if ((:is_significant_digit = 1) or (substring(:text_number from :pos_gen for 1) <> '0')) then
      begin
        is_significant_digit = 1;

        if (mod((:pos_gen - 1), 3) = 0) then
          letter_number = hundred (:text_number, :pos_gen, :letter_number);

        if (mod((:pos_gen - 1), 3) = 1) then
          letter_number = tenth (:text_number, :pos_gen, :letter_number, :language);

        if (mod((:pos_gen - 1), 3) = 2) then
          letter_number = unit (:text_number, :pos_gen, :letter_number, :language);
      end

      pos_gen = :pos_gen + 1;
    end

    if (trim(:letter_number) = '') then
      letter_number = 'Zero';

    return :letter_number;

  end

  /*=============================================================================================================
  This function is equivalent to the fn cif function in the REFUNC library. It accepts an integer; if it is = 0 or null,
  it returns the string a; otherwise, it returns the string b.
  ===============================================================================================================*/
  function cif (len smallint, string_a varchar(1024), string_b varchar (1024)) returns varchar (2048)
  as
  begin
    if (:len is not null) then
    begin
      if (:len = 0) then
        return :string_a;
      else
        return :string_b;
    end
    else
      return :string_a;
  end
end^

SET TERM ; ^


