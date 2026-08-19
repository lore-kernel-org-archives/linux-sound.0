Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A323E834D
	for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 10:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134743; cv=none; b=eb38lXofijYX5cy1PpiYnuqG3xFXLs8eith0bjPiSmVwHMTIhP6nx25TgnlGclnraJa25aN1zp8FWie3a1FKR4cHLK2wxBweJnKZQEo2Im16/npkhFwg+Doiat2ZqQ8xjd46D4HkPqRTI8G8ffxHm5oStMSMT6i5yeHIEZWiH+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134743; c=relaxed/simple;
	bh=coj4MMAGE22DbW+ZdR3ylhrlSHaRLYrkyTDy2imbEI0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l5jqWHLhBcZ+EswMuTCOMXYpSa3ae8vgkag8+PfGWAlV2pz9xvjopiqv88MSxYq0IvH+a0zlxJm2k2nkv01zTmUWkMIFx3Z2gj3GOy4bzA7HlzZXa87bNMkgG60lqYoyUeHCKIlw3hufsmEfDMcZcWuyb4js9bV2tvnSvH9SlME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnGMH2un; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnGMH2un"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e08baf860so984015a91.2
        for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 03:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134742; x=1787739542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5JyEyakg047/qVI/dgdygc+uAR+XzDJBCS95evddBW4=;
        b=DnGMH2un5zlwLMM1sv4/8Smd7VufwBTdq2cKBW4fyCUeiGofagXNit2NVvZpx1FKTD
         VMGpf1AU1y5irDat68GqLZXL9oBd6n5LbGmK+LPX4rhcX37lu5sdCkvqvzCleP3YYc+Q
         6rVJKIMcrIRxaAgDds/EWxZ9zNX/3kUhBOzDvVRy/q4NU2X9Hf9Pj6ukjBMbPLIu1uAW
         66wKIC/VWbaFxLe2swtU2OV9CudYvPHhhA29Z5NfyUOJIV1I7JVVog1a9lD+S/N5ijuZ
         TRodfg6bq5nciJF3Y48V4usP7fXYCvJxor+JFxswcDZqMQKLQe16RpNZkGxEJHsGckvu
         CMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134742; x=1787739542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5JyEyakg047/qVI/dgdygc+uAR+XzDJBCS95evddBW4=;
        b=dlnyukmiU6DItdGp0hReEm201bVD/ri1RVAWBF1M3Izpfzrt2HzhjIInz6HWVMBmsi
         n2KCg7bQWo+yyK4x7qNGVy3DXnQewvHHw0KnI2dYdEJB3NJxn5tbounFFsvwsMKO61iP
         WuI9ITNpKo8u5yjjibFeGqph4KKhqRFcUN5VonqgZhM5xZs6Os6PbxwW4u4b8kuc4K37
         dcTr08lWGWC+xMf4T6MB31pGaGjhLjQXpdp1W9Gf03oeIDyBDSe0HOw/QpY5HbR9LAHe
         FFsjBmIuuvKyJ8bev3J1/QZdS7mEGT7MRgmttDvn1jxKu2iWolZO50o9W9GetniJFjGt
         pc/g==
X-Forwarded-Encrypted: i=1; AHgh+Romd0yqK9udHmROPIekSwJVn9A3UkOY9fvC85XY12kgyqxMFGIgwL6mVW4ApRePK/NEbqK0eJLkPDC+ig==@vger.kernel.org
X-Gm-Message-State: AFuF++koyhXV49DIlW0wBHeWv/ziANFNf67afqGC0ChTkqi/CBytHBlT
	JyonUXiciaJ6Qd06vlKq2HUmK/YPfBEG+rttwzZfym/aqJ7EzouGKlzV
X-Gm-Gg: AR+sD11XqDnTsVTC+ntPPyJdr7mozZZZsg5VBV1iI1twLVnCPhfVTSWDsj3tH1lzKDi
	jI2FaQ4f5x5Vssh3euruwB2LuQXZ+mYPuLApq2XBAHUwXSJsJL6863vv6esvsDgESduELBUZ1fh
	BIha8OZPeHDihoJzXOw1uExDibzlSE9EdNc+kzdz4VWxzG7oYQUt4bJVHMhGMw4QaIJL10UomHq
	ZayCvWs+kcipxQlSNaGMcYJHNubrCxjxPuT2TGqKc6BC4fyd6mTJy6YuMUKqS84RVKp3aTRckEz
	3Vi9QKawDG0qf4lrJTAk4jSLJXreD0lWC8zP/7VBRsz/PG+f8PMD9wIAiy3wEhj9y1BXDChXEQk
	DZ3ljFN5P7AzGqiQhzAW3yelu/20CNkmsAypaSf90Wx8XtNk3hjEWVSr1ubxeZcsHy5TYqck5Sj
	+8jiih0ANOk7lAQdd9Piz49zxMk9b2ojXLmiP3EYDqDdnBoMq1H2CAFYt38O4SXCS18U9IwgYp5
	1VkDh1J/HoZksLDQyCqoAP97607gxxhC/gSVEEAo84KSZqwhdywAhHf+uPProP8x0UB6fJx+4OM
	kYv3qBJmTjSDm7A=
X-Received: by 2002:a17:90b:2b4f:b0:38e:67e1:15b with SMTP id 98e67ed59e1d1-39580f0d585mr7158158a91.6.1787134741640;
        Wed, 19 Aug 2026 03:19:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm2146392a91.1.2026.08.19.03.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:01 -0700 (PDT)
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
Subject: [PATCH 1/4] ASoC: mediatek: mt8183: Fix wrong clock cleanup on clk_set_parent() failure
Date: Wed, 19 Aug 2026 17:18:46 +0700
Message-ID: <20260819101849.68010-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
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

