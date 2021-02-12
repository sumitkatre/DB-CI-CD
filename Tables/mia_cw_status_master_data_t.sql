/*
--------------------------------------------------------------
Table Name : MIA_CW_STATUS_MASTER_DATA_T 
Description: Table to keep all the Co-Workers statuses related data.
Schema     : MIA_Schema
Revision Hostory:
--------------------------------------------------------------
Date        |  Create By   |  CR/PR/Story   | Description
--------------------------------------------------------------
03-Jul-2020 |  SAMOH22                      | Table Created
--------------------------------------------------------------
*/
CREATE TABLE "MIA_Schema".mia_cw_status_master_data_t (
	status_id     VARCHAR(10) NOT NULL,
	status_name   VARCHAR(30) NOT NULL,
	delete_date   DATE,
	created_on    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by    VARCHAR(10) NOT NULL DEFAULT USER,
	updated_on    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by    VARCHAR(10) NOT NULL DEFAULT USER
);

ALTER TABLE "MIA_Schema".mia_cw_status_master_data_t ADD CONSTRAINT mia_cw_status_master_data_pk PRIMARY KEY(status_id);

COMMENT ON COLUMN "MIA_Schema".mia_cw_status_master_data_t.status_id IS 'Unique ID for status.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_status_master_data_t.status_name IS 'Status Name.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_status_master_data_t.delete_date IS 'Delete Date, in case of the record is no more valid.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_status_master_data_t.created_on IS 'When it is created.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_status_master_data_t.created_by IS 'Who has created the record.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_status_master_data_t.updated_on IS 'When it is updated.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_status_master_data_t.updated_by IS 'Who has updated the record.';
