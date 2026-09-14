Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FD43E5EFA
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370978; cv=none; b=aJIti9QfWSgYANQx4FOzsNSGxF0Bv4vXLCIaS1lAe1tmZhncujC4Yx2Ol54lq6zEJyPXtLqwB+qEyDtX7pomk+P3qPKITj4bF7Xok/BZjS2PQEnrk+RM5n7UGO1i2L+MWGJUByRP5UxSSi/dccVl9JhR6wTPaLW6DkWwK28xTws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370978; c=relaxed/simple;
	bh=Wfj7ayzlWfEu+I8dT6gg9Qx37En8fvuHsBJbQGPJEIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c3HehRkBU3iz6DDyaBiPbm5Rqtnx5/WfZ7aCkV9oCacpdYowz65LiA6lwwBq6ca9B368+WIw6xVgXhhqrsS1/kQVFL1IBqe866D0VgIuT70220U9IabSsvvWQxYLvWX8VY1J0IURFqfRPc9/0v9zX5o1+j+8ogPiQKtxmlTgiQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJixNnUh; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJixNnUh"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1835467a91.0
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789370977; x=1789975777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=bJixNnUhQU9qsiIhlXMyzCCSczuXh/iQR+x6t6UZBagv7+bb00k6CCCVnk6mO7vuXL
         Da83jzK57wTJGycD1PYr07WeqY/LHSIPujGEDZK9meZYNNbYAeWjbK5IayCRoUiIs4c5
         P6gA26Bpp8Y82cNoJ4hqf9Xybi1dpc0zE5baur3fs3mLEBoxoKqpMwkjWjDwSdEVhj12
         Y5eu0NO6agQ4lBjgBJ3G3tFpItUQQkPvAAVODG500p2AgQxnZoA6hyqvhI2umOUj1p3s
         StiFWq2wvy3nGAI80xwh3rnaSfUx6e42H9/9nTDDRyLt/KTuRKuI1l9ER/a3doIqjU1Z
         3TKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370977; x=1789975777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qB6h8bEY4JQqTm9X+KYhPwqJjNuxDZMSiRPIGrpZWzc=;
        b=Dv9VBb53c82RWKpfGDbxdtT3J0YZwJbF2DeI/NcMAPig+6M1ehgV5CDQPS2rQK2YxB
         dMk9wj4SFBd1cVTbtk3X0TurSq4toI666q7CZlUvwYiTWyl4slPzxY1yTBgTgB/pmHSV
         P58FF79Y2/X1GD6G1VDSfYlRAAidiLymtvgSCjhW+jkzOOqNSIVX7s+TqcSyKj4c3mHU
         6n6HbTW7lGPen+3vnt9rztiM7b7DoP58EXG4h4M6NqgqeGwEIdPU5MtW4kPWygRhOlif
         Jajy9jPerI4PIg5O84ssNr29VLhjoNdERYNcMg31fymq+p2f/x5Qxz/EJ+Zp0gSk+2DH
         vQhg==
X-Forwarded-Encrypted: i=1; AKwUvBwFbxNrBHK9PmawTeIkooo1529qfjiGk/Wl4p46nG0SpPNe4ac1546bRYpL3QDdN4+j8PwZAfk59lxRRg==@vger.kernel.org
X-Gm-Message-State: AFuF++krCbBEurXsipiCDau+ZDA9Z8G2Tds0CBdVWPyjpm+rI/YpnY9z
	0rtHx18o+Y2EZImnteFfykMrHhvy14PN8WkgIAcI0u0WPosujB2zHL8D
X-Gm-Gg: AYBFou3XqdkD9LQeapOA39tvUhe0hfASWo4R7SihiL98be2TONTybvU9Px0McH80MIe
	6ZELiYZKPNilpzWHHZrDuICaKkolNB6kbbMPEeMgXV0O4vuPC7/QwVtZMBtIqZBQ/6RzX6HtJnH
	8j+0FUizeDVQPNrCGY90XghxOuus3+60rnSj4mSKduU9NJEtgBBAoB+hAkZzyX7WE6Vj0/QwbSx
	4usd99nhzvWQv82r/yoWjX/+Cp7l5FGgXYvBq/MVGWat8nrdWrBttrkp4Mz8RjFtTQRL+WT6NCO
	KgjSfdbfszXMHDRzj3FTiQyurGZM7Pp2M4+JrqsvMAB/gv42GaAfg4+gn4HoOgYQWHPQo7Og25O
	LSeFdreidyJD8wF2HDn6was/E799JFlOiVSbnIKZAQOuxJU2PfjdWjVQANd0iHRtYL7vymjWn8Q
	5tdaLN7XdueMcwJFgtuyXwzBxFJGIpcDZzOk83BiydLf7Lvukm43ZYk9zYyCOIw04jnEyD5Oz0y
	Hrwdr1thxjCh/D1PAhZ/7u56bseklnk3fnWwKa9BfBxHZwxKK+VOxRVcHZG754rcpINud6tgN7l
	/WTMIoKmT0byym0=
X-Received: by 2002:a17:90a:e188:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39dec05885emr3027132a91.12.1789370976645;
        Mon, 14 Sep 2026 00:29:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d957131f9sm19598245a91.12.2026.09.14.00.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:29:36 -0700 (PDT)
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
Subject: [PATCH v2 09/13] ASoC: mediatek: mt8189: Propagate APLL errors
Date: Mon, 14 Sep 2026 14:28:38 +0700
Message-ID: <20260914072842.24420-10-phucduc.bui@gmail.com>
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

mtk_apll_event() currently ignores errors returned by the APLL
enable functions.

Propagate these errors.

Fixes: 7eb153585598 ("ASoC: mediatek: mt8189: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8189/mt8189-dai-i2s.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
index 94c49a662e2d..4826ee250d70 100644
--- a/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
+++ b/sound/soc/mediatek/mt8189/mt8189-dai-i2s.c
@@ -485,6 +485,7 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	int ret;
 
 	dev_dbg(cmpnt->dev, "%s(), name %s, event 0x%x\n",
 		__func__, w->name, event);
@@ -492,9 +493,11 @@ static int mtk_apll_event(struct snd_soc_dapm_widget *w,
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-			mt8189_apll1_enable(afe);
+			ret = mt8189_apll1_enable(afe);
 		else
-			mt8189_apll2_enable(afe);
+			ret = mt8189_apll2_enable(afe);
+		if (ret)
+			return ret;
 		break;
 	case SND_SOC_DAPM_POST_PMD:
 		if (strcmp(w->name, APLL1_W_NAME) == 0)
-- 
2.43.0

