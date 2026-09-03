Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82562384CEA
	for <linux-sound@vger.kernel.org>; Thu,  3 Sep 2026 05:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412336; cv=none; b=AB+uH3SdHwgcTSdDSWRUT/1vusp4VMJ6Gd0fqgkZknUyAWm/9dLmwIBqncJwY6n+Q63HlmwZmA0svjGZfaK2quob7so2p3LSATmzOKrwx2ccWLYkoy3XEBnbPj8MqFMHbUCNpiPqfg8CXTgH2gOOzX/Htr8PXbyHIubX7ad8akU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412336; c=relaxed/simple;
	bh=YdGYLhvtvptCpYDC3ICVM4oOhiZ9/gCcjjUKAA8PwCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gggAlKpbquqWGhlzDEctgvMdEsfBCMcGuzFS5EwqPeMJMoACZJzMXOvYvvL24xKw7HWCBmnHIwYYIzZOEWlNDCUVoK7LjPi3AwprGyVEpTHcDY5outm/m8K/Ogoua8r290Fc7WDQlTUrPbcRoUDZo9bSWMrhxmKycMZw+i5dsrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NF0tt5e+; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NF0tt5e+"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1179812a12.0
        for <linux-sound@vger.kernel.org>; Wed, 02 Sep 2026 22:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412334; x=1789017134; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xAiRO/oCYlRl0/keklqXsoT6bN4V7lIX81Jp9VCDRm0=;
        b=NF0tt5e+3oSOAzJVnuDjQOPtnuebhoOzOtJ/fTjcvwmNWfLnvYC3lsE8cxhsgQNUt3
         rm5roUPEkiChdsDIeRzX9ebmUE+pBFQm7rs1cnILCv0Wrl+ynZPD2ZZlgJCZXNYxTSus
         n4U+7YoBOFechpgq854EaKQE5xBWM2rSp9u5YmKt2fi2iICVGyhGYZJERkDoMJWy3kDK
         4u7cQl9zV7LYATms3PL8qo9VxEGoZPOmAa9MD15oV+8Tes2/zkRYEAK6TnVUxKiiIGi1
         6lmx50dxJZ+zfhAPTzyW7eAasM9IZTAh7c4MT81ulLNT9M8x84AXuhzxAC/tvuxcgsF0
         bKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412334; x=1789017134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xAiRO/oCYlRl0/keklqXsoT6bN4V7lIX81Jp9VCDRm0=;
        b=HcCuSdr9NdBTgcvkOdNS5mrf6vfvg4vRS7XhTSH7AELmmDYhWCgvWg3UzlaIezfUZC
         B2aZr79VUWjELa/g+XaYTBggYKFkWz4nWTP893ZIBxGeJGsv4TsiVnINh6qN2wcCRZ37
         2P/meg4rXaCfZDiMgR6ZqKNQiy3JNYDi90iDR6c+py4p/WbwILoOoBJauE6Q3aw3uuJi
         AiQ1a0jZn5V/qoHzb8FHkyyt2CHl6T7Ue+6keDhxfgY8ELzbTW4YhvcySn5E0ptSyqCY
         srF6u4pDGsFTSoMDxP+tXl9P3IQeW5tomnYvZuN2ecmZOpSUCH96KLDFcqfQPjMMMsyO
         aMgA==
X-Forwarded-Encrypted: i=1; AKwUvBy5UuOuChMXgEZnhtOFeY+gjHw4fS5eyvwZldGlVNTDV8eOqSGTuLhsuxCmXnqDdTF0cmKehZuDY8k6Lw==@vger.kernel.org
X-Gm-Message-State: AFuF++kPNMfSiUwYqnGEBDMH2FQxGtNe+tAoKHOJ9RZQYyF7XMM4XqKu
	xNegDTB1McUtSpHgotEj9j+YbD4m+adVr9oOCMnq6lkFaJXf8Xvi6R/6
X-Gm-Gg: AYBFou2edBddlX/CY2k9RZ9sG5X65LlV2QggHnt/UldW/vRXu+r181jjaBZKtQvxORG
	QmlBZZW8Vune0m55FpLLkV1g226XrIEH7ZuN64iPtTtODzHuiZFTZ9PfCUMvQyp6u87fp/eJTSU
	eQAJS61l9uDL1WaG0KSgJLEakhHSxhkA0fcXZ43mQamGG8aHdpiB0jhHcu/nvl6+zBKydndMwlU
	hGhpOgVXSgTSDcveGOcshlhLRt/gF4f/n/t0En8tEXXIKzm0+tj3ig8sx+cgnwkZ+/we4wc8a2N
	4AMIhg2/Nmu6PSxXPI94Z+8bhFngQN5GNiXNjykh9hj51NV9/WTmA5OSukjIu39UCgji16MlSgx
	WsIP2QZIKFCD7AgK8LYgo/5EK/tk8g0OyR7XPwINobDsTV6XTDGESHCGr2/4OxZPcPV1ZLSN6f0
	lOJGTo7AtK/CX0txzyRrYulKZT1X3M1e2XHA/RneBgTw6FpUG1HNfUn7E7A4JAK1MtvobKXA1oB
	VN8knlLCmICjPLQksGAkOlvoJXyczuyhEeI9EabHjjRrhtCiznaMsFLnx6E6Pfd8kHfzRKEPXPc
	ogQq
