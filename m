Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D100397942
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315449; cv=none; b=fZJPGEBLKqMXKfvS3tCw16es25Hj2GabMiLNono3pa87zWbXug5EXJpSaLVU9LHrO1CCNHNRgGQ5ic0amejwvUCjoNm3ZTHlQIFOxSFXmknxYaWyg8pUoeeuUsm1uhtdHW+pILzTTNs6wyBnfbzaQHnpLSdFJhCib87mFyV92nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315449; c=relaxed/simple;
	bh=iXxLVjwMkWoyJknyoROrRBROEAewERLInffB9+kF+Aw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DvuEth40ToCWipKbmER75R7mYLXRAAEeY2FHBkICVt/zQsBzZkpSecBEwJtkPj+Okv68IYLhlQMTUxmCYgJtAacB4zEDaoLlsmaw3Pb6VCfFBSMES8XJBwI8+49c/CimH1DdpwcEr8jETR1Tfpi/A3f1mZ6ecTqtz7N3bjq+6WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pjuEzdpt; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjuEzdpt"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf50c6f235so11616365ad.0
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315447; x=1787920247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYYHob6Ydur3f5fIO7z1CwtF7crP/M+VG3L/vmLd3WI=;
        b=pjuEzdptT0HJrEBgV8HAO0l6lg3UDvGXzLK5dS3uGSp41NlGjfryRSzV6DnAoMsAMz
         j7T8/EFqjfx3cu9NaNUBLkA8MIqEAVzQnkrjUJ90NKEGBLsVMmXG+6a4AhEBBJ3u6iQT
         4fedV8kWQIoOCSlLHXXeU0w3YA24xB09qyEV0tzGfdNViA4qBU2IdaRZaNGHeiNigG15
         RXC9dMRLl9hGo4XH3zKUfc+NosWoANNYy45cHJOv6jxBr/Q0eksWUl6lU31hPxHA9qIY
         6nRfYALzrm00SvyS2j/TnTPrDNfuE9zs1aqE/hwgFRV/EprqxRKMnm1U0kad0ZW2hJ4o
         N9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315447; x=1787920247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYYHob6Ydur3f5fIO7z1CwtF7crP/M+VG3L/vmLd3WI=;
        b=M6hQYtodkd1ubslQF153C5Uo8V27gLrpe7echB2JJnBQzPNXL4H+lc5rdBE/eYoj8G
         ZfRI0WkY95VktQ+qaY5tWpSI5e72MeojaOeKtXX2cRKTGen7oWCT33AUbcMVdyxxpm1f
         JQGQlsPHWM4Id19GqAMrVl2fkbmzeWx7YElFlXCWTgBmRM07gkpuXcJD2CcZIlSyBuC6
         FUlYZYpfenF8lYowMZWN9nJ2j+O204YJ2C4Aatlg9Kj0pQaNzTQe9PNc5yv7I40Yna7I
         l1V6YEpGhn7vs5iWRLK4U0qdM0Gcx7UwCYRrfgsMKiZna7zbyB27v9raTyZnipZDm7rb
         laCQ==
X-Forwarded-Encrypted: i=1; AHgh+RouxJCwK1PHapLqut4Lnbnjwm6OEidMoruk2rs9WrmWWeJPKorGebmWSOP18mQQXYENWw9O3MPzfAF4UA==@vger.kernel.org
X-Gm-Message-State: AFuF++nhZEYNGYYVo5X5zuYStFGB35lQk3vv6ud+YQJeRBd03Ed4Yo4V
	0as0XBfipaQhng8/efSxpOE3cuM+NjERbNBBNLNZFtDojcwYjQZMi39Q
X-Gm-Gg: AR+sD108Ms9vQ/cPv5PFWnhwVvsYGC77Pxh7hzKfXtPSRBBOmK40jeE65kh2w04VYaG
	ufmR7YoHtsEG/rKFeyRUZzzCV7DCAcLCNGDiQ7UD5DfjKsgSdN474/4jtn2s+uHK1lNv22SAbzT
	wQkvXmEGm4akQFRcBLX6v6Cg38sPm48cc+2N/KdPx73bNYELBEZ5NU27916u8Wwub6Av3PJnHgO
	ijx0iue7erAS+93qwhuQD7NH6Rb2VZTAn9Dpi4yshFQ4BM5+mQT2QOZW66zU71fjMZBDiS/MPhQ
	aAPbmN717EXUU8c6u0H0ZR2XflPdgf5dhEmAywsoVEtmCPmLz9dpqXg5OBvx1UyvHnL07AXeYRb
	RzKwpKMMFGnp6vUaHBtiaUAg/15S95bEX8FMJTgj2cDMmNt6kIfz9xSZWhJetmMuP7eiBZ6BqFL
	5491erx7U2zcmfSDCCcS4NzE6uwJgWw1l01UcpEe6L/Ave6Q9FjrEGmfnrC6MOfT8dkc591rdlz
	XNL4idfm1mcCklL41u4eqab7kQxVS5t59lYEJ9HHwYTvwY6hn2/mihYX5NNej4xa/nD9V/iZTsQ
	lhyrzt+UsOhLeKA=
X-Received: by 2002:a17:903:390d:b0:2c9:fb11:1bf4 with SMTP id d9443c01a7336-2d64af4eea9mr121346745ad.7.1787315446434;
        Fri, 21 Aug 2026 05:30:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1besm18302235ad.53.2026.08.21.05.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:46 -0700 (PDT)
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
Subject: [PATCH v2 2/4] ASoC: mediatek: mt8186: Fix AFE clock error handling
Date: Fri, 21 Aug 2026 19:30:19 +0700
Message-ID: <20260821123021.41390-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821123021.41390-1-phucduc.bui@gmail.com>
References: <20260821123021.41390-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The error paths in mt8186_afe_enable_clock() do not consistently
undo the clock operations performed before an error.

Fix the goto targets and cleanup order so that the audio internal
bus parent is restored to CLK26M and all previously enabled clocks
are disabled before returning the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index aa8b2eaf7b95..94bcaf92e396 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -294,7 +294,7 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 			__func__, aud_clks[CLK_MUX_AUDIO],
 			aud_clks[CLK_CLK26M], ret);
-		goto clk_mux_audio_err;
+		goto clk_mux_audio_intbus_err;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
@@ -321,24 +321,22 @@ int mt8186_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_AFE], ret);
-		goto clk_afe_err;
+		goto clk_mux_audio_h_parent_err;
 	}
 
 	return 0;
 
-clk_afe_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_AFE]);
 clk_mux_audio_h_parent_err:
+	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
 clk_mux_audio_intbus_parent_err:
-	mt8186_set_audio_int_bus_parent(afe, CLK_CLK26M);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
 clk_mux_audio_intbus_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIOINTBUS]);
+	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
 clk_mux_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_MUX_AUDIO]);
-clk_infra_sys_audio_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
 clk_infra_audio_26m_err:
-	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_AUDIO_26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUDIO]);
+clk_infra_sys_audio_err:
 
 	return ret;
 }
-- 
2.43.0

