/*
--------------------------------------------------------------
Table Name : MIA_CW_COSTCENTER_DATA_T
Description: Table to keep all the Co-Workers cost center related data.
Schema     : 
Revision Hostory:
--------------------------------------------------------------
Date        |  Create By   |  CR/PR/Story   | Description
--------------------------------------------------------------
03-Jul-2020 |  SAMOH22                      | Table Created
--------------------------------------------------------------
*/
CREATE TABLE "MIA_Schema".mia_cw_costcenter_data_t(
        id                       INTEGER default NEXTVAL('"MIA_Schema".mia_cw_costcenter_data_seq'),
	cw_id                    VARCHAR(20),
	cw_store_cost_center_id  INTEGER NOT NULL,
	delete_date              DATE,
	created_on               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by               VARCHAR(10) NOT NULL DEFAULT USER,
	updated_on               TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by               VARCHAR(10) NOT NULL DEFAULT USER
);

ALTER TABLE "MIA_Schema".mia_cw_costcenter_data_t ADD CONSTRAINT cw_costcenter_data_pk PRIMARY KEY(id);
ALTER TABLE "MIA_Schema".mia_cw_costcenter_data_t ADD CONSTRAINT cw_costcenter_data_uk UNIQUE(cw_id,cw_store_cost_center_id);
ALTER TABLE "MIA_Schema".mia_cw_costcenter_data_t ADD CONSTRAINT cw_costcenter_data_store_id_fk FOREIGN KEY(cw_store_cost_center_id) REFERENCES "MIA_Schema".mia_cw_store_master_data_t (store_cost_center_id);
ALTER TABLE "MIA_Schema".mia_cw_costcenter_data_t ADD CONSTRAINT cw_costcenter_data_cw_id_fk FOREIGN KEY(cw_id) REFERENCES "MIA_Schema".mia_cw_master_data_t (cw_id);

COMMENT ON COLUMN "MIA_Schema".mia_cw_costcenter_data_t.id IS 'Auto generated ID.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_costcenter_data_t.cw_id IS 'Co-Workers employee ID.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_costcenter_data_t.cw_store_cost_center_id IS 'Co-Workers connected store/cost center id.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_costcenter_data_t.delete_date IS 'Delete Date, in case of the record is no more valid.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_costcenter_data_t.created_on IS 'When it is created.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_costcenter_data_t.created_by IS 'Who has created the record.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_costcenter_data_t.updated_on IS 'When it is updated.';
COMMENT ON COLUMN "MIA_Schema".mia_cw_costcenter_data_t.updated_by IS 'Who has updated the record.';
