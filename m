Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2ED3E5EF5
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370982; cv=none; b=bLFVu8BNUx853hs4GKNPmdsJ8jxURYjoBmmnxHYcH/uKzlVfICN/OgMjXi55ljqDRNwA6QuR10FS2BVmVSH9oQOrJiYPboPRO/arzj0BY8lg4Tsgzc9P+ku00B3YlqF70ccATnrLbfy8KRaVS18eATkgz8qzJuDLKyeFthFw77M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370982; c=relaxed/simple;
	bh=L2LE+CaRB/r8u7ksh8vaBEGwU4XGfFxUrv1E4QN5LbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ex0oE3MV6wSChk1McFvYFP43LhBaKJA70EpklzsLuSnTc/zy6vFeG7d+343N7q5i898ttclbARfK25WQOXd8phMLQfPgb9v2jXEU62Ss2hktQmT/xpfFBbros4ivqoGthzXgHESVUimN7z+IPtex0LDOMm4g7XpMsvdHZkgUQe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpmbS4WB; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpmbS4WB"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4aa02a269so2282771a12.2
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370981; x=1789975781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=SpmbS4WBqZaX2y36mQU5uExJ2EOJgO5CfGdLkaecYaF9LE/B+chwbVaHD1fSGbDfku
         v3+68nQEWhuR20WcI3M4GJ9vTTFTts4jNT9IV2jOdCPOBm6hI4Acre4zOBg0aiSkd3Xr
         9Ne+de4QXLqVkm+S7FuoEksgxhxLHBXAyk2eukIlybVCbU8g55nAI7Qz/CN/Fq4Glgsm
         XdF2ii0tQwTcVUa1xUdswHkSbYtF/JeVemQcE3YzbPAr+fmNRLNgS3TMc31uuMvhymDY
         v3fDRTB3emzXTemCauJyRKRyUXJEepjIJuv0rHyDu7nt72HS2N0bSFSLPCI2EnTsvL0q
         qYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370981; x=1789975781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGiDmxTKSnaxUwBF7nwBu69cnzbPnmVOgMWHLivqaTs=;
        b=DDpWbQB6EfoSz0svrBSg3v65ukctlmh2VyVFGPvLOfJKPsaZCcnSjaEG8MGjhG6Tbk
         dwzL2YfgflaoMa8SP1oIJvbSes5e2ZKmOanztAfNkxymQeA9jpsIgbPOK0JGd6L3i2I8
         xIv41aMJYott/Gg6Ys7LITzQ3u8frEVhfx2sUu5B1TSUL58P0Rneiwj/Jjos49oNsP3X
         H9Un4mj4UmI21qgO/wjO7hT32qHMdMRm0QmdiLkXXU4Y7tN0gFvzu0zOhjQSgr8ExzS6
         Wf/Ei65RjsAuSdnlUMhjOq5e7VK3oQKu2aUieNIHR5bn5cWAWfU8UG/AGXF+3XjUjYwu
         AgSA==
X-Forwarded-Encrypted: i=1; AKwUvBwlXdgCBzvyttg+8VElDtlzoG/QRfuA7/KYOtz7qLT5J2RRy7lcFhh5UKrm5yKawuMfOi3TzGRin55CpQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mfEX9555GXurUIWTJKHh8Khgk/DdZGOm4NkwlyD1p1vIuwWnRX
	W/qdfj9YWLV0k7Z2T3F+enBrZ7Af062OKE5Y7qEVtsMqfAKAbF/GWya2
X-Gm-Gg: AYBFou0+arpqL7rR667ckV8Q9jfxDix8W0NADcci5FRYkJtUtOH4a/iRuV8IAom7RTH
	Vwn96iid9uwxqb7g3MGrDYq06MKsHzb/MpfACGhZ1WRd4BumN6sOUKmIbTko+8VVeDlYbXMdIrs
	qwEbTr5LXbSIeNj4JeusN5RA91KnaPI1/AdZ4yz1JPkByUry09oP2iiBB1mOFPe0odP62G3M+Mo
	NUlMWHqyfh63VrL4R3UeMFnUT96RYY8OnNxFXDTAnWtZA0KgoiXxLAqrp5Ep0bMAGoZT1bEmzOt
	Irf/lsa+5W9ycv3C0EG1LR9SOtZ3e7aNyqmd7wmvxujK5L+7VH3Vx2iVZ18eF1L6XornqiUslkW
	pxC1wUkPJ5VFyx8RdjkXlUENzlPwyanmlLl03T3CJ5WapFWsbHmD6DclG/PypXn/5N7F9OYjrF7
	PG4/Y4QwkSZF9dF21x0JSzkxgu/3KK5D/QuFVOPdxb7mUMqU2iNWQcQoWvYZIswPKh4liR/Q16Q
	fEkyYE7mjrG05wqC3eLXC4Pce6OGqzKuoDpGCwHzVpR56C/lqjCWn8eAm0idTGeA8RGVBYDquzp
	yu8N5TfxvVxN0bRF
X-Received: by 2002:a17:90b:164f:b0:39d:b1bd:b384 with SMTP id 98e67ed59e1d1-39dec0b6344mr3180432a91.17.1789370980816;
        Mon, 14 Sep 2026 00:29:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:40 -0700 (PDT)
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
Subject: [PATCH v2 10/13] ASoC: mediatek: mt8189: Propagate MCLK errors
Date: Mon, 14 Sep 2026 14:28:39 +0700
Message-ID: <20260914072842.24420-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914072842.24420-1-phucduc.bui@gmail.com>
References: <20260914072842.24420-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_mclk_en_event() currently ignores errors returned by the MCK
enable and disable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 4826ee250d70..f20dbb410223 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -519,6 +519,7 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
 	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret = 0;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -529,17 +530,17 @@ static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		ret = mt8189_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		i2s_priv->mclk_rate = 0;
-		mt8189_mck_disable(afe, i2s_priv->mclk_id);
+		ret = mt8189_mck_disable(afe, i2s_priv->mclk_id);
 		break;
 	default:
 		break;
 	}
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
-- 
2.43.0

