from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy
from models import db, User, Platform, Game, InGameCharacter, Map, Mob, StoryArc, Role, Contributor, Clip, Rating, GamesPlatform, GamesCharacter, Appearance, MobMap, GamesContributor
from flask_cors import CORS
from sqlalchemy import event
from sqlalchemy.engine import Engine

app = Flask(__name__)
CORS(app)

# -------- DATABASE CONFIGURATION --------
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres.lyyzjyolipwlhiirjhbc:ILikeWaffles123@aws-1-ap-southeast-2.pooler.supabase.com:5432/postgres'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

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
            "releaseDate": g.releasedate.isoformat() if g.releasedate else None,
            "multiplayerSupport": g.multiplayersupport,
            "gameCoverURL": g.gamecoverurl,
            "gameLogoURL": g.gamelogourl
        } for g in games])

    elif request.method == 'POST':
        data = request.get_json()
        if not data:
            return jsonify({"error": "No input data provided"}), 400

        from datetime import datetime
        releasedate = data.get('releaseDate')
        if releasedate:
            releasedate = datetime.fromisoformat(releasedate)

        new_game = Game(
            title=data.get('title'),
            plotsummary=data.get('plotSummary'),
            releasedate=releasedate,
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
            "email": getattr(u, "email", None),
            "displayName": u.displayname,
            "isDev": getattr(u, "isdev", None),
            "accountCreationDate": u.accountcreationdate.isoformat() if u.accountcreationdate else None
        } for u in users])

    elif request.method == 'POST':
        data = request.get_json()
        new_user = User(
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
        new_char = InGameCharacter(
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
        new_map = Map(
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
        new_mob = Mob(
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
        new_arc = StoryArc(
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
        new_contrib = Contributor(
            contributorname=data.get('contributorName'),
            specialization=data.get('specialization')
        )
        db.session.add(new_contrib)
        db.session.commit()
        return jsonify({"message": "Contributor added", "contributorID": new_contrib.contributorid}), 201

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
        new_clip = Clip(
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
        return jsonify([{
            "ratingID": r.ratingid,
            "gameID": r.gameid,
            "userID": r.userid,
            "rating": r.rating,
            "review": r.review,
            "reviewTimestamp": r.reviewtimestamp.isoformat() if r.reviewtimestamp else None,
            "personalBest": r.personalbest
        } for r in ratings])
    elif request.method == 'POST':
        data = request.get_json()
        new_rating = Rating(
            gameid=data.get('gameID'),
            userid=data.get('userID'),
            rating=data.get('rating'),
            review=data.get('review'),
            personalbest=data.get('personalBest')
        )
        db.session.add(new_rating)
        db.session.commit()
        return jsonify({"message": "Rating added", "ratingID": new_rating.ratingid}), 201

# -------- JUNCTION DATA --------

# games ↔ platforms
@app.route('/GamesPlatform', methods=['POST'])
def add_game_platform():
    data = request.get_json()
    new_row = GamesPlatform (
        gameid=data.get('gameID'),
        platformid=data.get('platformID')
    )
    db.session.add(new_row)
    db.session.commit()
    return jsonify({"message": "relation added", "id": new_row.gameplatformid}), 201

@app.route('/games/<int:game_id>/platforms', methods=['GET'])
def get_platforms_for_game(game_id):
    results = db.session.query(Platform).join(GamesPlatform).filter(GamesPlatform.gameid == game_id).all()
    return jsonify([p.to_dict() for p in results]), 200

@app.route('/platforms/<int:platform_id>/games', methods=['GET'])
def get_games_for_platform(platform_id):
    results = db.session.query(Game).join(GamesPlatform).filter(GamesPlatform.platformid == platform_id).all()
    return jsonify([g.to_dict() for g in results]), 200

# games ↔ characters
@app.route('/GamesCharacters', methods=['POST'])
def add_game_character():
    data = request.get_json()
    new_row = GamesCharacter (
        gameid=data.get('gameID'),
        characterid=data.get('characterID')
    )
    db.session.add(new_row)
    db.session.commit()
    return jsonify({"message": "relation added", "id": new_row.gamecharid}), 201

@app.route('/games/<int:game_id>/characters', methods=['GET'])
def get_characters_for_game(game_id):
    results = db.session.query(InGameCharacter).join(GamesCharacter).filter(GamesCharacter.gameid == game_id).all()
    return jsonify([c.to_dict() for c in results]), 200

@app.route('/characters/<int:character_id>/games', methods=['GET'])
def get_games_for_character(character_id):
    results = db.session.query(Game).join(GamesCharacter).filter(GamesCharacter.characterid == character_id).all()
    return jsonify([g.to_dict() for g in results]), 200

# appearance (special version of game-character)
@app.route('/appearances', methods=['POST'])
def add_appearance():
    data = request.get_json()
    new_row = Appearance (
        gameid=data.get('gameID'),
        characterid=data.get('characterID'),
        firstappearance=data.get('firstAppearance', False),
        isplayable=data.get('isPlayable', False),
        notes=data.get('notes')
    )
    db.session.add(new_row)
    db.session.commit()
    return jsonify({"message": "appearance added", "id": new_row.appearanceid}), 201

@app.route('/games/<int:game_id>/Appearance', methods=['GET'])
def get_Appearance_for_game(game_id):
    results = db.session.query(Appearance, InGameCharacter).join(InGameCharacter).filter(Appearance.gameid == game_id).all()
    data = []
    for appearance, character in results:
        item = appearance.to_dict()
        item["character"] = character.to_dict()
        data.append(item)
    return jsonify(data), 200

@app.route('/characters/<int:character_id>/Appearance', methods=['GET'])
def get_Appearance_for_character(character_id):
    results = db.session.query(Appearance, Game).join(Game).filter(Appearance.characterid == character_id).all()
    data = []
    for appearance, game in results:
        item = appearance.to_dict()
        item["game"] = game.to_dict()
        data.append(item)
    return jsonify(data), 200

# mobs ↔ maps
@app.route('/mobmaps', methods=['POST'])
def add_mob_map():
    data = request.get_json()
    new_row = MobMap (
        mobid=data.get('mobID'),
        mapid=data.get('mapID')
    )
    db.session.add(new_row)
    db.session.commit()
    return jsonify({"message": "relation added", "id": new_row.mmid}), 201

@app.route('/maps/<int:map_id>/mobs', methods=['GET'])
def get_mobs_for_map(map_id):
    results = db.session.query(Mob).join(MobMap).filter(MobMap.mapid == map_id).all()
    return jsonify([m.to_dict() for m in results]), 200

@app.route('/mobs/<int:mob_id>/maps', methods=['GET'])
def get_maps_for_mob(mob_id):
    results = db.session.query(Map).join(MobMap).filter(MobMap.mobid == mob_id).all()
    return jsonify([m.to_dict() for m in results]), 200

# games ↔ contributors ↔ roles
@app.route('/gamescontributors', methods=['POST'])
def add_game_contributor():
    data = request.get_json()
    new_row = GamesContributor (
        gameid=data.get('gameID'),
        contributorid=data.get('contributorID'),
        roleid=data.get('roleID')
    )
    db.session.add(new_row)
    db.session.commit()
    return jsonify({"message": "contributor added to game", "id": new_row.gcid}), 201

@app.route('/games/<int:game_id>/contributors', methods=['GET'])
def get_contributors_for_game(game_id):
    results = db.session.query(GamesContributor, Contributor, Role) \
        .join(Contributor, GamesContributor.contributorid == Contributor.contributorid) \
        .join(Role, GamesContributor.roleid == Role.roleid) \
        .filter(GamesContributor.gameid == game_id).all()

    data = []
    for gc, contributor, role in results:
        item = gc.to_dict()
        item["contributor"] = contributor.to_dict()
        item["role"] = role.to_dict()
        data.append(item)
    return jsonify(data), 200@app.route('/contributors/<int:contributor_id>/games', methods=['GET'])
def get_games_for_contributor(contributor_id):
    results = db.session.query(GamesContributor, Game, Role) \
        .join(Game, GamesContributor.gameid == Game.gameid) \
        .join(Role, GamesContributor.roleid == Role.roleid) \
        .filter(GamesContributor.contributorid == contributor_id).all()

    data = []
    for gc, game, role in results:
        item = gc.to_dict()
        item["game"] = game.to_dict()
        item["role"] = role.to_dict()
        data.append(item)
    return jsonify(data), 200


if __name__ == "__main__":
    app.run(debug=True)