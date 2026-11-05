-- Step 1: Create the core Users table
CREATE TABLE IF NOT EXISTS users (
    user_id BIGINT AUTO_INCREMENT NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    is_enabled BOOLEAN DEFAULT TRUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP NOT NULL,
    PRIMARY KEY (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Step 2: Create the RBAC Roles definition table
CREATE TABLE IF NOT EXISTS roles (
    role_id INT AUTO_INCREMENT NOT NULL,
    role_name VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY (role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Step 3: Create the relational Join Table for Many-to-Many mapping
CREATE TABLE IF NOT EXISTS user_roles (
    user_id BIGINT NOT NULL,
    role_id INT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Step 4: Seed default enterprise operational access levels
INSERT INTO roles (role_name) VALUES ('ROLE_USER') ON DUPLICATE KEY UPDATE role_name=role_name;
INSERT INTO roles (role_name) VALUES ('ROLE_ADMIN') ON DUPLICATE KEY UPDATE role_name=role_name;

-- Step 5: Seed a default administrative user account (Password is pre-hashed: 'Admin@123')
INSERT INTO users (username, email, password_hash, is_enabled) 
VALUES ('admin', 'admin@enterprise.local', '$2a$12$kYgS0B.bY9jPHe3Kz2a1eOph2wYtK69yqR7qWdM7mFwVxZ4hG7nKq', true)
ON DUPLICATE KEY UPDATE username=username;

-- Step 6: Map the seeded administrative user to the 'ROLE_ADMIN' privilege layer
INSERT INTO user_roles (user_id, role_id) 
VALUES (1, 2)
ON DUPLICATE KEY UPDATE user_id=user_id;
