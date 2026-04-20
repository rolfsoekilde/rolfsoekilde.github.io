---
layout: default
title: Test af Elev-input
---

# Elev Registrering Test
Dette er en prototype. Prøv at skrive dit navn og en værdi for at se, hvordan JavaScript arbejder i baggrunden.

<div style="background: #eee; padding: 20px; border-radius: 10px;">
    <input type="text" id="elevNavn" placeholder="Elevens navn" style="padding: 5px;">
    <input type="number" id="maaling" placeholder="Måling" style="padding: 5px;">
    <button onclick="testLogik()">Gem lokalt</button>
</div>

<div id="resultat" style="margin-top: 20px; color: green; font-weight: bold;"></div>

<script>
function testLogik() {
    // 1. Hent data fra felterne
    const navn = document.getElementById('elevNavn').value;
    const tal = document.getElementById('maaling').value;
    
    // 2. Lav en lille logisk tjek (ligesom i Python)
    if (navn === "" || tal === "") {
        alert("Husk at udfylde begge felter!");
        return;
    }

    // 3. Vis resultatet på siden med det samme
    const besked = "Registreret: " + navn + " har målt værdien " + tal;
    document.getElementById('resultat').innerText = besked;
    
    // 4. "Print" til konsollen (ligesom print() i Python) - Tryk F12 i browseren for at se det
    console.log("Data gemt i browserens hukommelse:", {navn, tal});
}
</script>

## Hvad sker der her?
Når du trykker på knappen, kører funktionen `testLogik()`. 
I næste skridt kan vi udskifte `console.log` med en funktion, der sender dataene til **Firebase**, så de bliver gemt permanent.
