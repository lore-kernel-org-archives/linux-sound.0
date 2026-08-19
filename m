Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D5F442390
	for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 10:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134683; cv=none; b=T1Ay0wqCqSzheljh4hbjxO0NcBcJpbAa9hGePXMAbLdTNS4z8vl18bFJHBlBWHqvXoO4HwOUAM+398LUKPjY/o3mMcttAI9Ss2w0zvEYZTesqUTdWOha3CTx7KJEt9OVHhsJGruPQHRZl0BcyfjguM/RD2VJG8Hnj1L7e/beAYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134683; c=relaxed/simple;
	bh=Ct1RUPqtEVRR8ESfFzPtk/YWbyQvlIbreWYYAe/pGHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZdW/iqoSN0BU5lprWBmRqt5xIlGOySnWoeBv6ClHZoAnccda6CaSamyfeeQ0Th9ZrGOv2tLOU+JARtKn6vPxl2mtRFenhZDhp04OTRSazkyBKuDOA+DgcwWceYA2jshsMPlOmiZa2VKYras404V4jaMrEChyavNU6834aOYq+e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kKnUTiGP; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKnUTiGP"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-39266382df6so683899a91.3
        for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 03:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134681; x=1787739481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSS0SfwEXWK8UDGH0T0SV6yCqHjHKlU1qZXbtoO+aOs=;
        b=kKnUTiGPw9sHwG3oLqZgiv7KQs2vpdDLV9Z/180Dbtzb5zHfGaDHKpZRFsAGXF3tCc
         MhuQa9oktEtB7TtO1ps8YqNmn5jsbk9ul3m3n+WrsTfPlpy9WC54kehoz5Jj5e2Z2X3y
         vttbnIfDnZ47UQ3ub1FMoCE3xiOLBeicr8ui8LXJ81QMINN+mFidEmIkZx9ynPEn4PSv
         acVrD4ioa26yhcPh5Jv4fX6TMYaX1pjsa9OaA1MpBRjfQAxFE6Y2WKALW4A50reOl5aF
         bpOINao5P203WwLPJDdy7Kwj8/xpbR/4yLaUSh47jy3oX7PICBbvC8KymH1hYll9hdT7
         6plA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134681; x=1787739481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSS0SfwEXWK8UDGH0T0SV6yCqHjHKlU1qZXbtoO+aOs=;
        b=KLuXfOIFG9xMHaVuaLbUb8UaN2BKl9q3cRJkNeJG5HG9WaQ2J3c5lAdq+LfaipSWpq
         SovJhwbOMMUkjDa/hTAVGBWqPPnz/xlShGlvkFQdD4pu6PKhw5GdKvqbMJ+sRzP9joTF
         pJUCvdtt8aUYT0AzcHMpYzxZFEfichzQCLAorEpqdD1lKdx6eBZBeYNr66sVQM7p894P
         mpF+56pd5xtWqWhtHSSLjejy16Qcws2ptiekp92nrhPe2ENf108o/8gq+d9rnWIe4QoX
         vZp+INzeI9bV6RgXr5aUhzbt6EFoiLMq4sr0uIOyQHDelLTznVICO/8iChzb2Mlc0t6c
         wsbg==
X-Forwarded-Encrypted: i=1; AHgh+RoL3Vp0EiAPabzEY+1InOZylSY5rgW7EbDhMt1kKBxnnyJAWYCyG9gCjLLINTAeV0xeZGk/KqguCdlsrQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kuPmQucaMIA8TZBEGO8fXsEzpC6rNL+nJGAg2ChdLHWp/iPUSd
	cnNK2bqaOU/ciYEIKCXuQElR7bROowjGego70ReGrFwX1isSNp+2qHx9
X-Gm-Gg: AR+sD127wwmP7eLA7yd/8IcOB95VEpW2TRNYfgSC6IXUV1+7mPkXPi2nrfEoxHcFMlC
	7RdRsf6vM4wtYbnZlk0as9pJHVq9WmUfdJGkQsAFh1pUDTiuU9rI3w94p7cMFoYGBREcT60PRQk
	NvsRypUmltciiiKIxDbpMKxdfsVyr4qnhg59pBv30tTMX4miiSomqItRq7Sgmwbl/S71wHZPCyI
	Jzwsfxw/0aHLFeo7DgZokFHzKejSNoSvOXI8drAz1R/YYCGTYvL4Ubo8Jb9lIhzuBT5ELrBQA4N
	0Qu/+vlc8Ct5i8qSy+p1N0llGypS0IB3Glum2Eju7taHU4w73i8TRa+/9V63VoqBRn4YMBPy2nG
	hnuKQ4lk+y9wZohN8xVIUadtxDBHzm/ZZFllKqADSTArlypMJZu5mMXXcH49jicOY9YOW+z1WRk
	LwHFmTypf2sCPn7PeQGQ9Cr6RG+7TwImSoneFEZP9XixZJQq7kBtvYf0jykxxjlkUGm6p6rMJOk
	JtkiL97AAGWsIEDw5kb0NtJZcS+m7moSx09dZpMKatoDSfyftwqDpXXp+VJRGVFBeDuWh1h8/2k
	sR0W
X-Received: by 2002:a17:90b:2b4f:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-39580f7aa49mr7033129a91.14.1787134681234;
        Wed, 19 Aug 2026 03:18:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb60a2bsm2222374a91.17.2026.08.19.03.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:18:00 -0700 (PDT)
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
Subject: [PATCH v2 2/3] ASoC: mediatek: mt6797: Use dev_err_probe() for error handling
Date: Wed, 19 Aug 2026 17:17:35 +0700
Message-ID: <20260819101736.67632-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101736.67632-1-phucduc.bui@gmail.com>
References: <20260819101736.67632-1-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
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

