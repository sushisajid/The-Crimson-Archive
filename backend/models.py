from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

db = SQLAlchemy()

# ------------------- games -------------------

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

# ------------------- users -------------------
class User(db.Model):
    __tablename__ = 'users'
    __table_args__ = {'schema': 'crimson'}

    userid = db.Column('userid', db.Integer, primary_key=True)
    username = db.Column('username', db.String(100), unique=True, nullable=False)
    displayname = db.Column('displayname', db.String(100))
    passwordhash = db.Column('passwordhash', db.String(255), nullable=False)
    usertype = db.Column('usertype', db.String(25))  # developer / casual browser
    accountcreationdate = db.Column('accountcreationdate', db.DateTime, default=datetime.utcnow)

    ratings = db.relationship('Rating', backref='user', cascade="all, delete-orphan")


# ------------------- platforms -------------------
class Platform(db.Model):
    __tablename__ = 'platforms'
    __table_args__ = {'schema': 'crimson'}

    platformid = db.Column('platformid', db.Integer, primary_key=True)
    platformname = db.Column('platformname', db.String(50), unique=True, nullable=False)

    games = db.relationship('GamesPlatforms', backref='platform', cascade="all, delete-orphan")


class GamesPlatforms(db.Model):
    __tablename__ = 'games_platforms'
    __table_args__ = {'schema': 'crimson'}

    gameplatformid = db.Column('gameplatformid', db.Integer, primary_key=True)
    gameid = db.Column('gameid', db.Integer, db.ForeignKey('crimson.games.gameid', ondelete='CASCADE'), nullable=False)
    platformid = db.Column('platformid', db.Integer, db.ForeignKey('crimson.platforms.platformid', ondelete='CASCADE'), nullable=False)


# ------------------- characters -------------------
class InGameCharacter(db.Model):
    __tablename__ = 'ingamecharacters'
    __table_args__ = {'schema': 'crimson'}

    characterid = db.Column('characterid', db.Integer, primary_key=True)
    charactername = db.Column('charactername', db.String(100), nullable=False)
    backstory = db.Column('backstory', db.Text)
    description = db.Column('description', db.Text)
    englishva = db.Column('englishva', db.String(100))
    japaneseva = db.Column('japaneseva', db.String(100))
    motioncapture = db.Column('motioncapture', db.String(100))
    spriteurl = db.Column('spriteurl', db.String(2083))

    appearances = db.relationship('Appearance', backref='character', cascade="all, delete-orphan")
    games = db.relationship('GamesCharacters', backref='character', cascade="all, delete-orphan")


class GamesCharacters(db.Model):
    __tablename__ = 'games_characters'
    __table_args__ = {'schema': 'crimson'}

    gamecharid = db.Column('gamecharid', db.Integer, primary_key=True)
    gameid = db.Column('gameid', db.Integer, db.ForeignKey('crimson.games.gameid', ondelete='CASCADE'), nullable=False)
    characterid = db.Column('characterid', db.Integer, db.ForeignKey('crimson.ingamecharacters.characterid', ondelete='CASCADE'), nullable=False)


# ------------------- appearances -------------------
class Appearance(db.Model):
    __tablename__ = 'appearances'
    __table_args__ = {'schema': 'crimson'}

    appearanceid = db.Column('appearanceid', db.Integer, primary_key=True)
    gameid = db.Column('gameid', db.Integer, db.ForeignKey('crimson.games.gameid', ondelete='CASCADE'), nullable=False)
    characterid = db.Column('characterid', db.Integer, db.ForeignKey('crimson.ingamecharacters.characterid', ondelete='CASCADE'), nullable=False)
    firstappearance = db.Column('firstappearance', db.Boolean, default=False)
    isplayable = db.Column('isplayable', db.Boolean, default=False)
    notes = db.Column('notes', db.Text, nullable=False)


# ------------------- maps / mobs -------------------
class Map(db.Model):
    __tablename__ = 'maps'
    __table_args__ = (db.UniqueConstraint('mapid', 'mapname', 'floorname'), {'schema': 'crimson'})

    mapid = db.Column('mapid', db.Integer, primary_key=True)
    gameid = db.Column('gameid', db.Integer, db.ForeignKey('crimson.games.gameid', ondelete='CASCADE'), nullable=False)
    mapname = db.Column('mapname', db.String(100), nullable=False)
    floorname = db.Column('floorname', db.String(50))
    description = db.Column('description', db.Text, nullable=False)
    mapurl = db.Column('mapurl', db.String(2083))

    mobs = db.relationship('MobMaps', backref='map', cascade="all, delete-orphan")


