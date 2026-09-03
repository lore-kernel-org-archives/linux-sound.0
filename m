Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D0C37E5D6
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 05:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412349; cv=none; b=Yus2WHzbWNHue+kZEd9/TPgN3tjun/5bBhj4r0zYJ8Hr7j2EGT4IxvkGk8ghsaIZfY+uGIS7L3cJF+VQQRrJW/wgg0Qwcs4G2xQ9nkj2dUksz4TAt6pYXpACjnV7SDXeVlE3C+5BNmU6XfOdGpBSbW75tbGSmYOcXWp4o1HyE9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412349; c=relaxed/simple;
	bh=Lu9ftL++z7WjSD5MPMDlXb7QZyJAM5mSBPMFjz6MMrA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KiLTDEUYfIMgbrb+v88UdwH4pPldsZET0oTNWSRsvYFjr18N7tRnE+0ZZPdH8fJmozpnDpieR/E2kWfo3OLr3drTRUGDWu6XCLCbnvGjtvrpF5tCbrWkiKjbbrOqpStagivickZwOgli+u2TQ8NR/ZzD1+1avVEDOracWzqyVPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdKwpUmL; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdKwpUmL"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so2313931a91.3
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 22:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412347; x=1789017147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=teLAShLua5VCgT/jcx7hzSu9pxqI7I/30dsuHzraqHI=;
        b=fdKwpUmL/dNbkMxazywB7B5oHX1yMxA2kkHJPS/l02cXe+9j88T/fL6O1PiLKbXWXY
         Ha6f6fSEVzQly1oPu6OrV4NZwLoiKLB8E6TFmne09wdCJHQIgDjpLAVcl09VaPuimpoJ
         YicoyahMoo4BiZTvIF/CL3ZYBVH0ycv42dfXsBBcYyPT+fuGrD3Ntnf1uJ1u3QcQNMGR
         UTC6gsBD4dNC46fSmMURvT+bCsKzkAEkrQ/HXQmqisxYi+U+qxWO4uxDW1TBD5Y0NA9q
         ln4ojTCdw5qnoE54zFg/8aLSwAbkmSnarYpfJViezZrusHxeUBJfF7SXR+Zga7Ynm/af
         rTgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412347; x=1789017147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=teLAShLua5VCgT/jcx7hzSu9pxqI7I/30dsuHzraqHI=;
        b=WWsa37mCCV4epT2Y2TDX0lmhr5ncdV01yN20+9sKFc5mn/dOyKYLepsq+48TID7s5c
         cr0qJbzFEj+od0mr76sWt4ybYvSfk+8oYyrPFYTNRenXwl2NqKFfnXAhDEptaH51i/j0
         mEaQymEC8BfnoCUJLND+z2Otfz8zFuGZ1fOvCgAMcjS4aKMI7rviy18wPhqmt2BJRhMt
         YWW1CM3Wq0duV4AY42IV2ocFOFISBZs/0WyI3g1NXJdBVc9lH7nlurazL/UJ9rnrgJyh
         CN1IdPUiATpmKmVtUq7S7sEVYBxBVFb+6Ke80i++TCMZtmbZl4UXxzLoZ43yOBcTolaU
         Vhtw==
X-Forwarded-Encrypted: i=1; AKwUvBwCbKw/MaVOV3EyvOLyyCdRBXCZ2bsQlC8HtNnTCfdXNR89EGsEVSnCeo4D/bzKHuR/iCbZfgAURvQ2fw==@vger.kernel.org
X-Gm-Message-State: AFuF++lt2JlzkyCOAEIJtKp4r2UHOfqWt7XoBL0Ghv4ZM8a/Uj4YBMjG
	aRTviZOaMiAd7EOw9AeO8MJobF4dhyR/YF4Yru3rRZwu4xhqAT7seiaY
X-Gm-Gg: AYBFou28s7rDCKS+XZltqnY6AEXgbkO+Nucc71XTN6ja8X5vS//KmOsz8xNRnNjeup1
	6ocPfFd2Tnyf97maitjeYJLqMBhWpyNeGQ8olhnIrfUNdFAFTn21a8dM903U5qhSEgMxtdMNw1e
	mwS+r3TFSkXFp/1dZ/9is7xEIUMAN0cfkYXMVKyrOIKz6l8zfy6AplZHINdbGjc8TKuLWy95Kp3
	98JDcDMFMhDCkMO/UCe6YojZVH5OwnU6NxBUX0MKOL4jxEjzRyw8LxmuoRSiikGDFNNljr8jrSi
	4UtG4vwrmOw0Ufqc1KnlYLkCWAHZ9kMHBthVGfxcW88X68huWzZ07K3J6p5IPa8+CFiYtlnPqxw
	/ocad0C3mvY8raPqnM151FInaUPyQoA9+k21B7d7Cq0isypRGUOJcZA62CFgrkRbgz+Z6HrH9/Z
	1bj0I4/vgmUzph/wuuWcuxoBN91yDKNIs80+aL4IANx2z3nZTvKyzGVHyf3ixwQ21D2K+R3VT8o
	a6+QKL1wWkjMbCSo7S2EQniy7SrrK0urPMgbDAjYrvXEG2Juz3CabWozlvDdgisP0LiIyCZoy+Q
	e56SFQrUfo/ppx4=
X-Received: by 2002:a17:90b:520f:b0:398:9c00:29e9 with SMTP id 98e67ed59e1d1-39aee1b72e5mr16164501a91.17.1788412347415;
        Wed, 02 Sep 2026 22:12:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 4/8] ASoC: mediatek: mt8186: Fix APLL enable error handling
Date: Thu,  3 Sep 2026 12:11:46 +0700
Message-ID: <20260903051150.178057-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, the mt8186_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8186_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8186_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8186_apll*_enable() fails.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Return directly from apllx_mux_setting() instead of using a goto label

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 685dc27c7780..77a0cbc8ee24 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -353,7 +353,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -378,9 +380,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll1_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 err_clk_apll22m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+	apll1_mux_setting(afe, false);
 
 	return ret;
 }
@@ -406,7 +408,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -431,9 +435,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll2_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 err_clk_apll24m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+	apll2_mux_setting(afe, false);
 
 	return ret;
 }
-- 
2.43.0

