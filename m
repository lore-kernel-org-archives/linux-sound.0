Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DEF4C9007
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 09:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788858310; cv=none; b=PQdYvs8hWt7idn3UVrYWAkEJ1pM5BEXKO+RLedIP7Jl0AGm4gHfzO/HY9RRgpRDP6LXFZMJ+wN+CitdKdWSJ8jnFpIkAFudg17xbLpsfo2uGQT16bLPi+LQ8pEKRRbTftWqnBljbJ8alKurn2INA8Zd3HAdepxqQ3VhblkGfbQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788858310; c=relaxed/simple;
	bh=rGl5KD/Lsmhceafje8JR5J3lsWCl4QMVB9JZSb6cYSk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MR6ODV2aliOZP9tOWin512b2uavTmXCRaG1eCKipjjUSu2zQn03O/tgkKlcoc6W/1TWrg9WuQ4nsOWYDgZCQ/vKvDqw9bnEfNwFMXK+wRrxXsLxgFQ+CWnGknlSiUxzpae+A6JWq0ihlVx3+ibNjLTQ/y++G2TrmvRXoA3d+CA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5xAaOr2; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5xAaOr2"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2531f453eeso605478266b.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 02:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788858305; x=1789463105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hbChVgQBy46bP5VSQcyBCPGQv7TiEnk5yKXI2w9RsyY=;
        b=F5xAaOr2C7KrexDG2DnrbyfAb8EspUl8KTJNayu3xeF8nOtbhnEojHrnJwM/XrihCT
         6lP0jAv6gmBJGp1HaCDkk8yDgr1/4/cixHYmNEefiQ84oUovIzBLX5TwjcNufxuFijDm
         xe+Ba0JuUiBZQHYEeuvl6r06PBLxK3LgzPM6fup5FnEb39uKg5icGHvHlW1eF4y1TJLj
         QRcks+dMJN207/3HmnFjwLRbxT76AAR4AOeH1qv8O7WKzFcjyfaLjMRGuehOsg+K2AKC
         MPrYsuGspSC7XsGFr1YYcNbXobJOkmbqX/0sdr/EhejjKfQHhrVXKgGQ2ulVYNTRCydW
         IbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788858305; x=1789463105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hbChVgQBy46bP5VSQcyBCPGQv7TiEnk5yKXI2w9RsyY=;
        b=MjACULcMohrfB7L7hoH0DGe4Anj0r1SeLmjn0Vwpos27umLN2djp5uqlq/lWxagxov
         HAiponi/SDrCJok1YnM285fTFZxwwoZJPcBEp/IqnX4Bbjx9kO8dKtiNf3FktNfgt66Y
         VlgFcE58CGpGRRt2hJj82ES/JFDOK2uPQYPSwYamzHZCTZv1GCQXjWWUiH6kpWLAgEe3
         tmVvplGqLKVq5pISb1iVWgxyB3yA8PYhYvJYhmK+CDmwRlNUXnzH3boy8tFg6rJGT4gZ
         e0Ylrf+g7qUXwWVYVzbWCvEKVY5yDpmHYNuVCXj2d0ijk8ZprJWvAAmYEES+M5IAtfAX
         zCkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIW2XAUzmXttcGHAs1jtr63yR2OpYvu9+DRaaip4yCdk2qnBhw1xzsG0qkI4WmUV93MnitMvAk2XT/aw==@vger.kernel.org
X-Gm-Message-State: AFuF++n/LRxacUruNsG7zHCrkc9AfVp94oWFBqaWn3dNndwrKPQLnqcJ
	xJPdOVQQv9IYA2ns1aKrfAtj9/mbQv+Od1IQqtNJQzQ2dTjhKW1TKyEz
