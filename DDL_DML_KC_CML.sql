CREATE SCHEMA TEST_DDL AUTHORIZATION postgres;

-- brand_holdings table
CREATE TABLE TEST_DDL.brand_holdings (
	id_holding VARCHAR(10) NOT NULL, --PK
	name VARCHAR(100) NOT NULL
);

ALTER TABLE TEST_DDL.brand_holdings
ADD CONSTRAINT brand_holdings_PK PRIMARY KEY (id_holding);

INSERT INTO TEST_DDL.brand_holdings (id_holding, name)
VALUES ('001', 'Volkswagen Group');

INSERT INTO TEST_DDL.brand_holdings (id_holding, name)
VALUES ('002', 'General Motors');

INSERT INTO TEST_DDL.brand_holdings (id_holding, name)
VALUES ('003', 'BMW Group');

-- brands table
CREATE TABLE TEST_DDL.brands (
	id_brand varchar(10) NOT NULL, --PK
	name varchar(100) NOT NULL,
	id_holding varchar(10) NOT NULL --FK
);

ALTER TABLE TEST_DDL.brands
ADD CONSTRAINT brands_PK PRIMARY KEY (id_brand);

ALTER TABLE TEST_DDL.brands
ADD CONSTRAINT brands_FK FOREIGN KEY (id_holding)
REFERENCES TEST_DDL.brand_holdings(id_holding);

INSERT INTO TEST_DDL.brands (id_brand, name, id_holding)
VALUES ('001', 'Bugatti', '001');

INSERT INTO TEST_DDL.brands (id_brand, name, id_holding)
VALUES ('002', 'Bentley', '001');

INSERT INTO TEST_DDL.brands (id_brand, name, id_holding)
VALUES ('003', 'Seat', '001');

INSERT INTO TEST_DDL.brands (id_brand, name, id_holding)
VALUES ('004', 'Lamborghini', '001');

INSERT INTO TEST_DDL.brands (id_brand, name, id_holding)
VALUES ('005', 'Cadillac', '002');

INSERT INTO TEST_DDL.brands (id_brand, name, id_holding)
VALUES ('006', 'Chevrolet', '002');

INSERT INTO TEST_DDL.brands (id_brand, name, id_holding)
VALUES ('007', 'BMW', '003');

INSERT INTO TEST_DDL.brands (id_brand, name, id_holding)
VALUES ('008', 'Rolls Royce', '003');

INSERT INTO TEST_DDL.brands (id_brand, name, id_holding)
VALUES ('009', 'Mini', '003');

-- models table
CREATE TABLE TEST_DDL.models (
	id_model VARCHAR(10) NOT NULL, --PK
	name VARCHAR(100) NOT NULL,
	description TEXT NULL,
	id_brand VARCHAR(10) NOT NULL --FK
);

ALTER TABLE TEST_DDL.models
ADD CONSTRAINT models_PK PRIMARY KEY (id_model);

ALTER TABLE TEST_DDL.models
ADD CONSTRAINT models_FK FOREIGN KEY (id_brand)
REFERENCES TEST_DDL.brands(id_brand);

INSERT INTO TEST_DDL.models (id_model, name, id_brand)
VALUES('001', 'Chiron', '001');

INSERT INTO TEST_DDL.models (id_model, name, id_brand)
VALUES('002', 'Divo', '001');

INSERT INTO TEST_DDL.models (id_model, name, id_brand)
VALUES('003', 'Urus', '004');

INSERT INTO TEST_DDL.models (id_model, name, id_brand)
VALUES('004', 'Aventador', '004');

INSERT INTO TEST_DDL.models (id_model, name, id_brand)
VALUES('005', 'Series 8', '007');

INSERT INTO TEST_DDL.models (id_model, name, id_brand)
VALUES('006', 'X6', '007');

INSERT INTO TEST_DDL.models (id_model, name, id_brand)
VALUES('007', 'Phantom', '008');

INSERT INTO TEST_DDL.models (id_model, name, id_brand)
VALUES('008', 'Escalade', '005');

-- colors table
CREATE TABLE TEST_DDL.colors (
	id_color VARCHAR(10) NOT NULL, --PK
	name VARCHAR(100) NOT NULL
);

