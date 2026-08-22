Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC473BD225
	for <linux-sound@vger.kernel.org>; Sat, 22 Aug 2026 12:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787400016; cv=none; b=As6UbZOuVmhig7h/ygWQUI6PUvVVJUpzHN3ysIC8Rk+3odztf/ieoto0KuqJ+IPWxqiHw61J0PJUlGygvMpOHuTxNqXy+OX1Qw9jD1OMn7eS31US6Jq/7+UHNjHfrONXKFnG065ks3dxsi5Yo4IcesBHaEabDHbf6Y4cPTH0qHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787400016; c=relaxed/simple;
	bh=v0z7FSkKa+1+ZT09whtMH08CL4YXfagTonMsf44gyOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZP0Vs0Q4Dlpf04ZqRLLAhq0DjP3b3+HtulUD+Z4yu2pRiVedS2kXhXlickcl1w52snj628NZ9c6P3EzTR4JGlSyJk+KjKbGMO/qakbMANAM6IqmHN8yTYCpoyduHbYBRP77aq0s+NY0qD5pb44sq17Rux8Vl+MD1xYBFh7tQzhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pfwg8Znc; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfwg8Znc"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c197eaaab00so308058966b.0
        for <linux-sound@vger.kernel.org>; Sat, 22 Aug 2026 05:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787400013; x=1788004813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvGxsjxJ9mwyqXPBI6LRqXNLhQj/rj1NMh48pIDPvnw=;
        b=pfwg8Zncy/Qg/j//Xkovx2KSS7SXcR0N9sjmsuIchczBL778mLzkbb9eC5MryUTfuU
         odbQyTAjeBgOYL3OY46YqZt9aE9LW3QUeXD8eulu96MGRRZDjQCg8NovBwLZW7dN96Ny
         J0rqo1LmVK0oBBBDo90jU8rZUpXdu1Dt3sWqPTjsaRohzAwcxPzgtnA/QGXI7+glOqj9
         hMWp3Lyve6MuIUMoVmbQoPbyId8noY3ObvweyjsXia/wYa5+Bckdhn5HHGl/XsgZQbEE
         /T3FCrhnu8zHU6zP4Ew5q3XEua2ugUDY4BcFKpmyCw/7qHEPyuiVT2vrM7t4q4A0XKI0
         cRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787400013; x=1788004813;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KvGxsjxJ9mwyqXPBI6LRqXNLhQj/rj1NMh48pIDPvnw=;
        b=dml7Aty9B6wrRO4J8lcFEzAbkQ+NXTv9FAIxGnepvoxu2NpITImzxoSMM1DWcFp7Tg
         j/BqDdRBcY2RX4U64QazRFH7BqCUtTH0l2W5aWtNd0SnrNFGUerGGs2A+NcCEXyjVS7b
         PhBAQK9gWMFl/GV9H5jO0sY+uHFDs+rvYsU5v/Izp1p3SqTa2Hq5FXWig+dn0UobR6T8
         Ow9bwwcAhByIlFSTU2C9did78T3gC/jccfIlT6/4T9B+QmAVsQOKPCTUViUoI9tYJOEu
         U8/6+ny3Suiu+5wQ9tNrPmuZ41wbBMHtmOTAvlnPZuLKSsfPumjuiRBuSfihPKzPmhuo
         AdkA==
X-Forwarded-Encrypted: i=1; AHgh+Rrw7mCiwHFejpAdxsi/1EaB5l0S1paqio7Sd092K/EMnSVS/1gf9MlsOxBLu9AtKkKCF8Tleoa1KnueMA==@vger.kernel.org
X-Gm-Message-State: AFuF++kkfz/TqVsyjQ+xEKYsyfD8AdVOG08Fj1f0xBpphUJj3UTbuYJN
	pk9bVUYNi5gJBH+I08Z+PNUp/dfVHa/zdu03loRwTH/GdQwtyzUsWvgXHg8sLKaS8D4=
