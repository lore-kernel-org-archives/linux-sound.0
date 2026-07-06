Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C7D381AF
	for <linux-sound@vger.kernel.org>; Mon,  6 Jul 2026 04:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783313882; cv=none; b=advyyt+fkUklHT8A+RKf/87GdlfsB7fivPK24e/xF+L9fTjjAOBxvENkdY+QqUU6Kgl8v+iyhoNLImRrJA6MF+IFwkpAhPo0Y21vfnFplUe8bzhBHeKrYK0FRqfXF37O1fFlKbrsWsLk/rrT1JN3GFRAZ36b3QR0zkmZG0/nRK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783313882; c=relaxed/simple;
	bh=dPxrydN54DmQuCWo+wwO6vQ1ZmOnnyIq8oAVMCQHBtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LIeURB6VY+n0PJuzoxgU4KWASj2/8K2G9GjrgSFAXBioEXf8HZl2XfC7wyCq917356ExtZAAGbK2JGUkpRWWLY2X/e9OjnAmpzM/2riFrikOLB7TCRF9Lku1Ouncoilo6OKmOu0EWmZJxEGSah2JstTalvJaleTDeMjdkfMmJtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hJVQD6tz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hJVQD6tz"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-847a5528b33so1257571b3a.3
        for <linux-sound@vger.kernel.org>; Sun, 05 Jul 2026 21:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783313881; x=1783918681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mBMJxZTbTfITgIir23vIIgP+P8butuXuzKkdVsRlag=;
        b=hJVQD6tzoRBDhEHcdvxz0hjW5KVi7RMVYr15uw1LCA0oMon9JwyxTKO6FOAK82r9rG
         29Ddce1g2/YfmZpVsFu40brd6ZDMwQt4/rTqhfJrgKSzBXakEIUyY+qkk3wAVildTN/v
         5JHzl4H7a8QPcjAMJhihBrpZa/AxYF1w82Tga/ovm9raK6qJE+IbG34p4gLzISTmJOXU
         5yTHg5iAwqwzO8gB18maDodwcXULhXSfhZkyn4GMe2lGii5H6h+90cNLsPldDg7QlnUF
         Er1/ebTJJUYdCkzJ8mvQx1px1oKS1s3oBlgkU9+0UmtKM5GIiWLDunJOyM0rS8w8qpKc
         IwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313881; x=1783918681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2mBMJxZTbTfITgIir23vIIgP+P8butuXuzKkdVsRlag=;
        b=c0yi7IoaQ5BXrt5rekwjC3GFlpTXputxaflfyHXlIhVlQjkCjXVWMD4iQMuwo3qFgG
         AS7aYcD6LhkPuibL6J/yW9fkIe+z817dPnWnxl/SQwmhp49GhVGMBlR/nCOdgkMFzNmv
         M+EPInx7opa/hkM5U1bLFMFVm9BTDzlwYSVeXtb3TA1ng9kg5+AdY8ubXiu7M+offEFH
         fL0mzoXUOJLyTgx6OxHPOBhmM8LvyCm9upmG4CDdNFqWlBxCQT8bjpHlRYwRkQwpTSKC
         Om7tBw86CWVjPNh7d4hzVTIVitMRhS9gKYdDCDhfX0JLcUOqYopb5KgN/FSgpdQDhtpq
         ebSQ==
X-Gm-Message-State: AOJu0YzuOu+yLtiPYCD6kbTzDHo8ApE0e328jcAd/mCBRft7asG/rnLJ
	NeY68OjokgZYLzmxd9F+MF/tbfgeWESpsJv04iY6iPSrJHE/cZV9leLg
X-Gm-Gg: AfdE7cnM1ApKHg/b90Gwfc31cIIUrCGIQ1vWfBuDYsl8E1vAjZDbg1LmVBnrQDt5Vud
	khVTvhDaLztD5Co/vWzSrbNmEf7e7FraPnOOBNj0euvCHPqXrhztdOh4k2VI5o44R1L75eiI34n
	QAn2AzZwV75y10pgHrMiuYWOa0wbOQdVb7zsk4dNSXMNgCFvUlKj7vH3Nz3Jb9JRMGi9M5Rs9zi
	iWx5/3p/mUjgOVphFZN3eokNAh6YSHEAty5jN0g8e9+kpGskkIxGrddeFAxsn0AKG4W/c6JY0Wg
	HZHFZi8YJF2is69HSnoFSbRpq0S7CsRORv8o1yFAu+vTMcpeT/G+xiKoSwlxkNJO624AylLprC7
	1HocVJvm0xDqwWQjCvvaEYNYSoYwk8dlA7zP7CnGl9cwaX27nLcoOZ/stSi40mWKTVk4Vvl+5dk
	mfds5dk3IasCMMp32sdo3ZJ4umykAb7QUi6LO47qUl1zrz8is=
