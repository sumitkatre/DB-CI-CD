/*
--------------------------------------------------------------
Table Name : MIA_CW_MASTER_QUAL_DATA_T
Description: Table to keep all the Co-Workers qualification data.
Schema     : 
Revision Hostory:
--------------------------------------------------------------
Date        |  Create By   |  CR/PR/Story   | Description
--------------------------------------------------------------
03-Jul-2020 |  SAMOH22                      | Table Created
--------------------------------------------------------------
*/
CREATE TABLE "MIA_Schema".mia_cw_master_qual_data_t(
        id                 INTEGER default NEXTVAL('"MIA_Schema".mia_cw_master_qual_data_seq'),
	cw_id              VARCHAR(20),
	Qualification      VARCHAR(30) NOT NULL,
	Primary_job        VARCHAR(3)  NOT NULL,
	start_date         DATE,
	end_date           DATE,
	secondary_location VARCHAR(20),
	delete_date        DATE,
	created_on         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by         VARCHAR(10) NOT NULL DEFAULT USER,
	updated_on         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by         VARCHAR(10) NOT NULL DEFAULT USER
);

ALTER TABLE "MIA_Schema".mia_cw_master_qual_data_t ADD CONSTRAINT cw_master_qual_data_pk PRIMARY KEY(id);
ALTER TABLE "MIA_Schema".mia_cw_master_qual_data_t ADD CONSTRAINT cw_master_qual_data_uk UNIQUE (cw_id,Qualification,secondary_location);
ALTER TABLE "MIA_Schema".mia_cw_master_qual_data_t ADD CONSTRAINT cw_master_qual_data_fk FOREIGN KEY(cw_id) REFERENCES "MIA_Schema".mia_cw_master_data_t (cw_id);
ALTER TABLE "MIA_Schema".mia_cw_master_qual_data_t ADD CONSTRAINT mia_cw_master_qual_fk FOREIGN KEY(Qualification) REFERENCES "MIA_Schema".mia_qualification_master_data_t (qualification);

COMMENT ON COLUMN "MIA_Schema".mia_cw_master_qual_data_t.id IS 'Auto generated ID.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_qual_data_t.cw_id IS 'Co-Workers employee ID.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_qual_data_t.Qualification IS 'Co-Workers qualifications.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_qual_data_t.Primary_job IS 'Co-Workers primary job.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_qual_data_t.start_date IS 'Co-Workers start date on particular job.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_qual_data_t.end_date IS 'Co-Workers end date on particular job.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_qual_data_t.secondary_location IS 'Co-Workers secondary location.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_qual_data_t.delete_date IS 'Delete Date, in case of the record is no more valid.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_qual_data_t.created_on IS 'When it is created.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_qual_data_t.created_by IS 'Who has created the record.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_qual_data_t.updated_on IS 'When it is updated.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_master_qual_data_t.updated_by IS 'Who has updated the record.';
