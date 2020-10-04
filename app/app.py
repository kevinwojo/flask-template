import json

from flask import Flask, request
from prometheus_flask_exporter.multiprocess import GunicornPrometheusMetrics

from config.config import Config

app = Flask(__name__)

metrics = GunicornPrometheusMetrics(app)
metrics.info("app_name", "application info", version=Config.APP_VERSION)


@app.route("/health-check")
def health_check():
    return json.dumps({"status": "OK", "version": Config.APP_VERSION})
