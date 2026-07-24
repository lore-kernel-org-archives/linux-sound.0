Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462603F4DF3
	for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 23:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784936107; cv=none; b=csn7sNjcGXsNKmEhQ8ma9X+gplYSGQ/q/ytedlKeEL+42TN32I+bJEtfmYWetIspKhgiUV9x5z4/++weBGhtbYO1a7z5o3xGU2VuM4xyu1NRcryq+UlozbBFDPCRsb7nhVzF5C40+x7ABQFr35akkKdOuk+JksmJCDJHSJPHe/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784936107; c=relaxed/simple;
	bh=dXMIxjXjmxxXQstTQm3Ckd0xFmG0qWHwHchTz7R80v4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpDw5kxcmss7+c0amqAy7noPzIGFePCBunTLwaQmDekUUUlqvUT/yl7bC3VJP2iG87z36V00B4zekF7wTKRjKrOlfTJhuKRcYDA+lnrNtrWn/LsPyk60sJ8umxNs3FfdEdfuUAUQ1niLBt3GdftdZ9C3X6eMKOK6O5dPIVZOfFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBvCbfsj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBvCbfsj"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso11178845ad.3
        for <linux-sound@vger.kernel.org>; Fri, 24 Jul 2026 16:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784936106; x=1785540906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/NhkTg0a3A8bbWIDY7lGJm4c2N5hYTi0tSxfBMW/aU=;
        b=IBvCbfsjl54Dx36TF6Fj/YAYuYkI0M8ePgXJPTbeJ8ixlObg9hiwaxWz8Tm8w58Ch4
         8LGL45V3dGjFEXEmYfv4oaYOiz8yI3Q/PCwLvFwGTlL855wIkrq2+l9NCa2Q2tsLNqsS
         aKuTvgaDt0/Pt2zL09vtTrfgtAvl1Ngkr0qv+CZ1F7Ps2mSHEsZdUzuf6+NY8I6FmAff
         wtcaQx7SerozXsoTrkkmQVw2/El++DnH0Kniimdw85zLJ7h1QBgZ/eNe/rUUFywcCIGj
         xnnUzNus5gIsbal0NDerAY9Bcfr2CT2oHIkLN9pmXnWvd1NvGLpd5bHT9SYVs9IxG7WO
         1Fpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784936106; x=1785540906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/NhkTg0a3A8bbWIDY7lGJm4c2N5hYTi0tSxfBMW/aU=;
        b=KStPk08qkacWtic4UcY9SAw7FBXytFqweCS3fYYMQuGNJdkzgLqABy2dH7T54Xg5U5
         oR7pe1evg8NA/Rvh7qRlLfUCL47sjlI/M4ZCInuSjnZogS6oNQkm4fGwBRBEty6lt3N7
         YubstzIS1VLLCrCRoUgZnHIgmoj6zMsze7yeT76rmH13GpbFM1+qpE/haduvUS4RK5NW
         2VUfBJ+5lXtN6OHnmC0/WhVnVF7wpQum2WEJw18UfyNHkCscFICIC/pSx7G7CjVYTiEd
         v8GP/F3vPzKQj+Rk0ZEccPxRiSYVQiqaSFY6qThUkDVJLB7h7/BMQrgV1TlnJQ3LCp5q
         1+KA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8MaThPnITx6y3r62F8ynp4eb/6D23tX1j/gYgPi2fh5iSPpau3AeLbh5TDVQhA8hIUrBB789QwLXTzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YynwFz9hQWlkyF6DOvEO9g9S6t1EaAqR0VmdZ3MRoBlANFkrBYH
	sOf0VxcEwiI43vN9qoDsyjQfeWlcyNBUgCBsnYYSPyUVIKelDwUNCEaG
