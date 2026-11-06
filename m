Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988581;
	b=i0E1CPHtapHEgspNUyOH8yvpghNUE1vtjuIDalSc0sw7Z+JvvJ9rxBX2k38HMSNW0EFG
	 4lzUXFcWr5TF2fTEu2zJZxr1dRA63PGkNjP3msQg9d0UrHm+0N6lV0qpfdYjuGYkXZiV6
	 tsqmhG1yGrgZcc1yG0rc2BwfS69k46asUGX+1KAhSccPxrebJW43bv4vinwx0Hpf8YAl8
	 OQoqIcDMn4LSsRtciODmD7glZuy7+3dIM6WnErM4Cwyet6Bd0gejsPwY2PBpZ7FTYgUxl
	 pXJXEJFXj4794BbfnW5LkFoSGsvPUaOmuEpNXsqbD2EEsYOgIf+E3ByPBFRvr6Tb/2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XHoNbOiS3kAZn5XDBJFLkRMPTYji5N9SX6DLNdEprPY=;
	b=wZGh6+q0rQBZ8qzoiH3y5+Ceg7pNqGl38ASG6D7ylhvXDSnBXaTdFaD4Fx3uXFud1GkG
	 8vv26UhHvkGZfOtbywqZpmK+aF04/QZ5d+tA5+XWi0YX7Os2J+tJWHG0eH+eoB5+I9dFv
	 370CrsImjtaFADefW+DNfVvzTvJFKRNltzyot09UOFMoCgqlRGBf+ZGBcOk9VzUlkpsle
	 H+EbFcLLUYXQ0A9EBk2qFbUdcN0Ne10gMNAT/4ooJVrouBOFeQfRYQeOoI9iqvtrPNbMq
	 472bmc1KpWTQZ23NiFSUHMxKwfO0J30E9i8JqXMKQuz+284uADkqxUK29QU8dRY64SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="itsVLWh/";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA40606A330
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 18:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA40606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itsVLWh/
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-19305bcb72cso891260c88.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 10:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793988580; x=1794593380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XHoNbOiS3kAZn5XDBJFLkRMPTYji5N9SX6DLNdEprPY=;
        b=itsVLWh/Udvqv6vleyslRD9ztK0SrnvDCpr4/4N4AlEiOccupSUuKeJV7x8i6E9RLY
         5FlrDSdTqQZ8taMwCsIyTYJDiYHOBvcPyYuN/8J6raWLl+xxqavsF7L4dEGBjO9xDDFd
         A4sKOPNzr+dXB6tXwybXrrx88cSkCZHc/KlW2xDqyTwvEzFqsoByNTmzWHWTUYfogt2P
         VAwjBLZA3O7vYoaiWOO7VMzmPvK2cTZ2qvJUmtfjzTk/gmHJ3f8PA8tVA3s3FOU478FD
         fcGoDqrA0pGbbUncJLP/ITl9hueaN8gWTdy8LDWQbOM6hGVuK/UMh5onxRF9jp3Orotg
         pnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988580; x=1794593380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XHoNbOiS3kAZn5XDBJFLkRMPTYji5N9SX6DLNdEprPY=;
        b=Ha+o5FmfAv2ZIkcQK1g33ctIRe/tRJXzTu3iENoojycmzrgbXDTy+FRyIWZBLfpYL4
         8jl7DBW1mmIcRrc5W4lcRhiQ1Jr6C724aXyK/xH0mpFMSA4npCpkvpGFgNXUoNGqTIVB
         Vze5LCToNkO1MW1pKCEV2ppdRyF9PUZIiiOjIj+Iu2tMy/fDc9+9FLtgvLwCl1tgkUqy
         /NE5R8KE9hSU9HiqAEMBqs9qJa01UMx78Z921ezuAIGwPtt2SHVsc8AvXnMdW+6L2Vhy
         7zkxvwVyHtjhG8zho/nKzUPkHfHZHav2L0sx1NZv6zkw02hQhANyH4XwB0unCrJ7Sel9
         WdOw==
