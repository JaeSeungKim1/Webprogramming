from flask import Flask

#Flask 객체 생성
app=Flask(__name__)

@app.route("/")
def root():
    return "Hello!"

@app.route("/test")
def test():
    return "Test..."

# 웹 서버 실행
if __name__ =="__main__":
    app.run(debug=True, host='0.0.0.0',port=5000)