/*
--------------------------------------------------------------
Table Name : mia_cw_standard_availability_t 
Description: Table to keep all the Co-Workers standard availability related data.
Schema     : 
Revision Hostory:
--------------------------------------------------------------
Date        |  Create By   |  CR/PR/Story   | Description
--------------------------------------------------------------
03-Jul-2020 |  SAMOH22                      | Table Created
20-Nov-2020 |  SAMOH22                      | added updating_flag and recurring_wk_pattern columns
08-Dec-2020 |  SAMOH22                      | added approval_status column
--------------------------------------------------------------
*/
CREATE TABLE "MIA_Schema".mia_cw_standard_availability_t (
    id                      INTEGER default NEXTVAL('"MIA_Schema".mia_cw_satandard_availability_seq'),
	cw_id                   VARCHAR(20),
	availability            VARCHAR(30) NOT NULL,
	weekday                 VARCHAR(10) NOT NULL,
	availability_start_date DATE NOT NULL,
	availability_end_date   DATE NOT NULL,	
	availability_start_time VARCHAR(15),
	availability_end_time   VARCHAR(15),
	recurring_weeks         INTEGER,
	recurring_wk_pattern    BIGINT,
	prefered_qualification  VARCHAR(30),
	prefered_location       VARCHAR(30),	
	approval_status         VARCHAR(15) NOT NULL,
	extra_col1              VARCHAR,
	extra_col2              VARCHAR,
	delete_date             DATE,
	updating_flag           VARCHAR(3),
	created_on              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by              VARCHAR(10) NOT NULL DEFAULT USER,
	updated_on              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by              VARCHAR(10) NOT NULL DEFAULT USER
);

ALTER TABLE "MIA_Schema".mia_cw_standard_availability_t ADD CONSTRAINT cw_standard_availability_pk PRIMARY KEY(id);
ALTER TABLE "MIA_Schema".mia_cw_standard_availability_t ADD CONSTRAINT cw_standard_availability_fk FOREIGN KEY(cw_id) REFERENCES "MIA_Schema".mia_cw_master_data_t (cw_id);
ALTER TABLE "MIA_Schema".mia_cw_standard_availability_t ADD CONSTRAINT cw_standard_availability_status_fk FOREIGN KEY(availability) REFERENCES "MIA_Schema".mia_cw_status_master_data_t (status_id);
ALTER TABLE "MIA_Schema".mia_cw_standard_availability_t ADD CONSTRAINT cw_standard_availa_wekdy_ck CHECK (weekday IN ('Monday','Tuesday','Wednesday', 'Thursday','Friday','Saturday','Sunday'));
ALTER TABLE "MIA_Schema".mia_cw_standard_availability_t ADD CONSTRAINT cw_standard_availa_qual_fk FOREIGN KEY(prefered_qualification) REFERENCES "MIA_Schema".mia_qualification_master_data_t (qualification);

create index upper_std_avail_qlf_indx on "MIA_Schema".mia_cw_standard_availability_t(upper(prefered_qualification));
create index std_avail_start_date_indx on "MIA_Schema".mia_cw_standard_availability_t (availability_start_date);
create index std_avail_end_date_indx on "MIA_Schema".mia_cw_standard_availability_t (availability_end_date);

COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.id IS 'Auto generated ID.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.cw_id IS 'Co-Workers employee ID.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.availability IS 'Co-Workers availability status: Available/Unavailable/Preferred Available/Preferred Not Available.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.weekday IS 'Weekdays.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.recurring_weeks IS 'Co-Workers recurring weeks, NULL=UNLIMITED,1=for 1 week, 2= 2 weeks and so on.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.prefered_qualification IS 'Co-Workers prefered qualification.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.prefered_location IS 'Co-Workers prefered location.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.approval_status IS 'Approval Status.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.availability_start_Date IS 'Co-Workers start Date for the availability.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.availability_end_Date IS 'Co-Workers end Date for the availability.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.availability_start_time IS 'Co-Workers start time for the availability withing the date range.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.availability_end_time IS 'Co-Workers end time for the availability withing the date range.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.delete_date IS 'Delete Date, in case of the record is no more valid.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.updating_flag IS 'Updating status during importing data from excel, which can be update during data load and once complete this value will be NULL.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.created_on IS 'When it is created.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.created_by IS 'Who has created the record.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.updated_on IS 'When it is updated.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_standard_availability_t.updated_by IS 'Who has updated the record.';
