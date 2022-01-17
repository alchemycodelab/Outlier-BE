-- DROP TABLE IF EXISTS auth CASCADE;
DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS topics CASCADE;
DROP TABLE IF EXISTS states CASCADE;
DROP TABLE IF EXISTS resources; 
DROP TABLE IF EXISTS favorites CASCADE;
DROP TABLE IF EXISTS additional_data CASCADE;

-- CREATE TABLE auth (
--   id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--   email TEXT NOT NULL UNIQUE,
--   password_hash TEXT NOT NULL
-- );

CREATE TABLE users (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  email TEXT NOT NULL,
  username TEXT,
  avatar TEXT
);

CREATE TABLE topics (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);


CREATE TABLE states (
  state_name TEXT NOT NULL PRIMARY KEY,
  abrv TEXT UNIQUE NOT NULL
);

CREATE TABLE resources (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  resource_name TEXT NOT NULL,
  resource_URL TEXT NOT NULL,
  state_abrv TEXT,
  FOREIGN KEY (state_abrv) REFERENCES states(abrv),
  topics_id BIGINT,
  FOREIGN KEY (topics_id) REFERENCES topics(id)
);

CREATE TABLE favorites (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  image TEXT NOT NULL,
  user_id BIGINT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  topic_id BIGINT NOT NULL,
  FOREIGN KEY (topic_id) REFERENCES topics(id)
);

CREATE TABLE additional_data (
  id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  data DECIMAL(8,2),
  state TEXT NOT NULL,
  FOREIGN KEY (state) REFERENCES states(abrv),
  topic TEXT NOT NULL,
  FOREIGN KEY (topic) REFERENCES topics(name)
);

INSERT INTO users (email) VALUES('test@email.com');

INSERT INTO topics (name) VALUES 
('Total Homeless Population'),
('Percentage of Total Population Experiencing Homelessness'), 
('LGBT People in Poverty'),
('Percentage of LGBT Population in Poverty');

INSERT INTO states (state_name, abrv) VALUES ('alabama', 'AL'),
('alaska', 'AK'),
('arizona', 'AZ'),
('arkansas', 'AR'),
('california', 'CA'),
('colorado', 'CO'),
('connecticut', 'CT'),
('delaware', 'DE'),
('florida', 'FL'),
('georgia', 'GA'),
('hawaii', 'HI'),
('idaho', 'ID'),
('illinois', 'IL'),
('indiana', 'IN'),
('iowa', 'IA'),
('kansas', 'KS'),
('kentucky', 'KY'),
('louisiana', 'LA'),
('maine', 'ME'),
('maryland', 'MD'),
('massachusetts', 'MA'),
('michigan', 'MI'),
('minnesota', 'MN'),
('mississippi', 'MS'),
('missouri', 'MO'),
('montana', 'MT'),
('nebraska', 'NB'),
('nevada', 'NV'),
('new hampshire', 'NH'),
('new jersey', 'NJ'),
('new mexico', 'NM'),
('new york', 'NY'),
('north carolina', 'NC'),
('north dakota', 'ND'),
('ohio', 'OH'),
('oklahoma', 'OK'),
('oregon', 'OR'),
('pennsylvania', 'PA'),
('rhode island', 'RI'),
('south dakota', 'SD'),
('south carolina', 'SC'),
('tennessee', 'TN'),
('texas', 'TX'),
('utah', 'UT'),
('vermont', 'VT'),
('virginia', 'VA'),
('washington', 'WA'),
('west virginia', 'WV'),
('wisconsin', 'WI'),
('wyoming', 'WY');

-- CREATE TABLE favorites (
--   id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
--   email TEXT NOT NULL,
--   FOREIGN KEY (email) REFERENCES users(email)
-- );

INSERT INTO topics(name)
VALUES ('interesting');


INSERT INTO resources(resource_name, resource_URL, state_abrv, topics_id)
VALUES ('glbtays', 'www.glbtays.org', 'AL', '1');

