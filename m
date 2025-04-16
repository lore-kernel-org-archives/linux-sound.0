Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058FC234970
	for <linux-sound@vger.kernel.org>; Wed, 16 Apr 2025 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795580; cv=none; b=b8aDqygFNR43K90L/DgwTbuLhshTl956kpCZBAKzrPKjmsKZ+J+I3K/7/6pfVgePBq76UJU01v+DWEG/ziixN9jbTm8aWgpV7I3g0wkOVVLbaYvUZA214rX3lu/0eCC+wWUtrPI3LYRQ5OC5joXOLzQWT8a6XbOLD+SepTb+JTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795580; c=relaxed/simple;
	bh=wxYCwo/TieEZAApTe5R/TLwplvHYhsHNzK+wFeUkxc8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ETqUqOIGW5RiMbxnzomHJjGvQeLYagOMCdNZS4gFzxuLslf3ftOLHCmwjtkPsm2Nlt8lQnI+Rmb9jQ4rf6KNsBBSxbEo9IaH9IC3huHeG706r/hSk0ZqznoXbK4LIz+u/1n4RZo5/mYiFvJeoR0rILO4q/8yXVwJha7rMdU4zfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b=ZUOph1kC; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=realtek.com header.i=@realtek.com header.b="ZUOph1kC"
X-SpamFilter-By: ArmorX SpamTrap 5.78 with qID 53G9PtRnA3043235, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=realtek.com; s=dkim;
	t=1744795555; bh=wxYCwo/TieEZAApTe5R/TLwplvHYhsHNzK+wFeUkxc8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=ZUOph1kCDcFqmTrBcJRw1+oFEVCQi+ngTgQDfGKmi0r/JM0MbxDbY70ZRJfboHHlo
	 ht2DKeta8X/mCUtu05DUR+ncI+1Yw1u3MpTDNH5evdZsAgUt+mV60jr06lAIPZWCuP
	 jfVaYdQjHpR5uncdQvG/Dwuo70XhhQtsxVwx3y6yAgveUqsS2n/3e8NiXkr0xdTVL1
	 yL0V6HeEpRqOzJPtV07uRCwtIlj/RGsciH4AdaM4UxwMN5fGKaf1p72VX9B3onAqrC
	 BaA5J13mDqTPEfuDWNlXJEin69xRleap29ShEXWuXl/vxA2xUNt5TV+kikUFw1K+ru
	 dTmVsVU0FGBMg==
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/3.06/5.92) with ESMTPS id 53G9PtRnA3043235
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 17:25:55 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Apr 2025 17:25:56 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 16 Apr 2025 17:25:55 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH 2/2] ASoC: rt722: fix pop noise at the beginning of DMIC recording
Date: Wed, 16 Apr 2025 17:25:47 +0800
Message-ID: <20250416092547.737879-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback

From: Shuming Fan <shumingf@realtek.com>

This patch added the PDE status check which makes sure the PDE transition is done.
It will decrease the pop noise at the beginning of DMIC recording.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 12 +++++++++++
 sound/soc/codecs/rt722-sdca.c     | 33 +++++++++++++++++++++++++++++++
 sound/soc/codecs/rt722-sdca.h     |  1 +
 3 files changed, 46 insertions(+)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 142eb032b4f8..609ca0d6c83a 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -43,8 +43,12 @@ static int rt722_sdca_mbq_size(struct device *dev, unsigned int reg)
 			  RT722_SDCA_CTL_FU_MUTE, CH_R):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE40,
 			  RT722_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE40,
+			  RT722_SDCA_CTL_ACTUAL_POWER_STATE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE12,
 			  RT722_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE12,
+			  RT722_SDCA_CTL_ACTUAL_POWER_STATE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_CS01,
 			  RT722_SDCA_CTL_SAMPLE_FREQ_INDEX, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_CS11,
@@ -57,6 +61,8 @@ static int rt722_sdca_mbq_size(struct device *dev, unsigned int reg)
 			  RT722_SDCA_CTL_VENDOR_DEF, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_PDE2A,
 			  RT722_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_PDE2A,
+			  RT722_SDCA_CTL_ACTUAL_POWER_STATE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_CS1F,
 			  RT722_SDCA_CTL_SAMPLE_FREQ_INDEX, 0):
@@ -72,6 +78,8 @@ static int rt722_sdca_mbq_size(struct device *dev, unsigned int reg)
 			  RT722_SDCA_CTL_VENDOR_DEF, CH_08):
 	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_PDE23,
 			  RT722_SDCA_CTL_REQ_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_PDE23,
+			  RT722_SDCA_CTL_ACTUAL_POWER_STATE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_CS31,
 			  RT722_SDCA_CTL_SAMPLE_FREQ_INDEX, 0):
@@ -154,13 +162,17 @@ static bool rt722_sdca_volatile_register(struct device *dev, unsigned int reg)
 	case 0x2f01:
 	case 0x2f54:
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE12, RT722_SDCA_CTL_ACTUAL_POWER_STATE, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE40, RT722_SDCA_CTL_ACTUAL_POWER_STATE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_GE49, RT722_SDCA_CTL_DETECTED_MODE,
 			0):
 	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_PDE2A, RT722_SDCA_CTL_ACTUAL_POWER_STATE, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_HID, RT722_SDCA_ENT_HID01, RT722_SDCA_CTL_HIDTX_CURRENT_OWNER,
 			0) ... SDW_SDCA_CTL(FUNC_NUM_HID, RT722_SDCA_ENT_HID01,
 			RT722_SDCA_CTL_HIDTX_MESSAGE_LENGTH, 0):
 	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0):
