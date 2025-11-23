from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from models import db, User, Platform, Game, InGameCharacter, Map, Mob, StoryArc, Role, Contributor, Clip, Rating
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# replace with your actual credentials
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:ILikeWaffles123@localhost:5432/theCrimsonArchive'
db.init_app(app)

# -------- GAMES --------

@app.route('/games', methods=['GET', 'POST'])
def handle_games():
    if request.method == 'GET':
        games = Game.query.order_by(Game.gameid.asc()).all()
        return jsonify([{
            "gameID": g.gameid,
            "title": g.title,
            "plotSummary": g.plotsummary,
            "releaseDate": g.releasedate.isoformat(),
            "multiplayerSupport": g.multiplayersupport,
            "gameCoverURL": g.gamecoverurl,
            "gameLogoURL": g.gamelogourl
        } for g in games])

    elif request.method == 'POST':
        data = request.get_json()
        if not data:
            return jsonify({"error": "No input data provided"}), 400

        new_game = Game (
            title=data.get('title'),
            plotsummary=data.get('plotSummary'),
            releasedate=data.get('releaseDate'),
            multiplayersupport=data.get('multiplayerSupport', False),
            gamecoverurl=data.get('gameCoverURL'),
            gamelogourl=data.get('gameLogoURL')
        )
        db.session.add(new_game)
        db.session.commit()

        return jsonify({
            "message": "Game added successfully",
            "gameID": new_game.gameid
        }), 201

# -------- USERS --------

@app.route('/users', methods=['GET', 'POST'])
def handle_users():
    if request.method == 'GET':
        users = User.query.all()
        return jsonify([{
            "userID": u.userid,
            "username": u.username,
            "email": u.email,
            "displayName": u.displayname,
            "isDev": u.isdev,
            "accountCreationDate": u.accountcreationdate.isoformat()
        } for u in users])

    elif request.method == 'POST':
        data = request.get_json()
        new_user = User (
            username=data.get('username'),
            displayname=data.get('displayName'),
            passwordhash=data.get('passwordHash'),
            usertype=data.get('userType')
        )
        db.session.add(new_user)
        db.session.commit()
        return jsonify({"message": "User added", "userID": new_user.userid}), 201

# -------- PLATFORMS --------
  
@app.route('/platforms', methods=['GET', 'POST'])
def handle_platforms():
    if request.method == 'GET':
        platforms = Platform.query.all()
        return jsonify([{"platformID": p.platformid, "platformName": p.platformname} for p in platforms])
    elif request.method == 'POST':
        data = request.get_json()
        new_platform = Platform(platformname=data.get('platformName'))
        db.session.add(new_platform)
        db.session.commit()
        return jsonify({"message": "Platform added", "platformID": new_platform.platformid}), 201

# -------- IN-GAME CHARACTERS --------

@app.route('/characters', methods=['GET', 'POST'])
def handle_characters():
    if request.method == 'GET':
        chars = InGameCharacter.query.all()
        return jsonify([{
            "characterID": c.characterid,
            "characterName": c.charactername,
            "backstory": c.backstory,
            "description": c.description,
            "englishVA": c.englishva,
            "japaneseVA": c.japaneseva,
            "motionCapture": c.motioncapture,
            "spriteURL": c.spriteurl
        } for c in chars])
    elif request.method == 'POST':
        data = request.get_json()
        new_char = InGameCharacter (
            charactername=data.get('characterName'),
            backstory=data.get('backstory'),
            description=data.get('description'),
            englishva=data.get('englishVA'),
            japaneseva=data.get('japaneseVA'),
            motioncapture=data.get('motionCapture'),
            spriteurl=data.get('spriteURL')
        )
        db.session.add(new_char)
        db.session.commit()
        return jsonify({"message": "Character added", "characterID": new_char.characterid}), 201

# -------- MAPS --------

@app.route('/maps', methods=['GET', 'POST'])
def handle_maps():
    if request.method == 'GET':
        maps = Map.query.all()
        return jsonify([{
            "mapID": m.mapid,
            "gameID": m.gameid,
            "mapName": m.mapname,
            "floorName": m.floorname,
            "description": m.description,
            "mapURL": m.mapurl
        } for m in maps])
    elif request.method == 'POST':
        data = request.get_json()
        new_map = Map (
            gameid=data.get('gameID'),
            mapname=data.get('mapName'),
            floorname=data.get('floorName'),
            description=data.get('description'),
            mapurl=data.get('mapURL')
        )
        db.session.add(new_map)
        db.session.commit()
        return jsonify({"message": "Map added", "mapID": new_map.mapid}), 201

# -------- MOBS --------
@app.route('/mobs', methods=['GET', 'POST'])
def handle_mobs():
    if request.method == 'GET':
        mobs = Mob.query.all()
        return jsonify([{
            "mobID": m.mobid,
            "gameID": m.gameid,
            "mobName": m.mobname,
            "mobType": m.mobtype,
            "description": m.description,
            "weakness": m.weakness,
            "mobSpriteURL": m.mobspriteurl,
            "spawnNotes": m.spawnnotes
        } for m in mobs])
    elif request.method == 'POST':
        data = request.get_json()
        new_mob = Mob (
            gameid=data.get('gameID'),
            mobname=data.get('mobName'),
            mobtype=data.get('mobType'),
            description=data.get('description'),
            weakness=data.get('weakness'),
            mobspriteurl=data.get('mobSpriteURL'),
            spawnnotes=data.get('spawnNotes')
        )
        db.session.add(new_mob)
        db.session.commit()
        return jsonify({"message": "Mob added", "mobID": new_mob.mobid}), 201

