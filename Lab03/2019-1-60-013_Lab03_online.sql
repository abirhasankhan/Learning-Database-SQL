-- Query:
-- 1. Find the patients who have “Heart” related problems.
SELECT P.*
FROM patient P, visit V, doctor D
WHERE (V.patientId = P.patientId  AND V.doctorId =  D.doctorId) AND D.specialty = 'Heart'; 

-- 2. Find the patient id and name who visited doctor “Alice Brown” before “20 June 2022”.
SELECT P.patientId, P.patientName
FROM patient P, visit V, doctor D
WHERE (V.patientId = P.patientId  AND V.doctorId =  D.doctorId) AND (D.doctorName = 'Alice Brown' AND V.visitDate < '20 June 2022'); 

-- 3. Find the prescriptions for those patients whose age is greater than 25.
SELECT PR.*
FROM prescription PR, visit V, patient P
WHERE (PR.visitId = V.visitId AND V.patientId = P.patientId) AND (P.patientAge > 25);

-- 4. Find the patients who have visited doctor “Alice Brown” but not doctor “Robin Steve”. Complete the query by using the appropriate set operation.
SELECT P.*
FROM patient P, visit V, doctor D
WHERE (V.patientId = P.patientId  AND V.doctorId =  D.doctorId) AND (D.doctorName = 'Alice Brown' AND D.doctorName != 'Robin Steve'); 

-- 5. Find the doctors who did not consult any patients on “20 June 2022”. Complete the query by using the appropriate set operation.
SELECT D.*
FROM patient P, visit V, doctor D
WHERE (V.patientId = P.patientId  AND V.doctorId =  D.doctorId) AND V.visitDate != '20 June 2022'; 