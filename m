Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC8F389E1A
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 05:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789534850; cv=none; b=qY26z4ZbYgSWeU+4f5cUV8uMX8CWt6eEo+G9Wgevgn5qDtJVDsaWvxI89tNrJWwX17yvcmRLHuGowi7aAmlmpgZ/UdjHUjhfSa58zwEMAYJBShHIlgV7vynFmM4RZlCZFnjRXenqZQHEqiqNTM6xvm+thFidumeVUAbwSB1WZSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789534850; c=relaxed/simple;
	bh=xflv8IXogpKHOiX9yYBSteBDb/dchvBi49QGMB3YIgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUtj8NHgcIXqmtBhk76WGTW7sYUaFsqH83qFxKGZXVNFoxuVhmQZ6uxgQAvp7snoVGlZHJ/IPJsTAvrn4iFNcn+5OhmA8KjjCYSIWIThx5Dr+VY0uKVZbJzXJcStk1UXkeXc4loS5Q7MJtSBqcPQVGtcSqiqfJdK4cQlakpCrQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hXXlMkSe; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hXXlMkSe"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-86b90133ae8so345742b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 22:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789534848; x=1790139648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B/w0mflA4CW2wen443DfpVvqyUW44q6NA3gxSFkvPnM=;
        b=hXXlMkSeqNjqzdA64Mo90qwuIGZo7TQKMtSI/CzP79oMzWvY/uhz3C/1+kr1KljuNy
         qzsi9FquOQ3dJSZruccb5/ftRxDzDNIZPVv/jp9nBdBs6t7bvNCLQt52OTH2RAEIkCM0
         C8JZ9z2mkOdmMiqOQQIIT8Lekeh/yHfGEgbr3N18D3mSLqkMg4bUD3aI4o9VZBSs9yuF
         61xq8OwJNYOJKUx00zXGk4Cg1ktKem7X+11g4qZG8wWCEmOYNqAuybhT3Uov5Es46wr0
         ZbjMrdcDX8+4VXeiY4mgW+4K1xnYpRzrUwzMyolQFPqWIm4nn8NGVBFweytWyS8YqQFl
         S3kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789534848; x=1790139648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B/w0mflA4CW2wen443DfpVvqyUW44q6NA3gxSFkvPnM=;
        b=kdTIP161K+z6UUofEKlU0xMuEq8DrxEmK64W14UHu3+pCMQqZla1k4VfuDLwyKwQcY
         3oodt2aHL71UvR89mVY1XQxHV1GH6VpsVwLTLog/xyMc8GKv53OvOheotASMBLlglAUf
         n1mt3Mu9BA+AhR4Aa/cpoB0FRWy09pEIKScT8B2wj47KBMg4gfesKmOPl7E28WBeOAn/
         lcDQi9YRbt3mGDySXyrsiAq/2kn4qhxL+mEjwvX8a91BQMYXfxQaQ6MfxzQojQbx1vcx
         ZtKc/3NVJ/6K4mpkAGFC0I5lHHKQ4DiE293lt3d4uhK648lPAAyDt67i8RiXTmIgOy9Z
         Z0PQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQd6r/QDcKUUG3bdiqbYdE1y4WJbWIJEcy2fUQAQI139MdXy9WETzQveGljIXibVkFWDcgiTWslrR9sg==@vger.kernel.org
X-Gm-Message-State: AFuF++m8NjCnmjdL63bdeMnGK2kKxjYw4T0Cd4nZwyOvK7GseazwR+ZP
	2h+tRS6z61u9l5uCHtdFZ7Zzdl2z3UrvMailAc8Q9uaxXSkkWt1up51O
X-Gm-Gg: AYBFou1HN4BIW7Em+HQbGOWF/1PfdYSDYMyXfKUxAqdtFYtwOtNB3CICi71l/WBLmKl
	j4JfWHzadH0hO8xA7zmKKXnrjWjfJ0r/u3z8te4ExXbRgyVM9hpG4ZC2iJalVgEz0KX/BJIUkUS
	pDrrGk8cf3sYcQ1kC4g/8g1twJpCftv3mOofaSrPF/8dYJYfnB1cECBelX8Hkyzs3SewxGDm6gZ
	heNbH0aKO9+EnCcXTY4hQOCFTy67sRXte0w0EhwWUE6DLAYugAG52t77EkFIdxo7daSjRr0aPF/
	u1PGLJL7cBaTIcNtnU615Su78Zwj7jYlyIy28hDhDF5FJRvdymX5vwnIfqOhBuoG4OtxPeOLgEX
	C48adqa/Js4HAZAr6v2G0xifR6BXj+F0Urq+RxzmYp55fkV+gE60uBL17ZSj9hnyoDVwT26OlCm
	yGTomNqk6huDuossC8ONVf/Etzf7HGmowgKJ6dF6Iqlb7jOl3pU2j4lu9XMf4f835wc+69h2Kb4
	j4F7XA2vubvKJy7aJfehKuFySefA5tZ/fgmyvTLHshRuZef4lj4sfpgEGfdKQ3871oUNKo+Bpj3
	uzeok4NI8/hIPhk=
X-Received: by 2002:a05:6a00:4185:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-87236ce44a9mr2291018b3a.9.1789534848308;
        Tue, 15 Sep 2026 22:00:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50abb1776sm850589a12.27.2026.09.15.22.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:00:47 -0700 (PDT)
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
Subject: [PATCH v3 02/12] ASoC: mediatek: mt8189: Propagate MCK enable errors
Date: Wed, 16 Sep 2026 12:00:09 +0700
Message-ID: <20260916050020.14575-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916050020.14575-1-phucduc.bui@gmail.com>
References: <20260916050020.14575-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mt8189_mck_enable() currently returns without restoring the clock
state when setting the clock parent, enabling the divider, or setting
the divider rate fails.

Propagate the error and disable clocks enabled by the function.

Fixes: dc637ffeed6c ("ASoC: mediatek: mt8189: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Update the names of the goto labels.

 sound/soc/mediatek/mt8189/mt8189-afe-clk.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
index f088ccf80448..56362c4756c9 100644
--- a/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
+++ b/sound/soc/mediatek/mt8189/mt8189-afe-clk.c
@@ -639,7 +639,7 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		ret = mt8189_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
 						afe_priv->clk[apll_clk_id]);
 		if (ret)
-			return ret;
+			goto err_disable_m_sel_clk;
 	}
 
 	/* enable div, set rate */
@@ -650,13 +650,21 @@ int mt8189_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 
 	ret = mt8189_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
 	if (ret)
-		return ret;
+		goto err_disable_m_sel_clk;
 
 	ret = mt8189_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
 	if (ret)
-		return ret;
+		goto err_disable_div_clk;
 
 	return 0;
+
+err_disable_div_clk:
+	mt8189_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+err_disable_m_sel_clk:
+	if (m_sel_id >= 0)
+		mt8189_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return ret;
 }
 
 int mt8189_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0

