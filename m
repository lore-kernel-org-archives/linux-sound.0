Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E755C423E98
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 22:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790287546; cv=pass; b=nbfH4TbzDfwAOrP1awQK7+U6n+fRXv4VgbsL7/Wo+PIAFDRsZsbK7hbMYBXEpdqs/z418wb5a3iyk8iDPu2G6bAa0Hthh5Q6oL+Lol8sOwwqVMuPYfAABPjycEaPIW2zaLimNSlGyVKcv7m1osRKKyl4gu5VYY7Qihe/QoFBqfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790287546; c=relaxed/simple;
	bh=7PPsh/wW2qYS0wehKM/K22j5ddH8fM0u5YOYLVc/dJE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Cze+Mn4cFL938vYP/TFDy2rAF0CnbD+vORFhzCAXZeYjrkPjWrHDftSaHAVGBV3Xxtal8WMkCBhbZDBbLq0VQg1p8Bq7GXYTWuA9v7PPZ8iFFVJN4T2FXqvjbeWD4Plgd2CPc+seadfKVzs+v2BMWwOAY7xAWn0ge6iFfVoc3Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpIRWLif; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpIRWLif"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d33431c8so29846666b.2
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 15:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790287543; cv=none;
        d=google.com; s=arc-20260327;
        b=Q6q5Vq/8ApeU2M/EI6ut1xCUNzpzuWB4oLZF3ccZaF8e0Op4Ln9eBzDbmiiwIguHPw
         pLCSAZF9HTNCWYKICAyYGm7h787vf+nfYB/rZ1fFTC1GYp2tlr2wZCNtOcbbG7F1AjGx
         HuLQRWCpmOhwS/lKo9b3mfmKPilglPtyVX3YgK3ASbXLlqSPmDYfpskFrLcusibLFLDU
         9VHxkssDl98Od9KLqghwXwCBZYwCa3SjH4TOFXYQnPpQYUvhtpX7d1jmjqeq8dkVg6sP
         Y1Hax+oUFpu6Ba1WhWiNeXzg65NFfZaVobAR6NKVrzaCf99rAG/sYC3IYlxN/aHgCyeX
         J8+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6kv1ryWLeMdgaQcXq5k3ZZjVELOih2y5Rsy9nUxZ+Oo=;
        fh=RWTN9QdFxPOLPkxNHob92ML6Y9yuMn0/hnmlh+YE0fc=;
        b=Tce/Qg+P+hP3M+kg327ntBq+lJmhI4vXMrkTdScRcsMy7IG+vZB1GqrCIsNYvKuQrH
         sc8JlSwhaU6XetLd+WGur3d6e5bkV0kYnLrCcg8g4k4YbTWBl7LFnKdK/VJuv8a1Nevz
         RHSWIrfwZSWVuc2hq1tU4qkVyxDLvqPLj9OCRFL3W0jb+ChjeM55vIWXjI0VJqYeQn2S
         FIGZyXAkQEEq4AOYQlUQxeGPDD3Arldu8wVqzUPv5ZFaMezsgJHbcaN4KCEQiF+tMSq1
         CQLM1NplRs8pDZM1g5nFvobqdmbVUYu6LAH2xHPCx0bgeMpg3I/QrkPFKGIBo+yqOMVu
         mX2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790287543; x=1790892343; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6kv1ryWLeMdgaQcXq5k3ZZjVELOih2y5Rsy9nUxZ+Oo=;
        b=FpIRWLifOQ3iKnOOs7b8sMZ2HgAjhA4WBWkYE81d4ilFoVu4ymzBc4AAU3OguiSgfV
         AkyOrV3YRKfl6u1pxGUC+dsCXWXP5toONBLAGsURWiITMVCjToWdduZvwq+XakURyytZ
         8SbCUok13xnHJZx1tqZVM4l03RCqK3RRmXv4J/Xc0KjxCKXyjZQSOBgfa9yXOqWC/9z8
         /kuOpYT/F1OBKcUtoxMWVcezsEqlLj3rCFRR8h7NdrO5ea3Q/HHWXg7FjFS4NUuyzG7d
         XC2J1oQ2+e/mYjHYYpL2fPmcFNnFHvIPKQ2r5Ub1d0Soh2HsnDMs84r3F0b6AlCV1p8R
         g1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790287543; x=1790892343;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6kv1ryWLeMdgaQcXq5k3ZZjVELOih2y5Rsy9nUxZ+Oo=;
        b=H0zysO4baFZoeD9ES4p81Sr75WC8pvAXLtfSSJMTgBd6XG65MwQj0ME7rY38WBBU2g
         CYDbhOhBluq12g2SOnxH4F7uXyoHG8AA1SOxSdE/vJmkK4XlQoAF0fQFtUWqYgQ3JB+X
         avyTRBJ0Ec0ug3nJ6ojmirQEXrVyBxfYddPYUVRo6s74WqViQkMXIc2gx8ix4g+Pxn/1
         ca2tRgqRYbcJhy4dLA7k/NgyUfiDkKm8IfzSNv5rYxxfRqHvTEjpdBkX9uavUCzExwIj
         pNTHaZUDMGNTwz5HF8nIPpIKmIi6ZzXWJ4eJ0oBBQnh0RBRKlYk59y6RRfOMjttxqiO3
         Sysw==
