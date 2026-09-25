Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4E03C553F
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 04:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790311832; cv=none; b=k6kareHmzQlXASHkPl3nKxzV7OBCh1MPzuFuilgWP5ZjluYxkwG70wBqNeDy4JtpO3WcFj/pnD2shJ/VOQWjqIuP7h8Un3xzrC0eNZY6VfJJRoIHr9TtmceO3PcBvsPLmTVWwx6sDAT1Vlwf/LEQ4+zqwX2U49k+NWRcTYG7EE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790311832; c=relaxed/simple;
	bh=Luug1/W1j+KIrThGmR2h+mZRSz1sWSH4I+8728ARnpw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qt213TeFQYDRnoH/9PF5hc5bK79WmAE5LkyJG6zGIxGYMo1WTWETNjmjJDRYSTZFEEjCssufLpPLC/rwV4N7bHvZ0vBOab4tAlXXMrtc6MspDXEAiX/M9uBKX2JQ7hCIJ2prOOHCBP9WliquAk4/ZVluUrAr88/LccVUFXF/0vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0imFktN; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0imFktN"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc515bef69dso152642a12.2
        for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 21:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790311830; x=1790916630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+a+AWZNIU0wqIWtIDJ3mjn2LblAPLsjjXpjUgivHtBs=;
        b=C0imFktNs+h8jkWNTT/uzU/bHA9/Xp9j78AnUa8rBtsNHjOcQPvta2mjzS9K5dWKqY
         bAIY5Fo87rQqhYVCRmrfBqVc/xtStHAK/Yhl5GsIMomWdn1qGp27WLmcSIXy4X9eMKVn
         34z7N2Tt/PriK/yBVgXU+BthJHCsdSZdpyDv9EjHA2rXvb8CxpFO3ptzYIezQkbQG530
         VVUeDIUx9Zw22dWwe/BnZlC38b6gROMnFp1/0YcmIIjOneaTTE9KCvATm7qhewWgBLfY
         eUAYSvBimfgcJvXcdIOZeEHt9bu8Z5GqJHuldI1YFT/2KfzcL85QqZhMkqnrPpWAAg/K
         t7Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790311830; x=1790916630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+a+AWZNIU0wqIWtIDJ3mjn2LblAPLsjjXpjUgivHtBs=;
        b=BoLlLSbF4qyjvmAwKedB+i7EeHC816MxLpVI+NbITOMHrdJirnEH0j9IDm/ZaY2UKh
         iD6pOfxgxFrh8In1rqqWO+hAW+70j22n4CJ4SDfDTDrPc8Yh/U/niLz5zIlwGPn/9g1U
         22FTc/fCfa+DF2upaTHtLWWdjoCdSIhSbdwT4W53fmyVKLi4nfBTNXJEyz/6k0AYLp2D
         +dk1yO7pS8BpRpdEOz3qnL8F0IHZCh7uOL0TRahdF3TcubIkBseJQ4frnAZ9/xI0fKZ3
         e2lLbniUbmcWk3RKHGRKgDok6OiQlDYrVnem5wTT5AzAaqHRODfe7vsv/o6q5QEZ6D5D
         RRfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGTidgWaOkkyVttlj4H2h+5/PSDReYBoRSSMayCqkb0MsJAjELh7tyQulS6DBL8ZxD8RWEMJzD1/qlAw==@vger.kernel.org
X-Gm-Message-State: AFuF++lLA7PH0ATBRy/nc1/snKQYMbcyHtPyOOZqDI+85nvFx/C4KAIj
	R7f40h6UCdIs+6HCNP6j4hjg+zb3NNiIW7GQuU/twxpG4zmaj+2caXiz
X-Gm-Gg: AYBFou3MmdH3qxmCIUI+QfyGr0C/5NxTqRHzXP2klBU3c7yAs8SYvtZSSgLKcFlAGO9
	Hcces/WwFoj6WTf2Qb4X5bGCVgpVNPiRBWp81l95tS7qUEgjzdo1pY5MsNpKoedN47bbZd4JbIM
	higwoRGRrlTYqSwxUjWQon8p/mW6IFD9G6peCWL8gAiEvTGxhPp8+ZfxV01vVDz5+zUuU681EEh
	dnNfOl5gr1xmrJvZgXjX9UhiRJpjgSNlow8HVSgFoLWP9gCS3uxA9rB+sVxY5H1pkchja86TW5R
	7cIppu0hWLnz+5FlVPxzdHpPmNw9bhN6IynctqKx9Ssfk2lpfd1aeAkvpgRd+yvF1MnQrOUD7UI
	rQB5rhEcAS7/piup6N9mz5F3u1ccmVXH8rm3yECOJiaBAIo51xz3/CVgcX1XeBEwrJzD+2yApLb
	wtAJ6+XT3nT1LZ+NAGaLahd8GRVaE/UAXgLJTT8kJTT2+w3n9E46pv/BLDwXL70luYUHmH8OA8y
	BeTh1qrWO15vc47mUUqwpzqHvejmBG9HgqHMc70MsnJHX6wlTxFI7nwjPCmKynsSatCjwwnQjN0
	YWL2fK03NRB/WD9p3nuLLN3B
X-Received: by 2002:a17:90b:53cc:b0:39e:6c6a:2096 with SMTP id 98e67ed59e1d1-3a098970bd7mr3908285a91.55.1790311830120;
        Thu, 24 Sep 2026 21:50:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0976cacbesm8151528a91.13.2026.09.24.21.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 21:50:29 -0700 (PDT)
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
Subject: [PATCH 08/14] ASoC: mediatek: mt8195: Remove redundant error message
Date: Fri, 25 Sep 2026 11:49:02 +0700
Message-ID: <20260925044908.450775-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925044908.450775-1-phucduc.bui@gmail.com>
References: <20260925044908.450775-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_warn() and dev_err_probe() call is redundant and can be removed.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index be150c0f5472..b8c3636cb64a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3083,7 +3083,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* initial audio related clock */
 	ret = mt8195_afe_init_clock(afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "init clock error\n");
+		return ret;
 
 	/* reset controller to reset audio regs before regmap cache */
 	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
@@ -3130,7 +3130,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	ret = devm_request_irq(dev, irq_id, mt8195_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
 	if (ret)
-		return dev_err_probe(dev, ret, "could not request_irq for asys-isr\n");
+		return ret;
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
@@ -3188,10 +3188,9 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	/* register component */
 	ret = devm_snd_soc_register_component(dev, &mtk_afe_pcm_platform,
 					      afe->dai_drivers, afe->num_dai_drivers);
-	if (ret) {
-		dev_warn(dev, "err_platform\n");
+	if (ret)
 		goto err_pm_put;
-	}
+
 
 	ret = regmap_multi_reg_write(afe->regmap, mt8195_afe_reg_defaults,
 				     ARRAY_SIZE(mt8195_afe_reg_defaults));
-- 
2.43.0

