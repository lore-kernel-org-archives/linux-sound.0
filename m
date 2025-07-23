Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4601028466F
	for <linux-sound@vger.kernel.org>; Wed, 23 Jul 2025 09:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753262422; cv=none; b=tE7SiTM8s6meY4iQRYdem+3HO7kDznn2ItkSfSmmo4NzXAhnxtmHQeSpJZi4RJ73CV+sL+oq5D2mfZPSeeALreRsaEXxyAcixicElsOcV2UjZu6ra1RGQGvqsdYJfuswFn6PCOqJ36oPlx5hRlFXzfVr75uYVPdD0srkWsracmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753262422; c=relaxed/simple;
	bh=ODou1hMcvFPHXSy6uZveAERgEdp3OytuUqZprLeJYxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KAf+MS3ONtdm1MlIaI5K8/6YQ9hbC851vpv5oQR5bFjTrcUeoyb3wRWCPx72FoEC/oRDm0jSnv4ALG3XCQzP1q6t1Ub0jHG8f3Hh5ms7vtUuyfoiffxkjYYKxYEACmRr8cbi7WgiMIWDtvD3ufmCxKh7bXUgI9W5VpOgUU9WtRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jQ8AgMYU; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jQ8AgMYU"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-74b56b1d301so4267339b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 23 Jul 2025 02:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753262419; x=1753867219; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5ohlcswCHUarwQMsmPE06bAiOj6zoZwHyM9beSDSD8=;
        b=jQ8AgMYUKKOXKNECopVUMRC8E0i1bbB6nHJ/gMouBVIL4JrHbJ/PXnfZUMSIMj0yD3
         dfHazOjHkGJb0+436TRMPdW0+OCBBKLRZyn4oWdekESSy3zBcNgEBGke2Z08S0g6hQSN
         tABn8r83FvGEvazRJWz8kImu34eWmfuhogT8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753262419; x=1753867219;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5ohlcswCHUarwQMsmPE06bAiOj6zoZwHyM9beSDSD8=;
        b=q+tgvDLMpTRzYoY0AaGJqThoFupo9yRJvNoBwecqF3UMc5sOwYaoQw151tnnu66FnM
         M6zBr9tFTDtOfS7M2YoMHtiEEqOvdKieabjzgbqWDTFZfh1tuCb8Tl4b+gCYyO1awdLM
         eIpQPoZCn6d4UVXAB4cCB7UEhOGbY3OSvl6FV1Gf0XY/yxMfGziE2QQKkE5h4PKlStVA
         72Imc2eK3S9aMdIF/nhteKQW7eKWd+xum8PTnQS1YzIkpxqFRC8ULy1KH6CzTGPYzqhB
         4AMp1RRAbA34+zsLEbQIisIRLlcah6ggzb2515oALpJuCIMDRTADhF6nqlknu5SiREEq
         xFHA==
X-Forwarded-Encrypted: i=1; AJvYcCWqrqApvrbBlK0NbA1Q7bGpFTXB3uqUN0c+dWsptK3miqIJRHiqHTcSi/mzu5dHo4lnWyitBhzCgwiCFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqQPihwX33kICpVxJUfIH3G2waWiQM6WCWqWapr7inoQaHtbvh
	FABWH+wRXYl8aFbQ3h7JTHCQjpNUD/IjRelNeUn121hT1dBy1NspStHAZG2wZPwSFhIAYw58gxN
	6NmM=
X-Gm-Gg: ASbGncvAHmihWDWpEacjBSVmTaDY1WbZ+KC44hOFK5ilGILyl4CqbbePXGxf7/7RIS4
	u0ynek8XZd+P+2c05ofJbP9tb8Z3cvXkueB4nw5D5wVKGhQLBWn7wsL3Vsn4phMp5Lv3bdsUOXW
	m30dAo2vyI2pfZv3Gljx/80TvaGhZUsY3i3lzgFYPxnJEqTGYmheyXbY0UwFsMAtCL0kQaEHOSE
	RUAO8/Yn/onaLwV3z+OzIYVdMti5xHiE1jtOiJwRfLDc8aqD2jc4X8f3wyRQkxgzLutCpg2w5lt
	SYm8SLitRN2uH67C+W4n+vqZm/D3usyKq8uFWZ8y3PH55hXzfd+MwlfLMonBZ2HJQ7TqIFhKrCn
	DAw/M546jnH/ZjIeRCeGDWpJDD+iEfKjP7uv9rhJtkh+KeL4z0RXXwvvdtvw4
X-Google-Smtp-Source: AGHT+IG7/nlgACJp+VfqCvvLKN8+mhu1LidQEOhNCH9PEZufUuMCmSN6xu9KROi8r7za7e9D6ENl4Q==
X-Received: by 2002:a05:6a00:a0b:b0:74c:efae:fd8f with SMTP id d2e1a72fcca58-76035df4f41mr2885545b3a.15.1753262419160;
        Wed, 23 Jul 2025 02:20:19 -0700 (PDT)
