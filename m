Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833192;
	b=yE+0w+gWIN6xPrg5VE54xo7ZjtBKLTe02g23J6iBARTQOEmQWywEG2gtFpjIeOK2MQ4j
	 ev5t7Q2e6W/oum0HtFwA0fEWn/WHVSiWwDYXb/VpXS12AuWZaWVMOuQ66ge1xvMAMgvg4
	 j9t2mVjLu6ZmcV1x7gHdf56EzQIpY7Qi3v7ls0FlrhKck67iM+N/uuNW9JV0tEF9wJ6hm
	 RQ0goy0SSpQjfoWVo1/bW/goFMuxdsmekn1s3oUvEdzdHM1EHsIka5zK0FtBrDKxKxtyz
	 WJB5SUfGWnHjPv7bHFJeav+rB6QkivwDL7XKM0NPNY54NRFderjKVKnHXytD9Eu9e+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833192;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vUNLGtDdsHlYpliyA09tTUGCYAIEIzLih8v8Bkz67Ms=;
	b=2fzDthUafhVUfYNFh881vQbyp+KBajdlhGOvocsd4P4uGjzlnDbZpVXbOSjpceY/u8oc
	 7dn+iYZe5RoMMeh3nIFVyJ3Pw6zQtgEEa7LYNnrz+6vCmS4bqyoSn4UZiV7tTii0xt3fd
	 heF3i0w7rdBYIHXMOpK7RUoIwq0mu+T4VZm3gDQM2+f4osDqN5ZnmUIF6HvOoiJBRjMCv
	 +ssoo/Vh2Wsz1Db+42iMiaE/21l3Q7vZEnD4DDFnW4V1YPLS5sxmONvW2gJXeDlVUf+FS
	 AN+/RYZij1HUYOFcgW/NnT+4wcUa56m5UbFnIcjylDp5AG0YaDWxPODHlPGv0u76/WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fXygBPxC;
	arc=none smtp.remote-ip=91.218.175.6
Received: from mta0.migadu.com (out-6.mta0.migadu.com [91.218.175.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB83606A32C
	for <linux-sound@vger.kernel.org>; Wed,  4 Nov 2026 22:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FB83606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fXygBPxC
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jLxK4vjlIBxtVsOqhr1kAmXlBsz9dYDdk3bbnXg090k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793833189; v=1; x=1794437989;
 b=fXygBPxCUYtvDQRZTBpVk+SJnYC0vUp/nqc1fXrAnxbGTpsIJ2J3tSKw/Jgv5fWjW2gNaT9A
 bpUOG6zWolGO5RXHv47HwgJYVsCtIpN/ZSygbDMqZSdI17JC1LxZf17QgBbBSgjAZZvfZq7buWb
 1HORf32pwoRUt7svcfQeNzOs=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5e6ba12e9dcbbbc4;
	Wed, 04 Nov 2026 22:59:49 +0000
X-Mizu-Trace-ID: 5e6ba12e9dcbbbc4
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: broonie@kernel.org
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] ASoC: rt721-sdca: wait for PDEs to reach PS0 after powering them up
Date: Wed,  4 Nov 2026 14:58:03 -0800
Message-ID: <20261104225803.1574849-5-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104225803.1574849-1-matthew.schwartz@linux.dev>
References: <20261104225803.1574849-1-matthew.schwartz@linux.dev>
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

The PDE event handlers write REQUESTED_PS and return, so DAPM unmutes
the feature unit and the stream starts while the power domain is still
transitioning. On the ASUS ROG Xbox Ally X20 the first headset mic
capture after the capture path powers down starts with about 0.45 s
pinned at full scale, and the DisCo tables give the jack function PDEs
up to 500 ms to reach PS0.

Poll ACTUAL_PS with sdca_asoc_pde_poll_actual_ps() after each power up,
like rt722 does since its DMIC pop noise fix, and use the 500 ms maximum
for the jack function PDEs. Power down is left alone because ACTUAL_PS
can stay at PS0 while the data port is still running.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 sound/soc/codecs/Kconfig          |  1 +
 sound/soc/codecs/rt721-sdca-sdw.c | 17 ++++++++++++++++
 sound/soc/codecs/rt721-sdca.c     | 33 +++++++++++++++++++++++++++++++
 sound/soc/codecs/rt721-sdca.h     |  1 +
 4 files changed, 52 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index ba59dabeeccde..133f397cc6e96 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1978,6 +1978,7 @@ config SND_SOC_RT712_SDCA_DMIC_SDW
 config SND_SOC_RT721_SDCA_SDW
 	tristate "Realtek RT721 SDCA Codec - SDW"
 	depends on SOUNDWIRE
+	depends on SND_SOC_SDCA
 	select REGMAP_SOUNDWIRE
 	select REGMAP_SOUNDWIRE_MBQ
 
diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index fc34a0537d5fb..44cf9ca866c94 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -39,6 +39,14 @@ static bool rt721_sdca_readable_register(struct device *dev, unsigned int reg)
 		RT721_SDCA_CTL_HIDTX_CURRENT_OWNER, 0) ... SDW_SDCA_CTL(FUNC_NUM_HID,
 		RT721_SDCA_ENT_HID01, RT721_SDCA_CTL_HIDTX_MESSAGE_LENGTH, 0):
 	case RT721_BUF_ADDR_HID1 ... RT721_BUF_ADDR_HID2:
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE12,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE40,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_PDE2A,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE41,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT0,
 		RT721_SDCA_CTL_FUNC_STATUS, 0):
 		return true;
