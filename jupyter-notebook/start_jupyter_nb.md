# Start a Jupyter Notebook on mg

## Steps

1. **SSH tunneling from local host:**
    ```sh
    ssh -L 8888:localhost:8888 user@mg.de
    ```

2. **Activate conda environment with Jupyter on mg:**
    ```sh
    conda activate <hail>
    ```

3. **Start Jupyter Lab on mg:**
    ```sh
    jupyter lab
    ```

4. **Copy Jupyter kernel URL on local host browser:**
    Example: `http://localhost:8888/tree?token=49d004f8...`

## Known issues

- **W:** Make sure that the port in `localhost:<port>` is available.
- **W:** If `SPARK_HOME` is set, it fails with the default config.