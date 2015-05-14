create table Message (
	id identity,
	sender varchar(20) unique not null,
	receiver varchar(20) not null,
	filePath varchar(120) not null
);