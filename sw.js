// TargetTrader Service Worker v4.4.7
const CACHE_NAME = 'targettrader-v4.4.7';
const STATIC_CACHE = 'targettrader-static-v4.4.7';

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

const CDN_ASSETS = [
    'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2',
    'https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js'
];

const NO_CACHE_DOMAINS = ['supabase.co', 'supabase.com'];

self.addEventListener('install', (event) => {
    console.log('[SW] Installing v4.4.7...');
    event.waitUntil(
        caches.open(STATIC_CACHE)
            .then(cache => cache.addAll(PRECACHE_ASSETS))
            .then(() => console.log('[SW] Install complete'))
            .catch(err => console.error('[SW] Precache failed:', err))
    );
});

self.addEventListener('activate', (event) => {
    console.log('[SW] Activating v4.4.7...');
    event.waitUntil(
        caches.keys()
            .then(names => Promise.all(
                names.filter(n => n.startsWith('targettrader-') && n !== CACHE_NAME && n !== STATIC_CACHE)
                    .map(n => { console.log('[SW] Deleting:', n); return caches.delete(n); })
            ))
            .then(() => self.clients.claim())
    );
});

self.addEventListener('fetch', (event) => {
    const url = new URL(event.request.url);
    if (event.request.method !== 'GET' || !url.protocol.startsWith('http')) return;
    
    if (NO_CACHE_DOMAINS.some(d => url.hostname.includes(d))) {
        event.respondWith(fetch(event.request).catch(() => 
            new Response(JSON.stringify({error:'offline'}), {status:503, headers:{'Content-Type':'application/json'}})
        ));
        return;
    }
    
    if (CDN_ASSETS.some(a => event.request.url.startsWith(a))) {
        event.respondWith(
            caches.open(CACHE_NAME).then(cache => 
                cache.match(event.request).then(cached => {
                    const fetched = fetch(event.request).then(res => {
                        if (res && res.status === 200) cache.put(event.request, res.clone());
                        return res;
                    }).catch(() => cached);
                    return cached || fetched;
                })
            )
        );
        return;
    }
    
    event.respondWith(
        caches.match(event.request).then(cached => {
            if (cached) {
                fetch(event.request).then(res => {
                    if (res && res.status === 200) caches.open(STATIC_CACHE).then(c => c.put(event.request, res));
                }).catch(() => {});
                return cached;
            }
            return fetch(event.request).then(res => {
                if (res && res.status === 200) {
                    const clone = res.clone();
                    caches.open(STATIC_CACHE).then(c => c.put(event.request, clone));
                }
                return res;
            }).catch(() => {
                if (event.request.headers.get('accept')?.includes('text/html')) return caches.match('./index.html');
                return new Response('Offline', {status:503});
            });
        })
    );
});

self.addEventListener('message', (event) => {
    if (event.data?.type === 'SKIP_WAITING') {
        console.log('[SW] Skip waiting');
        self.skipWaiting();
    }
});

console.log('[SW] Service Worker loaded - v4.4.7');
