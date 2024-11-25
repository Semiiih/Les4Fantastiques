document.addEventListener("DOMContentLoaded", () => {
  console.log("Page chargée, début du script JavaScript");

  const apiKey = "819bf36e600faa8dba5d37abc18ce47b";
  const hash = "a18d492c1d8426fc7647581293cb145e";
  const ts = "1";

  const url = `https://gateway.marvel.com:443/v1/public/series?ts=${ts}&apikey=${apiKey}&hash=${hash}`;

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

  /////////////////// Fonction pour ajouter une série aux favoris ///////////////////
  function addSeriesToFavorites(serie) {
    let favoritesSeries =
      JSON.parse(localStorage.getItem("favoritesSeries")) || [];
    if (!favoritesSeries.some((fav) => fav.id === serie.id)) {
      favoritesSeries.push(serie);
      localStorage.setItem("favoritesSeries", JSON.stringify(favoritesSeries));
      alert(`${serie.title} ajouté aux favoris!`);
    } else {
      alert(`${serie.title} est déjà dans vos favoris.`);
    }
  }

  /////////////////// Fonction pour afficher les séries depuis l'API ///////////////////
  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      console.log("Données reçues de l'API:", data);

      const series = data.data.results;
      const container = document.getElementById("series-container");

      let htmlContent = "";
      series.forEach((serie) => {
        // Filtrer les séries sans image
        if (
          !serie.thumbnail ||
          !serie.thumbnail.path ||
          !serie.thumbnail.extension ||
          serie.thumbnail.path.includes("image_not_available")
        ) {
          return; // Ignore cette série
        }

        console.log("Ajout de la série:", serie);

        htmlContent += `
            <div class="col-md-3">
              <div class="card mb-4">
                <img src="${serie.thumbnail.path}.${
          serie.thumbnail.extension
        }" class="card-img-top" alt="${serie.title}">
                <div class="card-body">
                  <h5 class="card-title">${serie.title}</h5>
                  <p class="card-text">${
                    serie.description || "Description non disponible."
                  }</p>
                </div>
                <button class="like-btn" data-id="${serie.id}">❤️</button>
              </div>
            </div>
          `;
      });

      container.innerHTML = htmlContent;

      /////////////////// Ajouter des événements de clic sur chaque bouton Like ///////////////////
      document.querySelectorAll(".like-btn").forEach((button) => {
        button.addEventListener("click", (event) => {
          const serieId = event.target.getAttribute("data-id");
          const serie = series.find((ser) => ser.id == serieId);
          addSeriesToFavorites(serie); // Appel correct de la fonction
        });
      });
    })
    .catch((error) => {
      console.error("Erreur lors du chargement des séries :", error);
      const container = document.getElementById("series-container");
      container.innerHTML = "<p>Erreur lors du chargement des séries.</p>";
    });
});