X-Forwarded-Encrypted: i=1; AKwUvBw0JbNb66+pNWCsaJL3CUlT2ms0XTETJlbAJQ34I2JX6MztQWM7vNnL9OhU4T0I6RIq/yTfRQ5dqlfpPg==@vger.kernel.org
X-Gm-Message-State: AFuF++nHej+D4SWnZ/3PfqaQ/zeYmbdoKaUuVIbJOISE6DaAn9n2XpdN
	GUczzLPsghwbOS0aP4twEhHvibClsDa/j9bY4r2RU4RwUVev6Rm1fpkQmKY+EcCYKMeqVh+8J/P
	L5VgSLHP2WjQyuOIIFEeJcfgfxcpo6A==
X-Gm-Gg: AYBFou3f8SolHv3yh/ZbLQfuFD1VxReRe3Mvsc1SAKfZuj8e2aYBsu7Z176Qv0AUcvH
	/QHZU6fbgQlLxKsqgNqUa+NEdFytfNZKDerpteFQ3T4as1/2d5fkvsuiIGHOqFgIjnogeRpqW7d
	kxN3Yg/2W5uMsmEPADI5LV6htqpNZqdaJxy1B2DbQgSXDOWNdPfC57Ov+YrnoFT9fbJng7E6LGr
	NgfMeWszkKjdaQ2aM6w60gZm4yhMTB+7CrfGTwpjtsUnjE6JNMqYAGW5yCavI1yH4G725di/hMF
	fCqgLOx+S2vnRkj19isGgVyun4+WBKLX+Kb1cMfpN5/oIecTZcDSDnvFc+rNfD0/dh+lD/wMvTl
	xzJc9LFgehcBmz1u16j4i0nMY4hzqJQE2oFzkjsc31xWfMfzPWLz9oByMXsGOY6OZ
X-Received: by 2002:a17:907:97c3:b0:c20:21be:ea75 with SMTP id
 a640c23a62f3a-c2ac2314317mr320652666b.8.1790287543018; Thu, 24 Sep 2026
 15:05:43 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 15:05:41 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 15:05:41 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Thu, 24 Sep 2026 15:05:41 -0700
X-Gm-Features: AclHuK9Xiiy-R-_FFYfGSBij1yu3Nb9Lv8izicpagfcw0kj18_ng_woEl_xQff8
Message-ID: <CAGEsz8G_s8_HRnHH8s+NvXWXV8Uz2xRDY+He9M57v_fW4H42VA@mail.gmail.com>
Subject: [PATCH v3] ASoC: wm8962: Stop IRQ from requeuing mic_work on remove
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: ckeepax@opensource.cirrus.com, patches@opensource.cirrus.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"

