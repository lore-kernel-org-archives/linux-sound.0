Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C8E41B354
	for <linux-sound@vger.kernel.org>; Tue, 29 Sep 2026 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662351; cv=none; b=RrQ0sLux/kTaK0anpbbDdYiWNwSmSEB2Gn5bvQ0trfKnUKwE8CrWvVOxk0Zjktek0MlPxLM/QN39nchIX3vgbM1yJlYB/VM5fruVilEtJmkCEDsHjov1kqQsXoMcs6soHUCS2MSPEoiJHv83MAcRii+fJo52sXncmMm+nytWbMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662351; c=relaxed/simple;
	bh=ICRPRat5nDAnR0mTCgPDNQqSXwR41U4D6Unqy/wk6q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gaB4GWBL2SiNMG4LKE08tSZQgl7GNT9Ksp4ZFO+8T5roN5qBfwvWw0OLsVCmJ68Cg/c31tBzQKK53gIcNLxw0BFTggD6KJUebwXBYLsAUZCkTPzYTVV05OZPj8wEExHvPk+3BPBjaO+e0iFzoAHQmemfnbMQTq/eikKmIScocW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMMbbBWB; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMMbbBWB"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccda24afso1972768a91.3
        for <linux-sound@vger.kernel.org>; Mon, 28 Sep 2026 23:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662350; x=1791267150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o1ihgfA2Xx/YQxYVKmUYf4V9Nz+OYG4xbe0ZFsfUP2g=;
        b=fMMbbBWBdf/kLOvvDKouYZi3OhLwC7K0sK7kVb1IyFD7gx01WCD0SW+Mxyy/dQJ6Dk
         bvj1nvPBN94W0jZiaQUVDWx5oNs4SUsqJJ7rClwtxbSFpSDcwR6Tg7a/HtJTHt//F7gU
         oixjdqnE2rsgZZEnsdAk+rR+VCVzFsJE5uUz5telIlRNTyomjG4yOxjKuleU9asuufyO
         2W3d/Qy0wZZEq1P/MxI6U4wHnJFn8YLenVaZnGwuUvRas7EUIFP1zLEuaT580KPuMsha
         bx4i9PV39iLf1Lqh9crjJWclH0Z25QGUv2mj5/rp4LmpCOaneNS/Bycnh6P+hh+fv9BX
         ebmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662350; x=1791267150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o1ihgfA2Xx/YQxYVKmUYf4V9Nz+OYG4xbe0ZFsfUP2g=;
        b=oezzLF9F2tCyobEVkAaHGlabG75FTY+nMFBx0gWAlmhAo8x3jelHnmHZ7Zu/qorr8s
         kQWmq6/W+qlYnDQSMm7vhgtdXnq90JS0/BIpf+qrYND6cH9zClfaG+G2Q4eSYA+M29wE
         0QFA5Gipm1pxjYrta0slasmm+Xp1gWUd5Ue73vEwNk7q/SJxCzrXPOlTds0znbXHcz+i
         saxp3dpYNQtmf7rdnNhpIYbfnZbzOqNsq837Hd8NkqSpZh+Ga3Ev++nkDSr3sd5Gs2ha
         yf9Yk4QFmiL85SZRlvK9x5Bed2fpexnsMegNMaYTDYs2P7G7vbLrsrLjOIBNCB3mWzdx
         PrUw==
X-Forwarded-Encrypted: i=1; AKwUvBxLIRAW70EP0wa6Cs326/2cpXFwFwhaOOzJzh7tHvhtO6CN5qw7pUwlGO3flqE8Y/BIV1//TQhiplV5tA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJgzDHzT8RxW22CdMnr7a5jhIA9f5f5KWUPe3ja7rA0G4Hgf80G
	IPGpzNdz8QL0CrDlFGM+XhSbLdqYPN1Dr1a6ZBqCj/a22yuRLFI4n/45
X-Gm-Gg: AYBFou1Gs2gwXJE0Ax8B3/bwTux3eEBewSjxO8/+/SZw/I7+0BBIK3HffDAtnTsT2Jg
	cPGo5H60Rb5JmZTabrqSz8vmgzH1JZ/0wEKktzJ352FB8kd2RCTZCuLM7s+xm7Jm24p8EyV2LhR
	bEA2wD4KtqGU7kiDWCDhd36MELrS35MHl2GSANYWC6eaWMBCiIKBpXtOPvxyZtq9nx8EeI6OGW7
	ZNy8k+3sYwADYMITnbKmw0YmJtTGGmRiAhjmLCrvyp2wzTrLMikIQgQ7inQau77AvWtVbeJcvC7
	nKQB7NxYi2uM/mqGq/ZjQGGeCSopP+nGMTrZhai7Esiv6iPARLYScTFpCW332Atb7xJEvyRmUjJ
	nNMspsaj/i+78E+u4nQFPwPBHjYjP1ZeHK2GUkndHM4QuiRhppyZ3SbIHiyuFVhWD9xR+Gg9dcj
	vI8f3W5BOL8p5R/oaApO7giNTgrD7hyVgt4YhJEaIDJA4yjC1vjYr5mLyrkEiiBfZWC/tTb7GQ8
	IkBYUZnD9/d/1uox45/mwDDfVi47Z7rKY5RBoFDW4KlXJQLCwYp5CBv1KTUnR/ocOoh6WqUvoIN
	KG4FTHerxPpiMQ==
X-Received: by 2002:a17:90b:3c0d:b0:3a4:6ff5:778 with SMTP id 98e67ed59e1d1-3a46ff510efmr2033501a91.44.1790662349906;
        Mon, 28 Sep 2026 23:12:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/10] ASoC: mediatek: mt8196: fix runtime resume error handling
Date: Tue, 29 Sep 2026 13:11:18 +0700
Message-ID: <20260929061121.124001-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from regcache_sync() and main clock enable operations
instead of ignoring them.

On failure, restore cache-only mode, disable register access clocks, and
clear the 26M clock request as needed to clean up the runtime resume
state.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
index dcee037991aa..9888812cd993 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -2211,7 +2211,7 @@ static int mt8196_afe_runtime_suspend(struct device *dev)
 static int mt8196_afe_runtime_resume(struct device *dev)
 {
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
-	int ret = 0;
+	int ret;
 
 	ret = mt8196_afe_enable_reg_rw_clk(afe);
 	if (ret)
@@ -2222,7 +2222,9 @@ static int mt8196_afe_runtime_resume(struct device *dev)
 		goto skip_regmap;
 	}
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err_set_cache_only;
 
 	/* set audio 26M request */
 	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
@@ -2233,10 +2235,20 @@ static int mt8196_afe_runtime_resume(struct device *dev)
 			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
 
 	/* enable AFE */
-	mt8196_afe_enable_main_clock(afe);
+	ret = mt8196_afe_enable_main_clock(afe);
+	if (ret)
+		goto err_reset_26m_req;
 
 skip_regmap:
 	return 0;
+
+err_reset_26m_req:
+	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x0);
+err_set_cache_only:
+	regcache_cache_only(afe->regmap, true);
+	mt8196_afe_disable_reg_rw_clk(afe);
+
+	return ret;
 }
 
 static int mt8196_afe_component_probe(struct snd_soc_component *component)
-- 
2.43.0

