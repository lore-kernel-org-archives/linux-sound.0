Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EB9285CA8
	for <linux-sound@vger.kernel.org>; Fri,  3 Apr 2026 03:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775186513; cv=none; b=cgnQxmvV1tXlKxERkSrLczJmsH5HO8E/wsoeUHDFs+Vv1G9oK7rnnfTUuduBNvjyt7T/E+u5JQy705lGmaP0F+uXX7YH8woNEqYtcxNenGyPO0prb4zArpA2nZKrtDw6MoDVAiO6b0a14Iuet4VoLJ3aCaV7dcuhHr7F8XB2hE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775186513; c=relaxed/simple;
	bh=0+oIsvi8iPwRM9vhYnncTXllag+1M4Yd/gXDoqYbYwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cImYThdc8QmPKUaHcT+P6BCrvjplyJF3gufdf3nV61JMMsbHmOEX8Ed2QtRgQQHWT4gFiyMjCjk5vPzx9tj2GMeAzHPySvzFjTqjBKfmhSuQOJp0Vyb2XBCrO9LiHbvGFARLrnLu9I4Zc5iwwiUa7m8gzc/UhnFxme1sZZIsVKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMbkg5Z7; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMbkg5Z7"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-60567e76830so974961137.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Apr 2026 20:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775186511; x=1775791311; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lgkbxrVjKmfLSch2z1owIJVa6D63ztThqRo8C7QXWv4=;
        b=IMbkg5Z7BOgWzAKWOr3NzXXBvyS2Z4f321+AS6tTD0mPbHGepKiUcH5ModwQliobPC
         R1yVeKD82S4JxB21EnZM0R9eKNEFBNUzS5OiufObgq0+DkH0jn08NWqSyePV1oSO0Ru/
         H4xQYyzsngeKwc4Er1B4beWkBBEjb0g7CPNGClkbHGkNtGmnlUzSZCGrhjvIRblyHECU
         iTcNVQleMj/6UJL3ZD2moEGhiJJ8tOwIyO3XgRSP1dou33Cb7jNUj5pI3L7hU16vjDCn
         SSIKgwyfGu3Hv3aLVKL3uMkJtGp9Qg74UONe0z1ooVHbzLluZrZIw2BuLrKiXH7CmJrn
         S1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775186511; x=1775791311;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgkbxrVjKmfLSch2z1owIJVa6D63ztThqRo8C7QXWv4=;
        b=W6GI6HXuJiWBVEHKAQg6DhDQ50eP/npDNcYsC97SS+UdNE92K+P6MTeNXNV7Jef+02
         bqCLBGJQUPIW9G0zbAWlovqCUmejHA0wrA1ozfZgN3F2jYT8bc3R1DPXs9ZFUqB9QOwC
         LIC8a7atkAsXXOcztuN1gig9LrsqWvbZy/boW8Cv1L5c3wL30QgEAI1yduZwUXtK6FNo
         Pz37OxI9PWAsq256mvJL5q6WdFEI6I2+jRrhO+ZoWC/rPdA+QplFIwHuX+TVlJTjMgU/
         /JosSBGAujwH8akWIgapvfwcUSF/dnpHbhKp1BpWN3tUQ4wTBAiWa2VbiX3Pop9J/vyk
         rk8w==
X-Gm-Message-State: AOJu0YyzbUeORCPFoAWZHEJP5j7ssaXI5PcTUaE6S9RIxaUsR3EmWnsU
	ASihf9L6fMYch9fpUOsUMStDUF9ip+KbY4S1eEKnv0JVOV9kuBmGu36T
X-Gm-Gg: AeBDievF/XwtvuVMJKfxwxuCpS6QeouLPpeegvw+cp3Ilt9FWcx/i0M7i0zhUcsMIco
	nrBqyAfaE4aR+6gWvapcpZZ+TX1k8/UMxrpFnmMr4xk9tg6QudNw4EWr29e8IW1lpeBGqJZ+78s
	P0gUEu8SbBFRv0uEVpOX7I7z6c0R8Dnlz+CKvvaP04FRbt4tVikm75wMB1ihlwW1GJuoyOaTCVF
	91udpmqJZWGhSseZJ+9E4CTj28ozjfXwG94YV6Rl5iU1DTS7MsqCNFeSV4GhjwT+2rEHa+8TRio
	VwFKTdynzeBVrurZnz2aZU1h27waJgtExtKkcIZEBb9uLyLuLGuRj2eWsWOixaschuBbj967XOF
	Nqkr+r5Rvl/tpFYcRH3aOBAumZj+IFjDS5ZX1W5pLj714THnvU3ofjh5tlXTTtB0Itp6X3KDRTT
	rKFTFVTrCZmWkAgwQHTiOM9+92bet21y8vFCjl3nXRoItT3d9NcbTcHFAupokv+aqrPJgk+46KE
	3E9
