CREATE TABLE delhi_metro_trips (
    tripid INT PRIMARY KEY,
    date DATETIME NOT NULL,
    from_station VARCHAR(100) NOT NULL,
    to_station VARCHAR(100) NOT NULL,
    distance_km DECIMAL(6,2) NOT NULL,
    fare DECIMAL(6,2) NOT NULL,
    cost_per_passenger DECIMAL(6,2) NOT NULL,
    passengers INT NULL,
    ticket_type VARCHAR(50) NOT NULL,
    remarks TEXT NOT NULL
);

-- Index for faster route queries
CREATE INDEX idx_route 
ON delhi_metro_trips (from_station, to_station);

-- Constraint to prevent same station routes
ALTER TABLE delhi_metro_trips
ADD CONSTRAINT chk_station_diff 
CHECK (from_station <> to_station);

-- Constraint to ensure valid numeric values
ALTER TABLE delhi_metro_trips
ADD CONSTRAINT chk_positive_values
CHECK (
    distance_km > 0 AND
    fare >= 0 AND
    cost_per_passenger >= 0 AND
    passengers >= 0
);
