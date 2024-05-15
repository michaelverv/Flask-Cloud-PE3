import os
import pymysql
basedir = os.path.abspath(os.path.dirname(__file__))

class Config(object):
    SECRET_KEY = 'do-or-do-not-there-is-no-try'
    # SECRET_KEY = os.environ.get('SECRET_KEY') or 'do-or-do-not-there-is-no-try'
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://admin:testtest@database-1.crcicqci0hpe.us-east-1.rds.amazonaws.com:3306'
    SQLALCHEMY_TRACK_MODIFICATIONS = False
