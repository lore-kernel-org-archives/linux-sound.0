Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B766D48F82B
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 12:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782645; cv=none; b=pT1k02lzC1HtNJQaDT6y94etKKqvmx7zYhfuH5AErbNkwlFiA4aBwreViXAmUeLEWy7kyohwzFZo7Tt5OcM9i2m/MN1pgwhW1GofxqEBQ9yUoXp38bsRFju/ubmU0hUBqkb+e8cHA1nM208N1+r0l0tVMp6T54KgIu/rhrfg1YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782645; c=relaxed/simple;
	bh=2EY1GVuSSGfTTe1sK5SCg2xB4sKJtnbKQcQZZe7wb/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TvwdARUqcFrIS+Of/85gV88+kCaZKmu+64c9QdiO0SOsVC+VS4I1B2MvjXryFIZHsuLs1Wm29D2aPbY4i13nQ6WrHE0d7VByNHhHKEpXbXWhd4U2DHFTSio/6EruHGbpiMhHkCs7+c+ABVu5qEuZ/J1rutKxwsSmJzfCRxC01Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gx4PuZbW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gx4PuZbW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d91ff7d9acso29016075ad.3
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 05:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782643; x=1789387443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5w7cNdqAAPAfRdm2XbkiqT/MAUxRyfM6lBKgPA3/pXM=;
        b=Gx4PuZbWTpV0MMEHHlXPOuAnSbfbrdy+QIHIVfydihUhTpraA6FXLxbLzjbaTRxvg5
         jUhWIH88iI2fZ6RHTUUHzAZFRavee6YVevhT29ACudbRuHVajnUKruYCU6C05eKLiGNB
         DCw5a6or0VDabce+MmOYcJ4jYU+zXt2cNdzlaoSVNl994BuoCIe2EGhp3kTnxsMp8vZ1
         7R0yiCtP0Uy7vrGeRQ187Bew6bu0l+tbReVhU/yitKT89DuKKtUgFrmHnhgo1DakWPaB
         fLaJr2hV940VIy+s8OjaD6K199/R0sg2HAqR0118b8T6kWV3crVLvzILJ17RPFy3QL6b
         4EhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782643; x=1789387443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5w7cNdqAAPAfRdm2XbkiqT/MAUxRyfM6lBKgPA3/pXM=;
        b=SI6cTXAphpYCMwSLarYNsbhrYf8hiS7bDXnkjlTwSNDlPbeBstQ2Gga7d233f/aL/K
         T7ohXL/JlGclkbKQ1vWqPDknisQFwwb0Azcx7NXPFRUnoTN42ez1eXn+XY6BYiHJlwE5
         /EX1sPKaqCuDhrJqWadZ8HuXX6Cs7PwAa2j03P4ThIw0duEfd23sJPRMFrCaisJwx5uR
         AHf/8GdmyMa5qbm1CnAFSN2ZjcVqbCgGwieNFs+n+6CtMqawDANoNqQkE4DCZzY1nqCo
         oK7wbp697EA2k8xZK22IWB7S1GrDJPC1R5VKbzhdVRVZmGQ6uYT10Sd5pYihrM4kbbqT
         ZnsA==
X-Forwarded-Encrypted: i=1; AKwUvBz5xXtYZjgApLhlaDDggDdgvrVsJjzpY6GQeTlUq6DGOoy3XmgELkfoFKeO9VJXSSsG2PeTMKOIRaEjuA==@vger.kernel.org
X-Gm-Message-State: AFuF++njvhdI+s2kGx7TSb+oSMvYr6syvcM2UT3KnFJCVzKcTP+VCFRX
	nS/PEnnm7a9c1yqTIM9pOEQVcwU4OAHIFSSYz8bHEfdWjNl2fxrtu1TUx/Vacg==
