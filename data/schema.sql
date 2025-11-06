-- Vehicles information table
CREATE TABLE vehicles (
    id INTEGER PRIMARY KEY,
    registration VARCHAR(10) UNIQUE NOT NULL,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    fuel_type VARCHAR(20),
    first_registration_date DATE,
    class VARCHAR(10)
);

-- Test Centre information table
CREATE TABLE test_centres (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255) NOT NULL,
    postcode VARCHAR(10) NOT NULL,
    region VARCHAR(50) NOT NULL,
    contact_number VARCHAR(15)
);

-- MOT Tests table
CREATE TABLE mot_tests (
    id INTEGER PRIMARY KEY,
    vehicle_id INTEGER NOT NULL,
    test_centre_id INTEGER NOT NULL,
    test_date DATE NOT NULL,
    result VARCHAR(10) NOT NULL, --  PASS, FAIL, ADVISORY
    odometer_reading INTEGER,
    vehicle_age_at_test INTEGER,
    examiner_id INTEGER,
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id),
    FOREIGN KEY (test_centre_id) REFERENCES test_centres(id),
    FOREIGN KEY (examiner_id) REFERENCES examiners(id)
);

-- Test Defects table
CREATE TABLE test_defects (
    id INTEGER PRIMARY KEY,
    test_id INTEGER NOT NULL,
    category VARCHAR(50), -- Brakes, Lights, Tyres, etc.
    severity VARCHAR(20), -- DANGEROUS, MAJOR, MINOR, ADVISORY
    description TEXT NOT NULL,
    FOREIGN KEY (test_id) REFERENCES mot_tests(id)
);

-- Examiners table
CREATE TABLE examiners (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    years_of_experience INTEGER,
    centre_id INTEGER,
    FOREIGN KEY (centre_id) REFERENCES test_centres(id)
);