ALTER TABLE TEST_DDL.colors
ADD CONSTRAINT colors_PK PRIMARY KEY (id_color);

INSERT INTO TEST_DDL.colors (id_color, name)
VALUES ('001', 'White');

INSERT INTO TEST_DDL.colors (id_color, name)
VALUES ('002', 'Black');

INSERT INTO TEST_DDL.colors (id_color, name)
VALUES ('003', 'Gray');

INSERT INTO TEST_DDL.colors (id_color, name)
VALUES ('004', 'Silver');

-- insurance_companies table
CREATE TABLE TEST_DDL.insurance_companies (
	id_ins_co VARCHAR(10) NOT NULL, --PK
	name VARCHAR(100) NOT NULL
);

ALTER TABLE TEST_DDL.insurance_companies
ADD CONSTRAINT insurance_companies_PK PRIMARY KEY (id_ins_co);

INSERT INTO TEST_DDL.insurance_companies(id_ins_co, name)
VALUES ('001', 'Allianz SE');

INSERT INTO TEST_DDL.insurance_companies(id_ins_co, name)
VALUES ('002', 'Berkshire Hathaway Inc');

INSERT INTO TEST_DDL.insurance_companies(id_ins_co, name)
VALUES ('003', 'AXA');

-- insurance table
CREATE TABLE TEST_DDL.insurance (
	id_insurance VARCHAR(10) NOT NULL, --PK
	policy_num VARCHAR(20) NOT NULL,
	description TEXT NULL,
	id_ins_co VARCHAR(10) NOT NULL --FK
);

ALTER TABLE TEST_DDL.insurance
ADD CONSTRAINT insurance_PK PRIMARY KEY (id_insurance);

ALTER TABLE TEST_DDL.insurance
ADD CONSTRAINT insurance_FK FOREIGN KEY (id_ins_co)
REFERENCES TEST_DDL.insurance_companies(id_ins_co);

INSERT INTO TEST_DDL.insurance (id_insurance, policy_num, id_ins_co)
VALUES ('001', 'EJSH2736348', '003');

INSERT INTO TEST_DDL.insurance (id_insurance, policy_num, id_ins_co)
VALUES ('002', 'KJSJ2733014', '003');

INSERT INTO TEST_DDL.insurance (id_insurance, policy_num, id_ins_co)
VALUES ('003', '24HSSJDJDK', '001');

INSERT INTO TEST_DDL.insurance (id_insurance, policy_num, id_ins_co)
VALUES ('004', '21UYSJDJDK', '001');

-- currencies table
CREATE TABLE TEST_DDL.currencies (
	id_currency VARCHAR(10) NOT NULL, --PK
	name VARCHAR(20) NOT NULL
);

ALTER TABLE TEST_DDL.currencies
ADD CONSTRAINT currencies_PK PRIMARY KEY (id_currency);

INSERT INTO TEST_DDL.currencies(id_currency, name)
VALUES ('USD', 'US Dollar');

INSERT INTO TEST_DDL.currencies(id_currency, name)
VALUES ('EUR', 'Euro');

INSERT INTO TEST_DDL.currencies(id_currency, name)
VALUES ('GDP', 'Pound Sterling');

-- vehicle_test table
CREATE TABLE TEST_DDL.vehicle_test (
	id_test VARCHAR(10) NOT NULL, --PK
	km_at_that_time INTEGER NOT NULL,
	dt_test DATE NOT NULL,
	amount FLOAT(2) NOT NULL,
	id_currency VARCHAR(10) NOT NULL --FK
);

ALTER TABLE TEST_DDL.vehicle_test
ADD CONSTRAINT vehicle_test_PK PRIMARY KEY (id_test);

ALTER TABLE TEST_DDL.vehicle_test
ADD CONSTRAINT vehicle_test_FK FOREIGN KEY (id_currency)
REFERENCES TEST_DDL.currencies(id_currency);

INSERT INTO TEST_DDL.vehicle_test (id_test, km_at_that_time, dt_test, amount, id_currency)
VALUES ('001', 48374, '2014-04-27', 39.24, 'EUR');

INSERT INTO TEST_DDL.vehicle_test (id_test, km_at_that_time, dt_test, amount, id_currency)
VALUES ('002', 103642, '2017-05-14', 43.45, 'EUR');

