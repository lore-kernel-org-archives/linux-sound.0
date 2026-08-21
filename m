Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0526A3AE6FA
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315349; cv=none; b=V+14ZxbX5hHUGDkUKpD9Av8+kt6o0IGcBhWViAWyJSfNC7MD4bhOdcIcRR4Ig4oQHn9aPsdp0Ie8q9k5KgD/9IPcBUMVlqtbCK/x+F8Dmbgbd5s3EgZ1ThLMUv2ALugWasLNPYAVCr2R5E7SOAUDeSpCrveRi9l4GJFGqqH4OO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315349; c=relaxed/simple;
	bh=/4u2SLF/VeE7FsrTrtRP221xMUuJQxfBqk4va58nyr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qwg21WxqjDIwcYbYvGrLtK5OazCtA66JhZwYGcsPnuGLqNtWTWnI8FkZt8G79BjN5DVeUpYnNhvLAeBQDqufG3P4+QKVmY8ZQ9OmHBWbzLQr8ZB7dyEBMvflAQmb6ykIlpb88ueLFVC1hF/DK3Gad3eGxv7MmIZ6AYQBLUlfRuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e93ptjjY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e93ptjjY"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cacb8416a1so8842945ad.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 05:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315343; x=1787920143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dxWOmCJy6lCBH+hX8gsDYN0Y68D8NP3gz9hPpZDLYDs=;
        b=e93ptjjY/ekleF66U2V4LrvlX1IePq+L5z0F57KaSu9DEDroA5OfBw/7i5xFeL9Aod
         P8Np7fmcOLUKmjpBKi+K64EDOqxdXS3m1b7Ldb4+VFBse4bdwPC1u5CMk+QVGaNqxkol
         iFdincG1g9L3a/NJVUC5tALxxItkUb8lFFQIGdFrsXeHbSmzwXa3h7ZgB1qTKPnC+Wxg
         GvaQyjtGRcez1xcgE2ItFM0r8Gn+RyjrpLdiNoEVxzajA2Vd4rATMdIB1yFgy0qhe4SD
         3YpQ4zKgXvf9bbJEZTX5D0dAZEWKBgympI7KuT6kJgRRbAbwSfrrUYYQiaPFTjIQA0qs
         +XSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315343; x=1787920143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dxWOmCJy6lCBH+hX8gsDYN0Y68D8NP3gz9hPpZDLYDs=;
        b=tNqqIlQlhb/bwgGiYdWvyEOwsY4EiHmKPXFN2DjxwakKarjyrXSBV79jsojy9KRoS1
         wQjrvqDc3mczBGhIykjUqogB3WTUzcFdehsYUC8m3iCHLDbccPCQ0N7p7xGqCoctwoam
         t2o9FHMJvDw1E2H1ZvDM5DrgKAwPQ17P1fUzPO48aUyctHB2eCcnjlp3GhwXGVgYmJmn
         yLdMJNkL5484IFFFk4NThqS0vNRw3FJI7++N7gIy5z0IZPG+Gg2VNpYv4c5w0UX80U0d
         Dp9OmvV4jTkxcqFO3agbeeM2EwoFz2jeFFn0ajAFhfBQFeByz0eYMdxKM5z0m4DBAxNY
         Q3tg==
X-Forwarded-Encrypted: i=1; AHgh+RrKfMf4WGbNpUyY18DMNGLMEsHzBJkNgMoFqg7VEAlbtrBclgG7Gu+M+ll5Dff2apFzZH1v0B2ktX1Dyg==@vger.kernel.org
X-Gm-Message-State: AFuF++n0ZHeh98uZKFH3GzWBncjBgIcKyEWssZSy1QUO92aU0deADgsa
	x+Q4CWte0FK9o7raB8/pkeFF8/Ld7Q11hj2TGkCSUV7qSNlJlQJhmoou
X-Gm-Gg: AR+sD11+R2uIcy4Gb7ijvldotUHz+YBifDHACe8o6jzNhSQdITGhxS2e5pPJ1SNGXwG
	+FYaNc1o1FHeBM6USj88KW5SzKwVsAv44utdAlZ5cGXIS4K69VSoRbhEhnC7fKkwKny/P0cFkLH
	0km5Z25DxC2ZoW4tVCD/KP6GV4w6ya2NLwYADuZ5tbXILIFyc0+v6xtXbjVV2qiefx5anF45fWR
	HlZ/ef5kRFvgGSLhwGJ0iB5q74fYwfUSdVjXgjlQbeZrh19ehTdxfpHJCbWaDIOUjr9mhrKrDuB
	/uxAZ6orsFHGpAmCgW4+PviJnF8Nlbxm4JhyZvKpzgB+PcCdKPTAZlXZoOsYXB3YYqgITASH4fR
	ZYEGUmYFH8zZ6A8DqzITfHWoUBLk/8lyZrTKxD8vcoyf3SuA87001kbYAH2Y8Jwsi3NEXQcsxv7
	WoTlmJB0i/A/Go8JGUjnwQx9aHQQeOq5RG0BnqrPUloVHmRHFKsa0tJpvdjUk0pUleGGJHLbxo7
	mbEjIsKz3M3643vyNZwOFSNWbmt8+KT8Aa0Ewqies0M+OpVZoxKB2+b58idVaqAM92loomDjoxY
	1+Dw
X-Received: by 2002:a17:902:e790:b0:2ca:ce92:6e44 with SMTP id d9443c01a7336-2d64addf4a1mr124433205ad.8.1787315343392;
        Fri, 21 Aug 2026 05:29:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d554450sm18134515ad.2.2026.08.21.05.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:03 -0700 (PDT)
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
Subject: [PATCH v3 2/3] ASoC: mediatek: mt6797: Use dev_err_probe() for error handling
Date: Fri, 21 Aug 2026 19:28:39 +0700
Message-ID: <20260821122840.41266-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122840.41266-1-phucduc.bui@gmail.com>
References: <20260821122840.41266-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
Changes in v2:
 - Update the subject prefix from ASoC: mt6797: to ASoC: mediatek: mt6797:.
Changes in v3:
 - Add Reviewed-by tags.

 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 0ac04d73b777..2326496f8b27 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -43,12 +43,9 @@ int mt6797_init_clock(struct mtk_base_afe *afe)
 
 	for (i = 0; i < CLK_NUM; i++) {
 		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_err(afe->dev, "%s(), devm_clk_get %s fail, ret %ld\n",
-				__func__, aud_clks[i],
-				PTR_ERR(afe_priv->clk[i]));
-			return PTR_ERR(afe_priv->clk[i]);
-		}
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	return 0;
-- 
2.43.0

