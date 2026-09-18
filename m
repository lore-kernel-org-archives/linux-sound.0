Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2DA50B8C9
	for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 13:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738798; cv=none; b=TlUoSCCWoO+am0l/J9jEXyGiY2jafD+KBrGCmrg2+vaSK6L2j1NSKo5vGfflzvfOriiHhsvKja0SF/KRe1JlswL5CT7EVT2ttKNoau7pZDNrhMSf+bgKyKvQjawrWA1h80s/VaYBLFViYFuli1yF4Fvoo1jj5Y5homz/yg8DArg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738798; c=relaxed/simple;
	bh=OWrie+dV2E3Oh3XvLUGUdaBPRj738r+NfpSbomdwbk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oq0ixO6R5Mdpn3DduFoj2XKlPZ+OQWic1e3JxAq6ZT2j3NEZ5M0DzRvJIiFjxy2SxgmZTCbhbyfvIG/MkA6ZwmxB08QO8adtkcU4fqeMqbzVHrxQz5ZB2wJC34iBltNDGedwyUke2P8hwPEaZcmEI4lJO7hxFOiFFJ72Xev+pFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hILWV941; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hILWV941"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so742244a91.1
        for <linux-sound@vger.kernel.org>; Fri, 18 Sep 2026 06:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789738797; x=1790343597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZ46FG5TVo6218myQRpLPBR3Fij1s0mvVbflmMAQD4M=;
        b=hILWV941b4XeVj5vvysZJv+/JgiCoT1z1TFh33eO65+JA+zZXTk1/tSZNiIKO7GEzn
         dfegvcE8t0/X245xkI+cICpDDU7uNqOOfaOFUd3HJ8wFYiuICkmh8x/RGcjGfAuBIAmF
         Q0y/xGv3H0zLLPQjaMeiL23CFUNc8ybxRRTPkbiuBRsZ2FlEh3g8FU9h4BNOVUu2uDxB
         8SD9xCzdM62ubeDTYWNV1s2EI0mZfGzqnJHOeDeMEP/o74oqXT8kpkB5hWsOEouJt69l
         UIfUlGT1wv3SHhL59zVbdmHUEu68D7VFz7aliL43PocJdW55svzKbKhflheqzH1Q1wDH
         WpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789738797; x=1790343597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xZ46FG5TVo6218myQRpLPBR3Fij1s0mvVbflmMAQD4M=;
        b=fuPCfX1UrwOT0qx6axS7/H0BvC1vGmkBAuUNtnuOzlx2brbnXPTGR+ClPN3Q2MFoWU
         daRSnrhAs1DP7nUoSzwEYniVmwp6gw/dO1P3sPcIwbjN9chKg7Vm5qIhpUn9SPoDCvt/
         lsU0E4dalPUYxPj7/iLfFbqGYyPyQtJkDg9Lqxsp7tYqSni8an93k7CZ+FJkjkqxlyOM
         rY839cTUrtDK+eq1+cOs7rODB+rOMMIjMN5L+/OOePIq4g6xiLflzyO8AaaCJcBqbqAg
         8PWZfPktaejWKrXnPymM2xYu8/yLxm/AL1br/H9VUEgtsDo1J1tkRs8uHWdaJPYh3nx2
         Blxw==
X-Forwarded-Encrypted: i=1; AKwUvBxrTsh8zvVHWvyJHx9uwyBacHjfM/OH74eRNxIyg74p3fXIJUo1r/R3csXiFKTgMnEKMK3Hu52p+q/8QQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lf1NKJpy/4dMibk3weAh4huY4AdCoho3yniHKnfcPOjuUjNPRj
	DVVK4VQ7XP+0fDiRFnrgH+GEPLjysJ+eevD+aX8JG2+ncZGmSUlhVwCW
