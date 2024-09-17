document.addEventListener("DOMContentLoaded", () => {
  console.log("Page chargée, début du script JavaScript");

  const apiKey = "819bf36e600faa8dba5d37abc18ce47b";
  const hash = "a18d492c1d8426fc7647581293cb145e";
  const ts = "1";

  const url = `https://gateway.marvel.com/v1/public/characters?ts=${ts}&apikey=${apiKey}&hash=${hash}`;

  console.log("URL de l'API:", url);

  // Ajoutez un style CSS pour le padding
  const style = document.createElement("style");
  style.innerHTML = `
      .card-body {
        height: 300px
      }
    `;
  document.head.appendChild(style);

  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      console.log("Données reçues de l'API:", data);

      const characters = data.data.results;
      const container = document.getElementById("characters-container");
      console.log("Conteneur trouvé:", container);

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
                </div>
              </div>
            `;
      });

      container.innerHTML = htmlContent;
    })
    .catch((error) => {
      console.error("Erreur lors du chargement des personnages :", error);
      const container = document.getElementById("characters-container");
      container.innerHTML = "<p>Erreur lors du chargement des personnages.</p>";
    });
});
