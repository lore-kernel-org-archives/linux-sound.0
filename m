Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0BF30F95C
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 05:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787893557; cv=none; b=K3dy+t2Ckwz+4nKHqiQLkCsYXpBtaTjWjFdyN/LI+yZW4v0JbGFaJJa0gGyM1cEeo8X8h0xYTMO3xkDhws+g1hXuN8NV5wCsFNEZejnxlkQmjzLpyaqD/h3GRlgKrw8z6rwO6Whzg0u5K31+JJGO9mv64SjacSVN+z30EvcCvgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787893557; c=relaxed/simple;
	bh=Q7QQT7/BVhDq1O498rAEP2puFeqnHzBBniDPqc+j0VM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gwo2deqGN87jjCEv/h1YcDC1HdIbPcbTa/+kGrL9JdqaE3Mmk4PQ5rEOQwsTcekUnuzIfCzqJ/0yq+P8BctUqOV/D2Npey2A9PTXNyULN7og88pYJu3E3zCNxXJTICA7clhEJy2mE//jFFEi6xUQQ2bL4JUqwEw7Y6vrPNBFsbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KdOGayKg; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KdOGayKg"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d72ae08fa1so5496805ad.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 22:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893555; x=1788498355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=KdOGayKg73h5yOVMTM+lSR4hOWBJPZ9EeCrACOzM/88sTIJybLIcIcuyMLowwJK0q7
         539iKbNghWjo/eCAnF8qePEYZV2YqDRKxMkQhx5gYtru7NiA+HYZPBH0eZ44apF1nQKE
         b7UrFLjLRKd2WR1rta6KBibc8U16AvMlJeX8cfGFxQxffHvZQztm4pErP+VuamOtSHzp
         bsNGIBFZX9SJCkmitV2gkeaIOju+cOXnfX+ELOhe+Pci9Q9Gy239DAKZFz9l39fMnUBr
         d00VklGy6zUpyAkidyq0oaKuHK9t91gtUqqSn+vYTsfX/3duRgQOqoZBuJPTzkmcMKyk
         wyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893555; x=1788498355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aHaGtDWIabgwE9bMPCVResetCLU3h+f9hWvuf0/laf8=;
        b=IAxBHEsP837TDqkuKVYlsik4bpxirtqL9IpZTYmFRyi1IflMgsAXC32bryaPSGQJ2T
         ZbwoETr0vOzVejb491yIFQcVOSavnEcmTC/py4KJ7fT5234lr0lJyV5BWDoZ0MxzDqOt
         uNk2zQnHv4HfeyDFz/vEEh/2hfufX5G5pznOm4I6tbWgm/CEOcpXv/Qo3GHpbc3A4bCy
         WEsTTZ9ie2oSMY+M9vt5wbsYRA9HwGe/bg4WUygq7doAM7ZXCx5EiYb3mfy3aUDK8Noq
         knKgoHj6FVE6spL6Omh+oVi4fkuaUmYhbeVcRZiVSMJVvfpGf8TbR8vhAaZNCISd7wQu
         Boiw==
X-Forwarded-Encrypted: i=1; AHgh+RrF4Ryj6Qf986m7z3m3czUSC3d1+8zLzHfaMDQ0T0M6PS1flEfq+5AvJx2p817hBDJPKNiYU1qHf686QQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m8HvRxhMcNQhZK3+0XXCUTpen6jMCylIwM7i5SFux2GE4gFF8P
	QdTJqnMgQQMxNe3rAKPKLn8OOyiM5h1HwNP8yqOcnp1X3HX3IBE57eDP
X-Gm-Gg: AR+sD126JsWtP+Tr0dxMrQFewRuBK8MAIbDVHfQ+YW80Q0XFxZHAWGfH5evwtwnAMxs
	BnvjyQqXxEUFCGyQO9lARKCXlkdQvGtJR5++Q6xZ41ylH4tLirWBX2UFO3oiYumxFfUZXqvkOwz
	YpaRb4mQNs7fe0lSdmNRTi1qM62FNj4HLeRp62ECisMqHV/43wHppYBiairnH0YbIQOGVGZH+Sd
	9lKfoG8U7tG/NFamME8NGLbesS//yP5DYwQ6+rxTr3K7JEmB4AwyHlOxqbKw9TEfztN/sY6KDTz
	Q65j2ibXeXBQiPnij2pIHydGkc8bIEMK3uVzuZVNl3ZPfaU1JkaUN+T9KsHRLNhZ+kq1S/PUEVs
	mIoTBOYHPRtnDTnP6NLhaX1yFylhQrcu9M3m+4Xg7kciVZZyIVbeV7DilX5lpMZjoVGQnTm+bTA
	YVKx20f91ey4jYOa+HQXG3VOV8E5v+W3tJkfazX6vtt3+FevhzQ5eVYBmb3D932oOQyWURP7g45
	JcCCQB5SGjgp3AJRBbe6R/grTR82AqUHX3uLBeIbq/uof+dkxjYwkOPgHeRQlpXKPjXt6bgbeCE
	elWh
X-Received: by 2002:a17:90b:1a8c:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-396d0c0ffb5mr8090761a91.0.1787893555138;
        Thu, 27 Aug 2026 22:05:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:05:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 1/5] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
Date: Fri, 28 Aug 2026 12:05:22 +0700
Message-ID: <20260828050526.590761-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

In mt8183_afe_enable_clock(), when clk_set_parent() fails, the current
error path incorrectly cleans up the previously enabled clock instead of
the clock used by clk_set_parent().

Fix the error path to clean up the correct clock when clk_set_parent()
fails.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index cc4f8f4d3dab..6ab0734ad136 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -137,7 +137,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_MUX_AUDIO_INTBUS_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -153,7 +153,7 @@ int mt8183_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIOINTBUS],
 			aud_clks[CLK_TOP_SYSPLL_D2_D4], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_AFE_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_AFE]);
-- 
2.43.0