X-Received: by 2002:a05:6102:4486:b0:602:a4af:5fe with SMTP id ada2fe7eead31-605a4d53bd3mr634543137.9.1775186511401;
        Thu, 02 Apr 2026 20:21:51 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-217.user3p.v-tal.net.br. [177.4.161.217])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60583098fa7sm6060377137.10.2026.04.02.20.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 20:21:51 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 03 Apr 2026 00:21:34 -0300
Subject: [PATCH v3] ALSA: hda: Notify IEC958 Default PCM switch state
 changes
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260403-hda-spdif-share-notify-v3-1-4eb1356b0f17@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf8V0bU07VFBX/odxMbYDjJFHWiQSw
 r9LYaMLlie595xRBPJMQVx2o/DUc+CmniHZ74QtsS5IsptZgIJUJYmSpUMZWse5DCV6knXTcT5
 IgBwNWqVQGzGfW085fxbx7b5yeD+eZLtoi4uSQ9f4YSn3Ou7WiFF6K9JrqWWmMjIA5M5OX4sK+
 XWwTSVipIdfDWxqIGpsejwZsojwp5mm6QsVAl4yFQEAAA==
X-Change-ID: 20260330-hda-spdif-share-notify-22fa4ac00a14
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.de>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6184;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=0+oIsvi8iPwRM9vhYnncTXllag+1M4Yd/gXDoqYbYwo=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnnjXzOWTw6JKHBYqK9j/03k8LxjfLPvjebiUY/0xSOX
 eFh6NnVUcrCIMbFICumyLI6aZHlnq4HV+vjVnjAzGFlAhnCwMUpABOZcprhv8uuvUxW37PL9rzc
 Z5o6YU3kuh8z5XYtW3jDa6Xlp9NHJxxl+MN9hfHqh3M55ZmsC9gvzOZfey7uo3mRaumEvV1vg+c
 HKjIAAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

The "IEC958 Default PCM Playback Switch" control is backed directly by
mout->share_spdif. The share-switch callbacks currently access that state
without serialization, and spdif_share_sw_put() always returns 0, so
normal userspace writes never emit the standard ALSA control value
notification.

snd_hda_multi_out_analog_open() may also clear mout->share_spdif when the
analog PCM capabilities and the SPDIF capabilities no longer intersect.
That fallback is still needed to avoid creating an impossible hw
constraint set, but it changes the mixer backing value without notifying
subscribers.

Protect the share-switch callbacks with spdif_mutex like the other SPDIF
control handlers, return the actual change value from spdif_share_sw_put(),
and notify the cached control when the open path forcibly disables
shared SPDIF mode after dropping spdif_mutex.

This keeps the existing auto-disable behavior while making switch state
changes visible to userspace.

Fixes: 9a08160bdbe3 ("[ALSA] hda-codec - Add "IEC958 Default PCM" switch")
Fixes: 022b466fc353 ("ALSA: hda - Avoid invalid formats and rates with shared SPDIF")
Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v3:
- Dropped the forward declaration of struct snd_kcontrol.
- Moved share_spdif_kctl to the end of struct hda_multi_out.
- Link to v2: https://patch.msgid.link/20260402-hda-spdif-share-notify-v2-1-7c6584ecaa21@gmail.com

Changes in v2:
- Reworked the share-switch callbacks to use codec in private_data and
mout in private_value.
- Replaced the mixer-list lookup helper with a cached shared SPDIF
kcontrol pointer for forced-disable notifications.
- Kept the functional change otherwise unchanged.
- Link to v1: https://patch.msgid.link/20260401-hda-spdif-share-notify-v1-1-707e422ed9d1@gmail.com
---
 sound/hda/common/codec.c     | 46 ++++++++++++++++++++++++++++++++++++--------
 sound/hda/common/hda_local.h |  1 +
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/sound/hda/common/codec.c b/sound/hda/common/codec.c
index 09b1329bb8f3..5123df32ad89 100644
--- a/sound/hda/common/codec.c
+++ b/sound/hda/common/codec.c
@@ -2529,7 +2529,10 @@ EXPORT_SYMBOL_GPL(snd_hda_spdif_ctls_assign);
 static int spdif_share_sw_get(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct hda_multi_out *mout = snd_kcontrol_chip(kcontrol);
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+	struct hda_multi_out *mout = (void *)kcontrol->private_value;
+
+	guard(mutex)(&codec->spdif_mutex);
 	ucontrol->value.integer.value[0] = mout->share_spdif;
 	return 0;
 }