X-Gm-Gg: AR+sD117pJc6yelj1Tq8rqjvXgCtmaTSiOaEDBJTL33Dlb7CB9HI5pHhpr79qaFhKU4
	QOOETCo0wfxLAgw8lb1pQ6qCWJW7s9ptdnxJP00NVI1Uuvs8+/k9ZDp1WUnuVQ50s3R/pK/sZPE
	e8aYacGoY47RN/PtdtbQ3PuBG5tHdn/Hai/7evFFghZRpR+kpIxTFllsTKe2ajUhnXgTb9IBl8v
	QT+LoBCUQ7yns9vZc0LIBMdzS1gEj9XIFr3cHxEJVxYLLRnh5Iblx6a4jkG6kn+MSoq8QRIFDhr
	QaO4rqsny8ZTvjbKhtZ5rwuyNWTp3LpwBeXKY3ftYBBs9hGzleU3vgwPQmaCGpY5CyjnU2yyVta
	R7QH+002OzXh2Ba8lipalRVwWO5PNZprLBwkGJ1z3UpEKC62JkynskAM9vrUyT4UcS91Kys0OUq
	MKGE/H6wcXZaHuxPUOkgmhAO2xjbvtEG3Sqpc8ClNMw/yttf6mZ9drc/23Gg2/8AwFvr2cEL81o
	/gHCNc5x66Zjk4NW9ZBj/QFVmkgwyymqqicV7cwfhI62vpqVJpFNNtvJEqsUusxe6Cy4t4MLwUO
	kqY2NwAOHPRG6/sGBu0XHnrcjv9OmX0Y1Can4aFOiDvRDxaiXiEKZb1iYjRsrv79EWu/m3rQlMC
	Swdn/loZMNWbXTIgJ
X-Received: by 2002:a17:906:2481:b0:c1c:2007:298e with SMTP id a640c23a62f3a-c246b4c5e33mr1111437566b.24.1787400012648;
        Sat, 22 Aug 2026 05:00:12 -0700 (PDT)
Received: from workstation ([85.186.165.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296cafsm298776866b.14.2026.08.22.05.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 05:00:12 -0700 (PDT)
From: =?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C8=98tefan=20Ghe=C8=9Bu?= <stefanghetu9@gmail.com>
Subject: [PATCH] ASoC: fsl_micfil: balance mclk enable/disable
Date: Sat, 22 Aug 2026 14:59:59 +0300
Message-ID: <20260822115959.74496-1-stefanghetu9@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hw_params() enables mclk unconditionally and hw_free() disables it
unconditionally, but the PCM core does not guarantee 1:1 pairing:
hw_free() can run without hw_params(), and hw_params() can be called
multiple times from the SETUP state. This triggers an "already
disabled" WARN() in the first case and leaks an enable reference in
the second, leaving the clock ungateable.

Guard both sides with the existing mclk_flag, as fsl_sai.c does with
mclk_streams.

Fixes: b47024dc624b ("ASoC: fsl_micfil: Add mclk enable flag")

Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
---
 sound/soc/fsl/fsl_micfil.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 60ac8eabab9da..5d8f0f76ab46f 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -953,12 +953,17 @@ static int fsl_micfil_reparent_rootclk(struct fsl_micfil *micfil, unsigned int s
 	/* Get root clock */
 	clk = micfil->mclk;
 
-	/* Disable clock first, for it was enabled by pm_runtime */
+	/* Reparent root clock to the PLL matching this sample rate */
 	fsl_asoc_reparent_pll_clocks(dev, clk, micfil->pll8k_clk,
 				     micfil->pll11k_clk, ratio);
-	ret = clk_prepare_enable(clk);
-	if (ret)
-		return ret;
+
+	/* Enable only once; hw_params can be called multiple times */
+	if (!micfil->mclk_flag) {
+		ret = clk_prepare_enable(clk);
+		if (ret)
+			return ret;
+		micfil->mclk_flag = true;
+	}
 
 	return 0;
 }
@@ -991,8 +996,6 @@ static int fsl_micfil_hw_params(struct snd_pcm_substream *substream,
 	if (ret)
 		return ret;
 
-	micfil->mclk_flag = true;
-
 	/* floor(K * CLKDIV) */
 	switch (micfil->quality) {
 	case QUALITY_HIGH:
@@ -1068,8 +1071,10 @@ static int fsl_micfil_hw_free(struct snd_pcm_substream *substream,
 {
 	struct fsl_micfil *micfil = snd_soc_dai_get_drvdata(dai);
 
-	clk_disable_unprepare(micfil->mclk);
-	micfil->mclk_flag = false;
+	if (micfil->mclk_flag) {
+		clk_disable_unprepare(micfil->mclk);
+		micfil->mclk_flag = false;
+	}
 
 	return 0;
 }
-- 
2.53.0

