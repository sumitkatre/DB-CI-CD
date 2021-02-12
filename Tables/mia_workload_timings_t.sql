/*
--------------------------------------------------------------
Table Name : MIA_WORKLOAD_TIMINGS_T 
Description: Table to keep all the Co-Workers workload timings related data.
Schema     : 
Revision Hostory:
--------------------------------------------------------------
Date        |  Create By   |  CR/PR/Story   | Description
--------------------------------------------------------------
03-Jul-2020 |  SAMOH22                      | Table Created
--------------------------------------------------------------
*/
CREATE TABLE "MIA_Schema".mia_workload_timings_t (
        id           VARCHAR(10),
	from_time    TIME NOT NULL,
	to_time      TIME NOT NULL,
	delete_date  DATE,
	created_on   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by   VARCHAR(10) NOT NULL DEFAULT USER,
	updated_on   TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by   VARCHAR(10) NOT NULL DEFAULT USER
);

ALTER TABLE "MIA_Schema".mia_workload_timings_t ADD CONSTRAINT mia_workload_timings_pk PRIMARY KEY(id);

COMMENT ON COLUMN "MIA_Schema".mia_workload_timings_t.id IS 'Timing ID which created manually.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_timings_t.from_time IS 'From Time.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_timings_t.to_time IS 'To Time.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_timings_t.delete_date IS 'Delete Date, in case of the record is no more valid.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_timings_t.created_on IS 'When it is created.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_timings_t.created_by IS 'Who has created the record.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_timings_t.updated_on IS 'When it is updated.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_timings_t.updated_by IS 'Who has updated the record.';
