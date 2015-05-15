create table Message (
	id identity,
	sender varchar(20) not null,
	receiver varchar(20) not null,
	filePath varchar(120),
	textMessage varchar(120) not null,
);