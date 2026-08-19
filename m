Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D3642903B
	for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 10:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134677; cv=none; b=eYPLsoLEZHuTyBabVGw7SA1reqtZXpYAmnmYF1B9W/ikBNJeH77BH52+qSZ2+SVRRY0eO8+9cArOidM8JeMsfv8bsMD/EikINGCtAOwrWgQTs1tDWv1xtcA9TznJcrgIW5NHs9rDTucsmfnLZdqJTRVbwTV5b3L9oXNHzh9WLlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134677; c=relaxed/simple;
	bh=6q2VCmp59wx4RbEU5Nr2z8JZDX/7Mxvtm/ZWyugcxIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J0C2eZFiqFXyezArQQdU0gVNmrDMoZl3oKwIaBDlRMCG20qJg1Ew80s4+PaMnh0WeDSXmMY++6i1rQKKgHdrKKfZDuHi3jbWPkSsZy661QVQoHg/pQqgwNo96DIAI7/25strIjqlAX7leC8ROsxwd0z3xt2UfVBY3h0M4Je+QcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AigN2PlI; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AigN2PlI"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so1351408a91.1
        for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 03:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134675; x=1787739475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=;
        b=AigN2PlI6Giq1e3V/eHRWKbaG+6vpeFCM2cy72tqglHui2LZgpMdbwnn1my+mJg+Ib
         h68H7uGCVYuotVHQm4ZUS2p0HHgIDQ9T19ePEHgjgP6KHGCNXne+oz4tbyWc7GYxk/Q5
         +Uc9uLAQvisff00THC3bLXmQ5GBFVc2B7n+XNyUa97XoF9HnvkRti6GMWJ1T8Ku+CVPB
         bRjXcqDCdbvcB6Wzt+0DZL9V+O1KAQBK0uiYQ98itIZBCT6TAXs5V9QGQoIYYX/a6cDf
         1Ik+m2sfBHgoKjfqPMDg46Lu+OZRF9vRziDZDZ5ERJVe0ytuC4evtBKeP5/cyrkdA10Z
         BwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134675; x=1787739475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/xNynUBdZ1hKic7P/IiQFiODLJooKh+/AvfbqzXkgn4=;
        b=OH8CXJ5gr+Zu3nM+6xBeAd3aRCVood8dMz8+nsyEzdXac7qbKY7bYsy4oSyIJXGDUG
         SACjN+SoqMMzPdJlgjvk1WU9jDznEgDd+DbRNBp6WHdQlt2fMGeOtKy0sEeZMi6/32dl
         qtsjqH7RnTdKwYAi5Vrxq1ZTK93+bbn3DQQluPacYzsLh0EpF4SxHXLxOAGIfcv85ITA
         KRtYFvVK6hZKQfNezSIb+4G7pd6HMXvHpHFszPS1DS0CeyaDHVLc0bA7dXbgty/bLvCT
         Bt/fLNMODgxNkMit+TlsQvw4Sx5aPk7+s/ockF2hwxp5HF6yFnbCLUbc0WEwq2ppb4Zj
         HvCg==
X-Forwarded-Encrypted: i=1; AHgh+Ro0cADLLL1QlbT12iXNVuCCt+E2SmnZwx92oFXOUZZhp+jVP5fPgiviFGkf1WI46O/b1xC1Tg0EK22siA==@vger.kernel.org
X-Gm-Message-State: AFuF++mAPxtT7q7LwbOFe5eRM1Wzc+WmGaRZyHlwkWz3HxLwTH4mQgx9
	2UfzBO5y+6YP3I8akEiKIvKFDq7SnENTtsdOPTnye2bGsSl35DFHc7M1
X-Gm-Gg: AR+sD12A568+cqhfFvPTfhbl+aVeG6XPhRZyKi5+wyKazqgqhL4E4LWS8BP8UV0gX23
	2n3Y5/3u0ot/npnyATJF94TrVfvnhLqonRTHyVETRksYjLYXkdYLzKtFyBe/Wa0NABMi229PXUR
	cW0uXsWZmsNQ9RP1DwiukvUz/7SLcmdyEZDZfFJZ4dLHP53PzRbYg+pt4S8tyufQQ/XmB87SgnT
	Ac13Afy30dtkGeOOxORUeC+/xsa93inglnoK3zm7sLqF7QwnRORr35vOAdmBfDGEOPHzJIivXY9
	dxUgJkV131RpYHkQ0GDm160pgE3Mde1l+058mMASe9Qts6nmKGfhCbxMirTzTqvwqR95glPFcia
	o9eL86jIMSgR1MS47b2yCjDDkeauXE1WuGup+JrtWsDhNfwLlFoTvI4qCrPliU7Zbk9Z9irAxIs
	M1lCIWLWRqNc7EBRkfD/d5LmctBL7eyzyNbJEVccajxMYASzgWQV3qrOPMffF/7hXLpaK9X9jxk
	aR0fnPqltT8X6Rs0o4uYThtY/+VeeE6jVNfnmLyUZCyzAQETxyTOP7JBoHmkDWABb3xqZG1h9zL
	V2HZ
X-Received: by 2002:a17:90b:4ac9:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-395810cad6amr6268601a91.14.1787134675189;
        Wed, 19 Aug 2026 03:17:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb60a2bsm2222374a91.17.2026.08.19.03.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:17:54 -0700 (PDT)
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
Subject: [PATCH v2 1/3] ASoC: mediatek: mt6797: fix wrong unwind order and error code in enable_clock
Date: Wed, 19 Aug 2026 17:17:34 +0700
Message-ID: <20260819101736.67632-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The error paths in mt6797_afe_enable_clock() use incorrect goto labels,
causing clocks that failed to enable to be disabled during cleanup.

Fix the goto labels to only unwind clocks that were successfully
enabled, and return the actual error code.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt6797/mt6797-afe-clk.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
index 6f3e6acfcfab..0ac04d73b777 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-clk.c
@@ -63,21 +63,21 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD], ret);
-		goto CLK_INFRA_SYS_AUDIO_ERR;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_INFRA_SYS_AUD_26M]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_INFRA_SYS_AUD_26M], ret);
-		goto CLK_INFRA_SYS_AUD_26M_ERR;
+		goto CLK_INFRA_SYS_AUDIO_ERR;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_TOP_MUX_AUD]);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD], ret);
-		goto CLK_MUX_AUDIO_ERR;
+		goto CLK_INFRA_SYS_AUD_26M_ERR;
 	}
 
 	ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD],
@@ -93,13 +93,11 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_TOP_MUX_AUD_BUS], ret);
-		goto CLK_MUX_AUDIO_INTBUS_ERR;
+		goto CLK_MUX_AUDIO_ERR;
 	}
 
-	return ret;
+	return 0;
 
-CLK_MUX_AUDIO_INTBUS_ERR:
-	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_BUS]);
 CLK_MUX_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD]);
 CLK_INFRA_SYS_AUD_26M_ERR:
@@ -107,7 +105,7 @@ int mt6797_afe_enable_clock(struct mtk_base_afe *afe)
 CLK_INFRA_SYS_AUDIO_ERR:
 	clk_disable_unprepare(afe_priv->clk[CLK_INFRA_SYS_AUD]);
 
-	return 0;
+	return ret;
 }
 
 int mt6797_afe_disable_clock(struct mtk_base_afe *afe)
-- 
2.43.0

