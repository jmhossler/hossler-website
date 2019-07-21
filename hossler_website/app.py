from flask import Flask, render_template
from flask_bootstrap import Bootstrap


def create_app():
    app = Flask(__name__)
    Bootstrap(app)
    return app


app = create_app()


@app.route("/")
def hello():
    title = "John's home"
    content = """
Welcome to my simple website! I plan to use this as a playground to try new
things. This webapp is deployed using kubernetes, travis-ci, flask, and bootstrap.
"""
    return render_template("index.html", app_title=title, content=content)


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080, debug=1)
