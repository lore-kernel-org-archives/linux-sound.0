Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A4E377ECB
	for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 20:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773605494; cv=none; b=d097kNWmMZRQB+WgS8WZ3Ts0KuEKJNRXBo/kHF5JWuCMAbti6oue/GiftuC3fbO17OfR9j8Yfl66QXeVgpGnL9i2qBYZBdxxSmI/zj455U8DmvqhjuGhsXNsnOypR+iHTn8vshBMTvSILtyi+7CXABtAqf2A2tl3PUESaBvIWYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773605494; c=relaxed/simple;
	bh=hDrJpbA0d29qtNBTwJVfQ6Y9whssZXtIxirIh0KzzXk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C1ZdXGcUadMCIPBb5lgN2g/rx1qN+LOgR/2GsQ9DabOSN7m0jmmrTAkjfFB3qLSqjWmawzaSA2mdmmW3HedcP2zxyBdPUXAqyL0gx9Gh+gM8x55NXW9YnZu6GGH3uYbTxutwca9iy/Fzp7pvGl3v6eth0ZQ4AHuo3ilZNaUclqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=jlT+Pv2J; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="jlT+Pv2J"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439afc58ac7so4570362f8f.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Mar 2026 13:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1773605491; x=1774210291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPx7W1wrRFKN3fnyGqD27na/IBsbOnOXlhpyAbDCums=;
        b=jlT+Pv2J50YzgTXy2FOgtSywyrY6bPKwkNoWTygxByn1vgf5y/5mbRZhQc2wlJwIzk
         EcD3LqdojTz7G6AGA+2kAOgB/K7jmsL0+QLzaHXNDDtF7JvXPXmQR3ue4ZGPHVN/xaCH
         lgqC9ng90PvioPH4DqgzwrQqAfn6TR53fPqeX6qW0r7S0yN8A66igesgz7baZIPEVJ5Z
         3WsBSWRHARNp+jZq9xnMsTY/+PscNDdxvk+4Xu1CyiEvHGd42rm3dkDVEfILZQZIhnCR
         XRJ0uophienTZwGiK+qqfkaANkkbPUHNcSUcAoYUUJv/RJub8lVrgBbL+QNuOJbG8d7c
         884g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773605491; x=1774210291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dPx7W1wrRFKN3fnyGqD27na/IBsbOnOXlhpyAbDCums=;
        b=VrBwLpQ4GLiYpCKsZL8lj8ObpvP6XfgjxRErz0tfuw3qT5jS0PRdn/bZncx7+j9DPq
         ZnrpqvmbYKPnOG5bU8IEplXK2zfM7x9MuNbhwK0WgGjuj/apfhbWfM9mn4DINkYWFLdU
         undMkGmwgx5pIlkCcLXJUtOJ7qjRSgzKPwb8h3qABPM79vBhD83dHFvKG+F+0acN1zjT
         3R/TkUwHa7vS1cFiDdeuklOaO2QctxKIaoKkQCVAEsyO9y7JeqwdvslhtWW2KyAtfFAe
         VtKTGFHXaxHQwsbsHH8M7FMcJf/+Ny4fbOjKh5kDYqhc4SpEceFZDf6eby2jU1HRop5Y
         H7Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXEEi1DNDO6PqnBo6IU9Vm0WsKkytSp4DHPvAH/GXd+eAT+hgnwqU6LChCrwL1BWEie3CmU4CqWiaKV1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMDKZiyKBPAeTv7NupQnhYXR/6+uiLg74VdCbS7ux+fvGWFTuy
	/2MmLR00bHKjxw6HK5LxQzQ6r54h5hqhgh2vEQgK/8fB1i4LpeAy4YJ2acrKzYJ1Xg==
X-Gm-Gg: ATEYQzwVYHw3+11eOr2c6mb6mEhEzhFC4DBN/DjHP62j7hDRYakl/tY8qr0CPU6oL7P
	jAHPX96ko3cLPUwCT++xtNLxfZii0iyKVjVm2Mkya2+XTGvW3yBnSw371Zsi92Za7J276pnru+F
	VnGFiQnM+qyZP2ITN5OUGE8353xIxUxlj8BJdxSDTqMslIOfJeM4G+SJ7WjBZot0u5NsbwfEW7H
	Ah2MKm3rWFYtEBHVxY0ThktILJmDbNAFLeTL7MWezHLg8x6XNSWSgl9efYrFcLTChefr6HVHagF
	uRJTO0zX5cMv72ho2llVur3VN46dSaXy87hvwEM/L3sQbXW6hPlR/Z0iU4adwAW3np5FYgkrH38
	dusklPIPXRrwAXQddsDOljs5xsS4qFgWNw72u4PGCGXkYXtzPNRDUZE5WZdxUXGtUe0y6wpuig2
	qeA1h91fqp+Gt1QjXTDGMV04fle5H0S7Uo7vIY+Ejgz+4ZLgl2GUc=
