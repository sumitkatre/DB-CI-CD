/*
--------------------------------------------------------------
Table Name : MIA_WORKLOAD_DATA_T 
Description: Table to keep all the Co-Workers workload related data.
Schema     : 
Revision Hostory:
--------------------------------------------------------------
Date        |  Create By   |  CR/PR/Story   | Description
--------------------------------------------------------------
03-Jul-2020 |  SAMOH22                      | Table Created
--------------------------------------------------------------
*/
CREATE TABLE "MIA_Schema".mia_workload_data_t (
        id                   INTEGER default NEXTVAL('"MIA_Schema".mia_workload_data_seq'),
	store_cost_center_id INTEGER  NOT NULL,
	qualification        VARCHAR(30) NOT NULL,
	req_date             DATE NOT NULL,
	time_id              VARCHAR(10) NOT NULL,
	no_of_person         INTEGER NOT NULL,
	delete_date          DATE,
	created_on           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by           VARCHAR(10) NOT NULL DEFAULT USER,
	updated_on           TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by           VARCHAR(10) NOT NULL DEFAULT USER
);

ALTER TABLE "MIA_Schema".mia_workload_data_t ADD CONSTRAINT mia_workload_data_pk PRIMARY KEY(id);
ALTER TABLE "MIA_Schema".mia_workload_data_t ADD CONSTRAINT mia_workload_data_fk FOREIGN KEY(store_cost_center_id) REFERENCES "MIA_Schema".mia_cw_store_master_data_t (store_cost_center_id);
ALTER TABLE "MIA_Schema".mia_workload_data_t ADD CONSTRAINT mia_workload_data_fromid_fk FOREIGN KEY(time_id) REFERENCES "MIA_Schema".mia_workload_timings_t (ID);
ALTER TABLE "MIA_Schema".mia_workload_data_t ADD CONSTRAINT mia_workload_data_qual_fk FOREIGN KEY(qualification) REFERENCES "MIA_Schema".mia_qualification_master_data_t (qualification);

create index upper_workload_qlf_indx on "MIA_Schema".mia_workload_data_t(upper(qualification));
create index workload_req_date_indx on "MIA_Schema".mia_workload_data_t (req_date);

COMMENT ON COLUMN "MIA_Schema".mia_workload_data_t.id IS 'Timing ID which created manually.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_data_t.store_cost_center_id IS 'Store/Cost center ID.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_data_t.qualification IS 'Qualifications.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_data_t.req_date IS 'The consideration date.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_data_t.time_id IS 'Time ID from workload timings table.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_data_t.no_of_person IS 'Number of person required.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_data_t.delete_date IS 'Delete Date, in case of the record is no more valid.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_data_t.created_on IS 'When it is created.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_data_t.created_by IS 'Who has created the record.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_data_t.updated_on IS 'When it is updated.';
COMMENT ON COLUMN "MIA_Schema".mia_workload_data_t.updated_by IS 'Who has updated the record.';
