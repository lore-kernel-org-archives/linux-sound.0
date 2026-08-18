Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A8D453A55
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 10:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049858; cv=none; b=i07iM1ebpHNYzNMv/I0ICty4AqmHBu81rPcjzhDL6r1AWgdi66us7VCglIOBnAn1WXdyJ7Sf3nHrNfGC1pqww0H+aalyXXscumVrq7G4hu3zgot3sKXmW071a/VQS/wM0XWk8IiQ6mtWgMGKTHfLrK9OhgGR8yOin13NTDM7roA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049858; c=relaxed/simple;
	bh=Sw1EvGlDXLPDOPNPLylwk7xPxgdDuI9L0hImD3pFwFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMWqa+YnecL5Ez2OHRgCcZB2RAn6vJiK8LTU5IBGP7F4VaUCg9guMTsbtq4sfyN47TlxA68HGUa1agIrkddNLe5ZdImGI8Wea6bZElh/pCgMHGGRBQTGlkqyJwwLOsw41x6hAgEIYHgq6ZWLT52Hl6HUk1Cb4niVMZkvqgTLsXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+FdaYQg; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+FdaYQg"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38f620399a0so3875070a91.2
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 03:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787049856; x=1787654656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lERV4Dgamz3blZ88l1O9q1VhAYN8Lxx5pk25Ui9BHUY=;
        b=X+FdaYQgKG5P8uYAsAiL74fLXomWr2mujpDsbEdV28FJD/KBD/ZjJVA9FfXy+zdqur
         rEH9CcKui5d/xHZDTc+3VvJxvNmVid1/l4fvFRstP9UPO7pKsig4RWrl9FjDTRqmpWw/
         h2M5b9m+xMdZXaPfKe4Vkxp009ZlCcgO0T3dKWKaKuD+GWt/ImnYAGk8Ilzx0HOU9AG0
         RpqTI7nG1mvTh1S83wY9De53xx649nSTsv5e2a+df+SIVY/RpSoagewA/ed2zWhtGz4Q
         u+03pyxjAfEx/vMFybrzbUurifhbGh54fBhHngmAsItR2oMH+dfTW3KFPa4KFGwqzIx3
         XRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049856; x=1787654656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lERV4Dgamz3blZ88l1O9q1VhAYN8Lxx5pk25Ui9BHUY=;
        b=p5FzL9SdLk+K0VkkFiWo60GlQuM/ZUcdKHvYJLKQZwgMz58eusA0RJAmSXFiaDgIDd
         ALxpoI9I5l25P0Ijcq7sUKAxg7C/gTe5SQjRq3z63ABQK6XC4ZTTkKmOs38YdmeYkCtI
         kb1c7aXezwuuXnL/lNLq8HKLMJuDEE3JPmnJ2Tcz6mgvYafONcA/GH36C8PJTWLTWV3l
         QENT1QWneLthJrEAQOSOlA717Lt5Ke4TmEtll7ZF3g211uc++hM4oy781knuwbEb/aVu
         qXi6k6l2J9t3qYS5myd5yisGfYaiDz1/oPgTs6VGbgLlVLjPF+PRqZEAKBmglQQ3o+TQ
         tH1g==
X-Forwarded-Encrypted: i=1; AHgh+RrGTIEhw4TqCEm9KnPGTj2EeZf6yUo+xKE4fkMMI3tn1ZR+oSDsjT0AQyJll1+xm3ogL2sfSw3+jzz8MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBC6Lf4MucrTtULp72NOwn2De5h/chLtftyuz8k+rlIEEqmMDn
	O0IS7kVzIJXx78zavcsEeH+gnKpl+lJ4GG4CpmtiVBSdQyAPt9S7tIfR
X-Gm-Gg: AR+sD13+U6cIauYSV+nr5fIGEr2vfBWCQ9a1Z6ynQmuxpb5+8Cpdb0mcHSDLswNShvi
	tu2KU4qfj6JvxCYA9URiyQz4dYGyr8rqYZug/OK3pxwETzudkiEJrK0adHUcPBe/jyzNN1c3xaN
	wNH4wbjr9MZ1CE/ut0Bb6Vbd1Lr1OlMn+Fg7LyWN2/WOdI5cpF/I8K7URq7jnbmg1DCFksjO+46
	62cCDdf9pRP15q50s+dAuOPcRHTyU0kP75x8c8+qRbCTo4dzlCQRyrcc4rp7A7yYbZZve5Ormbv
	Cuj8GrwzLFE8XnSWnfUEt1ecK7OoJh4q6MRGxF0RW5JRFyLkyL4xjgJoELCBDgUwync5Sibry6p
	Tgr3AUtdxLzqy72tQhTMnweJPmHCzuSdriGpCTeEzcQvfXaBIOO8Ii9iNWPjbQEQCgMKEpGD7rC
	XLVb1SsBCpIwA+uP0+zmrLUHJXA8b74M/qTAKrtdIBBaDnPBgBT/S5zbkEeZdRZ1mp+RkHVMww9
	QY/Qx00Wx8GuBJ7u0C4hcb1SiNQc50+pt0UQOl9pxIOplcRYijqKk20Pg2+O3AxfvAufe3J0HvA
	dya9
X-Received: by 2002:a17:90b:3809:b0:38d:fda6:4873 with SMTP id 98e67ed59e1d1-3955a79c068mr8481277a91.10.1787049856368;
        Tue, 18 Aug 2026 03:44:16 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267bf83fb2sm15039905eec.19.2026.08.18.03.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:44:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/3] ASoC: mediatek: mt8173: Use dev_err_probe() for error handling
Date: Tue, 18 Aug 2026 17:43:43 +0700
Message-ID: <20260818104344.37824-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818104344.37824-1-phucduc.bui@gmail.com>
References: <20260818104344.37824-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() to prevent log spam when probe
returns -EPROBE_DEFER.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index b4c6ef6f0845..b7c4b24a9cad 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1038,11 +1038,9 @@ static int mt8173_afe_init_audio_clk(struct mtk_base_afe *afe)
 
 	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
 		afe_priv->clocks[i] = devm_clk_get(afe->dev, aud_clks[i]);
-		if (IS_ERR(afe_priv->clocks[i])) {
-			dev_err(afe->dev, "%s devm_clk_get %s fail\n",
-				__func__, aud_clks[i]);
-			return PTR_ERR(afe_priv->clocks[i]);
-		}
+		if (IS_ERR(afe_priv->clocks[i]))
+			return dev_err_probe(afe->dev, PTR_ERR(afe_priv->clocks[i]),
+					     "failed to get clock %s\n", aud_clks[i]);
 	}
 	clk_set_rate(afe_priv->clocks[MT8173_CLK_BCK0], 22579200); /* 22M */
 	clk_set_rate(afe_priv->clocks[MT8173_CLK_BCK1], 24576000); /* 24M */
-- 
2.43.0

