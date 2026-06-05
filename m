Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DAF3126C0
	for <linux-sound@vger.kernel.org>; Fri,  5 Jun 2026 12:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662055; cv=none; b=nl0vFCwIYgUz6nnxmc29NChgpeVhYU3xxQN9nbccrsAo7M/mb/oN1k6khFMzgGFcBfxymA3sRC+ebwW+IuBCtizIKrQyqD4XUUeLbjT2gcbXWeVMY9UL0vOMAYehOgp0CCuQWz0L0d3eLdt2yBFuOdNagCX44byGVs8A7c6LStE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662055; c=relaxed/simple;
	bh=V0c6wRnBNKj3rAPlxZeuEkWEQAuLwmliuJ98bv0rgQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttDpYk0sAy9vufXuRMlyUm3tZfDYSaICM36sX9Q8utM2ImuaDAfJqNFK5Oua72j9WVuEVHBVDWPTjww0KlZvNlei+CgqyNlotbXoum6CThdmt2TDFJC1d8MfLYckpTpqPzIrLyjcwC5fp0yMzZSVvGlt9/T/+LuOnIITWM2R6Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZH4Nog0u; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZH4Nog0u"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-842848fd613so1415602b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 05 Jun 2026 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780662053; x=1781266853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGGO/1RfN+V25aU18hx7LO9b1XN52DQ2OCTBVEQdgtA=;
        b=ZH4Nog0ubZqBf+/BxHgX5ohfllwVU6NIlhMDl5+LoBaXIf2PZmvFGa5eIxWGf9NjTG
         C8Tr1ZORbj6RYZG3AIpiCdo81t1i7ITl/9xlcWKGqKlTOSHIymsGkrQKybu3t2Ldbl8n
         Qu3P+nLakhrSDEWuvWF0ZRwxyw4GZVDPxLbxquGzWRvRes5AUa4AAaxHfXEr0ripNWRq
         i8Ij2xzTpVFpE/MXOAiw/VpLhXmIKGkOI3HUF7Ron4TFyduR9NeFNrrx8FmtvDcMk/NL
         Wkdpwg7uTxY7Wi1qXpVcVUaDAkKIBPSJpNNoRFgDgnf7ZyMS++l0yKa7DZiq0G7mTeX1
         SglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662053; x=1781266853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGGO/1RfN+V25aU18hx7LO9b1XN52DQ2OCTBVEQdgtA=;
        b=RjXVAIQwaY7wr7BDpm4TbpaGvqhTPad8hHKCIYs9kUpiV70hp2mkeWKgUuC1Jwtqz/
         gjT7cokHYKID3A0G7G5FiaRJmGY2bJPPzZgnn1hroZOc2B5ahw1D25duG09EdH3RXluO
         taAnhMR42H0Y75GgmanbmcufjzV2k39d/Ox2vXI07FCbvh8dR8ILB2LMHobveRExwFhP
         FlwsAUJro/F8j50znZH9LXzkfLjHHOKLV1WTEa8yQxgHWRaaKcUPrEwSkV5y1D2cKLyV
         /v2dQEeSMqWUAOpLhdgQGP59h1duGNsHJCNXLAXWYT5/v1dVPJ3z/MbdgqjJldsva/OM
         zKtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8atyVSZB7K/yq/87vjoN09yob40sRO6z+7AQGT/0M/mcZsm48ewKnwnZzzvIDTs605NGpZ3w73UAb+hg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwhQ5gmnBFzXxQ/ky1fGavHewQwABQbXu6ySKCXpEF6VoNXzj5
	QKiwzlc4MtKUT2xnxyLD9aXftHfbBmKDRrDPcMcSfgksqiMyYA1YkWRn
X-Gm-Gg: Acq92OHzBDvOJ1Vp+TSovq2M2HYaaDb1kQe9plCGioCmQGxfD+KL2WlvODLuHAcb72X
	0Xywo9FJhPmElBH2Estukhd/jJFhfybY8uAZP78aivmXawbwfxCxR0W+yPpTM7HyX1LwxNiEycd
	I4caBmq4CcPjJLehzpdEcDQ01im6lEuBS+uaFuvelgonDDoEcVyXWWBjTXS2zKrOj6FyTXeFOBa
	ZllKFIi/keuguh0dL6ZQTq16qKwGMSwFmenQvlHJarL8coVl76q0QbHUQDRkOjxiozkDZp2tkmJ
	wcEwEIlyhDKvvJnl98Hjezai4SdFL8nbQTcTh1p2XqKJLYbps6YTBODMpqpe8lsk704YjGYgaxq
	hdXQXofk2byo5yxzLmAdMJgR5IAWBjC6KlTzmisNTdvzl/11bChMiBOQFFSA95cU/oSW/FgERGb
	ca8Z7idphIQVsy7tdVCFJSycRXVZ1lggRNLCwykblYGUQh7J0u+YPWIbeEY7T5qU4Smls1
