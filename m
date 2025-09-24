Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E45302748
	for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 13:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758719276; cv=none; b=CGoLYL9dsw8o0DHclxtJt1/mwiXbJjjFnAA0A4tzGTgT4XoQVamEjhm2MkpZZdO6D19kHOn1KTok3rbhVPqwDEtBckK+uFHCSMnWxrCSjLnhdXmvN4Y3kLupPIoUZLctrKm5UOU04PbL7/holFfGNiKJt51Q2XWxnKAvoxGKp+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758719276; c=relaxed/simple;
	bh=/qGCNh8abWDm3X5xS+Iz+DznKUJ2gBpds0vUYbMtcNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eOQmnZ0E5FjZ7wof/g4xXgqrVpzVWR2NA+mb9YUaWYe/Mvh2cGo2cdDQw3RFI6pthbYqS5wbzFCMxcYUTnvSqjgvGVqAgeqfcfZOR3kq3EwtgB3OYaks0j9+7uVZhIeMlU8BICxA7HxLedGtbUHBJFTtQmp5tkIoMKWXAs9jXUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=oguRnnOk; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="oguRnnOk"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b2fcfef5600so322796666b.3
        for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 06:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758719272; x=1759324072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pL2uoqzypHbRpbvTBPNzb3YECUS6GHGmBJvJaUK0ytc=;
        b=oguRnnOktPA0WABF8aBPlE7cgLZlSmbcnk9eF5JEw6pmOtIaJuqj0s6or6FcAav7RO
         0kEv6k1ISG7aj+ikrw5QD1wWdP26IwL8KCFaK4piXcnujxcxqYjs3k47eGf7ndIB49Ri
         QLTHEIqXhu6aaDV7KzK5n3AwFUJ7xTHk+hGYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758719272; x=1759324072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pL2uoqzypHbRpbvTBPNzb3YECUS6GHGmBJvJaUK0ytc=;
        b=ecUwqPb4kcXUH/Ma8R0xQsJzBfgmKta/vKpDheYDdJxwxumQxOprk1j6o+ypCMszOl
         il0bH+b4mMLQy4ES55JdKONdk0TXWC1Efn9LKkHfc+ZeKmLPc0mvqu4r5e1N4KdASE2B
         GRW3VTG5vax7H0TihFd7Ysn52y1xKSXI03Cet7+6HbfMTNQQzQBFw+Z8XgBtN0tkf4Uq
         mbnmYmwlSyHgYuIXQFNVRIjVD7+3uIaLV30MF30nBSt3CiJHX6cRjU/ziivG8As8U//o
         zJEflDiYCiI8C+CnU3FcW2wmozr4B8w7VO8CdYu5YJQfi3AeRgA/n9UMTnFvheEGlc18
         1H/w==
X-Forwarded-Encrypted: i=1; AJvYcCXCa6oSC5ysCaIAuSRh2tn/UsdQFGKElmG3GM8AYdEnu5DGAjjwTk/bTJ64HNuCqStOj3dxGyNzV2iYQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVrTnICZsqppHqZMWg0vDlg2U/55S294l9cI05Zlm0uyBmVDR7
	DLV243+bteeglZDhLri9fTCn62redsMk0SJ+qjLTNqOmahWcH63ry7wfth4YMyn5370=
X-Gm-Gg: ASbGncsqOdJ7lYocbnafIHxUV9Ft1MP5itQn1tFtXHk20Y5BKkJbmdd3QTI3EVSSlQS
	zI6nhzTIXqzyPhDFW8vcaa5jzoue0mkaC5yz/Gey8aREm0y9U3ECwDuQrXMdZ1UCcD4+8L+kIte
	dP9eN/rTbiwRsfW9uwhcNd1s+Kqou+ms4FvV+twrK6ETGC2E05W/y/yJ5O7j+AMCr8iBc9qN0U2
	6rG0TqsNSVHb0/+iPPhX5sdTnGQoMc9+wxAy4xYfC+SyZaQRZMK26odDGr94EwwQk9HgzCLBe7r
	6zjD73t+emP0Fn5eI/ap257ieXPkGdoHWvaMG4DPxKG//vXatHfEw96KcGWp1Vl5Oe/p2dpmcah
	cB4cm3Zbxd4tuK3KRlQ2g6lIRgCJu8mMplAK+ofqItRHoXSfEAxlkwBQnDpVGv+W4v6dg9dQlr7
	ql17vm07Qvj5c6eufREMMcXpbSVh8XOWOs9CcAJMuRV0hCazvUQMYxVY70kJ4=
X-Google-Smtp-Source: AGHT+IFYMpB/hfnnMwqXioIIY9YN2MfPYZ5TpMlDu73cNBgIUPkKRv7kC+0WMvzmPN4O0yWcKdtA3Q==
X-Received: by 2002:a17:907:3f20:b0:b2e:34f1:9dbf with SMTP id a640c23a62f3a-b30261c1e6amr601703866b.1.1758719272475;
        Wed, 24 Sep 2025 06:07:52 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fc5f382b0sm1574379866b.2.2025.09.24.06.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 06:07:51 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Takashi Iwai <tiwai@suse.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [RESEND PATCH 1/3] ASoC: mxs-saif: support usage with simple-audio-card
Date: Wed, 24 Sep 2025 15:07:44 +0200
Message-ID: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
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
