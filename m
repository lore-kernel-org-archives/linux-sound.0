Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D631F2DB7BE
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 12:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315456; cv=none; b=lycpnCB94SfykGZ1Zwhd9+kcJS4//ctica1e79clLT9WdnS1+9xkn2Y06xHaoWYSvK+W7KROxhAV6Ir1APHp7khIhM/uqSSRobIGnisCLkxF700WZK///v7rcreuAuX+86m9B0nS7pBUBKBSO74anXSQ5431xPsSUOLVnByQppw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315456; c=relaxed/simple;
	bh=zYEyJa4Qyd3J1VT84wcZMZlpZNVLGXeLDORoEAIUOFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qlKeFceCEWjDhbLuAqJLPt947g2QT3tCpcuy1xCcYQHk7cKqbXzt1RQR1JW6h11uHBhAPacnh9slhaIzpupFh1K+NVdS5zI2TxvHz9wF2fZKW8I/r8IHrKurc5SvqExdF37gClgL9Ys5YPz/7YZaRHFI8nO9j36Avxutnd7u86E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ydn7nmc+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ydn7nmc+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d5cad1a6baso8692835ad.3
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 05:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315454; x=1787920254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOrddxMe438IsC7xeJkXYhGEPOhIf02MCjyvV84OxAQ=;
        b=Ydn7nmc+SL7IIQeqE3LxFs1+XH4WgSi1PiCDPWXQubpfn/uzaGseQI/RAGvTm0feKT
         oCeyJ4evjJE9HmI/7aebfkQumJrIl3B6qhF/+kb8fNsD2le08LGOsXVcEpzemDQYj7+3
         dI2Bokz/EwUEisJurOnGpgMXb0C//vfxkCb3ZVTDlTRIJ3zIJR7pG56Y03Yg0tnzDpyW
         fdWwRPCejjGASqzllOpFt5RKU6escQdXFn2f833yWIYXn2aceOgweI3j8kt6iA3hv9vC
         XteEREw8ifkFVnYrWYlatWA49I5X7XGzEt9RD4+E1PgA7p70JY4VQYFxqsPhmSFaGXMD
         utbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315454; x=1787920254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOrddxMe438IsC7xeJkXYhGEPOhIf02MCjyvV84OxAQ=;
        b=dc9kgiF/cuuRSNf+4k7E9lUQvRWoliTiRhoec/nAhqgly4NFgYm2cCMMrO6zdJaQQb
         qRrdBu7E1KtG4DclyX76ZV3B899S7gRhUTnKEoim5qUkY/Xxww0Uw8keXAzBgbKTPyjI
         Rz9ja2WnEIM0lqfif8yzMXyFj0UhL2aEhsVmwZBkmm+2uYeZs4kkFM9JYbqWtnWfonSE
         lN/ZOTghicEz8rX20WyYHuyzlI9jjjUgNSIImuiDmTJ/YgcVhQAwCgabWnx/hIS/yHy7
         WkmCqEN8nquh2D92qdIvu8COL8wwVlVquurxchwmMTiBn9fCn6zazdRLHGoZCxJon5ni
         boTw==
X-Forwarded-Encrypted: i=1; AHgh+Rov4FSlvMIdzMozvKKi4Z27IPJNRylkeUWv8I0F5m1CBATk1UlgNU2O+1bWywFORRYtRVrOLhNQiso0Dw==@vger.kernel.org
X-Gm-Message-State: AFuF++lb77XRul5vdwDG8KdtKewct8npl1/JFOOYFGENy0afNlvw345s
	VLG5oQnVMjHc9Z0M/d433xawoSAkFJXLt/geHAcQ8j9NnQ4GrfgucCzx
X-Gm-Gg: AR+sD12+oq1lqNXe6tR5RCOSIh8CAaJQVI8X7HKgRb48pmryGGdqYPwh5bpTIx7Zauf
	1vnW3yfxAl50pnCuury8QgL4OITsZcYLr+TXbvpQJl+Eu2DYq3GIwoBvd6RzBPFvG4j6TklZBVj
	uUk13lkpaZoi3TC4RshfWf/rHpczYeJXBvkoKt7HAIDfiy/jlrZf4Xel6TFKVaN3Ozd/jEtKlyv
	xgC4LH27G9L+EOgPah5unlTWVwj+jLLyCqQE22Sxeeay9rMR8IwJ7KUJa//lDfARM3l82YGuL8O
	Eof2/01mJNhjsVeVWkUxOJAZlOVw1JXQHEYbgg3C4H2i6kTQzoyGWLZqVR0dE3VgJX9Q/29NeL5
	IbJNTujUc+ycPl3xKKc6JVQBa1gG0zsXqAMidoJTwYY6cRGK6cRU/+m6mvxDHYLhqkl+ivpqZpe
	RBAbHCzyhDBmbJlAhwQUSeXl8HXcQoO2Q0FmULZ+setwPaYRkRlnKtApcOc9SGpG4CQktWHyhAU
	4wUXNU8KQyO2wpy/DopK83jHFbyZ5jx2zKJxfu0z7DoP6CqQbhTUKWJ/qQ3OczWbsHcYqHrBClG
	Gt0V
X-Received: by 2002:a17:903:3c6c:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d64adc5f3emr120518305ad.5.1787315454282;
        Fri, 21 Aug 2026 05:30:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1besm18302235ad.53.2026.08.21.05.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:53 -0700 (PDT)
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
Subject: [PATCH v2 4/4] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Fri, 21 Aug 2026 19:30:21 +0700
Message-ID: <20260821123021.41390-5-phucduc.bui@gmail.com>
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

The mt8186_mck_enable() function returns immediately when a clock
operation fails, leaving previously enabled clocks active.

Add error paths to disable previously enabled clocks before returning
the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index d6b0174e2655..8cc8eb8022b5 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -528,7 +528,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		if (ret) {
 			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[m_sel_id], ret);
-			return ret;
+			goto ERR_ENABLE_MCLK;
 		}
 		ret = clk_set_parent(afe_priv->clk[m_sel_id],
 				     afe_priv->clk[apll_clk_id]);
@@ -536,7 +536,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto ERR_SELECT_MCLK;
 		}
 	}
 
@@ -545,16 +545,25 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto ERR_ENABLE_MCLK_DIV;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id], rate, ret);
-		return ret;
+		goto ERR_SET_MCLK_RATE;
 	}
 
 	return 0;
+
+ERR_SET_MCLK_RATE:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+ERR_ENABLE_MCLK_DIV:
+ERR_SELECT_MCLK:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+ERR_ENABLE_MCLK:
+	return ret;
 }
 
 void mt8186_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0

