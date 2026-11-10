Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794287296;
	b=WFmTipL1shDi9geGia4wi2mq0FI5L/3+/SS7kLj5gM9ZD0boUQFZrWqfCYkFmHKx5krj
	 /cNjXXFwEs1TOzHyG7GlZp/y4S1L6Pr0/mgPOAHFBW5qJHebmdKQ0Nx60iFJfnG7SpbXm
	 Z5ydmRNiOAStOjHoEwuwt7wnYmkMQfjx7uqhLUI/8pSP8p38YUmchXPW8uEgXmVTokrUx
	 MV9aBErf/q1baZlYTsTzKFV/wG5vn8nONJy+ZJ9Yvb6vY6t2Wtn1OljeVa52qvpvnmlaR
	 EN5EnIdU6LI11nCB9ONdypECvAld5i6AZ5OCZgkLJ7JJ7SzQW+nHcX/YFr51J+ljA6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794287296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uqjEjkaxes0qicdPDD9LDyvBW4T968M1FfYrP68rAAE=;
	b=Y3nJHh0VUuvax4Ayte1m7oFgV4RjtY8mSAqA0Loa3qlV9beIAFfjmH6Ce4br6Z9M2x0b
	 PIVHi/hAQxH5QSSnK8IHlCKJwRlwNuai0Ou4Evo9uVkn7aZfefYOyARBSs7qwOaVOLk2K
	 ku5ZXf3LdWXdF9uL4lp8LEA8tMvgs/y53NizoyOP9jvizjZ6IFw0zoW52fQEfIHj8wxNZ
	 aGkWj/Hx624hvrSGTD0+JQ6BJCD3e5pXSYx+1/VmH+gBDwTFPOY6AyUVnFyRM9bdjDR3E
	 jVx93Uaq9LoDTYglb//QAdAQgIjtBemo9EVlnpbr1ZynbMPM6OWAgfthW25RxOdiNGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LM2jeGhl;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2227D606A325
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2227D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LM2jeGhl
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91befbcad6dso18855506d6.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 21:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794287295; x=1794892095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uqjEjkaxes0qicdPDD9LDyvBW4T968M1FfYrP68rAAE=;
        b=LM2jeGhly9EsTrZhPdy9KYDsv7PKM1mEJcgHQAmE8psDhCbkRIYe+q8dXoEoaZV0Wd
         YOkB4gEHGfwYa8wGjFmKQrcnVeetXxHPJO0kbq0e6rLl8DTcgcs0mv1dXkxP40XFtYML
         ux9LEU2Iml+vGvU7ITB7dJMl6Bz9ks2Fa4cBtCCSOpx4Yiwu9VyxF2h9Loy8aiAI5egY
         HNGjvk1W3qFCVijBP+VcrCHkKOf+1RVZKmDm9HlGuxbU/xbsG24DHYtkRIZt3rv6MXyD
         baWqKMVU+5yCdjReo0Ju3TLshoEMT6ZREpoHogh8QL8Afpe+8KLBZtlkTmu7TEDp9aCc
         h6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794287295; x=1794892095;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uqjEjkaxes0qicdPDD9LDyvBW4T968M1FfYrP68rAAE=;
        b=MbqQ8SyGSqVcDzCj/X4B2Pm4uC7zMCJV1vJKd6ggrUbGyXwOmtXNzRlRKofHNaVmYs
         bllC7LFexg/LrgVYM9kzozNqRgzsutcsUv85fgDZBYbCNFHVedHCaae2CPaGicB1/WcU
         ADi1NJyMYaW96UGOWHPKKZw8eAD6BeigoYY6pHt1H/WU6zxoQhtOnca5XGs4uq1upMsJ
         WV+2qspKPm88yIp9FBpmmRE7qU7ELPtiVbcvhUUl1sevp6yvpF1eNnmU5J35atjhwMlP
         6P/pRwgGkdR8zIiC/uqgQIg9GD4ayMM5Si63OoI1jYTRHnQxNz4yclm2oh03i4v2QajG
         GYrQ==
X-Forwarded-Encrypted: i=1; AL+hErE+OiDZ+WxvZWggxt57a8H3aAPQeuBnDBmGnurJPqTT0idIUlvYS7SMdPUeilIf6UbTjKts4YnOJXM39A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+4xOAaxSEM0uoR7Z7Psh59oKhoIjB9ExE+rZAykYgRnmXm5HtX
	8mI0YiRfeVlX9VgzC2BPYJ6E+RZJQ5bnci7Z15+g4oSqubwjsxMg0MI=
