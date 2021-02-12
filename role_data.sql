/*
--------------------------------------------------------------
Table Name : MIA_CW_ROLE_MASTER_DATA_T 
Description: Table to keep all Roles related data.
Schema     : MIA_Schema
Revision Hostory:
--------------------------------------------------------------
Date        |  Create By   |  CR/PR/Story   | Description
--------------------------------------------------------------
03-Jul-2020 |  SAMOH22                      | Table Created
--------------------------------------------------------------
*/
CREATE TABLE "MIA_Schema".mia_cw_role_master_data_t (
	role_id          VARCHAR(15),
	role_name        VARCHAR(50) NOT NULL,
	role_hierarchy   INTEGER NOT NULL,
	role_description VARCHAR(200),
	delete_date      DATE,
	created_on       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by       VARCHAR(10) NOT NULL DEFAULT USER,
	updated_on       TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by       VARCHAR(10) NOT NULL DEFAULT USER
);

ALTER TABLE "MIA_Schema".mia_cw_role_master_data_t ADD CONSTRAINT cw_role_master_data_pk PRIMARY KEY(role_id);
ALTER TABLE "MIA_Schema".mia_cw_role_master_data_t ADD CONSTRAINT role_hierarchy_uk UNIQUE (role_hierarchy);

COMMENT ON COLUMN "MIA_Schema".mia_cw_role_master_data_t.role_id IS 'Unique ID for roles.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_role_master_data_t.role_name IS 'Role Name.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_role_master_data_t.role_hierarchy IS 'Role hierarchy,1 is always the highest priority.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_role_master_data_t.role_description IS 'Role Description.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_role_master_data_t.delete_date IS 'Delete Date, in case of the record is no more valid.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_role_master_data_t.created_on IS 'When it is created.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_role_master_data_t.created_by IS 'Who has created the record.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_role_master_data_t.updated_on IS 'When it is updated.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_role_master_data_t.updated_by IS 'Who has updated the record.';
