Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964640;
	b=B56bpTs9hGHIY76m0WpEkd5yPLmenNioqeGN5lF8Mr/IZMVKgE/T3RlNa0IFVYFMrLiU
	 PalEDs8ea2YTDNakrr9pbOT4K3O1tmXOWp3eBpGd1/7BG2yE5/nmhT08jfKz6GIISoRKp
	 8z1x4K7Rc/dFmTgkUF+cLEanQXOarQ3tP+tfUKUy+8XS26PVziIUWA56s+laeq5lRUEk/
	 FlSW7JQY1nrQNV4II4+53PJk/YZXmnptze9Twk7qwXaQnzFJbAG66iXAcNRetsGUdBmAC
	 A+rLBryhafxs7TqRjSg3sotM+Q8rayJl/hBHRSIwq2Eh7BjGL7FRiSzG4yQaSC80ktg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q7k3m5nz3BI1gRStNL0YWWjh2c3KEFQhqx9QCZVo4Kg=;
	b=V4LcSZgtur9/2ODI19duLXWfP4oS/NnE6DszhYy8rP/skebwIVqLH1qD2BtJ/KpGV1FW
	 7SswQtahYarJw6MXd2PMBrYN/5tiUUcIh0Hq+JEAhI+MFPZh8wPpvKW2e5nzjZyl95nfy
	 +VufZ9P9NqWtWuEi9tbd0g0tGgdOLJQV5q5jd2lMUNBMfaxDozT6vb++Tm7yJdvbkXjeb
	 kJFX62Tobb/CMWnEYu44bgKgzHqG24OM36rCG+8HMggVUx9cX02ViX6f9XJQ9y3t/PEjh
	 TJxmVQRGgvyjFVBc9Ijh+B++SEKyE0mfRBqJLjQ2PmCMwC8IPr8kdhkh9lq1Fh4HKcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SaAPA1UZ;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1522C6083616
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 11:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1522C6083616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SaAPA1UZ
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so229321b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 03:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964639; x=1794569439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7k3m5nz3BI1gRStNL0YWWjh2c3KEFQhqx9QCZVo4Kg=;
        b=SaAPA1UZ4yXIBFAk+CH3c9RwW3VMuZIHuUtioT1LOruEtWzloAKykACc+wHkyf5eet
         ktBtnVVLnfPHg1yrMwZkBzKyUO+WLie9JRmPXYtA6wCmPvj1LcFxUIWVogdzPi3NFk+6
         JPASrPbEmq+W3r3Hs3IhA6oIeRPEcCdFhaBY0RyZPwHFMHFJwc7YW3bnf1Ay9MmDRo2p
         p60vdZ5z9v7fp1p765Eu8ZMocXtFzDt4yA7/8fTwZQNVXu8Be3eUaTWQNosoNAWgCSZf
         LF2JNGIgdcIhbQ+w0MmnxGzgLuOdqkp6E9LI5MXz9gEMbOzgNw6H0TLJOYd8rYIQN8R5
         ubUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964639; x=1794569439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7k3m5nz3BI1gRStNL0YWWjh2c3KEFQhqx9QCZVo4Kg=;
        b=NWx/0isLt2OwhR/mwf8yncb7HhYM+yarToGU6cLhYRcC5Zhfa4gmZ98Mrqs7OgkVBR
         XReBP977l+vvmKBNrJ2MutWEBBPozuKPhuRrmsI8fuOtg3/2hZtJVmFsJOnlKck59hnY
         7g/+jOMf2bXkIUP34UvZEng9HkTey0Z0v5HQTWbxJC+4+2jwmp5xWz4Fp/eCFSwaQUr8
         0u6tAyGipNhoX1bUnhc8G3ADk4Wj/FGYqfg6R7UVO763udLesAss1yIH/64/yOwnsd7v
         eEeqCoCjh0Gl0YkYAvhGfJgsfNNiKXHoqozEl0ojaeQboeLaEepI3V1RWobfL2lJdoWq
         XXVg==
X-Forwarded-Encrypted: i=1; AKwUvBy5HOMeOMzFe09v5C5CF944veeb1EExv5cMRSLMT9PPGMcG6An4mdmy68KXOb/IS9EdWD+sr6BEX1+bSw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9b0qiFAv2p+OlG/oSsJzUZHy7oY0VnnwHwiNHiRxOsiW6m2owd
	S5+GYPrdvN2OHALwfGvmUx8CM8w517tnrFE+3aKDN6QTkE6tZLNWeRuP
