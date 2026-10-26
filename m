Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023828;
	b=bC+EO/eklEBWF7MJOUqy+uP114F6qSXRb4nLRcNFU3/xkYaUVUHugNv8sb8hgrhbCS9z
	 S1a5YYvWktnClgpkmKG+LdZBFADMisWpQtBDBLzjlbgcENMAzGDCGeFE0caoWyVMLCyy5
	 KgCk5StvXwwa0rQVVyznij5XIzvcRx53w9Ey5wzpuz8+KwRXBEyW6uuv/RhsSwK+ESKSt
	 n4NjfZT415gPSm4xdEWnHevWNX1TiVcULRPH9IQVZ3GiZF3W3mRNhMPnRopbWeVfs0jHY
	 Nqi/ErLSETnoXUakz398WmiTkODfE1rUraFFI19RakesSTQtn1HLYyBuydXO2xnaq7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eCPQexLT35mCM7GB7WqKEdzig8ZsxPF20VNsKB3kYaU=;
	b=UGgfnxXCFjgRRPT/p3P5N6nS4kovJO30dUBpV4GCoBXWzjtJHm02WKsTq9cc5juq5Fbz
	 FBz8LOt9jBnZiBpfXNJWnyp9KxUj1XssaB5ftx6e8Pi2rZCuj40pK7ms3s2suJbvLHJ4+
	 mvOztuJwf0OPEt2AmWZZfZ4ja/rL+oSrBaZEU1zL0UKjfYdzflR/vl8W1fbVSbAHoY515
	 KF3NmMpMJ45VUq7o5/NN5nC539d7wC+RfpGEUS0TuCd+eghCgs+/KgvPV+x3lqjYIU3AI
	 nRftnJTMtfNa2UhqMBBKutiajAku/EW7pLVmyDvHhISXOX1V4VY7KrXVqP1D+JKO8pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MzAdLBuK;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986E8606A31A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 14:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 986E8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MzAdLBuK
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso973295e9.3
        for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 07:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793023826; x=1793628626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eCPQexLT35mCM7GB7WqKEdzig8ZsxPF20VNsKB3kYaU=;
        b=MzAdLBuKjS9MEQKCa1RnOSQ0blectmEG2Sh5Kp+msjJo1vmEVeMvOgF9NjCv43mQM0
         17yNFhNbzMzZ/UtnijXvIW1OQ34INl8znRnfo4vNE3hymAA/jwn8vb73NzlU3SMskAbo
         4cf9DuprtRtN4UfPMybduT0v5821jZM/u9oGYS2dFK8VACdOcWipzpdZMNEQx/U4wIcU
         dtHHfsy9AsXADGV+bk4VLdFv9+zDuo/Y6pdNIQeWw5hEo3HP+w93bvxUZ0Ej9Upo3GUw
         0BgsxjJbwYwEMbb1lF8u3505qc0P5AQNcP3zVVBepS8gLTidNwcP96HwYFmbHdOGh2Ec
         VK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023826; x=1793628626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eCPQexLT35mCM7GB7WqKEdzig8ZsxPF20VNsKB3kYaU=;
        b=hi2EUsthFxU0hq4dWOh06WveVhQFG4TSLyJIjxFo8+R+gHohJaz7/9wlUsUuKSi2VG
         4rG9KS18GSwLZ521nS4tWGBXqwqL/DsRXQK7wdcrnNpAv8NL5pl/j8XsHnZJZQJEMQ5/
         ZXGZajURBNhf0gQv1RE/leqHG1OTOi4Jgi6XIGSISx+mINFQtoWZoAZI/WWwQzlQPlP2
         ODcw+Sxze/BoMEk8Iyiv4NM67L7rYhgZU/dksqRpTUwalMZ2bRaieGIW/y65KhGFTq7J
         izqSjrnOlUk7KKrAYcbCLWhsKJaIFU2S6b1IDKELl81QDiSilRKQZTDqhmMBRCeKDF59
         cw2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwKlWKfZu9mN2/Jv/vfs/+w7wMexFz4HlNvMtMjTDZ2bWEa2x0CcBnQMWaP+pXtIH2vTNhxfwv+u3dcDQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIrc2ZrrQUHvcJAHVXO0hPrdWc8XUEoc8ev2ScL0s1c8F0xMKup
	g0pyM4KCk8avK3/4yr8Wpr8dYWPC/igQfda8j9L5y0p24yFsvSn9INMyFh30Ju5S