X-Gm-Gg: AR+sD12uepgTMK0pp0K4lkD6X2cs1zK8HTWPM/9Pg5ObzrJ0KzpOVN1CkvAGr4SHfIH
	jPxLDSM8UV+I25gVtP6TfFbDSNS4JnKq5MlqJYbPR5gwid/FKNFYuzyIqprsUnv9KESbD/d12Eg
	WTJZcbrc6LyEc6Zvs0JgF9rL6yal/b0vgAqwxFbUxL5zynslUKUXQpn5KoxJ65kiDLNomrlytPn
	D8hcPrvdPghHm5yC7UP5Po7vok/bguwC+uvLDPI/MyDr9X4KPMMoo8I3SPntgwYq9htqYlsqkAo
	jxyHgT18xhEGtmN9E79/vJ4gMrAvzaRFzHGCnf4YKLv7iEg/PIY2T5bV4KgJqESS2dM23fA/voc
	1EBk3VKezPbDVQWT4HD2Ry+u6H2IR3ax+keAZjn3SftxqEqAKcOnvN6bqkS0ZyU/ssN1pnzV9J7
	kII5tx12iwN5vSOpA/bWYs/EHnSnoM/9W/HBw893gg+uMBU+J1JrNBWs3q9Lgw8BrScg==
X-Received: by 2002:a05:6a20:4305:b0:3c3:8aa8:6caf with SMTP id adf61e73a8af0-3c67dd8a496mr347939637.27.1784936105616;
        Fri, 24 Jul 2026 16:35:05 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:40e1:40e4:dabe:543e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc548e63sm3361657eec.19.2026.07.24.16.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 16:34:57 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: ti: omap-twl4030: use per-device instance of headset jack gpio
Date: Fri, 24 Jul 2026 16:34:30 -0700
Message-ID: <20260724233432.31325-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724233432.31325-1-dmitry.torokhov@gmail.com>
References: <20260724233432.31325-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hs_jack_gpios is being potentially shared among several instances of the
same device, and is being modified. This is not the best approach to
structuring the code (even if the device is in fact a singleton).
Change it to allocate a per-device instance.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 sound/soc/ti/omap-twl4030.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index 950879fc7275..4abcfff04bc7 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -28,6 +28,7 @@
 #include "omap-mcbsp.h"
 
 struct omap_twl4030 {
+	struct snd_soc_jack_gpio hs_jack_gpio;
 	struct snd_soc_jack hs_jack;
 };
 
@@ -123,15 +124,6 @@ static struct snd_soc_jack_pin hs_jack_pins[] = {
 	},
 };
 
-/* Headset jack detection gpios */
-static struct snd_soc_jack_gpio hs_jack_gpios[] = {
-	{
-		.name = "ti,jack-det",
-		.report = SND_JACK_HEADSET,
-		.debounce_time = 200,
-	},
-};
-
 static int omap_twl4030_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -144,9 +136,6 @@ static int omap_twl4030_init(struct snd_soc_pcm_runtime *rtd)
 	 * only want to add the jack detection if the GPIO is there.
 	 */
 	if (of_property_present(card->dev->of_node, "ti,jack-det-gpio")) {
-		hs_jack_gpios[0].gpiod_dev = card->dev;
-		hs_jack_gpios[0].idx = 0;
-
 		ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
 						 SND_JACK_HEADSET,
 						 &priv->hs_jack, hs_jack_pins,
@@ -154,9 +143,14 @@ static int omap_twl4030_init(struct snd_soc_pcm_runtime *rtd)
 		if (ret)
 			return ret;
 
-		ret = snd_soc_jack_add_gpios(&priv->hs_jack,
-					     ARRAY_SIZE(hs_jack_gpios),
-					     hs_jack_gpios);
+		priv->hs_jack_gpio.name = "ti,jack-det";
+		priv->hs_jack_gpio.report = SND_JACK_HEADSET;
+		priv->hs_jack_gpio.debounce_time = 200;
+		priv->hs_jack_gpio.gpiod_dev = card->dev;
+		priv->hs_jack_gpio.idx = 0;
+
+		ret = snd_soc_jack_add_gpios(&priv->hs_jack, 1,
+					     &priv->hs_jack_gpio);
 		if (ret)
 			return ret;
 	}
-- 
2.55.0.229.g6434b31f56-goog

