
-- Questão 1:
SELECT  
	users.id,
	users.name,
	cities.name AS city
FROM users JOIN cities ON users."cityId" = cities.id WHERE cities.name = 'Rio de Janeiro';

-- Questão 2:
SELECT 
	testimonials.id, 
	"u1".name AS "writer",
	"u2".name AS "recipient",
	message
	FROM testimonials 
JOIN users "u1" ON testimonials."writerId" = "u1".id
JOIN users "u2" ON testimonials."recipientId" = "u2".id;

-- Questão 3:
SELECT 
	educations.id AS id,
	users.name AS name,
	courses.name AS course,
	schools.name AS school,
	educations."endDate" AS "endDate"
FROM educations
JOIN users ON educations."userId" = users.id
JOIN courses ON educations."courseId" = courses.id
JOIN schools ON educations."schoolId" = schools.id
WHERE users.id = 30 AND educations.status = 'finished';

-- Questão 4:
SELECT 
	users.id AS id,
	users.name AS name,
	roles.name AS role,
	companies.name AS company,
	experiences."startDate" as "startDate"
FROM experiences
JOIN users ON experiences."userId" = users.id
JOIN companies ON experiences."companyId" = companies.id
JOIN roles ON experiences."roleId" = roles.id
WHERE users.id = 50 AND experiences."endDate" IS NULL;

-- Questão bonus:
SELECT 
	schools.id AS id,
	schools.name AS school,
	courses.name AS course,
	companies.name AS company,
	roles.name AS role
FROM applicants
JOIN jobs ON applicants."jobId" = jobs.id
JOIN roles ON jobs."roleId" = roles.id
JOIN companies ON jobs."companyId" = companies.id
JOIN educations ON applicants."userId" = educations."userId"
JOIN courses ON educations."courseId" = courses.id
JOIN schools ON educations."schoolId" = schools.id
WHERE (companies.id = 10 AND roles.name = 'Software Engineer' AND jobs.active = true) 
;