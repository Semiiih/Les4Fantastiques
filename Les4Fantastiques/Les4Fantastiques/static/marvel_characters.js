document.addEventListener("DOMContentLoaded", () => {
  console.log("Page chargée, début du script JavaScript");

  const apiKey = "819bf36e600faa8dba5d37abc18ce47b";
  const hash = "a18d492c1d8426fc7647581293cb145e";
  const ts = "1";

  const url = `https://gateway.marvel.com/v1/public/characters?ts=${ts}&apikey=${apiKey}&hash=${hash}`;

  // Ajoutez un style CSS pour le padding
  const style = document.createElement("style");
  style.innerHTML = `
        .card-body {
          height: 300px;
        }
        .like-btn {
          position: absolute;
          top: 10px;
          right: 10px;
          background-color: white;
          color: white;
          border: none;
          border-radius: 50%;
          width: 30px;
          height: 30px;
          cursor: pointer;
        }
        .card {
          position: relative;
        }
      `;
  document.head.appendChild(style);

  // Fonction pour ajouter un personnage aux favoris
  function addToFavorites(character) {
    let favorites = JSON.parse(localStorage.getItem("favorites")) || [];
    if (!favorites.some((fav) => fav.id === character.id)) {
      favorites.push(character);
      localStorage.setItem("favorites", JSON.stringify(favorites));
    }
  }

  // Fonction pour créer l'HTML de la carte de personnage
  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      console.log("Données reçues de l'API:", data);

      const characters = data.data.results;
      const container = document.getElementById("characters-container");

      let htmlContent = "";
      characters.forEach((character) => {
        console.log("Ajout du personnage:", character);

        htmlContent += `
            <div class="col-md-3">
              <div class="card mb-4">
                <img src="${character.thumbnail.path}.${
          character.thumbnail.extension
        }" class="card-img-top" alt="${character.name}">
                <div class="card-body">
                  <h5 class="card-title">${character.name}</h5>
                  <p class="card-text">${
                    character.description || "Description non disponible."
                  }</p>
                </div>
                <button class="like-btn" data-id="${character.id}">❤️</button>
              </div>
            </div>
          `;
      });

      container.innerHTML = htmlContent;

      // Ajouter des événements de clic sur chaque bouton "Like"
      document.querySelectorAll(".like-btn").forEach((button) => {
        button.addEventListener("click", (event) => {
          const characterId = event.target.getAttribute("data-id");
          const character = characters.find((char) => char.id == characterId);
          addToFavorites(character);
          alert(`${character.name} ajouté aux favoris!`);
        });
      });
    })
    .catch((error) => {
      console.error("Erreur lors du chargement des personnages :", error);
      const container = document.getElementById("characters-container");
      container.innerHTML = "<p>Erreur lors du chargement des personnages.</p>";
    });
});
