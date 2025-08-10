from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_jwt_extended import JWTManager
from dotenv import load_dotenv
import os

load_dotenv()

db = SQLAlchemy()
migrate = Migrate()
jwt = JWTManager

def cerate_app():
    app = Flask(__name__)
    app.config.from_mapping(
        SQLALCHEMY_DATABASE_URI=os.getenv('DATABASE_URL'),
        SQLALCHEMY_TRACK_MODIFICATIONS=False,
        JWT_SECRET_KEY=os.getenv('JWT_SECRET_KEY')
    )
    
    db.init_app(app)
    migrate.init_app(app, db)
    jwt.init_app(app)
    
    from .routes import auth_bp, glossary_bp
    app.register_blueprint(auth_bp, url_prefix='/api/auth')
    app.register_blueprint(glossary_bp, url_prefix='/api/glossary')
    
    return app