X-Received: by 2002:a05:6a00:428a:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-847f6f474c0mr7369653b3a.45.1783313880851;
        Sun, 05 Jul 2026 21:58:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7c2casm2977208b3a.43.2026.07.05.21.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 21:58:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Max Filippov <jcmvbkbc@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: xtensa: Use dev_err_probe() and drop redundant error handling
Date: Mon,  6 Jul 2026 11:57:47 +0700
Message-ID: <20260706045747.36811-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Convert error paths with messages to dev_err_probe(), which combines
dev_err() and the return statement while also handling -EPROBE_DEFER
for the clock path.
Remove the redundant "err:" label and return errors directly. Paths such
as platform_get_irq() already log failures in the callee, so they simply
return the error code without printing an additional message. Inline the
pm_runtime_disable() cleanup at its only call site.

No functional change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/xtensa/xtfpga-i2s.c | 60 +++++++++++++----------------------
 1 file changed, 22 insertions(+), 38 deletions(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 9ad86c54e3ea..c70f9103604e 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -533,34 +533,25 @@ static int xtfpga_i2s_probe(struct platform_device *pdev)
 	int err, irq;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
-	if (!i2s) {
-		err = -ENOMEM;
-		goto err;
-	}
+	if (!i2s)
+		return -ENOMEM;
+
 	platform_set_drvdata(pdev, i2s);
 	i2s->dev = &pdev->dev;
 	dev_dbg(&pdev->dev, "dev: %p, i2s: %p\n", &pdev->dev, i2s);
 
 	i2s->regs = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(i2s->regs)) {
-		err = PTR_ERR(i2s->regs);
-		goto err;
-	}
+	if (IS_ERR(i2s->regs))
+		return PTR_ERR(i2s->regs);
 
 	i2s->regmap = devm_regmap_init_mmio(&pdev->dev, i2s->regs,
 					    &xtfpga_i2s_regmap_config);
-	if (IS_ERR(i2s->regmap)) {
-		dev_err(&pdev->dev, "regmap init failed\n");
-		err = PTR_ERR(i2s->regmap);
-		goto err;
-	}
+	if (IS_ERR(i2s->regmap))
+		dev_err_probe(&pdev->dev, PTR_ERR(i2s->regmap), "regmap init failed\n");
 
 	i2s->clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(i2s->clk)) {
-		dev_err(&pdev->dev, "couldn't get clock\n");
-		err = PTR_ERR(i2s->clk);
-		goto err;
-	}
+	if (IS_ERR(i2s->clk))
+		dev_err_probe(&pdev->dev, PTR_ERR(i2s->clk), "couldn't get clock\n");
 
 	regmap_write(i2s->regmap, XTFPGA_I2S_CONFIG,
 		     (0x1 << XTFPGA_I2S_CONFIG_CHANNEL_BASE));
@@ -568,41 +559,34 @@ static int xtfpga_i2s_probe(struct platform_device *pdev)
 	regmap_write(i2s->regmap, XTFPGA_I2S_INT_MASK, XTFPGA_I2S_INT_UNDERRUN);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0) {
-		err = irq;
-		goto err;
-	}
+	if (irq < 0)
+		return irq;
+
 	err = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 					xtfpga_i2s_threaded_irq_handler,
 					IRQF_SHARED | IRQF_ONESHOT,
 					pdev->name, i2s);
-	if (err < 0) {
-		dev_err(&pdev->dev, "request_irq failed\n");
-		goto err;
-	}
+	if (err < 0)
+		return err;
 
 	err = devm_snd_soc_register_component(&pdev->dev,
 					      &xtfpga_i2s_component,
 					      xtfpga_i2s_dai,
 					      ARRAY_SIZE(xtfpga_i2s_dai));
-	if (err < 0) {
-		dev_err(&pdev->dev, "couldn't register component\n");
-		goto err;
-	}
+	if (err < 0)
+		return err;
+
 
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		err = xtfpga_i2s_runtime_resume(&pdev->dev);
-		if (err)
-			goto err_pm_disable;
+		if (err) {
+			pm_runtime_disable(&pdev->dev);
+			return err;
+		}
 	}
-	return 0;
 
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-err:
-	dev_err(&pdev->dev, "%s: err = %d\n", __func__, err);
-	return err;
+	return 0;
 }
 
 static void xtfpga_i2s_remove(struct platform_device *pdev)
-- 
2.43.0

