Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DE240315B
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 11:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005180; cv=none; b=W/EfrGL5L1V00Cb8Tnho9+aZAvu512LGL7FeE2rdWLHhM+YdyyEyai8ymqqvgBVSdfI1XXdZv/qNrgCnuKBKx4OxQc4MT/ToLZiyrKdZeh1Hy6P053YCq5mFsqvSBBsUZsoYknOAq0/VFFZ8X49lYk51qvSJbnPfGcENlkvR9w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005180; c=relaxed/simple;
	bh=TVTFqtNv3SDidQR0s+8WQhEyydhiZpPFphguBiX/dDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IV2KeikVB0X3XHGLoq7yA6y5SwQY0t2+tmK+P1cVjwmGIQbSUnNqNVEoS54/FV730fftVg5dDaOxCJROLWmx/DIq/hmM8oFgCGofEJr4rENTh4X56xWoMRetnW36nudJ2Z7e5Mbq5JzS9tweDASr0IoYZDnGoooWH0xSmgeJ/q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYUqp0Az; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYUqp0Az"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c0c35980fdso54645385ad.2
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 04:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781005176; x=1781609976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXEOWHZ4dzNUaN8JMIKeeopADr/ohbLDpOo26m2Ui5M=;
        b=fYUqp0AzlkNTpn8WDSlre0+FEZHjb3lZ2rrvIASQ9BwdCx+nF6wHJNYQ33P1hjLWjv
         IxZ6Fg5iJ50JdX287VXvcNX0TKAMx2vUPs7J2orXcnx60eSL+X2ZdMi04pxxfYyYutsV
         5i/2nsNMSjr8AtbhErTSIAvPcyS3mIgNylNa0JswvsBd2KF7ZCWu0dVXG8y0vu3qPjV+
         eOQpTy6jl4MQw+iUTFEcrS5n4PpYh7gc/HmUGzCZd8uQTRSjX6anqSPXB7RpKugGU95N
         aAc3LIwWGmexLEAvTBAm23hmPSWwVuyX7kWmpjVFUM0/smKtg1f9iSLPOHZVvdt/kaoc
         kbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781005176; x=1781609976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sXEOWHZ4dzNUaN8JMIKeeopADr/ohbLDpOo26m2Ui5M=;
        b=r8YL/WdX2a8jGRSB5kfanSG8EpSHB32JPT051vhgmjO8ej1A+h5A63jSinK2+s6/1g
         VlmsW4EcNhJjJy/E+cMWRwccbJcAoFTto+WJaJlYWDb9fmPmwmU7wTGbD+3aVp+3tz5L
         fECAE2SKpP6qO1uFqFNpjc+1dVDrw/5OZshyMRSp5WMWLKrDIFs8FLcF3/10/ZDdABPR
         yFqRW5/ub9VdzNC8O9ttqVYrx55iVaoWqmqOLkWffEeSwd5VyP6niD1gogiP61KZOJ9q
         rNWl9S3fcOFm/hEJdMSkqiXk748oyrUG7S5cHa7E8/g3v2fz7wwGjKiHUwk5BX9oLdeC
         0Aug==
X-Forwarded-Encrypted: i=1; AFNElJ+i1yG4tQRQ1hpQFR7E2TMl2ZpBHyqB1nzR83f4exukSP+igs0pqsLDNmz8684ygJEDgR63K1uuqR/5Gw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1H37IYgy23kqF3oI8BeI6zBobUQQixzKNumF9plTWZujBVK43
	JuH2Q2MdlopyJv4agUiNou18rpckEZoYLqHYF1U2HiKVo3vGALCnc24I
X-Gm-Gg: Acq92OHxeJpHPNvX6wIUtY6iqVWqE8r20NtzmyRyRlPLIdYQhmjKcSgUFXQGn+SjrZp
	b0ai8jFqmrj5+jCeHOaT3gD2U2UYx0K+y0FDLRElVzpJgWRZGMLRyoHEbw4lRoUZRN1UWdXl1Nd
	rKrL3gqX6VfPHcYa3cHHC2AiSYGUb5EJsMP0nUvk4CXl1oldqmAOvuIGZ5knpIYI3pA0xy5zwfl
	jG8d3IY0RSKpAwWQVMib314Vm8QtvAkLWaasmYRYq23ETeIf0irlJgAJhIgY2OK3jJAlm87XQOZ
	3kYGRQo8cuWnsYu3iqIon9a9hvPeeGNq0dDIW6VGeRzk8Plka4cP6askVk2ccnZdEoeOAlEu9p/
	qPVJZRJGe1VE8HbFW1OLxWZcGGKwxFXyRyJbZV4Jf7lqiJF3PGhfvR747AvslpwxXyH0GwctPIw
	bCbes/ThNMPk+72Nyc9lqtQFcjtWJ6R5A4h7NM+HQCOroM+Zj8Z1OG5yHrbk64nKF+QOPP
