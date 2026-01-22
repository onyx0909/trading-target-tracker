// TargetTrader Service Worker v4.4.3
const CACHE_NAME = 'targettrader-v4.4.3';
const STATIC_CACHE = 'targettrader-static-v4.4.3';

// Assets to cache immediately on install
const PRECACHE_ASSETS = [
    './',
    './index.html',
    './manifest.json',
    './favicon.ico',
    './assets/favicon-16.png',
    './assets/favicon-32.png',
    './assets/favicon-48.png',
    './assets/apple-touch-icon.png'
];

// External CDN resources to cache
const CDN_ASSETS = [
    'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2',
    'https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js'
];

// Domains that should never be cached (API calls)
const NO_CACHE_DOMAINS = [
    'supabase.co',
    'supabase.com'
];

// Install event - precache static assets
self.addEventListener('install', (event) => {
    console.log('[SW] Installing v4.4.3...');
    event.waitUntil(
        caches.open(STATIC_CACHE)
            .then((cache) => {
                console.log('[SW] Precaching static assets');
                return cache.addAll(PRECACHE_ASSETS);
            })
            .then(() => {
                console.log('[SW] Install complete');
            })
            .catch((error) => {
                console.error('[SW] Precache failed:', error);
            })
    );
});

// Activate event - clean up old caches
self.addEventListener('activate', (event) => {
    console.log('[SW] Activating v4.4.3...');
    event.waitUntil(
        caches.keys()
            .then((cacheNames) => {
                return Promise.all(
                    cacheNames
                        .filter((name) => name.startsWith('targettrader-') && name !== CACHE_NAME && name !== STATIC_CACHE)
                        .map((name) => {
                            console.log('[SW] Deleting old cache:', name);
                            return caches.delete(name);
                        })
                );
            })
            .then(() => {
                console.log('[SW] Activation complete');
                return self.clients.claim();
            })
    );
});

// Fetch event - serve from cache or network
self.addEventListener('fetch', (event) => {
    const url = new URL(event.request.url);
    
    // Skip non-GET requests
    if (event.request.method !== 'GET') return;
    
    // Skip non-http(s) requests
    if (!url.protocol.startsWith('http')) return;
    
    // Check if this is a no-cache domain (API calls)
    const isNoCacheDomain = NO_CACHE_DOMAINS.some(domain => url.hostname.includes(domain));
    
    if (isNoCacheDomain) {
        // Network-only for API calls
        event.respondWith(
            fetch(event.request).catch(() => {
                return new Response(JSON.stringify({ error: 'offline' }), {
                    status: 503,
                    headers: { 'Content-Type': 'application/json' }
                });
            })
        );
        return;
    }
    
    // Check if this is a CDN resource
    const isCDN = CDN_ASSETS.some(asset => event.request.url.startsWith(asset));
    
    if (isCDN) {
        // Stale-while-revalidate for CDN resources
        event.respondWith(
            caches.open(CACHE_NAME).then((cache) => {
                return cache.match(event.request).then((cachedResponse) => {
                    const fetchPromise = fetch(event.request).then((networkResponse) => {
                        if (networkResponse && networkResponse.status === 200) {
                            cache.put(event.request, networkResponse.clone());
                        }
                        return networkResponse;
                    }).catch(() => cachedResponse);
                    
                    return cachedResponse || fetchPromise;
                });
            })
        );
        return;
    }
    
    // Cache-first strategy for static assets
    event.respondWith(
        caches.match(event.request)
            .then((cachedResponse) => {
                if (cachedResponse) {
                    // Update cache in background
                    fetch(event.request)
                        .then((networkResponse) => {
                            if (networkResponse && networkResponse.status === 200) {
                                caches.open(STATIC_CACHE).then((cache) => {
                                    cache.put(event.request, networkResponse);
                                });
                            }
                        })
                        .catch(() => {});
                    
                    return cachedResponse;
                }
                
                // Not in cache - fetch from network
                return fetch(event.request)
                    .then((networkResponse) => {
                        if (networkResponse && networkResponse.status === 200) {
                            const responseToCache = networkResponse.clone();
                            caches.open(STATIC_CACHE).then((cache) => {
                                cache.put(event.request, responseToCache);
                            });
                        }
                        return networkResponse;
                    })
                    .catch(() => {
                        // Offline fallback for HTML requests
                        if (event.request.headers.get('accept')?.includes('text/html')) {
                            return caches.match('./index.html');
                        }
                        return new Response('Offline', { status: 503 });
                    });
            })
    );
});

// Handle messages from the main app
self.addEventListener('message', (event) => {
    if (event.data && event.data.type === 'SKIP_WAITING') {
        console.log('[SW] Skip waiting, activating new version');
        self.skipWaiting();
    }
});

console.log('[SW] Service Worker loaded - v4.4.3');