X-Received: by 2002:a05:6000:310d:b0:439:c42f:10c4 with SMTP id ffacd0b85a97d-43a04d8c249mr20156769f8f.15.1773605490529;
        Sun, 15 Mar 2026 13:11:30 -0700 (PDT)
Received: from starbook ([217.155.46.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b457cfa07sm695811f8f.6.2026.03.15.13.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 13:11:29 -0700 (PDT)
From: Sean Rhodes <sean@starlabs.systems>
To: linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chris Chiu <chris.chiu@canonical.com>,
	Kailang Yang <kailang@realtek.com>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Edip Hazuri <edip@medip.dev>,
	Zhang Heng <zhangheng@kylinos.cn>,
	linux-sound@vger.kernel.org
Subject: [PATCH v4] ALSA: hda/realtek: Sequence GPIO2 on Star Labs StarFighter
Date: Sun, 15 Mar 2026 20:11:27 +0000
Message-ID: <20260315201127.33744-1-sean@starlabs.systems>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260314193434.8237-1-sean@starlabs.systems>
References: <20260314193434.8237-1-sean@starlabs.systems>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The initial StarFighter quirk fixed the runtime suspend pop by muting
speakers in the shutup callback before power-down. Further hardware
validation showed that the speaker path is controlled directly by LINE2
EAPD on NID 0x1b together with GPIO2 for the external amplifier.

Replace the shutup-delay workaround with explicit sequencing of those
controls at playback start and stop:
- assert LINE2 EAPD and drive GPIO2 high on PREPARE
- deassert LINE2 EAPD and drive GPIO2 low on CLEANUP

This avoids the runtime suspend pop without a sleep, and also fixes pops
around G3 entry and display-manager start that the original workaround
did not cover.

Fixes: 1cb3c20688fc ("ALSA: hda/realtek: Fix speaker pop on Star Labs StarFighter")
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Stefan Binding <sbinding@opensource.cirrus.com>
Cc: Kailang Yang <kailang@realtek.com>
Cc: Chris Chiu <chris.chiu@canonical.com>
Cc: Edip Hazuri <edip@medip.dev>
Cc: linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Tested-by: Sean Rhodes <sean@starlabs.systems>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 sound/hda/codecs/realtek/alc269.c | 38 ++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 4c49f1195e1b..b1a52fb4bb8a 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -1017,12 +1017,30 @@ static int alc269_resume(struct hda_codec *codec)
 	return 0;
 }
 
-#define STARLABS_STARFIGHTER_SHUTUP_DELAY_MS	30
+#define ALC233_STARFIGHTER_SPK_PIN	0x1b
+#define ALC233_STARFIGHTER_GPIO2	0x04
 
-static void starlabs_starfighter_shutup(struct hda_codec *codec)
+static void alc233_starfighter_update_amp(struct hda_codec *codec, bool on)
 {
-	if (snd_hda_gen_shutup_speakers(codec))
-		msleep(STARLABS_STARFIGHTER_SHUTUP_DELAY_MS);
+	snd_hda_codec_write(codec, ALC233_STARFIGHTER_SPK_PIN, 0,
+			    AC_VERB_SET_EAPD_BTLENABLE,
+			    on ? AC_EAPDBTL_EAPD : 0);
+	alc_update_gpio_data(codec, ALC233_STARFIGHTER_GPIO2, on);
+}
+
+static void alc233_starfighter_pcm_hook(struct hda_pcm_stream *hinfo,
+					struct hda_codec *codec,
+					struct snd_pcm_substream *substream,
+					int action)
+{
+	switch (action) {
+	case HDA_GEN_PCM_ACT_PREPARE:
+		alc233_starfighter_update_amp(codec, true);
+		break;
+	case HDA_GEN_PCM_ACT_CLEANUP:
+		alc233_starfighter_update_amp(codec, false);
+		break;
+	}
 }
 
 static void alc233_fixup_starlabs_starfighter(struct hda_codec *codec,
@@ -1031,8 +1049,16 @@ static void alc233_fixup_starlabs_starfighter(struct hda_codec *codec,
 {
 	struct alc_spec *spec = codec->spec;
 
-	if (action == HDA_FIXUP_ACT_PRE_PROBE)
-		spec->shutup = starlabs_starfighter_shutup;
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		spec->gpio_mask |= ALC233_STARFIGHTER_GPIO2;
+		spec->gpio_dir |= ALC233_STARFIGHTER_GPIO2;
+		spec->gpio_data &= ~ALC233_STARFIGHTER_GPIO2;
+		break;
+	case HDA_FIXUP_ACT_PROBE:
+		spec->gen.pcm_playback_hook = alc233_starfighter_pcm_hook;
+		break;
+	}
 }
 
 static void alc269_fixup_pincfg_no_hp_to_lineout(struct hda_codec *codec,
-- 
2.51.0

