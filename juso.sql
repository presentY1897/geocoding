DROP TABLE 

CREATE TABLE jibun (
    code varchar(25),
    serial_number varchar(3),
    legal_code varchar(10),
    sido_name varchar(20),
    sigungu_name varchar(20),
    legal_dong_name varchar(20),
    legal_li_name varchar(20),
    bool_moutain varchar(1),
    jibun int,
    jibun_ho int,
    bool_rep int
)
CREATE TABLE roadjuso (
    code varchar(25),
    road_number varchar(25),
    dong_code varchar(2),
    bool_basement varchar(1),
    building_main_code int,
    building_sub_code int,
    basic_area_code varchar(5),
    change_reason_code varchar(2),
    notice_date varchar(8),
    before_road_number varchar(25),
    bool_detail_adress varchar(1)
)
CREATE TABLE roadcode (
    road_number varchar(12),
    road_name VARCHAR(80),
    road_name_roma VARCHAR(80),
    dong_code VARCHAR(2),
    sido_name VARCHAR(20),
    sido_roma_name VARCHAR(40),
    dong_name VARCHAR(20),
    dong_roma_name VARCHAR(40),
    dong_define VARCHAR(1),
    legal_dong_code VARCHAR(3),
    bool_usage VARCHAR(1),
    change_reason_code VARCHAR(1),
    change_history VARCHAR(12),
    notice_date VARCHAR(8),
    end_date VARCHAR(8)
)
COPY roadcode(road_number, road_name, road_name_roma, dong_code, sido_name, sido_roma_name, dong_name, dong_roma_name, dong_define, legal_dong_cod, bool_usage, change_reason_code, change_history, notice_date, end_date)
    FROM '/data/total_address/refine_roadcode_all.txt' WITH DELIMITER '|';
COPY roadjuso (code, road_number, dong_code, bool_basement, building_main_code, building_sub_code, basic_area_code, change_reason_code, notice_date, before_road_number, bool_detail_adress)
    FROM PROGRAM 'cat ./total_address/road_juso/*.txt' WITH DELIMITER '|';
COPY jibun (code, serial_number, legal_code, sido_name, sigungu_name, legal_dong_name, legal_li_name, bool_moutain, jibun, jibun_ho, bool_rep)
    FROM PROGRAM 'cat ./total_address/jibun/*.txt' WITH DELMITER '|';