X-Gm-Gg: AYBFou3P1rT2FRyKq8Ia3dRuCcQQn3eT9wfQC+jHC26IlS0KkMUnYDGdOOcS94PKWrd
	SmCygei02kNazRLSelJfAX9S0yltIt2sMANbnB3AUEa/sCLEFGfwUe/3571bwsG34K4FezRzUIe
	doFuNKyzckPWIcxyHEYfM4m0krFfcDS0H6VpZHSoNcWk6FO4Hcfxa0XgrxgNbZfJIOLnYj0J2ZX
	kkQasw8S0TFGYRRf076m61D4Tl4Fh8JjQXXvUZH7Aa3I81k2EJ+TEcOxIUmu1DhJjq3sNnjawLB
	8Qnp70yZUXvXcJofqZu0fcEjAg01CGoRYOXz74My0iBirgL0XcxVWqh8FgjJ2vSK5TcG5Yv8yic
	gSrgILwvdr5JAuePlEXUVXneseFHL56CjosV4YJd+v9KIDz4yI5Xgz/A1uqnZj9RD1rm1uPyTES
	4UcF4XQKg8l+r5W4IBuK2HwjB6v5GKaAWLLLmSx+b4UDNtFNoZSNYAWw1Lq1xuZ9rewsG5M7+WB
	6tJFo/GKohWZTHCiIcnjSrN7zYA2dTwxakW6tROFImD+k2u3Kvt77/+4OzAnRGRwzWWUIdzLGok
	JBpp
X-Received: by 2002:a17:903:1a4e:b0:2db:39da:90f4 with SMTP id d9443c01a7336-2db39da9336mr157104885ad.6.1788782642761;
        Mon, 07 Sep 2026 05:04:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae85eesm43064815ad.82.2026.09.07.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kees Cook <kees@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/7] ASoC: mediatek: mt8188: mt8188-afe-pcm: Handle runtime resume errors
Date: Mon,  7 Sep 2026 19:03:08 +0700
Message-ID: <20260907120310.135693-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907120310.135693-1-phucduc.bui@gmail.com>
References: <20260907120310.135693-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Errors from clock enable and regcache synchronization are currently
ignored during runtime resume.
Check the return values from mt8188_afe_enable_reg_rw_clk(),
regcache_sync(), and mt8188_afe_enable_main_clock(), and abort the
runtime resume if any of them fails.
On failure, disable the previously enabled reg_rw clocks and restore
the regmap to cache-only mode.

Fixes: bf106bf09376 ("ASoC: mediatek: mt8188: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 7b1f5d05f4d6..f8cbe7bac36d 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -3030,22 +3030,33 @@ static int mt8188_afe_runtime_resume(struct device *dev)
 	struct mtk_base_afe *afe = dev_get_drvdata(dev);
 	struct mt8188_afe_private *afe_priv = afe->platform_priv;
 	struct arm_smccc_res res;
+	int ret;
 
 	arm_smccc_smc(MTK_SIP_AUDIO_CONTROL,
 		      MTK_AUDIO_SMC_OP_DOMAIN_SIDEBANDS,
 		      0, 0, 0, 0, 0, 0, &res);
 
-	mt8188_afe_enable_reg_rw_clk(afe);
+	ret = mt8188_afe_enable_reg_rw_clk(afe);
+	if (ret)
+		return ret;
 
 	if (!afe->regmap || afe_priv->pm_runtime_bypass_reg_ctl)
-		goto skip_regmap;
+		return 0;
 
 	regcache_cache_only(afe->regmap, false);
-	regcache_sync(afe->regmap);
+	ret = regcache_sync(afe->regmap);
+	if (ret)
+		goto err;
+
+	ret = mt8188_afe_enable_main_clock(afe);
+	if (ret)
+		goto err;
 
-	mt8188_afe_enable_main_clock(afe);
-skip_regmap:
 	return 0;
+err:
+	mt8188_afe_disable_reg_rw_clk(afe);
+	regcache_cache_only(afe->regmap, true);
+	return ret;
 }
 
 static int init_memif_priv_data(struct mtk_base_afe *afe)
-- 
2.43.0

