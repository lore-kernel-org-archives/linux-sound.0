Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C20C1EFFA1
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 09:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908569; cv=none; b=pBqHw6PGZxuVLHeKhwhtK+S3lKz3JhjHtF3zueYZZkjpXyJgY7me2KWb36Ka1wVaoXZJn6Hugd7znU4CQnoS8zKoChzaCQCrbdPZ4tigCfrJIqJbh4Hxms+UvIR7VuTWekLGsNnCOBHDimdegHwoGVzpgVOHeiI/XKKQ/a/k/OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908569; c=relaxed/simple;
	bh=KQBIs7Nmnq9Hw8gwAY+Gk44taT8sALXoi/IYHOHY3zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Navc7SD1s06abwDFOMDKqMCkdlZ1KwmdmaFl8B75aYTzX4eN/EO6vOFMBwlZKHLw51Nuu6YUwOHg7H9ikwYdef6JtU8us7QevGTVU3bwbjEBPX6uUJhGD8tKcHGAiJ+slVngrRQFR++MF97fPHXYNrrDoh4ose+IH1QLZJQVLEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfVOzqTw; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfVOzqTw"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-854f8068301so538384b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 02:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908568; x=1788513368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IWC/dN9H+/DLHGkzhHQH4QE0IirXC1qcf+ZR9KcEXL0=;
        b=XfVOzqTwZ2Ovl7sOMhsZaXZm8IqfBlDFAhSs3HbAGsakFjMKgIJCGd+eaL0pdP8cAi
         cIo5uOwvO7wCMjJj430T5ZrPa1iR3wQgK94BiI1V0WV1PGRuzmx2XfnzJalDGe5LunFv
         0BoyOZS9wVLW5ABj77D+ET8ehfrNW8wdQ54yrqBDxpLC0Hl/2yEI+am2WKjsrkWc+cyc
         LuRlpQURI7MRkrhdzAzlW2PE/7YeeYbtnvIsH7C5qSQKIX8/ImMu+OO82qYd8c0tDbV+
         Z9XIGOf91nAWhO5Q6vCTGrRaU+w0oGXOY+zGSUBHHRgsGuOQN6c5Dv1wr/dgSSPFKKsr
         xifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908568; x=1788513368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IWC/dN9H+/DLHGkzhHQH4QE0IirXC1qcf+ZR9KcEXL0=;
        b=aXOrOFfaXneTIRcUAoh0DfBd3ldPfqtKZfy+KAyOy7PefNA54HJOe/dC+cYn/B1fDG
         Kxtk5vEJx+mjY2dR7IB/Fq5UpU2CV3QS+T6Nb8cB9rhdDgAUMQZgjpYeQ/fbJ8JICwR3
         qJ1CYAm7HeV+BrqYRiRmPs8qKe+FU1TspwzANr9vlQmFp/lFXtrApEgb9v8X8x+EXhRV
         pFPJM2ow0V10fwRh4i1QJXbCm1+G/B0SloSiduNVcTGgiGukxivARbftr3sGp7FsoKfP
         leh2FflqAAHobtuQJIZYOhi7AqSukT/j4tltS1TNWMFFXHYj1Fpjm195Y5fRjyL+s3ZR
         6EMw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/Q6IfMCK4ixsdo+cMv5+gc2HYd1OxBJDuPRRBQmBe7ktDWPGh+bgzeM6GPkqaq21/zUwzm2kDTvhgZw==@vger.kernel.org
X-Gm-Message-State: AFuF++kD91AoP5120AncEhwqjGUFFK/9qBhcumGP3si5zX9UV+EUzkk4
	Xksu8y0tNv2AVyuAH4UmjJQzxMLfT16XSWNNpxyP+hQPyI/HFuY6oaU2
X-Gm-Gg: AR+sD10n2fDg8ODe1TDQW1fyh8XN9cxWMkugUkA9bXuzQ7saqQcHTd9VoZLIEuScKci
	i/nxaktmDuXOgmr8XrIJrixCbFL3VvtoNLM8aqy/+wEzRdiX6TsWoxmjKfs2lVL4l2323XkVJNN
	4ShM7yQK5uDMz6JK76j7OLMP0r61/5iHtsSQ8LDdE023uPXATyHDZ1gM15NEym0ORAGGXoqnfn7
	r9GXkkx99+GNLCw1Lef2JB3Si0kX9LnQBnbWo5p4GEJVNkqVJsGzNvcDMKrMYaQWfgH5Wdz9doC
	6nOEMIqM7dpdAPrkPUx34j3ax53CD7q5kl7igKQL9LOvupEy+yxyfMDWZ/GXthp3xfLpKUS0jhM
	DObAw5ZgaCWtSJDa/MBmlFxewvkp9IwDoM52aI4SQTOXOzPofKhfijqH1unmSD+xucwe5qIO2Or
	mAadQA0dhmak7uAQ32raafU2EZSgoKn4rPBTc9hhcyGWtwTk0s/GiM7lq0v9AN5KAPHT93VgOro
	jayuGUByPlsRZJu+n20Vb/q9aJS5d6ynAj7a1UnNQMhr+ogDNc2p2551In7kEU0BR70oJGuQ1wY
	235g0w==
X-Received: by 2002:a05:6a00:2d84:b0:845:e8b5:8c49 with SMTP id d2e1a72fcca58-85629a25879mr10588287b3a.10.1787908567583;
        Fri, 28 Aug 2026 02:16:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:07 -0700 (PDT)
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
Subject: [PATCH v3 2/8] ASoC: mediatek: mt8186: Fix clock handling in mux disable path
Date: Fri, 28 Aug 2026 16:15:26 +0700
Message-ID: <20260828091532.600047-3-phucduc.bui@gmail.com>
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

In the disable path of the appl*_mux_setting() functions,
clk_disable_unprepare() is called after clk_set_parent().
If clk_set_parent() fails, clk_disable_unprepare() is skipped,
potentially leaving one of the clocks enabled.

Move the clk_disable_unprepare() calls before clk_set_parent()
so that the clocks are always disabled and unprepared in the
disable path.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 70 +++++++++++-----------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index aa8b2eaf7b95..a517aa67abf6 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -125,25 +125,26 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
 			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG1;
 		}
 	} else {
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1]);
-
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_1]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG1],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG1],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_1],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_1],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
 	}
 
 	return 0;
@@ -199,25 +200,26 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
 			goto ERR_SELECT_CLK_TOP_MUX_AUD_ENG2;
 		}
 	} else {
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2]);
-
-		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
-				     afe_priv->clk[CLK_CLK26M]);
-		if (ret) {
-			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
-				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
-				aud_clks[CLK_CLK26M], ret);
-			goto EXIT;
-		}
 		clk_disable_unprepare(afe_priv->clk[CLK_TOP_MUX_AUD_2]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_ENG2],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_ENG2],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+
+		ret = clk_set_parent(afe_priv->clk[CLK_TOP_MUX_AUD_2],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_TOP_MUX_AUD_2],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
 	}
 
 	return 0;
-- 
2.43.0

