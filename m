Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F4414E2F2
	for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 10:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758709011; cv=none; b=nkyPt9UerVUmauFlQSM59vRkFfwCz/Bwk64/exH4+lGCmaJNjxXdZ3LbSuvbdEHphF4GFiaMN3xqvkeliJu+IXx69Hswt4CymgHP64lkXI0uYdlECAboxJtVXjQxMCRdbztTJ97TEsTr3oNz/K3GZkQ6rAlTe5EQKrp2NSWvrSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758709011; c=relaxed/simple;
	bh=/qGCNh8abWDm3X5xS+Iz+DznKUJ2gBpds0vUYbMtcNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H252cLWb3HaGFzLsxU6erLtARtxTQxztDYqd1CT2+SmuIlFx5Wwlw9srVUytElg38oGIzZ2Q0UFgW/v4QpETbUz1oFTdY9fuLOFhg3ds5YNHeuK72GDfe1SQTTCe12EGRgr0JxaFkNZustvnX3MYmR0YxBfbGLefNFO2bZS0c94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=qy8bsIav; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qy8bsIav"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b0787fdb137so1026342966b.0
        for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 03:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758709003; x=1759313803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pL2uoqzypHbRpbvTBPNzb3YECUS6GHGmBJvJaUK0ytc=;
        b=qy8bsIavvkHDBg/DGVW+uGlxNgNcr6eXH6psqkTZ97GLdOKS+2p0/M0jwY6krpoHph
         vBduvhxfm6J5IwPhWRz00ca7q3SEnTMxnK1mwyl8nMBSUu2MeJeJ/4zWar80wJ75f4Tn
         VdpggxZTXbcymk5XxU/pFTAkHt+AT81HTkZHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709003; x=1759313803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pL2uoqzypHbRpbvTBPNzb3YECUS6GHGmBJvJaUK0ytc=;
        b=vJjBnk3CemPU7kvOfjGFJWpDJsRsvgq5U/F6kA1JEsD4ZbHgGMDWaVifJnPZgJgvun
         QCkOS0HnGpDbmI9MH49uXfBV2+JN3gFtKnZoFmvNOsS9a5VF3/ZXIbQYzRzW4Ks1wWso
         M4qA8EM/nbrYXs3x+BWyeYamJtdtVzFHaWQwgLMl67243wpBr9fZLURmQ3AuYX2N9Ofq
         h4bpiNuTjHr8bVqaGEFb4UQCuNib+WTIRueIaO8Uq80M7s8f5Q4FxRGw5tdYich3RBgv
         eUAbsxMDeH0nGhsTTMWvNg8smvn911kkW7ddzvRmU0iwgNePyb7y2tua7uNWp+ClGxTu
         nLtA==
X-Forwarded-Encrypted: i=1; AJvYcCWJAjM6iAdv1Nrdn153hl/zFP/VuxU9FlRrG7+jUtzpVXGgFiThMKTk+UVZKzR/Urtq5aXTKsxMnuqi4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPpcD3yn2jwDAI14dLBlhOmAF2HFy1c6aEYPSIafOMNJLgWnro
	EYLHfeMY2vKdSD6SKD0H2z6gPdM7e5eoQJKFvohwXwTvWWcSLfqdv4Y7A+n5fX7nDk0=
X-Gm-Gg: ASbGncvR64lRps4Wkf5o9ruUn6Coefsyq/azzZs2SvqBFyY2qCHhuoClyJP3WkUz+tk
	xU4BB5bQsRZvDxwNmhNGFTwlADMeJWoNL/s96k4HQYoVwnuAZoJICPZBjsZW48wjfSE59g35gJL
	DfaQiUt7zPcn528XyHADKZFVZW4jS2tH0dMMsVpgQz/B/h7asv6+7IWIvpA8NeRwCnCxMWrNg/z
	Dytfew/nWffdf6ilMoiFGI0lV31vVeQFlWPKUI9jQZIxwRAco9+u1el28715Tg0aV97l11QAXRt
	D9dNp3qVkVwVKkr3in7RrJPIyoqDzKbYCtrxQt6OKYtgWjcs1aoDHS7s6aEG76HtS9nce0Fhnhs
	Pz+oyFGMnlaVDdHSO+QpHFuAmSnBcq2RDozgnK9Prvjwu/8x+u7AjzJPN6oRrLdNKsg3AQ1auyN
	/2FvtQq3ARpNeOtjOTiHFTfesnzucBjQyrDd+pk9o5SKi+D4fOFY5Cn7WAEV9FOdbyDjkDNQ==
X-Google-Smtp-Source: AGHT+IHOIaPIXlWeLkZKenFEtjzYGIM9G3O+kz9aBGgbCcayPpzFvqsW2MirypYhSn7F+tMkSctIcg==
X-Received: by 2002:a17:907:1c10:b0:b2d:d73:de59 with SMTP id a640c23a62f3a-b30263b7c73mr570377266b.9.1758709003021;
        Wed, 24 Sep 2025 03:16:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28d206bd13sm949712766b.31.2025.09.24.03.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 03:16:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/3] ASoC: mxs-saif: support usage with simple-audio-card
Date: Wed, 24 Sep 2025 12:16:25 +0200
Message-ID: <20250924101640.2942635-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for enabling MCLK output when using the simple-audio-card
driver. In the sound/soc/mxs/mxs-sgtl5000.c use case, that driver
handles MCLK enable/disable by calling mxs_saif_get_mclk() and
mxs_saif_put_mclk() at probe/remove. This does not happen when the
simple-audio-card driver is used. Extend the mxs-saif driver to enable
MCLK output in that scenario.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 sound/soc/mxs/mxs-saif.c | 123 ++++++++++++++++++++++++++++-----------
 1 file changed, 90 insertions(+), 33 deletions(-)

diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index 3e3a62df3d7e..a01a680ad4d7 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -24,8 +24,79 @@
 #define MXS_SET_ADDR	0x4
 #define MXS_CLR_ADDR	0x8
 
+#define MXS_SAIF_BUSY_TIMEOUT_US 10000
+
 static struct mxs_saif *mxs_saif[2];
 
+/*
+ * Since SAIF may work on EXTMASTER mode, IOW, it's working BITCLK&LRCLK
+ * is provided by other SAIF, we provide a interface here to get its master
+ * from its master_id.
+ * Note that the master could be itself.
+ */
+static inline struct mxs_saif *mxs_saif_get_master(struct mxs_saif *saif)
+{
+	return mxs_saif[saif->master_id];
+}
+
+static int __mxs_saif_put_mclk(struct mxs_saif *saif)
+{
+	u32 stat;
+	int ret;
+
+	ret = readx_poll_timeout(__raw_readl, saif->base + SAIF_STAT, stat,
+				 (stat & BM_SAIF_STAT_BUSY) == 0,
+				 MXS_SAIF_BUSY_TIMEOUT_US,
+				 USEC_PER_SEC);
+	if (ret) {
+		dev_err(saif->dev, "error: busy\n");
+		return -EBUSY;
+	}
+
+	/* disable MCLK output */
+	__raw_writel(BM_SAIF_CTRL_CLKGATE,
+		saif->base + SAIF_CTRL + MXS_SET_ADDR);
+	__raw_writel(BM_SAIF_CTRL_RUN,
+		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
+
+	saif->mclk_in_use = 0;
+
+	return 0;
+}
+
+static int __mxs_saif_get_mclk(struct mxs_saif *saif)
+{
+	u32 stat;
+	struct mxs_saif *master_saif;
+
+	if (!saif)
+		return -EINVAL;
+
+	/* Clear Reset */
+	__raw_writel(BM_SAIF_CTRL_SFTRST,
+		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
+
+	/* FIXME: need clear clk gate for register r/w */
+	__raw_writel(BM_SAIF_CTRL_CLKGATE,
+		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
+
+	master_saif = mxs_saif_get_master(saif);
+	if (saif != master_saif) {
+		dev_err(saif->dev, "can not get mclk from a non-master saif\n");
+		return -EINVAL;
+	}
+
+	stat = __raw_readl(saif->base + SAIF_STAT);
+	if (stat & BM_SAIF_STAT_BUSY) {
+		dev_err(saif->dev, "error: busy\n");
+		return -EBUSY;
+	}
+
+	saif->mclk_in_use = 1;
+
+	return 0;
+}
+
 /*
  * SAIF is a little different with other normal SOC DAIs on clock using.
  *
@@ -48,6 +119,7 @@ static int mxs_saif_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 			int clk_id, unsigned int freq, int dir)
 {
 	struct mxs_saif *saif = snd_soc_dai_get_drvdata(cpu_dai);
+	int ret;
 
 	switch (clk_id) {
 	case MXS_SAIF_MCLK:
@@ -56,18 +128,22 @@ static int mxs_saif_set_dai_sysclk(struct snd_soc_dai *cpu_dai,
 	default:
 		return -EINVAL;
 	}
-	return 0;
-}
 
-/*
- * Since SAIF may work on EXTMASTER mode, IOW, it's working BITCLK&LRCLK
- * is provided by other SAIF, we provide a interface here to get its master
- * from its master_id.
- * Note that the master could be itself.
- */
-static inline struct mxs_saif *mxs_saif_get_master(struct mxs_saif * saif)
-{
-	return mxs_saif[saif->master_id];
+	if (!saif->mclk_in_use && freq) {
+		ret = __mxs_saif_get_mclk(saif);
+		if (ret)
+			return ret;
+
+		/* enable MCLK output */
+		__raw_writel(BM_SAIF_CTRL_RUN,
+		saif->base + SAIF_CTRL + MXS_SET_ADDR);
+	} else if (saif->mclk_in_use && freq == 0) {
+		ret = __mxs_saif_put_mclk(saif);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
 /*
@@ -238,34 +314,15 @@ int mxs_saif_get_mclk(unsigned int saif_id, unsigned int mclk,
 					unsigned int rate)
 {
 	struct mxs_saif *saif = mxs_saif[saif_id];
-	u32 stat;
 	int ret;
-	struct mxs_saif *master_saif;
 
 	if (!saif)
 		return -EINVAL;
 
-	/* Clear Reset */
-	__raw_writel(BM_SAIF_CTRL_SFTRST,
-		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
-
-	/* FIXME: need clear clk gate for register r/w */
-	__raw_writel(BM_SAIF_CTRL_CLKGATE,
-		saif->base + SAIF_CTRL + MXS_CLR_ADDR);
-
-	master_saif = mxs_saif_get_master(saif);
-	if (saif != master_saif) {
-		dev_err(saif->dev, "can not get mclk from a non-master saif\n");
-		return -EINVAL;
-	}
-
-	stat = __raw_readl(saif->base + SAIF_STAT);
-	if (stat & BM_SAIF_STAT_BUSY) {
-		dev_err(saif->dev, "error: busy\n");
-		return -EBUSY;
-	}
+	ret = __mxs_saif_get_mclk(saif);
+	if (ret)
+		return ret;
 
-	saif->mclk_in_use = 1;
 	ret = mxs_saif_set_clk(saif, mclk, rate);
 	if (ret)
 		return ret;
-- 
2.43.0

base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
branch: microgea-rmm-audio
