Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D783E169B
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 10:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049851; cv=none; b=FqBatx3ILmdYO0RgxBqa2YuGFd67w9PM60PWGnlZJdF5DbjTXIkj9Y+8YcbcM3Px/CvX1mMsNonPqrLlLzBaPkFdF4NA23bMFsduYEAM2F6w8ynv3mrOFZbSnzATtCABaO+fvTVarzHekCWcpmeAgWGVvPUEdvJToMtba/8Lnlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049851; c=relaxed/simple;
	bh=oeDHkKNNNIRwev9sixTsLe6A3+49u8x6Z6Oy4T6Z0b0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a1vJo90v8dcsnZ/8DxUaSheoG4FiXAcoXhi7gC5Hki425J3+tc4mMcfBd1ZCBxEX0d0HzPcwCka955x3mN8/rysdnksGLmxWkBUp/BlC8s8v8uEU16UicuooMOWX6xOV9Fy8Oz02E0DAHgB259OF8S94HO8gwNdwVlU0BnWHEyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dB/djWKK; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dB/djWKK"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso47107515ad.2
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 03:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787049850; x=1787654650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mu6cEuUuRvNS2qVienJZZQ/34Pa6SULcthRHhbJplqA=;
        b=dB/djWKKDguRNezX/R1NiWChyI2XshAzAj9lawFawLm0XqxR9t785IUp4ehwAmX1XZ
         FY9LVG7dLMfGMuhOAhaFeIa4NER74K+d092Qv3cepn7l0nfpwqHlorm0uHcQU7pnfbTg
         EUJ64v1N0q+1ZLAfnmqGr0dITSVMql6Bvo/vSt6vFADs0wywRzMSfL3/trTlbHfQm7Th
         PIvQ4ONVVJl58qlpJKJ4HvzF09cV4/EvTlWiN7e0WexT0QDL+C/yVxsp8nb9RMAHlcLm
         zE++u4jPUfTgxHUB/6Jhv2xKRG9uuItOTmYfLTxVPNsInHu9MBSWV2rIo3ISXgIWi7DM
         lTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049850; x=1787654650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mu6cEuUuRvNS2qVienJZZQ/34Pa6SULcthRHhbJplqA=;
        b=gd04vn+BMXdMsXtPsG+LCMAwpQdJbC5CLqnARSHHfoaeG2EXqfIfp1PJSq9yDZ3wSl
         aTkQAjTLVgWZUWRODqr4qqbiLtYa3NG3JOrPsgtfMfKrcdJI7gaZ1Ok7PfB8CPkhKm8S
         L5nBLZXgJJALv1BrgKS0PnP3p1iFg3kYlfOODX/GLDcqMV4RLeysq3ltDyQC208aWh2G
         UB8QTsYGXP3gOX5Z+fHKVhFvFr835dFmUzgB+qZVmg5Hu9i2Va7QNQcJ83daisDP/qX/
         6vDEZlVVyLzyp6qY3juY26dQugSaLuPsGurgA/416dfgaD/qnDCLrb/nuk7WcHCvAdtI
         2UKA==
X-Forwarded-Encrypted: i=1; AHgh+RqzheAZwV9ZOOU78yU/CMVwTdV7KlmCvG8tVtwHeQmXYIKpfnkvGxJG7F8GFtcOX9XSavM/Gr/zH4O7Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxaS7CaBNOwWz4iYtnWjpLI1rdh7ZbOSo7JUMXa3eBl7i0d8Tju
	T4k1zuv61sP3LFe6b7lTElc4kvGQEVBB3HN3YPLchWDERu67ouaUU9ta
X-Gm-Gg: AR+sD12XUQJg4FVamIlhEIYTUQ82G7XlWlxuWU8pHGlYVuQcB0MWBNzoX5UeTY+iqHA
	qjLRdgPNNlqDd+1XHYJXl9/03mfCvqaIvsrSJyQ2TZgNkxnniolA1c+GMJAujb1uJZLD10x11vQ
	WiYMvyaMyrzUBgKRiEBbt3/zaDiEutuIAaxAVQO+sRO2ftJzDzMaK9zjrW05S9HKu0iq0H/8ZhR
	V00bp8Z6S1LR/9CZbnHpwUQgTj3QrpbMHUp54smRo5uNC2+sKdW+4flnVyRB02x4AIwYe6tIjz2
	WKEP+OnqJiMvybczanPZ5OxSp8G+OGR3sAz+6+XL5/E51trrQ+W3Z45si8sK1f0Dp1LaCkw6oLz
	lk+/rEpgGkcsr274CzC0vJUeTd7xsAhL3LU8zmZ9cZhvjwnlU5JPP2AU/RYtoNPcylYhVKpRDs7
	SSYhz+S1I+9JQ3NF+rjjeT6SBeDI4rJ6/eZo5yMGrMsvRiwaDUq+OC5sffKYKGiPe3n/ohhE47C
	WlLU6K8aZZSzwtjrBVUhSvgKbpYdhXC6uGy1CNdvc8L9r4dtRReFQgFdmfNykwObu1CRqwaBcA7
	fLKn
X-Received: by 2002:a17:903:1850:b0:2ca:f21a:a6c5 with SMTP id d9443c01a7336-2d3b0aeeb01mr407552145ad.1.1787049849560;
        Tue, 18 Aug 2026 03:44:09 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267bf83fb2sm15039905eec.19.2026.08.18.03.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:44:09 -0700 (PDT)
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
Subject: [PATCH 1/3] ASoC: mediatek: mt8173: Fix clock error handling
Date: Tue, 18 Aug 2026 17:43:42 +0700
Message-ID: <20260818104344.37824-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The error handling paths in mt8173_afe_runtime_resume() use incorrect
labels, specifically err_i2s1_m and err_i2s2_m.
When clk_prepare_enable() fails, the code jumps to a label that calls
clk_disable_unprepare() on the clock that failed to enable. Instead,
it should call clk_disable_unprepare() on the clock that was successfully
enabled before the failure.

Fix the labels and clk_disable_unprepare() calls to ensure the error
cleanup is handled correctly.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..b4c6ef6f0845 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -997,10 +997,10 @@ static int mt8173_afe_runtime_resume(struct device *dev)
 		goto err_bck0;
 	ret = clk_prepare_enable(afe_priv->clocks[MT8173_CLK_I2S1_M]);
 	if (ret)
-		goto err_i2s1_m;
+		goto err_bck1;
 	ret = clk_prepare_enable(afe_priv->clocks[MT8173_CLK_I2S2_M]);
 	if (ret)
-		goto err_i2s2_m;
+		goto err_i2s1_m;
 
 	/* enable AFE clk */
 	regmap_update_bits(afe->regmap, AUDIO_TOP_CON0, AUD_TCON0_PDN_AFE, 0);
@@ -1018,8 +1018,8 @@ static int mt8173_afe_runtime_resume(struct device *dev)
 
 err_i2s1_m:
 	clk_disable_unprepare(afe_priv->clocks[MT8173_CLK_I2S1_M]);
-err_i2s2_m:
-	clk_disable_unprepare(afe_priv->clocks[MT8173_CLK_I2S2_M]);
+err_bck1:
+	clk_disable_unprepare(afe_priv->clocks[MT8173_CLK_BCK1]);
 err_bck0:
 	clk_disable_unprepare(afe_priv->clocks[MT8173_CLK_BCK0]);
 err_top_aud:
-- 
2.43.0