INSERT INTO additional_data( data, state, topic) VALUES
('3351', 'AL', 'Total Homeless Population'),
('1949', 'AK', 'Total Homeless Population'),
('10979', 'AZ', 'Total Homeless Population'),
('2366', 'AR', 'Total Homeless Population'),
('161548', 'CA', 'Total Homeless Population'),
('9846', 'CO', 'Total Homeless Population'),
('2905', 'CT', 'Total Homeless Population'),
('1165', 'DE', 'Total Homeless Population'),
('27487', 'FL', 'Total Homeless Population'),
('10234', 'GA', 'Total Homeless Population'),
('6458', 'HI', 'Total Homeless Population'),
('2315', 'ID', 'Total Homeless Population'),
('10431', 'IL', 'Total Homeless Population'),
('5625', 'IN', 'Total Homeless Population'),
('2647', 'IA', 'Total Homeless Population'),
('2449', 'KS', 'Total Homeless Population'),
('4011', 'KY', 'Total Homeless Population'),
('3173', 'LA', 'Total Homeless Population'),
('2097', 'ME', 'Total Homeless Population'),
('6360', 'MD', 'Total Homeless Population'),
('17975', 'MA', 'Total Homeless Population'),
('8638', 'MI', 'Total Homeless Population'),
('7940', 'MN', 'Total Homeless Population'),
('1107', 'MS', 'Total Homeless Population'),
('6527', 'MO', 'Total Homeless Population'),
('1545', 'MT', 'Total Homeless Population'),
('2404', 'NB', 'Total Homeless Population'),
('6900', 'NV', 'Total Homeless Population'),
('1675', 'NH', 'Total Homeless Population'),
('9662', 'NJ', 'Total Homeless Population'),
('3333', 'NM', 'Total Homeless Population'),
('91271', 'NY', 'Total Homeless Population'),
('9280', 'NC', 'Total Homeless Population'),
('541', 'ND', 'Total Homeless Population'),
('10655', 'OH', 'Total Homeless Population'),
('3932', 'OK', 'Total Homeless Population'),
('14655', 'OR', 'Total Homeless Population'),
('13375', 'PA', 'Total Homeless Population'),
('1104', 'RI', 'Total Homeless Population'),
('1058', 'SD', 'Total Homeless Population'),
('4287', 'SC', 'Total Homeless Population'),
('7256', 'TN', 'Total Homeless Population'),
('27229', 'TX', 'Total Homeless Population'),
('3131', 'UT', 'Total Homeless Population'),
('1110', 'VT', 'Total Homeless Population'),
('5957', 'VA', 'Total Homeless Population'),
('22923', 'WA', 'Total Homeless Population'),
('1341', 'WV', 'Total Homeless Population'),
('4515', 'WI', 'Total Homeless Population'),
('612', 'WY', 'Total Homeless Population'),
('0.58', 'AL', 'Percentage of Total Population Experiencing Homelessness'),
('0.34', 'AK', 'Percentage of Total Population Experiencing Homelessness'),
('1.9', 'AZ', 'Percentage of Total Population Experiencing Homelessness'),
('0.41', 'AR', 'Percentage of Total Population Experiencing Homelessness'),
('27.89', 'CA', 'Percentage of Total Population Experiencing Homelessness'),
('0.11', 'CO', 'Percentage of Total Population Experiencing Homelessness'),
('0.5', 'CT', 'Percentage of Total Population Experiencing Homelessness'),
('0.2', 'DE', 'Percentage of Total Population Experiencing Homelessness'),
('4.75', 'FL', 'Percentage of Total Population Experiencing Homelessness'),
('1.77', 'GA', 'Percentage of Total Population Experiencing Homelessness'),
('1.11', 'HI', 'Percentage of Total Population Experiencing Homelessness'),
('0.4', 'ID', 'Percentage of Total Population Experiencing Homelessness'),
('1.8', 'IL', 'Percentage of Total Population Experiencing Homelessness'),
('0.97', 'IN', 'Percentage of Total Population Experiencing Homelessness'),
('0.46', 'IA', 'Percentage of Total Population Experiencing Homelessness'),
('0.42', 'KS', 'Percentage of Total Population Experiencing Homelessness'),
('0.69', 'KY', 'Percentage of Total Population Experiencing Homelessness'),
('0.55', 'LA', 'Percentage of Total Population Experiencing Homelessness'),
('0.36', 'ME', 'Percentage of Total Population Experiencing Homelessness'),
('1.1', 'MD', 'Percentage of Total Population Experiencing Homelessness'),
('3.1', 'MA', 'Percentage of Total Population Experiencing Homelessness'),
('1.49', 'MI', 'Percentage of Total Population Experiencing Homelessness'),
('1.37', 'MN', 'Percentage of Total Population Experiencing Homelessness'),
('0.19', 'MS', 'Percentage of Total Population Experiencing Homelessness'),
('1.13', 'MO', 'Percentage of Total Population Experiencing Homelessness'),
('0.27', 'MT', 'Percentage of Total Population Experiencing Homelessness'),
('0.42', 'NB', 'Percentage of Total Population Experiencing Homelessness'),
('1.19', 'NV', 'Percentage of Total Population Experiencing Homelessness'),
('0.29', 'NH', 'Percentage of Total Population Experiencing Homelessness'),
('1.67', 'NJ', 'Percentage of Total Population Experiencing Homelessness'),
('0.58', 'NM', 'Percentage of Total Population Experiencing Homelessness'),
('15.76', 'NY', 'Percentage of Total Population Experiencing Homelessness'),
('1.6', 'NC', 'Percentage of Total Population Experiencing Homelessness'),
('0.09', 'ND', 'Percentage of Total Population Experiencing Homelessness'),
('1.84', 'OH', 'Percentage of Total Population Experiencing Homelessness'),
('0.68', 'OK', 'Percentage of Total Population Experiencing Homelessness'),
('2.53', 'OR', 'Percentage of Total Population Experiencing Homelessness'),
('2.31', 'PA', 'Percentage of Total Population Experiencing Homelessness'),
('0.19', 'RI', 'Percentage of Total Population Experiencing Homelessness'),
('0.18', 'SD', 'Percentage of Total Population Experiencing Homelessness'),
('0.74', 'SC', 'Percentage of Total Population Experiencing Homelessness'),
('1.25', 'TN', 'Percentage of Total Population Experiencing Homelessness'),
('4.7', 'TX', 'Percentage of Total Population Experiencing Homelessness'),
('0.54', 'UT', 'Percentage of Total Population Experiencing Homelessness'),
('0.19', 'VT', 'Percentage of Total Population Experiencing Homelessness'),
('1.03', 'VA', 'Percentage of Total Population Experiencing Homelessness'),
('3.96', 'WA', 'Percentage of Total Population Experiencing Homelessness'),
('0.23', 'WV', 'Percentage of Total Population Experiencing Homelessness'),
('0.78', 'WI', 'Percentage of Total Population Experiencing Homelessness'),
('0.11', 'WY', 'Percentage of Total Population Experiencing Homelessness'),
-- ('null', 'AL', 'LGBT People in Poverty'),
-- ('null', 'AK', 'LGBT People in Poverty'),
-- ('null', 'AZ', 'LGBT People in Poverty'),
-- ('null', 'AR', 'LGBT People in Poverty'),
('223700', 'CA', 'LGBT People in Poverty'),
('21500', 'CO', 'LGBT People in Poverty'),
('14500', 'CT', 'LGBT People in Poverty'),
('3200', 'DE', 'LGBT People in Poverty'),
('7800', 'FL', 'LGBT People in Poverty'),
('34300', 'GA', 'LGBT People in Poverty'),
('8600', 'HI', 'LGBT People in Poverty'),
('7900', 'ID', 'LGBT People in Poverty'),
('73800', 'IL', 'LGBT People in Poverty'),
('44200', 'IN', 'LGBT People in Poverty'),
('12900', 'IA', 'LGBT People in Poverty'),
('10900', 'KS', 'LGBT People in Poverty'),
('26500', 'KY', 'LGBT People in Poverty'),
-- ('null', 'LA', 'LGBT People in Poverty'),
-- ('null', 'ME', 'LGBT People in Poverty'),
('30900', 'MD', 'LGBT People in Poverty'),
('23300', 'MA', 'LGBT People in Poverty'),
-- ('null', 'MI', 'LGBT People in Poverty'),
('15300', 'MN', 'LGBT People in Poverty'),
('10600', 'MS', 'LGBT People in Poverty'),
('25600', 'MO', 'LGBT People in Poverty'),
('5600', 'MT', 'LGBT People in Poverty'),
-- ('null', 'NB', 'LGBT People in Poverty'),
('16100', 'NV', 'LGBT People in Poverty'),
-- ('null', 'NH', 'LGBT People in Poverty'),
-- ('null', 'NJ', 'LGBT People in Poverty'),
-- ('null', 'NM', 'LGBT People in Poverty'),
('105600', 'NY', 'LGBT People in Poverty'),
('45800', 'NC', 'LGBT People in Poverty'),
-- ('null', 'ND', 'LGBT People in Poverty'),
('46600', 'OH', 'LGBT People in Poverty'),
('26800', 'OK', 'LGBT People in Poverty'),
-- ('null', 'OR', 'LGBT People in Poverty'),
('46200', 'PA', 'LGBT People in Poverty'),
('6100', 'RI', 'LGBT People in Poverty'),
-- ('null', 'SD', 'LGBT People in Poverty'),
('17100', 'SC', 'LGBT People in Poverty'),
-- ('null', 'TN', 'LGBT People in Poverty'),
('133300', 'TX', 'LGBT People in Poverty'),
-- ('null', 'UT', 'LGBT People in Poverty'),
('3800', 'VT', 'LGBT People in Poverty'),
('25400', 'VA', 'LGBT People in Poverty'),
('39600', 'WA', 'LGBT People in Poverty'),
('5800', 'WV', 'LGBT People in Poverty'),
('18900', 'WI', 'LGBT People in Poverty'),
('2600', 'WY', 'LGBT People in Poverty'),
-- ('null', 'AL', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'AK', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'AZ', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'AR', 'Percentage of LGBT Population in Poverty'),
('23', 'CA', 'Percentage of LGBT Population in Poverty'),
('18', 'CO', 'Percentage of LGBT Population in Poverty'),
('18', 'CT', 'Percentage of LGBT Population in Poverty'),
('15', 'DE', 'Percentage of LGBT Population in Poverty'),
('07', 'FL', 'Percentage of LGBT Population in Poverty'),
('22', 'GA', 'Percentage of LGBT Population in Poverty'),
('24', 'HI', 'Percentage of LGBT Population in Poverty'),
('28', 'ID', 'Percentage of LGBT Population in Poverty'),
('25', 'IL', 'Percentage of LGBT Population in Poverty'),
('29', 'IN', 'Percentage of LGBT Population in Poverty'),
('24', 'IA', 'Percentage of LGBT Population in Poverty'),
('24', 'KS', 'Percentage of LGBT Population in Poverty'),
('28', 'KY', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'LA', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'ME', 'Percentage of LGBT Population in Poverty'),
('23', 'MD', 'Percentage of LGBT Population in Poverty'),
('13', 'MA', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'MI', 'Percentage of LGBT Population in Poverty'),
('16', 'MN', 'Percentage of LGBT Population in Poverty'),
('29', 'MS', 'Percentage of LGBT Population in Poverty'),
('22', 'MO', 'Percentage of LGBT Population in Poverty'),
('31', 'MT', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'NB', 'Percentage of LGBT Population in Poverty'),
('23', 'NV', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'NH', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'NJ', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'NM', 'Percentage of LGBT Population in Poverty'),
('2', 'NY', 'Percentage of LGBT Population in Poverty'),
('18', 'NC', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'ND', 'Percentage of LGBT Population in Poverty'),
('22', 'OH', 'Percentage of LGBT Population in Poverty'),
('31', 'OK', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'OR', 'Percentage of LGBT Population in Poverty'),
('18', 'PA', 'Percentage of LGBT Population in Poverty'),
('21', 'RI', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'SD', 'Percentage of LGBT Population in Poverty'),
('2', 'SC', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'TN', 'Percentage of LGBT Population in Poverty'),
('28', 'TX', 'Percentage of LGBT Population in Poverty'),
-- ('null', 'UT', 'Percentage of LGBT Population in Poverty'),
('18', 'VT', 'Percentage of LGBT Population in Poverty'),
('17', 'VA', 'Percentage of LGBT Population in Poverty'),
('18', 'WA', 'Percentage of LGBT Population in Poverty'),
('22', 'WV', 'Percentage of LGBT Population in Poverty'),
('16', 'WI', 'Percentage of LGBT Population in Poverty'),
('27', 'WY', 'Percentage of LGBT Population in Poverty');
