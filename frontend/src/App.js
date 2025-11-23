import { useEffect, useState } from "react";

function App() {
  const [games, setGames] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    fetch("http://127.0.0.1:5000/games")
      .then((response) => {
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
      })
      .then((data) => {
        setGames(data);
        setLoading(false);
      })
      .catch((err) => {
        console.error("Error fetching games:", err);
        setGames([]);   // prevent crash
        setLoading(false);
      });
  }, []);


  if (loading) return <p>Loading games...</p>;

  return (
    <div style={{ padding: "20px" }}>
      <h1>Games List</h1>
      {games.length === 0 && <p>No games found!</p>}
      {games.map((game) => (
        <div
          key={game.gameID}
          style={{
            border: "1px solid #ccc",
            borderRadius: "8px",
            padding: "10px",
            marginBottom: "10px",
          }}
        >
          <h2>{game.title}</h2>
          <p><strong>Plot:</strong> {game.plotSummary}</p>
          <p><strong>Release Date:</strong> {game.releaseDate}</p>
          <p>
            <strong>Multiplayer:</strong>{" "}
            {game.multiplayerSupport ? "Yes" : "No"}
          </p>
          {game.gameCoverURL && (
            <img
              src={game.gameCoverURL}
              alt={game.title}
              style={{ maxWidth: "200px", display: "block", marginTop: "5px" }}
            />
          )}
        </div>
      ))}
    </div>
  );
}

export default App;