X-Gm-Gg: AYBFou1YAm2BD1ISJOmliAtOpas8zJ3nJJ1Me9HAePylJeJDbkI09OZAoTUFnFPBXAN
	1iwcu5+6s1eoAn5KE4vR8ELuT990A6CorRaBXAVDHyynG4eoqmfuKsJv6lbIkG2HElTw4fsIMqI
	CDF6C5UKdxzjfe36vY10D/ED2Ka3UPMqEGmvkN7vC9W17rSG0emLM84rGCuV2MYZQYR2rBbvx08
	49u9S34O3owEz1FCV1R/f0nPU+G2+8nIi0mEAMBUnS7z4QQuM4TjeGxktNLvA84RUEjcgZ9Uh0u
	tM68PEUcpdlSd1KRBEr4sqpufIGeOzq63fEGIYJXRxP4Xv2dnxQ7jGxqGEBELT3OIRfi4RUzSIt
	ZkJG8frs4h5yEyVoYayiGAQFeEvUntLa/am861QeR2FOZzlsWb/7oJ4V+UD8xgsmqxl9WGU1GPp
	U4li+//05G7a3sK4/hNXRFF0Ege2d3f7J+Q13ipQTz07/tcMuVVYISEfhRl+L+Try92rgIbzIzp
	CGdNlkyfQpfXLdnUKW8rQBfBCE8RbNdKSOMuBHmk1SLd0BNZtwe
X-Received: by 2002:a17:906:7956:b0:c16:84dc:9607 with SMTP id a640c23a62f3a-c260ca323dcmr1963636366b.19.1788858305144;
        Tue, 08 Sep 2026 02:05:05 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm34767945f8f.1.2026.09.08.02.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 02:05:04 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Rosen Penev <rosenp@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v6 5/5] ASoC: airoha: Add machine driver for Airoha AN7581
Date: Tue,  8 Sep 2026 11:04:47 +0200
Message-ID: <20260908090448.3332-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260908090448.3332-1-ansuelsmth@gmail.com>
References: <20260908090448.3332-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the machine driver for Airoha AN7581 paired with the WM8960
i2c codec. This driver creates the sound card for the AFE driver.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/Kconfig                |  10 ++
 sound/soc/mediatek/an7581/Makefile        |   1 +
 sound/soc/mediatek/an7581/an7581-wm8960.c | 161 ++++++++++++++++++++++
 3 files changed, 172 insertions(+)
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index eb6f2a443b23..ff2869641a35 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -16,6 +16,16 @@ config SND_SOC_AN7581
 	  Select Y if you have such device.
 	  If unsure select "N".
 
+config SND_SOC_AN7581_WM8960
+	tristate "ASoc Audio driver for Airoha AN7581 with WM8960 codec"
+	depends on SND_SOC_AN7581 && I2C
+	select SND_SOC_WM8960
+	help
+	  This adds support for ASoC machine driver for Airoha AN7581
+	  boards with the WM8960 codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
+
 endmenu
 
 menu "Mediatek"
diff --git a/sound/soc/mediatek/an7581/Makefile b/sound/soc/mediatek/an7581/Makefile
index d6de5ee1668e..f48cd0269bea 100644
--- a/sound/soc/mediatek/an7581/Makefile
+++ b/sound/soc/mediatek/an7581/Makefile
@@ -6,3 +6,4 @@ snd-soc-an7581-afe-y := \
 	an7581-dai-etdm.o
 
 obj-$(CONFIG_SND_SOC_AN7581) += snd-soc-an7581-afe.o
