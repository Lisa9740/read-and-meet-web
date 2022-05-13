'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "0da9fc2f54099ae92fb2895565cfbaca",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "7e7a6cccddf6d7b20012a548461d5d81",
"assets/lib/assets/images/background.png": "e5c6d6b5c0762b8a4764f7936395eb62",
"assets/lib/assets/images/logo/book_logo.png": "312a61562f2344b7a463831510489cc4",
"assets/lib/assets/images/logo/book_logo_icon.png": "7d092d2c0a79800c8dc545b813f5183d",
"assets/lib/assets/images/logo/letter_logo.png": "720828a8a848d1b03e3e7e3a61433419",
"assets/lib/assets/images/logo/logo.svg": "9e3e69e58c0e49ac62473548f4c657b9",
"assets/NOTICES": "5cea9c81d58f5570d68aa678b7733001",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"canvaskit/canvaskit.js": "c2b4e5f3d7a3d82aed024e7249a78487",
"canvaskit/canvaskit.wasm": "4b83d89d9fecbea8ca46f2f760c5a9ba",
"canvaskit/profiling/canvaskit.js": "ae2949af4efc61d28a4a80fffa1db900",
"canvaskit/profiling/canvaskit.wasm": "95e736ab31147d1b2c7b25f11d4c32cd",
"favicon/android-icon-144x144.png": "9453e450328b6092438f05bb061af657",
"favicon/android-icon-192x192.png": "9cc0911658da11b67d16dacd48df970d",
"favicon/android-icon-36x36.png": "cc4f83672e2367be023813da9dd1d6e5",
"favicon/android-icon-48x48.png": "ca384e7144f608c879c05c1e7a5a7383",
"favicon/android-icon-72x72.png": "bea6d9dd154c5af1298ebe7736df72d1",
"favicon/android-icon-96x96.png": "7906e72522b16c1ae1cebfc0974b6a30",
"favicon/apple-icon-114x114.png": "8fd10b12375d7e8f12edc3a7a86fbdbc",
"favicon/apple-icon-120x120.png": "76ada5d967d5fbe1c8606e8adc6d5020",
"favicon/apple-icon-144x144.png": "9453e450328b6092438f05bb061af657",
"favicon/apple-icon-152x152.png": "8ab9600d478c2d91d0cf59b42c23c12d",
"favicon/apple-icon-180x180.png": "c52221f0e9f6f838267f5ea9bf44023d",
"favicon/apple-icon-57x57.png": "c743e554d13e5d78bcadd6b2254bc928",
"favicon/apple-icon-60x60.png": "09bf71ea0eb0ab0e64590d391fdaee31",
"favicon/apple-icon-72x72.png": "bea6d9dd154c5af1298ebe7736df72d1",
"favicon/apple-icon-76x76.png": "a2b5c5b8df547210a429bc599ff1ad4d",
"favicon/apple-icon-precomposed.png": "a60804f5c8c6ffcd9d75e5c1c8858282",
"favicon/apple-icon.png": "a60804f5c8c6ffcd9d75e5c1c8858282",
"favicon/browserconfig.xml": "653d077300a12f09a69caeea7a8947f8",
"favicon/favicon-16x16.png": "f94f3787132479f4709e26e4db0eb83f",
"favicon/favicon-32x32.png": "04dd0ebb72893c40994498f6f453fd60",
"favicon/favicon-96x96.png": "92de2fc771e3606695087e68660f931e",
"favicon/favicon.ico": "9a066859d41b90cb9f5e0a93d0dd3d0e",
"favicon/manifest.json": "b58fcfa7628c9205cb11a1b2c3e8f99a",
"favicon/ms-icon-144x144.png": "d7c624c20e5eb3359e6f5239f3a7818b",
"favicon/ms-icon-150x150.png": "201aa2a7d3ceb293279d39215be6d972",
"favicon/ms-icon-310x310.png": "b25806a57ba635b3a78eab192d287e0b",
"favicon/ms-icon-70x70.png": "059dca08fc2c839f4375cdc89e0b5572",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "d9a75a7ca97f73f5524f169595c7dc0c",
"/": "d9a75a7ca97f73f5524f169595c7dc0c",
"main.dart.js": "8c16523e1f1b95e18405853f09568f69",
"manifest.json": "4e54f3992cd9a5ab4c5ad2c3f66215d9",
"version.json": "b9acb06b4fbe28978cbc6a8ce5a889bb"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
