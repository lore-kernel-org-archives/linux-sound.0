Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932542135B8
	for <linux-sound@vger.kernel.org>; Sun, 18 Oct 2026 02:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289905; cv=none; b=j7J+KrZ+zJZkNai70dSAYz0KoUohK0/koLZt5dY0ZWklDGEQzADmlvl/5gFan+6kyrq4JTXqbsIqkxDcQY2PacJ/3dEx6Y2ri40j5AwQcegktQglFe3wu6jIOGEi9JFAXq6prinukDBZV/BOcwxT5/aj700Q65oclFDX8KAsXCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289905; c=relaxed/simple;
	bh=Ldrass7YZ/p74jIXxz7+C6GAjM5NGsD+baovS0Mp7zI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gBvrWn3UZlWF6t4cPfz2kHyQcL700WoLcn4at2GYi5ex7GFgXfe6ShZNsrwNm5DXj9RkGF+vcxvD8AOO1Pk0KUNlKLJ7lZisxDbHEBEvnDvOuuAA4JjEQhaSSpWfuaGYwBRZ87/7HrYH9cGi7rLrHTp2H9W1RsfoPS6uu9KsWVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R3ee+uTw; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R3ee+uTw"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5364c951da4so6690581cf.1
        for <linux-sound@vger.kernel.org>; Sat, 17 Oct 2026 19:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792289902; x=1792894702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6h7cwshK4bhZz90I/AWA8AjZrCXIbK39PmBPiXuKICY=;
        b=R3ee+uTwprxc2JW14NDU0JtduFzxZnaWS1T1MlwOEjFRaxm/knlA4OC18hfT/Bfp8X
         Ar8xNgnzfOeyYTj9acl4HCwCqVRaILVss1phmPzkRRKo0Ezre0762/e7a8U4+S/BN1V4
         oVCeLR5kxZ1vfU5QDSR6c4buJMawfIZS+/Y1UmVz/lhh8Vcsg860ZC5fsIZhfdsNF5cY
         iF0SAOjjeFdnE7UjW1mukr63bXq3rYdyOeiA+yYGRuWbCqtbgdkJLhq3FFVhXCNL+2x8
         ixJ7d8NOKYBnDFhMueLibCgHBTZqlDPjepJ8cCcRwEYz22QmZUQGEmfpYuk3rXOeJxFI
         /dWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289902; x=1792894702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6h7cwshK4bhZz90I/AWA8AjZrCXIbK39PmBPiXuKICY=;
        b=dTcLvbdiOAzVt8BvXjyAkNoE0iFcyDY7W/QwlF8KIWt8BIZbKsjfr2m0zzi9+f6eSJ
         01/DZNQuZwfxeJx5WylQacy5gLH9Fub+Pai8jcvPWlxAfG+zK5bNWfuqdB8RB7iuy1nS
         XeTTkQDRnjV71Q7ap3rR+tz3O5GKSyB6P0rrk70XhlAruW/xu1Lezi/epzjYoE8f6GSa
         CZuXGcB09d7NO4pEZbhQx8+onStdmCA4XgXFjOSdp3o8QRC8p+DDO8snPx2Ur0EepcIU
         kFZMYsMGX/lXPXD8gq1SauimBCLd9yyljZJx25zcS97zRAVbtSmo4xqYzsfypbQR4qdd
         aTWw==
X-Forwarded-Encrypted: i=1; AKwUvBzIDNjZj22RuY7diPPYshAhjD4SHWE6HBUKSZnhn857zrWwHHEFbgkaiUZluqpm4YB4lP8eAj2H2OOjSg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ8+7wLQPvM/A1/IzNa98xDy/obGF/MlDKofx0zqHalptghH55
	U531/H+Cuevj/1REvTdSnGMiHQlWBqv2rKchmhBYWYQ++CrdpgZpNbQ=
X-Gm-Gg: AYBFou1qZim9JkMdTQSFdiQR0WOZIoTEGNdewyzxTZs5FKa3o6TqypcjJyB2ebvd2n1
	pWqRqrsh0zY2egyqxBqGHbY8GpN4O2jAwvHDWIxb7QJMN2M8ATvC32VI536Wfr78MJC5u3sDyoP
	X12sN4PVS2ku7auApJcpkTIM6x+9qfXxIouFtd80eLldr0KrfUxASrwM5afqCCQ6HDR9nkPZvuW
	6l2NMx0d/cMxORvVZyEeusjc4EE21zDxproCVh9obIw5aCWaXNsD9fubVsLm7kX1DI4TFekQ5bA
	AxFh+L6eOAjj7RN21VoWRjxVrN3NSuukyO2nByYNvwSDMIYCMA4NcD0RVSkDt24xJbBwIv42o29
	IexPwn2TqdAFZWYZSLOLhPsrHXHlRfj1b0UKYk1VjctVevWzGOepQtyb8a/tpiLCgEFkkKpsENG
	2ZcXEvuWPMlshkHm5i0Gk9Ub/RDoyyOlc6+q1nKwe3IoZnBOSyznm4wtRVcINJ925FV7p8xy409
	riDBQQ/53XzqIoQqhT6pNJKTjLgF3+I7fcUZwLkFKrV7i1b6TeDb4fpO5QxsQoIFTUDtA7+cqSS
	MPHru2/w3l7GyrAUmG13wZWOhF+1
X-Received: by 2002:a05:622b:c8:20b0:535:1683:5a71 with SMTP id d75a77b69052e-53645ff1af1mr42415901cf.38.1792289902347;
        Sat, 17 Oct 2026 19:18:22 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa68f8esm61881881cf.29.2026.10.17.19.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:18:21 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v4] ASoC: wm8962: Stop IRQ from requeuing mic_work on remove
