Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9D93F411E
	for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 10:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781086874; cv=none; b=ksqxk4n9EJbrrDbO6BPvWI7N+ZrwlR7mwgLbNf/TLaYtU3kdJ2oiI0743eSk0GzMoSJupQvagg8YWOgvgZQhESD4dQr+gyhJzRtxvdHLk7qKh6O0G29ZHZrOIBdzctoUEh1s1Y4f8LmsTgI6ill53/tE2YDo3ntkH1ltvgrFZgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781086874; c=relaxed/simple;
	bh=ZJSPxscY9lLUpmbtR0ec8kz1X89O9gyj0lt0NCvJYpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iFvsVvwntR7wlOpvgo7p6IWLzzYWlNzj3a0Gj0A+gaz8M8NvcHgNzCiihWKpoNg+RcSrwHM72wDFjUVArABeonp5Ml0Lc47Zu4hpQvR94zZKMuHHGACx6LjJJzQDE4unGRRxHvqgRclDCeLTB/Y5SVChqBJNIs4GHge3TyQJVys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3PgyQrH; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3PgyQrH"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0bd02d97eso73391015ad.2
        for <linux-sound@vger.kernel.org>; Wed, 10 Jun 2026 03:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781086870; x=1781691670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KXVJClFlTnZc58L4TC2N3jn2K6slmmQnCORLu4klL7Y=;
        b=N3PgyQrH0ExfyN0Gbm3RPjfYhU9ZAb4fcsonmpa4pm9jy640WAdlnW4qkrl2IbjWUq
         DMA2enJqcBv6tv2yuc+OP0lfsYcNv7trZ+VYVaBLiv2wv/uaB73n+6H3M9c/NDg3amov
         VY3WKY7kfI90kKPuqGoe6p28IyZdHXFC2fj9VGQ9S7Qn9b/8mnpwPIgFhaQDV0U9Nf5T
         xhTeyM/ztIWSDGv6aWYftPmi9ybq3nCynEPlIBoMF3S4/Fy+0hsfKe2b96JvGry1FEx5
         whPqp6F+XjeXad9rbcSpAffgJTGsH0fwEsgdIGvrgbH3pKwQPEH0eO0G7XczNmsWGj5j
         27pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781086870; x=1781691670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXVJClFlTnZc58L4TC2N3jn2K6slmmQnCORLu4klL7Y=;
        b=pI3RH5nQF63uTWb/ZgB4KpmRhPJfYAEldArq8GO/EJv4QXsfmkYQHB9E/6zc6fVwKF
         g/Ns2VM2M7MKdFaVs4Uwm45U1SolAjoxWDJUcrDJHUQ/umvF0uAVD1+P4l2KyTnryRwZ
         5BQkwMfVeGTKmqeUQ+vyGI0kDSZQCW/BQrzuWS2CMPSLBZ2f5srgycQg7oF77VkepmLW
         E+HvsT9bblyOUDLfgHqhnAT+k4lMZAiYYZEbdzT9KlahuBbfZW9L8YmAJz58Yx86WsfP
         HCFPBvYZTdBWPpeTztm/N5SwG/cahKF2lXMBE9va0MuvWO3uzt76TNzDXO6A/FaNq8Zs
         Oosw==
X-Forwarded-Encrypted: i=1; AFNElJ/uhjHOv1eoFsD8V+WBqbd/vyA9+0IzgjBuNaYjlyklrgV/mCTF5Hqnjf0dMgUkrOaOBwCQq3SaHMKsjg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhg4UDsiK1eYTHbNzzX9d979aqqE49nU0TKQizD7I2SrAPlOwb
	Iggceerk/k5vreARrgS2NgVpgjoyr4hyh8mmcblbdu/U9SSF68G3ic5p
X-Gm-Gg: Acq92OGg2PpwrzZqKTwOQ+rFLzaBOUKLgoSOxXfCJIdNEgWq0MpIWrpGK/M0/zKhjWH
	XB6z0sq+QV2umLoYOeOcgWcDWuLkL5p9b7PvDHSd80mzEuLpc5dgNL6vio3CJEFb+1QZhwWNCQy
	WAV3E3ekWiHiGRQ9Oai659D81t2YDP5akVUb4bMJN95gd38lBlPTUeY4CbeiY2vSmgG2Oo2rS5w
	IT0wos4p/a8wjZseJiDQnke/7ATt0zMNEuZ9i9ApxSfYdkRK7SWDRv0O26E4c5++UZpyxHBhKeL
	sGsXRu3TUl89hvMPM+xwAcY0F1B+NfqbKE62W6UFtd+jcoy7UFcpxlQRS3++Y4yX8/bq4KSGtD3
	CV4W9UIvTLNk5nupq4ewFS/7I4XAN/xUFNJxIo8FTRFcBQlhzQ2Fhso/HX6Rx/vSp3NYt6BK0Ea
	XYUlgCBsbiH3t7RVi5FG+WDBj88JnqsgSr+OSF+Ljf2Etwoywhq/y9rMi4jNveStK857kc
X-Received: by 2002:a17:903:b0b:b0:2c2:1e6c:450f with SMTP id d9443c01a7336-2c21e6c46c8mr212600175ad.10.1781086870419;
        Wed, 10 Jun 2026 03:21:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f96b3fsm250133875ad.29.2026.06.10.03.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 03:21:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/10] ASoC: mediatek: mt8195: mt8195-dai-etdm: Use guard() for spin locks
Date: Wed, 10 Jun 2026 17:20:18 +0700
Message-ID: <20260610102021.83273-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 5dcc8ed26e00..1a20adb2cbf5 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1318,24 +1318,22 @@ static int mt8195_afe_enable_etdm(struct mtk_base_afe *afe, int dai_id)
 	struct etdm_con_reg etdm_reg;
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
-	unsigned long flags;
 
 	if (!mt8195_afe_etdm_is_valid(dai_id))
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai_id];
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 	etdm_data->en_ref_cnt++;
 	if (etdm_data->en_ref_cnt == 1) {
 		ret = get_etdm_reg(dai_id, &etdm_reg);
 		if (ret < 0)
-			goto out;
+			return ret;
 
 		regmap_update_bits(afe->regmap, etdm_reg.con0,
 				   ETDM_CON0_EN, ETDM_CON0_EN);
 	}
-out:
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
 	return ret;
 }
 
@@ -1345,26 +1343,24 @@ static int mt8195_afe_disable_etdm(struct mtk_base_afe *afe, int dai_id)
 	struct etdm_con_reg etdm_reg;
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_etdm_priv *etdm_data;
-	unsigned long flags;
 
 	if (!mt8195_afe_etdm_is_valid(dai_id))
 		return -EINVAL;
 
 	etdm_data = afe_priv->dai_priv[dai_id];
-	spin_lock_irqsave(&afe_priv->afe_ctrl_lock, flags);
+	guard(spinlock_irqsave)(&afe_priv->afe_ctrl_lock);
 	if (etdm_data->en_ref_cnt > 0) {
 		etdm_data->en_ref_cnt--;
 		if (etdm_data->en_ref_cnt == 0) {
 			ret = get_etdm_reg(dai_id, &etdm_reg);
 			if (ret < 0)
-				goto out;
+				return ret;
 
 			regmap_update_bits(afe->regmap, etdm_reg.con0,
 					   ETDM_CON0_EN, 0);
 		}
 	}
-out:
-	spin_unlock_irqrestore(&afe_priv->afe_ctrl_lock, flags);
+
 	return ret;
 }
 
-- 
2.43.0