Received: from htcheong-p620.tpe.corp.google.com ([2401:fa00:1:17:5a52:716c:aaf0:9c18])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbb71f6bsm9297359b3a.124.2025.07.23.02.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:20:18 -0700 (PDT)
From: Terry Cheong <htcheong@chromium.org>
Date: Wed, 23 Jul 2025 17:20:11 +0800
Subject: [PATCH] ASoC: mediatek: Use SND_JACK_AVOUT for HDMI/DP jacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250723-mtk-hdmi-v1-1-4ff945eb6136@chromium.org>
X-B4-Tracking: v=1; b=H4sIAEqpgGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcyNj3dySbN2MlNxM3WSLNNO0FKM0U3MTAyWg8oKi1LTMCrBR0bG1tQC
 Bxi+xWgAAAA==
X-Change-ID: 20250723-mtk-hdmi-c8f5fd2f5740
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Baili Deng <bailideng@google.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Terry Cheong <htcheong@chromium.org>
X-Mailer: b4 0.14.2

The SND_JACK_AVOUT is a more specific jack type for HDMI and DisplayPort.
Updatae the MediaTek drivers to use such jack type, allowing system to
determine the device type based on jack event.

Signed-off-by: Terry Cheong <htcheong@chromium.org>
---
 sound/soc/mediatek/mt8173/mt8173-rt5650.c                  | 2 +-
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c         | 2 +-
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366.c                  | 2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c                  | 8 ++++----
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    | 2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c                  | 4 ++--
 7 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index 7d6a3586cdd55734358f66428467466ae756da38..3d6d7bc05b8721a27483d5d7e51ba87fe7363b8b 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -159,7 +159,7 @@ static int mt8173_rt5650_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_AVOUT,
 				    &mt8173_rt5650_hdmi_jack);
 	if (ret)
 		return ret;
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index 3388e076ccc9ee4d372713571f459cff81dec1e5..983f3b91119a9253796c6017bad155161c747904 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -378,7 +378,7 @@ static int mt8183_da7219_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_card_get_drvdata(rtd->card);
 	int ret;
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_AVOUT,
 				    &priv->hdmi_jack);
 	if (ret)
 		return ret;
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 497a9043be7bb62405b9ec3b0b4a9e09e0153be7..0bc1f11e17aa7a40688d706966dd0bb1ed414751 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -383,7 +383,7 @@ mt8183_mt6358_ts3a227_max98357_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_card_get_drvdata(rtd->card);
 	int ret;
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_AVOUT,
 				    &priv->hdmi_jack);
 	if (ret)
 		return ret;
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366.c b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
index 43546012cf61341ad87d9084465af4a430c96230..45df69809cbabf7af571576d230bd44dd9d89f1e 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
@@ -362,7 +362,7 @@ static int mt8186_mt6366_rt1019_rt5682s_hdmi_init(struct snd_soc_pcm_runtime *rt
 		return ret;
 	}
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT, jack);
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_AVOUT, jack);
 	if (ret) {
 		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index a2a76b6df63118a016ca414c39943f7a30f27a71..e12537c400e5fdd7565f8322470997f30947ee26 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -250,14 +250,14 @@ enum mt8188_jacks {
 static struct snd_soc_jack_pin mt8188_hdmi_jack_pins[] = {
 	{
 		.pin = "HDMI",
-		.mask = SND_JACK_LINEOUT,
+		.mask = SND_JACK_AVOUT,
 	},
 };
 
 static struct snd_soc_jack_pin mt8188_dp_jack_pins[] = {
 	{
 		.pin = "DP",
-		.mask = SND_JACK_LINEOUT,
+		.mask = SND_JACK_AVOUT,
 	},
 };
 
@@ -638,7 +638,7 @@ static int mt8188_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 	int ret = 0;
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "HDMI Jack",
-					 SND_JACK_LINEOUT, jack,
+					 SND_JACK_AVOUT, jack,
 					 mt8188_hdmi_jack_pins,
 					 ARRAY_SIZE(mt8188_hdmi_jack_pins));
 	if (ret) {
@@ -663,7 +663,7 @@ static int mt8188_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret = 0;
 
-	ret = snd_soc_card_jack_new_pins(rtd->card, "DP Jack", SND_JACK_LINEOUT,
+	ret = snd_soc_card_jack_new_pins(rtd->card, "DP Jack", SND_JACK_AVOUT,
 					 jack, mt8188_dp_jack_pins,
 					 ARRAY_SIZE(mt8188_dp_jack_pins));
 	if (ret) {
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index bf483a8fb34a482a76b1c8d799b9e9c8472d0f57..91c57765ab57b2d556d82629b98a36f837b3c995 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -368,7 +368,7 @@ static int mt8192_mt6359_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT, jack);
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_AVOUT, jack);
 	if (ret) {
 		dev_err(rtd->dev, "HDMI Jack creation failed: %d\n", ret);
 		return ret;
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index e57391c213e7d2bea375cb6006927af3abf503da..7b96c843a14a5b461b9e9a7e7026252e8a1ce19c 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -360,7 +360,7 @@ static int mt8195_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
-	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_LINEOUT, jack);
+	ret = snd_soc_card_jack_new(rtd->card, "DP Jack", SND_JACK_AVOUT, jack);
 	if (ret)
 		return ret;
 
@@ -375,7 +375,7 @@ static int mt8195_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
 		snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
-	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_LINEOUT, jack);
+	ret = snd_soc_card_jack_new(rtd->card, "HDMI Jack", SND_JACK_AVOUT, jack);
 	if (ret)
 		return ret;
 

---
base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
change-id: 20250723-mtk-hdmi-c8f5fd2f5740

Best regards,
-- 
Terry Cheong <htcheong@chromium.org>