Date: Sat, 17 Oct 2026 22:18:17 -0400
Message-ID: <20261018021817.3859256-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WM8962 IRQ remains registered to the I2C device when an ASoC card is
unbound. wm8962_remove() cancels mic_work, but a MICD or MICSCD interrupt
can queue it again before the component is destroyed. The work then
accesses the component and reports to the old jack.

Mask microphone interrupts and disable detection in wm8962_mic_detect(),
wait for any handler that already read the old mask, and drain mic_work
before changing the jack pointer. When installing a new jack, unmask its
interrupts before enabling detection, preserving the existing hardware
sequence. Call this path from component remove while the component is
still valid, leaving the IRQ registered for FLL, FIFO and thermal events.

Tegra's card remove callback runs after ASoC removes the codec component
and PCM runtimes. Drop its redundant microphone cleanup.

Fixes: 0512615db6db ("ASoC: wm8962: Convert interrupt handler to direct regmap usage")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v4:
- Always disable microphone detection before draining the IRQ and work,
  then unmask microphone interrupts before re-enabling detection for a
  new jack, as requested by Charles Keepax.
- Keep the redundant Tegra card remove callback deletion; Charles
  withdrew his initial objection in the follow-up review.

Changes in v3:
- Mask microphone interrupts, synchronize the IRQ and cancel mic_work
  before replacing the jack pointer in wm8962_mic_detect().
- Use wm8962_mic_detect(component, NULL) from component remove and drop
  the redundant Tegra card remove callback.
- Keep the IRQ registered for the other interrupt sources.

Changes in v2:
- Do not disable the IRQ from wm8962_i2c_remove(); card unbind does not
  unbind the I2C client.
- Keep the devm IRQ on the I2C device for FLL, FIFO and thermal events.

Found by inspection. Compile-tested both modified objects with GCC 15,
W=1, x86_64 and COMPILE_TEST=y. No hardware or runtime testing.

Review: https://lore.kernel.org/r/arY6GbRBjKxJDKVn@opensource.cirrus.com/
Follow-up: https://lore.kernel.org/r/arY%2FVSKn%2Fsq32sr0@opensource.cirrus.com/

 sound/soc/codecs/wm8962.c      |   36 +++++++++++++++++++++---------------
 sound/soc/tegra/tegra_wm8962.c |   13 -------------
 2 files changed, 21 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 8a9598161b35..253b41fff8ab 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3230,21 +3230,29 @@
 {
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	int irq_mask, enable;
+	int mic_irq_mask = WM8962_MICD_EINT | WM8962_MICSCD_EINT;
+
+	/*
+	 * Mask microphone events, then drain the IRQ and work before
+	 * changing the jack.
+	 */
+	snd_soc_component_update_bits(component, WM8962_INTERRUPT_STATUS_2_MASK,
+				      mic_irq_mask, mic_irq_mask);
+	snd_soc_component_update_bits(component, WM8962_ADDITIONAL_CONTROL_4,
+				      WM8962_MICDET_ENA, 0);
+	if (wm8962->irq)
+		synchronize_irq(wm8962->irq);
+	cancel_delayed_work_sync(&wm8962->mic_work);
 
 	wm8962->jack = jack;
 	if (jack) {
-		irq_mask = 0;
-		enable = WM8962_MICDET_ENA;
-	} else {
-		irq_mask = WM8962_MICD_EINT | WM8962_MICSCD_EINT;
-		enable = 0;
-	}
-
-	snd_soc_component_update_bits(component, WM8962_INTERRUPT_STATUS_2_MASK,
-			    WM8962_MICD_EINT | WM8962_MICSCD_EINT, irq_mask);
-	snd_soc_component_update_bits(component, WM8962_ADDITIONAL_CONTROL_4,
-			    WM8962_MICDET_ENA, enable);
+		snd_soc_component_update_bits(component,
+					      WM8962_INTERRUPT_STATUS_2_MASK,
+					      mic_irq_mask, 0);
+		snd_soc_component_update_bits(component,
+					      WM8962_ADDITIONAL_CONTROL_4,
+					      WM8962_MICDET_ENA, WM8962_MICDET_ENA);
+	}
 
 	/* Send an initial empty report */
 	snd_soc_jack_report(wm8962->jack, 0,
@@ -3592,9 +3600,7 @@
 
 static void wm8962_remove(struct snd_soc_component *component)
 {
-	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
-
-	cancel_delayed_work_sync(&wm8962->mic_work);
+	wm8962_mic_detect(component, NULL);
 
 	wm8962_free_gpio(component);
 	wm8962_free_beep(component);
diff --git a/sound/soc/tegra/tegra_wm8962.c b/sound/soc/tegra/tegra_wm8962.c
index 31f9d9181595..a79d464b6a80 100644
--- a/sound/soc/tegra/tegra_wm8962.c
+++ b/sound/soc/tegra/tegra_wm8962.c
@@ -97,18 +97,6 @@
 	return 0;
 }
 
-static int tegra_wm8962_remove(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *link = &card->dai_link[0];
-	struct snd_soc_pcm_runtime *rtd = snd_soc_get_pcm_runtime(card, link);
-	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
-	struct snd_soc_component *component = codec_dai->component;
-
-	wm8962_mic_detect(component, NULL);
-
-	return 0;
-}
-
 SND_SOC_DAILINK_DEFS(wm8962_hifi,
 	DAILINK_COMP_ARRAY(COMP_EMPTY()),
 	DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8962")),
@@ -129,7 +117,6 @@
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8962_dai,
 	.num_links = 1,
-	.remove = tegra_wm8962_remove,
 	.fully_routed = true,
 };
 
base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0
