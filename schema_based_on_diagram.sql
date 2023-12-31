CREATE TABLE patients(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    date_of_birth DATE,
);

CREATE TABLE treatments(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    type VARCHAR(255),
    name VARCHAR(255),
);

CREATE TABLE medical_histories(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    admitted_at TIMESTAMP,
    patient_id INTEGER,
    status VARCHAR(255),
    CONSTRAINT fk_patient FOREIGN KEY(patient_id) REFERENCES patients(id)
);

CREATE TABLE medical_histories_treatments(
    CONSTRAINT fk_medical_history FOREIGN KEY(medical_history_id) int REFERENCES medical_histories(id),
    CONSTRAINT fk_treatment FOREIGN KEY(treatments_id) int REFERENCES treatments(id),
    PRIMARY KEY (medical histories_id, treatments_id) int
);

CREATE TABLE invoices(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    total_amount DECIMAL(8, 2),
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INTEGER,
    CONSTRAINT fk_medical_history FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    unit_price DECIMAL(8, 2),
    quantity INTEGER,
    total_price DECIMAL(8, 2),
    invoice_id INTEGER,
    treatment_id INTEGER,
    CONSTRAINT fk_treatment FOREIGN KEY(treatment_id) REFERENCES treatment(id),
    CONSTRAINT fk_invoice FOREIGN KEY(invoice_id) REFERENCES invoice(id)
);

CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON medical_histories_treatments (medical_history_id);
CREATE INDEX ON medical_histories_treatments (treatments_id);
CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON invoice_items (treatments_id);
CREATE INDEX ON invoice_items (invoice_id);
