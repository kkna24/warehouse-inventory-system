CREATE TABLE suppliers (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    contact_email VARCHAR(150),
    phone VARCHAR(30),
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ DEFAULT now() NOT NULL
);

CREATE TABLE products(
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    sku VARCHAR(50) NOT NULL UNIQUE,
    name VARCHAR(150) NOT NULL,
    category VARCHAR(80),
    unit_price NUMERIC(12,2) NOT NULL CHECK (unit_price >= 0),
    quantity_on_hand INT NOT NULL DEFAULT 0 CHECK (quantity_on_hand >= 0),
    reorder_level INT NOT NULL CHECK (reorder_level >= 0) DEFAULT 0,
    active BOOLEAN NOT NULL DEFAULT true,
    supplier_id BIGINT REFERENCES suppliers(id),
    version BIGINT NOT NULL DEFAULT 0,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now() ,
    updated_at TIMESTAMPTZ DEFAULT now() NOT NULL
);