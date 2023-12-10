package com.example.meteringdevices

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.view.FlutterMain
import android.net.Uri
//import android.widget.Toast
//import android.util.Log
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.util.Log
import android.widget.Toast


class MainActivity : FlutterActivity() {

//    Bundle[
//    { EXTRA_BARCODE_DECODING_DATA = 4606453849072, EXTRA_BARCODE_DECODING_SYMBOLE = EAN-13 }]

    var data: Uri? = null

    val MyReceiver = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {

            val v2 = intent.getStringExtra("EXTRA_BARCODE_DECODING_SYMBOLE")
            val v1 = intent.getStringExtra("EXTRA_BARCODE_DECODING_DATA")
            val CHANNEL = "app.channel.shared.data";

            Toast.makeText(context, "тест", Toast.LENGTH_LONG).show()

            StringBuilder().apply {
                append("Action: ${intent.action}\n")
                append("URI: ${intent.toUri(Intent.URI_INTENT_SCHEME)}\n")
                toString().also { log ->
                    Log.d("test", log)
                    Toast.makeText(context, log, Toast.LENGTH_LONG).show()

                    MethodChannel(
//                        flutterEngine?.dartExecutor,
                        flutterEngine!!.dartExecutor?.binaryMessenger,
//            flutterView,
                        CHANNEL
                    ).setMethodCallHandler { call, result -> // here is the error
                        if (call.method.contentEquals("getSharedText")) {
                            val greetings = v1.toString() + " " + v2.toString();
                            result.success(greetings)
                        }
                    }

                }
            }

        }
    }


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val filter = IntentFilter("com.xcheng.scanner.action.BARCODE_DECODING_BROADCAST")

        registerReceiver(MyReceiver, filter)

        data = intent?.data


        val CHANNEL = "app.channel.shared.data";
//        val CHANNEL = "com.xcheng.scanner.action.BARCODE_DECODING_DROADCAST";
        MethodChannel(
//            flutterEngine?.getDartExecutor(),
            flutterEngine!!.dartExecutor?.binaryMessenger,
//            flutterView,
            CHANNEL
        ).setMethodCallHandler { call, result -> // here is the error
            if (call.method.contentEquals("getSharedText")) {
                val greetings = helloFromNativeCode()
                result.success(greetings)
            }
        }


//        GeneratedPluginRegistrant.registerWith(this)

//        setContentView(R.layout.activity_main)

//        val intent = Intent(this,)д
//        intent.data
//        val bundle: Bundle? = intent.extras
//
//        val data: Uri? = intent.data
//        Log.d(
//            data?.toString(),
//            "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
//        )
//        for (char in listOf(intent)) {
//            for (char1 in listOf(char)){

//                Log.d(char1?.toString(),"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")

//            }
//        }


//        if (bundle != null) {
////            val message = bundle.getString("object") // 1
//
//
////            val message = bundle.getString("waterius.ru/account") // 1
//            val message = "1";


//            Toast.makeText(this, data.toString(), Toast.LENGTH_LONG).show()

//        }

//        val sendIntent = Intent().apply {
//            action = Intent.ACTION_SEND
//            putExtra(Intent.EXTRA_TEXT,  "a")
//            type = "text/plain"
//        }

//    }
    }

    fun helloFromNativeCode(): String {
//            return "Hello from Native Android Code"
        return data.toString()
    }

    companion object {
        private const val CHANNEL = "helloFromNativeCode"
    }
}