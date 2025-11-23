from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from models import db, Game
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

# replace with your actual credentials
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:ILikeWaffles123@localhost:5432/theCrimsonArchive'
db.init_app(app)

@app.route('/games')
def get_games():
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

if __name__ == "__main__":
    app.run(debug=True)