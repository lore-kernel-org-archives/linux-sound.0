Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573817;
	b=dgvYbWzQT4RAiFWPB/lSneYymH0nEosr5l5PO3961SZPZe/lDjaWG/HFvs2Iz4OturQB
	 nvfiymAfxN52sQIw/xr1VuCnkzxoaVX25Oc54Lpq9OWXBDVPU3hK3zw9wDyQXsrEvy2D2
	 OC3hoLqhgT0P1UbQRnOtRz9jRhxjZXDwBrVRk93udApRVh548HOigUyO/h/0Cp2novUO0
	 7NCI4LvtW2LbyrjNQVbsgbkQELFtOdUiKCES8Xr5FaPT5VH7E8WYqxaJ6fKT4e63hPZNg
	 KzpdWA54ZKO7as4mVq5x/hxSq17w/N6GGvg7cgeQrrHGCR4miZ0n2df6iWPUNpj9l+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573817;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=Y9qhf+qoji9l966nUReBeM4hWrjYPRBkiyA7cD2Bl5E=;
	b=fO637P8eicedkrnV0gmPLtunu1xiEpSgYzxwiXSomx2JTNRhUMISqvpL6GOM5XV1bw0Y
	 s9TOW351iIhwe6k9hQgbZQCoq+CbQzUkdHoHQOS4nZ6P54Kjo/SZRUMwjZ9A7nv2vO0+D
	 om4a2pVAzgTUwSACh31LfnqIJzn2OGCZTHH8lqmxRoGd7JT+FvSI9oMAtZ/i+IobkbM+E
	 PvTQaLdinb5PAj9VokZpIt9iqGkToARd092FQYaq3VUrvFSLG4/L5MivxSpAFx4hu+RPJ
	 r9IAhageHGzP5pYkxGgKeB/onOh7jZUrIt8l6AMfIl2OaqFICDvmuPhKJiToAfAb6uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=s29vIjLJ;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044CC606A330
	for <linux-sound@vger.kernel.org>; Wed, 21 Oct 2026 09:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 044CC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=s29vIjLJ
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69L99fPsA3910609, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1792573781; bh=Y9qhf+qoji9l966nUReBeM4hWrjYPRBkiyA7cD2Bl5E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=s29vIjLJMbtGcxIXsn6NvOEQMGKrdeDBBcCDTvZYTJYiuHCvNpIeOdgxlVCPkmzir
	 9ZALv0iDKKMggNMZjcplLwoUQ/6kjxnZbofyLWcF4rFZyShd4ZSsC4+p6/VIBOLL7i
	 S7m/EPHRqFV2IaU9bItFZkt3krBvpuBUtuRqpgYm5cHLyr4bbGZBKG23ngcQRMQXBu
	 XNfVuvvikkx0tB8Yxcn+1F4eclGkVbdZGrGYoVz2y4r4okaxd/+uAtJjOFs4dLztP8
	 p4n26EbmGfA8/t3xxFgTr3G1ppLAbVZ6q5tRS6OrjGhSvvS1OB16YPpnVd4i6ndW3Q
	 DEeeayoIQqrmg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69L99fPsA3910609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Oct 2026 17:09:41 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 17:09:41 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 17:09:41 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <linux-sound@vger.kernel.org>, <lars@metafoo.de>, <flove@realtek.com>,
	<oder_chiou@realtek.com>, <jack.yu@realtek.com>, <derek.fang@realtek.com>,
	<Meenali.Gupta@dell.com>, <Deep.Harsora@Dell.com>, Shuming Fan
	<shumingf@realtek.com>
Subject: [PATCH] ASoC: rt722: enable mono speaker on Dell SKU 0EBA
Date: Wed, 21 Oct 2026 17:09:29 +0800
Message-ID: <20261021090929.2135891-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.55.0
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
Content-Type: text/plain

From: Shuming Fan <shumingf@realtek.com>

Dell SKU 0EBA uses only the left audio channel and a single speaker.
Add the corresponding settings to support this configuration.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt722-sdca.c | 18 ++++++++++++++++++
 sound/soc/codecs/rt722-sdca.h |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 149cb6617126..1dad8012d904 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -1652,6 +1652,17 @@ int rt722_sdca_init(struct device *dev, struct regmap *regmap, struct sdw_slave
 			&soc_sdca_dev_rt722, rt722_sdca_dai, ARRAY_SIZE(rt722_sdca_dai));
 }
 
+static const struct dmi_system_id dmi_dell_mono_spk_quirk_table[] = {
+	{
+		.ident = "Dell Pro 5 Micro P5M1270",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "0EBA"),
+		}
+	},
+	{}
+};
+
 static void rt722_sdca_dmic_preset(struct rt722_sdca_priv *rt722)
 {
 	unsigned int mic_func_status;
@@ -1741,6 +1752,13 @@ static void rt722_sdca_amp_preset(struct rt722_sdca_priv *rt722)
 		if (rt722->hw_vid == RT722_VB)
 			regmap_write(rt722->regmap, 0x2f54, 0x00);
 
+		/* This Dell machine only uses the mono speaker */
+		if (dmi_check_system(dmi_dell_mono_spk_quirk_table)) {
+			rt722_sdca_index_write(rt722, RT722_VENDOR_REG, RT722_CLSD_CTRL2, 0x391a);
+			rt722_sdca_index_update_bits(rt722, RT722_VENDOR_REG,
+				RT722_MISC_CTRL2, 0x0010, 0x0010);
+		}
+
 		/* clear flag */
 		regmap_write(rt722->regmap,
 			SDW_SDCA_CTL(FUNC_NUM_AMP, RT722_SDCA_ENT0, RT722_SDCA_CTL_FUNC_STATUS, 0),
diff --git a/sound/soc/codecs/rt722-sdca.h b/sound/soc/codecs/rt722-sdca.h
index b654b14334d4..dd245ae9bd44 100644
--- a/sound/soc/codecs/rt722-sdca.h
+++ b/sound/soc/codecs/rt722-sdca.h
@@ -68,9 +68,11 @@ struct rt722_sdca_dmic_kctrl_priv {
 #define RT722_ANALOG_BIAS_CTL3			0x04
 #define RT722_MISC_CTRL1			0x07
 #define RT722_JD_CTRL1				0x09
+#define RT722_MISC_CTRL2			0x0d
 #define RT722_LDO2_3_CTL1			0x0e
 #define RT722_LDO1_CTL				0x1a
 #define RT722_HP_JD_CTRL			0x24
+#define RT722_CLSD_CTRL2			0x38
 #define RT722_CLSD_CTRL6			0x3c
 #define RT722_COMBO_JACK_AUTO_CTL1		0x45
 #define RT722_COMBO_JACK_AUTO_CTL2		0x46
-- 
2.55.0

