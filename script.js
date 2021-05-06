
let map = L.map('mapid').on('load', onMapLoad).setView([41.400, 2.206], 9);

// NIVELL 3 - Centra mapa en ubicación del usuario
map.locate({setView: true, maxZoom: 17});
	
let tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);

/*	 
	VARIABLES GLOBALES 
*/
let markers = L.markerClusterGroup();
let data_markers = []; 
let foodSelector = document.getElementById("kind_food_selector");


/*	 
	FUNCIÓN PRINCIPAL 
*/
function onMapLoad() {
	console.log("Mapa cargado");
	fillDataMarkers().then( data_markers => {
		renderMarkers(data_markers);
		fillKindsSelector(data_markers);
		foodSelector.addEventListener("change", e => {
			renderSelectedMarkers(data_markers, foodSelector.value);
		});
	});
}

/*	 
	FUNCIONES SECUNDARIAS 
*/

// Rellena el data_markers con una petición a la api
async function fillDataMarkers() {
	let response = await fetch("http://localhost/mapa/api/apiRestaurants.php");
	data_markers = await response.json();
	return data_markers;
}

// Imprime los markers en pantalla con nombre, dirección y foto (NIVELL 2)
function renderMarkers(data_markers) {
	data_markers.forEach( e => {
		markers.addLayer(L.marker([e.lat,e.lng])
			.bindPopup("<p><strong>"+e.name+"</strong><br>"+e.address+"</p><img src="+e.photo+">")); 	
	});
	map.addLayer(markers);
}

// Imprime los markers seleccionados según el selector
function renderSelectedMarkers(data_markers, value) {
	map.removeLayer(markers);
	markers = L.markerClusterGroup();
	data_markers.forEach( e => {
		if (e.kind_food == value || value == "Todos"){
			markers.addLayer(L.marker([e.lat,e.lng])
				.bindPopup("<p><strong>"+e.name+"</strong><br>"+e.address+"</p><img src="+e.photo+">"));
		} 
	});
	map.addLayer(markers);
}

// Añade de forma dinámica en el select los posibles tipos de restaurantes
function fillKindsSelector(data_markers) {
	let foodKinds = [];
	data_markers.forEach(element => {
		if (!foodKinds.includes(element.kind_food)){
			foodKinds.push(element.kind_food);
			foodSelector.add(createOption(element.kind_food));
		}
	});
	foodSelector.add(createOption("Todos"));
}

// Crea una opción nueva para elemento select
function createOption(option) {
	let newOption = document.createElement("option");
	newOption.value = option;
	newOption.text = option;
	return newOption;
}