X-Gm-Gg: AYBFou2fg4DNolGTEIWUQG9fOqbMKo8Kk12XZgy9t/PVy7adEZnacirst01D1pm8n6h
	wFeODoBUxSFNlCpg2U2wTWQIbsqBfXFBNNlDPlq+xOuL+rrPo0a1ZlbxsdN82ImTHST6Qki4ivg
	NHfyGF/UYe2FWZUl6hNvwmfbGQrU2ms+klsj9wMj6mohw8f68fZ7I6tgDe9p7KHLGSLN6rNdDB9
	oZWBweewtpAF/Ep9UfYgJ3pjzKGdO3i/mJAXHdatjgL769Fj7kO/Wz44cjCQg/DG2GTg2b1OQfS
	xUIFRA0+SRmPp1b0u2t2xdntbIS7tMpbokZebo2QA6BzK6mTtyKoFZ5rduZabU27W/fvuvQdM+H
	NP6cnqqz0GQiAUIHk0Gb5l+lxjNvJRcutHwpLJBuv6t9Qh+f7ZnEclF0zInFbUOQtc34f402eps
	KQWdE/Pb0xbZaH1jBBZIdCBP9chQEO4Nko3KT781rAQUsQkzaCFph7w+lnzpvt+dXb+CyT4Lrsj
	OnWkInVot8I5J9VlFuv2NqxWOWTNpIGclwtea21/uq3Gf8mPW40e0qfRgrLTsMWpBR8GoJrCtZX
	rVDFZdOUyvI6VXXNr6K8uIGG1UV5tlX45DGVQIhuslFBzCI1gyISxKNCUJVJWi37iKRTy1lss9M
	MsGC8JBBCGuQoWZUTszZWyuLLurPE366lKxT49CKYljzu
X-Received: by 2002:a05:6a21:7742:b0:3e8:b7fd:6280 with SMTP id adf61e73a8af0-3ebb29e6af0mr2381417637.27.1793964639433;
        Fri, 06 Nov 2026 03:30:39 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa6ab9sm479228a12.27.2026.11.06.03.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:39 -0800 (PST)
From: phucduc.bui@gmail.com
To: Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 5/5] ASoC: dwc: Remove redundant error messages
Date: Fri,  6 Nov 2026 18:29:40 +0700
Message-ID: <20261106112940.53550-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106112940.53550-1-phucduc.bui@gmail.com>
References: <20261106112940.53550-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

The underlying functions already report these errors deeper in
the call chain, making the additional dev_err_probe() and
dev_err() calls unnecessary.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 1ff5b6f8864d..87b47661e469 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -752,7 +752,7 @@ static int jh7110_i2s_crg_master_init(struct dw_i2s_dev *dev)
 
 	ret = clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
 	if (ret)
-		return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
+		return ret;
 
 	mclk = clks[0].clk;
 	mclk_ext = clks[1].clk;
@@ -830,7 +830,7 @@ static int jh7110_i2s_crg_slave_init(struct dw_i2s_dev *dev)
 
 	ret = clk_bulk_get(dev->dev, ARRAY_SIZE(clks), clks);
 	if (ret)
-		return dev_err_probe(dev->dev, ret, "failed to get i2s clocks\n");
+		return ret;
 
 	mclk = clks[0].clk;
 	mclk_ext = clks[1].clk;
@@ -966,10 +966,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	if (irq > 0) {
 		ret = devm_request_irq(&pdev->dev, irq, i2s_irq_handler, 0,
 				pdev->name, dev);
-		if (ret < 0) {
-			dev_err(&pdev->dev, "failed to request irq\n");
+		if (ret < 0)
 			goto err_assert_reset;
-		}
 	}
 
 	dev->i2s_reg_comp1 = I2S_COMP_PARAM_1;
@@ -1010,10 +1008,8 @@ static int dw_i2s_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, dev);
 	ret = devm_snd_soc_register_component(&pdev->dev, &dw_i2s_component,
 					 dw_i2s_dai, 1);
-	if (ret != 0) {
-		dev_err(&pdev->dev, "not able to register dai\n");
+	if (ret)
 		goto err_assert_reset;
-	}
 
 	if (!pdata || dev->is_jh7110) {
 		if (irq >= 0) {
-- 
2.43.0

