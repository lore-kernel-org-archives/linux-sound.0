Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E5C5111B7
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738809; cv=none; b=Tou96jHSBYSGw9twM4NwSB0yIJyUb42F0UKVgmws0LOn6DVhGt2L0U+F6lPTwDYHX6bCBPs0U8Q69vGF7FEVeyyYmQgt9UiujNNxqX4pyHZ2uir0wZq7gClUNO2mo3Exx9a7uj61HByUekZFeh9Oj6n+gPTrHCBkYte9GM3gUuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738809; c=relaxed/simple;
	bh=Ion7oeotHUPfHsC8ZZdaBN3kHybJSmfJXlAWCx23Dq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SjR69lfZKkt6ddwcIc9fYeRQQv4zMXTjkVDcpQOitlfsLsMKTWj3+VPrg4k0v+SDO7/4J8oyrjgSGvQ99SQ/nCFiz/BJ60KcFrGIRYTsNiXqBre14JAZuN376QAVs5CYtoFMsOOp5kVUdsl6bJZJWpkU/FEK9d/bAuaT7d0CZJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Izhkec9F; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Izhkec9F"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so569002a12.0
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738806; x=1790343606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppJ5fgau4uw0MPuW4ZdZtY3EQ3eIT2OOYRbyNQHq6DQ=;
        b=Izhkec9FKqkZ8qgWA4yX5Ff41xx1hrmTt3HfZw+bz9g902L6zBHe1g3vuPBrCtBBSd
         zCx9vVHNpFGQdfw89UtgsNUrHYNaHzMEGauIMBLEWWPULIqe7tKlmLU3Grr6U8SZNRjp
         F+DFefHwhUAqtotoWhZSxoR8/ktsx/jQq70UWn/YmS2qzY06h3SaYU1VuU22No7ehLFj
         bLWwn9dllengFS3nnQSZ2UUTSkOHf+Emcdn8q1gcvLgrAULkVPdu5NXnIviDiabhyF5G
         z2WaFKonnsg17qKWA3kRU2B83DJxySV2vv97X9rC46/SF5RbG49ZYI5XuTcUTxb+h51K
         V/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738806; x=1790343606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppJ5fgau4uw0MPuW4ZdZtY3EQ3eIT2OOYRbyNQHq6DQ=;
        b=ag7EivgF3zcQBfrsipDMlKYr8915yv8mznxxmAOu9LS0MkJXj3DR+dyW7pcohjkgWq
         h6Gy7NjkGWoQHo6VTU5x0a5NrU97cdC776meCVkuXj32khm42Teyx0zDrlZ45XjUdLkB
         iUSD4R7asJ88+Dm4Tj3X36CP1G8RIVM7s2yS9uClp9t9u/goRILHBRq4PtQ8dg+wIfBj
         GkBjnNtQsn7deHKv5clUDJJvKxq9wt487Eccm8++1+8cAVYkL+TixIMgJd6ZFO0tsLMV
         0XLY+QIaiuJ1puu79pmb1ww8KAsutIG/Q28lBxsEvMdpI/TfJoS+WhiwPpSeFkR1WyEP
         E+Hg==
X-Forwarded-Encrypted: i=1; AKwUvBw7a+FeLmTMXXkBVPQA6odIvYtxv7sQEkMd+HyTQnEVG+K0VSLroDCTbuUjWbixQsedkSa8cCutoKe7SA==@vger.kernel.org
X-Gm-Message-State: AFuF++mdAnAn9mptmoklnROsfGZ1xskyUiMJKlXjdm7re2NvZlMaFPtd
	tihPo4p8VXB4oDhkJ3Zq5ZqtIg25C653q73+ldng29xmJvWz4qww4m4r
X-Gm-Gg: AYBFou1TVAhUlS8BM10G2rOZYdS+opjJP4g1e41HqHdiAlyi97i7Hfu/VOds3IMqqjH
	vAlwqhvdZeCJ+vu7HAzn4mZ9z2fbMBKByVBpqIki8KovSlQDMuegOYTKi9Gu6K5JWb0L1nh4AlA
	WQAEP+X8gD278Jod+qFekYpZfC04I2l/k+x95tfUAMONqr2WbNkdaL53AihfI9pekQXKGjLrU9K
	yYB90umUNDduXUhnR97dAwuIxiyLkfDLu2bQLqqN2oUbffkhx+8U+BVFRjzdGXrrg6CaZi3Spmd
	8MEXJlCd+wL53tNCV0Mb0Lcgf9BsFCziprW26VUTuH5oK0+WeB4Vv9VHXoGWo4R3VYoK/JsMn8P
	/qEPyAHBwoUUrJpkqmgZunEsXA8lisxWnsEUoFdEEToOxOgE8Wb1YnNzBWsvdUHSGyzbf8NeZ3r
	qPWeN74rJ6JdryrlqT2FvRERUksCv+525j+GH8V/wWwtoMJX/jm6Af1J6kO5MC3ECqEfat/XiFc
	7c9iLP+ky5VBaLQVcHT/P270ciyDe66MIcN4cGZkL/1C47t7Wmo99gB34SSz8ZnQ1t2FA7InlYk
	Tp7mpEeAlhjw3w==
X-Received: by 2002:a17:90b:5281:b0:39e:4c7f:8b17 with SMTP id 98e67ed59e1d1-39e54cf8bc1mr6408347a91.28.1789738806339;
        Fri, 18 Sep 2026 06:40:06 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:40:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/15] ASoC: mediatek: mt8192: switch to devm_clk_get_optional()
Date: Fri, 18 Sep 2026 20:39:01 +0700
Message-ID: <20260918133912.133799-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918133912.133799-1-phucduc.bui@gmail.com>
References: <20260918133912.133799-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Switch from devm_clk_get() to devm_clk_get_optional() when requesting
clocks, as optional clocks automatically return NULL when not present
instead of requiring manual check and NULL assignment.

Additionally, handle clock errors properly using dev_err_probe() to
propagate error codes (such as -EPROBE_DEFER) on failure instead of
just printing a warning and continuing with NULL pointers.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 77f596cab92d..9b9a3465ddb5 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -672,13 +672,10 @@ int mt8192_init_clock(struct mtk_base_afe *afe)
 		return -ENOMEM;
 
 	for (i = 0; i < CLK_NUM; i++) {
-		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clk[i])) {
-			dev_warn(afe->dev, "%s devm_clk_get %s fail, ret %ld\n",
-				 __func__,
-				 aud_clks[i], PTR_ERR(afe_priv->clk[i]));
-			afe_priv->clk[i] = NULL;
-		}
+		afe_priv->clk[i] = devm_clk_get_optional(afe->dev, aud_clks[i]);
+		if (IS_ERR(afe_priv->clk[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clk[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 
 	afe_priv->apmixedsys = syscon_regmap_lookup_by_phandle(of_node,
-- 
2.43.0

