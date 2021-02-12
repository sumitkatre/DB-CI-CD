/*
--------------------------------------------------------------
Table Name : MIA_QUALIFICATION_MASTER_DATA_T 
Description: Table to keep all the Co-Workers statuses related data.
Schema     : MIA_Schema
Revision Hostory:
--------------------------------------------------------------
Date        |  Create By   |  CR/PR/Story   | Description
--------------------------------------------------------------
03-Jul-2020 |  SAMOH22                      | Table Created
--------------------------------------------------------------
*/
CREATE TABLE "MIA_Schema".mia_qualification_master_data_t (
	id            SERIAL,
	qualification VARCHAR(40) NOT NULL,
	country       VARCHAR(3),
	delete_date   DATE,
	created_on    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by    VARCHAR(10) NOT NULL DEFAULT USER,
	updated_on    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by    VARCHAR(10) NOT NULL DEFAULT USER	
);

ALTER TABLE "MIA_Schema".mia_qualification_master_data_t ADD CONSTRAINT mia_qual_master_data_t_pk PRIMARY KEY(id);
ALTER TABLE "MIA_Schema".mia_qualification_master_data_t ADD CONSTRAINT mia_qual_master_data_t_uk UNIQUE(qualification);

COMMENT ON COLUMN "MIA_Schema".mia_qualification_master_data_t.id IS 'Unique ID for status.';
COMMENT ON COLUMN "MIA_Schema".mia_qualification_master_data_t.country IS 'Country Name.';
COMMENT ON COLUMN "MIA_Schema".mia_qualification_master_data_t.qualification IS 'Qualifications.';
COMMENT ON COLUMN "MIA_Schema".mia_qualification_master_data_t.delete_date IS 'Delete Date, in case of the record is no more valid.';
COMMENT ON COLUMN "MIA_Schema".mia_qualification_master_data_t.created_on IS 'When it is created.';
COMMENT ON COLUMN "MIA_Schema".mia_qualification_master_data_t.created_by IS 'Who has created the record.';
COMMENT ON COLUMN "MIA_Schema".mia_qualification_master_data_t.updated_on IS 'When it is updated.';
COMMENT ON COLUMN "MIA_Schema".mia_qualification_master_data_t.updated_by IS 'Who has updated the record.';