const functions = require("firebase-functions");
const admin = require("firebase-admin");
const stripe = require("stripe")("sk_test_51QyCsNQMSOn7RDTsqfXxkSlg3rLzsmTPfCTTvmkq8AdqQB23rv7F26piRr7Y9hcrqQhdVPSIcsIuj1fwIdkJW88d00EEQtGCKN"); // Remplace par ta clé Stripe
const express = require("express");
const cors = require("cors");

admin.initializeApp();
const app = express();
app.use(cors({ origin: true }));
app.use(express.json());

exports.sendNotification = functions.https.onRequest(async (req, res) => {
    const { tokens, title, body, link } = req.body;

    if (!tokens || !Array.isArray(tokens) || tokens.length === 0) {
        return res.status(400).send("❌ Aucun token valide fourni.");
    }

    const message = {
        notification: {
            title: title,
            body: body,
        },
        data: {
            click_action: "FLUTTER_NOTIFICATION_CLICK",
            link: link
        },
        tokens: tokens,
    };

    try {
        const response = await admin.messaging().sendEachForMulticast(message);


        // 🔥 Parcourir les réponses pour voir les erreurs éventuelles
        response.responses.forEach((res, index) => {
            if (!res.success) {
                console.error(`❌ Erreur pour le token ${tokens[index]} :`, res.error);
            }
        });

        res.status(200).send(`✅ Notifications envoyées (${response.successCount} réussites)`);
    } catch (error) {
        console.error("❌ Erreur d'envoi :", error);
        res.status(500).send("❌ Erreur : " + error.message);
    }
});



exports.createPaymentIntent = functions.https.onRequest(async (req, res) => {
    try {
        const { amount, currency } = req.body;

        if (!amount || !currency) {
            return res.status(400).send("❌ Montant ou devise manquants.");
        }

        // Créer un Payment Intent avec Stripe
        const paymentIntent = await stripe.paymentIntents.create({
            amount: amount,
            currency: currency,
            payment_method_types: ["card"],
            metadata: { integration_check: "accept_a_payment" },
        });
        console.log("✅ Payment Intent créé :", paymentIntent);

        res.status(200).send({
            client_secret: paymentIntent.client_secret,
            status: paymentIntent.status,
        });

    } catch (error) {
        console.error("❌ Erreur lors de la création du paiement :", error);
        res.status(500).send({ error: error.message });
    }
});
