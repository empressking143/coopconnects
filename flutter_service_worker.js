'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"splash/img/light-4x.png": "39d0726583332215890c426bc78b8d94",
"splash/img/dark-3x.png": "9e16d6bed367cbf60d11f5ff095d4a50",
"splash/img/light-3x.png": "9e16d6bed367cbf60d11f5ff095d4a50",
"splash/img/light-1x.png": "c1783f02c512f520151c6b490562badf",
"splash/img/dark-1x.png": "c1783f02c512f520151c6b490562badf",
"splash/img/light-2x.png": "b09ba6ab2cc670a7e9166ac885190f2c",
"splash/img/dark-2x.png": "b09ba6ab2cc670a7e9166ac885190f2c",
"splash/img/dark-4x.png": "39d0726583332215890c426bc78b8d94",
"index.html": "eec56a6da3332a5758558eeb58b8568c",
"/": "eec56a6da3332a5758558eeb58b8568c",
"assets/NOTICES": "03f3e1c9b4bf63d741ef4820074f0236",
"assets/assets/animations/fire.json": "bab86c777ec26fd7aefaa6a5c1f1860a",
"assets/assets/images/qrcode.png": "1f9088a7b7501ac73158efb43217c80f",
"assets/assets/images/default_avatar.png": "b0df8d15fe3e440bda36090dc8be32a7",
"assets/assets/images/beefkarekare.png": "460625dc53144599ba2230e04fc2c77c",
"assets/assets/images/ming.png": "7c4cf16481405f5751601f59b1970c91",
"assets/assets/images/logo.png": "0f1e69b7143222a3be93d4be20cfc9e1",
"assets/assets/images/dinuguan.png": "90fe7a90d0d493a340086a7f20dfdb51",
"assets/assets/images/advertisement1.png": "00eacb71a3b7623e6db4be07b04ef073",
"assets/assets/images/user_icon.png": "2a266f290b957acaa48cc3ce51c1459d",
"assets/assets/images/advertisement4.png": "6dcadf6c5715b6e933ad02a727124e97",
"assets/assets/images/advertisement3.png": "cd889b1fdaa9a0476d2281345d9ea850",
"assets/assets/images/advertisement2.png": "5eb717d8ebc602505718612f30e214ca",
"assets/assets/images/logo.gif": "ab59410734fd34f5c556baaa517b9c71",
"assets/assets/images/beef-kare-kare.jpg": "460625dc53144599ba2230e04fc2c77c",
"assets/assets/images/chickencurry.png": "cf44c0a1a8506666194bfba90e02015b",
"assets/assets/fonts/Roboto/Roboto-Regular.ttf": "327362a7c8d487ad3f7970cc8e2aba8d",
"assets/assets/fonts/Roboto/Roboto-Bold.ttf": "2e9b3d16308e1642bf8549d58c60f5c9",
"assets/assets/fonts/Noto_Sans/NotoSans-VariableFont_wdth,wght.ttf": "e28b62ca0a622ca9fb2fbadf74ce2032",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "ffdadf049b3a30cf7f3d6568cd22cc98",
"assets/fonts/MaterialIcons-Regular.otf": "68524bd6dedca3071483828c5a46f620",
"assets/FontManifest.json": "08280238b2f103b075ce0c621802db15",
"assets/AssetManifest.bin.json": "5623c91448aa7cacf63e594375d694b9",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "92702772796c2a5b73561455648acae4",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "387c8846ed7c44aa89cab089c17faead",
"assets/AssetManifest.json": "9c364fcbc3e4bc3df7e5af73523b4750",
"version.json": "87dd3270bc20c580edc7cb0290648beb",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"main.dart.js": "ce0f9c275c66ca61003f860ec712035e",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "c4210beedcf721edb41e5c71d6dcdc62",
"favicon.png": "c1783f02c512f520151c6b490562badf",
"flutter_bootstrap.js": "567a7bcbf4eb91f8a48c53a74819956a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