class Mob(db.Model):
    __tablename__ = 'mobs'
    __table_args__ = {'schema': 'crimson'}

    mobid = db.Column('mobid', db.Integer, primary_key=True)
    gameid = db.Column('gameid', db.Integer, db.ForeignKey('crimson.games.gameid', ondelete='CASCADE'), nullable=False)
    mobname = db.Column('mobname', db.String(100), nullable=False)
    mobtype = db.Column('mobtype', db.String(50))
    description = db.Column('description', db.Text)
    weakness = db.Column('weakness', db.Text)
    mobspriteurl = db.Column('mobspriteurl', db.String(2083))
    spawnnotes = db.Column('spawnnotes', db.Text)

    maps = db.relationship('MobMaps', backref='mob', cascade="all, delete-orphan")


class MobMaps(db.Model):
    __tablename__ = 'mob_maps'
    __table_args__ = {'schema': 'crimson'}

    mmid = db.Column('mmid', db.Integer, primary_key=True)
    mobid = db.Column('mobid', db.Integer, db.ForeignKey('crimson.mobs.mobid', ondelete='CASCADE'), nullable=False)
    mapid = db.Column('mapid', db.Integer, db.ForeignKey('crimson.maps.mapid', ondelete='CASCADE'), nullable=False)


# ------------------- story arcs -------------------
class StoryArc(db.Model):
    __tablename__ = 'storyarcs'
    __table_args__ = {'schema': 'crimson'}

    storyarcid = db.Column('storyarcid', db.Integer, primary_key=True)
    gameid = db.Column('gameid', db.Integer, db.ForeignKey('crimson.games.gameid', ondelete='CASCADE'), nullable=False)
    parentarcid = db.Column('parentarcid', db.Integer, db.ForeignKey('crimson.storyarcs.storyarcid', ondelete='SET NULL'), nullable=True)
    arctitle = db.Column('arctitle', db.String(150), nullable=False)
    arcorder = db.Column('arcorder', db.Numeric(5, 2))
    summary = db.Column('summary', db.Text)
    description = db.Column('description', db.Text, nullable=False)
    ismainarc = db.Column('ismainarc', db.Boolean, nullable=False)


# ------------------- roles / contributors -------------------
class Role(db.Model):
    __tablename__ = 'roles'
    __table_args__ = {'schema': 'crimson'}

    roleid = db.Column('roleid', db.Integer, primary_key=True)
    rolename = db.Column('rolename', db.String(50), unique=True, nullable=False)

    contributors = db.relationship('GamesContributors', backref='role', cascade="all, delete-orphan")


class Contributor(db.Model):
    __tablename__ = 'contributors'
    __table_args__ = {'schema': 'crimson'}

    contributorid = db.Column('contributorid', db.Integer, primary_key=True)
    contributorname = db.Column('contributorname', db.String(100), unique=True, nullable=False)
    specialization = db.Column('specialization', db.String(100))

    games = db.relationship('GamesContributors', backref='contributor', cascade="all, delete-orphan")


class GamesContributors(db.Model):
    __tablename__ = 'games_contributors'
    __table_args__ = (db.UniqueConstraint('gameid', 'contributorid', 'roleid'), {'schema': 'crimson'})

    gcid = db.Column('gcid', db.Integer, primary_key=True)
    gameid = db.Column('gameid', db.Integer, db.ForeignKey('crimson.games.gameid', ondelete='CASCADE'), nullable=False)
    contributorid = db.Column('contributorid', db.Integer, db.ForeignKey('crimson.contributors.contributorid', ondelete='CASCADE'), nullable=False)
    roleid = db.Column('roleid', db.Integer, db.ForeignKey('crimson.roles.roleid', ondelete='CASCADE'), nullable=False)


# ------------------- clips -------------------
class Clip(db.Model):
    __tablename__ = 'clips'
    __table_args__ = {'schema': 'crimson'}

    clipid = db.Column('clipid', db.Integer, primary_key=True)
    gameid = db.Column('gameid', db.Integer, db.ForeignKey('crimson.games.gameid', ondelete='CASCADE'), nullable=False)
    cliptitle = db.Column('cliptitle', db.String(100), nullable=False)
    clipurl = db.Column('clipurl', db.String(2083), nullable=False)
    mediatype = db.Column('mediatype', db.String(50))


# ------------------- ratings -------------------
class Rating(db.Model):
    __tablename__ = 'ratings'
    __table_args__ = (db.UniqueConstraint('gameid', 'userid'), {'schema': 'crimson'})

    ratingid = db.Column('ratingid', db.Integer, primary_key=True)
    gameid = db.Column('gameid', db.Integer, db.ForeignKey('crimson.games.gameid', ondelete='CASCADE'), nullable=False)
    userid = db.Column('userid', db.Integer, db.ForeignKey('crimson.users.userid', ondelete='CASCADE'), nullable=False)
    rating = db.Column('rating', db.Integer, nullable=False)
    review = db.Column('review', db.Text)
    reviewtimestamp = db.Column('reviewtimestamp', db.DateTime, default=datetime.utcnow)
    personalbest = db.Column('personalbest', db.String(5))