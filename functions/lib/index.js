"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
// import {onRequest} from "firebase-functions/v2/https";
// import * as logger from "firebase-functions/logger";
const functions = require("firebase-functions");
const admin = require("firebase-admin");
// Start writing functions
// https://firebase.google.com/docs/functions/typescript
// export const helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
exports.checkHealth = functions.https.onCall(async (data, context) => {
    console.log("Cloud functions are online!");
    return "Cloud functions are online!";
});
admin.initializeApp();
exports.checkPasswordRequirementsBeforeReset = functions.https.onCall(async (data, context) => {
    console.log("data:", data);
    const email = data.email;
    const currentPassword = data.currentPassword;
    // console.log("currentPassword:", currentPassword);
    // Authenticate the user with the provided credentials
    const user = await admin.auth().getUserByEmail(email);
    await admin.auth().setCustomUserClaims(user.uid, {
        passwordPolicy: {
            minLength: 8,
            requireLowercase: true,
            requireUppercase: true,
            requireNumber: true,
            requireSpecial: true, // Require at least one special character
        },
    });
    console.log("user:", user);
    // Check if the provided password matches the user's current password
    try {
        // Send password reset email
        await admin.auth().generatePasswordResetLink(email);
        console.log("Password reset email sent to:", email);
        // Define password requirements
        const minLength = 8;
        const hasUppercase = /[A-Z]/.test(currentPassword);
        const hasLowercase = /[a-z]/.test(currentPassword);
        const hasDigit = /\d/.test(currentPassword);
        // Check if password requirements are met
        if (currentPassword.length >= minLength &&
            hasUppercase &&
            hasLowercase &&
            hasDigit) {
            return { success: true, message: "Password reset email sent." };
        }
        else {
            return {
                success: false,
                message: "Password does not meet requirements.",
            };
        }
    }
    catch (error) {
        console.error("Password verification failed:", error);
        return { success: false, message: "Invalid current password." };
    }
});
//# sourceMappingURL=index.js.map