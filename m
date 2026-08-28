Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91DC36B903
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 09:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908582; cv=none; b=n55PJapjq2fNsUyqMXTTlJyorzlUT0ls8MvLXpOcWgI8l7hExaY1nw7EkXqWkVxM+8T8WdgIr4c9dDdaOywWVR0VANBQM3t88AdumAVo+hl8hoJMRN83PcfA4iEmy8hLNPx8Xax52U93fxnzKzjcNpmWjwcglOZ8pktTkqiWgy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908582; c=relaxed/simple;
	bh=DdqB6KbiIKlpMDTCTBrubAh+8Ofs/e0ikTAPMvgixQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKjQZZkqbhkhHRsFZUoTxK7p4zGbHuFPKQ4tXCF/LUiBwyCVmU5fTlcQsv+14XJE/6e6d1RyEcoXwhy0MlSX9vtkhYSwYDwCSrvuZK8Awoh44p7NTdiJMKaKvxe01hiVIgMGX0Ho32Tx7MZUQm3nrEC1MkCYXZVhuOvYWUAmQK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n2JAEPkI; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n2JAEPkI"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84830c774a0so1044443b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 02:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908580; x=1788513380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3L4YTV08OIKXaB2YzOzTLg/mRS6RPqOe2hfmq9TrFik=;
        b=n2JAEPkIlIgEiPokERhTKRE3hGQq1jMkJfNOrT9baB8zhsI0GgDPznzRWGdszuMMoP
         ApdcXarQoBYjtnABL2nlmmDgJNvFMaKvFPUg+QEFoaicuxB2bot2A2LNGfV+RR5f6PRC
         3P2m6G6bhE/gf8zA4eeB7Dcfvq3zJcfgeUL0hkwGWll7GDq80W7j4BSoTF1iHKSxkHx2
         1ymHlZ1itvfbjT18LKg3ld7Z/U9lb4TTF+CQ+J7eqjQ4fASRwPdsE54kr2zJ3jMVvfAB
         aQ/ON3lvJS9HEPnKjry/X1tXmEDlIXsQIV2l/PwDqZpK27m7HejKnJyv9sK/x4Qgc7kH
         PRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908580; x=1788513380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3L4YTV08OIKXaB2YzOzTLg/mRS6RPqOe2hfmq9TrFik=;
        b=KEHzaDob46tH17cgVlxbp1RDcc0mTKC1tnm7djy5rSXghqePq7sWlHSqZTIxLuFQGH
         Z+J3qPpYzJiQ7WDGoROt8xRGYVyWqmqGLmM1HhNX51QymOrn/Aw/SKQfrSwfyfWa3uJb
         myE+O0ZMl/ASBy6IYvW7AnRfDbefG9g4wLxSp8SrkZrBL3uKI08W5yBSgun3pulR6wP+
         omVOuP9mcPYG/uT60ETE/8YONi3doIrm3CoontCDPBTkmvGQN13lwRkgdi2J8VEzuPR1
         n81/S8qIbBT+yX66+WH/DwnpMBY5BYhDVGuOBdtLchUv7ksO2+aVM9gZq0DESOkCqtaq
         uuTA==
X-Forwarded-Encrypted: i=1; AHgh+RpXZL8DpnoOuITbEODLcfcdgNckUeBk7gjA4tO934t3a4djm6geqOanRZn1EeV1SeRqg2OaLxZq+KZb8Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nwuqdvmGKbpBX87L1YyFSvlDUjLVbuTsokq8F7YBEoKHGRISMH
	wCMHDGmnkDqCUTSf8NOS/YiK4J3DjBGfj/TwchRGwDiun3Waszzcibhf
X-Gm-Gg: AR+sD13aMlTNAr9QEroVn3qA+xbHU/sm8El2Ij9IPZf3f8mk21vQXlxzkbsGfrDNkz1
	Vu1nAePpjXAq98Q/ZYCFgXG9kxMWhLWB7LuK/nJLn3N17xpRNg/JGJzxwT3zv5jEPYpiM7hJb0Z
	rD3ESUObb7ahyQucl0ShEETzn3OiTZSUxdhlX6SpUiLf7GJ0cB3z8OrjJDIvC6rBIMjDThp+Dkl
	gZDQ9T1iCFxs7K3teFOQk+FhK2QwjvOFAzwtwcSnnxg7i6SbghBm1xnbpM7nW5aMuxp89PAeUft
	Q1YJdl87d1hr4lle+T5mPGAy1yJRtoVUXU3t0UY+rO5wmRdgDXFmIqqNk0qy9Zi5qEbitfLI1XA
	1/L0uTXgeSxQHhzXiF85dtwS3mJ5J7GTciNpgN094Ge1qCeUL3h3HoxamXhhGmLSXL/nb0V3EI0
	L/jV53+J1JJ0QSYAdZf7XKYPZH80UOxM4kLUOxXnRdhUbbrp3f7h4H+4Rja2Z607Y5o1UInp6VE
	CwniUiWIkw3IbDrJrS5dLibcJBB1pfFedmFdxiDXUFzw1MJmu9mC9ziC7zhh9+HNkqra8njoNiN
	JxW4
X-Received: by 2002:a05:6a00:4109:b0:852:38ea:3fd with SMTP id d2e1a72fcca58-85629a252e3mr11093863b3a.11.1787908580220;
        Fri, 28 Aug 2026 02:16:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:19 -0700 (PDT)
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
Subject: [PATCH v3 5/8] ASoC: mediatek: mt8186: Fix MCK error handling
Date: Fri, 28 Aug 2026 16:15:29 +0700
Message-ID: <20260828091532.600047-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The mt8186_mck_enable() function returns immediately when a clock
operation fails, leaving previously enabled clocks active.

Add error paths to disable previously enabled clocks before returning
the error.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 85fe828ca5ae..6d2871254e32 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -528,7 +528,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 		if (ret) {
 			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 				__func__, aud_clks[m_sel_id], ret);
-			return ret;
+			goto ERR_ENABLE_MCLK;
 		}
 		ret = clk_set_parent(afe_priv->clk[m_sel_id],
 				     afe_priv->clk[apll_clk_id]);
@@ -536,7 +536,7 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
 				__func__, aud_clks[m_sel_id],
 				aud_clks[apll_clk_id], ret);
-			return ret;
+			goto ERR_SELECT_MCLK;
 		}
 	}
 
@@ -545,16 +545,25 @@ int mt8186_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
 			__func__, aud_clks[div_clk_id], ret);
-		return ret;
+		goto ERR_ENABLE_MCLK_DIV;
 	}
 	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
 	if (ret) {
 		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
 			__func__, aud_clks[div_clk_id], rate, ret);
-		return ret;
+		goto ERR_SET_MCLK_RATE;
 	}
 
 	return 0;
+
+ERR_SET_MCLK_RATE:
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+ERR_ENABLE_MCLK_DIV:
+ERR_SELECT_MCLK:
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+ERR_ENABLE_MCLK:
+	return ret;
 }
 
 void mt8186_mck_disable(struct mtk_base_afe *afe, int mck_id)
-- 
2.43.0

