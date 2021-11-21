\c vehicle;

DROP table totalchallan;

create table totalchallan(rc_number varchar primary key, total_amount integer);

INSERT INTO totalchallan(rc_number,total_amount)
SELECT rc_number, sum(fine)
FROM challan 
GROUP BY rc_number;

CREATE OR REPLACE FUNCTION create_total_amount() 
RETURNS TRIGGER LANGUAGE PLPGSQL AS 
$$ 
    BEGIN
        insert into totalchallan values(NEW.rc_number, NEW.fine) ON CONFLICT DO NOTHING;
    RETURN NEW;
    END;
$$;

CREATE OR REPLACE FUNCTION add_tax() 
RETURNS TRIGGER LANGUAGE PLPGSQL AS 
$$ 
    BEGIN
        update totalchallan set total_amount = total_amount+NEW.fine
        where totalchallan.rc_number=NEW.rc_number;
    RETURN NEW;
    END;
$$;

CREATE OR REPLACE FUNCTION inc_total_amount() 
RETURNS TRIGGER LANGUAGE PLPGSQL AS 
$$ 
    BEGIN
        update totalchallan set total_amount = total_amount+NEW.fine
        where totalchallan.rc_number=NEW.rc_number;
    RETURN NEW;
    END;
$$;

CREATE OR REPLACE FUNCTION after_insert() 
RETURNS TRIGGER LANGUAGE PLPGSQL AS 
$$ 
    BEGIN
        PERFORM add_tax();
        PERFORM inc_total_amount();
    RETURN NEW;
    END;
$$;

CREATE OR REPLACE FUNCTION dec_total_amount()
RETURNS TRIGGER LANGUAGE PLPGSQL AS 
$$ 
    BEGIN
        update totalchallan set total_amount = total_amount-OLD.fine 
        where totalchallan.rc_number=OLD.rc_number;
    RETURN NEW;
    END;
$$;


create TRIGGER "after insert"
after
insert on challan
for each row
execute procedure after_insert();

create TRIGGER "decrease total amount"
after
delete on challan
for each row
execute procedure dec_total_amount();

create TRIGGER "create totalamount"
before
insert on challan
for each row
execute procedure create_total_amount();

-- FUNCTIONS WITH CURSORS
CREATE type soh AS (rcno varchar, tamt integer);
CREATE OR REPLACE FUNCTION fetch_total_amount()
RETURNS SETOF soh LANGUAGE PLPGSQL AS
$$ 
    DECLARE
    query_cursor CURSOR FOR SELECT rc_number, sum(fine)
        FROM challan 
        GROUP BY rc_number;
    rec soh;
    BEGIN
        OPEN query_cursor;
        FETCH query_cursor INTO rec.rcno, rec.tamt;
        CLOSE query_cursor;
    RETURN;
    END;
$$;

CREATE type insrnce AS (ins_id varchar, pvrd varchar);
CREATE OR REPLACE FUNCTION fetch_insurance_details()
RETURNS SETOF soh LANGUAGE PLPGSQL AS
$$ 
    DECLARE
    query_cursor CURSOR FOR SELECT ID, Provider
        FROM insurance;
    rec insrnce;
    BEGIN
        OPEN query_cursor;
        FETCH query_cursor INTO rec.ins_id, rec.pvdr;
        CLOSE query_cursor;
    RETURN;
    END;
$$;


-- STORED PROCEDURES WITH TRANSACTIONS
CREATE OR REPLACE PROCEDURE update_insurance_expiry(ins_id varchar)
LANGUAGE PLPGSQL AS
$$ 
    BEGIN
        UPDATE insurance SET Expiry_date='2017-04-30'
        WHERE ID = ins_id;
        COMMIT;
    END;
$$;

CREATE OR REPLACE PROCEDURE update_challan_price()
LANGUAGE PLPGSQL AS
$$ 
    BEGIN
        UPDATE challan SET fine=fine*1.05;
        COMMIT;
    END;
$$;
