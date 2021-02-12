/*
--------------------------------------------------------------
Table Name : MIA_CW_FUN_DEPT_MASTER_DATA_T 
Description: Table to keep all functional depart details with the Roles related data.
Schema     : 
Revision Hostory:
--------------------------------------------------------------
Date        |  Create By   |  CR/PR/Story   | Description
--------------------------------------------------------------
03-Jul-2020 |  SAMOH22                      | Table Created
--------------------------------------------------------------
*/
CREATE TABLE "MIA_Schema".mia_cw_fun_dept_master_data_t (
	fun_dept_id          VARCHAR(15),
	fun_dept_name        VARCHAR(50) NOT NULL,
	role_id              VARCHAR(15) NOT NULL,
	country_id           VARCHAR(2) NOT NULL,
	fun_dept_description VARCHAR(200),
	delete_date          DATE,
	created_on           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by           VARCHAR(10) NOT NULL DEFAULT USER,
	updated_on           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by           VARCHAR(10) NOT NULL DEFAULT USER
);

ALTER TABLE "MIA_Schema".mia_cw_fun_dept_master_data_t ADD CONSTRAINT mia_cw_fun_dept_master_data_pk PRIMARY KEY(fun_dept_id);
ALTER TABLE "MIA_Schema".mia_cw_fun_dept_master_data_t ADD CONSTRAINT mia_cw_fun_dept_master_role_id_fk FOREIGN KEY(role_id) REFERENCES "MIA_Schema".mia_cw_role_master_data_t (role_id);

COMMENT ON COLUMN "MIA_Schema".mia_cw_fun_dept_master_data_t.fun_dept_id IS 'Unique ID for funcational department.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_fun_dept_master_data_t.fun_dept_name IS 'Functional department Name.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_fun_dept_master_data_t.role_id IS 'Role id from role master data table.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_fun_dept_master_data_t.country_id IS 'Role belongs to which country.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_fun_dept_master_data_t.fun_dept_description IS 'Functional department Description.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_fun_dept_master_data_t.delete_date IS 'Delete Date, in case of the record is no more valid.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_fun_dept_master_data_t.created_on IS 'When it is created.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_fun_dept_master_data_t.created_by IS 'Who has created the record.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_fun_dept_master_data_t.updated_on IS 'When it is updated.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_fun_dept_master_data_t.updated_by IS 'Who has updated the record.';
