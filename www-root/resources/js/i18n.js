import i18n from "i18next";
import { initReactI18next } from "react-i18next";
import HttpApi from "i18next-http-backend";
import LanguageDetector from "i18next-browser-languagedetector";

i18n
    .use(HttpApi) // Charge les fichiers de traduction
    .use(LanguageDetector) // Détecte la langue de l'utilisateur
    .use(initReactI18next) // Intègre i18next avec React
    .init({
        supportedLngs: ["en", "fr"], // Liste des langues supportées
        fallbackLng: "en", // Langue par défaut si aucune n'est détectée
        debug: true, // Active les logs pour le débogage

        interpolation: {
            escapeValue: false, // React gère déjà l'échappement
        },

        backend: {
            loadPath: "/locales/{{lng}}/{{ns}}.json", // Chemin vers les fichiers JSON des traductions
        },
    });

export default i18n;