INSERT INTO TEST_DDL.vehicle_test (id_test, km_at_that_time, dt_test, amount, id_currency)
VALUES ('003', 245374, '2018-01-13', 54.89, 'GDP');

INSERT INTO TEST_DDL.vehicle_test (id_test, km_at_that_time, dt_test, amount, id_currency)
VALUES ('004', 23303, '2021-11-17', 67.52, 'EUR');

INSERT INTO TEST_DDL.vehicle_test (id_test, km_at_that_time, dt_test, amount, id_currency)
VALUES ('005', 78303, '2020-09-22', 52.69, 'USD');

-- vehicles table
CREATE TABLE TEST_DDL.vehicles (
	id_vehicle VARCHAR(10) NOT NULL, --PK
	license_plate VARCHAR(7) NOT NULL,
	dt_purchase DATE NOT NULL,
	total_km INTEGER NOT NULL,
	dt_deregistration DATE NOT NULL DEFAULT '4000-01-01',
	description TEXT NULL,
	id_insurance VARCHAR(10) NOT NULL, --FK1
	id_model VARCHAR(10) NOT NULL, --FK2
	id_color VARCHAR(10) NOT NULL --FK3
);

ALTER TABLE TEST_DDL.vehicles
ADD CONSTRAINT vehicles_PK PRIMARY KEY (id_vehicle);

ALTER TABLE TEST_DDL.vehicles
ADD CONSTRAINT vehicles_FK1 FOREIGN KEY (id_insurance)
REFERENCES TEST_DDL.insurance(id_insurance);

ALTER TABLE TEST_DDL.vehicles
ADD CONSTRAINT vehicles_FK2 FOREIGN KEY (id_model)
REFERENCES TEST_DDL.models(id_model);

ALTER TABLE TEST_DDL.vehicles
ADD CONSTRAINT vehicles_FK3 FOREIGN KEY (id_color)
REFERENCES TEST_DDL.colors(id_color);

INSERT INTO TEST_DDL.vehicles (id_vehicle, license_plate, dt_purchase, total_km, id_insurance, id_model, id_color)
VALUES ('001', '6354FOY', '2007-09-17', 578905, '004', '007', '003');

INSERT INTO TEST_DDL.vehicles (id_vehicle, license_plate, dt_purchase, total_km, id_insurance, id_model, id_color)
VALUES ('002', '8373GWT', '2015-02-12', 128374, '003', '007', '002');

INSERT INTO TEST_DDL.vehicles (id_vehicle, license_plate, dt_purchase, total_km, id_insurance, id_model, id_color)
VALUES ('003', '3948ORI', '2009-10-04', 482837, '002', '004', '002');

INSERT INTO TEST_DDL.vehicles (id_vehicle, license_plate, dt_purchase, total_km, dt_deregistration, id_insurance, id_model, id_color)
VALUES ('004', '1792PEO', '2013-07-28', 273843, '2019-11-16', '001', '002', '001');

-- test_history table
CREATE TABLE TEST_DDL.test_history (
	id_vehicle VARCHAR(10) NOT NULL, --PK, FK1
	id_test VARCHAR(10) NOT NULL, --PK, FK2
	description TEXT NULL
);

ALTER TABLE TEST_DDL.test_history
ADD CONSTRAINT test_history_PK PRIMARY KEY (id_vehicle, id_test);

ALTER TABLE TEST_DDL.test_history
ADD CONSTRAINT test_history_FK1 FOREIGN KEY (id_vehicle)
REFERENCES TEST_DDL.vehicles(id_vehicle);

ALTER TABLE TEST_DDL.test_history
ADD CONSTRAINT test_history_FK2 FOREIGN KEY (id_test)
REFERENCES TEST_DDL.vehicle_test(id_test);

INSERT INTO TEST_DDL.test_history (id_vehicle, id_test)
VALUES ('001', '005');

INSERT INTO TEST_DDL.test_history (id_vehicle, id_test)
VALUES ('002', '003');

INSERT INTO TEST_DDL.test_history (id_vehicle, id_test)
VALUES ('003', '001');

INSERT INTO TEST_DDL.test_history (id_vehicle, id_test)
VALUES ('004', '002');