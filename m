Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAAE2C11C4
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 05:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787893561; cv=none; b=p6zpyPBtpm758DCgFsWRY29kRyUd8GX2ZkNuMHKfdu07cgEk4Jlx66wfxQVq9Fb+DyRsxfB80AVPR6mmKhp5a5MN/pk535iG/QDjBtjoptl7LgMgcDTlJ/+THrB+koJoKChwE7p1nMIHnDrJXZZJUlpZprnki2nNyvAK5f8fFwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787893561; c=relaxed/simple;
	bh=KBeCd5r28ZoCaTvZfGV/KIZe2U7TawXL60KXOy1aHs8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cwAOtxUlt1/j8NhvDgGGAQWKqskB60CMJSkZvdDZ4BoH1LfPd6i3gHjXvZG5U6I+6AkE/lEEHTzodmB5eqqPw4Hpr2zcC0ZZug0b+OUmh3KJI/VYQE3u92rfOigCpMR+ZzDsUGgyr/VEr/l7qQhDOKiVXDtbpj8qVgcVxwGIoTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIcm5XJS; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIcm5XJS"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1ceadbd16so503681a12.2
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 22:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893559; x=1788498359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wX5Pjxydk72W6dlHzm6vBpUneCYTnp+fBCLKSyxEezc=;
        b=jIcm5XJS8ESbte+rPWruhM2XqQjw6rizwxDXVuOScdp96SLG3BKJk7S71FcZ1qplRk
         drjKuP2Tvewj1BNZIIcEv9Wf//kYWicgN8jlH6hxfDnlfLUOlPc2WViYoyMeHTSw3V/e
         Fx0j5TPQSjFeiX2JI9zyCPh0feXV3JoSx4QoFEX3k1ZVMcs25LH+X3jUghkaW7O2CzoX
         IiKinoRozBnIEQ2uouAkN9MKV2O3Ml4LV/x96ukmPZKjdv93utZDKnEOqucFxdkA1wp9
         xS4VtY2MHgcz4djpa6ZVqNVzqUHw88iJZRSujbOz/u3C8ti5gVjKaXCI/WlAfx927VnI
         nUkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893559; x=1788498359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wX5Pjxydk72W6dlHzm6vBpUneCYTnp+fBCLKSyxEezc=;
        b=KPJxMsymvWv10mNDJHJwE0RnaYfYxLcXGAfg0uFZUip98GI0zODd8nElSzhbRpxmJf
         itZGe2nu7t8x3savT0uQZuhJiQJSNYWcW2URKH5d4XdAhCGIT4GRKbe7uoc35k6jinfC
         boXnot0ibsqmCvzjQ0VGMn3MgZPJakZiB7VLb2tuBOIX0KS/F0CBhYPWI2Yien6kWEGK
         h1Zrki2ecCrV1nfJpMHuMtWTYTDAZTXrdjLNOUhWVCB6VwifnzOWW1ntsW+J71lcoo+Y
         L5vQsY7U+RR2Q3IHrQDOQ99D3ClOtjxeSDgfvyLPgHxR+M6zJC5PZTvelrwptlODrhBA
         AeBw==
X-Forwarded-Encrypted: i=1; AHgh+RoQ1a6PALyiuxfl1TdlEUS0/KJupYaItYzKKgxUH6J6tTFkOyg93JE4zsxOO/4sYDdYmLUMnyrXK44FKQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kLhvubSb6J4xIrEemqoiftXu+PlmU5CauRAv4VvDkYzd74r+fq
	eY6KELZWN/djDFlhiuAwl7suCyt+7B669HurbtFhZt0V1d52QL0ZsUB1
X-Gm-Gg: AR+sD13IKwKJex/xMKDBbFCrOZE2e5FIR+UWk4hmtkiQIwfzThQS/pxQPEzFRjj4Gpl
	/n3r7aSUGBnoyCVaSnfbjrscwgDT31OmP48N2p1ZYmqX55vCYG4X2gof5K/3NlhWtHcAzCEW9ZH
	hkbpJeL8ZeYHG3AZUcgWLTSnVFAmDPY912DHErP+GvzEmbRee5u/sudYvpmrpXTYriBtjWAR3qu
	1jOm4u4G2+5GOmJNbwO10ZdbhYUPPwiRwurrCYqjtGvfxlTKjwYxVrnBX6zH2yQ6H4Ely7/h/wd
	ObmkeHjGJbXAetUuI5dxGPCMePec/hdR38heMofDpDksRIzvRRM5G+UJvPiau8Y9DSgg66vXt7y
	JTGA0e+H2ZKdpIFGSgZAmQ+t1i+kp1EbYbbvHLrZzKbaJWmYSpYfz+VwHct/Agov/b3X6ZJRF18
	yQnYRYqaer6hB8i5fLKcpxQTJsagXxsvr/lW+8RROd+/W712yRJfdgRaRaAgUtWQd7Zwtm0DmXL
	C4q2u9zFiLLs0H93iRyE/nKcpieH5S3/DdxOCyAiLg2/AY7Q7Pj0kvR9aXSIcJaXep2ZwGbgvpR
	KbPM
X-Received: by 2002:a17:90a:da87:b0:36a:5d1f:7b6 with SMTP id 98e67ed59e1d1-396d0d4c42fmr9359769a91.2.1787893559221;
        Thu, 27 Aug 2026 22:05:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:05:58 -0700 (PDT)
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
Subject: [PATCH v3 2/5] ASoC: mediatek: mt8183: Fix clock handling in mux disable path
Date: Fri, 28 Aug 2026 12:05:23 +0700
Message-ID: <20260828050526.590761-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
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

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 70 +++++++++++-----------
 1 file changed, 36 insertions(+), 34 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 6ab0734ad136..2dbe0b7f8bad 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -265,25 +265,26 @@ static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
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
@@ -339,25 +340,26 @@ static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
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