@@ -64,6 +72,14 @@ static bool rt721_sdca_volatile_register(struct device *dev, unsigned int reg)
 		RT721_SDCA_CTL_HIDTX_CURRENT_OWNER, 0) ... SDW_SDCA_CTL(FUNC_NUM_HID,
 		RT721_SDCA_ENT_HID01, RT721_SDCA_CTL_HIDTX_MESSAGE_LENGTH, 0):
 	case RT721_BUF_ADDR_HID1 ... RT721_BUF_ADDR_HID2:
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE12,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE40,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_PDE2A,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE41,
+		RT721_SDCA_CTL_ACTUAL_POWER_STATE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT0,
 		RT721_SDCA_CTL_FUNC_STATUS, 0):
 		return true;
@@ -595,3 +611,4 @@ module_sdw_driver(rt721_sdca_sdw_driver);
 MODULE_DESCRIPTION("ASoC RT721 SDCA SDW driver");
 MODULE_AUTHOR("Jack Yu <jack.yu@realtek.com>");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("SND_SOC_SDCA");
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 9f567caecb70a..db4bf367011ec 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -21,6 +21,9 @@
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/slab.h>
 #include <sound/soc-dapm.h>
+#include <sound/sdca.h>
+#include <sound/sdca_asoc.h>
+#include <sound/sdca_function.h>
 #include <sound/sdw.h>
 #include <sound/tlv.h>
 
@@ -1482,6 +1485,32 @@ static int rt721_sdca_fu36_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+/* The DisCo tables give the jack function PDEs up to 500 ms for PS3 to PS0 */
+static const struct sdca_pde_delay rt721_jack_pde_delays[] = {
+	{ .from_ps = SDCA_PDE_PS3, .to_ps = SDCA_PDE_PS0, .us = 500000 },
+};
+
+/* REQUESTED_PS only starts the transition, so wait for ACTUAL_PS to reach PS0 */
+static void rt721_sdca_pde_wait_ps0(struct rt721_sdca_priv *rt721,
+				    unsigned char func, unsigned char entity)
+{
+	const struct sdca_pde_delay *delays = NULL;
+	int num_delays = 0;
+	int ret;
+
+	if (func == FUNC_NUM_JACK_CODEC) {
+		delays = rt721_jack_pde_delays;
+		num_delays = ARRAY_SIZE(rt721_jack_pde_delays);
+	}
+
+	ret = sdca_asoc_pde_poll_actual_ps(rt721->regmap, func, entity,
+					   SDCA_PDE_PS3, SDCA_PDE_PS0,
+					   delays, num_delays);
+	if (ret)
+		dev_warn(&rt721->slave->dev, "PDE 0x%x did not reach PS0: %d\n",
+			 entity, ret);
+}
+
 static int rt721_sdca_pde47_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
@@ -1495,6 +1524,7 @@ static int rt721_sdca_pde47_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt721->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE40,
 				RT721_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		rt721_sdca_pde_wait_ps0(rt721, FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE40);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		regmap_write(rt721->regmap,
@@ -1518,6 +1548,7 @@ static int rt721_sdca_pde41_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt721->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT721_SDCA_ENT_PDE41,
 				RT721_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		rt721_sdca_pde_wait_ps0(rt721, FUNC_NUM_AMP, RT721_SDCA_ENT_PDE41);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		regmap_write(rt721->regmap,
@@ -1541,6 +1572,7 @@ static int rt721_sdca_pde11_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt721->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_PDE2A,
 				RT721_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		rt721_sdca_pde_wait_ps0(rt721, FUNC_NUM_MIC_ARRAY, RT721_SDCA_ENT_PDE2A);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		regmap_write(rt721->regmap,
@@ -1564,6 +1596,7 @@ static int rt721_sdca_pde34_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt721->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE12,
 				RT721_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		rt721_sdca_pde_wait_ps0(rt721, FUNC_NUM_JACK_CODEC, RT721_SDCA_ENT_PDE12);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		regmap_write(rt721->regmap,
diff --git a/sound/soc/codecs/rt721-sdca.h b/sound/soc/codecs/rt721-sdca.h
index cc3bce0ba5178..2ae68ce3fde28 100644
--- a/sound/soc/codecs/rt721-sdca.h
+++ b/sound/soc/codecs/rt721-sdca.h
@@ -260,6 +260,7 @@ struct rt721_sdca_dmic_kctrl_priv {
 #define RT721_SDCA_CTL_XUV				0x34
 #define RT721_SDCA_CTL_FU_CH_GAIN			0x0b
 #define RT721_SDCA_CTL_FUNC_STATUS			0x10
+#define RT721_SDCA_CTL_ACTUAL_POWER_STATE		0x10
 
 /* RT721 SDCA channel */
 #define CH_L	0x01
-- 
2.56.0

