import math

from flask import Flask, render_template, request, session
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
from datetime import datetime, timedelta
import os
import json

from werkzeug.utils import redirect

app = Flask(__name__)

with open('config.json', 'r') as c:
    params = json.load(c)['params']
local_server = True

app.config.update(
    MAIL_SERVER="localhost",
    MAIL_PORT="2500",
    SECRET_KEY=os.urandom(12).hex()
    # MAIL_USE_SSL=True,
    # MAIL_USERNAME=params["gmail_user"],
    # MAIL_PASSWORD=params["gmail_password"]
)
mail = Mail(app)
if local_server:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
db = SQLAlchemy(app)


class Contact(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    email = db.Column(db.String(120), nullable=False)
    phone = db.Column(db.String(120), unique=False)
    message = db.Column(db.String(120), unique=False)
    createdAt = db.Column(db.String(120), unique=False)


class Posts(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50), nullable=False)
    post_slug = db.Column(db.String(30), nullable=False)
    content = db.Column(db.String(1000), nullable=False)
    posted_by = db.Column(db.String(50), unique=False)
    date = db.Column(db.String(120), unique=False)


@app.before_request
def make_session_permanent():
    session.permanent = True
    app.permanent_session_lifetime = timedelta(minutes=30)


@app.route('/')
def home():
    post = Posts.query.filter_by().all();
    last = math.floor(len(post))/5;
    page = request.args.get('page')
    if(not str(page).isnumeric()):
        page =1
    page = int(page)
    post = post[(page-1)*5:(page-1)*5+5]

    if page==1:
        prev = '#'
        next = "/?page="+str(page+1)
    elif page == last:
        prev = "/?page=" + str(page - 1)
        next = '#'
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page="+str(page+1)



    return render_template('index.html', params=params, posts=post, session=session , prev = prev, next = next)


@app.route('/about')
def about():
    return render_template('about.html', params=params, session=session)


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if request.method == 'POST':
        print('hello')
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        query = Contact(name=name, email=email, phone=phone, message=message, createdAt=datetime.now())

        db.session.add(query)
        db.session.commit()
        mail.send_message('New message from ' + name,
                          sender=email,
                          recipients=[params['gmail_user']],
                          body=message + "\n" + phone
                          )
    return render_template('contact.html', params=params, session=session)


@app.route('/post/<string:post_slug>', methods=['GET'])
def post_data(post_slug):
    postdates = Posts.query.filter_by(post_slug=post_slug).first()
    return render_template('post.html', params=params, post=postdates, session=session)


@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    if 'user' in session and session['user'] == params['admin_user']:
        allPosts = Posts.query.filter_by().all();
        return render_template('dashboard.html', params=params, session=session, posts=allPosts)
    # print('hello moto')
    if request.method == "POST":
        email = request.form.get('email')
        password = request.form.get('password')
        # print('email : '+email+' Password : '+password)
        print(password)

        if email == params['admin_user'] and password == params['admin_password']:
            session['user'] = email
            print('hello debug')
            allPosts = Posts.query.filter_by().all();
            return render_template('dashboard.html', params=params, session=session, posts=allPosts)
        else:
            return render_template('login.html', params=params, session=session)
    else:
        return render_template('login.html', params=params, session=session)


@app.route('/edit/<string:id>', methods=['GET', 'POST'])
def edit(id):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            title = request.form.get('title')
            post_slug = request.form.get('post_slug')
            post_content = request.form.get('post_content')
            posted_by = request.form.get('posted_by')

            if id == '0':
                post = Posts(title=title, post_slug=post_slug, content=post_content, posted_by=posted_by,
                             date=datetime.now())
                db.session.add(post)
                db.session.commit()
                post_data = Posts.query.filter_by(id=id).first();
                return render_template('edit.html', params=params, session=session, post_id=id, post_data=post_data)
            else:
                print('Adding another post')
                post = Posts.query.filter_by(id=id).first();
                post.title = title
                post.post_slug = post_slug
                post.content = post_content
                post.posted_by = posted_by
                post.date = datetime.now()
                db.session.add(post)
                db.session.commit()
                print('hello')
                return redirect('/edit/' + id)
                post_data = Posts.query.filter_by(id=id).first()
                return render_template('edit.html', params=params, session=session, post_id=id, post_data=post_data)

        print('Post Request Not Detected')
        post_data = Posts.query.filter_by(id=id).first()
        return render_template('edit.html', params=params, session=session, post_id=id, post_data=post_data)
    else:
        return redirect('/dashboard')


@app.route('/delete/<string:id>', methods=['GET', 'POST'])
def delete(id):

    if 'user' in session and session['user'] == params['admin_user']:
        post_data = Posts.query.filter_by(id=id).first()
        db.session.delete(post_data)
        db.session.commit()
    return redirect('/dashboard')


@app.route('/logout')
def logout():
    if 'user' in session and session['user'] == params['admin_user']:
        session.pop('user')
        return redirect('/dashboard')
    return redirect('/')


app.run(debug=True)
