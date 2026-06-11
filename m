Received: from smtp153-177.sina.com.cn (smtp153-177.sina.com.cn [61.135.153.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5541EFF93
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 03:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781147924; cv=none; b=N9DpSF7l4E/j3ARx5o95Nxa+54srMP1D2+3HcvlBHhcIcRPrMBe2zl2CiKWzxA0eKwN3FmxnZ2KIGNIipGLiUJSx2Tw5p85c6ftXeOQq2RfCLT7OcoZMNw4IZHhbZrAPEKFSH1gD581u/4zjWF7ezrlhPN6vzDmVofGUgi01nTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781147924; c=relaxed/simple;
	bh=wfIUjK3awoz1doLDGlAn+b/fd7CN/VU/HCEfvPerrPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=muJC7eFMOoruroLx0fkIBnSyUWXJ9LYvM4DBdiYKIb4S4BUwM5gSQrrwW6uJvpnm4M64fDCUgKJfae58X5LaqkRtM+VmAGwinDFWYRuvHsPLldvTkkzGf2eFBMPBinc0tmBTQ1tMlxYT3ds8LDrmHnJEoP6n8mgcjlwYwb53GjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A2A29030000377C; Thu, 11 Jun 2026 11:18:30 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: CE0870BB7A2F4AE6A585974826FD9850
X-SMAIL-UIID: CE0870BB7A2F4AE6A585974826FD9850-20260611-111830
From: Zhang Yi <zhangyi@everest-semi.com>
To: linux-sound@vger.kernel.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v1 3/7] ASoC: codecs: ES8389: Fix the issue about mclk_src
Date: Thu, 11 Jun 2026 11:18:20 +0800
Message-Id: <20260611031824.4628-4-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260611031824.4628-1-zhangyi@everest-semi.com>
References: <20260611031824.4628-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>

Fix the issue with incorrect modifications to mclk_src
When the system needs to be configured to use the MCLK from the SCLK pin,
the code still sets the relevant registers to use the MCLK from the MCLK pin
And setting `mclk_src` to `u8` is inappropriate,
because the purpose of `mclk_src` is to determine whether to use SCLK as MCLK.
Therefore, we will change the `mclk_src` member from `u8` to `bool`.

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 12 ++++--------
 sound/soc/codecs/es8389.h |  5 ++---
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index be7a36f17..886069be1 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -36,8 +36,8 @@ struct	es8389_private {
 	unsigned int sysclk;
 	int mastermode;
 
-	u8 mclk_src;
 	u8 vddd;
+	bool mclk_src;
 	int version;
 	enum snd_soc_bias_level bias_level;
 };
@@ -607,9 +607,9 @@ static int es8389_pcm_hw_params(struct snd_pcm_substream *substream,
 	regmap_update_bits(es8389->regmap, ES8389_ADC_FORMAT_MUTE, ES8389_DATA_LEN_MASK, state);
 	regmap_update_bits(es8389->regmap, ES8389_DAC_FORMAT_MUTE, ES8389_DATA_LEN_MASK, state);
 
-	if (es8389->mclk_src == ES8389_SCLK_PIN) {
+	if (es8389->mclk_src) {
 		regmap_update_bits(es8389->regmap, ES8389_MASTER_CLK,
-					ES8389_MCLK_SOURCE, es8389->mclk_src);
+					ES8389_MCLK_MASK, ES8389_MCLK_FROM_SCLK);
 		es8389->sysclk = params_channels(params) * params_width(params) * params_rate(params);
 	}
 
@@ -897,11 +897,7 @@ static int es8389_probe(struct snd_soc_component *component)
 	int ret, i;
 	struct es8389_private *es8389 = snd_soc_component_get_drvdata(component);
 
-	ret = device_property_read_u8(component->dev, "everest,mclk-src", &es8389->mclk_src);
-	if (ret != 0) {
-		dev_dbg(component->dev, "mclk-src return %d", ret);
-		es8389->mclk_src = ES8389_MCLK_SOURCE;
-	}
+	es8389->mclk_src = device_property_read_bool(component->dev, "everest,mclk-from-sclk");
 
 	for (i = 0; i < ARRAY_SIZE(es8389_core_supplies); i++)
 		es8389->core_supply[i].supply = es8389_core_supplies[i];
diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
index d21e72f87..7f1212219 100644
--- a/sound/soc/codecs/es8389.h
+++ b/sound/soc/codecs/es8389.h
@@ -116,9 +116,8 @@
 #define ES8389_TDM_SLOT               (0x70 << 0)
 #define ES8389_TDM_SHIFT              4
 
-#define ES8389_MCLK_SOURCE            (1 << 6)
-#define ES8389_MCLK_PIN               (1 << 6)
-#define ES8389_SCLK_PIN               (0 << 6)
+#define ES8389_MCLK_MASK              (3 << 6)
+#define ES8389_MCLK_FROM_SCLK         (1 << 6)
 
 /* ES8389_FMT */
 #define ES8389_S24_LE                 (0 << 5)
-- 
2.17.1

