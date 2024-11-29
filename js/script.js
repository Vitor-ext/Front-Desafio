const cardContainer = document.getElementById('cardContainer');
const toggleThemeBtn = document.getElementById('toggleThemeBtn');

let carros = [];

async function loadCars() {
    try {
        const response = await fetch('http://localhost:8080/api/v1/carros/listarCarros');  // URL do servidor de API
        carros = await response.json();
        renderCards();
    } catch (error) {
        console.error('Erro ao carregar carros:', error);
    }
}


function renderCards() {
    cardContainer.innerHTML = '';

    carros.forEach((carro) => {
        const card = document.createElement('div');
        card.className = 'card';

        const image = document.createElement('img');
        image.src = carro.foto || 'https://via.placeholder.com/150'; // Foto do carro
        card.appendChild(image);

        const modelo = document.createElement('h3');
        modelo.textContent = carro.modelo;
        card.appendChild(modelo);

        const marca = document.createElement('p');
        marca.textContent = `Marca: ${carro.marca}`;
        card.appendChild(marca);

        const ano = document.createElement('p');
        ano.textContent = `Ano: ${carro.ano}`;
        card.appendChild(ano);

        const placa = document.createElement('p');
        placa.textContent = `Placa: ${carro.placa}`;
        card.appendChild(placa);

        const cor = document.createElement('p');
        cor.textContent = `Cor: ${carro.cor}`;
        card.appendChild(cor);

        const deleteButton = document.createElement('button');
        deleteButton.textContent = 'Deletar';
        deleteButton.onclick = () => deleteCar(carro.idVeiculo);
        card.appendChild(deleteButton);

        cardContainer.appendChild(card);
    });
}


toggleThemeBtn.addEventListener('click', () => {
    document.body.classList.toggle('dark-theme');
});

async function deleteCar(id) {
    try {
        const response = await fetch(`http://localhost:8080/api/v1/carros/deleteCar/${id}`, {
            method: 'DELETE',
        });

        if (response.ok) {
            loadCars();
        } else {
            console.error('Erro ao deletar carro:', await response.text());
        }
    } catch (error) {
        console.error('Erro ao deletar carro:', error);
    }
}

loadCars();