X-Gm-Gg: AYBFou2BAltZOl30Dl7fnU2sLHt3p+sX4koEQ82XUTvvyD9Y190mwgzDsYuwzcMyzuf
	RAc/x1NbzzMFdZ6KxFskuE6IeDCX0EzcBCCuCgn0WK3LJs5lCibx5UuLxoa3txyemPQ0c9gV/5C
	RnFwUXJtK3XcZGJW5NFDiVOCswoQ1XI5moEskz8rxd8tYQLCPj7gnyouQgNiFkmXNkdkBXMQNrj
	G1lFs5I2jJTfk6HbCTyCBFfqRUe+QKxtom7lOur37K5dLFifbmqo4HUQvVyzslN/cAOhgziSczo
	kWQtmnVCob+2/yEOCv5YWZZ3RtD7MMc37APMSBcGyhr4hopa66HK12iOAO0puCGcnm7TauvThSC
	L814Q701bdn1oiYNYqnVgAGuW7MmkEJ4P4/frO+qAbkDPUbJyce1bcvTxFNifN/5YYXF7q+blSp
	16uDdM2jmHN4p+R810DQdzyscMdW863HD9TzkgIHLSTtSjgHyckSHlnpkGR8GtfQDIfAIlQbzlD
	hYX+eFwNqGpCc+Z464Nos0oZ4IKpbJfx2G4MkR1qCd6DGml4y5LEWHGqCfUfbY783i88fpTlcer
	ELMO6Y9dyXMJvg==
X-Received: by 2002:a17:90b:2d44:b0:39d:8794:5564 with SMTP id 98e67ed59e1d1-39e54ce36fdmr6605508a91.12.1789738796691;
        Fri, 18 Sep 2026 06:39:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm13253792a91.9.2026.09.18.06.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:39:56 -0700 (PDT)
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
Subject: [PATCH 03/15] ASoC: mediatek: mt8192: fix error handling in APLL enable functions
Date: Fri, 18 Sep 2026 20:38:59 +0700
Message-ID: <20260918133912.133799-4-phucduc.bui@gmail.com>
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

If a clock operation fails in mt8192_apll1_enable() or apll2_enable(),
the functions return without checking the return value of mux settings or
unwinding previously enabled clocks and MUX configurations.

Fix this by checking the return value of apll1_mux_setting() and
apll2_mux_setting(), and adding proper unwind handling on failure.

Fixes: 125ab5d588b0 ("ASoC: mediatek: mt8192: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8192/mt8192-afe-clk.c | 32 ++++++++++++++++------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
index 7647bdd463d9..118dd4819682 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-clk.c
@@ -308,20 +308,22 @@ int mt8192_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL22M], ret);
-		goto EXIT;
+		goto err_disable_mux_setting;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL1_TUNER]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL1_TUNER], ret);
-		goto EXIT;
+		goto err_disable_apll22m;
 	}
 
 	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
@@ -332,7 +334,13 @@ int mt8192_apll1_enable(struct mtk_base_afe *afe)
 			   AFE_22M_ON_MASK_SFT,
 			   0x1 << AFE_22M_ON_SFT);
 
-EXIT:
+	return 0;
+
+err_disable_apll22m:
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+err_disable_mux_setting:
+	apll1_mux_setting(afe, false);
+
 	return ret;
 }
 
@@ -358,20 +366,22 @@ int mt8192_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL24M], ret);
-		goto EXIT;
+		goto err_disable_mux_setting;
 	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL2_TUNER]);
 	if (ret) {
 		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[CLK_APLL2_TUNER], ret);
-		goto EXIT;
+		goto err_disable_apll24m;
 	}
 
 	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
@@ -382,7 +392,13 @@ int mt8192_apll2_enable(struct mtk_base_afe *afe)
 			   AFE_24M_ON_MASK_SFT,
 			   0x1 << AFE_24M_ON_SFT);
 
-EXIT:
+	return 0;
+
+err_disable_apll24m:
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+err_disable_mux_setting:
+	apll2_mux_setting(afe, false);
+
 	return ret;
 }
 
-- 
2.43.0

