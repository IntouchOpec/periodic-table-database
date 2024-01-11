ALTER TABLE properties RENAME weigth TO atomic_mass;
ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius;
ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius;
ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL;
ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL;
ALTER TABLE elements ADD UNIQUE (name); 
ALTER TABLE elements ADD UNIQUE (symbol); 
ALTER TABLE elements ADD UNIQUE (atomic_number);
ALTER TABLE elements ALTER COLUMN name SET NOT NULL;
ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL;
ALTER TABLE properties ADD FOREIGN KEY (atomic_number) REFERENCES elements(atomic_number);
CREATE TABLE types (
  type_id SERIAL PRIMARY KEY,
  type VARCHAR(50) NOT NULL
);
INSERT INTO types (type) VALUES ('metal'), ('nonmetal'), ('metalloid');
ALTER TABLE properties ADD COLUMN type_id INT;
ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL;
ALTER TABLE properties ADD FOREIGN KEY (type_id) REFERENCES types(type_id);

INSERT INTO elements (atomic_number, symbol, name) VALUES (9, 'F', 'Fluorine'), (10, 'Ne', 'Neon'); 
INSERT INTO properties (atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id) VALUES 
                      (9, 18.998, -220, -188.1,2), 
                      (10, 20.18, -248.6, -246.1,2); 
ALTER TABLE properties ALTER COLUMN atomic_mass TYPE REAL;
