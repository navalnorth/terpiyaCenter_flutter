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



exports.sendScheduledNotifications = functions.scheduler.onSchedule("every day 19:00", async (context) => {
    const db = admin.firestore();
    const messaging = admin.messaging();

    // Obtenir la date de demain
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    const formattedDate = tomorrow.toISOString().split("T")[0]; // Format: YYYY-MM-DD

    try {
        // Récupérer les rendez-vous prévus pour demain
        const rdvSnapshot = await db.collection("rendezvous").where("date", "==", formattedDate).get();

        if (rdvSnapshot.empty) {
            console.log("✅ Aucun rendez-vous pour demain.");
            return null;
        }

        const notifications = [];

        for (const doc of rdvSnapshot.docs) {
            const rdvData = doc.data();
            const userId = rdvData.userId;
            const time = rdvData.time;
            const therapie = rdvData.therapie;

            // Récupérer le token de l'utilisateur
            const tokenSnapshot = await db.collection("tokens").where("userId", "==", userId).get();

            if (tokenSnapshot.empty) {
                console.log(`❌ Pas de token pour l'utilisateur ${userId}`);
                continue;
            }

            const userToken = tokenSnapshot.docs[0].data().token;
            if (!userToken) continue;

            const message = {
                notification: {
                    title: "📅 Rappel de votre rendez-vous",
                    body: `N'oubliez pas votre séance de "${therapie}" demain à ${time}. 😊`,
                },
                token: userToken,
                data: {
                    click_action: "FLUTTER_NOTIFICATION_CLICK",
                    link: "/mes-rdv"
                }
            };

            notifications.push(messaging.send(message));
        }

        await Promise.all(notifications);
        console.log(`✅ Notifications envoyées à ${notifications.length} utilisateurs.`);

    } catch (error) {
        console.error("❌ Erreur lors de l'envoi des notifications :", error);
    }

    return null;
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
