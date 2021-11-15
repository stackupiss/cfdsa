from datetime import datetime
from flask import Flask

from utils import parse_app_opts

cli_opt = parse_app_opts()

app = Flask(__name__)

@app.route("/")
def slash():
   pass

if '__main__' == __name__:
   print(f'Application started on port {cli_opt["port"]} at {datetime.now()}')
   app.run(host='0.0.0.0', port=cli_opt['port'])

