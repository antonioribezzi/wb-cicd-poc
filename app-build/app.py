from flask import Flask, render_template
app = Flask('hello-Cybernetics!')

@app.route('/')
def hello():
  return "Hello Cybernetics!\n"

@app.route('/version')
def version():
  return render_template('version.html')

if __name__ == '__main__':
  app.run(host = '0.0.0.0', port = 8080)