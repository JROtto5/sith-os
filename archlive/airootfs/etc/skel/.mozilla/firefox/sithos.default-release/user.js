// Sith OS Firefox Performance & Privacy Defaults
// Hardware acceleration
user_pref("gfx.webrender.all", true);
user_pref("media.ffmpeg.vaapi.enabled", true);
user_pref("media.hardware-video-decoding.enabled", true);
user_pref("media.hardware-video-decoding.force-enabled", true);

// Performance
user_pref("browser.cache.disk.enable", true);
user_pref("browser.cache.memory.capacity", 524288);
user_pref("network.http.max-connections", 1800);
user_pref("network.http.max-persistent-connections-per-server", 10);

// Privacy (without breaking sites)
user_pref("privacy.trackingprotection.enabled", true);
user_pref("privacy.trackingprotection.socialtracking.enabled", true);
user_pref("browser.send_pings", false);
user_pref("dom.battery.enabled", false);
user_pref("geo.enabled", false);
user_pref("beacon.enabled", false);

// Sith OS branding
user_pref("browser.startup.homepage", "file:///usr/share/sithos/startpage/index.html");
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.aboutwelcome.enabled", false);
user_pref("browser.startup.homepage_override.mstone", "ignore");

// Smooth scrolling
user_pref("general.smoothScroll", true);
user_pref("general.smoothScroll.lines.durationMaxMS", 125);
user_pref("general.smoothScroll.lines.durationMinMS", 125);
user_pref("general.smoothScroll.mouseWheel.durationMaxMS", 200);
user_pref("general.smoothScroll.mouseWheel.durationMinMS", 100);

// Dark theme
user_pref("ui.systemUsesDarkTheme", 1);
user_pref("browser.in-content.dark-mode", true);
user_pref("layout.css.prefers-color-scheme.content-override", 0);
