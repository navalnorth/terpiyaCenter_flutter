const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

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
