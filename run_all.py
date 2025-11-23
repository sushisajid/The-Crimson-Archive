import subprocess
import os
import shutil

# start Flask
flask_env = os.environ.copy()
flask_env["FLASK_APP"] = "backend/app.py"
flask_env["FLASK_ENV"] = "development"

flask_process = subprocess.Popen(
    ["flask", "run"], env=flask_env
)

npm_path = shutil.which("npm")

# start React
react_process = subprocess.Popen(
    [npm_path, "start"],
    cwd="frontend",  # folder where package.json lives
)

try:
    flask_process.wait()
    react_process.wait()
except KeyboardInterrupt:
    flask_process.terminate()
    react_process.terminate()