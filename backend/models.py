from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Game(db.Model):
    __tablename__ = 'games'
    __table_args__ = {'schema': 'crimson'}  # important

    gameid = db.Column('gameid', db.Integer, primary_key=True)
    gamecoverurl = db.Column('gamecoverurl', db.String(2083))
    gamelogourl = db.Column('gamelogourl', db.String(2083))
    title = db.Column('title', db.String(100), nullable=False)
    plotsummary = db.Column('plotsummary', db.Text)
    releasedate = db.Column('releasedate', db.Date, nullable=False)
    multiplayersupport = db.Column('multiplayersupport', db.Boolean, nullable=False)