X-Received: by 2002:a17:90b:4e8c:b0:392:6638:2e6a with SMTP id 98e67ed59e1d1-39aee0840d5mr15450600a91.13.1788412333744;
        Wed, 02 Sep 2026 22:12:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0875ce14sm3218092a91.13.2026.09.02.22.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:12:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 1/8] ASoC: mediatek: mt8186: Fix APLL mux setting error handling
Date: Thu,  3 Sep 2026 12:11:43 +0700
Message-ID: <20260903051150.178057-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903051150.178057-1-phucduc.bui@gmail.com>
References: <20260903051150.178057-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The APLL mux setup functions return immediately when a clock operation
fails, without undoing the clock changes already made. This can leave
clocks enabled or muxes configured to an unexpected parent.

Restore the affected muxes to CLK26M and disable previously enabled
clocks on error before propagating the original error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 50 ++++++++++++++++------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index daaca36a2d08..aa8b2eaf7b95 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -98,7 +98,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1], ret);
-			return ret;
+			goto ERR_ENABLE_CLK_TOP_MUX_AUD_1;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
 				     afe_priv->clk[CLK_TOP_APLL1_CK]);
@@ -106,7 +106,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_TOP_APLL1_CK], ret);
-			return ret;
+			goto ERR_SELECT_CLK_TOP_MUX_AUD_1;
 		}
 
 		/* 180.6336 / 8 = 22.5792MHz */
@@ -114,7 +114,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1], ret);
-			return ret;
+			goto ERR_ENABLE_CLK_TOP_MUX_AUD_ENG1;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
 				     afe_priv->clk[CLK_TOP_APLL1_D8]);
@@ -122,7 +122,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_TOP_APLL1_D8], ret);
-			return ret;
+			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG1;
 		}
 	} else {
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
@@ -131,7 +131,7 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
 				aud_clks[CLK_CLK26M], ret);
-			return ret;
+			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
 
@@ -141,12 +141,25 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
 				aud_clks[CLK_CLK26M], ret);
-			return ret;
+			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
 	}
 
 	return 0;
+
+ERR_SELECT_CLK_TOP_MUX_AUD_ENG1:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
+		       afe_priv->clk[CLK_CLK26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
+ERR_ENABLE_CLK_TOP_MUX_AUD_ENG1:
+ERR_SELECT_CLK_TOP_MUX_AUD_1:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
+		       afe_priv->clk[CLK_CLK26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
+ERR_ENABLE_CLK_TOP_MUX_AUD_1:
+EXIT:
+	return ret;
 }
 
 static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
@@ -159,7 +172,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2], ret);
-			return ret;
+			goto ERR_ENABLE_CLK_TOP_MUX_AUD_2;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
 				     afe_priv->clk[CLK_TOP_APLL2_CK]);
@@ -167,7 +180,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_TOP_APLL2_CK], ret);
-			return ret;
+			goto ERR_SELECT_CLK_TOP_MUX_AUD_2;
 		}
 
 		/* 196.608 / 8 = 24.576MHz */
@@ -175,7 +188,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 		if (ret) {
 			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2], ret);
-			return ret;
+			goto ERR_ENABLE_CLK_TOP_MUX_AUD_ENG2;
 		}
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
 				     afe_priv->clk[CLK_TOP_APLL2_D8]);
@@ -183,7 +196,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_TOP_APLL2_D8], ret);
-			return ret;
+			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG2;
 		}
 	} else {
 		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
@@ -192,7 +205,7 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
 				aud_clks[CLK_CLK26M], ret);
-			return ret;
+			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
 
@@ -202,12 +215,25 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
 				aud_clks[CLK_CLK26M], ret);
-			return ret;
+			goto EXIT;
 		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
 	}
 
 	return 0;
+
+ERR_SELECT_CLK_TOP_MUX_AUD_ENG2:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
+		       afe_priv->clk[CLK_CLK26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
+ERR_ENABLE_CLK_TOP_MUX_AUD_ENG2:
+ERR_SELECT_CLK_TOP_MUX_AUD_2:
+	clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
+		       afe_priv->clk[CLK_CLK26M]);
+	clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
+ERR_ENABLE_CLK_TOP_MUX_AUD_2:
+EXIT:
+	return ret;
 }
 
 int mt8186_afe_enable_cgs(struct mtk_base_afe *afe)
-- 
2.43.0

