from flask import Flask
from flask import request
import glob

app = Flask(__name__)

@app.route("/")
def root():
    files = glob.glob('flask\static\*')
    html = '<html><meta charset="utf-8"><body>'
    html += '<h1>파일 목록</h1>'
    for f in files:
        html += '<p><a href="{0}">{0}</a></p>'.format(f)
    html += '</body></html>'
    return html

@app.route("/flask/static/<filep>")
def file(filep):
    print(request.path,filep)
    html = '<html><meta charset="utf-8"><body>'
    with open('flask/static/'+filep,'rt', encoding='UTF8') as f:
        lines = f.readlines()
        for line in lines:
            html += '<p>{0}</p>'.format(line)
    html += '</body></html>'
    return html

if __name__ == "__main__":
    app.run(debug=True, host='localhost', port=5000)