@@ -2537,9 +2540,15 @@ static int spdif_share_sw_get(struct snd_kcontrol *kcontrol,
 static int spdif_share_sw_put(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct hda_multi_out *mout = snd_kcontrol_chip(kcontrol);
-	mout->share_spdif = !!ucontrol->value.integer.value[0];
-	return 0;
+	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
+	struct hda_multi_out *mout = (void *)kcontrol->private_value;
+	bool val = !!ucontrol->value.integer.value[0];
+	int change;
+
+	guard(mutex)(&codec->spdif_mutex);
+	change = mout->share_spdif != val;
+	mout->share_spdif = val;
+	return change;
 }
 
 static const struct snd_kcontrol_new spdif_share_sw = {
@@ -2550,6 +2559,14 @@ static const struct snd_kcontrol_new spdif_share_sw = {
 	.put = spdif_share_sw_put,
 };
 
+static void notify_spdif_share_sw(struct hda_codec *codec,
+				  struct hda_multi_out *mout)
+{
+	if (mout->share_spdif_kctl)
+		snd_ctl_notify_one(codec->card, SNDRV_CTL_EVENT_MASK_VALUE,
+				   mout->share_spdif_kctl, 0);
+}
+
 /**
  * snd_hda_create_spdif_share_sw - create Default PCM switch
  * @codec: the HDA codec
@@ -2559,15 +2576,24 @@ int snd_hda_create_spdif_share_sw(struct hda_codec *codec,
 				  struct hda_multi_out *mout)
 {
 	struct snd_kcontrol *kctl;
+	int err;
 
 	if (!mout->dig_out_nid)
 		return 0;
 
-	kctl = snd_ctl_new1(&spdif_share_sw, mout);
+	kctl = snd_ctl_new1(&spdif_share_sw, codec);
 	if (!kctl)
 		return -ENOMEM;
-	/* ATTENTION: here mout is passed as private_data, instead of codec */
-	return snd_hda_ctl_add(codec, mout->dig_out_nid, kctl);
+	/* snd_ctl_new1() stores @codec in private_data; stash @mout in
+	 * private_value for the share-switch callbacks and cache the
+	 * assigned control for forced-disable notifications.
+	 */
+	kctl->private_value = (unsigned long)mout;
+	err = snd_hda_ctl_add(codec, mout->dig_out_nid, kctl);
+	if (err < 0)
+		return err;
+	mout->share_spdif_kctl = kctl;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_create_spdif_share_sw);
 
@@ -3701,6 +3727,8 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
 				  struct hda_pcm_stream *hinfo)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+	bool notify_share_sw = false;
+
 	runtime->hw.channels_max = mout->max_channels;
 	if (mout->dig_out_nid) {
 		if (!mout->analog_rates) {
@@ -3729,10 +3757,12 @@ int snd_hda_multi_out_analog_open(struct hda_codec *codec,
 					hinfo->maxbps = mout->spdif_maxbps;
 			} else {
 				mout->share_spdif = 0;
-				/* FIXME: need notify? */
+				notify_share_sw = true;
 			}
 		}
 	}
+	if (notify_share_sw)
+		notify_spdif_share_sw(codec, mout);
 	return snd_pcm_hw_constraint_step(substream->runtime, 0,
 					  SNDRV_PCM_HW_PARAM_CHANNELS, 2);
 }
diff --git a/sound/hda/common/hda_local.h b/sound/hda/common/hda_local.h
index ab423f1cef54..98b2c4acebc2 100644
--- a/sound/hda/common/hda_local.h
+++ b/sound/hda/common/hda_local.h
@@ -221,6 +221,7 @@ struct hda_multi_out {
 	unsigned int spdif_rates;
 	unsigned int spdif_maxbps;
 	u64 spdif_formats;
+	struct snd_kcontrol *share_spdif_kctl; /* cached shared SPDIF switch */
 };
 
 int snd_hda_create_spdif_share_sw(struct hda_codec *codec,

---
base-commit: f16695c0dc9db64f0a5a9871a10b70daee2653e3
change-id: 20260330-hda-spdif-share-notify-22fa4ac00a14

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

