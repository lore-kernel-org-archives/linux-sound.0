Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FE5477285
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791198259; cv=none; b=rC689eACHAOcRdW7z+xkqDhQLqTKKohtYQUMo67xgk61Zu0mnhxthYgj+jRE5sspw0ZI5TUH3Uvd+dgrEHH5grH2LbX1KsWxXkiKJF+jdprkTKV4Iof0he6YzhEaB2tXjCvYR6Ezcyk/v+cDjnDgulxg4+1VxnJZumdgjN1RgJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791198259; c=relaxed/simple;
	bh=d1blBm1Hzmm7Po+juQSeLUZW1RgbslTJX1nk3YK/wzo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mV6kZASCnQd/GX/3qJYOjc0/NyrbWc99YdKO3CjyD1GMU1RfnfMDfksqfdAYPao8iwMwE7s7llK0hoiDsgwxJ+01EPUVSd6uRArbeim+uE39n7VRs62n3Y3oEQw+6PJEy4PGJpoHqHUpB3WIQ3UINMUFtGIdl/XMaHMbOIzUcrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3/eu36n; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3/eu36n"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so446589a12.0
        for <linux-sound@vger.kernel.org>; Mon, 05 Oct 2026 04:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198257; x=1791803057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=D3/eu36n2qxeetlv37K22q0BCSvBLFpEnQXIIR/5VBTPe5SnoUjxOp5VIOiJbS7yVm
         2MzG+Bv045nrauHHpk1RyY08m2rS40MZ291uMX7AfcEoBYTmLd+2v29aWMNa6BHU0fsl
         PAYgFe5Um2pqPFeWLN4eBxHkWou03MLCDyiZdNgMkfdWZD2Tz5VzEHIm/06cB20opboC
         BW5NvbL+3dZtdKGNZ0JGl5yZ1WN80+7Bt3KlXnN5DqN8AQF2YIfcOavKd7cC3BBqQbgG
         cc6CPZqLM6Qi3IQVrPOin86MTh2t0raohekroSAiKAaBPpmu+F4CrNCOuY0/IUUkrhtt
         Pj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198257; x=1791803057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1o0Fr3SsImGt+aqLrFKoD5OlJOoiuIdG7+nqMI1YN8=;
        b=n54a0mwhf7nqNbIbU1wOfo+7eQd0+SyAIZC/zeUmJWgml2s2lLhc6VxPIhMWYGmREQ
         tccO72ZDM8cUgjWAUZuTzPybGQGeoTjhC4debOGF/XLCSPj8HYC9MNZiQFkpyQVXpj5U
         TRFheHR//cwF5BMJVTXIjhqSx7nXd2VBZA0Xejjoh2+Sf3wdDOTiTe5QhjImaaU3J2SP
         hWAH0zYnKtOg1bRqLHE4AsldABAEGftNQnTOB0aDzXpCdJJFTQ/VBywrsLL1NkiGuv+L
         4Qn5KZQ6brqNLG7OfLD8MQJaOOgexvgOpuNg+d7m3U9m1XtiNHUk1JHKGBYzlM5PgQgQ
         8VBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxP1/h1VhYaQ32HdgeCca+ftguUiee1I8wNF0wRVgwIenLQYo+Lo1ixoUD50UBTOwu2B+YW3qViAP+Pug==@vger.kernel.org
X-Gm-Message-State: AFuF++l6K5CNg6QMis+gyBniu4XQL7I2ViNTXPdAeuwlAyzIB/zcQZTi
	GvFzQWi4GMM9GpOkNeaUVSZraLZCr4ASMlHIpniMfwzEsEL9kOGVvDM4
X-Gm-Gg: AYBFou3enS2A3VuH9PQaKnyXJOHJutxBMWmT2JHQ0/3Z2H4vKbbGhylXXVlQeTB6NCK
	jtvbghJX5Xkpjfuu1XcPqE8PIkA4nNYSGUHq6176jqZ/KW9GGGlCSgWI9UqhZGMrPNiNI3zJPV8
	k/yyvpV2uwrDKt5aXVOU/aGJDOQXxOjKRqfIbyOrjNmesZN+rE38R4hRvLLjyJzMxTQt96VOekZ
	U+C3uZf86jad41latZcJ5sPzHM2DdtUlG7cliiv5bCQpe9TNtbNwzPWbKS8SV3o+UeCn+464II/
	iiECo3XkrkKIQG5R1TQRheL83AJZyiFWg3B2GCDr7Op5coyYiN1eBtBEDjqWNZzZAacaREVVDqL
	t+d6cxSzBhGrtRpSMR44af7fP+y5GDJeH3Ctl9TSZJl9QLvVDqQv84pK1eAdCmoJhAw4J/8eEcQ
	gUtIVsRrI7vRDu1nxvbcsWNv3+SSXN+D6JK9Pfv3iZ41tXCCBg404zMP6fregqiNOyIP48k7I15
	DeQczrj80K5VUJB89Ty3vAwaa0Mrg7rB39Z6N8SZ+0U0DpS3wGbybW3w0WwiB4Og3GFiI3HdRcZ
	+tFRW6KwT/D0lA==
X-Received: by 2002:a05:6a21:6f16:b0:3dd:a195:fa1c with SMTP id adf61e73a8af0-3e0d6d2f55cmr6485653637.65.1791198257419;
        Mon, 05 Oct 2026 04:04:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:04:17 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 13/14] ASoC: mediatek: mt8195: Fix ETDM probe error handling
Date: Mon,  5 Oct 2026 18:02:56 +0700
Message-ID: <20261005110257.50145-14-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005110257.50145-1-phucduc.bui@gmail.com>
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Use pm_runtime_resume_and_get() to properly handle runtime PM errors
during ETDM probe.

Propagate errors from MCLK configuration and enabling instead of
ignoring them.

Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 27 ++++++++++++++-------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 11317cdd14ab..8fa830a57502 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2503,6 +2503,7 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
+	int ret;
 
 	dev_dbg(dai->dev, "%s id %d\n", __func__, dai->id);
 
@@ -2510,15 +2511,23 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai->id];
-	if (etdm_data->mclk_freq) {
-		dev_dbg(afe->dev, "MCLK always on, rate %d\n",
-			etdm_data->mclk_freq);
-		pm_runtime_get_sync(afe->dev);
-		mtk_dai_etdm_mclk_configure(afe, dai->id);
-		mtk_dai_etdm_enable_mclk(afe, dai->id);
-		pm_runtime_put_sync(afe->dev);
-	}
-	return 0;
+	if (!etdm_data->mclk_freq)
+		return 0;
+
+	dev_dbg(afe->dev, "MCLK always on, rate %d\n",
+		etdm_data->mclk_freq);
+	ret = pm_runtime_resume_and_get(afe->dev);
+	if (ret)
+		return ret;
+	ret = mtk_dai_etdm_mclk_configure(afe, dai->id);
+	if (ret)
+		goto err_put_pm;
+	ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
+
+err_put_pm:
+	pm_runtime_put_sync(afe->dev);
+
+	return ret;
 }
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
-- 
2.43.0

