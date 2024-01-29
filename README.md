On Android, there are a few different certificate stores (full details here). You can install your own CA certificates to intercept HTTPS traffic on Android, but intercepting any interesting traffic from an app that isn't explicitly opting-in to interception requires you to put your certificate into the 'system' store, not just the normal 'user' store.

Almost all apps will trust the CAs from this system store to issue certificates for HTTPS. That means if you can put your MitM proxy of choice's CA certificate there, then your proxy can intercept all those app's HTTPS, and you can immediately see what traffic any app is sending, and test out what it does with alternate responses. This is great! Writing to the system store is only possible on rooted devices and emulators, but that's fairly standard for reverse engineering work, and many developers & testers have rooted devices too so they can do the same with production builds, or to modify other system settings.

The problem though is that Chrome's condition for what it considers to be a public root certificate (and so subject to certificate transparency requirements) is just whether it's in the system store or the user store. The system store is widely used for self-signed certificates like this, but as soon as you put your certificate in there, suddenly everything issued by your little testing CA must be formally submitted to a CT log and served up with an SCT proving it's been published publicly.

That means that since Chrome 99 was released until I shipped a fix (just now), when you used HTTP Toolkit on a rooted device Chrome threw loud NET::ERR_CERTIFICATE_TRANSPARENCY_REQUIRED errors on every single HTTPS page, like so:

How to Fix It:
Please create a custom flag file and then run this tool..............
