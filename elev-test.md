---
layout: default
title: Elev Registrering App
---

# Elev Målinger
Brug formularen herunder til at registrere dine data. Tallene bliver gemt direkte i vores Firebase-database.

<div style="background: white; padding: 20px; border-radius: 8px; border: 1px solid #ddd; max-width: 400px; margin: 20px 0;">
    <div style="margin-bottom: 15px;">
        <label style="display: block; margin-bottom: 5px; font-weight: bold;">Navn:</label>
        <input type="text" id="elevNavn" placeholder="Skriv dit navn..." style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
    </div>
    
    <div style="margin-bottom: 15px;">
        <label style="display: block; margin-bottom: 5px; font-weight: bold;">Måling (tal):</label>
        <input type="number" id="maaling" placeholder="Indtast talværdi..." style="width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
    </div>

    <button onclick="gemTilDatabase()" style="background-color: #28a745; color: white; border: none; padding: 10px 15px; border-radius: 4px; cursor: pointer; width: 100%; font-size: 16px;">
        Gem Data i Skyen
    </button>
</div>

<div id="statusBesked" style="margin-top: 15px; font-weight: bold;"></div>

<script type="module">
    // 1. Importér Firebase moduler
    import { initializeApp } from "https://www.gstatic.com/firebasejs/10.12.0/firebase-app.js";
    import { getDatabase, ref, push } from "https://www.gstatic.com/firebasejs/10.12.0/firebase-database.js";

    // 2. Din Firebase konfiguration
    const firebaseConfig = {
        apiKey: "AIzaSyBOIoYE0Gy6eqDPwCzyBObCBVuHRRWPqKA",
        authDomain: "elev-data-projekt.firebaseapp.com",
        projectId: "elev-data-projekt",
        storageBucket: "elev-data-projekt.firebasestorage.app",
        messagingSenderId: "300980572276",
        appId: "1:300980572276:web:9193735b7ecf185c3dc121",
        measurementId: "G-PYF090BS93"
    };

    // 3. Initialisér Firebase
    const app = initializeApp(firebaseConfig);
    const db = getDatabase(app);

    // 4. Gør funktionen tilgængelig for din HTML-knap
    window.gemTilDatabase = function() {
        const navn = document.getElementById('elevNavn').value;
        const tal = document.getElementById('maaling').value;
        const beskedFelt = document.getElementById('statusBesked');

        if (navn === "" || tal === "") {
            alert("Husk at udfylde både navn og tal!");
            return;
        }

        // Vis at vi arbejder
        beskedFelt.style.color = "orange";
        beskedFelt.innerText = "Gemmer data...";

        // Send til Firebase Realtime Database
        push(ref(db, 'maalinger'), {
            elev: navn,
            vaerdi: tal,
            tidspunkt: new Date().toLocaleString('da-DK')
        })
        .then(() => {
            // Suksess!
            beskedFelt.style.color = "green";
            beskedFelt.innerText = "✅ Data er nu gemt i Firebase!";
            document.getElementById('maaling').value = ""; // Ryd talfeltet
        })
        .catch((error) => {
            // Fejl
            beskedFelt.style.color = "red";
            beskedFelt.innerText = "❌ Fejl: " + error.message;
            console.error("Database fejl:", error);
        });
    };
</script>

---
### Næste skridt
Når du har trykket på knappen herover, kan du gå ind i din [Firebase Console](https://console.firebase.google.com/), vælge dit projekt og klikke på **Realtime Database**. Der vil du se dine data dukke op med det samme!