X-Gm-Gg: AYBFou1GmyK/AlcosVKRdVvLLB6SSrnMsPp9eV2oesjMoxhzKmHKLtUWWRtnYePqoWX
	xukf7ddQt3otGVG1eAx+I2Tk/BXGyP+1Xo8Bj1JHXBqP3GXj9seL+bvjwVVPRVTQy9grmtUmbBE
	rlgDSbclISaa0GPHX2um1ibKrQv8TiycsBjai7/ISaj1xucb7JnNMawQVA9REE+TPSZq4yjW/OW
	R47SgKQ/VrVZbZplb9C/KjUeesjf5AFDron5Y5sTxSHA0AVkuFZQUDuG85rzCsk3cAiychCxRHP
	h2VepdyGOBfTg04qo1Zjp2J4A9KC9f2+jlXywbabsXPukFbMr7hjDaYk2iMgEr731inqXYp5ki8
	RmEDvaubfuOZ9hofYqCo45+Tm5/WQdrpC0IzY47xrTk15wOeCIIis7SE8VNc5/f2MAMRYAhhvG0
	TLCKNDLxWyS7prV+K2JBX19t5xJ0sMA0G9uDQ0ADq4pYcSjlfZedLSsM5FcQww6ZtsMELSuwdPE
	986W7MqnT8lx+Zu0aWHz3+Y+KwL4v4ufZiS7TqV6z2HCi0rGj2nKXI3zjvzB6dNAUwlwyLwTXKV
	mJYAIvGMlhkomPFarY5VfvB0nKp6VnW8W2NeG79mIOgt8LLcHbbnOFG1PkdEe/ezIEdz2boublz
	W+5Lm5jg5kWb2mOh4LEGQmjBQUiwh86+ndw2PZz9Obx0J+WTpJ5svJrcEw5evXxXcme/X5VMCGq
	R6pxeWxTk9qg==
X-Received: by 2002:a05:6214:2b85:b0:91c:60e8:a8ab with SMTP id 6a1803df08f44-91eef81bda5mr29310036d6.37.1794287295004;
        Mon, 09 Nov 2026 21:08:15 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0547744sm12648546d6.44.2026.11.09.21.08.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 21:08:14 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v6] ASoC: wm8962: stop microphone work before component removal
Date: Tue, 10 Nov 2026 00:08:12 -0500
Message-ID: <20261110-wm8962-v6-c78c17edd171@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The I2C-owned IRQ outlives the codec component. Cancelling mic_work during
component removal leaves its producer running, so another microphone event
can queue work for the old component and jack.

Mask microphone sources, synchronize the IRQ and drain mic_work before
changing the jack pointer, regardless of whether a jack was registered.
Disable microphone detection during cleanup only while holding an active
runtime-PM reference, because its control register is volatile. Keep
unrelated IRQ events available.

Run this cleanup unconditionally from codec removal and drop Tegra's late
card remove callback, which runs after component and PCM runtime teardown.

Fixes: 0512615db6db ("ASoC: wm8962: Convert interrupt handler to direct regmap usage")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
No hardware testing.

Changes in v6:
- Mask microphone IRQs and drain the IRQ/work path even with no old jack.
- Run codec cleanup unconditionally from component removal.
- Retain the active runtime-PM guard and Tegra callback removal.

 sound/soc/codecs/wm8962.c      |   34 +++++++++++++++++++---------------
 sound/soc/tegra/tegra_wm8962.c |   13 -------------
 2 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3248,21 +3248,27 @@
 {
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
-	int irq_mask, enable;
+	int mic_irq_mask = WM8962_MICD_EINT | WM8962_MICSCD_EINT;
+
+	snd_soc_component_update_bits(component, WM8962_INTERRUPT_STATUS_2_MASK,
+				      mic_irq_mask, mic_irq_mask);
+	if (pm_runtime_get_if_active(component->dev) > 0) {
+		snd_soc_component_update_bits(component, WM8962_ADDITIONAL_CONTROL_4,
+					      WM8962_MICDET_ENA, 0);
+		pm_runtime_put(component->dev);
+	}
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
+		snd_soc_component_update_bits(component, WM8962_ADDITIONAL_CONTROL_4,
+					      WM8962_MICDET_ENA, WM8962_MICDET_ENA);
+	}
 
 	/* Send an initial empty report */
 	snd_soc_jack_report(wm8962->jack, 0,
@@ -3592,9 +3598,7 @@
 
 static void wm8962_remove(struct snd_soc_component *component)
 {
-	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
-
-	cancel_delayed_work_sync(&wm8962->mic_work);
+	wm8962_mic_detect(component, NULL);
 
 	wm8962_free_gpio(component);
 	wm8962_free_beep(component);
diff --git a/sound/soc/tegra/tegra_wm8962.c b/sound/soc/tegra/tegra_wm8962.c
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
-	snd_soc_component_set_jack(component, NULL, NULL);
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
 