X-Gm-Gg: AYBFou3Lv+ApHVoGFkEitEfmc0FT6i5i07I22ykEU0oRXtLjrYm88qMPE/OvQ6XyMk0
	FSmapD1GJTyqyft85MyCK/eTKvSsnInUotoDfnENAvHgu2LQds2xRLzozw1wrQIkY0Nf5dNlJ5u
	d/GP9hvspvUWOBNrcmIXIUdbfNRuPiO7JYHw8fTRnaokzKvEgfy64Atz8jvKMZBnJ83a6DJb5Tv
	1Xf2Cv8vPaAbL5rNz1VryLvxz8dFmx2xaA23ICfDe7tLy/r0LdGdF4wPuKWCuOx41NWWCLE5OmF
	9fNIOecuPFf8F3C7HOkojACsL2QOKD9yKgg9D9/DPPkTU053UhiAaEGmt35xhjYUvdYKal8Rgdx
	imVDPuHCiFFdXTZbzyQfy1HrBWBGkQDRM9cY2wY58nQVIltlsVt7JtAvZDsCQ2gq+3xK0AFQmON
	3exdo4rKx9aBXnYmUNNnlq5dVHJOIPja0F4GwqOfwkE0Y44GbhHjhxXPKU7Y9mykx9tCdta2c9/
	QiUd0nnfUEzZ5wtFDkzxVLLf6isvRT6ZFuzRjwxPgurQT3DFbtM0VWK/PTMQININUvrr30d+At1
	aNrihvX7grk4Cg==
X-Received: by 2002:a05:600c:37cc:b0:4a1:a6e0:4ce4 with SMTP id 5b1f17b1804b1-4a35acb990emr124937075e9.33.1793023825491;
        Mon, 26 Oct 2026 07:10:25 -0700 (PDT)
Received: from gandalf.magpie-herring.ts.net ([90.244.144.206])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm522634665e9.1.2026.10.26.07.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 07:10:24 -0700 (PDT)
From: Zak Brighton Knight <zakbrightonknight@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	Zak Brighton Knight <zakbrightonknight@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Skip probe-time interface setup for MSI MAG X570S ALC4080
Date: Mon, 26 Oct 2026 14:09:34 +0000
Message-ID: <20261026140934.3575940-1-zakbrightonknight@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The Realtek ALC4080 USB audio on the MSI MAG X570S Tomahawk Max WiFi
(USB ID 0db0:a073, the same ID as the MAG X570S Torpedo Max mixer map)
has six streaming interfaces with 68 altsettings in total. For each of
them, __snd_usb_parse_audio_interface() switches the interface to alt 0,
initialises pitch and the sample rate and switches back, which costs
about 64 ms per altsetting here, mostly spent inside usb_set_interface().
Probing the card therefore takes about 6.4 seconds, on every boot.

That setup is redundant with snd_usb_endpoint_prepare() at stream-open
time, so set QUIRK_FLAG_SKIP_IFACE_SETUP for this device.

Tested on 7.2.11 with the equivalent quirk_flags=0db0:a073:skip_iface_setup
module option, re-probing the device via its sysfs "authorized"
attribute: probe time went from 6.45 s to 0.57 s, all 68 altsettings
are still listed in /proc/asound/cardX/stream*, and playback and
capture work.

Assisted-by: LLM
Signed-off-by: Zak Brighton Knight <zakbrightonknight@gmail.com>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index b6be3a80d..4ec1f2a0b 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2661,6 +2661,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_CTL_MSG_DELAY_1M | QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x0d8c, 0x0102, /* C-Media CM6206 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x0db0, 0xa073, /* MSI MAG X570S Tomahawk/Torpedo Max (ALC4080) */
+		   QUIRK_FLAG_SKIP_IFACE_SETUP),
 	DEVICE_FLG(0x0e0b, 0xfa01, /* Feaulle Rainbow */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x0ecb, 0x205c, /* JBL Quantum610 Wireless */
-- 
2.56.0

