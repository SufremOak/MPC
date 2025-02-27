# MCO Virtual Personal Computer System (MPC)

Welcome to the MCO Virtual Personal Computer System (MPC) project. This project provides a virtual personal computer system with a shell-like interface and an SDK for interacting with the system.

## Features

- Load and manage configurations
- Initialize and manage hardware components
- Start and shutdown the virtual system
- Execute commands through a shell interface
- Python SDK for programmatic interaction

## Getting Started

### Prerequisites

- GCC (GNU Compiler Collection)
- Cython
- Python 3

### Building the Project

To build the project, you can use the provided `build.ninja` file with the Ninja build system.

1. Install Ninja:
    ```sh
    sudo apt-get install ninja-build
    ```

2. Build the project:
    ```sh
    ninja -f build.ninja
    ```

### Running the MPC

After building the project, you can run the MPC shell:

```sh
./mpc
```

### Using the Python SDK

The Python SDK provides functions to interact with the MPC system programmatically.

```python
from sdk.MCOLibrarySdk import (
    mpc_start,
    mpc_shutdown,
    mpc_load_configuration,
    mpc_initialize_hardware,
    mpc_save_state,
    mpc_release_resources,
    mpc_execute_command,
    mpc_get_configuration,
    mpc_set_configuration
)

# Example usage
mpc_start()
mpc_set_configuration("volume", "50")
volume = mpc_get_configuration("volume")
print(f"Volume: {volume}")
mpc_shutdown()
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.