X-Received: by 2002:a17:902:f60d:b0:2ba:4e84:966 with SMTP id d9443c01a7336-2c1e85e0896mr217831875ad.36.1781005176375;
        Tue, 09 Jun 2026 04:39:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f70660sm210755635ad.11.2026.06.09.04.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:39:36 -0700 (PDT)
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
Subject: [PATCH v6 08/11] ASoC: renesas: fsi: refactor clock initialization
Date: Tue,  9 Jun 2026 18:38:33 +0700
Message-ID: <20260609113836.45079-9-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609113836.45079-1-phucduc.bui@gmail.com>
References: <20260609113836.45079-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Move fsi_clk_init() from set_fmt() to the probe path.
This ensures that clock resources are acquired only once during device
initialization, instead of being looked up repeatedly whenever set_fmt()
is called.
Together with the previous conversion to devm_clk_get_optional(), the
driver can now probe successfully even when optional clocks are absent.
The set_rate() callbacks continue to validate that all required clocks
are available before applying hardware-specific configuration.

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6:
 - Add Acked-by tag from Kuninori Morimoto.
 - Improve probe and clock error handling.
Changes in v5:
 - Reorder the patches 
 - update the error handling path to ensure proper cleanup by Sashiko 
Changes in v4:
 - Handle the return value of fsi_clk_init() to properly support deferred 
   probe, as suggested by Mark.

 sound/soc/renesas/fsi.c | 67 +++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index e29be2bcf952..43bc77ebcca3 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -862,6 +862,11 @@ static int fsi_clk_set_rate_external(struct device *dev,
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
@@ -898,6 +903,11 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
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
@@ -970,35 +980,35 @@ static int fsi_clk_set_rate_cpg(struct device *dev,
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
-		return -EINVAL;
+		return dev_err_probe(dev, PTR_ERR(clock->own), "Can't get fck clock\n");
 
 	/* external clock */
 	if (xck) {
 		clock->xck = devm_clk_get_optional(dev, is_porta ? "xcka" : "xckb");
-		if (IS_ERR(clock->xck)) {
-			dev_err(dev, "can't get xck clock\n");
-			return -EINVAL;
-		}
+		if (IS_ERR(clock->xck))
+			return dev_err_probe(dev, PTR_ERR(clock->xck), "Can't get xck clock\n");
 		if (clock->xck == clock->own) {
 			dev_err(dev, "cpu doesn't support xck clock\n");
 			return -EINVAL;
@@ -1008,10 +1018,8 @@ static int fsi_clk_init(struct device *dev,
 	/* FSIACLK/FSIBCLK */
 	if (ick) {
 		clock->ick = devm_clk_get_optional(dev,  is_porta ? "icka" : "ickb");
-		if (IS_ERR(clock->ick)) {
-			dev_err(dev, "can't get ick clock\n");
-			return -EINVAL;
-		}
+		if (IS_ERR(clock->ick))
+			return dev_err_probe(dev, PTR_ERR(clock->ick), "Can't get ick clock\n");
 		if (clock->ick == clock->own) {
 			dev_err(dev, "cpu doesn't support ick clock\n");
 			return -EINVAL;
@@ -1021,10 +1029,8 @@ static int fsi_clk_init(struct device *dev,
 	/* FSI-DIV */
 	if (div) {
 		clock->div = devm_clk_get_optional(dev,  is_porta ? "diva" : "divb");
-		if (IS_ERR(clock->div)) {
-			dev_err(dev, "can't get div clock\n");
-			return -EINVAL;
-		}
+		if (IS_ERR(clock->div))
+			return dev_err_probe(dev, PTR_ERR(clock->div), "Can't get div clock\n");
 		if (clock->div == clock->own) {
 			dev_err(dev, "cpu doesn't support div clock\n");
 			return -EINVAL;
@@ -1672,15 +1678,6 @@ static int fsi_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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
@@ -1978,6 +1975,11 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->master	= master;
 	fsi_port_info_init(fsi, &info.port_a);
 	fsi_handler_init(fsi, &info.port_a);
+	ret = fsi_clk_init(&pdev->dev, fsi);
+	if (ret) {
+		dev_err(&pdev->dev, "FSIA clk init failed\n");
+		return ret;
+	}
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIA stream probe failed\n");
@@ -1991,6 +1993,11 @@ static int fsi_probe(struct platform_device *pdev)
 	fsi->master	= master;
 	fsi_port_info_init(fsi, &info.port_b);
 	fsi_handler_init(fsi, &info.port_b);
+	ret = fsi_clk_init(&pdev->dev, fsi);
+	if (ret) {
+		dev_err(&pdev->dev, "FSIB clk init failed\n");
+		goto exit_fsia;
+	}
 	ret = fsi_stream_probe(fsi, &pdev->dev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "FSIB stream probe failed\n");
-- 
2.43.0

