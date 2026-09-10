Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4665489FDA
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045087; cv=none; b=h5lku4i/6LTYixcXCQzZuT5mx2Ia/tPPUPB3cc0an6dQ009Al1AX3kS9xBHrAlHWXv+8FVod7WtsWet5vzLoirYfbQ4m7DVsFN6IWNrjUE2zgAguv3ilw+Dl4o09rPZD5FqChC5lag5OZvli2o4xPX3uAB7EyowDii4QjBU0o5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045087; c=relaxed/simple;
	bh=EVDRcKmTVQAmuHJWES9U2hQGWq/76vGUhS5zLMa3z4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jMuXzN929sg8MBaAdc2AOGrR4ywOXjx43HLcuDM79swnGVDly56nOZ7nv+QylFf0eEfmLDTkfBDsiajJbgbIH+u46FuMJCvtm6ZJQm7xSapZO2BSd25l698/pxndu1v/NaUJPeka649D0f/Z5KVhhdmu70zV108kRPwJp5s6KQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NnXXgkkJ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NnXXgkkJ"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea76so1287505a91.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 05:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045085; x=1789649885; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=NnXXgkkJqpobyICWryKKYqtxScJ9nTHeIqtGe5QkiqQCA4IKbCz2fRJvB9IHWN1BQ7
         H0McH/ZAfuAhStKtr9okXryVP/Z3YeCrPCfLVpffq7PVIUcEI700KYkcPVJ0NsYDZxwN
         NgES9Q/QjQ79RLG2LX7Q4dDqTVak37YqqLFM/2MY2ShdFkUem9Olh5ceUJUz8y4gixrV
         5M38APvgEWgkb0wk1IBZJJIy975ppI4e+iU4YS4aqkNawE3FAHr/hA4fXfH53Pfd2oh/
         i6mWgVPaM47+erWVBLEAFPtl/FT8DkusEKOPEk69f6l+3J6fjpElC+xDL4NGkGmPoaqN
         8mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045085; x=1789649885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UiWyf1Dh9nthmX1SJ2zMjXD0YayBfWTFNKR/lg5M5tg=;
        b=MjypNRasItdIgC2KEY6wnVH1uLFl4AHYhf2YDpfAwNQcZ9NJfo2X+xikDWjK2f7CJZ
         mJiJ8RQCqrDFlUTFTWWZu+5KGFciLU7PjftE23NazBSH6D1BZJ1ADUSgDP9Xmq7azsSI
         6m6UNQMz5FkPyhsTFGNEreAXlUPF7oT5xsi+QKeHApR/uCLQ01lzr3Sxv4U7KJNVmT7C
         P0jAVyqXJMrCZe2ypSLug6VOp3VQo8HfnM6i4Vx1hrrPy2XQMXARWiuVUftz7sAdKOCy
         Z671kQwp4EJ/knlshd3l5UOcBANs4Dbj9g7Kjx/Cb2DC1+hHgweWC7P06Wxi01gY0uA4
         9djw==
X-Forwarded-Encrypted: i=1; AKwUvBwHIuppwV5SkfjSusowFknC13pOCrn0woUp5l9xYKZi79NWfecR7fJXLxtlXOYt4kMxcDxY8ns5AjqaUA==@vger.kernel.org
X-Gm-Message-State: AFuF++nNB6D9N4FPNgpaj/pGJqW/DNOD4uDANsDzh/mJFhZVoBt6f3Rk
	eeWwLyipeywRIPr5eb1HV7i5FaziYptvd3DkWcNyD+w3yr3DjB6ZJbk/
X-Gm-Gg: AYBFou0VwlCYAFBp3tDPcy+Qnl69vilTCzkb2yAUiWh4WTXIL3t+BmihegFSZTow2N3
	yHg93g7NeZg+QMABtuPpvlgpSoJXdBT0tMRDbRJPEgHljgGR5My8jBSdZUJyGzEQ/fuQ8WqtkEX
	+Fhl1rNCDIIWYWOQUsWOYj2mvLQ3tJ1It9Ck0qnDFxgb3knBQ6J7RHfz7FDbm5d6xk3CIIuNwWT
	Bxi9ep+t48QOWPYevP/BtiiNBQwiGbIm3Ud8BJuEcrKrQqZ62xEwK75Orjq2jnPvGYjRpZG1AS/
	Umq6W10JCc39pLrwrvZx4HtaOr7yQ1DhETRfcwiYQkni4eTwOTl+koTS29czfAuk+LEK4d8DRzC
	QbsWR85NVQmMFXUWxeM3QFGn2b2zjTA/Mvmyi8XbeoXp7Y8i24L4IxG/IgPJcqTfMKqBbiSTxX+
	SDahvwlAj7oTHZmjlq04+oY2GANXwPFFIwx4LF1iYSsXeN3Tvp3EAmrIvHxNrd4WE4VkvSIm85W
	IJSxgqhJaY7YnQrPfqoAe6g/1Ri0nZNYY7g8vJ3HPVP3+KDgsR26mJYg3TNd7cccY81TqrWLo8s
	iGHYJiqpMKjTo9YD63VIv7LV/A==
X-Received: by 2002:a17:90a:d406:b0:38f:de94:bf34 with SMTP id 98e67ed59e1d1-39d77b1c378mr4389281a91.10.1789045084933;
        Thu, 10 Sep 2026 05:58:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e77b1afsm4891592a91.5.2026.09.10.05.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:58:04 -0700 (PDT)
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
Subject: [PATCH 01/13] ASoC: mediatek: mt8189: Return error for missing regmap
Date: Thu, 10 Sep 2026 19:57:30 +0700
Message-ID: <20260910125742.150902-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910125742.150902-1-phucduc.bui@gmail.com>
References: <20260910125742.150902-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_afe_enable_top_cg() currently returns success when the AFE
regmap is unavailable.

Return -EINVAL so callers can handle the error.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index fc7a7a73b0cf..63e03a40dbbe 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -236,7 +236,7 @@ static int mt8189_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_ty
 
 	if (!afe->regmap) {
 		dev_err(afe->dev, "afe regmap is null !!!\n");
-		return 0;
+		return -EINVAL;
 	}
 
 	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
-- 
2.43.0