The WM8962 IRQ remains registered to the I2C device when an ASoC card is
unbound. wm8962_remove() cancels mic_work, but a MICD or MICSCD interrupt
can queue it again before the component is destroyed. The work then
accesses the component and reports to the old jack.

Mask microphone interrupts in wm8962_mic_detect(), wait for a handler
that may already have read the mask, and drain mic_work before changing
the jack pointer. Install a new jack before unmasking the interrupts.
Call this path from wm8962_remove() while the component is still valid.
Leave the IRQ registered for FLL, FIFO and thermal events.

Tegra's card remove callback runs after ASoC removes the codec component
and PCM runtimes. Drop its redundant microphone cleanup.

Fixes: 0512615db6db ("ASoC: wm8962: Convert interrupt handler to
direct regmap usage")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v3:
- Use the existing microphone interrupt mask in wm8962_mic_detect() to
  stop new work, then synchronize the IRQ and cancel pending work before
  changing the jack pointer.
- Call wm8962_mic_detect() from the codec remove callback and drop the
  now-redundant Tegra card remove callback.
- Keep the IRQ registered for the other interrupt sources.

Changes in v2:
- Do not disable the IRQ from wm8962_i2c_remove(); card unbind does not
  unbind the I2C client.
- Keep the devm IRQ on the I2C device for FLL, FIFO and thermal events.

Found by inspection; I do not have the hardware, so this is not runtime
tested. The modified codec and Tegra objects compile, and checkpatch
reports no errors or warnings.

 sound/soc/codecs/wm8962.c      | 29 ++++++++++++++---------------
 sound/soc/tegra/tegra_wm8962.c | 13 -------------
 2 files changed, 14 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 8a9598161b35..7b09de65a009 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3230,21 +3230,22 @@ int wm8962_mic_detect(struct snd_soc_component
*component, struct snd_soc_jack *
 {
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	int irq_mask, enable;
-
-	wm8962->jack = jack;
-	if (jack) {
-		irq_mask = 0;
-		enable = WM8962_MICDET_ENA;
-	} else {
-		irq_mask = WM8962_MICD_EINT | WM8962_MICSCD_EINT;
-		enable = 0;
-	}
+	int mic_irq_mask = WM8962_MICD_EINT | WM8962_MICSCD_EINT;

+	/* Mask microphone events, then drain the IRQ and work before
changing the jack. */
 	snd_soc_component_update_bits(component, WM8962_INTERRUPT_STATUS_2_MASK,
-			    WM8962_MICD_EINT | WM8962_MICSCD_EINT, irq_mask);
+				    mic_irq_mask, mic_irq_mask);
 	snd_soc_component_update_bits(component, WM8962_ADDITIONAL_CONTROL_4,
-			    WM8962_MICDET_ENA, enable);
+				    WM8962_MICDET_ENA, jack ? WM8962_MICDET_ENA : 0);
+	if (wm8962->irq)
+		synchronize_irq(wm8962->irq);
+	cancel_delayed_work_sync(&wm8962->mic_work);
+
+	wm8962->jack = jack;
+	if (jack)
+		snd_soc_component_update_bits(component,
+					      WM8962_INTERRUPT_STATUS_2_MASK,
+					      mic_irq_mask, 0);

 	/* Send an initial empty report */
 	snd_soc_jack_report(wm8962->jack, 0,
@@ -3592,9 +3593,7 @@ static int wm8962_probe(struct snd_soc_component
*component)

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
@@ -97,18 +97,6 @@ static int tegra_wm8962_init(struct snd_soc_pcm_runtime *rtd)
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
@@ -129,7 +117,6 @@ static struct snd_soc_card snd_soc_tegra_wm8962 = {
 	.owner = THIS_MODULE,
 	.dai_link = &tegra_wm8962_dai,
 	.num_links = 1,
-	.remove = tegra_wm8962_remove,
 	.fully_routed = true,
 };


-- 
2.53.0