# -------- STORY ARCS --------
@app.route('/storyarcs', methods=['GET', 'POST'])
def handle_storyarcs():
    if request.method == 'GET':
        arcs = StoryArc.query.all()
        return jsonify([{
            "storyArcID": a.storyarcid,
            "gameID": a.gameid,
            "parentArcID": a.parentarcid,
            "arcTitle": a.arctitle,
            "arcOrder": float(a.arcorder) if a.arcorder else None,
            "summary": a.summary,
            "description": a.description,
            "isMainArc": a.ismainarc
        } for a in arcs])
    elif request.method == 'POST':
        data = request.get_json()
        new_arc = StoryArc (
            gameid=data.get('gameID'),
            parentarcid=data.get('parentArcID'),
            arctitle=data.get('arcTitle'),
            arcorder=data.get('arcOrder'),
            summary=data.get('summary'),
            description=data.get('description'),
            ismainarc=data.get('isMainArc', False)
        )
        db.session.add(new_arc)
        db.session.commit()
        return jsonify({"message": "Story Arc added", "storyArcID": new_arc.storyarcid}), 201

# -------- ROLES --------
@app.route('/roles', methods=['GET', 'POST'])
def handle_roles():
    if request.method == 'GET':
        roles = Role.query.all()
        return jsonify([{"roleID": r.roleid, "roleName": r.rolename} for r in roles])
    elif request.method == 'POST':
        data = request.get_json()
        new_role = Role(rolename=data.get('roleName'))
        db.session.add(new_role)
        db.session.commit()
        return jsonify({"message": "Role added", "roleID": new_role.roleid}), 201

# -------- CONTRIBUTORS --------
@app.route('/contributors', methods=['GET', 'POST'])
def handle_contributors():
    if request.method == 'GET':
        contribs = Contributor.query.all()
        return jsonify([{
            "contributorID": c.contributorid,
            "contributorName": c.contributorname,
            "specialization": c.specialization
        } for c in contribs])
    elif request.method == 'POST':
        data = request.get_json()
        new_contrib = Contributor (
            contributorname=data.get('contributorName'),
            specialization=data.get('specialization')
        )
        db.session.add(new_contrib)
        db.session.commit()
        return jsonify({"message": "Contributor added", "contributorID": new_contrib.contributorid}), 201

# -------- GAMES_CONTRIBUTORS --------
@app.route('/games_contributors', methods=['GET', 'POST'])
def handle_games_contributors():
    if request.method == 'GET':
        gcs = Contributor.query.all()
        return jsonify([{
            "gcID": gc.gcid,
            "gameID": gc.gameid,
            "contributorID": gc.contributorid,
            "roleID": gc.roleid
        } for gc in gcs])
    elif request.method == 'POST':
        data = request.get_json()
        new_gc = Contributor (
            gameid=data.get('gameID'),
            contributorid=data.get('contributorID'),
            roleid=data.get('roleID')
        )
        db.session.add(new_gc)
        db.session.commit()
        return jsonify({"message": "Games_Contributor added", "gcID": new_gc.gcid}), 201

# -------- CLIPS --------
@app.route('/clips', methods=['GET', 'POST'])
def handle_clips():
    if request.method == 'GET':
        clips = Clip.query.all()
        return jsonify([{
            "clipID": c.clipid,
            "gameID": c.gameid,
            "clipTitle": c.cliptitle,
            "clipURL": c.clipurl,
            "mediaType": c.mediatype
        } for c in clips])
    elif request.method == 'POST':
        data = request.get_json()
        new_clip = Clip (
            gameid=data.get('gameID'),
            cliptitle=data.get('clipTitle'),
            clipurl=data.get('clipURL'),
            mediatype=data.get('mediaType')
        )
        db.session.add(new_clip)
        db.session.commit()
        return jsonify({"message": "Clip added", "clipID": new_clip.clipid}), 201

# -------- RATINGS --------
@app.route('/ratings', methods=['GET', 'POST'])
def handle_ratings():
    if request.method == 'GET':
        ratings = Rating.query.all()
        return jsonify ([{
            "ratingID": r.ratingid,
            "gameID": r.gameid,
            "userID": r.userid,
            "rating": r.rating,
            "review": r.review,
            "reviewTimestamp": r.reviewtimestamp.isoformat(),
            "personalBest": r.personalbest
        } for r in ratings])
    elif request.method == 'POST':
        data = request.get_json()
        new_rating = Rating (
            gameid=data.get('gameID'),
            userid=data.get('userID'),
            rating=data.get('rating'),
            review=data.get('review'),
            personalbest=data.get('personalBest')
        )
        db.session.add(new_rating)
        db.session.commit()
        return jsonify({"message": "Rating added", "ratingID": new_rating.ratingid}), 201

if __name__ == "__main__":
    app.run(debug=True)