+obj-$(CONFIG_SND_SOC_AN7581_WM8960) += an7581-wm8960.o
diff --git a/sound/soc/mediatek/an7581/an7581-wm8960.c b/sound/soc/mediatek/an7581/an7581-wm8960.c
new file mode 100644
index 000000000000..03ea5732563c
--- /dev/null
+++ b/sound/soc/mediatek/an7581/an7581-wm8960.c
@@ -0,0 +1,161 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Airoha ALSA SoC I2S platform driver for AN7581
+ *
+ */
+
+#include <linux/module.h>
+#include <sound/soc.h>
+
+#include "an7581-afe-common.h"
+
+SND_SOC_DAILINK_DEFS(playback,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY(), COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(capture,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY(), COMP_EMPTY()));
+
+SND_SOC_DAILINK_DEFS(codec,
+		     DAILINK_COMP_ARRAY(COMP_CPU("ETDM")),
+		     DAILINK_COMP_ARRAY(COMP_CODEC(NULL, "wm8960-hifi")),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY(), COMP_EMPTY()));
+
+static struct snd_soc_dai_link an7581_wm8960_dai_links[] = {
+	/* FE */
+	{
+		.name = "wm8960-playback",
+		.stream_name = "wm8960-playback",
+		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
+			    SND_SOC_DPCM_TRIGGER_POST},
+		.dynamic = 1,
+		.playback_only = 1,
+		SND_SOC_DAILINK_REG(playback),
+	},
+	{
+		.name = "wm8960-capture",
+		.stream_name = "wm8960-capture",
+		.trigger = {SND_SOC_DPCM_TRIGGER_POST,
+			    SND_SOC_DPCM_TRIGGER_POST},
+		.dynamic = 1,
+		.capture_only = 1,
+		SND_SOC_DAILINK_REG(capture),
+	},
+	/* BE */
+	{
+		.name = "wm8960-codec",
+		.no_pcm = 1,
+		.dai_fmt = SND_SOC_DAIFMT_I2S |
+			SND_SOC_DAIFMT_NB_NF |
+			SND_SOC_DAIFMT_CBP_CFP |
+			SND_SOC_DAIFMT_GATED,
+		SND_SOC_DAILINK_REG(codec),
+	},
+};
+
+static struct snd_soc_card an7581_wm8960_card = {
+	.name = "an7581-wm8960",
+	.owner = THIS_MODULE,
+	.dai_link = an7581_wm8960_dai_links,
+	.num_links = ARRAY_SIZE(an7581_wm8960_dai_links),
+};
+
+static int an7581_wm8960_machine_probe(struct platform_device *pdev)
+{
+	struct device_node *platform_dai_node, *codec_dai_node;
+	struct snd_soc_card *card = &an7581_wm8960_card;
+	struct device_node *of_platform, *codec;
+	struct snd_soc_dai_link *dai_link;
+	int i, d, ret;
+
+	card->dev = &pdev->dev;
+
+	of_platform = of_get_child_by_name(pdev->dev.of_node, "platform");
+
+	if (of_platform) {
+		platform_dai_node = of_parse_phandle(of_platform, "sound-dai", 0);
+		of_node_put(of_platform);
+
+		if (!platform_dai_node) {
+			dev_err(&pdev->dev, "Failed to parse platform/sound-dai property\n");
+			return -EINVAL;
+		}
+	} else {
+		dev_err(&pdev->dev, "Property 'platform' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		struct snd_soc_dai_link_component *platform;
+
+		dai_link->num_platforms = 2;
+		for_each_link_platforms(dai_link, d, platform) {
+			if (platform->name)
+				continue;
+			platform->of_node = platform_dai_node;
+		}
+	}
+
+	codec = of_get_child_by_name(pdev->dev.of_node, "codec");
+
+	if (codec) {
+		codec_dai_node = of_parse_phandle(codec, "sound-dai", 0);
+		of_node_put(codec);
+
+		if (!codec_dai_node) {
+			of_node_put(platform_dai_node);
+			dev_err(&pdev->dev, "Failed to parse codec/sound-dai property\n");
+			return -EINVAL;
+		}
+	} else {
+		of_node_put(platform_dai_node);
+		dev_err(&pdev->dev, "Property 'codec' missing or invalid\n");
+		return -EINVAL;
+	}
+
+	for_each_card_prelinks(card, i, dai_link) {
+		if (dai_link->codecs->name)
+			continue;
+		dai_link->codecs->of_node = codec_dai_node;
+	}
+
+	ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to parse audio-routing: %d\n", ret);
+		goto err_of_node_put;
+	}
+
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
+	if (ret) {
+		dev_err_probe(&pdev->dev, ret, "%s snd_soc_register_card fail\n", __func__);
+		goto err_of_node_put;
+	}
+
+	return 0;
+
+err_of_node_put:
+	of_node_put(platform_dai_node);
+	of_node_put(codec_dai_node);
+	return ret;
+}
+
+static const struct of_device_id an7581_wm8960_machine_dt_match[] = {
+	{ .compatible = "airoha,an7581-wm8960-sound" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, an7581_wm8960_machine_dt_match);
+
+static struct platform_driver an7581_wm8960_driver = {
+	.driver = {
+		   .name = "an7581-wm8960",
+		   .of_match_table = an7581_wm8960_machine_dt_match,
+	},
+	.probe = an7581_wm8960_machine_probe,
+};
+module_platform_driver(an7581_wm8960_driver);
+
+MODULE_DESCRIPTION("Airoha SoC I2S platform driver for ALSA AN7581");
+MODULE_LICENSE("GPL");
-- 
2.53.0

