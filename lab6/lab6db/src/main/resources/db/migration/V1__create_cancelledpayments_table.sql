CREATE TABLE cancelledpayments (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    reason TEXT,
    cancelled_at TIMESTAMP
);