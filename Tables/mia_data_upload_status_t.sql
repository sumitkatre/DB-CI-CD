/*
--------------------------------------------------------------
Table Name : MIA_DATA_UPLOAD_STATUS_T 
Description: Table to keep all the Co-Workers statuses related data.
Schema     : MIA_Schema
Revision Hostory:
--------------------------------------------------------------
Date        |  Create By   |  CR/PR/Story   | Description
--------------------------------------------------------------
03-Jul-2020 |  SAMOH22                      | Table Created
--------------------------------------------------------------
*/
CREATE TABLE "MIA_Schema".mia_data_upload_status_t (
	id            SERIAL,
	country       VARCHAR(3) NOT NULL,
	cw_id         VARCHAR(20) NOT NULL,
	upload_status VARCHAR(30) NOT NULL,
	upload_msg    VARCHAR(100),
	created_on    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by    VARCHAR(10) NOT NULL DEFAULT USER
);

ALTER TABLE "MIA_Schema".mia_data_upload_status_t ADD CONSTRAINT mia_data_upload_status_t_pk PRIMARY KEY(id);

COMMENT ON COLUMN "MIA_Schema".mia_data_upload_status_t.id IS 'Unique ID for status.';
COMMENT ON COLUMN "MIA_Schema".mia_data_upload_status_t.country IS 'Country Name.';
COMMENT ON COLUMN "MIA_Schema".mia_data_upload_status_t.cw_id IS 'The persion ID who is uploading the sheet/data.';
COMMENT ON COLUMN "MIA_Schema".mia_data_upload_status_t.upload_status IS 'Data upload status.';
COMMENT ON COLUMN "MIA_Schema".mia_data_upload_status_t.upload_msg IS 'Data upload message if any.';
COMMENT ON COLUMN "MIA_Schema".mia_data_upload_status_t.created_on IS 'When it is created.';
COMMENT ON COLUMN "MIA_Schema".mia_data_upload_status_t.created_by IS 'Who has created the record.';