X-Forwarded-Encrypted: i=1; AKwUvByp6mbdyAWWb71eNr6/eYMnuyZtwgns3Do0AwttEju4P4MwTOKosmINJ5QYEOae2aMnH3c+SCn/xPITow==@vger.kernel.org
X-Gm-Message-State: APuU4Z+/jn/S/mu0S1fh7uO37zh8Rx9c65kbDw3wPRWU1lUTHRwHMccT
	BB6KpfGyhs2Qi53rVXCZ/OYmj9Ck3yLvGO8BqVzym6EO3NR0Rt3P+0bO
X-Gm-Gg: AYBFou3Z2ZOP1nXIxHSUORaXpzQtZU9PgSd8KTd6BcZERuRc03KDPy8pgFM3BsW6Iep
	xTisv7KMf7CoHU+7arVNBdAeefUW0Ems9H9GtOvHCzGye7qaCzUmDD478FFbd4HO/FICeVjP4nx
	Q8ZF7MKqDb1vY1l1MfOIuWC9VzHNJosgEtJWzRB54Q6YzeEX6UpzU6Jv5JWYZGVv3Z6LAYIEfDX
	C7pm3ts3cTqVkU/yFPfYEP8mvPSVgUORcFRIIWaVJOusG2TiqQkrKq7gGkDdKxvz/kPRRci1qBP
	WqSHdDaahdSUgIZwHgGvZO5i2aHu6Kom+Of7YC4vfLCfyIQKRop6+p7UOneicjbDX3GEzGlPag+
	f6uyOWUwc2zs0bQopSfwwIvEXPoYZm4v8c8/3ywubfkwUaBpOqNd85kKGjrv94Tgqh5lJixeFed
	GCqjlD0yNwonwijmZtsdGMkVUKHLthwhVIBkQSc8kYoBl+jmU02mjQnx8QxezTn/hRP5gkjc3KO
	MJQp4JkQHz4mtX6km7K3dFgI+94ag+NqXsIIkWdClDUWZXPOVd7CaK0nrqAFcxM2tJXbF4vugex
	j8cVPxuFrVJ3LefKZ3DpG4vp06G2H4HpP6VRdRU/lA7RLlWVer1C
X-Received: by 2002:a05:7023:a4c:b0:143:7001:7645 with SMTP id a92af1059eb24-1b25d34f9a8mr3634838c88.47.1793988579696;
        Fri, 06 Nov 2026 10:09:39 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a5628sm8366464c88.10.2026.11.06.10.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:09:39 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] ALSA: control: Synchronize LED mode accesses
Date: Fri,  6 Nov 2026 18:08:12 +0000
Message-ID: <20261106180812.5097-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mode_store() updates led->mode while holding
snd_ctl_led_mutex.

However, snd_ctl_led_set_state() and mode_show() read this
field without holding the same mutex.

This can cause a data race when userspace changes the mode
while another path reads it.

Read the mode under snd_ctl_led_mutex in
snd_ctl_led_set_state() and use the local value after
releasing the mutex.

Also protect the mode read in mode_show() with the mutex.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 sound/core/control_led.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/core/control_led.c b/sound/core/control_led.c
index 501387287ae6..044430b2f1a2 100644
--- a/sound/core/control_led.c
+++ b/sound/core/control_led.c
@@ -140,6 +140,7 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 {
 	struct snd_ctl_led *led;
 	struct snd_ctl_led_ctl *lctl;
+	enum snd_ctl_led_mode mode;
 	int route;
 	bool found;
 
@@ -168,8 +169,9 @@ static void snd_ctl_led_set_state(struct snd_card *card, unsigned int access,
 				UPDATE_ROUTE(route, snd_ctl_led_get(lctl));
 			}
 		}
+		mode = led->mode;
 	}
-	switch (led->mode) {
+	switch (mode) {
 	case MODE_OFF:		route = 1; break;
 	case MODE_ON:		route = 0; break;
 	case MODE_FOLLOW_ROUTE:	if (route >= 0) route ^= 1; break;
@@ -382,6 +384,8 @@ static ssize_t mode_show(struct device *dev,
 	struct snd_ctl_led *led = container_of(dev, struct snd_ctl_led, dev);
 	const char *str = NULL;
 
+	guard(mutex)(&snd_ctl_led_mutex);
+
 	switch (led->mode) {
 	case MODE_FOLLOW_MUTE:	str = "follow-mute"; break;
 	case MODE_FOLLOW_ROUTE:	str = "follow-route"; break;
-- 
2.55.0

