Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C62F37A856
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 04:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411176; cv=none; b=pJA/kAzp5q2oG+gHM54Xrzs9Rhj+Rfh8G7hBMnj20VYkbHV59+qiDC8Czsp3xnoEVjI0vpfNZ8RVuw0gqoSLXKvmpAgUI5R5XThHzE7jglc2TJ3bU1MNPi9Gzp/ZnGxUrfdIWaOywD5Mc0gZ/rUGy8nbLHFl+zJemJw5O6WFHqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411176; c=relaxed/simple;
	bh=HMjTaFNf++XBhM+sgnYCzvPtzS89AMLTDJUPnErkVb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GgyVIafxDy2gjO4hYZkqOOr3QJ3uOMIiC6sZ0l/fO/z2ZcyjWil3DJi5NnyTwOr5lkrFQUZ/rcb07JthAPlwgGq62L3Xtehww3619PtPxV3ie3lm9wK/D1+ZFpFV9hG8211BUSDZli/U0PC6epnLtRdaJrWSeI7MaUf9zFTUako=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSKY/KPZ; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSKY/KPZ"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so2092110a12.2
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 21:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788411174; x=1789015974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/QLhY24jUWuW0UFPT8wZxIclDsrKF9CvBHKSfEU+hkw=;
        b=VSKY/KPZluXLISft5GI5rtLi0X5DuGl+guzpDZh7I2Cljk75LTqpS5mp9AuGTSnFv4
         iUwaXn3K4uf9zjWln1cqwBcCbUAzhryejWl+seFc0qLjw1uQwNfonnj+L6q7sIFl6+KO
         j5in9+XpcmznrUE+eR9h6gdX6xJ8hkbjAYG6thTexalQAsDfffRnZUaDEHzN9+mKva5k
         MO6yIKsvcCr+LO59z/weNrjZr5v8kL6QNm0WkOLtAg8Az04+OkVwCkcv0if73POWRe1L
         wYvgssHLJvropg2wsn5MQdGOh4ZEX47o6VKXnSf4eGfjKtnguwPTng+OATWPsfBhf+rw
         PocA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788411174; x=1789015974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/QLhY24jUWuW0UFPT8wZxIclDsrKF9CvBHKSfEU+hkw=;
        b=I39h5yROP6ig3+BibGB/ShKZl0Rgpxtl9WiikQgIXPV8V4QWAYX6lBU/Brym75rpTR
         kwqRXykppQlfccoQqOipKAwFP6hjtH3OJWkZ6LUMKKevVpBHooiwJXq9AMAq1Hmwe2nn
         Q4BeXIhwaIoGyOTnjM3Vb2zrfwVqBErD1s/CwM3xN1Q6MkVH6H4DL6vaQEWtuN8uQvrG
         B/Wc+nCpyRiQPthum3jxAiiRkYa9NLp/OoGxkwFRb/MEstmncYKArD8zbLDQye9sWKhh
         87KGmbWk2zW9njqnp09RailQ29GlbuwJcUnneDW5GuRpdoGSJEbrQ4rQtY9ERWXj+YPZ
         wKNg==
X-Forwarded-Encrypted: i=1; AKwUvBz0UuzLDaSW7ykzigf2ceMOBWZVSgYn63xCzMTf27m6TXPmqfVjYxVVHtd1MZgQ83VZ+EO+lWF7czKw3A==@vger.kernel.org
X-Gm-Message-State: AFuF++mqHAj51/dOXwMMaiFrtQBtYdYMoW8ntI+7vuup7ux/GacegIea
	l7a7VE83pNzqya47QYRun9omz6hH9DqgDb3cJXeIL1sAHZkCJZeefEH9
X-Gm-Gg: AYBFou3Iu3oM5j1SLPHG1K+MQsNjpFYgYK7EvsyMnKQfvx3SRHKPw0R9hj0ts9Dh+vX
	uSZPxWpr1zIF4bG8/sMsD3XRfyDwU2K+b7Ap6I8Uv0RyeUVbxVsIGRtsWqrKmEJnpq9kKijM5dM
	pBU+mHi3S1ebKbqggIx5xIPPw0ZPktUZm7kSSRBJSLdFUDyP2kWlbvEx2Ers1oFsgj+0QXSPnmy
	BXVpthTMpwyM2zFpStc1YezWmlG2uBIQS/J2vAeGUkgj/XXRzyof5A/icTxousbp0SRCeGppDMt
	zeQz6x3dqsxwjR3sRtv1Zoaer+qC23eSxcaOuGUWTDqWINkVJN8Hs6WU4Ov/afkZIsWwUvPj1A8
	RmciKZK9T52Q8pmJPtRFZSj9xNHx3z46/Y/GmSCBUNGi8wzouhfia07sYdtaTka4vT9S6L1nC/o
	sM5VWLXJV4QNf0nmz3bzWIRyN9mW3gRjmJxuUKqv1pWOuOKA9v60jprOQQKI8c7bUT+VkKiFmiX
	LXtBCBOu6gQGu09SRaSQD7fTcXF3Zw0/r8d04sHqKZvdpeRSg7+jnV0hyjmrwNu5+EtF64hlCcp
	1Z4f
X-Received: by 2002:a17:90b:3ec5:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-39aee172d61mr14055157a91.14.1788411174299;
        Wed, 02 Sep 2026 21:52:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d7e8sm2747538a91.16.2026.09.02.21.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 21:52:54 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Shunli Wang <shunli.wang@mediatek.com>,
	cassiogabrielcontato@gmail.com,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 2/5] ASoC: mediatek: mt8183: Fix clock handling in mux disable path
Date: Thu,  3 Sep 2026 11:52:00 +0700
Message-ID: <20260903045203.175337-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903045203.175337-1-phucduc.bui@gmail.com>
References: <20260903045203.175337-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

In the disable path of the appl*_mux_setting() functions,
clk_disable_unprepare() is called after clk_set_parent().
If clk_set_parent() fails, clk_disable_unprepare() is skipped,
potentially leaving one of the clocks enabled.

Remove the goto exit paths so that all teardown steps are attempted
and any errors are only reported.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - In the mux disable path, remove the goto labels so that all teardown
   steps are attempted and any errors are only reported.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 6ab0734ad136..dd1a5925af96 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -271,7 +271,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
 
@@ -281,7 +280,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 	}
@@ -298,7 +296,6 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		       afe_priv->clk[CLK_CLK26M]);
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 ERR_ENABLE_CLK_TOP_MUX_AUD_1:
-EXIT:
 	return ret;
 }
 
@@ -345,7 +342,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
 
@@ -355,7 +351,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 	}
@@ -372,7 +367,6 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		       afe_priv->clk[CLK_CLK26M]);
 	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 ERR_ENABLE_CLK_TOP_MUX_AUD_2:
-EXIT:
 	return ret;
 }
 
-- 
2.43.0

