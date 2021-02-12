/*
--------------------------------------------------------------
Table Name : MIA_CW_MASTER_DATA_T
Description: Table to keep all the Co-Workers master data.
Schema     : 
Revision Hostory:
--------------------------------------------------------------
Date        |  Create By   |  CR/PR/Story   | Description
--------------------------------------------------------------
03-Jul-2020   SAMOH22                         Table Created
09-Nov-2020   SAMOH22      |  HRPP-867      | preferred_language & Secondary_location
--------------------------------------------------------------
*/

-- ##SCHEMA NAME ##--

CREATE TABLE "MIA_Schema".mia_cw_master_data_t(
	cw_login_id             VARCHAR(20) NOT NULL UNIQUE,
	cw_id                   VARCHAR(20),
	cw_name                 VARCHAR(30) NOT NULL,
	cw_email                VARCHAR(40) NOT NULL UNIQUE,
	primary_location        VARCHAR(20) NOT NULL,
	secondary_location      VARCHAR(20),
	cw_country              VARCHAR(2) NOT NULL,
	cw_contract_hours       INTEGER,
	preferred_language      VARCHAR(20),
	extra_column1           VARCHAR(20),
	extra_column2           VARCHAR(20),
	extra_column3           VARCHAR(20),
	status                  VARCHAR(10) NOT NULL,
	cw_store_cost_center_id INTEGER,
	cw_role_id              VARCHAR(15),
	manager_id              VARCHAR(20),
	delete_date             DATE,
	created_on              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by              VARCHAR(10) NOT NULL DEFAULT USER,
	updated_on              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by              VARCHAR(10) NOT NULL DEFAULT USER
);

ALTER TABLE "MIA_Schema".mia_cw_master_data_t ADD CONSTRAINT cw_master_data_pk PRIMARY KEY(cw_id);
ALTER TABLE "MIA_Schema".mia_cw_master_data_t ADD CONSTRAINT cw_master_data_fk FOREIGN KEY(cw_store_cost_center_id) REFERENCES "MIA_Schema".mia_cw_store_master_data_t (store_cost_center_id);
ALTER TABLE "MIA_Schema".mia_cw_master_data_t ADD CONSTRAINT cw_master_data_role_id_fk FOREIGN KEY(cw_role_id) REFERENCES "MIA_Schema".mia_cw_role_master_data_t (role_id);
ALTER TABLE "MIA_Schema".mia_cw_master_data_t ADD CONSTRAINT cw_master_data_ck CHECK (status IN ('Active','Inactive','Deleted'));

--create index upper_email_indx on mia_cw_master_data_t(upper(cw_email));
--create index upper_cw_login_id_indx on mia_cw_master_data_t(upper(cw_login_id));
--create index upper_role_id_indx on mia_cw_master_data_t(upper(cw_role_id));

COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.cw_login_id IS 'Co-Workers login ID.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.cw_id IS 'Co-Workers employee ID.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.cw_name IS 'Co-Workers full name.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.cw_email IS 'Co-Workers email id.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.primary_location IS 'Co-Workers primary location.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.cw_country IS 'Co-Workers primary Country.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.cw_contract_hours IS 'Co-Workers Contract Hours.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.status IS 'Co-Workers status weather ACTIVE or INACTIVE.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.cw_store_cost_center_id IS 'Co-Workers connected to which cost center.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.cw_role_id IS 'What is the role for this co-worker, Role id from role master data table.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.manager_id IS 'What is the managers ID.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.delete_date IS 'Delete Date, in case of the record is no more valid.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.created_on IS 'When it is created.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.created_by IS 'Who has created the record.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.updated_on IS 'When it is updated.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_data_t.updated_by IS 'Who has updated the record.';
