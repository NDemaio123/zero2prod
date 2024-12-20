## 0.3.0 (2024-12-20)

### Feat

- **database**: use ssl for production environments
- **tracing**: use tracing-actix-web tracing middleware
- **secret**: use secrecy for the database password
- **tracing**: add tracing and terminal logging
- **subscriptions**: add subscription to the database
- **startup**: add postgres connection state
- **configuration**: implement basic configuration options
- **subscriptions**: basic subscriptions implementation

### Fix

- **.gitignore**: remove bacon-locations and add configuration.yaml
- **startup**: change postgres connection to a connection pool

### Refactor

- **subscriptions**: improve tracing span management
- **telemetry**: split telemetry to a separate module
- **main**: use configuration for main
- split library into separate files

## 0.2.0 (2024-12-04)

### Feat

- **health_check**: implemented endpoint and tests
