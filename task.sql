-- Table structure for todo_lists
DROP TABLE IF EXISTS todo_lists; --delete table for clean records add 
CREATE TABLE todo_lists (
  id uuid NOT NULL,
  task varchar(60) COLLATE pg_catalog.default NOT NULL DEFAULT 'TASK REQUIRED'::character varying,
  user_task varchar(60) COLLATE pg_catalog.default NOT NULL DEFAULT 'USER REQUIRED'::character varying,
  description text COLLATE pg_catalog.default NOT NULL DEFAULT 'DESCRIPTION  REQUIRED'::text,
  start_date timestamp(6) NOT NULL DEFAULT now(),
  end_date timestamp(6) DEFAULT now(),
  iscompleted bool DEFAULT false,
  create_at timestamp(6)  DEFAULT CURRENT_TIMESTAMP,
  update_at timestamp(6) DEFAULT CURRENT_TIMESTAMP
);

-- Records of todo_lists
INSERT INTO todo_lists VALUES ('cf316fab-a5af-bbe6-65ca-616b381dfff9', 'Telecommunication industry', 'Sylvia Bell', 'eart', '2022-09-22 06:17:41', '2022-09-22 11:29:56', 'f', '2022-09-22 08:13:52', '2022-09-22 02:31:15');
INSERT INTO todo_lists VALUES ('04995d57-ea81-9b45-d4ee-fb07de66da07', 'Catering industry', 'Koyama Kenta', 'Compras', '2022-09-22 15:48:04', '2022-09-22 10:39:15', 'f', '2022-09-22 17:24:45', '2022-09-22 19:26:42');
INSERT INTO todo_lists VALUES ('f0f9784e-f4ea-95a0-23bd-039cce5bcf2b', 'Pharmaceutical industry', 'Nicholas Foster', 'dos', '2022-09-22 09:36:00', '2022-09-22 09:07:30', 't', '2022-09-22 15:09:59', '2022-09-22 15:28:12');
INSERT INTO todo_lists VALUES ('4e739550-f2b0-4932-3702-56cd8d649102', 'Landed property industry', 'Takada Aoi', 'Ccmpras core', '2022-09-22 19:36:36', '2022-09-22 20:13:17', 't', '2022-09-22 12:00:51', '2022-09-22 11:51:11');
INSERT INTO todo_lists VALUES ('4716abee-c311-bdf7-a9ae-ee1c811d2b9b', 'Landed property industry', 'Otsuka Airi', 'uno', '2022-09-22 04:33:45', '2022-09-22 09:46:32', 't', '2022-09-22 12:59:54', '2022-09-22 01:00:14');
INSERT INTO todo_lists VALUES ('4b549bc4-5f8e-f45b-b87d-99517d06237e', 'Manufacturing industry', 'Kondo Aoshi', 'omni-task ', '2022-09-22 05:00:23', '2022-09-22 07:51:47', 'f', '2022-09-22 03:17:27', '2022-09-22 00:04:21');
INSERT INTO todo_lists VALUES ('26249dde-72b0-7b79-ba28-c59b1454c2ff', 'Telecommunication industry', 'Nakayama Seiko', 'cvrt pro', '2022-09-22 17:11:34', '2022-09-22 14:36:12', 'f', '2022-09-22 11:50:33', '2022-09-22 00:01:57');
INSERT INTO todo_lists VALUES ('d66e4b58-8d64-b96a-eb7f-2bf2205c5c52', 'Consulting industry', 'Matsuda Rin', 'Sbopping plus', '2022-09-22 01:06:01', '2022-09-22 13:45:59', 'f', '2022-09-22 02:56:04', '2022-09-22 06:14:34');
INSERT INTO todo_lists VALUES ('9155e50f-eee4-7f6f-5893-d72b601aee36', 'Information technology industry', 'Cindy James', ' varias', '2022-09-22 06:12:04', '2022-09-22 15:27:29', 'f', '2022-09-22 07:12:49', '2022-09-22 21:18:09');
INSERT INTO todo_lists VALUES ('1aac59c7-08ea-848a-f80b-894a75dbd228', 'Manufacturing industry', 'Yamashita Misaki', 'nhe', '2022-09-22 02:52:42', '2022-09-22 13:43:02', 'f', '2022-09-22 13:48:08', '2022-09-22 23:38:18');

-- Indexes structure for table todo_lists
CREATE INDEX todo_lists_user_task_idx ON todo_lists USING btree (
  user_task COLLATE pg_catalog.default pg_catalog.text_ops ASC NULLS LAST
);

-- Primary Key for table todo_lists
ALTER TABLE todo_lists ADD CONSTRAINT todo_lists_pkey PRIMARY KEY (id);

/*  Query all Task */
SELECT
	todo_lists.id, 
	todo_lists.task, 
	todo_lists.user_task, 
	todo_lists.description, 
	to_char( todo_lists.start_date, 'YYYY-MON-DD') as begin, 
 	to_char( todo_lists.end_date, 'YYYY-MON-DD') as end, 
	CASE
    WHEN todo_lists.iscompleted THEN 'Task Complete'
    WHEN todo_lists.iscompleted = false THEN 'Task not Complete'
  END AS estatus,
	todo_lists.create_at, 
	todo_lists.update_at
FROM todo_lists;

-- Query all task Complete 
SELECT
	todo_lists.id, 
	todo_lists.task, 
	todo_lists.user_task, 
	todo_lists.description, 
	to_char( todo_lists.start_date, 'YYYY-MON-DD') as begin, 
 	to_char( todo_lists.end_date, 'YYYY-MON-DD') as end, 
	CASE
    WHEN todo_lists.iscompleted THEN 'Task Complete'
    WHEN todo_lists.iscompleted = false THEN 'Task not Complete'
  END AS estatus,
	todo_lists.create_at, 
	todo_lists.update_at
FROM todo_lists
WHERE todo_lists.iscompleted ;