+	case SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_PDE23, RT722_SDCA_CTL_ACTUAL_POWER_STATE, 0):
 	case RT722_BUF_ADDR_HID1 ... RT722_BUF_ADDR_HID2:
 	case 0x2000000:
 	case 0x200000d:
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index dae78392e60e..f0d3fd9b3d95 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -842,6 +842,7 @@ static int rt722_sdca_fu113_event(struct snd_soc_dapm_widget *w,
 	case SND_SOC_DAPM_POST_PMU:
 		rt722->fu1e_dapm_mute = false;
 		rt722_sdca_set_fu1e_capture_ctl(rt722);
+		usleep_range(150000, 160000);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		rt722->fu1e_dapm_mute = true;
@@ -871,6 +872,28 @@ static int rt722_sdca_fu36_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
+static void rt722_pde_transition_delay(struct rt722_sdca_priv *rt722, unsigned char func,
+	unsigned char entity, unsigned char ps)
+{
+	unsigned int delay = 1000, val;
+
+	pm_runtime_mark_last_busy(&rt722->slave->dev);
+
+	/* waiting for Actual PDE becomes to PS0/PS3 */
+	while (delay) {
+		regmap_read(rt722->regmap,
+			SDW_SDCA_CTL(func, entity, RT722_SDCA_CTL_ACTUAL_POWER_STATE, 0), &val);
+		if (val == ps)
+			break;
+
+		usleep_range(1000, 1500);
+		delay--;
+	}
+	if (!delay) {
+		dev_warn(&rt722->slave->dev, "%s PDE to %s is NOT ready", __func__, ps?"PS3":"PS0");
+	}
+}
+
 static int rt722_sdca_pde47_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
@@ -884,11 +907,13 @@ static int rt722_sdca_pde47_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt722->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE40,
 				RT722_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		rt722_pde_transition_delay(rt722, FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE40, ps0);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		regmap_write(rt722->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE40,
 				RT722_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
+		rt722_pde_transition_delay(rt722, FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE40, ps3);
 		break;
 	}
 	return 0;
@@ -907,11 +932,13 @@ static int rt722_sdca_pde23_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt722->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_PDE23,
 				RT722_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		rt722_pde_transition_delay(rt722, FUNC_NUM_AMP, RT722_SDCA_ENT_PDE23, ps0);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		regmap_write(rt722->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT_PDE23,
 				RT722_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
+		rt722_pde_transition_delay(rt722, FUNC_NUM_AMP, RT722_SDCA_ENT_PDE23, ps3);
 		break;
 	}
 	return 0;
@@ -930,11 +957,13 @@ static int rt722_sdca_pde11_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt722->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_PDE2A,
 				RT722_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		rt722_pde_transition_delay(rt722, FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_PDE2A, ps0);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		regmap_write(rt722->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_PDE2A,
 				RT722_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
+		rt722_pde_transition_delay(rt722, FUNC_NUM_MIC_ARRAY, RT722_SDCA_ENT_PDE2A, ps3);
 		break;
 	}
 	return 0;
@@ -953,11 +982,13 @@ static int rt722_sdca_pde12_event(struct snd_soc_dapm_widget *w,
 		regmap_write(rt722->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE12,
 				RT722_SDCA_CTL_REQ_POWER_STATE, 0), ps0);
+		rt722_pde_transition_delay(rt722, FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE12, ps0);
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
 		regmap_write(rt722->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE12,
 				RT722_SDCA_CTL_REQ_POWER_STATE, 0), ps3);
+		rt722_pde_transition_delay(rt722, FUNC_NUM_JACK_CODEC, RT722_SDCA_ENT_PDE12, ps3);
 		break;
 	}
 	return 0;
@@ -1343,6 +1374,8 @@ static void rt722_sdca_dmic_preset(struct rt722_sdca_priv *rt722)
 				RT722_SDCA_CTL_VENDOR_DEF, 0), 0x01);
 		/* Fine tune PDE2A latency */
 		regmap_write(rt722->regmap, 0x2f5c, 0x25);
+		/* PHYtiming TDZ/TZD control */
+		regmap_write(rt722->regmap, 0x2f03, 0x06);
 
 		/* clear flag */
 		regmap_write(rt722->regmap,
diff --git a/sound/soc/codecs/rt722-sdca.h b/sound/soc/codecs/rt722-sdca.h
index a68ab6ca1569..3c383705dd3c 100644
--- a/sound/soc/codecs/rt722-sdca.h
+++ b/sound/soc/codecs/rt722-sdca.h
@@ -199,6 +199,7 @@ struct rt722_sdca_dmic_kctrl_priv {
 #define RT722_SDCA_CTL_VENDOR_DEF			0x30
 #define RT722_SDCA_CTL_FU_CH_GAIN			0x0b
 #define RT722_SDCA_CTL_FUNC_STATUS			0x10
+#define RT722_SDCA_CTL_ACTUAL_POWER_STATE		0x10
 
 /* RT722 SDCA channel */
 #define CH_L	0x01
-- 
2.34.1

