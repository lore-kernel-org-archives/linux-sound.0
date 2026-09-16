Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894993BD25E
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 05:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534862; cv=none; b=UY0+U7WJF/sky7T4MtxyQYOsXgZBxI453mrfnxw0DRe/vkkFRlncNGtCtN4nlPJb2ztmsAgqQO2ws+NfcnKGU4lLMBD2zIFxnMxi2aMPM9DZvw4Xz/WTzzFFdYPr5Wj/CS9tQhgLMKS3U3TtTOVJqysz6qF4Y+zyojNagp/pXAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534862; c=relaxed/simple;
	bh=SRqGJTOXPZ/J0lb99O7VgZISgRhjpleo4umogP2E/9I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nq4+P06KpmdDSfVmwl3ldwv0H3ZgrWn/m3/lmPye7S6yWSdJY/t1P1Hykuj/5N42Aw62rkeEdksdMd/MBHM9GbH11LBoNdzFiLBGg5KKVIjMh8Ul4XwUrwI/+bA4OSUMpT7kfG3udhq4SgVgEc1zh+rS0xsbqD8smim5sawwC48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D26nQrpa; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D26nQrpa"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so342877a12.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 22:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534860; x=1790139660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uEKxahRyi+OLn+C//hdXAFcJKQaUJ4E7tV7IKAJQEs=;
        b=D26nQrpahVkxkHMW2Ubt3umVlfO+vzIjx9EKyqIHT1dLM5V27OQrDbsG2dMcDeHNxz
         m30lU9R+YX5MsJ4tvP5TPXLIISWWhh/mMq+h3JA1YVvo5g5T7UPtUzk22xJLs90TbiRT
         YIkAV+vqMQ+7tfzTsUdoNkKc8gr+v0eybx0RROfFxpCNVKF/TDcA12u222nEDchSLMDY
         5NakJSotPESUXvIgdML+5Aa2yptRSeVletZCL6MsEmnshTu0pRrW5Xs0JQeqUWueMSjh
         w+TwEA/Pk8+uhl/15IuXFvDPT/W/UrBpHRt8eu2jmyXozwn/z/1fjM2tBqsF8TgSnxmY
         uu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534860; x=1790139660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0uEKxahRyi+OLn+C//hdXAFcJKQaUJ4E7tV7IKAJQEs=;
        b=BnfLcEYzpEvns+G8mbQrQv5lLOXnfgzSjQoZk9OohvVmBarv70ZC5myB6iUWQzgCgG
         nmxS3mCGoHgLuU3Ar/1HBeT9Ejd6oIgEfI6AiUmKD+g6orTzzMlIjNtq44BTGJ6DCZ3i
         nMB+jfzQS0prpvfKGSXVyVfw1FU31tRIXsebOWeDEf8aK/oOxSOtfOvCaOLFzFX1ecIU
         SvFnPU8VLoAd70es2NlgpC3URxtJ7iRo+gL0zxlyJMRcjX8QPFhBviXwikE0eVFSLYg0
         h6FRq/xvZfri7ZAPKD7afifDzXGEClsBCkUIF0eB/0bZYcXkWpmU/7LwJbaHEFsdtCRP
         Zimw==
X-Forwarded-Encrypted: i=1; AKwUvBx71rDwxAPs+adKxCA4Y8N8EDB81VmJNxr6aVzQtK98+Oi4UilQ7A2qUn1G9J2vi9yuSA885ZjQM1pRyQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m6mE2PkFR/zu61u9geAzjhEqtCmPUwv8XjDzZd04YvNUhZtqhU
	pssCytVDhPE4rD5p2RqWBpeCLRGsu5cW79q9DclODyVmxoIgfNm3hfgb
X-Gm-Gg: AYBFou061PRB8mVdaSOfKckH1kOCiyvTvZFdE2maFriqc6e1my4tMiDwc+erIsq3Hiz
	5KVegxu+EFksqMpXCK5UdBjeu1xot0mR7mimHSbtF8GX7BH03fOYHSwdO49g49tcsI4i8RDXoVS
	xwyxZzOqT2y2Oi/yulTJxvqbQzywd0bUibxi/ZC2aqSu8EAiEebNnZG1gAnbkJnYmPiTGsnYFsb
	aCLKS3KysjVU7UjFaI6tA7K89jqbGmYlIb4W9yfleuYmdobIalDjpe5rPI+uyilkl8tdcEvQTEP
	F67T3fYH25mrt2oOqLaSS176urnzE8SDESp+2UmhEXJGjP4tFz5fJr4mgDbBEyTCL3XYjgrmkBa
	/EzkxsnbecK6fjnyz4leAmnXThH31myt8RnWlzHZexbKtqrfcSA6Mng46kBdztTTyIGZMRaPe69
	Cq+L118EO4JW/5T1XRY+Plzy8veHG4TO+Lm98nsM1j9caO/fE4X6oFxNv+1wIv/XoPFJjA+8+1K
	nasc7CUsjFezBVHrq2F0ZsAa1VkklfDljxDuoDcD2K5R9PUdQC4eIFD5JTW8Bxi2zhmeCT96LZq
	kqxkqvG7RFZfoyM=
X-Received: by 2002:a05:6a21:4a81:b0:3cd:8bba:824f with SMTP id adf61e73a8af0-3dd5f3f8a8fmr2852962637.4.1789534859652;
        Tue, 15 Sep 2026 22:00:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Dan Carpenter <error27@gmail.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 04/12] ASoC: mediatek: mt8189: Propagate reg_rw clock errors
Date: Wed, 16 Sep 2026 12:00:11 +0700
Message-ID: <20260916050020.14575-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_afe_enable_reg_rw_clk() currently ignores errors from clock
enable and parent operations.

Propagate these errors and clean up the clocks before returning the
error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 31 +++++++++++++++++-----
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index 7fe9d01006d5..1132c924158d 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -700,17 +700,36 @@ int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
 int mt8189_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
 {
 	struct mt8189_afe_private *afe_priv = afe->platform_priv;
+	int ret;
 
 	/* bus clock for AFE internal access, like AFE SRAM */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+	if (ret)
+		return ret;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_disable_audiointbus_clk;
+
 	/* enable audio clock source */
-	mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
-	mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
-				  afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+	if (ret)
+		goto err_disable_audiointbus_clk;
+
+	ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H],
+					afe_priv->clk[MT8189_CLK_TOP_CLK26M]);
+	if (ret)
+		goto err_disable_audio_h_clk;
 
 	return 0;
+
+err_disable_audio_h_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIO_H]);
+err_disable_audiointbus_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[MT8189_CLK_TOP_MUX_AUDIOINTBUS]);
+
+	return ret;
 }
 
 int mt8189_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
-- 
2.43.0

