from flask import Flask
import os
import socket

app = Flask(__name__)


@app.route("/")
def hello():
    html = "<div style='text-align: center'><h3>Hello PyCon!</h3>" \
           "<b>Hostname:</b> {hostname}</div>"
    return html.format(hostname=socket.gethostname())

if __name__ == "__main__":
	app.run(host='0.0.0.0', port=4000)
