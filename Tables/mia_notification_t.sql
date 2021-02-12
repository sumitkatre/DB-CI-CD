/*
--------------------------------------------------------------
Table Name : MIA_NOTIFICATION_T 
Description: Table to keep all notification related data.
Schema     : 
Revision Hostory:
--------------------------------------------------------------
Date        |  Create By   |  CR/PR/Story   | Description
--------------------------------------------------------------
08-Dec-2020 |  SAMOH22                      | Table Created
--------------------------------------------------------------
*/
CREATE TABLE "MIA_Schema".mia_notification_t (
    id                      INTEGER default NEXTVAL('"MIA_Schema".mia_notification_data_seq'),
	cw_id                   VARCHAR(20),
	availability_type       VARCHAR(5) NOT NULL,
	std_avail_ref           INTEGER,
	inci_avail_ref          INTEGER,
	notification_created_by VARCHAR(20) NOT NULL,
	approved_or_rejected_by VARCHAR(20) NOT NULL,
	is_notification_seen    VARCHAR(20) NOT NULL,
	rejection_msg           VARCHAR(200),
	request_status          VARCHAR(15) NOT NULL,
	extra_col1              VARCHAR,
	extra_col2              VARCHAR,
	delete_date             DATE,
	created_on              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	created_by              VARCHAR(10) NOT NULL DEFAULT USER,
	updated_on              TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_by              VARCHAR(10) NOT NULL DEFAULT USER
);

ALTER TABLE "MIA_Schema".mia_notification_t ADD CONSTRAINT mia_notification_pk PRIMARY KEY(id);
ALTER TABLE "MIA_Schema".mia_notification_t ADD CONSTRAINT mia_notification_t_avail_typ_ck CHECK (availability_type IN ('std','inci'));
ALTER TABLE "MIA_Schema".mia_notification_t ADD CONSTRAINT mia_notification_t_seen_by_ck CHECK (is_notification_seen IN ('true','false'));
ALTER TABLE "MIA_Schema".mia_notification_t ADD CONSTRAINT mia_notification_t_req_status_ck CHECK (request_status IN ('pending','approved','rejected'));
ALTER TABLE "MIA_Schema".mia_notification_t ADD CONSTRAINT mia_notification_std_avail_fk FOREIGN KEY(std_avail_ref) REFERENCES "MIA_Schema".mia_cw_standard_availability_t (id);
ALTER TABLE "MIA_Schema".mia_notification_t ADD CONSTRAINT mia_notification_inci_avail_fk FOREIGN KEY(inci_avail_ref) REFERENCES "MIA_Schema".mia_cw_incidental_availability_t (id);

COMMENT ON COLUMN "MIA_Schema".mia_notification_t.id IS 'Auto generated ID.';
COMMENT ON COLUMN "MIA_Schema".mia_notification_t.cw_id IS 'Co-Workers employee ID.';

