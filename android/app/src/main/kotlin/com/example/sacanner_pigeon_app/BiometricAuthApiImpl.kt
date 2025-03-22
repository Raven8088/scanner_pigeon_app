package com.example.sacanner_pigeon_app

import android.content.Context
import android.util.Log
import androidx.biometric.BiometricManager
import androidx.biometric.BiometricPrompt
import androidx.core.content.ContextCompat
import androidx.fragment.app.FragmentActivity
import com.getkeepsafe.relinker.BuildConfig

class BiometricAuthApiImpl(private val context: Context) : BiometricAuthApi {
    override fun authenticate(callback: (Result<BiometricAuthResponse>) -> Unit) {
        val activity = context as FragmentActivity
        val executor = ContextCompat.getMainExecutor(context)

        val biometricManager = BiometricManager.from(context)

        val canUseBiometrics = biometricManager.canAuthenticate(BiometricManager.Authenticators.BIOMETRIC_STRONG)
        val authenticators = when (canUseBiometrics) {
            BiometricManager.BIOMETRIC_SUCCESS -> {
                Log.d("BiometricAuth", "BIOMETRIC_STRONG soportado.")
                BiometricManager.Authenticators.BIOMETRIC_STRONG
            }
            BiometricManager.BIOMETRIC_ERROR_NO_HARDWARE -> {
                Log.d("BiometricAuth", "No hay hardware biométrico.")
                BiometricManager.Authenticators.DEVICE_CREDENTIAL
            }
            BiometricManager.BIOMETRIC_ERROR_HW_UNAVAILABLE -> {
                Log.d("BiometricAuth", "Hardware no disponible.")
                BiometricManager.Authenticators.DEVICE_CREDENTIAL
            }
            BiometricManager.BIOMETRIC_ERROR_NONE_ENROLLED -> {
                Log.d("BiometricAuth", "No hay datos biométricos registrados.")
                BiometricManager.Authenticators.DEVICE_CREDENTIAL
            }
            else -> {
                Log.d("BiometricAuth", "Código desconocido: $canUseBiometrics")
                callback(Result.success(BiometricAuthResponse(success = false, errorMessage = "No se puede autenticar: error desconocido")))
                BiometricManager.Authenticators.DEVICE_CREDENTIAL // fallback para evitar return temprano
            }
        }

        when (biometricManager.canAuthenticate(authenticators)) {
            BiometricManager.BIOMETRIC_SUCCESS -> {
                val promptInfo = if (authenticators == BiometricManager.Authenticators.BIOMETRIC_STRONG) {
             BiometricPrompt.PromptInfo.Builder()
        .setTitle("Autenticación requerida")
        .setSubtitle("Usa huella o rostro para continuar")
        .setNegativeButtonText("Cancelar")
        .setAllowedAuthenticators(authenticators)
        .build()
        } else {
                    BiometricPrompt.PromptInfo.Builder()
                        .setTitle("Autenticación requerida")
                        .setSubtitle("Usa tu PIN, patrón o contraseña")
                        .setAllowedAuthenticators(authenticators)
                        .build()
                }
                                if (BuildConfig.DEBUG) {
                                            Log.d("BiometricAuth", "Simulando fallo de autenticación en modo DEBUG")
                                            callback(Result.success(BiometricAuthResponse(success = false, errorMessage = "Autenticación simulada fallida")))
                                            return
                                }

                    var responded = false

                        val biometricPrompt = BiometricPrompt(
                            activity,
                            executor,
                            object : BiometricPrompt.AuthenticationCallback() {
                                override fun onAuthenticationSucceeded(result: BiometricPrompt.AuthenticationResult) {
                                    if (!responded) {
                                        responded = true
                                        val method = when (result.authenticationType) {
                                            BiometricPrompt.AUTHENTICATION_RESULT_TYPE_BIOMETRIC -> "BIOMETRIC"
                                            BiometricPrompt.AUTHENTICATION_RESULT_TYPE_DEVICE_CREDENTIAL -> "PIN_OR_PATTERN"
                                            else -> "UNKNOWN"
                                        }
                                        Log.d("BiometricAuth", "Autenticación con método: $method")
                                        callback(Result.success(BiometricAuthResponse(success = true, errorMessage = method)))
                                    }
                                }

                                override fun onAuthenticationFailed() {
                                    if (!responded) {
                                        Log.d("BiometricAuth", "onAuthenticationFailed: intento inválido.")
                                        // NO respondemos aquí, solo lo registramos
                                    }
                                }

                                override fun onAuthenticationError(errorCode: Int, errString: CharSequence) {
                                    if (!responded) {
                                        responded = true
                                        val handledMessage = when (errorCode) {
                                            BiometricPrompt.ERROR_LOCKOUT,
                                            BiometricPrompt.ERROR_LOCKOUT_PERMANENT -> {
                                                "Demasiados intentos fallidos. Intenta más tarde o desbloquea el dispositivo."
                                            }
                                            BiometricPrompt.ERROR_NEGATIVE_BUTTON -> {
                                                "Autenticación cancelada por el usuario."
                                            }
                                            else -> errString.toString()
                                        }

                                        Log.d("BiometricAuth", "Error crítico: [$errorCode] $handledMessage")
                                        callback(Result.success(BiometricAuthResponse(success = false, errorMessage = handledMessage)))
                                    }
                                }
                            }
                        )


                biometricPrompt.authenticate(promptInfo)
            }
            BiometricManager.BIOMETRIC_ERROR_NO_HARDWARE,
            BiometricManager.BIOMETRIC_ERROR_HW_UNAVAILABLE,
            BiometricManager.BIOMETRIC_ERROR_NONE_ENROLLED -> {
                callback(Result.success(BiometricAuthResponse(success = false, errorMessage = "No hay biometría configurada o disponible")))
            }
            else -> {
                callback(Result.success(BiometricAuthResponse(success = false, errorMessage = "No se puede autenticar con los métodos disponibles")))
            }
        }
    }
}