X-Received: by 2002:a05:6a00:1819:b0:842:3841:fdba with SMTP id d2e1a72fcca58-842b0eadd19mr3304985b3a.6.1780662053109;
        Fri, 05 Jun 2026 05:20:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221059sm8594381b3a.7.2026.06.05.05.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 08/10] ASoC: renesas: fsi: refactor clock initialization
Date: Fri,  5 Jun 2026 19:19:52 +0700
Message-ID: <20260605121955.105661-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121955.105661-1-phucduc.bui@gmail.com>
References: <20260605121955.105661-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_clk_init() from set_fmt() to probe.
This moves clock resource lookup from fsi_dai_set_fmt() to the probe
path. The set_rate() callbacks validate that the required clock
resources are available before they are used for hardware
configuration.

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4:
 - Handle the return value of fsi_clk_init() to properly support deferred 
   probe, as suggested by Mark.

 sound/soc/renesas/fsi.c | 52 +++++++++++++++++++++++++++--------------
 1 file changed, 35 insertions(+), 17 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index a2d7d17dd2bb..3f303e15e835 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -292,6 +292,7 @@ struct fsi_master {
 	void __iomem *base;
 	struct fsi_priv fsia;
 	struct fsi_priv fsib;
+	struct clk *clk_spu;
 	const struct fsi_core *core;
 	spinlock_t lock;
 };
@@ -862,6 +863,11 @@ static int fsi_clk_set_rate_external(struct device *dev,
 	int ackmd, bpfmd;
 	int ret = 0;
 
+	if (!xck || !ick) {
+		dev_err(dev, "xck clock or ick clock is missing\n");
+		return -EINVAL;
+	}
+
 	/* check clock rate */
 	xrate = clk_get_rate(xck);
 	if (xrate % rate) {
@@ -898,6 +904,11 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	int ackmd, bpfmd;
 	int ret = -EINVAL;
 
+	if (!ick || !div) {
+		dev_err(dev, "ick clock or div clock is missing\n");
+		return -EINVAL;
+	}
+
 	if (!(12288000 % rate))
 		target = 12288000;
 	if (!(11289600 % rate))
@@ -970,28 +981,38 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
 	return ret;
 }
 
-static int fsi_clk_init(struct device *dev,
-			struct fsi_priv *fsi,
-			int xck,
-			int ick,
-			int div,
-			int (*set_rate)(struct device *dev,
-					struct fsi_priv *fsi))
+static int fsi_clk_init(struct device *dev, struct fsi_priv *fsi)
 {
 	struct fsi_clk *clock = &fsi->clock;
+	struct fsi_master *master = fsi->master;
 	int is_porta = fsi_is_port_a(fsi);
+	int xck, ick, div;
+
+	if (fsi->clk_cpg) {
+		xck = 0; ick = 1; div = 1;
+		clock->set_rate = fsi_clk_set_rate_cpg;
+	} else {
+		xck = 1; ick = 1; div = 0;
+		clock->set_rate = fsi_clk_set_rate_external;
+	}
 
 	clock->xck	= NULL;
 	clock->ick	= NULL;
 	clock->div	= NULL;
 	clock->rate	= 0;
 	clock->count	= 0;
-	clock->set_rate	= set_rate;
 
 	clock->own = devm_clk_get(dev, NULL);
 	if (IS_ERR(clock->own))
 		return dev_err_probe(dev, PTR_ERR(clock->own), "Can't get fck clock\n");
 
+	if (!master->clk_spu) {
+		master->clk_spu = devm_clk_get_optional(dev, "spu");
+		if (IS_ERR(master->clk_spu))
+			return dev_err_probe(dev, PTR_ERR(master->clk_spu),
+					"Can't get spu clock\n");
+	}
+
 	/* external clock */
 	if (xck) {
 		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
@@ -1666,15 +1687,6 @@ static int fsi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		break;
 	}
 
-	if (fsi_is_clk_master(fsi)) {
-		if (fsi->clk_cpg)
-			fsi_clk_init(dai->dev, fsi, 0, 1, 1,
-				     fsi_clk_set_rate_cpg);
-		else
-			fsi_clk_init(dai->dev, fsi, 1, 1, 0,
-				     fsi_clk_set_rate_external);
-	}
-
 	/* set format */
 	if (fsi_is_spdif(fsi))
 		ret = fsi_set_fmt_spdif(fsi);
@@ -1972,6 +1984,9 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->master	= master;
 	fsi_port_info_init(fsi, &info.port_a);
 	fsi_handler_init(fsi, &info.port_a);
+	ret = fsi_clk_init(&pdev->dev, fsi);
+	if (ret)
+		return ret;
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIA stream probe failed\n");
@@ -1985,6 +2000,9 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->master	= master;
 	fsi_port_info_init(fsi, &info.port_b);
 	fsi_handler_init(fsi, &info.port_b);
+	ret = fsi_clk_init(&pdev->dev, fsi);
+	if (ret)
+		return ret;
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIB stream probe failed\n");
-- 
2.43.0

